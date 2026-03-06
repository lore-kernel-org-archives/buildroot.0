Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C93BF0181A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 09:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEB741C62;
	Fri,  6 Mar 2026 09:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR78viYhe6lS; Fri,  6 Mar 2026 09:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEA3A41CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772789720;
	bh=yCajg9UNV2AgQkb45WWEs3BY4Qjo7zBzoRLe/Cwox4o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jeWh/YXRIs57oD54mcVp36I3RErsy8m7YXDp9UbkP6iDhXUN+YB4pn7Fwt+41Sh+Q
	 02WsztLPqgjSXhMGPlfSpBHEwHrX0Gupxnwz6yJHk4vMuCmj4KJcdUs7NxnO3VeZBE
	 tPCn4oU7NW+MnsEVFT5GgWL80SQPaqUm/y4Z58GvCR5ssKjP+7zzviHywS6pi5VS57
	 6Kfr1z7bt+jEHEF3TcCOI9Y/DI9UJOUjW2fZ2paUzzGO8VkQXj3+1WvexWatAebhxt
	 xtUU4IPGSfhiTWeFGQwJzcuHzAlkvkv1JLKcKfJpDzbs9yNSR27Fu2iLV+kK7mOJjU
	 XjnS4Lq+T+6rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA3A41CAF;
	Fri,  6 Mar 2026 09:35:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3F04223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62D360FE2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkM4yPc7p5Ve for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 09:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFA4C60B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA4C60B1A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFA4C60B1A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso80153005e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 01:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789715; x=1773394515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PS8Y20NKwYgvws6VdGT5p/CQ9D12WgWp5kp22JIZ6uY=;
 b=eYPMF5cSB44119bYw+LuukhVpMQ6aWl9JRy6322pMUZwmmq9oy+fpcLzz5plymFJxv
 rRCrCv85iholcNneLZX1hPOTWpY+/xDDgbaLu6j5T+dFaB4KhEnOeJMFS8BZEtDN9OUx
 jjjgGOEt7TIRkxHv4B6ZA1aacsEkqf9yXfeTupA6Mopc+KZ6jeEiKz1kqZmjmc3B/MJ+
 0SwejgRMz1zREp2bnQfSh3gv8SxWXQp7v3mD+toNPZbDuIrOVu6aw2RC2a97E5BQvRdb
 goxJvvqzbsoSShvowOOBbxvQG5laKYrmEIuqgAHOH35IE6K/OY2topEOZVnYYMTL/DxB
 tSUA==
X-Gm-Message-State: AOJu0YzdiiFhvT+0fHQ6QX72nYtJCz9Si3UYfnO6v5f3wHbd3fG2OeTz
 u2fwa+Q8+UVh2ngJS7OWo2BFKKC1iPdp31B3uOtWe2JULWTFLh5NlkAtDEhSDVrWFsPZ2Oh2jT1
 /QLmc5KU=
X-Gm-Gg: ATEYQzykcBapq/F15amXZfjf34/oIvMM4Ohl/JEgbgzblSaJyz4AK4AB8k1Wg4JdSQ1
 Ew4WvimkhcbwF00v6mgKrVasqCnLW41PNBItrdQ0KpxUkPqCpwQUhnGEctdPltWZl8aeJdFfvSn
 suiRO+zWmiNK6ImC+KEoiS/jy8QSyD65bFfwQ913xkZqMig//s1fAducWt9u2js5/AZKuQDQWK+
 NOh2vQv3DLlw/7DATORelO/oZq/ULuXyiVv4ZMnl4Jz/KP2wbS3Stf1zvYsqb/RpKE2IcFpmT16
 pOA9UQnJxuSvUeCg+Q9uX7J9Oq8Zvibfnsv5lxLCvmzsNh6wWi6JRzVQghwo21YJ1roES+cekkn
 nz0J8JMRUVXo3ZbVQwBSH6CIipn/6Z6u2eggAVntP4iU+d3FeiG9ocUtzh9QVteeZzaupOKcDvx
 bn6+2pkxdY3UTkERXWH7y06xhglLYeuRpBJbAs2A4eWHmCQJT87QN6GSqVYeJuu6SU2pmwXu40L
 a6GSQlFgynp334Xqye4
X-Received: by 2002:a05:600c:34d0:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-4852696b8e3mr21984555e9.19.1772789715590; 
 Fri, 06 Mar 2026 01:35:15 -0800 (PST)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276bc6bbsm21227385e9.15.2026.03.06.01.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:35:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  6 Mar 2026 10:34:46 +0100
Message-ID: <20260306093448.707547-2-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306093448.707547-1-dowan.gullient@smile.fr>
References: <20260306093448.707547-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772789715; x=1773394515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PS8Y20NKwYgvws6VdGT5p/CQ9D12WgWp5kp22JIZ6uY=;
 b=ePqIqJyDSB0ILY8qVSyFAuT7zORaX9XvF/r5C32wrwhFTlhBE6HDHbYyawXka36+IS
 q9M3E+bQYZQFOUmfOW0we7qQIN6lP4fRRuxu73Ey/1ebYJzJ4kEJ9EASsCNqyHAtc9KG
 mFX9Kc1DhwsNnk9ZI7fw6bwgmYrPKR5BPctfw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ePqIqJyD
Subject: [Buildroot] [PATCH v1 1/3] configs/khadas_vim3_defconfig: use
 prebuilt Bootlin toolchain
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 configs/khadas_vim3_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index 21a16cc1b0..89bae0f114 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -1,7 +1,9 @@
 BR2_aarch64=y
 BR2_cortex_a73_a53=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
 BR2_LINUX_KERNEL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
