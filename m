From: Christian Stewart <christian@paral.in>
Date: Wed, 29 Jul 2015 04:57:41 +0000
Subject: [Buildroot] Golang in buildroot
In-Reply-To: <CANDJvwzV7nZBDvw_z0-snbv-K2WMggr5JR1NfUY0CjFRhB-_Dg@mail.gmail.com>
References: <CANDJvwzV7nZBDvw_z0-snbv-K2WMggr5JR1NfUY0CjFRhB-_Dg@mail.gmail.com>
Message-ID: <CA+h8R2rtH=SHhpxHHp4EzLER9vYKUXZ1-Ba7Pm68G8_a2_RW1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Nic,

On Tue, Jul 28, 2015 at 9:11 PM Nic Dade <nic.dade@gmail.com> wrote:

> I saw your patch
>   https://patchwork.ozlabs.org/patch/497914/
> and thought I'd try it.
>
> I found that I had to make some changes to make all the pieces work.
>

Cool. We have a newer version of this patch now, that Yann and I have been
working on. You can find it here:
https://github.com/paralin/buildroot/commit/826a3bea5b828d4fc08e0bb48ab78a3094204d85

Yann actually has done some more work on the patch as well which I'll bring
into my repo soon.

First, the 'install -D ...' line in GOLANG_INSTALL_TARGET_CMD...
>

See the updated patch.


> Secondly I wanted to build a go cross compiler to run on the host. The
> patch mentions this, and golang.mk seems to cover it, but without a
> Config.in.host file and a BR2_PACKAGE_HOST_GOLANG buidroot option it can't
> be activated.  So added a Config.in.host.
>

This isn't necessary - if your packages need the go cross compiler, add a
dependency (in the makefile and not in the Config.in) to host-golang. IF
you want to build one to use without a package, just type "make
host-golang".

In golang.mk I added "CGO_ENABLED=1" to the make.bash calls. By default (in
> go 1.4) CGO is disabled by default in cross compilers. That might not be
> important for your case, but I want the C<->Go interworking support for my
> purposes. I don't think it adds anything to the runtime unless you use CGO
> in the code, so you might enable it all the time.
>

This isn't necessary. With the current patch I'm building Docker, which
uses CGO extensively, for ARM. You just need to specify CGO_ENABLED=1 in
the compilation of your Go code.

Lastly I am targeting an ARM without an FPU, so when I go cross-compile I
> must also pass in GOARM=5 (along with the usual GOARCH=arm). I haven't
> found a clean way to separate GOARM from the rest of the golang.mk. It
> doesn't belong in golang.mk since it is target specific. Where should it
> go?
>

See the updated patch.

I hacked together a new variable GOLANGENV which contains the environment
> variable definitions needed by other packages to cross compile.
> GOLANGENV=CC_FOR_TARGET="$(TARGET_CC)" ....
> since the list gets long and I don't want it repeated in each go-using
> package.
>

Not sure this is entirely necessary, it might be important to have these be
specifically set in each package where they are used. But it's a decent
idea @Yann.

The patches to buildroot which I apply on top of your match are attached,
> as well as a complete package/golang/ for clarity.
>

Thank you, but I can't apply these changes so easily to our new patch.
Please see the updates, rebase, and email them back. I'll give it a test
tomorrow!

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150729/32cf1b92/attachment.html>
