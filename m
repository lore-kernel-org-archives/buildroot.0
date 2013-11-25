From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Nov 2013 10:46:35 +0100
Subject: [Buildroot] [PATCH] lvm2: replace
	!BR2_PACKAGE_LVM2_DMSETUP_ONLY by BR2_PACKAGE_LVM2_FULL_SUITE
In-Reply-To: <1385250624-15984-1-git-send-email-arnout@mind.be>
References: <20131123183721.071bcfa1@skate>
 <1385250624-15984-1-git-send-email-arnout@mind.be>
Message-ID: <CAAXf6LXHZw6YRg1P+2=B1wca0CWHFhxocnYoQ4W7JmOb_v=Twg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Nov 24, 2013 at 12:50 AM, Arnout Vandecappelle
(Essensium/Mind) <arnout@mind.be> wrote:
> BR2_PACKAGE_LVM2_DMSETUP_ONLY is a "negative" option that disables
> build and install of part of the suite. This option cannot be unselected
> by other config options, which gives a problem for BR2_PACKAGE_UDISKS_LVM2:
> it needs BR2_PACKAGE_LVM2_APP_LIBRARY, which requires the full suite.
>
> Therefore, replace the negative BR2_PACKAGE_LVM2_DMSETUP_ONLY by a positive
> BR2_PACKAGE_LVM2_FULL_SUITE. To make sure that existing defconfigs keep
> working, the new option defaults to y unless the legacy
> BR2_PACKAGE_LVM2_DMSETUP_ONLY was selected.
>
> Fixes http://autobuild.buildroot.net/results/ea4627cae45e972ebba5b33a2b2871ce7f46fedc/
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Note that in the legacy handling I've assumed that this will still
> be taken in 2013.11.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in.legacy       |  9 +++++++++
>  package/lvm2/Config.in | 10 ++++++----
>  package/lvm2/lvm2.mk   |  2 +-
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 587afe1..6f9050a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -101,6 +101,15 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2013.11"
>
> +config BR2_PACKAGE_LVM2_DMSETUP_ONLY
> +       bool "lvm2's 'dmsetup only' option removed"
> +       select BR2_LEGACY
> +       help
> +         The BR2_PACKAGE_LVM2_DMSETUP_ONLY was a negative option, which
> +         led to problems with other packages that need the full lvm2
> +         suite. Therefore, the option has been replaced with the positive
> +         BR2_PACKAGE_LVM2_FULL_SUITE option.
> +

There should be a comment here that refers to the remaining legacy
reference in package/lvm2/Config.in, see
comment at BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL_WRAP.

>  config BR2_PACKAGE_QT_JAVASCRIPTCORE
>         bool "qt javascriptcore option removed"
>         select BR2_LEGACY
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index b3988ea..849aab3 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -16,16 +16,18 @@ config BR2_PACKAGE_LVM2
>           user-space. This makes it useful for not only LVM, but EVMS,
>           software raid, and other drivers that create "virtual" block devices.
>
> -config BR2_PACKAGE_LVM2_DMSETUP_ONLY
> -       bool "install dmsetup only"
> +config BR2_PACKAGE_LVM2_FULL_SUITE
> +       bool "install the full LVM2 suite"
> +       default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
>         depends on BR2_PACKAGE_LVM2
>         help
> -         Install dmsetup only and skip the LVM2 suite.
> +         Install the full LVM2 suite. When this option is not set, only
> +         dmsetup is installed.
>
>  config BR2_PACKAGE_LVM2_APP_LIBRARY
>         bool "install application library"
>         depends on BR2_PACKAGE_LVM2
> -       depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
> +       select BR2_PACKAGE_LVM2_FULL_SUITE
>         help
>           Install application library (liblvm2app).

It seems odd to me that the 'full suite' does not include the app
library: it is not 'full'.
It would have been nice if we could have options for the different
components, but at first sight there seem to be quite a number of
components in lvm2: (rough estimate below)

 $ find -name Makefile.in
./lib/thin/Makefile.in
./lib/format_pool/Makefile.in
./lib/replicator/Makefile.in
./lib/snapshot/Makefile.in
./lib/mirror/Makefile.in
./lib/format1/Makefile.in
./lib/Makefile.in
./lib/locking/Makefile.in
./lib/raid/Makefile.in
./python/Makefile.in
./libdaemon/client/Makefile.in
./libdaemon/Makefile.in
./libdaemon/server/Makefile.in
./test/unit/Makefile.in
./test/api/Makefile.in
./test/Makefile.in
./daemons/cmirrord/Makefile.in
./daemons/Makefile.in
./daemons/dmeventd/plugins/thin/Makefile.in
./daemons/dmeventd/plugins/snapshot/Makefile.in
./daemons/dmeventd/plugins/mirror/Makefile.in
./daemons/dmeventd/plugins/lvm2/Makefile.in
./daemons/dmeventd/plugins/Makefile.in
./daemons/dmeventd/plugins/raid/Makefile.in
./daemons/dmeventd/Makefile.in
./daemons/clvmd/Makefile.in
./daemons/lvmetad/Makefile.in
./tools/Makefile.in
./include/Makefile.in
./man/Makefile.in
./scripts/Makefile.in
./po/Makefile.in
./unit-tests/mm/Makefile.in
./unit-tests/datastruct/Makefile.in
./unit-tests/regex/Makefile.in
./Makefile.in
./conf/Makefile.in
./libdm/Makefile.in
./udev/Makefile.in
./liblvm/Makefile.in


Best regards,
Thomas
