From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 22:03:53 +0200
Subject: [Buildroot] [PATCH] coreutils: fix chroot installation
In-Reply-To: <ed36ad13c2e42fff1f2a715c31d6badf3eb39889.1531252591.git.baruch@tkos.co.il>
References: <ed36ad13c2e42fff1f2a715c31d6badf3eb39889.1531252591.git.baruch@tkos.co.il>
Message-ID: <d08d71e3-4974-6d9a-130c-6addd09657b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Baruch,

 Two questions...

On 10-07-18 21:56, Baruch Siach wrote:
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
>  package/coreutils/coreutils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 3cb96589f228..33389b6ca730 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -114,7 +114,8 @@ define COREUTILS_CLEANUP
>  	# link for archaic shells
>  	ln -fs test $(TARGET_DIR)/usr/bin/[

 Does this actually work? If it does, wouldn't it be better to link it directly
to coreutils as well? (Separate patch, obviously.)

>  	# gnu thinks chroot is in bin, debian thinks it's in sbin
> -	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
> +	rm -f $(TARGET_DIR)/usr/bin/chroot
> +	ln -sf ../../usr/bin/coreutils $(TARGET_DIR)/usr/sbin/chroot

 Why the additional ../usr?


 Regards,
 Arnout

>  endef
>  
>  COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
