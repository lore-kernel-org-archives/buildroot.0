From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 23:37:33 +0200
Subject: [Buildroot] [PATCH 2/2] libcurl: remove man and static lib from
 target
In-Reply-To: <1377806833-31991-3-git-send-email-rjbarnet@rockwellcollins.com>
References: <1377806833-31991-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1377806833-31991-3-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <521FBF1D.7010000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 22:07, Ryan Barnett wrote:
> Remove the documentation that libcurl installs on the target along
> with removing the static libraries on the target. The documentation
> and static library will only exist in the sysroot.

  This shouldn't be needed as it is done by target-finalize. Or doesn't 
that work for you?

  Regards,
  Arnout

>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>   package/libcurl/libcurl.mk |   20 ++++++++++++++++++++
>   1 files changed, 20 insertions(+), 0 deletions(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 79c16eb..caf355d 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -54,6 +54,26 @@ endef
>   LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>   endif
>
> +# Remove unneeded files/directories from target
> +LIBCURL_UNNEEDED_FILES = \
> +	usr/lib/libcurl.a \
> +	usr/lib/libcurl.la \
> +	usr/include/curl \
> +	usr/lib/pkgconfig/libcurl.pc
> +define LIBCURL_REMOVE_UNNEEDED_FILES
> +	rm -rf $(addprefix $(TARGET_DIR)/, $(LIBCURL_UNNEEDED_FILES))
> +endef
> +LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_REMOVE_UNNEEDED_FILES
> +
> +# Remove Documentation
> +ifneq ($(BR2_HAVE_DOCUMENTATION),y)
> +define LIBCURL_TARGET_REMOVE_DOCUMENTATION
> +	rm -f $(TARGET_DIR)/usr/share/man/man3/*curl*
> +	rm -f $(TARGET_DIR)/usr/share/man/man1/*curl*
> +endef
> +LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_REMOVE_DOCUMENTATION
> +endif
> +
>   $(eval $(autotools-package))
>
>   curl: libcurl
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
