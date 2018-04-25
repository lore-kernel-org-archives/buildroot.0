From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 25 Apr 2018 10:56:05 +0200
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
Message-ID: <447cff1a-80c7-dde0-7991-6ecf530bdb1c@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I noticed a problem with the EXTRA_DOWNLOADS for packages whose "main"
download happens using git (most likely applies to other SCMs too).

With the following defconfig:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="foo"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2018.03"

and the following line added to boot/uboot/uboot.mk:

UBOOT_EXTRA_DOWNLOADS += https://buildroot.org/images/logo.png

With Buildroot 2018.02, 'make uboot-source' downloads only the main git
sources. The URL mentioned in UBOOT_EXTRA_DOWNLOADS is ignored.

With Buildroot master (2018.02-934-gf5b14df1104c), the same command
tries to download the UBOOT_EXTRA_DOWNLOADS using git and of course it
fails:

Reinitialized existing Git repository in <...>/dl/uboot/git/.git/
Doing a shallow fetch
fatal: repository 'https://buildroot.org/images/' not found
Shallow fetch failed, falling back to fetching all refs
Fetching all references
fatal: repository 'https://buildroot.org/images/' not found

I think both behaviors are wrong: EXTRA_DOWNLOADS should always use wget
or cp, just as the manual says, and common sense suggests.

Regards,
-- 
Luca
