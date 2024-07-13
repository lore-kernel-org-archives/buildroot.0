Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AA3C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9478580EF5;
	Sat, 13 Jul 2024 12:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyKc7VlFS6_G; Sat, 13 Jul 2024 12:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D554B812C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D554B812C5;
	Sat, 13 Jul 2024 12:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 391381BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 258FF4093B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCuhV1AWWVi8 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB7BE40939
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB7BE40939
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB7BE40939
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:24:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52e94eaf5efso3452790e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720873444; x=1721478244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vLpnOCjsdyKA85bSEaDW7T6gWVoKXLg01IDlxrbRBq0=;
 b=HoZI33KLVFrQiMnjG4PuiMmEPN4UFSCAPZczzJhXAnKDXHV0HEGq/3fUBBygLfqGDA
 32ov688gZLUanHu/GW7pDYCvGbFEiIftKjRLb9wbqIibWnPolMjVc4x3GfKsvZlRkX4j
 7PEY2g0UCQw13DY96m/c+W/rSslhrtblaicS0b2pykKH6mBT8J+UfvqPttv6Gi/T2GJb
 GgIEqX+9s3nuR3l2ewLGP+zDTn1x4rxMaqIth1cOdY1OgKEsDjm5U8VEIObE7aJ/Z1AC
 OpKfMhU4an5lfTBJKtQmxBCGfR+vYAXCefdWcbeu0Leyr3VibmDjcGXejsXR2LcKcl78
 I7PA==
X-Gm-Message-State: AOJu0Yz8u+TDh58sUiZL21jBIpDqhWdKUU5KyPT5sYcmOlyqPn6cuw60
 rOqnzAqOQAFxKLYdorRco+jXWlo50F6kiH1FV47y9tpK+hr+2dUvU3FLpg==
X-Google-Smtp-Source: AGHT+IFv13kONu1ycGacBzr7oF2pvJ9cfv79G49Hk/0c3R8Ixhz0N97hLwTpubk1uzCZWWaLDUGoFA==
X-Received: by 2002:a05:6512:3d21:b0:52c:ddc0:7a03 with SMTP id
 2adb3069b0e04-52eb99d1feamr10108511e87.55.1720873443822; 
 Sat, 13 Jul 2024 05:24:03 -0700 (PDT)
Received: from hthiery.fritz.box (ip5f5ba0e6.dynamic.kabel-deutschland.de.
 [95.91.160.230]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f621b8sm700586a12.85.2024.07.13.05.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 05:24:03 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Jul 2024 14:23:32 +0200
Message-Id: <20240713122331.298786-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240713122331.298786-1-heiko.thiery@gmail.com>
References: <20240713122331.298786-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720873444; x=1721478244; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLpnOCjsdyKA85bSEaDW7T6gWVoKXLg01IDlxrbRBq0=;
 b=YeDjsDWNxTPzhkdwPsTwTzwWSgpq5ciqhBQMch7QfDEugHGufz9yGlBIwZhjMKNlS/
 PkSSGKqfLnVBUOikVyclb1X0cLHklZTspYrkbrXMKa9uBZAHDYpseYSGIdLNzjaZyU3l
 jWijCmUxP4XDPR8xK2vUamID8j5vfmPR8lksFXowRxL0gsuLvDRi7wA+YnHUobCBfEO+
 9I3J6zWs2V7J7u921bXx+N/tFJfYKABoKh1YuHSoBIvGGqmqx5ymWpxKg4znzjkNHMUS
 Z3ehE0W6UV2oAjpfNdGGgANUYA3ZBOHHb09Lml0O+5D0lLn0v920EqAI055V/90aorYN
 napw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YeDjsDWN
Subject: [Buildroot] [PATCH v4 2/4] package/xxhash: add host support
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host support is required for ccache.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
    - use standard install target for host variant
    - fix typo in commit message (ccmake -> ccache)

 package/xxhash/xxhash.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 7708ba1e19..fde8e464f9 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -41,4 +41,17 @@ define XXHASH_INSTALL_TARGET_CMDS
 		PREFIX=/usr DESTDIR=$(TARGET_DIR) $(XXHASH_INSTALL_TARGETS)
 endef
 
+# we are a ccache dependency, so we can't use ccache
+HOST_XXHASH_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
+HOST_XXHASH_OPTS += DESTDIR=$(HOST_DIR) PREFIX=/usr
+
+define HOST_XXHASH_BUILD_CMDS
+	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D)
+endef
+
+define HOST_XXHASH_INSTALL_CMDS
+	$(HOST_XXHASH_ENV) $(MAKE) $(HOST_XXHASH_OPTS) -C $(@D) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
