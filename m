From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 22:14:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: add optional support for xz
In-Reply-To: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56BBA842.9080301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 21:59, Bernd Kuhls wrote:
> When xz was compiled before, gdb will use it as optional dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.1]
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 This should probably go in to 2016.02.

 Regards,
 Arnout

> ---
>  package/gdb/gdb.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 3b0f501..32d52eb 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -118,6 +118,13 @@ else
>  GDB_CONF_OPTS += --without-expat
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +GDB_CONF_OPTS += --with-lzma
> +GDB_DEPENDENCIES += xz
> +else
> +GDB_CONF_OPTS += --without-lzma
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GDB_CONF_OPTS += --with-zlib
>  GDB_DEPENDENCIES += zlib
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
