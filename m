Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B918DC7618A
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 08:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6222260BD7;
	Mon, 20 Mar 2023 08:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6222260BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiWRj8byMxp8; Mon, 20 Mar 2023 08:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F2B460BDB;
	Mon, 20 Mar 2023 08:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F2B460BDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C78951BF35B
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A129B40872
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A129B40872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQ0yGyDs_99G for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 08:53:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 956DF40743
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 08:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956DF40743
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8085587539; Mon, 20 Mar 2023 08:53:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 09:42:19 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9581a99263cf866f8cfd60dec4ad299f7edc5c4c
X-Git-Newrev: 91d669e7a004df0be95173252b9f87209c2b82a5
X-Patchwork-Hint: ignore
Message-Id: <20230320085354.8085587539@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qt6base: network
 module needs libopenssl PSK feature
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=91d669e7a004df0be95173252b9f87209c2b82a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:

  - http://autobuild.buildroot.net/results/fdf2b2eb252a24e81bddad1c81c4fdfb03dc0afe

  .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp: In member function 'bool dtlsopenssl::DtlsState::initCtxAndConnection(QDtlsBasePrivate*)':
  .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:669:9: error: 'q_SSL_set_psk_server_callback' was not declared in this scope; did you mean 'q_SSL_set_psk_use_session_callback'?
    669 |         q_SSL_set_psk_server_callback(newConnection.data(), dtlscallbacks::q_PSK_server_callback);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |         q_SSL_set_psk_use_session_callback
  .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:671:9: error: 'q_SSL_set_psk_client_callback' was not declared in this scope; did you mean 'q_SSL_set_info_callback'?
    671 |         q_SSL_set_psk_client_callback(newConnection.data(), dtlscallbacks::q_PSK_client_callback);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |         q_SSL_set_info_callback

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 971ae7b266d7d8df2d31f482d9fa44c0f3338c0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt6/qt6base/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 7927975bff..f9fb2a2ad0 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -165,6 +165,7 @@ endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
 	help
 	  This options enables the Qt6Network library.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
