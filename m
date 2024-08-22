Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6458C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D59D60E50;
	Thu, 22 Aug 2024 18:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rffNYkWPDehD; Thu, 22 Aug 2024 18:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 849D460E92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 849D460E92;
	Thu, 22 Aug 2024 18:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF211BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69DCB60E50
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjYt4RCSg6EK for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F66760DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F66760DE5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F66760DE5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:22:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4886EA4C2725;
 Thu, 22 Aug 2024 20:20:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCQU-0000000060E-2KP0;
 Thu, 22 Aug 2024 18:20:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:20:46 +0200
Message-Id: <20240822182050.65230-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350851;
 bh=hDuaWHUTYpgi4E8JEPG3FMlXfDe9OdMsUmxfNLjNjOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bOQaDVw9zdXCMOJVDVqdGIXcPJeDblbjKUYCbboZSi+uBkmcasBqpPyXdi1P27EVL
 Q8LfiIlkeDX7GwhrS7LQmxp9k5VSsvOOhc9qDG3W7izu1CDgzt7k0NjPRKDpHfTJsO
 IeCki/l86nkifQ2xuArBD3SvYRSBbIUuRgAYtilJ1OP5EX32uGY1VQRQWhto+CVwZ1
 GFBqiiVk0uahsAAQMqftbqoyHpPAdR0EwOsJRI+ay07TWpElggOvHBvGOGOeLweDmA
 vPYsheva7JFd69qfcfZ+JZvL/FJtCv92/+kuvc/Ia2plK6E6hazv9ZzPTDE5KRMOTX
 wA6pXageJ5JLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=bOQaDVw9
Subject: [Buildroot] [PATCH/next 09/13] package/ccache: bump version to
 4.10.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://ccache.dev/releasenotes.html#_ccache_4_10_2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 744e167489..6624fdef65 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  3a43442ce3916ea48bb6ccf6f850891cbff01d1feddff7cd4bbd49c5cf1188f6  ccache-4.10.1.tar.xz
+sha256  c0b85ddfc1a3e77b105ec9ada2d24aad617fa0b447c6a94d55890972810f0f5a  ccache-4.10.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  de4684f5251a0a2c58f3a7ab94d6a8d3443822cbd01abcdadd9250d3d1e0bfe1  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index f727ca04bd..f3f675586d 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.10.1
+CCACHE_VERSION = 4.10.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
