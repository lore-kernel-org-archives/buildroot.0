Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952FFC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FEF60B5B;
	Thu, 22 Aug 2024 10:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2Ho1gw2EhmH; Thu, 22 Aug 2024 10:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 703FE60BBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 703FE60BBE;
	Thu, 22 Aug 2024 10:21:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75D251BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6338B407C6
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGND8EUoJDZy for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54C3640789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C3640789
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54C3640789
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:20:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 82508C0006;
 Thu, 22 Aug 2024 10:20:49 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 22 Aug 2024 12:20:34 +0200
Message-ID: <20240822102040.2083799-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
References: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724322049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahW4UMImrB3d+QZaHU/g+7blnG0up5AHfKUd8RGwZuU=;
 b=ZNQ4rxgk1YWsUJbnDzNlN66w5kevEcALCYN5vyNIMjTRoI31TcqRAGfrma1pteQDjuhKvA
 Fa9w4bCDCvO3PrzayNoF5Bo6tkJAdOuhSYWCDULyx2UC41pJI14dixPxGsGGvwGvWJT8qT
 c+jy9HPtsU0QvkxgxC5SbISxFngg4BiqaqNEwwJVpD8b1/hePJrRDB5Ga4vV4vhxgclPVC
 FiOUghgGd8+THiOQNBks0iwa/HKUAu4X+knqQgho0kH88i4NJywb5SdJjlGiK+njCvpcXU
 fZjtdWLjoCW2eiDdnbvM2FW6ijWjcme7IW+c8uHGwh1K6pSdi60f3XLbxFDfGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZNQ4rxgk
Subject: [Buildroot] [PATCH 2024.02.x 9/9] package/qt6/qt6base: backport fix
 for CVE-2024-39936
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports an upstream patch to fix CVE-2024-39936.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
This is already fixed in master as of
b866afa68405564497dd60c1f8f33cdf71d22728 ("package/qt6/qt6base: fix
CVE-2024-39936"), however this patch is suitable for 2024.02.x as it
will cleanly apply to the Qt6 version in 2024.02.x. For Buildroot
2024.05, the commit b866afa68405564497dd60c1f8f33cdf71d22728 can be
backported instead.
---
 ...communication-until-encrypted-can-be.patch | 248 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                |   2 +
 2 files changed, 250 insertions(+)
 create mode 100644 package/qt6/qt6base/0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch

diff --git a/package/qt6/qt6base/0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch b/package/qt6/qt6base/0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch
new file mode 100644
index 0000000000..ab8a46a95e
--- /dev/null
+++ b/package/qt6/qt6base/0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch
@@ -0,0 +1,248 @@
+From 6d2a5ad09074bd77b2de09adf7147107ee0db026 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
+Date: Tue, 25 Jun 2024 17:09:35 +0200
+Subject: [PATCH] HTTP2: Delay any communication until encrypted() can be
+ responded to
+
+We have the encrypted() signal that lets users do extra checks on the
+established connection. It is emitted as BlockingQueued, so the HTTP
+thread stalls until it is done emitting. Users can potentially call
+abort() on the QNetworkReply at that point, which is passed as a Queued
+call back to the HTTP thread. That means that any currently queued
+signal emission will be processed before the abort() call is processed.
+
+In the case of HTTP2 it is a little special since it is multiplexed and
+the code is built to start requests as they are available. This means
+that, while the code worked fine for HTTP1, since one connection only
+has one request, it is not working for HTTP2, since we try to send more
+requests in-between the encrypted() signal and the abort() call.
+
+This patch changes the code to delay any communication until the
+encrypted() signal has been emitted and processed, for HTTP2 only.
+It's done by adding a few booleans, both to know that we have to return
+early and so we can keep track of what events arose and what we need to
+resume once enough time has passed that any abort() call must have been
+processed.
+
+Fixes: QTBUG-126610
+Pick-to: 6.5 6.2 5.15 5.12
+Change-Id: Ic25a600c278203256e35f541026f34a8783235ae
+Reviewed-by: Marc Mutz <marc.mutz@qt.io>
+Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
+(cherry picked from commit b1e75376cc3adfc7da5502a277dfe9711f3e0536)
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+(cherry picked from commit 0fb43e4395da34d561814242a0186999e4956e28)
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2024-39936
+Upstream: https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/qhttp2protocolhandler.cpp  |  6 +--
+ .../access/qhttpnetworkconnectionchannel.cpp  | 48 ++++++++++++++++++-
+ .../access/qhttpnetworkconnectionchannel_p.h  |  6 +++
+ tests/auto/network/access/http2/tst_http2.cpp | 44 +++++++++++++++++
+ 4 files changed, 99 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/access/qhttp2protocolhandler.cpp b/src/network/access/qhttp2protocolhandler.cpp
+index 562b883242f..8c543efc742 100644
+--- a/src/network/access/qhttp2protocolhandler.cpp
++++ b/src/network/access/qhttp2protocolhandler.cpp
+@@ -335,12 +335,12 @@ bool QHttp2ProtocolHandler::sendRequest()
+         }
+     }
+ 
+-    if (!prefaceSent && !sendClientPreface())
+-        return false;
+-
+     if (!requests.size())
+         return true;
+ 
++    if (!prefaceSent && !sendClientPreface())
++        return false;
++
+     m_channel->state = QHttpNetworkConnectionChannel::WritingState;
+     // Check what was promised/pushed, maybe we do not have to send a request
+     // and have a response already?
+diff --git a/src/network/access/qhttpnetworkconnectionchannel.cpp b/src/network/access/qhttpnetworkconnectionchannel.cpp
+index 1e036bdc450..a64d1a25898 100644
+--- a/src/network/access/qhttpnetworkconnectionchannel.cpp
++++ b/src/network/access/qhttpnetworkconnectionchannel.cpp
+@@ -209,6 +209,10 @@ void QHttpNetworkConnectionChannel::abort()
+ bool QHttpNetworkConnectionChannel::sendRequest()
+ {
+     Q_ASSERT(protocolHandler);
++    if (waitingForPotentialAbort) {
++        needInvokeSendRequest = true;
++        return false; // this return value is unused
++    }
+     return protocolHandler->sendRequest();
+ }
+ 
+@@ -221,21 +225,28 @@ bool QHttpNetworkConnectionChannel::sendRequest()
+ void QHttpNetworkConnectionChannel::sendRequestDelayed()
+ {
+     QMetaObject::invokeMethod(this, [this] {
+-        Q_ASSERT(protocolHandler);
+         if (reply)
+-            protocolHandler->sendRequest();
++            sendRequest();
+     }, Qt::ConnectionType::QueuedConnection);
+ }
+ 
+ void QHttpNetworkConnectionChannel::_q_receiveReply()
+ {
+     Q_ASSERT(protocolHandler);
++    if (waitingForPotentialAbort) {
++        needInvokeReceiveReply = true;
++        return;
++    }
+     protocolHandler->_q_receiveReply();
+ }
+ 
+ void QHttpNetworkConnectionChannel::_q_readyRead()
+ {
+     Q_ASSERT(protocolHandler);
++    if (waitingForPotentialAbort) {
++        needInvokeReadyRead = true;
++        return;
++    }
+     protocolHandler->_q_readyRead();
+ }
+ 
+@@ -1232,7 +1243,18 @@ void QHttpNetworkConnectionChannel::_q_encrypted()
+             // Similar to HTTP/1.1 counterpart below:
+             const auto &h2Pairs = h2RequestsToSend.values(); // (request, reply)
+             const auto &pair = h2Pairs.first();
++            waitingForPotentialAbort = true;
+             emit pair.second->encrypted();
++
++            // We don't send or handle any received data until any effects from
++            // emitting encrypted() have been processed. This is necessary
++            // because the user may have called abort(). We may also abort the
++            // whole connection if the request has been aborted and there is
++            // no more requests to send.
++            QMetaObject::invokeMethod(this,
++                                      &QHttpNetworkConnectionChannel::checkAndResumeCommunication,
++                                      Qt::QueuedConnection);
++
+             // In case our peer has sent us its settings (window size, max concurrent streams etc.)
+             // let's give _q_receiveReply a chance to read them first ('invokeMethod', QueuedConnection).
+             QMetaObject::invokeMethod(connection, "_q_startNextRequest", Qt::QueuedConnection);
+@@ -1250,6 +1272,28 @@ void QHttpNetworkConnectionChannel::_q_encrypted()
+     }
+ }
+ 
++
++void QHttpNetworkConnectionChannel::checkAndResumeCommunication()
++{
++    Q_ASSERT(connection->connectionType() == QHttpNetworkConnection::ConnectionTypeHTTP2
++             || connection->connectionType() == QHttpNetworkConnection::ConnectionTypeHTTP2Direct);
++
++    // Because HTTP/2 requires that we send a SETTINGS frame as the first thing we do, and respond
++    // to a SETTINGS frame with an ACK, we need to delay any handling until we can ensure that any
++    // effects from emitting encrypted() have been processed.
++    // This function is called after encrypted() was emitted, so check for changes.
++
++    if (!reply && h2RequestsToSend.isEmpty())
++        abort();
++    waitingForPotentialAbort = false;
++    if (needInvokeReadyRead)
++        _q_readyRead();
++    if (needInvokeReceiveReply)
++        _q_receiveReply();
++    if (needInvokeSendRequest)
++        sendRequest();
++}
++
+ void QHttpNetworkConnectionChannel::requeueHttp2Requests()
+ {
+     QList<HttpMessagePair> h2Pairs = h2RequestsToSend.values();
+diff --git a/src/network/access/qhttpnetworkconnectionchannel_p.h b/src/network/access/qhttpnetworkconnectionchannel_p.h
+index 0772a4452b3..2a5336ca8a4 100644
+--- a/src/network/access/qhttpnetworkconnectionchannel_p.h
++++ b/src/network/access/qhttpnetworkconnectionchannel_p.h
+@@ -73,6 +73,10 @@ public:
+     QAbstractSocket *socket;
+     bool ssl;
+     bool isInitialized;
++    bool waitingForPotentialAbort = false;
++    bool needInvokeReceiveReply = false;
++    bool needInvokeReadyRead = false;
++    bool needInvokeSendRequest = false;
+     ChannelState state;
+     QHttpNetworkRequest request; // current request, only used for HTTP
+     QHttpNetworkReply *reply; // current reply for this request, only used for HTTP
+@@ -145,6 +149,8 @@ public:
+     void closeAndResendCurrentRequest();
+     void resendCurrentRequest();
+ 
++    void checkAndResumeCommunication();
++
+     bool isSocketBusy() const;
+     bool isSocketWriting() const;
+     bool isSocketWaiting() const;
+diff --git a/tests/auto/network/access/http2/tst_http2.cpp b/tests/auto/network/access/http2/tst_http2.cpp
+index 9c1a63bae1e..30abbb0d3ed 100644
+--- a/tests/auto/network/access/http2/tst_http2.cpp
++++ b/tests/auto/network/access/http2/tst_http2.cpp
+@@ -99,6 +99,8 @@ private slots:
+     void redirect_data();
+     void redirect();
+ 
++    void abortOnEncrypted();
++
+ protected slots:
+     // Slots to listen to our in-process server:
+     void serverStarted(quint16 port);
+@@ -1280,6 +1282,48 @@ void tst_Http2::redirect()
+     QTRY_VERIFY(serverGotSettingsACK);
+ }
+ 
++void tst_Http2::abortOnEncrypted()
++{
++#if !QT_CONFIG(ssl)
++    QSKIP("TLS support is needed for this test");
++#else
++    clearHTTP2State();
++    serverPort = 0;
++
++    ServerPtr targetServer(newServer(defaultServerSettings, H2Type::h2Direct));
++
++    QMetaObject::invokeMethod(targetServer.data(), "startServer", Qt::QueuedConnection);
++    runEventLoop();
++
++    nRequests = 1;
++    nSentRequests = 0;
++
++    const auto url = requestUrl(H2Type::h2Direct);
++    QNetworkRequest request(url);
++    request.setAttribute(QNetworkRequest::Http2DirectAttribute, true);
++
++    std::unique_ptr<QNetworkReply> reply{manager->get(request)};
++    reply->ignoreSslErrors();
++    connect(reply.get(), &QNetworkReply::encrypted, reply.get(), [reply = reply.get()](){
++        reply->abort();
++    });
++    connect(reply.get(), &QNetworkReply::errorOccurred, this, &tst_Http2::replyFinishedWithError);
++
++    runEventLoop();
++    STOP_ON_FAILURE
++
++    QCOMPARE(nRequests, 0);
++    QCOMPARE(reply->error(), QNetworkReply::OperationCanceledError);
++
++    const bool res = QTest::qWaitFor(
++            [this, server = targetServer.get()]() {
++                return serverGotSettingsACK || prefaceOK || nSentRequests > 0;
++            },
++            500);
++    QVERIFY(!res);
++#endif // QT_CONFIG(ssl)
++}
++
+ void tst_Http2::serverStarted(quint16 port)
+ {
+     serverPort = port;
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 291ac4a821..471edfb4f9 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -24,6 +24,8 @@ QT6BASE_IGNORE_CVES += CVE-2023-37369
 # 0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
 # 0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch
 QT6BASE_IGNORE_CVES += CVE-2023-34410
+# 0016-HTTP2-Delay-any-communication-until-encrypted-can-be.patch
+QT6BASE_IGNORE_CVES += CVE-2024-39936
 
 QT6BASE_CMAKE_BACKEND = ninja
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
