From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 21 Feb 2020 00:02:19 +0100
Subject: [Buildroot] [PATCH v1] package/qt5webengine: fix translations
 target install path
In-Reply-To: <20200220074148.8026-1-ps.report@gmx.net>
References: <20200220074148.8026-1-ps.report@gmx.net>
Message-ID: <20200221000219.1351a2fd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Feb 2020 08:41:48 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Through the evolution of the qt5webengine package patch ([1], [2])
> until the initial commit ([3]) the translations target install
> path got mangled resulting in a double trailing qtwebengine_locales
> path:
>   /usr/translations/qtwebengine_locales/qtwebengine_locales
> Instead of:
>   /usr/translations/qtwebengine_locales
>
> Fixes the translations runtime access failure resulting in the
> following warning:
>
>   WARNING:resource_bundle_qt.cpp(116): locale_file_path.empty() for locale
>
> [1] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
> [2] https://patchwork.ozlabs.org/patch/640633
> [3] https://git.buildroot.net/buildroot/commit/?id=89080bac9bc47946a09c1e74f2f872363bf6785b
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 1d5ee8d819..2b41ab79d0 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -90,8 +90,7 @@ define QT5WEBENGINE_INSTALL_TARGET_LIBS
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
>  	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
>  	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
> -	mkdir -p $(TARGET_DIR)/usr/translations/qtwebengine_locales/
> -	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/qtwebengine_locales/
> +	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/

My latest complete build for the rpi zero case resulted in all the *.pak files directly
under /usr/translations (instead of /usr/translations/qtwebengine_locales), seems the
removing of the mkdir command was a mistake..., seems I did only
  rm -r target/usr/translations/qtwebengine_locales
instead of
  rm -r target/usr/translations
for the test...

Updated patch will follow...

Regards,
Peter


>  endef
>  endif
>
