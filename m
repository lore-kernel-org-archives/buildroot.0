Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B4CC001CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 18:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805624015F;
	Thu, 11 Apr 2024 18:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txPP49lIuOGS; Thu, 11 Apr 2024 18:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE28340162
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE28340162;
	Thu, 11 Apr 2024 18:48:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57D311BF3EC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44F5A40275
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 18:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTKDghnaxyUD for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 18:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E221A400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E221A400D9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E221A400D9
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 18:48:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 422CD13F846;
 Thu, 11 Apr 2024 20:48:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 20:48:19 +0200
Date: Thu, 11 Apr 2024 20:48:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <ZhgwczmiLaRsX25t@landeda>
References: <20240411145559.1183064-1-ben.hutchings@mind.be>
 <20240411145559.1183064-2-ben.hutchings@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411145559.1183064-2-ben.hutchings@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712861301;
 bh=f6XTiaEhh0k2OvlpXc5qM9QymejIAf909v8Dl6qfS7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X9q+b9dHFxyVIL4K20bpGlVjNFgwWNN/rql/3EOUxT5KBdw4y2V/SeoQGtGX1607+
 5uIpb6/vazJLj58LQetSjG6TKj/vs3dYS/NMS0lDlw826fUbxpLzGcjh29MDa2/PoN
 a7D7XmYW/ldYVQ6ifrBiXEIvXYPZO3Ixh7bHinvcrYM5DgPC5iMHDiMxXLq4hPYa9d
 ui32FJFSjSJGPsYtXvqNgs1ItfEHsCsn0VmfGX/f/ZbeUFHOVB8B+tNjNfIGaqFA3q
 N9LwJO+vJfoFqAGovNzrAAHKmjbfj1fDtRaXa1wtvcv8qtw5F1bxvMhn8LnnWppcNu
 ag16D4IixTL4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X9q+b9dH
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6base: Restore DirectFB
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ben, All,

On 2024-04-11 16:55 +0200, Ben Hutchings via buildroot spake thusly:
> Apply a patch from upstream to make Qt 6 support DirectFB again.
> 
> Implement a config option for this, similar to what we do for Qt 5.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/qt6/qt6base/Config.in                 |   8 +
>  .../qt6base-directfb-Fix-compilation.patch    | 288 ++++++++++++++++++
>  package/qt6/qt6base/qt6base.mk                |   7 +

    $ ./utils/docker-run make check-package
    package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch:0: use name <number>-<description>.patch (https://nightly.buildroot.org/#_providing_patches)
    package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch:0: missing Signed-off-by in the header (https://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
    package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)

Also, we currently only have qt6.4, while qt-6.7 is already released
now, and the patch you add was already present in qt-6.5.

So, maybe it would be better to actually bump qt6 rather than backport
patches?

Regards,
Yann E. MORIN.

>  3 files changed, 303 insertions(+)
>  create mode 100644 package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 3b15d40c83..b21cc33cde 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -36,6 +36,7 @@ config BR2_PACKAGE_QT6BASE_GUI
>  	# At least one graphic backend must be enabled, so enable
>  	# linuxfb if nothing is enabled.
>  	select BR2_PACKAGE_QT6BASE_LINUXFB if \
> +	       !BR2_PACKAGE_QT6BASE_DIRECTFB && \
>  	       !BR2_PACKAGE_QT6BASE_XCB && \
>  	       !BR2_PACKAGE_QT6BASE_EGLFS
>  	help
> @@ -56,6 +57,13 @@ config BR2_PACKAGE_QT6BASE_VULKAN
>  config BR2_PACKAGE_QT6BASE_LINUXFB
>  	bool "linuxfb support"
>  
> +config BR2_PACKAGE_QT6BASE_DIRECTFB
> +	bool "directfb support"
> +	depends on BR2_PACKAGE_DIRECTFB
> +
> +comment "directfb backend available if directfb is enabled"
> +	depends on !BR2_PACKAGE_DIRECTFB
> +
>  config BR2_PACKAGE_QT6BASE_XCB
>  	bool "X.org XCB support"
>  	depends on BR2_PACKAGE_XORG7
> diff --git a/package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch b/package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch
> new file mode 100644
> index 0000000000..5a7df51779
> --- /dev/null
> +++ b/package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch
> @@ -0,0 +1,288 @@
> +From d86ab16a86ec4d6fb92855a3c9913b6b74b6bb0f Mon Sep 17 00:00:00 2001
> +From: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.io>
> +Date: Tue, 30 Aug 2022 14:54:01 +0200
> +Subject: [PATCH] directfb: Fix compilation
> +
> +The DirectFB QPA plugin has not built since Qt 6, because it used
> +deprecated API which has been removed and private API which has
> +changed.
> +
> +This change updates the handleMouseEvent() and
> +handleWheelEvent() calls with the contents of the deprecated
> +overloads the way they were in Qt 5.15.
> +
> +In addition, it updates usage of GlyphAndSubPixelPosition to default to
> +vertical subpixel position of 0, and adds override qualifiers where
> +necessary.
> +
> +Fixes: QTBUG-105061
> +Change-Id: Id7516f8e3c0a466d15b754f8e5f6df15a5f9526a
> +Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
> +---
> + src/plugins/platforms/directfb/main.cpp       |  2 +-
> + .../directfb/qdirectfbbackingstore.h          |  8 ++---
> + .../platforms/directfb/qdirectfbblitter.cpp   |  2 +-
> + .../platforms/directfb/qdirectfbblitter.h     | 31 ++++++++++++-------
> + .../platforms/directfb/qdirectfbcursor.h      |  2 +-
> + .../platforms/directfb/qdirectfbinput.cpp     | 11 ++++---
> + .../platforms/directfb/qdirectfbinput.h       |  2 +-
> + .../platforms/directfb/qdirectfbintegration.h | 20 ++++++------
> + .../platforms/directfb/qdirectfbscreen.h      | 10 +++---
> + .../platforms/directfb/qdirectfbwindow.h      | 20 ++++++------
> + 10 files changed, 60 insertions(+), 48 deletions(-)
> +
> +diff --git a/src/plugins/platforms/directfb/main.cpp b/src/plugins/platforms/directfb/main.cpp
> +index 02cceeb487..4618696154 100644
> +--- a/src/plugins/platforms/directfb/main.cpp
> ++++ b/src/plugins/platforms/directfb/main.cpp
> +@@ -24,7 +24,7 @@ class QDirectFbIntegrationPlugin : public QPlatformIntegrationPlugin
> +     Q_OBJECT
> +     Q_PLUGIN_METADATA(IID QPlatformIntegrationFactoryInterface_iid FILE "directfb.json")
> + public:
> +-    QPlatformIntegration *create(const QString&, const QStringList&);
> ++    QPlatformIntegration *create(const QString&, const QStringList&) override;
> + };
> + 
> + QPlatformIntegration * QDirectFbIntegrationPlugin::create(const QString& system, const QStringList& paramList)
> +diff --git a/src/plugins/platforms/directfb/qdirectfbbackingstore.h b/src/plugins/platforms/directfb/qdirectfbbackingstore.h
> +index c51f29271d..625b672a40 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbbackingstore.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbbackingstore.h
> +@@ -18,10 +18,10 @@ class QDirectFbBackingStore : public QPlatformBackingStore
> + public:
> +     QDirectFbBackingStore(QWindow *window);
> + 
> +-    QPaintDevice *paintDevice();
> +-    void flush(QWindow *window, const QRegion &region, const QPoint &offset);
> +-    void resize (const QSize &size, const QRegion &staticContents);
> +-    bool scroll(const QRegion &area, int dx, int dy);
> ++    QPaintDevice *paintDevice() override;
> ++    void flush(QWindow *window, const QRegion &region, const QPoint &offset) override;
> ++    void resize (const QSize &size, const QRegion &staticContents) override;
> ++    bool scroll(const QRegion &area, int dx, int dy) override;
> + 
> +     QImage toImage() const override;
> + 
> +diff --git a/src/plugins/platforms/directfb/qdirectfbblitter.cpp b/src/plugins/platforms/directfb/qdirectfbblitter.cpp
> +index 0a110da798..aac0e3d800 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbblitter.cpp
> ++++ b/src/plugins/platforms/directfb/qdirectfbblitter.cpp
> +@@ -216,7 +216,7 @@ bool QDirectFbBlitter::drawCachedGlyphs(const QPaintEngineState *state, QFontEng
> +     for (int i=0; i<numGlyphs; ++i) {
> + 
> +         QFixed subPixelPosition = fontEngine->subPixelPositionForX(positions[i].x);
> +-        QTextureGlyphCache::GlyphAndSubPixelPosition glyph(glyphs[i], subPixelPosition);
> ++        QTextureGlyphCache::GlyphAndSubPixelPosition glyph(glyphs[i], QFixedPoint(subPixelPosition, 0));
> +         const QTextureGlyphCache::Coord &c = cache->coords[glyph];
> +         if (c.isNull())
> +             continue;
> +diff --git a/src/plugins/platforms/directfb/qdirectfbblitter.h b/src/plugins/platforms/directfb/qdirectfbblitter.h
> +index 591021061c..6183859613 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbblitter.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbblitter.h
> +@@ -19,11 +19,20 @@ public:
> +     QDirectFbBlitter(const QSize &size, bool alpha);
> +     virtual ~QDirectFbBlitter();
> + 
> +-    virtual void fillRect(const QRectF &rect, const QColor &color);
> +-    virtual void drawPixmap(const QRectF &rect, const QPixmap &pixmap, const QRectF &subrect);
> +-    void alphaFillRect(const QRectF &rect, const QColor &color, QPainter::CompositionMode cmode);
> +-    void drawPixmapOpacity(const QRectF &rect, const QPixmap &pixmap, const QRectF &subrect, QPainter::CompositionMode cmode, qreal opacity);
> +-    virtual bool drawCachedGlyphs(const QPaintEngineState *state, QFontEngine::GlyphFormat glyphFormat, int numGlyphs, const glyph_t *glyphs, const QFixedPoint *positions, QFontEngine *fontEngine);
> ++    void fillRect(const QRectF &rect, const QColor &color) override;
> ++    void drawPixmap(const QRectF &rect, const QPixmap &pixmap, const QRectF &subrect) override;
> ++    void alphaFillRect(const QRectF &rect, const QColor &color, QPainter::CompositionMode cmode) override;
> ++    void drawPixmapOpacity(const QRectF &rect,
> ++                           const QPixmap &pixmap,
> ++                           const QRectF &subrect,
> ++                           QPainter::CompositionMode cmode,
> ++                           qreal opacity) override;
> ++    bool drawCachedGlyphs(const QPaintEngineState *state,
> ++                          QFontEngine::GlyphFormat glyphFormat,
> ++                          int numGlyphs,
> ++                          const glyph_t *glyphs,
> ++                          const QFixedPoint *positions,
> ++                          QFontEngine *fontEngine) override;
> + 
> +     IDirectFBSurface *dfbSurface() const;
> + 
> +@@ -32,8 +41,8 @@ public:
> +     static DFBSurfacePixelFormat selectPixmapFormat(bool withAlpha);
> + 
> + protected:
> +-    virtual QImage *doLock();
> +-    virtual void doUnlock();
> ++    QImage *doLock() override;
> ++    void doUnlock() override;
> + 
> +     QDirectFBPointer<IDirectFBSurface> m_surface;
> +     QImage m_image;
> +@@ -50,12 +59,12 @@ private:
> + class QDirectFbBlitterPlatformPixmap : public QBlittablePlatformPixmap
> + {
> + public:
> +-    QBlittable *createBlittable(const QSize &size, bool alpha) const;
> ++    QBlittable *createBlittable(const QSize &size, bool alpha) const override;
> + 
> +     QDirectFbBlitter *dfbBlitter() const;
> + 
> +-    virtual bool fromFile(const QString &filename, const char *format,
> +-                          Qt::ImageConversionFlags flags);
> ++    bool fromFile(const QString &filename, const char *format,
> ++                  Qt::ImageConversionFlags flags) override;
> + 
> + private:
> +     bool fromDataBufferDescription(const DFBDataBufferDescription &);
> +@@ -83,7 +92,7 @@ public:
> +         : QImageTextureGlyphCache(format, matrix)
> +     {}
> + 
> +-    virtual void resizeTextureData(int width, int height);
> ++    void resizeTextureData(int width, int height) override;
> + 
> +     IDirectFBSurface *sourceSurface();
> + 
> +diff --git a/src/plugins/platforms/directfb/qdirectfbcursor.h b/src/plugins/platforms/directfb/qdirectfbcursor.h
> +index 9a480fc8f8..21a8f4353d 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbcursor.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbcursor.h
> +@@ -19,7 +19,7 @@ class QDirectFBCursor : public QPlatformCursor
> + public:
> +     QDirectFBCursor(QPlatformScreen *screen);
> + #ifndef QT_NO_CURSOR
> +-    void changeCursor(QCursor *cursor, QWindow *window);
> ++    void changeCursor(QCursor *cursor, QWindow *window) override;
> + #endif
> + 
> + private:
> +diff --git a/src/plugins/platforms/directfb/qdirectfbinput.cpp b/src/plugins/platforms/directfb/qdirectfbinput.cpp
> +index a62ff9882c..516dc1e9d8 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbinput.cpp
> ++++ b/src/plugins/platforms/directfb/qdirectfbinput.cpp
> +@@ -126,7 +126,7 @@ void QDirectFbInput::handleMouseEvents(const DFBEvent &event)
> +     long timestamp = (event.window.timestamp.tv_sec*1000) + (event.window.timestamp.tv_usec/1000);
> + 
> +     QWindow *tlw = m_tlwMap.value(event.window.window_id);
> +-    QWindowSystemInterface::handleMouseEvent(tlw, timestamp, p, globalPos, buttons);
> ++    QWindowSystemInterface::handleMouseEvent(tlw, timestamp, p, globalPos, buttons, Qt::NoButton, QEvent::None);
> + }
> + 
> + void QDirectFbInput::handleWheelEvent(const DFBEvent &event)
> +@@ -135,9 +135,12 @@ void QDirectFbInput::handleWheelEvent(const DFBEvent &event)
> +     QPoint globalPos(event.window.cx, event.window.cy);
> +     long timestamp = (event.window.timestamp.tv_sec*1000) + (event.window.timestamp.tv_usec/1000);
> +     QWindow *tlw = m_tlwMap.value(event.window.window_id);
> +-    QWindowSystemInterface::handleWheelEvent(tlw, timestamp, p, globalPos,
> +-                                          event.window.step*120,
> +-                                          Qt::Vertical);
> ++    QWindowSystemInterface::handleWheelEvent(tlw,
> ++                                             timestamp,
> ++                                             p,
> ++                                             globalPos,
> ++                                             QPoint(),
> ++                                             QPoint(0, event.window.step*120));
> + }
> + 
> + void QDirectFbInput::handleKeyEvents(const DFBEvent &event)
> +diff --git a/src/plugins/platforms/directfb/qdirectfbinput.h b/src/plugins/platforms/directfb/qdirectfbinput.h
> +index 5496f537a2..02175abc7b 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbinput.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbinput.h
> +@@ -26,7 +26,7 @@ public:
> +     void stopInputEventLoop();
> + 
> + protected:
> +-    void run();
> ++    void run() override;
> + 
> + private:
> +     void handleEvents();
> +diff --git a/src/plugins/platforms/directfb/qdirectfbintegration.h b/src/plugins/platforms/directfb/qdirectfbintegration.h
> +index aa369d7c05..8dd2a4516a 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbintegration.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbintegration.h
> +@@ -25,16 +25,16 @@ public:
> + 
> +     void connectToDirectFb();
> + 
> +-    bool hasCapability(Capability cap) const;
> +-    QPlatformPixmap *createPlatformPixmap(QPlatformPixmap::PixelType type) const;
> +-    QPlatformWindow *createPlatformWindow(QWindow *window) const;
> +-    QPlatformBackingStore *createPlatformBackingStore(QWindow *window) const;
> +-    QAbstractEventDispatcher *createEventDispatcher() const;
> +-
> +-    QPlatformFontDatabase *fontDatabase() const;
> +-    QPlatformServices *services() const;
> +-    QPlatformInputContext *inputContext() const { return m_inputContext; }
> +-    QPlatformNativeInterface *nativeInterface() const;
> ++    bool hasCapability(Capability cap) const override;
> ++    QPlatformPixmap *createPlatformPixmap(QPlatformPixmap::PixelType type) const override;
> ++    QPlatformWindow *createPlatformWindow(QWindow *window) const override;
> ++    QPlatformBackingStore *createPlatformBackingStore(QWindow *window) const override;
> ++    QAbstractEventDispatcher *createEventDispatcher() const override;
> ++
> ++    QPlatformFontDatabase *fontDatabase() const override;
> ++    QPlatformServices *services() const override;
> ++    QPlatformInputContext *inputContext() const override { return m_inputContext; }
> ++    QPlatformNativeInterface *nativeInterface() const override;
> + 
> + protected:
> +     virtual void initializeDirectFB();
> +diff --git a/src/plugins/platforms/directfb/qdirectfbscreen.h b/src/plugins/platforms/directfb/qdirectfbscreen.h
> +index a4f2e9adb1..cbcb6a55da 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbscreen.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbscreen.h
> +@@ -19,11 +19,11 @@ class QDirectFbScreen : public QPlatformScreen
> + public:
> +     QDirectFbScreen(int display);
> + 
> +-    QRect geometry() const { return m_geometry; }
> +-    int depth() const { return m_depth; }
> +-    QImage::Format format() const { return m_format; }
> +-    QSizeF physicalSize() const { return m_physicalSize; }
> +-    QPlatformCursor *cursor() const { return m_cursor.data(); }
> ++    QRect geometry() const override { return m_geometry; }
> ++    int depth() const override { return m_depth; }
> ++    QImage::Format format() const override { return m_format; }
> ++    QSizeF physicalSize() const override { return m_physicalSize; }
> ++    QPlatformCursor *cursor() const override { return m_cursor.data(); }
> + 
> +     // DirectFb helpers
> +     IDirectFBDisplayLayer *dfbLayer() const;
> +diff --git a/src/plugins/platforms/directfb/qdirectfbwindow.h b/src/plugins/platforms/directfb/qdirectfbwindow.h
> +index 6413d91860..f05038d8ca 100644
> +--- a/src/plugins/platforms/directfb/qdirectfbwindow.h
> ++++ b/src/plugins/platforms/directfb/qdirectfbwindow.h
> +@@ -15,19 +15,19 @@ class QDirectFbWindow : public QPlatformWindow
> + {
> + public:
> +     QDirectFbWindow(QWindow *tlw, QDirectFbInput *inputhandler);
> +-    ~QDirectFbWindow();
> ++    ~QDirectFbWindow() override;
> + 
> +-    void setGeometry(const QRect &rect);
> +-    void setOpacity(qreal level);
> ++    void setGeometry(const QRect &rect) override;
> ++    void setOpacity(qreal level) override;
> + 
> +-    void setVisible(bool visible);
> ++    void setVisible(bool visible) override;
> + 
> +-    void setWindowFlags(Qt::WindowFlags flags);
> +-    bool setKeyboardGrabEnabled(bool grab);
> +-    bool setMouseGrabEnabled(bool grab);
> +-    void raise();
> +-    void lower();
> +-    WId winId() const;
> ++    void setWindowFlags(Qt::WindowFlags flags) override;
> ++    bool setKeyboardGrabEnabled(bool grab) override;
> ++    bool setMouseGrabEnabled(bool grab) override;
> ++    void raise() override;
> ++    void lower() override;
> ++    WId winId() const override;
> + 
> +     virtual void createDirectFBWindow();
> +     IDirectFBWindow *dfbWindow() const;
> +-- 
> +2.39.2
> +
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 049d73a84f..a904d6edc8 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -181,6 +181,13 @@ else
>  QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT6BASE_DIRECTFB),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_directfb=ON
> +QT6BASE_DEPENDENCIES += directfb
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_directfb=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
>  QT6BASE_CONF_OPTS += \
>  	-DFEATURE_xcb=ON \
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
