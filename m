Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5716CC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 05:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FFB76080F;
	Sat, 13 Jul 2024 05:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBTaGwr4Gagv; Sat, 13 Jul 2024 05:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 300E260A59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 300E260A59;
	Sat, 13 Jul 2024 05:42:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62BE01BF847
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FA4E4022D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Epzl4VpNYWRF for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 05:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20ED040175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20ED040175
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20ED040175
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:42:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso349105466b.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720849363; x=1721454163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wty4Zjcl5aUu2FP6GmQEWKRsPRM9Rz0jEduyvWcwrE0=;
 b=MLW+XlGw7/nxulez7y93rVyrYWuu16NA97A6hZKoc4Y5EZJk79BI+02HfP3U2/2Tkz
 Iia/hK+nq6kulAVJv4+kH0IyaSLWk4WY9wG+3Y7mp4NgVOqids8IDfC/jzuU/ihNK3WG
 Hm1kNukeiU/sjIRdL6u573x2HiD3CJvwOKDE9+ym9LkP/MpMw9TIhWkLW0zeQExAgyRU
 w5Zckk30cL+uuzohgbBZ1JyJEPQYFetn9kuBc/a4sw96rcXflhunFsV/kqBfFN2HzHHr
 Url2XnvD9pUnV1RoGw0b7cyqSHGJEe3z7z62nc2BmhLUKOFQK6S7joEOC3GKLFslye9K
 POmg==
X-Gm-Message-State: AOJu0YzsXE4Y19ob5jhNVsXfZ13/3QDH7jJj4IYrJ3VpwQIAH2nU8JyG
 wkEMpqoe0Q9X15xTLb0fS+3SqzSmNRl5SZYnAGxazgEzLHIMI4k+ez3Psg==
X-Google-Smtp-Source: AGHT+IHe/9S19lNJrrGPHXACgOjKiPbW6cqn/twGuL0dEb2rMyFcqlEJHcV48js79xtKHmWOQNCkOg==
X-Received: by 2002:a17:907:7da8:b0:a72:4320:19f3 with SMTP id
 a640c23a62f3a-a780b70088cmr1197972966b.39.1720849363175; 
 Fri, 12 Jul 2024 22:42:43 -0700 (PDT)
Received: from hthiery.fritz.box ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7f1e5asm19866666b.109.2024.07.12.22.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 22:42:42 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 07:42:15 +0200
Message-Id: <20240713054213.228070-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240713054213.228070-1-heiko.thiery@gmail.com>
References: <20240713054213.228070-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720849363; x=1721454163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wty4Zjcl5aUu2FP6GmQEWKRsPRM9Rz0jEduyvWcwrE0=;
 b=ZOxJoZzaZRcJ7v2XZODSAvzfxnw27uDCcQ01EkrE1/hC4edQGgKvmi53g7tLooxyt9
 D9QE+W+YJo/YBRmmss5acyNw7lD7S16GEron2EWfN8PMyDvZ5ImnqUNwIuQCjv29PbA+
 zIWQt1uFHE02E2rRAQNcjm7HAuQkI80BWVZFkDgX0sXCKXnby1IBH/iMK2rZEvJ8R1m4
 bCKT3arjD6jDynKRJRNSzVoyAOdQ4PK+aL04HRLDfEqk4Hbzg6vPW/PTkxJ6Ju1MLC33
 DOtrXR0Ti8r6pVdQJULv7jsZiryIU2b6XP5iGJve4U3pzrrjVKIKKut1QNuJdMqfusge
 INbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZOxJoZza
Subject: [Buildroot] [PATCH 1/2] package/pkg-cmake: remove override of
 CMAKE_ASM_COMPILER
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Overriding the ASM is wrong and leads to failures e.g. for the llvm
package. Therefore the ASM compiler was overwritten there.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/pkg-cmake.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8f391eb4c9..c7032312fb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -147,7 +147,6 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
 		-DCMAKE_SHARED_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
-		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
 		-DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
 		-DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
 		$(if $$(CMAKE_HOST_C_COMPILER_LAUNCHER),\
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
