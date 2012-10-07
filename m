From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 07 Oct 2012 13:09:57 +0200
Subject: [Buildroot] [PATCH v2] sylpheed: Fix includedir
In-Reply-To: <1349549706-24827-1-git-send-email-gvaxon@gmail.com>
References: <1349549706-24827-1-git-send-email-gvaxon@gmail.com>
Message-ID: <50716305.9040802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/12 20:55, Valentine Barshak wrote:
> The sylpheed headers are installed to the target directory,
> creating full staging directory path in the target rootfs,
> which is wrong.
> This happens because the headers are installed to
> $(DESTDIR)$(includedir), while DESTDIR is $(TARGET_DIR)
> and includedir is set to $(STAGING_DIR)/usr/include in the
> SYLPHEED_CONF_OPT.
>
> The includedir was set to staging include because sylpheed
> incorrectly adds includedir to its include path, and does
> not build with the default includedir set to /usr/include
> in the target filesystem.
>
> This removes includedir setting and also removes it from
> include paths in Makefiles. The same approach is used
> in the OE.
>
> Signed-off-by: Valentine Barshak<gvaxon@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  with a small addition:

> ---
>   package/sylpheed/sylpheed.mk | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
> index 451c4de..100fd67 100644
> --- a/package/sylpheed/sylpheed.mk
> +++ b/package/sylpheed/sylpheed.mk
> @@ -9,11 +9,18 @@ SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
>   SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
>   SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
>
> -SYLPHEED_CONF_OPT = --disable-gtkspell \
> -                    --includedir=$(STAGING_DIR)/usr/include
> +SYLPHEED_CONF_OPT = --disable-gtkspell
>
>   SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
>
> +define SYLPHEED_PRECONFIGURE
> +	for i in $$(find $(@D) -name "Makefile*"); do \
> +		sed -i 's:-I$$(includedir)::g' $$i; \
> +	done
> +endef

  Put a small explanatory comment here, e.g.:

# Remove the -I$(includedir) from the Makefile, because it would
# refer to the host's /usr/include.


  Regards,
  Arnout

> +
> +SYLPHEED_PRE_CONFIGURE_HOOKS += SYLPHEED_PRECONFIGURE
> +
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   SYLPHEED_DEPENDENCIES += openssl
>   SYLPHEED_CONF_OPT += --enable-ssl

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
