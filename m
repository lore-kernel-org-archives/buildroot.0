From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Oct 2015 00:11:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: Fix librtmp.pc
 defaulting to OpenSSL
In-Reply-To: <1444933628-30450-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444933628-30450-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56202494.5040105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-10-15 20:27, Bernd Kuhls wrote:
> rtmpdump has an optional dependency to OpenSSL or GnuTLS.
> The 'Requires: ' section of librtmp.pc defaults to "libssl,libcrypto"
> even when no crypto lib is available because the 'CRYPTO=' override in
> rtmpdump.mk does not force librtmp/Makefile, line 35, to not include
> these libraries. This breaks ffmpeg configure.
> 
> Fixes
> http://autobuild.buildroot.net/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/
> http://autobuild.buildroot.net/results/45d/45dd9adbac449ce0ed66af5b4655b4d9b37faa62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rtmpdump/rtmpdump.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
> index 613f1cd..5709cdb 100644
> --- a/package/rtmpdump/rtmpdump.mk
> +++ b/package/rtmpdump/rtmpdump.mk
> @@ -25,6 +25,10 @@ RTMPDUMP_CRYPTO = OPENSSL
>  else
>  # no crypto
>  RTMPDUMP_CRYPTO =
> +define RTMPDUMP_FIX_MAKEFILE
> +	$(SED) "s/CRYPTO=.*//g" $(@D)/librtmp/Makefile
> +endef

 I really don't like modifying the source depending on the configuration...
Also, this doesn't fix it for polarssl and gnutls.

 Fortunately, there is a simpler solution. When building, we already pass
CRYPTO= as an override to make, we should do the same when installing. IMHO the
other flags should be passed as well, so:

RTMPDUMP_MAKE_OPTS = \
	CRYPTO=$(RTMPDUMP_CRYPTO) \
	prefix=/usr \
	XCFLAGS="$(RTMPDUMP_CFLAGS)" \
	XLDFLAGS="$(TARGET_LDFLAGS)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	$(RTMPDUMP_SHARED)

define RTMPDUMP_BUILD_CMDS
	$(MAKE) $(RTMPDUMP_MAKE_OPTS) \
		-C $(@D)/librtmp
endef

define RTMPDUMP_INSTALL_STAGING_CMDS
	$(MAKE) $(RTMPDUMP_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
		-C $(@D)/librtmp install
endef

define RTMPDUMP_INSTALL_STAGING_CMDS
	$(MAKE) $(RTMPDUMP_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
		-C $(@D)/librtmp install
endef


 Regards,
 Arnout

> +RTMPDUMP_POST_PATCH_HOOKS += RTMPDUMP_FIX_MAKEFILE
>  endif
>  
>  RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
