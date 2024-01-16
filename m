Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C38C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 06:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7302241A0E;
	Tue, 16 Jan 2024 06:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7302241A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqkFMLTmhWbK; Tue, 16 Jan 2024 06:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D32441A04;
	Tue, 16 Jan 2024 06:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D32441A04
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C87551BF417
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 06:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A056981368
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 06:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A056981368
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ExKb64bZyYI for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 06:58:37 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88A2E8134F
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 06:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A2E8134F
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e779f030aso9400315e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 22:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705388314; x=1705993114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XuhvHlVM6xUrYoEEfr/FUivaxMNXf/3436+NTCmoeu0=;
 b=Z8mzs+JdwngorN4Y7KO7eWIaRL8FZMZJgsI/Sm5HffQ6dBHmxGEn6WF9a34d5bI5J+
 EOO7SbpM85hToHBN9Oq0sENjsQB9oIUV6asMHD6zOUY79hG51kstBWfjw+w5Vyz6wWLW
 S6e1IMFE28ZJP9LEBMjaCNq4SzUzlpMtSDYGodn3l2RcC4auh8MwlvX9ZpXRmE+J6B6S
 oKY0TPB7MX7ThCM8yblK4L6AKlw2utJB+QZ0cfF2rb8g685t1Wr1vLWB5daEp4+bb8tS
 Iokl2P0ix2nv6/VTe/hXSneDA5q2Kh9JHaFO9zoDg1jimI00rH6kf5bjSWGkOjds5yK6
 h92A==
X-Gm-Message-State: AOJu0Yz64yRkEQQB6FEqYSWDskWpBGHZFtePVB0vnLsUi4fypnQPvqt8
 QvFeFuD3l/dyZpCmfTRKOxnW1DE/eJI=
X-Google-Smtp-Source: AGHT+IEIosiTNUQbEz03GSZ2UrsKQt/yyQ6gBiOxo9XyK1TT1mg6XRnKkVwBE2vXsKfIldF/aWu8aA==
X-Received: by 2002:a05:600c:218:b0:40e:62c5:4279 with SMTP id
 24-20020a05600c021800b0040e62c54279mr3096868wmi.104.1705388314367; 
 Mon, 15 Jan 2024 22:58:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-239.w92-167.abo.wanadoo.fr.
 [92.167.208.239]) by smtp.gmail.com with ESMTPSA id
 bd15-20020a05600c1f0f00b0040e7df962eesm4125652wmb.14.2024.01.15.22.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 22:58:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 07:58:30 +0100
Message-ID: <20240116065831.9471-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705388314; x=1705993114; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XuhvHlVM6xUrYoEEfr/FUivaxMNXf/3436+NTCmoeu0=;
 b=HdEKjxAyA7e/zAC7jHVke3ZX/J/bYlDTTxSAV4+qKI8BrDZOdY8O5RbFKYLaGRs2+P
 B+9cZT3jJvXiSdAWLX368IpDRkCqfEvffnPKdwnYfUokhgzCamKW+GotCTtNEt2Uqq0l
 wYqKwpPsq0psJk40yMvRLFn1jZCJO5VXnYj51lp28cs4lswLSGGgvEZoPFuz+tEqLKud
 0EmwoKvtaVVGrRzFoRVDcdhmO0XHiMshrblCK4LrwEjcgY4+YCjFfUnbiBDAhNxFfeXa
 kHd9YaW6UZ2sSYtUJAGMCOtcDl982IAJZ3GhXMJFEF1G0QpTJuoJZOjKuuQaMj5ZL/aJ
 +X4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HdEKjxAy
Subject: [Buildroot] [PATCH v2,
 1/2] toolchain: add BR2_TOOLCHAIN_HAS_GCC_BUG_101766
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_TOOLCHAIN_HAS_GCC_BUG_101766 will be used to fix a build a build
failure on attr and elfutils with microblaze

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index f1f9212f25..dc4e52bb3d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -210,6 +210,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
 	default y if BR2_sh
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+# Microblaze gcc can't use .symver attribute leading to:
+# error: symver is only supported on ELF platforms
+# however __has_attribute(symver) returns true
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101766
+	bool
+	default y if BR2_microblaze || BR2_microblazeel
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
 # This bug still exists in gcc = 12.1.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
