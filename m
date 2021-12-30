Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35298C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E487681361;
	Thu, 30 Dec 2021 12:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lx3c8icTGT7y; Thu, 30 Dec 2021 12:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B82880DA6;
	Thu, 30 Dec 2021 12:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 119C31BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C385880BED
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SLI6PG8Ppxt for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22FDA80C00
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 55F6782DAD; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6969ec0f74a48f8bb37a6ccf8c93907960925fd0
X-Git-Newrev: de562463b035e945b291bb2bfecaccab67dfa220
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.55F6782DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix build with openssl
 and gnutls
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

commit: https://git.buildroot.net/buildroot/commit/?id=de562463b035e945b291bb2bfecaccab67dfa220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Combination of cryptolib=openssl and dns-over-tls=gnutls is disallowed
since version 250 and
https://github.com/systemd/systemd/commit/e37ad765c86d2a763a2d655068dfe59789f18e3e
resulting in the following build failure since commit
e9fb26cbb8dafd28f50a912bcaddb1056769ec17:

../output-1/build/systemd-250/meson.build:1482:16: ERROR: Problem encountered: Sorry, -Ddns-over-tls=gnutls is not supported when openssl is used as the cryptolib

Fixes:
 - http://autobuild.buildroot.org/results/2fcd4ad64b32cc4835866c9d99e05ab8c9bc794a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3b0356ac9a..0b52cc47d1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -115,13 +115,6 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=false
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SYSTEMD_DEPENDENCIES += gnutls
-SYSTEMD_CONF_OPTS += -Dgnutls=true
-else
-SYSTEMD_CONF_OPTS += -Dgnutls=false
-endif
-
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 SYSTEMD_DEPENDENCIES += iptables
 SYSTEMD_CONF_OPTS += -Dlibiptc=true
@@ -230,13 +223,6 @@ else
 SYSTEMD_CONF_OPTS += -Dp11kit=false
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYSTEMD_DEPENDENCIES += openssl
-SYSTEMD_CONF_OPTS += -Dopenssl=true
-else
-SYSTEMD_CONF_OPTS += -Dopenssl=false
-endif
-
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SYSTEMD_DEPENDENCIES += pcre2
 SYSTEMD_CONF_OPTS += -Dpcre2=true
@@ -491,14 +477,26 @@ else
 SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SYSTEMD_CONF_OPTS += -Ddns-over-tls=gnutls -Ddefault-dns-over-tls=opportunistic
-SYSTEMD_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYSTEMD_CONF_OPTS += -Ddns-over-tls=openssl -Ddefault-dns-over-tls=opportunistic
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SYSTEMD_CONF_OPTS += \
+	-Dgnutls=false \
+	-Dopenssl=true \
+	-Ddns-over-tls=openssl \
+	-Ddefault-dns-over-tls=opportunistic
 SYSTEMD_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SYSTEMD_CONF_OPTS += \
+	-Dgnutls=true \
+	-Dopenssl=false \
+	-Ddns-over-tls=gnutls \
+	-Ddefault-dns-over-tls=opportunistic
+SYSTEMD_DEPENDENCIES += gnutls
 else
-SYSTEMD_CONF_OPTS += -Ddns-over-tls=false -Ddefault-dns-over-tls=no
+SYSTEMD_CONF_OPTS += \
+	-Dgnutls=false \
+	-Dopenssl=false \
+	-Ddns-over-tls=false \
+	-Ddefault-dns-over-tls=no
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
