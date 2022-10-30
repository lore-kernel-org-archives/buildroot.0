Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7504C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848BD60A98;
	Sun, 30 Oct 2022 21:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 848BD60A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBxKPNKkWF6G; Sun, 30 Oct 2022 21:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC11560803;
	Sun, 30 Oct 2022 21:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC11560803
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEB651BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A627A40325
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A627A40325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dunQ_OPcMdm6 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:51:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F9A5402B1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F9A5402B1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:51:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h9so13647845wrt.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=euYd3+J/jyCKs9aTx7asq6ITbP5h8QW8dYoOHRnAjME=;
 b=p4/mL/Tfj1Zc6luB+El/074utegeJtGmhh6XeK0IGtLBQanYuO5sbn2y1UX85VLUnG
 FhwLcifph3+0bf7fkhZJluKEkzK7hUKy8ojfB7LA9cJw91errGhH2rCk+yFRgF+yHyhp
 Ogd16HkXEPnK84xmwPaEDs4xhj2oWm7iYuTgOZjPDX4G+7tH+jfzEvOdWJ2ZdWhdyZyK
 qfr33gkYZJl2g5sWK4Nont2jiVApX1vYL0vzR902ffzy8R/q6mRRkK3Fc3ykTse2YDs4
 i1G6qM1y/hzOTpu6PgH1GPaw5yy38mdufMszaNlwXKBNi47eXUeqihSdywQt58QqkN55
 6bVg==
X-Gm-Message-State: ACrzQf1QzYuVdt9mTl0bfwD+u4GL8clGb9gB8AFlLRKl1Zoy0JkS8qwb
 2yoCSKXLbvZze2k2ST+yYvO+gCkl1zM=
X-Google-Smtp-Source: AMsMyM6E3giUfheqvKHacOwlYannjHD7uc/vi9VQ/aLAl/DtK9jAPQxlTyJOG+LotxRQgQXZVEVgOQ==
X-Received: by 2002:adf:ebcf:0:b0:22c:9eb4:d6f6 with SMTP id
 v15-20020adfebcf000000b0022c9eb4d6f6mr6031418wrn.251.1667166660767; 
 Sun, 30 Oct 2022 14:51:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v23-20020a05600c215700b003c5571c27a1sm5772003wml.32.2022.10.30.14.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 14:51:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:50:46 +0100
Message-Id: <20221030215046.461380-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030215046.461380-1-fontaine.fabrice@gmail.com>
References: <20221030215046.461380-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euYd3+J/jyCKs9aTx7asq6ITbP5h8QW8dYoOHRnAjME=;
 b=L8f8a8WH3aA1JTNSXcbYcbxobyMevNvvUYujhzUD78/u+wA5fOWQr1uEZxsyssU7FA
 1gViDEpqTtEJWeSrMz+CwSyRnjl6w56OA5puQZdSJHIOGl8XsakXqu/DcPvJETJsa35v
 MRnefUmgWQjkE7/VrsYlxPjnbWx96tdfK5Ui4Z0Sf7LDu5jeR979i6GH4QufkSIDKOHu
 GSh0dK8fnvTPA3y3iM1e7JxtMmucsU5bbd540tSPRuqghK3x/p198a2UaCAbKysM4Nu0
 be0rN0z/v96H/GIEjACUd4niAFXMHtbaeIK54qkvxEr4AYoZDVExARX4n3SKPiC6nvFt
 FJZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L8f8a8WH
Subject: [Buildroot] [PATCH 2/2] package/exfatprogs: bump to version 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/exfatprogs/exfatprogs/releases/tag/1.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfatprogs/exfatprogs.hash | 4 ++--
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 99f57c9deb..49135b1da7 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.1.3/exfatprogs-1.1.3.tar.xz.sha256
-sha256  3dbd74b60eec18d2c68d57be4a872d7baa4f7d848e669e31159452ef5245b809  exfatprogs-1.1.3.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.0/exfatprogs-1.2.0.tar.xz.sha256
+sha256  56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742  exfatprogs-1.2.0.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 44679c7d60..d755c7a214 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.1.3
+EXFATPROGS_VERSION = 1.2.0
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
