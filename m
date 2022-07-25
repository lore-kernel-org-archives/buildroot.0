Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DA3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601AE84C5D;
	Mon, 25 Jul 2022 15:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 601AE84C5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2nlM7gUVrRP; Mon, 25 Jul 2022 15:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8816C847FF;
	Mon, 25 Jul 2022 15:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8816C847FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F11BA1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C71C6415E6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C71C6415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtEe499wuCvm for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:25:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F19410E4
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0F19410E4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:25:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 6EE0B240014;
 Mon, 25 Jul 2022 15:25:31 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Buildroot List <buildroot@buildroot.org>
Date: Mon, 25 Jul 2022 17:25:19 +0200
Message-Id: <20220725152522.1579992-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
References: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658762731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETwRikL1Jhza9KJ/hv6sDM1buFmopie4qDfIVZn9Ujk=;
 b=c4JJZqY04rmrssY8/rfxD3Yoo9NIrGcVWb9ngRH5hAT6nnVpkog+KLZe3/y02pgcfmFi23
 HTYRc35NHa2hJx/67Lg0fW6CtLGPBIJ/k5dNqxgN9ycQPIoOHyH6UBE5AYlS+vMxJQcWn7
 8rL5uI4sfngsW89vJuvIwbp3a2o4vRrxNDfpv15TnptiO2jHrScc410116VxF3tHfACU/Y
 fLCJdvDZCazLpBJbVjDpBXt1hZTGyYDuAsCbe1RDfb6Z2/mdFgLDWwRKYoAB3ceUK7/zKk
 0nN6ivPuT8Kzc/qS0gcFOXS3/o2xvAdT9A4GTYiBj7bIseBzuj0IFRMJ1wuEGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c4JJZqY0
Subject: [Buildroot] [PATCH 3/5] package/pcre2: add pcre2-16 to the host
 variant
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed by qt6base, and it is not worth creating a hidden
host package option for this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcre2/pcre2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 043f6d866f..06a0afc9b8 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -28,5 +28,8 @@ ifeq ($(BR2_USE_MMU),)
 PCRE2_CONF_OPTS += --disable-pcre2grep-callout
 endif
 
+# needed for qt6base
+HOST_PCRE2_CONF_OPTS = --enable-pcre2-16
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
