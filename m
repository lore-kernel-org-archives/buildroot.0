Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95759C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452EE81FC2;
	Sat, 18 Mar 2023 22:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452EE81FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRKBVqgwkCer; Sat, 18 Mar 2023 22:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8387A81F61;
	Sat, 18 Mar 2023 22:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8387A81F61
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE7CD1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98AF860E19
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98AF860E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ymb1ERxLQiJP for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:07:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C804860BEA
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C804860BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B175586EB8; Sat, 18 Mar 2023 22:07:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 23:05:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4173d8b08525f260fea8a2a1e805b806bcba9fc
X-Git-Newrev: 971ae7b266d7d8df2d31f482d9fa44c0f3338c0a
X-Patchwork-Hint: ignore
Message-Id: <20230318220700.B175586EB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6base: network module needs
 libopenssl PSK feature
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=971ae7b266d7d8df2d31f482d9fa44c0f3338c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
