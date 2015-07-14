From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 21:13:32 +0200
Subject: [Buildroot] [PATCH 1/3] golang: new package
In-Reply-To: <1436899322-19731-1-git-send-email-christian@paral.in>
References: <1436899322-19731-1-git-send-email-christian@paral.in>
Message-ID: <CAGduivy=0mUwW8c6MosCT-kGir-N=5FjOFMqh8j1zpUJoqT0YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian, all

On Tue, Jul 14, 2015 at 8:42 PM, Christian Stewart <christian@paral.in> wrote:
> This patch introduces golang as a host and target package, allowing for cross-platform go builds.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                                  |  1 +
>  package/Config.in.host                             |  1 +
>  package/golang/0001-add-no-march-option-gccp.patch | 19 ++++++++++
>  .../0002-remove-unnecessary-march-ld-flag.patch    | 29 ++++++++++++++++
>  package/golang/Config.in                           |  6 ++++
>  package/golang/Config.in.host                      |  6 ++++
>  package/golang/golang.mk                           | 40 ++++++++++++++++++++++
>  7 files changed, 102 insertions(+)
>  create mode 100644 package/golang/0001-add-no-march-option-gccp.patch
>  create mode 100644 package/golang/0002-remove-unnecessary-march-ld-flag.patch
>  create mode 100644 package/golang/Config.in
>  create mode 100644 package/golang/Config.in.host
>  create mode 100644 package/golang/golang.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 5beb450..b49c94f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -455,6 +455,7 @@ menu "Erlang libraries/modules"
>         source "package/erlang-p1-zlib/Config.in"
>  endmenu
>  endif
> +       source "package/golang/Config.in"
>         source "package/guile/Config.in"
>         source "package/haserl/Config.in"
>         source "package/jamvm/Config.in"
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 1e047aa..e36afee 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -11,6 +11,7 @@ menu "Host utilities"
>         source "package/genext2fs/Config.in.host"
>         source "package/genimage/Config.in.host"
>         source "package/genpart/Config.in.host"
> +       source "package/golang/Config.in.host"
>         source "package/imx-usb-loader/Config.in.host"
>         source "package/lpc3250loader/Config.in.host"
>         source "package/mke2img/Config.in.host"
You don't need to explicitely show a host package for golang, take
example to the way it's done for Python for example.
You need the eval host package, but you don't have to show a host
symbol to the end users.
As you can see, the host utilities are, really, utilities, to generate
your bootloader's image, and so on.
> diff --git a/package/golang/0001-add-no-march-option-gccp.patch b/package/golang/0001-add-no-march-option-gccp.patch
> new file mode 100644
> index 0000000..87231aa
> --- /dev/null
> +++ b/package/golang/0001-add-no-march-option-gccp.patch
> @@ -0,0 +1,19 @@
> +Adds an option to not add the problematic -m parameter to GCC.
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +
> +diff -Nau golang.orig/src/cmd/cgo/gcc.go golang/src/cmd/cgo/gcc.go
> +--- golang.orig/src/cmd/cgo/gcc.go.orig        2015-07-09 15:53:55.720794139 -0700
> ++++ golang/src/cmd/cgo/gcc.go  2015-07-09 17:46:43.664496374 -0700
> +@@ -736,6 +736,11 @@
> +
> + // gccMachine returns the gcc -m flag to use, either "-m32", "-m64" or "-marm".
> + func (p *Package) gccMachine() []string {
> ++
> ++      if os.Getenv("CGO_NO_EMULATION") == "1" {
> ++              return nil
> ++      }
> ++
> +       switch goarch {
> +       case "amd64":
> +               return []string{"-m64"}
> diff --git a/package/golang/0002-remove-unnecessary-march-ld-flag.patch b/package/golang/0002-remove-unnecessary-march-ld-flag.patch
> new file mode 100644
> index 0000000..7cc20f4
> --- /dev/null
> +++ b/package/golang/0002-remove-unnecessary-march-ld-flag.patch
> @@ -0,0 +1,29 @@
> +Removes defining -m parameter to LD, which is unnecessary in buildroot.
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +
> +diff -Nau golang.orig/src/cmd/ld/lib.c golang/src/cmd/ld/lib.c
> +--- golang.orig/src/cmd/ld/lib.c.orig  2015-07-09 18:38:44.192359082 -0700
> ++++ golang/src/cmd/ld/lib.c    2015-07-09 18:39:02.108358294 -0700
> +@@ -589,20 +589,7 @@
> +       if(extld == nil)
> +               extld = "gcc";
> +       argv[argc++] = extld;
> +-      switch(thechar){
> +-      case '8':
> +-              argv[argc++] = "-m32";
> +-              break;
> +-      case '6':
> +-              argv[argc++] = "-m64";
> +-              break;
> +-      case '5':
> +-              argv[argc++] = "-marm";
> +-              break;
> +-      }
> +-      if(!debug['s'] && !debug_s) {
> +-              argv[argc++] = "-gdwarf-2";
> +-      } else {
> ++      if(debug['s'] || debug_s) {
> +               argv[argc++] = "-s";
> +       }
> +       if(HEADTYPE == Hdarwin)
> diff --git a/package/golang/Config.in b/package/golang/Config.in
> new file mode 100644
> index 0000000..5f058c6
> --- /dev/null
> +++ b/package/golang/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_GOLANG
> +       bool "golang"
> +       help
> +         Go compiler and cli tool.
> +
> +         http://golang.org/
I'm not sure, but I think you would need to add a few depends here like
depends on BR2_USE_MMU
depends on BR2_TOOLCHAIN_HAS_THREADS


You obviously need to add a comments if these are not met.

Theses are just an example maybe there's more, maybe less.
> diff --git a/package/golang/Config.in.host b/package/golang/Config.in.host
> new file mode 100644
> index 0000000..5d556bb
> --- /dev/null
> +++ b/package/golang/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_GOLANG
> +       bool "host golang"
> +       help
> +         Go compiler for the host system.
> +
> +         http://golang.org/
As said earlier, you don't need that too.
> diff --git a/package/golang/golang.mk b/package/golang/golang.mk
> new file mode 100644
> index 0000000..4893bcc
> --- /dev/null
> +++ b/package/golang/golang.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# GOLANG
> +#
> +################################################################################
> +
> +GOLANG_VERSION = 883bc6ed0ea815293fe6309d66f967ea60630e87
> +GOLANG_SITE = $(call github,golang,go,$(GOLANG_VERSION))
We really prefer to use release tarball, they are available from the
github "Release" page.
You'll need to add a hash file too, you can check the manual for how
and why do that.
> +GOLANG_LICENSE_FILES = LICENSE
You are missing the LICENSE type in itself.
> +GOLANG_INSTALL_STAGING = NO
That's the default, you don't need to specify it.
> +GOLANG_INSTALL_TARGET = YES
ditto
> +
> +HOST_GOLANG_DEPENDENCIES =
> +GOLANG_DEPENDENCIES =
If it's empty, you don't need to specify them.
> +
> +GOLANG = $(HOST_DIR)/usr/bin/go
> +GOLANGFMT = $(HOST_DIR)/usr/bin/gofmt
> +
> +define GOLANG_BUILD_CMDS
> +       cd $(@D)/src/ && CC_FOR_TARGET="$(TARGET_CC)" LD_FOR_TARGET="$(TARGET_LD)" GOOS=linux GOARCH=$(ARCH) GOROOT_FINAL="/usr/src/go" ./make.bash
> +endef
> +
> +define GOLANG_INSTALL_TARGET_CMDS
> +       cp $(@D)/bin/linux_$(ARCH)/* $(TARGET_DIR)/usr/bin/
Use INSTALL instead of cp
> +       mkdir -p $(TARGET_DIR)/usr/src/go/
> +       cp -r $(@D)/* $(TARGET_DIR)/usr/src/go/
ditto
> +endef
> +
> +define HOST_GOLANG_BUILD_CMDS
> +       cd $(@D)/src/ && CC_FOR_TARGET="$(TARGET_CC)" GOOS=linux GOARCH=$(ARCH) GOROOT_FINAL=$(HOST_DIR)/usr/src/go/ bash ./make.bash
> +endef
> +
> +define HOST_GOLANG_INSTALL_CMDS
> +       cp $(@D)/bin/go $(@D)/bin/gofmt $(HOST_DIR)/usr/bin/
ditto
> +       mkdir -p $(HOST_DIR)/usr/src/go/
> +       cp -r $(@D)/* $(HOST_DIR)/usr/src/go/
ditto
> +endef
> +
> +$(eval $(host-generic-package))
> +$(eval $(generic-package))
> --

A quick tip,when you respin, don't forget to send the whole series,
even if you only change one patch.
Also, use:
git format-patch --subject-prefix="PATCH vX"

Or use ---annotate directly with git send-email.

Your patch will be markes as "Changed Requested" in the patchwork,
please resend a new spin with the asked corrections or simply reply
why you think they are wrong.
Thanks a lot for your contributions !
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
