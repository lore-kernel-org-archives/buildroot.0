Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE0FCF885B
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138EC41811;
	Fri,  4 Oct 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdPvbtrrlw4t; Fri,  4 Oct 2024 21:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB4341800
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB4341800;
	Fri,  4 Oct 2024 21:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520751BF5F5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D26441800
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjqC7WiKe7PD for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 21:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A71D41361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A71D41361
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A71D41361
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 21:09:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fac6b3c220so37850701fa.2
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 14:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728076170; x=1728680970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+TMmGLfhpnCjb3m4aF7IwP29bvw2yfxy1/QHMuoMzM=;
 b=p7auuO2yD9q27x+kdRJHyjGCwOVNEdXKog9lr8UUqb8qDriaQN3VEQT3LniZu5Ukxg
 djoTBzfilMAHusP+vrrzCz3e/Il+AigOqituBA7xOq75JeZcU8FOL9l9TYZYbHgmH/xv
 s0lEUjMJYUUFiw21J8RmTdzheq8Ohi3X/GQSBVnneF78x5l9WI5FNXRx4WhBxQK8yIGM
 jskqmvr7HATimkkOh9LSx2zJ7k5cXQRHJ9Ti6z+ebUrVku0eaFXyloU7nmJLUdXdmA+K
 7CwA3c1vSYIucLvFMFHfkfukoItcE8XDPr8Lpqs68IO54+cdbMHXUog/u1M2b0Kk55xT
 QbLg==
X-Gm-Message-State: AOJu0Yyk1bxIA3tx1GhQxKZJpGGNJxiyBCHa4aM9dgqLYBPiiqLx22yp
 tBHSynWKREmXIp9sW/qpgugAl85KirDkC29C9fD3lSlwDjcQ5g4ONyQU/A==
X-Google-Smtp-Source: AGHT+IFRBP0MLInI2JYHvmnpaN3yEkAdBgR6rFfJg4VBPYnc8VwF6bn0hpBa8/2mWEJIcNe26sIcKw==
X-Received: by 2002:a2e:be1b:0:b0:2fa:d604:e522 with SMTP id
 38308e7fff4ca-2faf3b55dedmr26980801fa.0.1728076169556; 
 Fri, 04 Oct 2024 14:09:29 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ab19c5sm732071fa.6.2024.10.04.14.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 14:09:28 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 23:09:16 +0200
Message-ID: <20241004210919.3699625-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728076170; x=1728680970; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o+TMmGLfhpnCjb3m4aF7IwP29bvw2yfxy1/QHMuoMzM=;
 b=ITD9HW/47QYYIkivZ5wcNfTCCzQ5ikrKNAEwT31FekAgkBs41eZPMUZ249YCL874/T
 Cu0JEYXcSus0cxBIo1+LgEwbV5RYT5/8FKUjvbz0kjFMmmDqwB3q/bDdatV7E/FaLX30
 B6R9GCtuVM2PahLM2LzI2AOZD2h27JxVOhVkigrE6WhonPfQff8+Ekjeka0LKyqRWOy7
 tmEhf1BrjIpAjpQI4iY0hgbyeYws4TLSot8ohiJPDDFD2HMm+nCaCeP3dVa+XsE7eTll
 B+hYdJn6l06fC4xs//eOVqRkfdekHOVWARBVeg949D0SPOljHEzLbkvZiTWdvp/Ux6aC
 xC2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ITD9HW/4
Subject: [Buildroot] [PATCH v2 1/2] package/qt6: bump version to 6.7.3
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
Cc: Andreas Naumann <ANaumann@ultratronik.de>,
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see:

https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.3/release-note.md

I have removed a couple of patches here, since they are included in this
version:

 - CVE-2024-39936  (qtbase)
 - QTBUG-125066 Configure fails in qttools if PrintSupport is disabled  (qttools)

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Notes v1:
  qt 6.8.0 is going to be released in a few days, but I think it makes sense
  to do this bump anyway, since there are a lot of bug fixes here that likely
  can be safely backported

 package/qt6/qt6.mk                            |   2 +-
 .../qt6/qt6base/0001-fix-CVE-2024-39936.patch | 247 ------------------
 package/qt6/qt6base/qt6base.hash              |   4 +-
 package/qt6/qt6base/qt6base.mk                |   3 -
 .../qt6/qt6core5compat/qt6core5compat.hash    |   4 +-
 .../qt6/qt6declarative/qt6declarative.hash    |   4 +-
 .../qt6languageserver/qt6languageserver.hash  |   4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |   5 +-
 package/qt6/qt6opcua/qt6opcua.hash            |   5 +-
 package/qt6/qt6scxml/qt6scxml.hash            |   4 +-
 package/qt6/qt6serialbus/qt6serialbus.hash    |   4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |   4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |   4 +-
 package/qt6/qt6svg/qt6svg.hash                |   4 +-
 ...e-lconvert-lrelease-in-no-gui-builds.patch |  56 ----
 package/qt6/qt6tools/qt6tools.hash            |   4 +-
 .../qt6virtualkeyboard.hash                   |   4 +-
 package/qt6/qt6wayland/qt6wayland.hash        |   4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |   4 +-
 19 files changed, 33 insertions(+), 337 deletions(-)
 delete mode 100644 package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
 delete mode 100644 package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index f2e0186f56..56c5a413ad 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.7
-QT6_VERSION = $(QT6_VERSION_MAJOR).2
+QT6_VERSION = $(QT6_VERSION_MAJOR).3
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
deleted file mode 100644
index a6778ce107..0000000000
--- a/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
+++ /dev/null
@@ -1,247 +0,0 @@
-From fc1b8814f38c7d925d4590e9bdb16a02ca824025 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
-Date: Tue, 25 Jun 2024 17:09:35 +0200
-Subject: [PATCH] HTTP2: Delay any communication until encrypted() can be
- responded to
-
-We have the encrypted() signal that lets users do extra checks on the
-established connection. It is emitted as BlockingQueued, so the HTTP
-thread stalls until it is done emitting. Users can potentially call
-abort() on the QNetworkReply at that point, which is passed as a Queued
-call back to the HTTP thread. That means that any currently queued
-signal emission will be processed before the abort() call is processed.
-
-In the case of HTTP2 it is a little special since it is multiplexed and
-the code is built to start requests as they are available. This means
-that, while the code worked fine for HTTP1, since one connection only
-has one request, it is not working for HTTP2, since we try to send more
-requests in-between the encrypted() signal and the abort() call.
-
-This patch changes the code to delay any communication until the
-encrypted() signal has been emitted and processed, for HTTP2 only.
-It's done by adding a few booleans, both to know that we have to return
-early and so we can keep track of what events arose and what we need to
-resume once enough time has passed that any abort() call must have been
-processed.
-
-Fixes: QTBUG-126610
-Pick-to: 6.5 6.2 5.15 5.12
-Change-Id: Ic25a600c278203256e35f541026f34a8783235ae
-Reviewed-by: Marc Mutz <marc.mutz@qt.io>
-Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
-(cherry picked from commit b1e75376cc3adfc7da5502a277dfe9711f3e0536)
-Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
-(cherry picked from commit 0fb43e4395da34d561814242a0186999e4956e28)
-
-Upstream: https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58
-Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
----
- src/network/access/qhttp2protocolhandler.cpp  |  6 +--
- .../access/qhttpnetworkconnectionchannel.cpp  | 48 ++++++++++++++++++-
- .../access/qhttpnetworkconnectionchannel_p.h  |  6 +++
- tests/auto/network/access/http2/tst_http2.cpp | 44 +++++++++++++++++
- 4 files changed, 99 insertions(+), 5 deletions(-)
-
-diff --git a/src/network/access/qhttp2protocolhandler.cpp b/src/network/access/qhttp2protocolhandler.cpp
-index 0abd99b9bc..3631b13dc8 100644
---- a/src/network/access/qhttp2protocolhandler.cpp
-+++ b/src/network/access/qhttp2protocolhandler.cpp
-@@ -303,12 +303,12 @@ bool QHttp2ProtocolHandler::sendRequest()
-         }
-     }
- 
--    if (!prefaceSent && !sendClientPreface())
--        return false;
--
-     if (!requests.size())
-         return true;
- 
-+    if (!prefaceSent && !sendClientPreface())
-+        return false;
-+
-     m_channel->state = QHttpNetworkConnectionChannel::WritingState;
-     // Check what was promised/pushed, maybe we do not have to send a request
-     // and have a response already?
-diff --git a/src/network/access/qhttpnetworkconnectionchannel.cpp b/src/network/access/qhttpnetworkconnectionchannel.cpp
-index 6766989690..1e4161d1fd 100644
---- a/src/network/access/qhttpnetworkconnectionchannel.cpp
-+++ b/src/network/access/qhttpnetworkconnectionchannel.cpp
-@@ -209,6 +209,10 @@ void QHttpNetworkConnectionChannel::abort()
- bool QHttpNetworkConnectionChannel::sendRequest()
- {
-     Q_ASSERT(protocolHandler);
-+    if (waitingForPotentialAbort) {
-+        needInvokeSendRequest = true;
-+        return false; // this return value is unused
-+    }
-     return protocolHandler->sendRequest();
- }
- 
-@@ -221,21 +225,28 @@ bool QHttpNetworkConnectionChannel::sendRequest()
- void QHttpNetworkConnectionChannel::sendRequestDelayed()
- {
-     QMetaObject::invokeMethod(this, [this] {
--        Q_ASSERT(protocolHandler);
-         if (reply)
--            protocolHandler->sendRequest();
-+            sendRequest();
-     }, Qt::ConnectionType::QueuedConnection);
- }
- 
- void QHttpNetworkConnectionChannel::_q_receiveReply()
- {
-     Q_ASSERT(protocolHandler);
-+    if (waitingForPotentialAbort) {
-+        needInvokeReceiveReply = true;
-+        return;
-+    }
-     protocolHandler->_q_receiveReply();
- }
- 
- void QHttpNetworkConnectionChannel::_q_readyRead()
- {
-     Q_ASSERT(protocolHandler);
-+    if (waitingForPotentialAbort) {
-+        needInvokeReadyRead = true;
-+        return;
-+    }
-     protocolHandler->_q_readyRead();
- }
- 
-@@ -1239,7 +1250,18 @@ void QHttpNetworkConnectionChannel::_q_encrypted()
-         if (!h2RequestsToSend.isEmpty()) {
-             // Similar to HTTP/1.1 counterpart below:
-             const auto &pair = std::as_const(h2RequestsToSend).first();
-+            waitingForPotentialAbort = true;
-             emit pair.second->encrypted();
-+
-+            // We don't send or handle any received data until any effects from
-+            // emitting encrypted() have been processed. This is necessary
-+            // because the user may have called abort(). We may also abort the
-+            // whole connection if the request has been aborted and there is
-+            // no more requests to send.
-+            QMetaObject::invokeMethod(this,
-+                                      &QHttpNetworkConnectionChannel::checkAndResumeCommunication,
-+                                      Qt::QueuedConnection);
-+
-             // In case our peer has sent us its settings (window size, max concurrent streams etc.)
-             // let's give _q_receiveReply a chance to read them first ('invokeMethod', QueuedConnection).
-         }
-@@ -1257,6 +1279,28 @@ void QHttpNetworkConnectionChannel::_q_encrypted()
-     QMetaObject::invokeMethod(connection, "_q_startNextRequest", Qt::QueuedConnection);
- }
- 
-+
-+void QHttpNetworkConnectionChannel::checkAndResumeCommunication()
-+{
-+    Q_ASSERT(connection->connectionType() == QHttpNetworkConnection::ConnectionTypeHTTP2
-+             || connection->connectionType() == QHttpNetworkConnection::ConnectionTypeHTTP2Direct);
-+
-+    // Because HTTP/2 requires that we send a SETTINGS frame as the first thing we do, and respond
-+    // to a SETTINGS frame with an ACK, we need to delay any handling until we can ensure that any
-+    // effects from emitting encrypted() have been processed.
-+    // This function is called after encrypted() was emitted, so check for changes.
-+
-+    if (!reply && h2RequestsToSend.isEmpty())
-+        abort();
-+    waitingForPotentialAbort = false;
-+    if (needInvokeReadyRead)
-+        _q_readyRead();
-+    if (needInvokeReceiveReply)
-+        _q_receiveReply();
-+    if (needInvokeSendRequest)
-+        sendRequest();
-+}
-+
- void QHttpNetworkConnectionChannel::requeueHttp2Requests()
- {
-     const auto h2RequestsToSendCopy = std::exchange(h2RequestsToSend, {});
-diff --git a/src/network/access/qhttpnetworkconnectionchannel_p.h b/src/network/access/qhttpnetworkconnectionchannel_p.h
-index c42290feca..061f20fd42 100644
---- a/src/network/access/qhttpnetworkconnectionchannel_p.h
-+++ b/src/network/access/qhttpnetworkconnectionchannel_p.h
-@@ -74,6 +74,10 @@ public:
-     QAbstractSocket *socket;
-     bool ssl;
-     bool isInitialized;
-+    bool waitingForPotentialAbort = false;
-+    bool needInvokeReceiveReply = false;
-+    bool needInvokeReadyRead = false;
-+    bool needInvokeSendRequest = false;
-     ChannelState state;
-     QHttpNetworkRequest request; // current request, only used for HTTP
-     QHttpNetworkReply *reply; // current reply for this request, only used for HTTP
-@@ -146,6 +150,8 @@ public:
-     void closeAndResendCurrentRequest();
-     void resendCurrentRequest();
- 
-+    void checkAndResumeCommunication();
-+
-     bool isSocketBusy() const;
-     bool isSocketWriting() const;
-     bool isSocketWaiting() const;
-diff --git a/tests/auto/network/access/http2/tst_http2.cpp b/tests/auto/network/access/http2/tst_http2.cpp
-index 00efbc9832..c02e7b7b5b 100644
---- a/tests/auto/network/access/http2/tst_http2.cpp
-+++ b/tests/auto/network/access/http2/tst_http2.cpp
-@@ -106,6 +106,8 @@ private slots:
- 
-     void duplicateRequestsWithAborts();
- 
-+    void abortOnEncrypted();
-+
- protected slots:
-     // Slots to listen to our in-process server:
-     void serverStarted(quint16 port);
-@@ -1479,6 +1481,48 @@ void tst_Http2::duplicateRequestsWithAborts()
-     QCOMPARE(finishedCount, ExpectedSuccessfulRequests);
- }
- 
-+void tst_Http2::abortOnEncrypted()
-+{
-+#if !QT_CONFIG(ssl)
-+    QSKIP("TLS support is needed for this test");
-+#else
-+    clearHTTP2State();
-+    serverPort = 0;
-+
-+    ServerPtr targetServer(newServer(defaultServerSettings, H2Type::h2Direct));
-+
-+    QMetaObject::invokeMethod(targetServer.data(), "startServer", Qt::QueuedConnection);
-+    runEventLoop();
-+
-+    nRequests = 1;
-+    nSentRequests = 0;
-+
-+    const auto url = requestUrl(H2Type::h2Direct);
-+    QNetworkRequest request(url);
-+    request.setAttribute(QNetworkRequest::Http2DirectAttribute, true);
-+
-+    std::unique_ptr<QNetworkReply> reply{manager->get(request)};
-+    reply->ignoreSslErrors();
-+    connect(reply.get(), &QNetworkReply::encrypted, reply.get(), [reply = reply.get()](){
-+        reply->abort();
-+    });
-+    connect(reply.get(), &QNetworkReply::errorOccurred, this, &tst_Http2::replyFinishedWithError);
-+
-+    runEventLoop();
-+    STOP_ON_FAILURE
-+
-+    QCOMPARE(nRequests, 0);
-+    QCOMPARE(reply->error(), QNetworkReply::OperationCanceledError);
-+
-+    const bool res = QTest::qWaitFor(
-+            [this, server = targetServer.get()]() {
-+                return serverGotSettingsACK || prefaceOK || nSentRequests > 0;
-+            },
-+            500);
-+    QVERIFY(!res);
-+#endif // QT_CONFIG(ssl)
-+}
-+
- void tst_Http2::serverStarted(quint16 port)
- {
-     serverPort = port;
--- 
-2.46.0
-
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index b1b81b4992..695c1134c8 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtbase-everywhere-src-6.7.2.tar.xz.sha256
-sha256  c5f22a5e10fb162895ded7de0963328e7307611c688487b5d152c9ee64767599  qtbase-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtbase-everywhere-src-6.7.3.tar.xz.sha256
+sha256  8ccbb9ab055205ac76632c9eeddd1ed6fc66936fc56afc2ed0fd5d9e23da3097  qtbase-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..5ab61ba3e0 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -10,9 +10,6 @@ QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
 
-# 0001-fix-CVE-2024-39936.patch
-QT6BASE_IGNORE_CVES += CVE-2024-39936
-
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 36421b53ca..0d8b1cf5d8 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qt5compat-everywhere-src-6.7.2.tar.xz.sha256
-sha256  8826b5189efc4d9bdb64fdb1aa89d0fdf4e53c60948ed7995621ed046e38c003  qt5compat-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qt5compat-everywhere-src-6.7.3.tar.xz.sha256
+sha256  8b6a68a3dfaa7e9d10a0dafccee594c72e8de061bc573ae86b1c081b423a53f0  qt5compat-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 006b49e4b1..473b9b6baf 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtdeclarative-everywhere-src-6.7.2.tar.xz.sha256
-sha256  4c29cba1af8c42d425d8eb6e01bad24cb80f4b983d71eef566a0542dfdb9b999  qtdeclarative-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtdeclarative-everywhere-src-6.7.3.tar.xz.sha256
+sha256  937b70e441abf5bc4e50d44d26610e2714a28514acf3885cd36116cd610b9875  qtdeclarative-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index 7266474428..e328cac5e4 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtlanguageserver-everywhere-src-6.7.2.tar.xz.sha256
-sha256  b659fe655144ffa061e3ae509eadb42ae373230517295a96935434340e101a92  qtlanguageserver-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtlanguageserver-everywhere-src-6.7.3.tar.xz.sha256
+sha256  c56d3872428503d9e49bfc6fa1023332f035ffd711d39e904e50cd6bb1f9df8f  qtlanguageserver-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index 67ae6d0de3..bc2dc68447 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,6 +1,7 @@
-sha256  be2d3f12378a8e2a103c328201b1e308f8c6c09bd752322592b3164cebba5bde  qt6mqtt-6.7.2-git4.tar.gz
+# Locally computed
+sha256  0a80d52cf349b61e0c012f1aa692639ac958de46d8a76cdb99af7b6067cf5c46  qt6mqtt-6.7.3-git4.tar.gz
 
-# Hashes for license files:
+# Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index cf54bef98e..8bb89abd58 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,6 +1,7 @@
-sha256  653597e2926ddb512f078bab1e5d2a059202ba1bc1f68ff0b4a0e053ab1272b2  qt6opcua-6.7.2-git4.tar.gz
+# Locally computed
+sha256  09b5e525ad1a61b537b826f049b8725ab3b783bcaf3010a58361f73ff4df1cdb  qt6opcua-6.7.3-git4.tar.gz
 
-# Hashes for license files:
+# Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index 6c39be214a..f5e8b075a5 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256
-sha256  20ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8ae05c86f  qtscxml-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtscxml-everywhere-src-6.7.3.tar.xz.sha256
+sha256  608febeb0dafb6fbf559e064dee779ab799441ed804267b534705ea5077eeda3  qtscxml-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 1b854284a3..7da5f2bb43 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtserialbus-everywhere-src-6.7.2.tar.xz.sha256
-sha256  67641ca99b455746d7d956c516dfaa5f2c48696834c71d5720d63e736d374b2b  qtserialbus-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtserialbus-everywhere-src-6.7.3.tar.xz.sha256
+sha256  55d82e9c7a827808b7383f0a57ad12c2a6fcf5b6c936b27e633155163c0a6276  qtserialbus-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index c8708c2231..7972749d10 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtserialport-everywhere-src-6.7.2.tar.xz.sha256
-sha256  21c34cd1161cb5197bcec662d26a17647b59b6fdff5c364576883c42dbd3b4fc  qtserialport-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtserialport-everywhere-src-6.7.3.tar.xz.sha256
+sha256  d4fa58ee809b39c9eda8d20ee4677971e918edb9a076540466693bc46db146f0  qtserialport-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 9cb423c90f..d796561424 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtshadertools-everywhere-src-6.7.2.tar.xz.sha256
-sha256  edfa34c0ac8c00fcaa949df1d8e7a77d89dadd6386e683ce6c3e3b117e2f7cc1  qtshadertools-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtshadertools-everywhere-src-6.7.3.tar.xz.sha256
+sha256  74e512798c7ddbda354a2d8d975211454bbabb47afb7e598892067a5828c0995  qtshadertools-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index 7adfd7f2fb..611dbf72a7 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtsvg-everywhere-src-6.7.2.tar.xz.sha256
-sha256  fb0d1286a35be3583fee34aeb5843c94719e07193bdf1d4d8b0dc14009caef01  qtsvg-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtsvg-everywhere-src-6.7.3.tar.xz.sha256
+sha256  40142cb71fb1e07ad612bc361b67f5d54cd9367f9979ae6b86124a064deda06b  qtsvg-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch b/package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch
deleted file mode 100644
index fdce97cf48..0000000000
--- a/package/qt6/qt6tools/0001-CMake-Re-enable-lupdate-lconvert-lrelease-in-no-gui-builds.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4be1823e4d459c89717e791ef27fd463ad04cb2b Mon Sep 17 00:00:00 2001
-From: Joerg Bornemann <joerg.bornemann@qt.io>
-Date: Tue, 11 Jun 2024 10:47:18 +0200
-Subject: [PATCH] CMake: Re-enable lupdate/lconvert/lrelease in no-gui builds
-
-This reverts 8dba0e48a0f7d3487b318a74f80f2d8e59c320f9 which disabled the
-'linguist' feature if the 'printsupport' feature wasn't available.
-However, the 'linguist' feature controls not only the Qt Linguist
-application but also the command line tools lupdate, lconvert, and
-lrelease. In no-gui builds, which also disable printsupport, the command
-line tools were unexpectedly missing.
-
-Fix the issue by extending the feature condition in
-src/linguist/CMakeLists.txt. As drive-by, fix the FEATURE_png condition
-that was still in QMake form from the initial conversion.
-
-Fixes: QTBUG-126189
-Task-number: QTBUG-125066
-Pick-to: 6.7 6.8
-Change-Id: I59ebb82fd5823165b307ffbc967d7fd89a071ede
-Reviewed-by:  Alexey Edelev <alexey.edelev@qt.io>
-Reviewed-by: Alexandru Croitor <alexandru.croitor@qt.io>
-
-Upstream: https://github.com/qt/qttools/commit/4be1823e4d459c89717e791ef27fd463ad04cb2b
-Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
----
- configure.cmake             | 1 -
- src/linguist/CMakeLists.txt | 3 ++-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.cmake b/configure.cmake
-index 51a5196da6..e0facf0b90 100644
---- a/configure.cmake
-+++ b/configure.cmake
-@@ -74,7 +74,6 @@ qt_feature("kmap2qmap" PRIVATE
- qt_feature("linguist" PRIVATE
-     LABEL "Qt Linguist"
-     PURPOSE "Qt Linguist can be used by translator to translate text in Qt applications."
--    CONDITION TARGET Qt::PrintSupport
- )
- qt_feature("pixeltool" PRIVATE
-     LABEL "pixeltool"
-diff --git a/src/linguist/CMakeLists.txt b/src/linguist/CMakeLists.txt
-index ef28c0ff3a..ee11963039 100644
---- a/src/linguist/CMakeLists.txt
-+++ b/src/linguist/CMakeLists.txt
-@@ -14,7 +14,8 @@ add_subdirectory(lrelease)
- add_subdirectory(lrelease-pro)
- add_subdirectory(lupdate)
- add_subdirectory(lupdate-pro)
--if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton AND TARGET Qt::Widgets AND NOT no-png)
-+if(QT_FEATURE_process AND QT_FEATURE_pushbutton AND QT_FEATURE_toolbutton
-+    AND QT_FEATURE_png AND QT_FEATURE_printsupport AND TARGET Qt::Widgets)
-     add_subdirectory(linguist)
- endif()
- 
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index 622df4a00f..dba38b2895 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qttools-everywhere-src-6.7.2.tar.xz.sha256
-sha256  58e855ad1b2533094726c8a425766b63a04a0eede2ed85086860e54593aa4b2a  qttools-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qttools-everywhere-src-6.7.3.tar.xz.sha256
+sha256  f03bb7df619cd9ac9dba110e30b7bcab5dd88eb8bdc9cc752563b4367233203f  qttools-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index f34eb11e9e..3f568755ed 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtvirtualkeyboard-everywhere-src-6.7.2.tar.xz.sha256
-sha256  320664b55a0960ff79c1b822dcf6e8cebe3e08b791147d41b570996d81ce180f  qtvirtualkeyboard-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtvirtualkeyboard-everywhere-src-6.7.3.tar.xz.sha256
+sha256  1a872104e212c048ada47d28ea8bb2e0ab0637663a3b085989349e249f1423d9  qtvirtualkeyboard-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index 3d0ded7bec..a1fdb649b2 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtwayland-everywhere-src-6.7.2.tar.xz.sha256
-sha256  a2a057e1dd644bd44abb9990fecc194b2e25c2e0f39e81aa9fee4c1e5e2a8a5b  qtwayland-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtwayland-everywhere-src-6.7.3.tar.xz.sha256
+sha256  e326c7ceb628f503bfc20577d5d2df9690ee10db08eb940cb80c759a6972b2b5  qtwayland-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 5dfeeef01d..d9cfe8e173 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtwebsockets-everywhere-src-6.7.2.tar.xz.sha256
-sha256  5bde4af6ec9ce8c8632b782ab77b82d910721be2c714e6d38902521bcd1d215f  qtwebsockets-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtwebsockets-everywhere-src-6.7.3.tar.xz.sha256
+sha256  ba03007db7ee68a5bc3e3bd1d71e11f3e1f84e470bcb8c54cd7c01bbe1c5990e  qtwebsockets-everywhere-src-6.7.3.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
