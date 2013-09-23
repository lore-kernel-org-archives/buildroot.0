From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 23 Sep 2013 15:39:24 -0500
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF92E620E9.2D6A14D7-ON86257BEF.0070A92F-86257BEF.007178BD@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I've been using this patch for around a week now and today I tired to
generate the manual with this patch applied. However, "make manual"
fails pretty bad with this patch set applied. Have you tired 
generating the manual at all?

Here is what I've done:
 * Applied all four patches for v2 of BR2_EXTERNAL
 * make clean
 * make manual

I'm not exactly sure the root cause of the problem but my guess is
the top-level Config.in. To fix the problem, I just revert the 4 
patches and I can build the manual fine. When I do make manual I 
get the following error output:

/home/rjbarnet/projects/buildroot/buildroot-git/Config.in:19:warning:
The symbol BR2_EXTERNAL references the non-existent environment variable 
BR2_EXTERNAL and will
get the empty string as its value.

If you're using kconfiglib via 'make (i)scriptconfig' it should have set 
up the
environment correctly for you. If you still got this message, that might 
be an
error, and you should e-mail kconfiglib at gmail.com.
.
Traceback (most recent call last):
  File 
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/gen-manual-lists.py", 
line 376, in <module>
    buildroot = Buildroot()
  File 
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/gen-manual-lists.py", 
line 217, in __init__
    self.root_config))
  File 
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/kconfiglib.py", 
line 214, in __init__
    self.top_block = self._parse_file(filename, None, None, None)
  File 
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/kconfiglib.py", 
line 919, in _parse_file
    return self._parse_block(line_feeder, None, parent, deps, 
visible_if_deps, res)
  File 
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/kconfiglib.py", 
line 1114, in _parse_block
    self.base_dir))
IOError: /home/rjbarnet/projects/buildroot/buildroot-git/Config.in:490: 
sourced file "$BR2_EXTERNAL/Config.in" (expands to
"2_EXTERNAL/Config.in") not found. Perhaps base_dir
(argument to Config.__init__(), currently
"/home/rjbarnet/projects/buildroot/buildroot-git") is set to the wrong 
value.
make: *** [manual-update-lists] Error 1


Thanks,
-Ryan

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
09/14/2013 02:03:50 PM:
 
> This commit introduces the BR2_EXTERNAL environment variable, which
> will allow to keep Buildroot customization (board-specific
> configuration files or root filesystem overlays, package Config.in and
> makefiles, as well as defconfigs) outside of the Buildroot tree.
> 
> This commit only introduces the variable itself, and ensures that it
> is available within Config.in options, so that string options used to
> specify paths to directories or files can use $BR2_EXTERNAL as a
> reference. For example, one can use
> $BR2_EXTERNAL/board/<someboard>/kernel.config as the
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE value.
> 
> Following patches extend the usage of BR2_EXTERNAL to other areas
> (packages and defconfigs).
> 
> In details, this commit:
> 
>  * Introduces the BR2_EXTERNAL Kconfig option. This option has no
>    prompt, and is therefore not visible to the user and also not
>    stored in the .config file. It is automatically set to the value of
>    the BR2_EXTERNAL environment variable. The only purpose of this
>    BR2_EXTERNAL Kconfig option is to allow $BR2_EXTERNAL to be
>    properly expanded when used inside Kconfig option values.
> 
>  * Ensures that the path given in BR2_EXTERNAL is an absolute path, or
>    if not path is given, ensures that BR2_EXTERNAL points to a dummy
>    implementation in $(TOPDIR)/support/dummy-external/. This last part
>    is not directly useful in this commit, but is needed to properly
>    support Config.in options declared in BR2_EXTERNAL (next commit).
> 
>  * Passes the BR2_EXTERNAL into the *config environment, so that its
>    value is found when parsing/evaluating Config.in files and .config
>    values.
> 
>  * Encodes the BR2_EXTERNAL value into the Makefile wrapper (only if
>    BR2_EXTERNAL is specified by the user, not if the dummy internal
>    value is used).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in                  |  4 ++++
>  Makefile                   | 13 +++++++++++--
>  support/scripts/mkmakefile |  3 ++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 65c29b4..522eaf8 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -14,6 +14,10 @@ config BR2_HOSTARCH
>     string
>     option env="HOSTARCH"
> 
> +config BR2_EXTERNAL
> +   string
> +   option env="BR2_EXTERNAL"
> +
>  # Hidden boolean selected by pre-built packages for x86, when they
>  # need to run on x86-64 machines (example: pre-built external
>  # toolchains, binary tools like SAM-BA, etc.).
> diff --git a/Makefile b/Makefile
> index 8610592..13ad342 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -51,6 +51,14 @@ CONFIG_CONFIG_IN=Config.in
>  CONFIG=support/kconfig
>  DATE:=$(shell date +%Y%m%d)
> 
> +# Turn BR2_EXTERNAL into an absolute path
> +ifneq ($(BR2_EXTERNAL),)
> +override BR2_EXTERNAL := $(realpath $(BR2_EXTERNAL))
> +BR2_EXTERNAL_USED = y
> +else
> +BR2_EXTERNAL = $(TOPDIR)/support/dummy-external/
> +endif
> +
>  # Compute the full local version string so packages can use it as-is
>  # Need to export it, so it can be got from environment in children (eg. 
mconf)
>  export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/
> scripts/setlocalversion)
> @@ -632,7 +640,8 @@ COMMON_CONFIG_ENV = \
>     KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
>     KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
>     KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
> -   BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
> +   BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
> +   BR2_EXTERNAL=$(BR2_EXTERNAL)
> 
>  xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
>     @mkdir -p $(BUILD_DIR)/buildroot-config
> @@ -739,7 +748,7 @@ source-check:
>  # output directory.
>  outputmakefile:
>  ifeq ($(NEED_WRAPPER),y)
> -   $(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
> +   $(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O) $(if $
> (BR2_EXTERNAL_USED),$(BR2_EXTERNAL))
>  endif
> 
>  # printvars prints all the variables currently defined in our Makefiles
> diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> index cef2ec7..e7c1bd0 100755
> --- a/support/scripts/mkmakefile
> +++ b/support/scripts/mkmakefile
> @@ -6,7 +6,7 @@
>  # Usage
>  # $1 - Kernel src directory
>  # $2 - Output directory
> -
> +# $3 - BR2_EXTERNAL directory
> 
>  test ! -r $2/Makefile -o -O $2/Makefile || exit 0
>  # Only overwrite automatically generated Makefiles
> @@ -27,6 +27,7 @@ makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))
> 
>  MAKEARGS := -C $1
>  MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$
> (patsubst %/,%,\$(makedir))
> +MAKEARGS += BR2_EXTERNAL=$3
> 
>  MAKEFLAGS += --no-print-directory
> 
> -- 
> 1.8.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130923/7857176c/attachment-0001.html>
