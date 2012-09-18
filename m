From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Sep 2012 22:59:47 +0200
Subject: [Buildroot] [PATCH] vala: fix documentation build problem
In-Reply-To: <1347914008-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347914008-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5058E0C3.8070502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 22:33, Thomas Petazzoni wrote:
> On gcc10, the build of the host-vala documentation causes a
> segmentation fault of xsltproc, for some unknown reason. See:
>
>    http://autobuild.buildroot.org/results/42fea25ac4fe33a56c02d90c361da1c494f79ba3/build-end.log
>
> Therefore, this patch fixes the problem by:
>
>   * Ensuring that host-libxslt is amongst the dependency of vala (vala
>     for the target) so that we build a well-known version of
>     libxslt/xsltproc.
>
>   * Disabling the build of the documentation for host-vala. Note that
>     we need to pass ':' as the xsltproc binary name to teach the
>     configure script that xsltproc is not available.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/vala/vala.mk |    8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/package/vala/vala.mk b/package/vala/vala.mk
> index 984043c..83c45b0 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -9,9 +9,17 @@ VALA_VERSION_MINOR = 6
>   VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
>   VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
>   VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
> +
>   VALA_DEPENDENCIES = host-flex libglib2 \
>   		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
> +ifeq ($(BR2_HAVE_DOCUMENTATION),y)
> +VALA_DEPENDENCIES += host-libxslt

  Don't you need ac_cv_path_XSLTPROC=: in the else case too?

  Regards,
  Arnout

> +endif
> +
>   HOST_VALA_DEPENDENCIES = host-flex host-libglib2
> +# Yes, the autoconf script understands ':' as "xsltproc is not
> +# available".
> +HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
>
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
