From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 10:35:56 +0200
Subject: [Buildroot] [PATCH 5 of 5] toolchain-external: use host-tar
 instead of tar to unpack toolchains
In-Reply-To: <20110921100243.1e55b429@skate>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <8a360f47132f5187ec55.1316588135@localhost6.localdomain6>
 <20110921100243.1e55b429@skate>
Message-ID: <CAAXf6LWQj65KCeCEzb-ETyFpUPqgjtxK0MZnbAfHayBx6GXE_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Sep 21, 2011 at 10:02 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Wed, 21 Sep 2011 08:55:35 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Some toolchains, like the one built with buildroot itself, use hardlinks (for
>> example to link between the c++ and g++ binary). Unpacking such a toolchain
>> with the --strip-components options does not work correctly if the system tar
>> is too old (<1.17). Even recent releases of RedHat/CentOS still ship with
>> tar 1.15.
>> To avoid such problems, always use host-tar instead of tar to unpack
>> toolchains.
>
> I'm sorry but we need to find a better solution for this. I really
> don't want all users to pay the price of building tar to extract
> the external toolchain just because some crappy distribution has an old
> version of tar. Can we make this conditional on the version of tar ?
> I'd also like some comment in the code suggesting to remove this crap 1
> or 2 years from now, once those RedHat/CentOS distributions will have
> been upgraded.
>
> Also, this proposal only takes care of using the compiled host tar for
> toolchain extraction. Why don't we also use it to extract all other
> packages (except tar itself, of course...) ?

I agree with both your points. In fact, I raised the same doubts in my
original patches:
http://lists.busybox.net/pipermail/buildroot/2011-August/044784.html
----
To be honest, I'm not sure what the best way is to handle this. The
same problems with tar could occur in other places than just external
toolchains. So maybe we should use host-tar in more places.
On the other hand, most users have a recent, working, tar version on
there system. It may thus make more sense to detect the system tar
version and only use host-tar if it's too old.
----


Regarding deprecating this change after some time: I'm not sure
whether this is still necessary if we make this conditional on the
system tar version. A user that is still on some old corporate system
with RedHat 5, may still need this patch in two or three years.

I'll see if I can update this patch with an automatic detection.

How would you go about to use the host-tar for all packages? I need to
add an extra autotargets call to package/tar/tar.mk, but I also need
to redefine TAR somewhere (currently it's defined in
package/Makefile.package.in). But TAR_STRIP_COMPONENTS uses TAR with a
:= dependency, and package/tar/tar.mk is only included after
package/Makefile.package.in, so I would need to add the conditional
check in two places.
Unless I move the check to a new file that is included from both
tar.mk and Makefile.package.in. In this case, where will I place the
file?
How do you see this?

Thanks for your comments,
Thomas

>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
