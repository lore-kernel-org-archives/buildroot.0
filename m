Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C9CE92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 21:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BBB40631;
	Sat, 27 Dec 2025 21:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5aRaXOD9Vud; Sat, 27 Dec 2025 21:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C9C40633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766870577;
	bh=ANQYm3jGbKPCUc++0IIgHwn0WvT91ifiT/PXnG6rjX4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VvqX6cpw2jLjGeJguN1GgVW8xqo1us8aB4LpWqxjU8DrtV9SOObrNSHdjVX6ZiusO
	 B8M254ZeqIJt78wNb5CBbau4P1/IgcCmFGICGgSOQvTxaDNDxrA2DsFF5LrkhrQ8Yc
	 lB4A0wtgtr5IcQguJ8CHfKDKJKZTKxOrjDpLrl2tcUWZAZd3Y6NE+F2CcLUs2kPQYB
	 X05jiwFFTQA50CP6ONOOzocbEquQ+CaYQB45sEBsiz0ydeQXC96mxyPKnxcOlWykim
	 gR/43Rel1FsDqMNot61AEfPNDbJlQaEf1sMsY7GMy7KNGfKOJSKM+6OoynjHRuERlm
	 Xp4J20GQ88CPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C9C40633;
	Sat, 27 Dec 2025 21:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80381B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F283403CB
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL2lCvmLArjG for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 21:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C2F9402F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C2F9402F7
Received: from mail-dl1-x1230.google.com (mail-dl1-x1230.google.com
 [IPv6:2607:f8b0:4864:20::1230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C2F9402F7
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:22:55 +0000 (UTC)
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-11beb0a7bd6so12134616c88.1
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766870574; x=1767475374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xidenS8gktn8EuhTlax+S2s1Rp94TUrovT4aAsN+L18=;
 b=lnlChM4gXAL19zP1fnXoOxNdTA8gx63fdZi2CqImE6W/D5m+j4fucfPs7VEJU6fEOt
 +N63pQS2qbBvE1d3OIN3bUCdy77M7ljrZO2DN3yYdDsVb2fX2vNwRWMsImeN+rJXcSmY
 +ZKOlJVwwS3U9yniJXM/Rhg1KkIyqOFXYubeTG1xwB05ZO80NTqLoOHo1KyH9dST6i8R
 Z146jlns1u+BG6+MaH40EFrPijuHB3aQ7jh+uE4QPPFxVlLhdwRzrlwsIzomwj2jyZLa
 ZF1AviJ9w1f0bPbMziex/h+uJ2prRwWCp3J9WslAZEK8sV/xZczUWfkDAn/OXfJVspR9
 VXcA==
X-Gm-Message-State: AOJu0Yz9ppctjXAC/xtpYP2BvZZX+axCpVlTe57gDf5agqdkcEKXjSzC
 2rDyDCGAJyYpozyXsDlDRQ/1bLPMLRBfRbZtEOTif+2UbyoKaZWX6FgVK8ZsOg==
X-Gm-Gg: AY/fxX5F1F4D1Ba4xqJR0eX0MD1Llylgixk2D0pWgNJyhJCAzik9S08dqfFZtj9AdnG
 lrHPwHAxh1zYJmTjiC8RjntH8fC2n7Kbqcm5psLDuAsvcNcjMJdjl3+cA2M8tkG+QeSO47Enuw1
 Vpbdbrt0dyCOyiuSBfXDV1iUXrFmZUa9sudJuis+ir390R1vDG4GgFGh+NVf3n0mEntaqfPXrVR
 cSIG/bgWtFgr3iI9KCHLEURuGLwadGNZQCAzrUB+KiBPkecqMl6HqPOS8FbomyrpENboA3bPOHu
 WYgI6jgxYUy3mhlxZV14jzGqaC19bnJoks8TSK1+r0MbmivGXEJot01GxKrKOkt22yTAeFdlNTR
 jraSH8O3LLIs+LujwvqR7RB6DvfG3qfCxUe5M/ZTRyenutSswt8JahX+d0oW3MpwKOxVB/zxkuN
 oAYfVtx4TP7TRnH7cy
X-Google-Smtp-Source: AGHT+IFwmz7eal8zh7xXHvvtWfsedB/7oNsJdBKl5vDP7FSBH0MCrAb0E5boP7gyYUcU5ZNZ6C5E7g==
X-Received: by 2002:a05:7022:629a:b0:11e:3e9:3e8f with SMTP id
 a92af1059eb24-12171afd96dmr28663942c88.24.1766870573939; 
 Sat, 27 Dec 2025 13:22:53 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1001])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217254c734sm103676228c88.13.2025.12.27.13.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 13:22:53 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Sat, 27 Dec 2025 18:22:44 -0300
Message-Id: <20251227212244.3098285-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766870574; x=1767475374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xidenS8gktn8EuhTlax+S2s1Rp94TUrovT4aAsN+L18=;
 b=UY5uOtMVhG67Q4yAB23mqz0Rd70SnZL95LT6ksKNAjljQeCH8PMj8TRDKrd0dRGFyi
 kgcTAZs85atMNtGwW247+PGomanTR2U7ejf2EOeiUMs9bTAys23KSh40T9xpj7qvAdx5
 5DQXvj0EvOyzhBdw6ag+Sy8dfpErFwZ4Ih5hmH70pFPUlKuP/4BH3olCCL0wV39Svcz4
 5bk335VKje0U0ZOMXB3Lj5NMGlEmnBzMEhyjheQidYNHxF++95npSuXIfkKT5CnZnE3L
 eEzj4ql3oobqbrFAY+4mD82xhO9YHWcaqXcko4SHGTWPOW4dFdM+F1hnapHlkoP/b9t/
 WvjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UY5uOtMV
Subject: [Buildroot] [PATCH] package/crucible: disable cgo to fix 32-bit
 build failures
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

The Buildroot autobuilder fails when building crucible on 32-bit
architectures (notably i386) due to unresolved _cgo_* symbols during
linking.

Crucible does not require cgo, and building it with CGO_ENABLED=0
avoids toolchain and linker issues while producing a fully functional
binary.

Disable cgo explicitly to ensure reliable builds across all supported
architectures.

Fixes:

https://autobuild.buildroot.org/results/0b59fb382f7a1d9c3644da71e7bd53b6a19418ce/build-end.log

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/crucible/crucible.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index 9b34cc52d950..6f6d1dfab94b 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -10,4 +10,7 @@ CRUCIBLE_LICENSE = BSD-3-Clause
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
 
+# Disable cgo to avoid toolchain/linker issues on 32-bit architectures
+CRUCIBLE_GO_ENV = CGO_ENABLED=0
+
 $(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
