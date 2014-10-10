From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 10 Oct 2014 23:03:19 +0200
Subject: [Buildroot] [PATCH v4] package/trinity: New package
In-Reply-To: <1412867742-53521-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1412867742-53521-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAHXCMMKe4BiNxg5j6WuH195fH3+konYpCk+vNBSaNNNRnb8ECQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincente,

On Thu, Oct 9, 2014 at 5:15 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Adding the Trinity Linux System call fuzz tester.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/Config.in          |    1 +
>  package/trinity/Config.in  |    6 ++++++
>  package/trinity/trinity.mk |   35 +++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 0 deletions(-)
>  create mode 100644 package/trinity/Config.in
>  create mode 100644 package/trinity/trinity.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ea89c96..3b570ee 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -89,6 +89,7 @@ endif
>         source "package/sysprof/Config.in"
>         source "package/tinymembench/Config.in"
>         source "package/trace-cmd/Config.in"
> +       source "package/trinity/Config.in"
>         source "package/valgrind/Config.in"
>         source "package/whetstone/Config.in"
>  endmenu
> diff --git a/package/trinity/Config.in b/package/trinity/Config.in
> new file mode 100644
> index 0000000..de9c467
> --- /dev/null
> +++ b/package/trinity/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_TRINITY
> +       bool "trinity"
> +       help
> +         A Linux System call fuzz tester
> +
> +         http://codemonkey.org.uk/projects/trinity/
> diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
> new file mode 100644
> index 0000000..b46f1a6
> --- /dev/null
> +++ b/package/trinity/trinity.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# trinity
> +#
> +################################################################################
> +
> +TRINITY_VERSION = 780d879c71979f54dfc9ec0a26e6f1e0d5e361e1
> +TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
> +TRINITY_LICENSE = GPLv2
> +TRINITY_LICENSE_FILES = COPYING
> +
> +ifeq ($(BR2_INET_IPV6),)
> +TARGET_CONFIGURE_OPTS += IPV6=no
> +endif
> +
> +define TRINITY_CONFIGURE_CMDS
> +       (cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
> +endef
> +
> +define TRINITY_BUILD_CMDS
> +       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define TRINITY_INSTALL_TARGET_CMDS
> +       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
> +endef
> +
> +# Install helper scripts
> +define TRINITY_INSTALL_HELPER_SCRIPTS
> +       mkdir -p $(TARGET_DIR)/usr/libexec/trinity
> +       cp -p $(@D)/scripts/* $(TARGET_DIR)/usr/libexec/trinity/
> +endef
> +TRINITY_POST_INSTALL_TARGET_HOOKS += TRINITY_INSTALL_HELPER_SCRIPTS
> +
> +$(eval $(generic-package))
> --
> 1.7.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Patch looks good, but unfortunately it does not build because of
gen-versionh.sh that does not correctly handle sources from a
git-archive tarball. :-(
I've sent a PR [1].


Regards,

[1] https://github.com/kernelslacker/trinity/pull/5

-- 
Samuel
