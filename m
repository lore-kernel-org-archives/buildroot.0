Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D35C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A68D883A54;
	Thu, 15 May 2025 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwM3_RcdIljV; Thu, 15 May 2025 21:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D222983A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D222983A58;
	Thu, 15 May 2025 21:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B716C153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 21:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D1E283A58
 for <buildroot@buildroot.org>; Thu, 15 May 2025 21:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8oJoi0f8E9K for <buildroot@buildroot.org>;
 Thu, 15 May 2025 21:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB82583A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB82583A54
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB82583A54
 for <buildroot@buildroot.org>; Thu, 15 May 2025 21:18:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so14632865e9.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 14:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747343890; x=1747948690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTw88GJi02uOe8WL1RXwX4umv/l6v0HNS7BhxQvqtYM=;
 b=X3CcdA0W8qYlE1VxK2999/OuqzRsIiD1/IS0UCuHNdIR4KoUuvQ4WMBeVB+iJwPIeG
 ycajx10iRz3prAlhzDwQJxBZ9DArSR4j2Ec/HeYXf3eOn5+vZJxDQp093A/W1fbK+LX6
 1yOoRbclOb2TCUXaA1mdKQSIMkaaMTQa7Ys6KM4QGOU0jj7q6IBIRMw8L392XsKlxqYh
 PgdtMOBnYbcTBwn1OKe6zEehcWFN/H8M10miwP4wirs7Lhk3hioPIjaluG2piC9CKEBd
 /oQa1YkQqz4oLsleHYqvPbW+0Qixb/OTv/FbnCh8RBuX/GZ8BM6sIFiAufoZMT3Id9lu
 JwGA==
X-Gm-Message-State: AOJu0YwBD5CNGjZa003hU8ZUYcF/p4obq+o/ezEOvMFTQ1wnWt8i3N4X
 /Atrp+ALGr2t2gV8n9xWBqW7DNJ2rq6RnMeco2q2zyuoNJpsX1YtkayIc98Esg==
X-Gm-Gg: ASbGncvT1iJIYAHSYc9HnuWNBAhbBC175dRP3a+SF3lS0aCmiYV5K/aJX5NoJAkasNx
 RzcFCPsObbakY7k/X+thWqo8c14jXWeWJ+2VWOdBn9AHuNZH45G7CczjJGSH6g7fC3RD7h4qHTa
 i0jK2D3AIewccd9kWI1NsZqFHCbfVhztaFZVEjniijTBExIC4mM3fyLZkpwx811v65TCRNWzYHH
 N2USb8EpBjZNtl9LC8IJXvQUZFT8gjcKBZ2ZOh557SIjPZZy96kQkKzwLKnHCw+OjsPs5t8dQ3+
 UqUgaId8ZUfcd2hAyAzJttuuXHsGUP+ublJn2NFtkVHXPZODsOw2nHZsACavHIs=
X-Google-Smtp-Source: AGHT+IEe/kwcw9a7yjgF0Jiu5Vm5X7OTSvl0USO++MjDqAnTye+NqEOpZInME45dLD3v3ZaDECyEag==
X-Received: by 2002:a05:600c:34d4:b0:442:f12f:bd9f with SMTP id
 5b1f17b1804b1-442fd671f28mr8829685e9.27.1747343890273; 
 Thu, 15 May 2025 14:18:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f33691fdsm85712435e9.5.2025.05.15.14.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 14:18:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 15 May 2025 23:18:06 +0200
Message-ID: <20250515211806.1464239-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747343890; x=1747948690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=HTw88GJi02uOe8WL1RXwX4umv/l6v0HNS7BhxQvqtYM=;
 b=mSKuuM/3UmjnCN/Wiqkaq6gFst0Pm9/3sLmMlKuZ0aM4p6v3jHTB4/6sFXqOQ+MavM
 2af8aCQYaTSSJRXjXPgNu+dVw1eVthEg8D4+JUIwYfK+z9JgZ2RiS3h9zTCL5mI0t6pM
 yJsA5DqqfJMdOtnxiap2RskwVbOTRLSynsJkJPRwbW/4Gtw7RgM/fTN7yxPXdhA0A4GS
 4RYbzO2C7QT+CJLo7W9TSQU4i5x15y8aagoTSSTAQHaJz43UiS+H7d6GgyTpmwBGLtmD
 uj1D5jD2aMvfiUvyR8330PhGGPPQBHOBrV/4GjUl4weQBPPZYPRhNqpdlkctwQg7QyO7
 ymZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mSKuuM/3
Subject: [Buildroot] [PATCH] Makefile: allow defconfig to be in a
 sub-directory
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

Currently, the defconfigs must all live in the top-level configs/
directory. While this might be considered sensible for the bundled
defconfigs, it can be tedious to manage in a br2-external tree, where
things could get better sorted and managed in sub-directories.

A few examples:
  - for a given board, a first defconfig is the full system, and a
    second is the rescue system;
  - for a given board, two defconfigs implement an A/B feature set;
  - a set of configurations targetting various famillies of systems each
    running on different hardware, sorted per familly.

Extend the Makefile to look for and report defconfigs in sub-directories
of the top-level configs/.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 411e1de515..c0a41cabd5 100644
--- a/Makefile
+++ b/Makefile
@@ -1218,7 +1218,7 @@ help:
 # $(2): br2-external name, empty for bundled
 define list-defconfigs
 	@first=true; \
-	for defconfig in $(1)/configs/*_defconfig; do \
+	for defconfig in $$(find $(1)/configs -name '*_defconfig' |sort); do \
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
@@ -1228,7 +1228,7 @@ define list-defconfigs
 			fi; \
 			first=false; \
 		fi; \
-		defconfig="$${defconfig##*/}"; \
+		defconfig="$${defconfig#$(1)/configs/}"; \
 		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
 	done; \
 	$${first} || printf "\n"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
