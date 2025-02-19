Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB546C021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917BA4F39A;
	Wed, 19 Feb 2025 08:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id surK_c7h8V0O; Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2928503C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2928503C7;
	Wed, 19 Feb 2025 08:50:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0151968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B3C16073A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VegGjmUJFSlw for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E46060071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E46060071
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E46060071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2874849f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955044; x=1740559844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mgt+jof90VzHPy6kw5jLtt0Iigi7y5PmPHVExKdnbcU=;
 b=XZNGlzGQpzZMlf8+9xFwDCEVJyxf+oMFkq0mJtvk7qGrt00SH2A/eBJBxAnCoUfJY2
 HrRmOjsGWJUc0yVEopFwk1OhnJa8yO/BkyGGnsIwS9/iCTWorWM3yY1X4ZEeAkF7xrV6
 M5r0LRUg/y+HSFeZ7VHi0PTBRznfNe/WRXf6Lfj//OX6h8Oca2phwhq7+To6NUFLJHR+
 CcSUBZqpkggoqVczRZeIutWoF8wVvqt40Bnn6DwHw6ovlUrVso+m36+5zDa9bWYTYvNL
 4eBPesuCLwq8IfXv5LriitPj9pH7rhVpOy8O7l7gpWuP97uJ/EyvLBCwOYZn5fnHX/ur
 hNEQ==
X-Gm-Message-State: AOJu0YzruVdnve9QK5f3LP9myRPdSmwvvjSnqtq6HwfbMnkhhsDBvKh4
 PYiyKNFrU3aNhq1N5yNpz2xdc/o75z9ynljitsLmp4hMNoxaMEqbSmD1hw==
X-Gm-Gg: ASbGnct1gIXGZ0OboLU8KQzkC8nYY7LDu9F4lspvB/EhOQcuCt/8+iMUd2iMx07ASmv
 UKfylpAA3UVHqBBVi4H8KnxcvHUF7uwsFiYqIGgiK181qYgJYN7Sza3D6hP870tDOPun2fGokbC
 a/eEghZrGWO23tn9Dr+ZMHJ24gQpM3E6PjpiudUi2d+wLnURN100YD+bBwrd82K6Bc5Pfg7lxoo
 PsWEj+a5FzrAPEKLs0KoVF1vWSutKx8u6HVrs4WtyH6sNDVDC+5t8tVr35p+NVNaMAakJ6PsLQ3
 t/quwXExruDsDQ7tOZT89cHIqg==
X-Google-Smtp-Source: AGHT+IGk5Lb8Mq1sHbXewfy8HktrecSA9gijVOcHDEIwnfnFj68xS6T8Atqgy3DIr0NIRsDZr/sLbg==
X-Received: by 2002:a05:6000:1ac7:b0:38f:4acd:976d with SMTP id
 ffacd0b85a97d-38f58782b7fmr2015158f8f.9.1739955044425; 
 Wed, 19 Feb 2025 00:50:44 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:18 +0100
Message-ID: <cab587cac1dc59e3fdecc5b8b1a34d36daddad11.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955044; x=1740559844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgt+jof90VzHPy6kw5jLtt0Iigi7y5PmPHVExKdnbcU=;
 b=Kp6e9TrlSBt28b1XRS5yLinI6kNAMXfp2Hs98KRimHAJdpfraYJapmEOr6NIrzJpz5
 9pgwdeFAbimoQ77wl6n/DBaVJfTenOPYyqHhVMEiSvuRVDvHx94iE/c3tzcOYOZTbzh6
 rKSId9Aef4Id9nVsOCTHugjOD33lkPcU5+jIiesY0fNDXB+/mEwvmhhwNQKKiO0YZgtC
 dYu01eqBdyDd676beyDS/AeHbTLDv3/Kntike/VnJsJUF+mqahnV1ouNNO+bv6EHCOQf
 SJ7m6N3iIbIP8npaxrX89tpoBVnKy/Z6pD/VwF1ZMMs8eyoEQNRS8w+AgLk9URcgx4Jz
 0kxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kp6e9Trl
Subject: [Buildroot] [PATCH 03/27] package/dejavu: ensure at least one
 typeface is installed
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

It is curently possible to enable dejavu, but disable all the typefaces
it would install, which does not make much sense.

Ensure that, when dejavu is enabled, at least one typeface is installed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dejavu/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index ca549d30e4..771ec38514 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DEJAVU
 	bool "DejaVu fonts"
+	select BR2_PACKAGE_DEJAVU_MONO if !BR2_PACKAGE_DEJAVU_HAS_FONT
 	help
 	  The DejaVu fonts are a font family based on the Vera Fonts.
 	  Its purpose is to provide a wider range of characters while
@@ -10,6 +11,9 @@ config BR2_PACKAGE_DEJAVU
 
 if BR2_PACKAGE_DEJAVU
 
+config BR2_PACKAGE_DEJAVU_HAS_FONT
+	bool
+
 config BR2_PACKAGE_DEJAVU_MONO
 	bool "mono fonts"
 	default y
@@ -17,17 +21,21 @@ config BR2_PACKAGE_DEJAVU_MONO
 config BR2_PACKAGE_DEJAVU_SANS
 	bool "sans fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 config BR2_PACKAGE_DEJAVU_SERIF
 	bool "serif fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 config BR2_PACKAGE_DEJAVU_SANS_CONDENSED
 	bool "sans condensed fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 config BR2_PACKAGE_DEJAVU_SERIF_CONDENSED
 	bool "serif condensed fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
