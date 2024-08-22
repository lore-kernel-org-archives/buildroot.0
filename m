Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA3FC5320E
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFBF460E28;
	Thu, 22 Aug 2024 10:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erbmGveFjjR2; Thu, 22 Aug 2024 10:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E0F560E3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0F560E3D;
	Thu, 22 Aug 2024 10:21:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA541BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1657A60B64
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXJakmZEaep0 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E15360B31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E15360B31
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E15360B31
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:20:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9ED46C0004;
 Thu, 22 Aug 2024 10:20:48 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 22 Aug 2024 12:20:33 +0200
Message-ID: <20240822102040.2083799-9-thomas.petazzoni@bootlin.com>
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
 bh=+JNZ5SejF1x2BWUnrIElDwstfz3Mq4QBQE7dCDNyWJk=;
 b=fs5+xk0VfS491zrTFfAdvMtN0m7B7uC7FQeXf4KwooDSq0twqzAysIoAVpfVVw2yatlBQl
 l6azutwI4zDPrNtRaZ9UKOATlzHLqhaQtwaMMVgXLIgo/B0DMPDrYnsbk+ibTI5a8qdolM
 3z5/0GB87V58xcqyUxOepKrbzaEiqRIGS9t8ZRT0DKbs9oEFUSKFPNWMDgR5qNFvaY86QK
 JZhHTcmB09c7CkxVcV4C5qN4zYsrEElDfRLYphQTeImVyIqmBZntUDmRaPZXtBFRyFMWOA
 CTBL/00DQ1GX2CMqJsZEPC6Fp81yHkxpJ9WxG8K9hy0wxzfE+wphaSMZ9R4S7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fs5+xk0V
Subject: [Buildroot] [PATCH 2024.02.x 8/9] package/qt6/qt6base: backport fix
 for CVE-2023-34410
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

This commit backports two upstream patches needed to fix
CVE-2023-34410. According to the CVE details, both patches are needed
for the fix.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Only applicable to 2024.02.x, since >= 2024.05 use a Qt6 version that
already has the fix.
---
 ...certificate-not-signed-by-a-configur.patch | 295 ++++++++++++++++++
 ...demand-cert-loading-bool-from-defaul.patch | 116 +++++++
 package/qt6/qt6base/qt6base.mk                |   3 +
 3 files changed, 414 insertions(+)
 create mode 100644 package/qt6/qt6base/0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
 create mode 100644 package/qt6/qt6base/0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch

diff --git a/package/qt6/qt6base/0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch b/package/qt6/qt6base/0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
new file mode 100644
index 0000000000..f956e783e4
--- /dev/null
+++ b/package/qt6/qt6base/0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
@@ -0,0 +1,295 @@
+From 4b68a00933a9803a8a374ef5bcfc0406538600c6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
+Date: Wed, 10 May 2023 16:43:41 +0200
+Subject: [PATCH] Schannel: Reject certificate not signed by a configured CA
+ certificate
+
+Not entirely clear why, but when building the certificate chain for a
+peer the system certificate store is searched for root certificates.
+General expectation is that after calling
+`sslConfiguration.setCaCertificates()` the system certificates will
+not be taken into consideration.
+
+To work around this behavior, we do a manual check that the root of the
+chain is part of the configured CA certificates.
+
+Pick-to: 6.5 6.2 5.15
+Change-Id: I03666a4d9b0eac39ae97e150b4743120611a11b3
+Reviewed-by: Edward Welbourne <edward.welbourne@qt.io>
+Reviewed-by: Volker Hilsheimer <volker.hilsheimer@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-34410
+Upstream: https://codereview.qt-project.org/gitweb?p=qt%2Fqtbase.git;a=commit;h=ada2c573c1a25f8d96577734968fe317ddfa292a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/plugins/tls/schannel/qtls_schannel.cpp    |  21 ++++
+ .../network/ssl/client-auth/CMakeLists.txt    |  24 ++++
+ .../network/ssl/client-auth/certs/.gitignore  |   4 +
+ .../client-auth/certs/accepted-client.conf    |  14 +++
+ .../network/ssl/client-auth/certs/generate.sh |  33 +++++
+ .../tst_manual_ssl_client_auth.cpp            | 118 ++++++++++++++++++
+ 6 files changed, 214 insertions(+)
+ create mode 100644 tests/manual/network/ssl/client-auth/CMakeLists.txt
+ create mode 100644 tests/manual/network/ssl/client-auth/certs/.gitignore
+ create mode 100644 tests/manual/network/ssl/client-auth/certs/accepted-client.conf
+ create mode 100755 tests/manual/network/ssl/client-auth/certs/generate.sh
+ create mode 100644 tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp
+
+diff --git a/src/plugins/tls/schannel/qtls_schannel.cpp b/src/plugins/tls/schannel/qtls_schannel.cpp
+index 0372d4973b4..f0b2ca69a16 100644
+--- a/src/plugins/tls/schannel/qtls_schannel.cpp
++++ b/src/plugins/tls/schannel/qtls_schannel.cpp
+@@ -2104,6 +2104,27 @@ bool TlsCryptographSchannel::verifyCertContext(CERT_CONTEXT *certContext)
+         verifyDepth = DWORD(q->peerVerifyDepth());
+ 
+     const auto &caCertificates = q->sslConfiguration().caCertificates();
++
++    if (!rootCertOnDemandLoadingAllowed()
++            && !(chain->TrustStatus.dwErrorStatus & CERT_TRUST_IS_PARTIAL_CHAIN)
++            && (q->peerVerifyMode() == QSslSocket::VerifyPeer
++                    || (isClient && q->peerVerifyMode() == QSslSocket::AutoVerifyPeer))) {
++        // When verifying a peer Windows "helpfully" builds a chain that
++        // may include roots from the system store. But we don't want that if
++        // the user has set their own CA certificates.
++        // Since Windows claims this is not a partial chain the root is included
++        // and we have to check that it is one of our configured CAs.
++        CERT_CHAIN_ELEMENT *element = chain->rgpElement[chain->cElement - 1];
++        QSslCertificate certificate = getCertificateFromChainElement(element);
++        if (!caCertificates.contains(certificate)) {
++            auto error = QSslError(QSslError::CertificateUntrusted, certificate);
++            sslErrors += error;
++            emit q->peerVerifyError(error);
++            if (q->state() != QAbstractSocket::ConnectedState)
++                return false;
++        }
++    }
++
+     QList<QSslCertificate> peerCertificateChain;
+     for (DWORD i = 0; i < verifyDepth; i++) {
+         CERT_CHAIN_ELEMENT *element = chain->rgpElement[i];
+diff --git a/tests/manual/network/ssl/client-auth/CMakeLists.txt b/tests/manual/network/ssl/client-auth/CMakeLists.txt
+new file mode 100644
+index 00000000000..67ecc20bf4d
+--- /dev/null
++++ b/tests/manual/network/ssl/client-auth/CMakeLists.txt
+@@ -0,0 +1,24 @@
++# Copyright (C) 2023 The Qt Company Ltd.
++# SPDX-License-Identifier: BSD-3-Clause
++
++qt_internal_add_manual_test(tst_manual_ssl_client_auth
++    SOURCES
++        tst_manual_ssl_client_auth.cpp
++    LIBRARIES
++        Qt::Network
++)
++
++qt_internal_add_resource(tst_manual_ssl_client_auth "tst_manual_ssl_client_auth"
++    PREFIX
++        "/"
++    FILES
++        "certs/127.0.0.1.pem"
++        "certs/127.0.0.1-key.pem"
++        "certs/127.0.0.1-client.pem"
++        "certs/127.0.0.1-client-key.pem"
++        "certs/accepted-client.pem"
++        "certs/accepted-client-key.pem"
++        "certs/rootCA.pem"
++    BASE
++        "certs"
++)
+diff --git a/tests/manual/network/ssl/client-auth/certs/.gitignore b/tests/manual/network/ssl/client-auth/certs/.gitignore
+new file mode 100644
+index 00000000000..5866f7b609c
+--- /dev/null
++++ b/tests/manual/network/ssl/client-auth/certs/.gitignore
+@@ -0,0 +1,4 @@
++*
++!/.gitignore
++!/generate.sh
++!/accepted-client.conf
+diff --git a/tests/manual/network/ssl/client-auth/certs/accepted-client.conf b/tests/manual/network/ssl/client-auth/certs/accepted-client.conf
+new file mode 100644
+index 00000000000..a88b276efec
+--- /dev/null
++++ b/tests/manual/network/ssl/client-auth/certs/accepted-client.conf
+@@ -0,0 +1,14 @@
++[req]
++default_md = sha512
++basicConstraints = CA:FALSE
++extendedKeyUsage = clientAuth
++[req]
++distinguished_name = client_distinguished_name
++prompt = no
++[client_distinguished_name]
++C   = NO
++ST  = Oslo
++L   = Oslo
++O   = The Qt Project
++OU  = The Qt Project
++CN  = Fake Qt Project Client Certificate
+diff --git a/tests/manual/network/ssl/client-auth/certs/generate.sh b/tests/manual/network/ssl/client-auth/certs/generate.sh
+new file mode 100755
+index 00000000000..5dbe3b3712a
+--- /dev/null
++++ b/tests/manual/network/ssl/client-auth/certs/generate.sh
+@@ -0,0 +1,33 @@
++#!/bin/bash
++# Copyright (C) 2023 The Qt Company Ltd.
++# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0
++
++# Requires mkcert and openssl
++
++warn () { echo "$@" >&2; }
++die () { warn "$@"; exit 1; }
++
++
++command -v mkcert 1>/dev/null 2>&1 || die "Failed to find mkcert"
++command -v openssl 1>/dev/null 2>&1 || die "Failed to find openssl"
++
++SCRIPT=$(realpath "$0")
++SCRIPTPATH=$(dirname "$SCRIPT")
++
++pushd "$SCRIPTPATH" || die "Unable to pushd to $SCRIPTPATH"
++mkcert 127.0.0.1
++mkcert -client 127.0.0.1
++warn "Remember to run mkcert -install if you haven't already"
++
++# Generate CA
++openssl genrsa -out ca-key.pem 2048
++openssl req -new -x509 -noenc -days 365 -key ca-key.pem -out rootCA.pem
++
++# Generate accepted client certificate
++openssl genrsa -out accepted-client-key.pem 2048
++openssl req -new -sha512 -nodes -key accepted-client-key.pem -out accepted-client.csr -config accepted-client.conf
++openssl x509 -req -sha512 -days 45 -in accepted-client.csr -CA rootCA.pem -CAkey ca-key.pem -CAcreateserial -out accepted-client.pem
++rm accepted-client.csr
++rm rootCA.srl
++
++popd || die "Unable to popd"
+diff --git a/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp b/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp
+new file mode 100644
+index 00000000000..2307cbb1911
+--- /dev/null
++++ b/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp
+@@ -0,0 +1,118 @@
++// Copyright (C) 2023 The Qt Company Ltd.
++// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0
++
++#include <QtCore/qcoreapplication.h>
++
++#include <QtCore/qthread.h>
++#include <QtCore/qfile.h>
++#include <QtCore/qdir.h>
++
++#include <QtNetwork/qsslsocket.h>
++#include <QtNetwork/qsslserver.h>
++#include <QtNetwork/qsslconfiguration.h>
++#include <QtNetwork/qsslkey.h>
++
++// Client and/or server presents a certificate signed by a system-trusted CA
++// but the other side presents a certificate signed by a different CA.
++constexpr bool TestServerPresentsIncorrectCa = false;
++constexpr bool TestClientPresentsIncorrectCa = true;
++
++class ServerThread : public QThread
++{
++    Q_OBJECT
++public:
++    void run() override
++    {
++        QSslServer server;
++
++        QSslConfiguration config = server.sslConfiguration();
++        QList<QSslCertificate> certs = QSslCertificate::fromPath(QStringLiteral(":/rootCA.pem"));
++        config.setCaCertificates(certs);
++        config.setLocalCertificate(QSslCertificate::fromPath(QStringLiteral(":/127.0.0.1.pem"))
++                                           .first());
++        QFile keyFile(QStringLiteral(":/127.0.0.1-key.pem"));
++        if (!keyFile.open(QIODevice::ReadOnly))
++            qFatal("Failed to open key file");
++        config.setPrivateKey(QSslKey(&keyFile, QSsl::Rsa));
++        config.setPeerVerifyMode(QSslSocket::VerifyPeer);
++        server.setSslConfiguration(config);
++
++        connect(&server, &QSslServer::pendingConnectionAvailable, [&server]() {
++            QSslSocket *socket = static_cast<QSslSocket *>(server.nextPendingConnection());
++            qDebug() << "[s] newConnection" << socket->peerAddress() << socket->peerPort();
++            socket->disconnectFromHost();
++            qApp->quit();
++        });
++        connect(&server, &QSslServer::startedEncryptionHandshake, [](QSslSocket *socket) {
++            qDebug() << "[s] new handshake" << socket->peerAddress() << socket->peerPort();
++        });
++        connect(&server, &QSslServer::errorOccurred,
++                [](QSslSocket *socket, QAbstractSocket::SocketError error) {
++                    qDebug() << "[s] errorOccurred" << socket->peerAddress() << socket->peerPort()
++                             << error << socket->errorString();
++                });
++        connect(&server, &QSslServer::peerVerifyError,
++                [](QSslSocket *socket, const QSslError &error) {
++                    qDebug() << "[s] peerVerifyError" << socket->peerAddress() << socket->peerPort()
++                             << error;
++                });
++        server.listen(QHostAddress::LocalHost, 24242);
++
++        exec();
++
++        server.close();
++    }
++};
++
++int main(int argc, char **argv)
++{
++    QCoreApplication app(argc, argv);
++
++    using namespace Qt::StringLiterals;
++
++    if (!QFileInfo(u":/rootCA.pem"_s).exists())
++        qFatal("rootCA.pem not found. Did you run generate.sh in the certs directory?");
++
++    ServerThread serverThread;
++    serverThread.start();
++
++    QSslSocket socket;
++    QSslConfiguration config = socket.sslConfiguration();
++    QString certificatePath;
++    QString keyFileName;
++    if constexpr (TestClientPresentsIncorrectCa) { // true: Present cert signed with incorrect CA: should fail
++        certificatePath = u":/127.0.0.1-client.pem"_s;
++        keyFileName = u":/127.0.0.1-client-key.pem"_s;
++    } else { // false: Use correct CA: should succeed
++        certificatePath = u":/accepted-client.pem"_s;
++        keyFileName = u":/accepted-client-key.pem"_s;
++    }
++    config.setLocalCertificate(QSslCertificate::fromPath(certificatePath).first());
++    if (TestServerPresentsIncorrectCa) // true: Verify server using incorrect CA: should fail
++        config.setCaCertificates(QSslCertificate::fromPath(u":/rootCA.pem"_s));
++    QFile keyFile(keyFileName);
++    if (!keyFile.open(QIODevice::ReadOnly))
++        qFatal("Failed to open key file");
++    config.setPrivateKey(QSslKey(&keyFile, QSsl::Rsa));
++    socket.setSslConfiguration(config);
++
++    QObject::connect(&socket, &QSslSocket::encrypted, []() { qDebug() << "[c] encrypted"; });
++    QObject::connect(&socket, &QSslSocket::errorOccurred,
++            [&socket](QAbstractSocket::SocketError error) {
++                qDebug() << "[c] errorOccurred" << error << socket.errorString();
++                qApp->quit();
++            });
++    QObject::connect(&socket, &QSslSocket::sslErrors, [](const QList<QSslError> &errors) {
++        qDebug() << "[c] sslErrors" << errors;
++    });
++    QObject::connect(&socket, &QSslSocket::connected, []() { qDebug() << "[c] connected"; });
++
++    socket.connectToHostEncrypted(QStringLiteral("127.0.0.1"), 24242);
++
++    const int res = app.exec();
++    serverThread.quit();
++    serverThread.wait();
++    return res;
++}
++
++#include "tst_manual_ssl_client_auth.moc"
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch b/package/qt6/qt6base/0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch
new file mode 100644
index 0000000000..7863f0c208
--- /dev/null
+++ b/package/qt6/qt6base/0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch
@@ -0,0 +1,116 @@
+From 99a9f2eccb5de9843dc956dd380dcf7515cbce27 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?M=C3=A5rten=20Nordheim?= <marten.nordheim@qt.io>
+Date: Thu, 25 May 2023 14:40:29 +0200
+Subject: [PATCH] Ssl: Copy the on-demand cert loading bool from default config
+
+Otherwise individual sockets will still load system certificates when
+a chain doesn't match against the configured CA certificates.
+That's not intended behavior, since specifically setting the CA
+certificates means you don't want the system certificates to be used.
+
+Follow-up to/amends ada2c573c1a25f8d96577734968fe317ddfa292a
+
+This is potentially a breaking change because now, if you ever add a
+CA to the default config, it will disable loading system certificates
+on demand for all sockets. And the only way to re-enable it is to
+create a null-QSslConfiguration and set it as the new default.
+
+Pick-to: 6.5 6.2 5.15
+Change-Id: Ic3b2ab125c0cdd58ad654af1cb36173960ce2d1e
+Reviewed-by: Timur Pocheptsov <timur.pocheptsov@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-34410
+Upstream: https://codereview.qt-project.org/gitweb?p=qt%2Fqtbase.git;a=commit;h=57ba6260c0801055b7188fdaa1818b940590f5f1
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/ssl/qsslsocket.cpp                |  5 ++++
+ .../tst_manual_ssl_client_auth.cpp            | 24 ++++++++++++++++---
+ 2 files changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/src/network/ssl/qsslsocket.cpp b/src/network/ssl/qsslsocket.cpp
+index 4eefe439293..0563fd06634 100644
+--- a/src/network/ssl/qsslsocket.cpp
++++ b/src/network/ssl/qsslsocket.cpp
+@@ -1973,6 +1973,10 @@ QSslSocketPrivate::QSslSocketPrivate()
+     , flushTriggered(false)
+ {
+     QSslConfigurationPrivate::deepCopyDefaultConfiguration(&configuration);
++    // If the global configuration doesn't allow root certificates to be loaded
++    // on demand then we have to disable it for this socket as well.
++    if (!configuration.allowRootCertOnDemandLoading)
++        allowRootCertOnDemandLoading = false;
+ 
+     const auto *tlsBackend = tlsBackendInUse();
+     if (!tlsBackend) {
+@@ -2281,6 +2285,7 @@ void QSslConfigurationPrivate::deepCopyDefaultConfiguration(QSslConfigurationPri
+     ptr->sessionProtocol = global->sessionProtocol;
+     ptr->ciphers = global->ciphers;
+     ptr->caCertificates = global->caCertificates;
++    ptr->allowRootCertOnDemandLoading = global->allowRootCertOnDemandLoading;
+     ptr->protocol = global->protocol;
+     ptr->peerVerifyMode = global->peerVerifyMode;
+     ptr->peerVerifyDepth = global->peerVerifyDepth;
+diff --git a/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp b/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp
+index 2307cbb1911..4d4aaca7e34 100644
+--- a/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp
++++ b/tests/manual/network/ssl/client-auth/tst_manual_ssl_client_auth.cpp
+@@ -16,6 +16,9 @@
+ // but the other side presents a certificate signed by a different CA.
+ constexpr bool TestServerPresentsIncorrectCa = false;
+ constexpr bool TestClientPresentsIncorrectCa = true;
++// Decides whether or not to put the root CA into the global ssl configuration
++// or into the socket's specific ssl configuration.
++constexpr bool UseGlobalConfiguration = true;
+ 
+ class ServerThread : public QThread
+ {
+@@ -26,8 +29,10 @@ public:
+         QSslServer server;
+ 
+         QSslConfiguration config = server.sslConfiguration();
+-        QList<QSslCertificate> certs = QSslCertificate::fromPath(QStringLiteral(":/rootCA.pem"));
+-        config.setCaCertificates(certs);
++        if (!UseGlobalConfiguration) {
++            QList<QSslCertificate> certs = QSslCertificate::fromPath(QStringLiteral(":/rootCA.pem"));
++            config.setCaCertificates(certs);
++        }
+         config.setLocalCertificate(QSslCertificate::fromPath(QStringLiteral(":/127.0.0.1.pem"))
+                                            .first());
+         QFile keyFile(QStringLiteral(":/127.0.0.1-key.pem"));
+@@ -73,6 +78,12 @@ int main(int argc, char **argv)
+     if (!QFileInfo(u":/rootCA.pem"_s).exists())
+         qFatal("rootCA.pem not found. Did you run generate.sh in the certs directory?");
+ 
++    if (UseGlobalConfiguration) {
++        QSslConfiguration config = QSslConfiguration::defaultConfiguration();
++        config.setCaCertificates(QSslCertificate::fromPath(u":/rootCA.pem"_s));
++        QSslConfiguration::setDefaultConfiguration(config);
++    }
++
+     ServerThread serverThread;
+     serverThread.start();
+ 
+@@ -88,12 +99,19 @@ int main(int argc, char **argv)
+         keyFileName = u":/accepted-client-key.pem"_s;
+     }
+     config.setLocalCertificate(QSslCertificate::fromPath(certificatePath).first());
+-    if (TestServerPresentsIncorrectCa) // true: Verify server using incorrect CA: should fail
++    if (!UseGlobalConfiguration && TestServerPresentsIncorrectCa) {
++        // Verify server using incorrect CA: should fail
+         config.setCaCertificates(QSslCertificate::fromPath(u":/rootCA.pem"_s));
++    } else if (UseGlobalConfiguration && !TestServerPresentsIncorrectCa) {
++        // Verify server using correct CA, we need to explicitly set the
++        // system CAs when the global config is overridden.
++        config.setCaCertificates(QSslConfiguration::systemCaCertificates());
++    }
+     QFile keyFile(keyFileName);
+     if (!keyFile.open(QIODevice::ReadOnly))
+         qFatal("Failed to open key file");
+     config.setPrivateKey(QSslKey(&keyFile, QSsl::Rsa));
++
+     socket.setSslConfiguration(config);
+ 
+     QObject::connect(&socket, &QSslSocket::encrypted, []() { qDebug() << "[c] encrypted"; });
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7cfcc708d8..291ac4a821 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -21,6 +21,9 @@ QT6BASE_IGNORE_CVES += CVE-2023-38197
 QT6BASE_IGNORE_CVES += CVE-2023-38197
 # 0013-QXmlStreamReader-make-fastScanName-indicate-parsing-.patch
 QT6BASE_IGNORE_CVES += CVE-2023-37369
+# 0014-Schannel-Reject-certificate-not-signed-by-a-configur.patch
+# 0015-Ssl-Copy-the-on-demand-cert-loading-bool-from-defaul.patch
+QT6BASE_IGNORE_CVES += CVE-2023-34410
 
 QT6BASE_CMAKE_BACKEND = ninja
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
