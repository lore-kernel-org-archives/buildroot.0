From: =?utf-8?Q?Thierry_Bultel?= <thierry.bultel@basystemes.fr>
Date: Wed, 19 Sep 2012 23:27:39 +0200
Subject: [Buildroot] thread debugging with target gdb
In-Reply-To: <505A3347.9010503@mind.be>
References: <505A3347.9010503@mind.be>
Message-ID: <zarafa.505a38cb.6d34.7898f54820e76f8d@jacal.basystemes.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually I am not currently -debugging- a multithreaded process, but building and configuring a platform
for other developers that will require full gdb.
?
On the web, I have found some contradictory information about the libpthread and libthread_db stripping. 
And moreover:

On my host (Ubuntu) libthread_db is stripped and libpthread is not
In my Buildroot,  libthread_db is not stripped, and libpthread is !!

By reading at the sources of GDB, it does not seem that it uses debug information of 
libthread_db, but only performs dlopen on it, dlsym, and calls "td_ta_new"  
?
I have also seeked into the nptl-db sources, leading to the conclusion that the symbol
containing the NPTL version was not found in libpthread, and it does not get any further.

I really wonder if the crosstools logic for stripping these libraries is in the right way.
I will try to do the opposite, as soon as I get more familiar with the crosstools build.

Of course, if you have any ideas, that would save me a lot of time



Trying gdbserver is my next step, but I feel pessimistic / my conclusions above.

Cheers
Thierry


-----Original message-----
From: Arnout Vandecappelle?<arnout@mind.be>
Sent: Wed 19-Sep-2012 23:04
To: Thierry Bultel <thierry.bultel@basystemes.fr>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] thread debugging with target gdb


On 09/19/12 17:44, Thierry Bultel wrote:
> Hi,
> I am using buildroot 2012.08 , configured for ARM cortex A9, crosstools and glibc-2.11.
> The glibc has been built with 2.6.38.8 headers, my running kernel is 3.2.21, in qemu for versatile express.
>
> The issue is that thread debugging does not work, first because /lib/libthread_db.so.1 was not pushed on the 'target'
> directory
> I 'solved' this by adding it:
>
> CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so \
> libnsl.so libpthread.so libresolv.so librt.so libutil.so \
> libthread_db.so

  It should probably be:

ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
CTNG_LIBS_LIB += libthread_db.so
endif



  But indeed, it looks like this is missing in crosstools-ng.mk.

  Yann?

>
> ... in crosstools-ng.mk
>
> but is is maybe not the right way.
>
> I have activated some debug log in gdb, and I am falling into those issues.
>
> Reading symbols from /root/ihm...done.
> (gdb) r
> Starting program: /root/ihm
> Trying host libthread_db library: libthread_db.so.1.
> Host libthread_db.so.1 resolved to: /lib/libthread_db.so.1.

  Are you running full gdb on the target?  You may have more luck with
gdbserver on the target and output/host/usr/bin/arm-*-gdb on the host.
Don't forget to do 'set sysroot .../output/staging' in gdb.

[snip]

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be <http://www.mind.be> 
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle <http://www.linkedin.com/in/arnoutvandecappelle> 
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120919/d8b8774b/attachment.html>
