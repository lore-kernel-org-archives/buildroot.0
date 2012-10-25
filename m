From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Oct 2012 23:36:03 +0200
Subject: [Buildroot] [PATCH 01/47] package/cURL: fix static link whith
 openSSL
In-Reply-To: <1351113973-17237-2-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5089B0C3.1060005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/12 23:25, Yann E. MORIN wrote:
> When openSSL is selected, cURL is configured to use it.
>
> But in this case, the libcurl.pc file /forgets/ to require link
> against -ldl.
>
> This can happen, for example, when BR2_PREFER_STATIC_LIB is not set,
> but an executable wants to be linked statically (for various reasons
> which are irrelevant here).
>
> Fix that by appending a 'Requires: openssl' line to the installed
> libcurl.pc, if openSSL is enabled.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> ---
>   package/libcurl/libcurl.mk |   10 ++++++++--
>   1 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 8d8fdb4..80e2922 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -29,14 +29,20 @@ define LIBCURL_TARGET_CLEANUP
>   	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
>   	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
>   endef
> -
> +define LIBCURL_FIX_TARGET_PC
> +	printf 'Requires: openssl\n'>>$(TARGET_DIR)/usr/lib/pkgconfig/libcurl.pc
> +endef
>   LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
> +LIBCURL_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_TARGET_PC)
>
>   define LIBCURL_STAGING_FIXUP_CURL_CONFIG
>   	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/curl-config
>   endef
> -
> +define LIBCURL_FIX_STAGING_PC
> +	printf 'Requires: openssl\n'>>$(STAGING_DIR)/usr/lib/pkgconfig/libcurl.pc
> +endef
>   LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
> +LIBCURL_POST_INSTALL_STAGING_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_STAGING_PC)

  Why not add it to $(@D)/libcurl.pc.in in a post-patch hook?  Then it only has
to be done once, and I also feel it's a better place to patch things.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
