From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Sep 2011 16:13:00 +0200
Subject: [Buildroot] [PATCH 7/8] package: change ordering of steps
In-Reply-To: <5a8e557f8f35394252c05dd5176e143b38a3469f.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <5a8e557f8f35394252c05dd5176e143b38a3469f.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LUszDVY6zf4dLx6SPknjzQEeXR-yP=zAuBw3FSWaaNkww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Sep 17, 2011 at 10:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Currently, the dependency chain is :
>
> ?configure -> patch
> ?patch -> extract
> ?extract -> depends
> ?depends -> source + dependencies ready
>
> This is a problem for RTAI, as :
>
> ?* In linux/linux-ext-rtai.mk, we need the RTAI source code to be
> ? extracted/patched by the RTAI package, so we need to have a
> ? dependency on RTAI.
>
> ?* The RTAI package cannot have its configure step executed before the
> ? Linux kernel is built, because it needs the kernel source code to
> ? be extracted and configured.
>
> Therefore, we have a sort of circular dependency. We solve this
> circular dependency by having the RTAI kernel part depending on
> rtai-patch, and having the RTAI userspace part depending on the linux
> package. However, for this to work, we have to modify the dependency
> chain to:
>
> ?configure -> patch + depends
> ?patch -> extract
> ?extract -> source
> ?depends -> dependencies ready
>
> Which means that dependencies are guaranteed to be built not when the
> package is extracted, but when the package is configured. Which is
> technically more correct that what we were doing in the past.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?package/Makefile.package.in | ? ?6 +++---
> ?1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 0751144..66be0a2 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -487,15 +487,15 @@ $(1)-install-host: ? ? ?$(1)-build $$($(2)_TARGET_INSTALL_HOST)
> ?$(1)-build: ? ? ? ? ? ?$(1)-configure \
> ? ? ? ? ? ? ? ? ? ? ? ?$$($(2)_TARGET_BUILD)
>
> -$(1)-configure: ? ? ? ? ? ? ? ?$(1)-patch \
> +$(1)-configure: ? ? ? ? ? ? ? ?$(1)-patch $(1)-depends \
> ? ? ? ? ? ? ? ? ? ? ? ?$$($(2)_TARGET_CONFIGURE)


I'm experiencing a problem now with Xenomai:
* First of all, there was no dependencies to linux anymore in the
Xenomai .mk file, which caused incorrect ordering of builds. To
address this, I copied the approach of RTAI that Thomas added (add a
linux dependency to xenomai-patch and add a xenomai dependency to
linux).

* after this, I stumbled upon another problem: if I removed both the
linux and the xenomai output directories, and ran make, then linux was
the first to come into play. After extraction of linux, the PRE_PATCH
hook of xenomai is executed, but Xenomai is not yet extracted! Indeed,
the current dependency tree does not enforce this.
I can fix my scenario by changing the order of -patch and -depends :

-$(1)-configure:                $(1)-patch $(1)-depends \
+$(1)-configure:                $(1)-depends $(1)-patch \

but I'm not sure whether this breaks other cases...
What do you think?

Best regards,
Thomas


>
> ?$(1)-patch: ? ? ? ? ? ?$(1)-extract $$($(2)_TARGET_PATCH)
>
> -$(1)-extract: ? ? ? ? ?$(1)-depends \
> +$(1)-extract: ? ? ? ? ?$(1)-source \
> ? ? ? ? ? ? ? ? ? ? ? ?$$($(2)_TARGET_EXTRACT)
>
> -$(1)-depends: ? ? ? ? ?$(1)-source $$($(2)_DEPENDENCIES)
> +$(1)-depends: ? ? ? ? ?$$($(2)_DEPENDENCIES)
>
> ?$(1)-show-depends:
> ? ? ? ? ? ? ? ? ? ? ? ?@echo $$($(2)_DEPENDENCIES)
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
