Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B765AC02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 11:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 693C18222E;
	Sun,  9 Feb 2025 11:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgv1MJgn_ELl; Sun,  9 Feb 2025 11:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72F2F8222F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F2F8222F;
	Sun,  9 Feb 2025 11:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE86C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE3048222E
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGZHHKBmdP_4 for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 11:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 330688224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330688224A
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 330688224A
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:37:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dcf8009f0so859366f8f.2
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 03:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739101065; x=1739705865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTm6OT6KH+wnMGEpjdzqnxTX7PcROzyPAtSBnkTJzbg=;
 b=hbJ3SA4D+2To4dmfwDsojCtdO00XgNNaj9/bVITQi4cmpqKhXtOzZdH7oSq07wYZTe
 V8WcVJBLQb4Czh5gY1dcaI4beqDvW0A5glj32Lbx9mbNru268PKwBlReWvcuZCthZd0D
 boJ1D9Ao+G9Ih+p86cIizRDwkWI1ZbJF7WcaebiMDwqHW12VznURNDHYvH2fkXljONQ8
 lethnIa70iXjskhKd7P1M9i1P4sbP1+E2uRtKsJ55Bq3QAkkham8tMUrbOS0mBh9IXu3
 gM4/UmCBxS55aRyHAVObG54y1Jwp+2WFfbvi9DP78AqXn+7QyXXj2hxNvu/mjT1+XxKm
 f2fQ==
X-Gm-Message-State: AOJu0Yw3ECkAHcbKo85TkC3eIAQbyQdINwbQvfrjgVlporgSb5ASpMfm
 mYgytAtCXfNNItHVUaMD92iRrR/Bsnl+1Qu9gBQMhLyK2Qly8nypa0LhRw==
X-Gm-Gg: ASbGnctfS6uLEo4RuETBmY554z9IT3M+VWnHWbrp01BPiD4uAA1HrKCTcAzdWthg9BB
 R3SpgMqrU0xkxlrAEdqwy0sAeXvfRmbr4I0Osf7QU1SwRwmLCywQBBfSl5zkwNBfXMdfTPp2tgF
 mE+1/J1rfmjLs9uCWjdfnPi2EYJIVAyGcGYVeT+JFkL8hp0AxQN8ZTOs/CXl/yxpSh/AoEtjmFB
 g9PD0lT7wOymBXki+xZEUfEu+ZPGduePLJp5pe/7oRnI223IBDM8z+sRND7Es18SMfqv6y3Gc/C
 VZnRYkGA/ONZ7bdzcWFNXb3GoA==
X-Google-Smtp-Source: AGHT+IHpDStsAOlyE+kk23qoBvT7Mj9RMWvb7BVHDCm+e5VdcZHuJFV5lsDhKJI7xZQYvgeBdU+itg==
X-Received: by 2002:a05:6000:2a4:b0:38d:da2d:ffeb with SMTP id
 ffacd0b85a97d-38dda2e0105mr933157f8f.11.1739101064851; 
 Sun, 09 Feb 2025 03:37:44 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc53ae9c0sm8082326f8f.101.2025.02.09.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 03:37:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Sun,  9 Feb 2025 12:37:43 +0100
Message-ID: <20250209113743.3528243-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739101065; x=1739705865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=VTm6OT6KH+wnMGEpjdzqnxTX7PcROzyPAtSBnkTJzbg=;
 b=RE0nwKvHRjkmsWDlWjBO1NVQkQdKIJKhzRgj5Oy7Hw46uxFC3O25C3FlD1ae12QLew
 Nb8UoKLYYw4maW2WrxNon4lj33322X3b/MKW4HtwluBxz5qlT/AhF9r1kMn+y7KQGRMJ
 Iyw4AjTv7O4HNMNS71jemMaP4ITv10ckAwwlmZ4eN9MIE8MXcxEuwR7zz1zVGkAcHghJ
 7qhm9G4CpiBp7GoaJflt5VYlFT0bgKTOeeGcqOmCjOvG7C8k+/OY0ie7FheMELz9XC2+
 yw5xbmRAz9C1ONxRF25z6tXT1aKE5gOpD9qBgfj5yMUafwh9sSWU+2nB4c5zi/l9supC
 l6wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RE0nwKvH
Subject: [Buildroot] [PATCH] package/zstd: drop sueless check-package disable
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

Commit 52154e52069d (package/zstd: build multithreaded library if
supported) added an override of a ppreviously defined variable, so an
explicit check-package exception was added in 0f0e913f10ca
(package/zstd: rework build and install). Eventually, in 253a951c4fe7
(package/zstd: fix build without threads) the variable override was
removed.

However, the check-package exception was left out during the rework in
253a951c4fe7, so it now excludes nothing.

Drop this exception now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>

---
Note: I left the line empty rather than remove it, as this makes the
code slightly easier to read now.
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 575bb2c838..bf04b4793c 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -72,7 +72,7 @@ else
 ZSTD_OPTS += HAVE_THREAD=0
 ZSTD_BUILD_LIBS_THREAD_SUFFIX = -nomt
 endif
-# check-package disable OverriddenVariable - override intended
+
 ZSTD_BUILD_LIBS = \
 	$(addsuffix -release, \
 		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
