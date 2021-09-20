Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F0DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:24:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0C8B61205
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0C8B61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2C4C4029C;
	Mon, 20 Sep 2021 19:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eq6WZPX7oB80; Mon, 20 Sep 2021 19:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7DFF40364;
	Mon, 20 Sep 2021 19:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BCDE1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BAC680F32
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Mx_q2w9oyQa for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:24:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AEDA80F2D
 for <buildroot@busybox.net>; Mon, 20 Sep 2021 19:24:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w17so24599772wrv.10
 for <buildroot@busybox.net>; Mon, 20 Sep 2021 12:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=It09X1waNKaeNmy7nq/K1GUwB/VmXy6xN/IjRh0xsac=;
 b=Kb1CNNexqHe+QZ6IIPQie8smmG8y3XkCMoEdq3pbNLQk6A5z7aVEdfIY/nymEyFMvT
 F2gPqH2qBSX6H92nV4vPLbfXYsf+SchUKflkND7BhA1P7kaRzIz8RRyjGSWLDrwNNItM
 CbLy6vZ7Bei/BE3Xim4VeLjd0TeGaShuqiDc2ljhT1oS8Yakw70npEAnfoC4/AVXETxM
 DgmV1X5rDFepoiarIqAP2JbadP7TBQWbzN4DFHVpTjJuz4Zc7OccE2/GcGUg8y7Sfo12
 E3BBvPad9/q+epmFTysTWF74rSBHpOhHwxPqn0zETVQNQAETFSHpZ+VsJxYNlP1+6PLe
 cesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=It09X1waNKaeNmy7nq/K1GUwB/VmXy6xN/IjRh0xsac=;
 b=FLFhk3GFT094rH2qD1azFtAXxDA8c6ugVZ4dEzozZEjOQzmtCTJsHlKi1+j9IFa21A
 URpCQTj8ekx6H7sGZVl9cJy4L3+i6bPNdEfmo2timRiA+J8YKruI+PUtRhl3y3AA9sA/
 eBNn8aQY/9KzHq31fFxUBlQM0S2slUn+3SggP4arqau5ugZY/3n3L4LaV/XdNiEWsqAO
 O/WwnyTqa3kn5pSxNaMW5oIQ0dCopmF5fbKyR5Hs0E/8fsjSdCDX8D31uS0q02+HnYro
 ugC1vq1gaKqJ/uYUrKASKEm4+XN0NWdgtLP7CABkD1AMNnZEqLxuWty+p5mOPOqARnEH
 jtOQ==
X-Gm-Message-State: AOAM5318bFtGDsfycfoUK8sRmVgIbapqaHteJZbY4uFWBKvu+5dzHIVm
 46P9+hgs1/x2ZgU5vwSj1IhFw+ZZMUI=
X-Google-Smtp-Source: ABdhPJzvM/gfAg4/v82MUCDd9R1OqF9bwir6XBUeIuliNP8F/RpJOCosKJocmQwqFLQnFTOT9oBHaw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr27914846wri.74.1632165891243; 
 Mon, 20 Sep 2021 12:24:51 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g131sm408733wme.22.2021.09.20.12.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 12:24:50 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 20 Sep 2021 21:24:42 +0200
Message-Id: <20210920192442.2784967-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mstpd: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mstpd/Config.in  |  9 +++++++++
 package/mstpd/mstpd.hash |  3 +++
 package/mstpd/mstpd.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/mstpd/Config.in
 create mode 100644 package/mstpd/mstpd.hash
 create mode 100644 package/mstpd/mstpd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 50e36de39..d8d077e51 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -967,6 +967,7 @@ F:	package/lsqlite3/
 F:	package/lua*
 F:	package/lzlib/
 F:	package/moarvm/
+F:	package/mstpd/
 F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
diff --git a/package/Config.in b/package/Config.in
index 4d323d440..5f4960bce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2208,6 +2208,7 @@ menu "Networking applications"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mrp/Config.in"
+	source "package/mstpd/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
 	source "package/ncftp/Config.in"
diff --git a/package/mstpd/Config.in b/package/mstpd/Config.in
new file mode 100644
index 000000000..5fe585977
--- /dev/null
+++ b/package/mstpd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MSTPD
+	bool "mstpd"
+	help
+	  Multiple Spanning Tree Protocol Daemon.
+	  This package provides a user-space daemon which replaces
+	  the STP handling that is built into the Linux kernel Ethernet
+	  bridge and adds support for RSTP and PVST+.
+
+	  https://github.com/mstpd/mstpd
diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
new file mode 100644
index 000000000..7fb88c898
--- /dev/null
+++ b/package/mstpd/mstpd.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  91a1862548b5b509caa2e96e5fb9912bc98d4d58cc98e99a577824735756c14d  mstpd-0.0.9.tar.gz
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
new file mode 100644
index 000000000..0e5c9714c
--- /dev/null
+++ b/package/mstpd/mstpd.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# mstpd
+#
+################################################################################
+
+MSTPD_VERSION = 0.0.9
+MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
+MSTPD_AUTORECONF = YES
+MSTPD_LICENSE = GPL-2.0
+MSTPD_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
