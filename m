From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Aug 2017 00:59:11 +0200
Subject: [Buildroot] [PATCH] package/openssl: bump version to 1.1.0f
In-Reply-To: <1503612091-799-1-git-send-email-davidm@egauge.net>
References: <1503612091-799-1-git-send-email-davidm@egauge.net>
Message-ID: <0af65dc6-bc4a-bcc4-75ae-6cf2f9b2ac98@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi David,

On 25-08-17 00:01, David Mosberger-Tang wrote:
> Signed-off-by: David Mosberger-Tang <davidm@egauge.net>

 When you make big changes like this, the commit log should me much more
extended to explain why all this has changed.

[snip]
> diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
> deleted file mode 100644

 Why is this patch no longer needed? has it been applied upstream? Do we now
have a different way of avoiding to build the manpages? Can the manpages be
built safely?

[snip]
> diff --git a/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
> deleted file mode 100644

 Why is this patch no longer needed? Has it been applied upstream? If yes,
please refer to the upstream commit(s) in the commit message. Does cryptodev
build successfully now?

[snip]
> diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
> index 064eeca..3411d5f 100644
> --- a/package/openssl/openssl.hash
> +++ b/package/openssl/openssl.hash
> @@ -1,4 +1,5 @@
> -# From https://www.openssl.org/source/openssl-1.0.2k.tar.gz.sha256
> +# From https://www.openssl.org/source/openssl-1.1.0f.tar.gz.sha256
> +sha256	12f746f3f2493b2f39da7ecf63d7ee19c6ac9ec6a4fcd8c229da8a522cb12765	openssl-1.1.0f.tar.gz
>  sha256	6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0	openssl-1.0.2k.tar.gz
>  # Locally computed
>  sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d

 If you remove the patches downloaded from gentoo, then their hashes should be
removed as well.

[snip]
> -OPENSSL_PATCH = \
> -	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
> -	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
> -	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
> -	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d

 Why can these patches be removed? Have they been applied upstream? If yes,
please refer to the commit IDs. Does parallel build work reliably now?

>  
>  # relocation truncated to fit: R_68K_GOT16O
>  ifeq ($(BR2_m68k_cf),y)
> @@ -84,7 +79,6 @@ define OPENSSL_CONFIGURE_CMDS
>  			no-rc5 \
>  			enable-camellia \
>  			enable-mdc2 \
> -			enable-tlsext \

 Why is this removed?

>  			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
>  			$(if $(BR2_STATIC_LIBS),no-dso) \
>  	)
> @@ -110,7 +104,8 @@ define OPENSSL_BUILD_CMDS
>  endef
>  
>  define OPENSSL_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
> +		install_engines install_runtime install_ssldirs

 Why doesn't the install target work any more?

>  endef
>  
>  define HOST_OPENSSL_INSTALL_CMDS
> @@ -118,8 +113,8 @@ define HOST_OPENSSL_INSTALL_CMDS
>  endef
>  
>  define OPENSSL_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
> -	rm -rf $(TARGET_DIR)/usr/lib/ssl

 Why is this no longer needed?

> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> +		install_engines install_runtime install_ssldirs
>  	rm -f $(TARGET_DIR)/usr/bin/c_rehash
>  endef
>  
> @@ -136,7 +131,7 @@ endif
>  ifneq ($(BR2_STATIC_LIBS),y)
>  # libraries gets installed read only, so strip fails

 Is this still needed? I.e. are libs still installed readonly?

>  define OPENSSL_INSTALL_FIXUPS_SHARED
> -	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
> +	chmod +w $(TARGET_DIR)/usr/lib/engines-1.1/*.so

 Hm, perhaps we should introduce OPENSSL_VERSION_MAJOR and use that here...

 Regards,
 Arnout

>  	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
>  	do chmod +w $$i; done
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
