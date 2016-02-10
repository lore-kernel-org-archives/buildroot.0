From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 22:19:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add optional
 support for bzip2
In-Reply-To: <1455137950-18164-2-git-send-email-bernd.kuhls@t-online.de>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <1455137950-18164-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56BBA94B.3000809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 21:59, Bernd Kuhls wrote:
> When bzip2 was compiled before, libarchive will use it as optional
> dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libarchive.so.13.1.2 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libarchive/libarchive.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 206de3f..f438d6e 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -42,6 +42,12 @@ else
>  LIBARCHIVE_CONF_OPTS += --disable-xattr
>  endif
>  
> +ifeq ($(BR2_PACKAGE_BZIP2),y)
> +LIBARCHIVE_DEPENDENCIES += bzip2

 No --with-bz2lib? If there is a good reason, mention it in the commit log.

 Regards,
 Arnout

> +else
> +LIBARCHIVE_CONF_OPTS += --without-bz2lib
> +endif
> +
>  ifeq ($(BR2_PACKAGE_EXPAT),y)
>  LIBARCHIVE_DEPENDENCIES += expat
>  else
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
