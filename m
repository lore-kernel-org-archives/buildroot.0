From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 10 Jul 2018 17:06:44 -0300 (BRT)
Subject: [Buildroot] [PATCH] coreutils: fix chroot installation
In-Reply-To: <ed36ad13c2e42fff1f2a715c31d6badf3eb39889.1531252591.git.baruch@tkos.co.il>
References: <ed36ad13c2e42fff1f2a715c31d6badf3eb39889.1531252591.git.baruch@tkos.co.il>
Message-ID: <1724087198.2828172.1531253204348.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "buildroot" <buildroot@busybox.net>
> Cc: "Baruch Siach" <baruch@tkos.co.il>, "Carlos Santos" <casantos@datacom.ind.br>, "Thomas Petazzoni"
> <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, July 10, 2018 4:56:31 PM
> Subject: [PATCH] coreutils: fix chroot installation

> Since commit 256bb383fb7 (coreutils: use single binary in symlink
> method) the chroot move command creates a dangling symlink, because the
> symlink target is 'coreutils' which is not in the /usr/sbin/ directory.
> Instead of moving, remove the coreutils installed symlink, and create a
> new one in $(TARGET_DIR)/usr/sbin with the correct target.
> 
> Should also fix (busybox):
> http://autobuild.buildroot.net/results/6b3/6b39648b466738162516aa50ab328d839ec85448/
> 
> Cc: Carlos Santos <casantos@datacom.ind.br>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> package/coreutils/coreutils.mk | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 3cb96589f228..33389b6ca730 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -114,7 +114,8 @@ define COREUTILS_CLEANUP
> 	# link for archaic shells
> 	ln -fs test $(TARGET_DIR)/usr/bin/[
> 	# gnu thinks chroot is in bin, debian thinks it's in sbin
> -	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
> +	rm -f $(TARGET_DIR)/usr/bin/chroot
> +	ln -sf ../../usr/bin/coreutils $(TARGET_DIR)/usr/sbin/chroot

Since it is a relative symlink it could be just

    ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot

But that's not a critical problem.

> endef
> 
> COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
> --
> 2.18.0

Reviewed-by: Carlos Santos <casantos@datacom.com.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
