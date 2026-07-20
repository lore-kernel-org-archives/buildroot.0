Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C19C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0EB80CE8;
	Mon, 20 Jul 2026 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnVP3oJj714F; Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9862180CCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559768;
	bh=6uRupru+zjEwEEDxfBaCXurKQxcyEx2yhiYMUHTzs2Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imKjjcBW2M28Ya1JXMFwhLVn7ghlQHR2uheAlhJfmABSjV4c38OSeDJfsmE4gMJQq
	 a5DhnP9YWOXl8+8jhsNK11VPh/LsXux1fNlZCi/wGV+UY5hM+S38hYM65ykO6jXyMR
	 EtGAVrVoHWWE17JtemHk43VTCh9iHyRgBLNj/4uGJmcVmOy6zh/6BgLGivSF8Fz0Ns
	 5+LLTd6iyRy3DSlGITJwFFtcRJc3gk5soCiSXpLFQjg7LoPMZDBIMNFhZ6cojPuUVX
	 dX2/D80VL1cvkUQJLln4pqW7fpZopnymWYzIQvRzrezry/gOE01BsNYBahyuwRIaNG
	 m7mV9sxi0AjlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9862180CCA;
	Mon, 20 Jul 2026 15:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A66D3206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C7EF80CB1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juq8FDl6z-aN for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9364B80CB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9364B80CB0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9364B80CB0
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47362928f65so9285188f8f.2
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559763; x=1785164563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J3iQNU2tSO1i3D9XMDUphXYd7AdCAup/a6gzT52NIj4=;
 b=C4S4c5lqx1N3GCfdULNh6h7BpyMIobG3x3M18a0/FogV/DK/MnmzS5GOgsxcfWAG7m
 h+TB+bPZeSJBqSoVlU4cby3WoFPPQ+x6iEEC9AHHsHL7EV0qrNZljTVGe5VYUjOdLOpO
 VHR3CbUfVqRm+YP60BkbZcv1nmLqFKhIJqhq6x+GaH15xIQPhld+xa9wKQ7Pnq1u3Qxi
 GqIMdtl/MX+kWlSaL7bAW/TOm5D4CTVHKKSoEi2SK2L/G01R9ImJAL9Icb6l7faxKxFJ
 EQ6+OUJd6XtbLLGlIc4TnxI+kIZNSK/+PiDxLQatHB8m8n92ZzHgqr1457YbmpSuZPrf
 e5ug==
X-Gm-Message-State: AOJu0YwU7T4zt3jCzFFn6vKoawCT9p+Jw4LEYy+SxR2TM9+GBZXHY6g5
 SFJFIH5t4YkWVIA9o83AeG7cc5GoikrpmPK8OBYb2bxPcAHh6ozoZuVvtNP1tg==
X-Gm-Gg: AR+sD13QK5zB9glTF7Iq66DppGmVGlLlLG2w9puVWHbqAy89X5GDSQ2OxoOka3r/1+y
 y41J5UAuekMRYg+LqHfvokdoPqNYR8iEGx6TaJIaGIYsXVhvQDmvcsMUkZyqQBigmExGg9vR46p
 nq7gLPYDIqBO9JswURq3UZrSvZHRTPx6egQCu7TOoRZv4rxlqzzTMLynsUgnP1kIYZ+0DF5NGcU
 Evk9bEeU3k3usjJngMZPCv3RSWPNZaphXwyjbxnKwnLnh0GbTo0GuSYqWhw9xxV+Vcl7PK6v1gJ
 7TNg/dow43miFHBa2MnHgD9e+H3A7XjBVD7+0KN+d/HH6+LmZ/9HSZTvdiO3t17YZpyqiHnF4CQ
 IfFi92cvynef+kN+7vjJcr2Z0A31lcgYHkSzHAXBHmbDuf/QbFiKTZWA0F66lhlmGogWTu91xxn
 jHfB/CKCI31uTMKh9hSSiu9mhSlaAc
X-Received: by 2002:a05:6000:1867:b0:47d:f445:9490 with SMTP id
 ffacd0b85a97d-47f623456afmr18106456f8f.60.1784559763192; 
 Mon, 20 Jul 2026 08:02:43 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:42 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:28 +0200
Message-ID: <20260720150236.243961-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559763; x=1785164563; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J3iQNU2tSO1i3D9XMDUphXYd7AdCAup/a6gzT52NIj4=;
 b=Caoa/Z+BejrTrXUOAxPjaX2nrIJW5gtz12VxHZhxmGnUG4EJlpAYTDfi/gf8uJNKi3
 YmR9abJ8mREM8v5BmApvGdk6BDB4evjwtoOn3erxDNRRImx/4ZwQsoL2hlrx2MxLRjhg
 w/on8xj3RfXlC+eTE8x5dQHmNwtDPYv3uC8ZfM9U/zlWg78V7E5tYgfNIk4k1qSCDCxC
 EF18rNy1XGhyfutJN55+vBe/hngXFTQ0LmqgVTDk7T3jCW2FvuGIL5mCJIcvCeoHVda6
 Eaj1DbHRc6d3JLS+BSM6tAK5OzXoFSiVQFEEMll8nYOk2fiomCVGm2Flvc6Z5QZyXw9N
 IP1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Caoa/Z+B
Subject: [Buildroot] [PATCH v2 1/8] package/qbe: new host package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS           |  1 +
 package/qbe/qbe.hash |  5 +++++
 package/qbe/qbe.mk   | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/qbe/qbe.hash
 create mode 100644 package/qbe/qbe.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3530d515a..23c95db6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1177,6 +1177,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/janet/
+F:	package/qbe/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/linenoise/
diff --git a/package/qbe/qbe.hash b/package/qbe/qbe.hash
new file mode 100644
index 000000000..2250c493a
--- /dev/null
+++ b/package/qbe/qbe.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://c9x.me/compile/releases.html
+sha256  a6d50eb952525a234bf76ba151861f73b7a382ac952d985f2b9af1df5368225d  qbe-1.2.tar.xz
+
+# Locally computed
+sha256  2b026a9038be00b1102da922775ffea4857ea755f63694efc36dcbcbdebf23d6  LICENSE
diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
new file mode 100644
index 000000000..a6e3e4d57
--- /dev/null
+++ b/package/qbe/qbe.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qbe
+#
+################################################################################
+
+QBE_VERSION = 1.2
+QBE_SITE = https://c9x.me/compile/release
+QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
+QBE_LICENSE = MIT
+QBE_LICENSE_FILES = LICENSE
+
+define HOST_QBE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QBE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
