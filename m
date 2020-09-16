From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Sep 2020 18:34:04 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-meson.mk: fix generation
 of pkg_config_static prop
In-Reply-To: <20200915232732.33a65e66@gmx.net>
References: <20200915100546.806157-1-nolange79@gmail.com>
 <20200915232732.33a65e66@gmx.net>
Message-ID: <20200916183404.57c5ba0d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

second sight, two nitpicks below...

On Tue, 15 Sep 2020 23:27:32 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Norbert,
>
> On Tue, 15 Sep 2020 12:05:43 +0200, Norbert Lange <nolange79@gmail.com> wrote:
>
> > fixes following in the generated  file:

s/cross-complation.conf/cross-compilation.conf/

> > pkg_config_static = '$(if $(BR2_STATIC_LIBS),true,false)'

Maybe a short sentence about only the 'host/etc/meson/cross-compilation.conf'
(unused internally by buildroot) is affected, the per-package one (used by
buildroot) are correct...

Bug introduced by (wrong) cut and paste from the per-package lines (where the
double $$ is needed)...

Regards,
Peter

> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> > v1->v2:
> > -   truly fix the issue, missed one double $
> > ---
> >  package/pkg-meson.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index c3fe6df5d0..3a34ba703b 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -195,7 +195,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
> >  	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
> >  	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
> >  	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
> > -	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
> > +	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
> >  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> >  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
> >  	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
>
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
