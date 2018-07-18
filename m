From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 18 Jul 2018 09:36:32 -0300 (BRT)
Subject: [Buildroot] [PATCH] busybox: don't clobber dangling symlinks
In-Reply-To: <412a4a2df4b4bd31b183dba362dca4a326535624.1531825303.git.baruch@tkos.co.il>
References: <412a4a2df4b4bd31b183dba362dca4a326535624.1531825303.git.baruch@tkos.co.il>
Message-ID: <1275044192.4274249.1531917392266.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "buildroot" <buildroot@busybox.net>
> Cc: "Baruch Siach" <baruch@tkos.co.il>, "ratbert90" <aduskett@gmail.com>, "DATACOM" <casantos@datacom.com.br>, "Yann
> Morin" <yann.morin.1998@free.fr>
> Sent: Tuesday, July 17, 2018 8:01:43 AM
> Subject: [PATCH] busybox: don't clobber dangling symlinks

> We sometimes create dangling symlinks in the target directory. That is
> because we need canonical targets, as relative targets don't work well
> with BR2_ROOTFS_MERGED_USR. For example, the vim package installs the
> /bin/vi symlink to /usr/bin/vim. This symlink might be dangling when the
> build host has no vim installed there.
> 
> Patch the busybox install.sh script to avoid clobber of dangling
> symlinks.
> 
> Fixes:
> http://autobuild.buildroot.net/results/796/796107430db6545401d9926e84f19eaf2040b756/
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Carlos Santos <casantos@datacom.com.br>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> ...l.sh-don-t-clobber-dangling-symlinks.patch | 38 +++++++++++++++++++
> 1 file changed, 38 insertions(+)
> create mode 100644
> package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
> 
> diff --git
> a/package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
> b/package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
> new file mode 100644
> index 000000000000..b6fb5b92368f
> --- /dev/null
> +++ b/package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch
> @@ -0,0 +1,38 @@
> +From c9f1a877f1b9e2602913600d769edb17ee41d15d Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Tue, 17 Jul 2018 13:18:09 +0300
> +Subject: [PATCH] install.sh: don't clobber dangling symlinks
> +
> +Symlinks in a subdirectory that is to become target rootfs are sometimes
> +dangling because they link to canonical file names that are not present
> +on the host, but are present relative to the target rootfs root. Don't
> +copy over dangling symlinks when noclobber is enabled
> +
> +The -e test treats dangling symlinks as non-existent files. Add -h test
> +that returns true for all symlinks.
> +
> +Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +Upstream status:
> +http://lists.busybox.net/pipermail/busybox/2018-July/086555.html
> +
> + applets/install.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/applets/install.sh b/applets/install.sh
> +index 9aede0f530e2..415896893e86 100755
> +--- a/applets/install.sh
> ++++ b/applets/install.sh
> +@@ -83,7 +83,7 @@ install -m 755 busybox "$prefix/bin/busybox" || exit 1
> + for i in $h; do
> + 	appdir=`dirname "$i"`
> + 	app=`basename "$i"`
> +-	if [ x"$noclobber" = x"1" ] && [ -e "$prefix/$i" ]; then
> ++	if [ x"$noclobber" = x"1" ] && ([ -e "$prefix/$i" ] || [ -h "$prefix/$i" ]);
> then
> + 		echo "  $prefix/$i already exists"
> + 		continue
> + 	fi
> +--
> +2.18.0
> +
> --
> 2.18.0

I'm not sure if this is a good approach. Perhaps we should look for
dangling symlinks in target-finalize and stop if one is found.

For the specific case of vim, I propose a different solution:

    https://patchwork.ozlabs.org/patch/945700/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
