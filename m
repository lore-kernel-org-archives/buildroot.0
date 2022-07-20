Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D8C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1389941B4D;
	Wed, 20 Jul 2022 20:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1389941B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zb-UyOqZM8z0; Wed, 20 Jul 2022 20:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2796418D4;
	Wed, 20 Jul 2022 20:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2796418D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF471BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB8683F9F
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB8683F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PhBEy0Mcv_s for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:56:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7999583F98
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7999583F98
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A5FFA84080; Wed, 20 Jul 2022 20:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 22:55:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f29aecc64de0c42359daaf21bcbe337ffa383222
X-Git-Newrev: 1ebd10fd230821fbd7b2805e86a9baf88923ae1e
X-Patchwork-Hint: ignore
Message-Id: <20220720204235.A5FFA84080@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: add encryption support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ebd10fd230821fbd7b2805e86a9baf88923ae1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the OpenSSL case, only OpenSSL is supported, as open62541 does not
build with LibreSSL.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open62541/Config.in    | 20 ++++++++++++++++++++
 package/open62541/open62541.mk | 10 ++++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 3f5eb78d52..296be1578d 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -7,6 +7,26 @@ config BR2_PACKAGE_OPEN62541
 
 if BR2_PACKAGE_OPEN62541
 
+choice
+	prompt "encryption"
+	default BR2_PACKAGE_OPEN62541_ENCRYPTION_NONE
+	help
+	  Encryption support
+
+config BR2_PACKAGE_OPEN62541_ENCRYPTION_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPEN62541_ENCRYPTION_MBEDTLS
+	bool "mbedtls"
+	select BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+
+endchoice
+
 choice
 	prompt "namespace zero nodes"
 	help
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 9757aa18cb..594243c8a7 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -23,6 +23,16 @@ OPEN62541_CONF_OPTS = \
 	-DUA_ENABLE_HARDENING=OFF \
 	-DUA_FORCE_WERROR=OFF
 
+ifeq ($(BR2_PACKAGE_OPEN62541_ENCRYPTION_MBEDTLS),y)
+OPEN62541_DEPENDENCIES += mbedtls
+OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=MBEDTLS
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL),y)
+OPEN62541_DEPENDENCIES += openssl
+OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=OPENSSL
+endif
+
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
