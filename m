From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:06:42 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/zstd: enable library build
 and staging install
In-Reply-To: <20170923084630.3841-3-bernd.kuhls@t-online.de>
References: <20170923084630.3841-1-bernd.kuhls@t-online.de>
 <20170923084630.3841-3-bernd.kuhls@t-online.de>
Message-ID: <3fd45123-f7bf-815c-f5b3-684a8f714b09@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This doesn't look right...

On 23-09-17 10:46, Bernd Kuhls wrote:
> Needed for upcoming tor 0.3.1.7 which adds libzstd as optional
> dependency: https://blog.torproject.org/tor-0317-now-released
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: rebased
> 
>  package/zstd/zstd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index e836a81d62..88646eb16e 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -8,6 +8,7 @@ ZSTD_VERSION = v1.3.1
>  ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
>  ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
>  ZSTD_LICENSE_FILES = LICENSE COPYING
> +ZSTD_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  ZSTD_OPTS += HAVE_THREAD=1
> @@ -38,7 +39,12 @@ endif
>  
>  define ZSTD_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		-C $(@D) zstd
> +		-C $(@D)
> +endef
> +
> +define ZSTD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D) install

 It seems to install both a static and a shared library. But the target install
only installs the programs, not the shared library (since it has -C
$(@D)/programs). So if anyone actually links with that shared library, it will
give a runtime error. I guess tor does static linking so doesn't have that problem.

 The size of the shared library is almost as much as that of the executable
(roughly 300K), so I'm not sure if we need to introduce an option for it or not...

 Note that the program is linked with the object files directly, it's not linked
with the dynamic library, which makes installing the shared library a bit stupid...

 Regards,
 Arnout

>  endef
>  
>  define ZSTD_INSTALL_TARGET_CMDS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
