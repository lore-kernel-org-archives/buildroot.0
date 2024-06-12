Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629F4C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 09:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFDF740605;
	Wed, 12 Jun 2024 09:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxb9xhvnSDLo; Wed, 12 Jun 2024 09:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1E0408C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F1E0408C0;
	Wed, 12 Jun 2024 09:48:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 477D41BF3A9
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 09:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35C5E60761
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 09:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgEqbbKHZ3To for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 09:48:07 +0000 (UTC)
X-Greylist: delayed 948 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 12 Jun 2024 09:48:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58EDE6059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58EDE6059D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.71.1.220;
 helo=relay-b03.edpnet.be; envelope-from=dev.kurt@vandijck-laurijssen.be;
 receiver=<UNKNOWN> 
Received: from relay-b03.edpnet.be (relay-b03.edpnet.be [212.71.1.220])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58EDE6059D
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 09:48:06 +0000 (UTC)
X-ASG-Debug-ID: 1718184732-24639c182f3878870001-rUBnyj
Received: from srv21.vandijck-laurijssen.be (77.109.96.193.adsl.dyn.edpnet.net
 [77.109.96.193]) by relay-b03.edpnet.be with ESMTP id gAy3mvfwze81uEuY for
 <buildroot@buildroot.org>; Wed, 12 Jun 2024 11:32:12 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Apparent-Source-IP: 77.109.96.193
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be
 [IPv6:fd01::1a1d:eaff:fe02:d339])
 by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 128E25A2379;
 Wed, 12 Jun 2024 11:32:09 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 11:30:57 +0200
X-ASG-Orig-Subj: [PATCH] bcusdk: fix build without libxml
Message-ID: <20240612093118.22195-1-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Barracuda-Connect: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Start-Time: 1718184732
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1572
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.126144
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=vandijck-laurijssen.be; s=default; t=1718184730;
 bh=f9CXLGw2kbof7pEO8vz9H3WAaEaz0reGP7WAJ0LFXY4=;
 h=From:To:Cc:Subject:Date:From;
 b=rqsuP5vkpIK88kvuUu1scuouxcKkE46zJCBmvz4c2bpVG8syxaZYAp2I7BHk2cnjC
 USKOM1y6B196lASvBEWCHTpgb3EfTabNCaRLwKKMt9nbaAPvE7LTLxKzRHfCuG9c4s
 WQhCe3mLl8J8tY12C+OC39I0mWe+SyEUSVxGM7XN842NU/3FLk5yNRxPFEqBobIuOk
 RDHgT+rjPxgkIZac+RLSAg8f7lW/1kt3H8GLSGj74i7twlWenAtty9SoDA5NQH/EnL
 rY9nfZA1m5tfs6EOK5kmcL3/oIDALsp3u0PJBQZ/+h69vk5TMkqLZlhTWaBkEJgPlu
 qsawWM0ZjcaNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=vandijck-laurijssen.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be
 header.a=rsa-sha256 header.s=default header.b=rqsuP5vk
Subject: [Buildroot] [PATCH] bcusdk: fix build without libxml
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
From: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Reply-To: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bcusdk is configured without libxml.
This commit removes the autotools libxml dependency.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/bcusdk/0003-remove-xml-autoconf.patch | 11 +++++++++++
 package/bcusdk/bcusdk.mk                      |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 package/bcusdk/0003-remove-xml-autoconf.patch

diff --git a/package/bcusdk/0003-remove-xml-autoconf.patch b/package/bcusdk/0003-remove-xml-autoconf.patch
new file mode 100644
index 0000000000..33ce45fe12
--- /dev/null
+++ b/package/bcusdk/0003-remove-xml-autoconf.patch
@@ -0,0 +1,11 @@
+--- a/configure.in	2024-06-12 11:20:16.800828493 +0200
++++ b/configure.in	2024-06-12 11:18:19.275693151 +0200
+@@ -81,7 +81,7 @@
+ 
+ if test x$onlyeibd = xfalse ; then
+ 
+-AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
++#AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
+ AC_PATH_PROG(TAS,[m68hc05-as],,[$PATH:$bindir:$prefix/bin])
+ AC_PATH_PROG(TLD,[m68hc05-ld],,[$PATH:$bindir:$prefix/bin])
+ AC_PATH_PROG(TAR,[m68hc05-ar],,[$PATH:$bindir:$prefix/bin])
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index f14b23c7cc..c572df725d 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -23,6 +23,8 @@ BCUSDK_CONF_OPTS = \
 
 BCUSDK_DEPENDENCIES = libpthsem
 
+BCUSDK_AUTORECONF=YES
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 BCUSDK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
 BCUSDK_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
