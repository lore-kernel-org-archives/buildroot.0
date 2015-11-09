From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2015 21:31:18 +0100
Subject: [Buildroot] [PATCH] system: Fix warning when selecting systemd
In-Reply-To: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Fri, 6 Nov 2015 19:23:45 +0100")
References: <1446834225-19878-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <878u66ud7t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > With systemd and a custom skeleton, you end up with the following
 > warning:
 > warning: (BR2_INIT_SYSTEMD) selects BR2_ROOTFS_MERGED_USR which has
 > unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  system/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/system/Config.in b/system/Config.in
 > index 4d07010..92712a8 100644
 > --- a/system/Config.in
 > +++ b/system/Config.in
 > @@ -92,7 +92,7 @@ config BR2_INIT_SYSTEMD
 >  	depends on BR2_USE_MMU
 >  	depends on !BR2_STATIC_LIBS
 >  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 > -	select BR2_ROOTFS_MERGED_USR
 > +	select BR2_ROOTFS_MERGED_USR if BR2_ROOTFS_SKELETON_DEFAULT

Hmm, we have a number of workarounds for merged /usr under package/, so
those packages will break with a custom skeleton (that contains a merged
/usr as required by systemd) as those workarounds are not performed.

Perhaps we should instead introduce a hidden BR2_ROOTFS_MERGED_USR
kconfig option for the !BR2_ROOTFS_SKELETON_DEFAULT case?

-- 
Bye, Peter Korsgaard
