From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Aug 2019 10:31:12 +0200
Subject: [Buildroot] [PATCHv2] package/mtd: needs zstd
In-Reply-To: <983ab9a0-941e-0ea5-cf64-4217eda63220@armadeus.com>
References: <20190802081401.2545-1-yann.morin.1998@free.fr>
 <983ab9a0-941e-0ea5-cf64-4217eda63220@armadeus.com>
Message-ID: <20190802083112.GA3083@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2019-08-02 10:23 +0200, Julien Boibessot spake thusly:
> On 02/08/2019 10:14, Yann E. MORIN wrote:
>  From: Julien BOIBESSOT
>  [1]<julien.boibessot@armadeus.com>
>  For the target variant, zstd is a mandatory dependency when ubifs-tools
>  are enabled. For the host variant, it is an unconditional dependency.
>  Fixes:   
>  [2]http://autobuild.buildroot.org/results/99b/99baf1de106f9c80a32e665263c1e4278097643d/
>   (target)   
>  [3]http://autobuild.buildroot.org/results/e3b/e3b96704f0b23e82999aa3d6e93233edecbecfe7/
>   (host)Signed-off-by: Julien BOIBESSOT
>  [4]<julien.boibessot@armadeus.com>
>  Tested-by: Markus Mayer
>  [5]<mmayer@broadcom.com>[
>  [6]yann.morin.1998 at free.fr: fix the target variant too]
>  Signed-off-by: Yann E. MORIN
>  [7]<yann.morin.1998@free.fr>--- package/mtd/Config.in | 1 +
>   package/mtd/mtd.mk    | 4 ++-- 2 files changed, 3 insertions(+), 2 deletions(-)
>  diff --git a/package/mtd/Config.in b/package/mtd/Config.in
>  index 590ca7f5ef..1dd7dad1b3 100644--- a/package/mtd/Config.in
>  +++ b/package/mtd/Config.in@@ -21,6 +21,7 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
>          select BR2_PACKAGE_UTIL_LINUX   select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>          select BR2_PACKAGE_ZLIB+        select BR2_PACKAGE_ZSTD
>    comment "MTD tools selection" diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
>  index 0de14dbcba..04b8ccb73f 100644--- a/package/mtd/mtd.mk
>  +++ b/package/mtd/mtd.mk@@ -19,7 +19,7 @@ MTD_CONF_OPTS += --without-jffs
>   endif  ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
>  -MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
>  +MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf zstd
>   MTD_CONF_OPTS += --with-ubifs ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   MTD_DEPENDENCIES += openssl@@ -46,7 +46,7 @@ else
>   MTD_CONF_OPTS += --without-xattr endif -HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
>  +HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
>   HOST_MTD_CONF_OPTS = \         --with-jffs \   --with-ubifs \
> 
> I like your version but, as ZSTD seems optional for MTD UBIFS, I had something slightly different in progress:
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 0de14db..3477460 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -27,6 +27,12 @@ MTD_CONF_OPTS += --with-crypto
> ??else
> ??MTD_CONF_OPTS += --without-crypto
> ??endif
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +MTD_DEPENDENCIES += zstd
> +MTD_CONF_OPTS += --with-zstd
> +else
> +MTD_CONF_OPTS += --without-zstd
> +endif

But in configure, as yhou already quoted, we can see that zstd is
mandatory for ubifs:

    AM_COND_IF([BUILD_UBIFS], [
                need_uuid="yes"
                need_xattr="yes"
                need_zlib="yes"
                need_lzo="yes"
                need_zstd="yes"                   <<<<<<<<
                need_openssl="yes"
        ])

So, zstd is not a conditional dependency when ubifs is enabled. Or do I
still need to get more cofee? ;-)

Regards,
Yann E. MORIN.

> ??else
> ??MTD_CONF_OPTS += --without-ubifs
> ??endif
> @@ -46,7 +52,7 @@ else
> ??MTD_CONF_OPTS += --without-xattr
> ??endif
> ??
> -HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux
> +HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-util-linux host-zstd
> ??HOST_MTD_CONF_OPTS = \
> ?????????????? --with-jffs \
> ?????????????? --with-ubifs \
> 
> ("?? la openssl" for the same package)
> 
> which one do you prefer ?
> 
> Regards,
> 
> -- Julien BoibessotLead software engineer & co-manager
> +33 (0)6 61 32 61 09Armadeus systems - A new vision of the embedded world
> 
> Links:
> 1. mailto:julien.boibessot at armadeus.com/
> 2. http://autobuild.buildroot.org/results/99b/99baf1de106f9c80a32e665263c1e4278097643d/
> 3. http://autobuild.buildroot.org/results/e3b/e3b96704f0b23e82999aa3d6e93233edecbecfe7/
> 4. mailto:julien.boibessot at armadeus.com/
> 5. mailto:mmayer at broadcom.com/
> 6. mailto:yann.morin.1998 at free.fr/
> 7. mailto:yann.morin.1998 at free.fr/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
