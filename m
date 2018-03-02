From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 2 Mar 2018 20:32:41 +0100
Subject: [Buildroot] [Patch next v1 3/3] qt5multimedia: fix Qt5.10.1
 target installation
In-Reply-To: <20180223183830.16768-4-ps.report@gmx.net>
References: <20180223183830.16768-1-ps.report@gmx.net>
 <20180223183830.16768-4-ps.report@gmx.net>
Message-ID: <20180302203241.30f0256a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Feb 2018 19:38:30 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 

Ups, one line of the commit message got lost...

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5multimedia/qt5multimedia.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 6120403f30..6e48fd0a09 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -47,7 +47,9 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
>  	$(QT5_LA_PRL_FILES_FIXUP)
>  endef
>  
> -ifeq ($(BR2_STATIC_LIBS),)
> +# since Qt5.10.1 libqgsttools was renamed to libQtMultimediaGstTools
> +# and is installed by the default target install step below
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_STATIC_LIBS),)

...and did add to the wrong if scope (the !BR2_STATIC_LIBS scope encloses
the mentioned default target install step too)...

Will send an update of the patchset...

Regards,
Peter

>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>  define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
>  	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
