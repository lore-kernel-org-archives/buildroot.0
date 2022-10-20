Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6316FC433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 12:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F24C86FABD;
	Thu, 20 Oct 2022 12:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F24C86FABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lwo3v-LL804z; Thu, 20 Oct 2022 12:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1616E6FAAB;
	Thu, 20 Oct 2022 12:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1616E6FAAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE04F1BF32A
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 12:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9728C6FAAB
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 12:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9728C6FAAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0ckAJfhKL5p for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 12:19:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A565F6FA08
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A565F6FA08
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 12:19:36 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1olUL2-0002fF-Qd;
 Thu, 20 Oct 2022 13:07:54 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 13:07:39 +0100
Message-Id: <20221020120739.1929645-1-john@metanate.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=h/GAi1iITGysXPKQNMdgpYBssVJ9+u35ICHF35/ifHs=; b=Sc
 S9OIWM5s6rVn7LhLl1cOHaMlHesOgKMJlKOucdMsdIImeeMNn22xWU91vAXUQFnzTPsOr8UYxt5Gr
 5D18N9OhVh4cZqPbOFU/HD4qVuxRwUcaJXFqBxHnoDkvc4iL+QoUREOgbWsQFD40CrwWvVRvaxQ1B
 DUTv805HaiJIR/Jy4iw7/FqiBKgpENryiOmka+CQ7z3EvgjH+Z70W2XJdV/aLpD2zPmQ2Vedh3WC9
 ElPyIzwje56/zlW4wjuzjGuQnj2a/kzRITw7Mt7TMIDKTtdBW/c/lzjVbNBIMu/Y+RM8psED+2EX1
 uWdSWgDJ/cnF9H3JIHReilWccEPe+hRQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=ScS9OIWM
Subject: [Buildroot] [PATCH] package/sbc: add config option to control tools
 build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libsndfile is only needed by the sbctester utility and the library can
be built without this dependency.

Add a config option to cover not just sbctester but the command-line
utilities as well.  While the utilities may be useful for debugging,
normal usage will only need libsbc and these applications can be
omitted.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/sbc/Config.in | 8 +++++++-
 package/sbc/sbc.mk    | 9 ++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/sbc/Config.in b/package/sbc/Config.in
index f1dbc0ec2c..7e832b1e87 100644
--- a/package/sbc/Config.in
+++ b/package/sbc/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_SBC
 	bool "sbc"
-	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  An audio codec to connect bluetooth high quality audio
 	  devices like headphones or loudspeakers.
 
 	  http://www.bluez.org/
+
+config BR2_PACKAGE_SBC_TOOLS
+	bool "tools"
+	depends on BR2_PACKAGE_SBC
+	select BR2_PACKAGE_SBC_TOOLS
+	help
+	  Build the command-line SBC tools as well as the library.
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 744ce5f895..245ff11ced 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -8,8 +8,15 @@ SBC_VERSION = 2.0
 SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
 SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 SBC_INSTALL_STAGING = YES
-SBC_DEPENDENCIES = libsndfile host-pkgconf
+SBC_DEPENDENCIES = host-pkgconf
 SBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 SBC_LICENSE_FILES = COPYING COPYING.LIB
 
+ifeq ($(BR2_PACKAGE_SBC_TOOLS),y)
+SBC_DEPENDENCIES += libsndfile
+SBC_CONF_OPTS += --enable-tools --enable-tester
+else
+SBC_CONF_OPTS += --disable-tools --disable-tester
+endif
+
 $(eval $(autotools-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
