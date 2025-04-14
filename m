Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46312C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 12:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E8C4066C;
	Mon, 14 Apr 2025 12:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzrjgmSGghoT; Mon, 14 Apr 2025 12:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB2D40919
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB2D40919;
	Mon, 14 Apr 2025 12:19:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90DFE108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8201D40A6E
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGxr6MOwYF6f for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 12:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85033411C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85033411C4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85033411C4
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:19:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8A64143B0A;
 Mon, 14 Apr 2025 12:19:29 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Apr 2025 14:19:23 +0200
Message-ID: <20250414121925.1955131-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
References: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheettdetudfftdeugeefieegtdfguefgueehhfegueevjefffeevffekteeugefhnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744633169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GR8ryiRuQ1zXIAWTOz+pjUoZrDKeVB/VM+Y+2x+tSb0=;
 b=BWtxx/ScyzFIOISJja3YNQuJQeBIAHDvXUBBNno7+wqu0O5Hh6ruaKSfCzuYwB4AVVgNNA
 QCc5F9hxZNbGiuZs51XxDD+Nz4oiJBNEJLcHOS6PIxu/ZJAOIuP0rjibhLLAyOAAAhKuBQ
 GU/iAJPKE591yuVGOvAYgdlMTm6fUuZ4JHsPVwADKIaIc+h9a4DuSc5DGlHr0B3iezJqCj
 eo37AMWkAkKZARMCgS2nsNSRPfN34ijJXy/PkhffqrTBH3NiLakB2l7CSTmkkeuj3xWoOw
 su9Oo66OPBHgMGoOLWgzisD5HUvOizAYBi/fvV/V2PiYZVrNSaGYY2TvY+5Jwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BWtxx/Sc
Subject: [Buildroot] [PATCH 2/2] package/libv4l: disable some options when
 BR2_STATIC_LIBS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since libv4l was bumped to 1.28.1 and converted to use the meson build
system in Buildroot commit 41ce1cc690b0837a1822079317bf317ddaeac17b,
the build started failing on BR2_STATIC_LIBS=y configurations due to
compiling code that isn't compatible with static linking.

This commit fixes that by disabling the plugin code and the wrappers.

Fixes:

  https://autobuild.buildroot.org/results/89c6c7c0fd991d777ac7cd2b2322424099fa89cc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index e8bcc2bdfc..a535b8e8a6 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -16,6 +16,10 @@ LIBV4L_LDFLAGS = $(TARGET_LDFLAGS)
 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBV4L_CONF_OPTS += -Dv4l-plugins=false -Dv4l-wrappers=false
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBV4L_DEPENDENCIES += alsa-lib
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
