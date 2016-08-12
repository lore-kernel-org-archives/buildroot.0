From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2016 21:54:24 -0700
Subject: [Buildroot] [PATCH 2/2] fwup: link in pthreads for static builds
In-Reply-To: <20160812000628.3fc05f4e@free-electrons.com>
References: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
 <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
 <20160812000628.3fc05f4e@free-electrons.com>
Message-ID: <9D32ABC7-1620-4C8E-983B-1D82180CB888@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 11, 2016, at 3:06 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Wed, 10 Aug 2016 18:35:46 -0400, Frank Hunleth wrote:
>> Both libconfuse (via libintl) and libarchive have references to pthreads
>> but do not specify pthreads in their pkg-config descriptions. This
>> change adds pthreads to the fwup linker options so that the link step
>> succeeds.
> 
> I've finally taken some time to look into this, and I believe your fix
> is not the right fix, and the bug is in fact in uClibc (and I have
> already posted a mail on the uClibc mailing list about this).
> 
> The fact that libintl and libarchive do *not* link with libpthread is
> intentional and actually a feature. As explained in my mail to the
> uClibc mailing list [1], the idea is that those libraries don't need
> threads, they only need to be thread-safe if threads are used by the
> application using them.
> 
> So the libc part of the C library contains a stub implementation of
> those functions, while the libpthread part of the C library contains
> the real implementation.
> 
> So, libintl and libarchive are only linked against libc.so. If you make
> a regular, non-threaded application, linked against libintl and/or
> libarchive, then those libraries will use the stub version of the
> pthread functions. This is correct and actually good: your application
> is not multi-threaded, so why suffer the cost of acquiring/releasing a
> mutex?
> 
> If on the other hand, your application is multi-threaded, it will link
> against libpthread. In this case, the pthread_mutex_*() calls from
> libarchive or libintl will use the real implementation from libpthread,
> and those libraries will have a thread-safe behavior.
> 
> The problem is that this doesn't work with static linking with uClibc.
> I believe it's a uClibc bug, but I'm not entirely sure either.

As per elf specs.

"A weak definition does not change the rules by which object files are
selected from libraries. However, if a link set contains both a weak
definition and a non-weak definition, the non-weak definition will always
be used.?

The "link set" is the set of objects that have been loaded by the linker.
It does not include objects from libraries that are not required.

So if libc.a appears first and provides the symbol it will be used
even if its weak. If you exchange the order where libpthread appears
first it will use the libpthread provided symbols. another option
could be to use

-Wl,--whole-archive -lpthread -Wl,--no-whole-archive

This would link the right strong symbols into binary irrespective of
link order

but this will also include unused symbols into binary, probably not
optimal, and may using -Wl,--gc-sections could help in letting linker
remove the unused functions, maybe worth trying.


> 
> So, if fwup links fine dynamically (i.e without linking against
> pthread), there should be no reason to link it with pthread for static
> linking.
> 
> [1] http://mailman.uclibc-ng.org/pipermail/devel/2016-August/001132.html
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160811/38344f9d/attachment.asc>
