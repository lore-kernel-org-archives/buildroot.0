Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933DCCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CA6830FB;
	Fri, 29 May 2026 14:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgpxUq3LV963; Fri, 29 May 2026 14:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4BD831B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780065079;
	bh=ojBg/F3IxA3wVR0ab+PDmcu+pPnv5+Nf5/2fsWrd+a0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A9LJjAWZbKAIP04KEHT2SI9/dnzGir0iHGHi9c4/AfAY/RY4VP2lHnWVn1kHmAmYU
	 6ErvCaBcXmGxvhN11zqfeYBICAZovvb7gwK6kRqarZs/ItKYOGscj5qUv/Mv7ZTwbL
	 Hl00Ys7pICOGzxO9znKBKU8Gr5enrR6+skBCIM08O/rZooM/DFqT5VFPnQMWRlX+1S
	 66O1DYO9T6sfwElsL9+7MHCzqOiyAzDJtpGjCsU8l+gSKuKgOil4ifwhT/R03dbgzy
	 OLfK7IsHabzSkg2lkTl6HbRUMr4rBnt6a2sHeYQFKuTUxiadRz2rK47P85eKh2yEBq
	 +OFPs6NayhSTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4BD831B0;
	Fri, 29 May 2026 14:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E9B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E725C831B0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuyoWKp7xYYG for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B893830FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B893830FB
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B893830FB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:31:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so406787f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780065074; x=1780669874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqENeUsRb3tsAB7iBivY+UD6y8m/XK5iRVKuCVs7M7Y=;
 b=HyM+CSmgT2FvGghIQ0PpJtWkhbpRUmpcxf3oRiPo+mO5d3fn1WHJTZ583Fij/3WVKp
 r5PTt35H3FR23P6KV05p09EGbI0UOgiFGmMXuXgJfC79+xqXO2fkZqmSkTXxKk+p24ac
 yy1bxkX560nOu8/N0Ln6y4Hbbo5DYOflWkY1Z3hSz4ahkagYsXFkKjjMIhEf4Iqyg1Iw
 je7vaIGcu8gykJsR72xuDwfUfy2PInJS90FPRRPhftdL2WPocjsZPt33Z0Kwhl27kNRX
 ceDtOF/wxNqsmExJrHF8TMHLCaKtv4QvFIYEJRBD/CI3jbr6AEzKpQLgJuQMpQtGwZWW
 rnyw==
X-Gm-Message-State: AOJu0YyCrY0Jq2wZjejFAmh68QGca5fQ1ZNqtaJq/0Xr/Ai769KQ14/G
 BeHcmE/a5oMw6lftXWSijl5sIxi5qP16HB+4R0WUM+Pd2d9s0lQt2g8UPGBFCCimNmYxNHhcj2h
 JfS+2
X-Gm-Gg: Acq92OFJNrVNJD7+/aHYNrOiWpVw4jZg0C1AJ7txSwzoDkHJXu0jNUoip4O/hzdn/Xo
 85PFNTzEFsjdG5gr5X7AWuA8h9q0qg/Q9u5nLwPdvV/Qv7ghotNQWzVtSI4I+pBsOXoD1Pck+lQ
 D44iiVJYEoakD054lD5exjVHh5cZWgeIAzXkYqL55XwU2FidiI8Wbzev76dHPMuPxn/IGNTwE0X
 OVINENh9dCFpBl5sx/0SYaKh7IreOYn63AEMe6j0sxTtQWuHE+FCIWGIiUPMm3L9kIVqo9axYeb
 13k4P7/fv227xHHjHcF1pZgSoUPS7kwybdxWSj3hNtXlwneCXiVoqwC1609PjFm5jr/mL8E5wS4
 bGvDRQ4UXzgJHup3/R+N5bZ1oRvwMukZdLxmxElS5tQVmgc50vcj0sQQgvvL7zitkFbH6NIGY99
 i0kjrf/ywNzBz7q2idoT3elS1MtUQz/crmW2vKIhrLqJeWFNhZsLMdj04nQw==
X-Received: by 2002:a5d:658c:0:b0:45e:f3b1:52d1 with SMTP id
 ffacd0b85a97d-45ef6b16c22mr90808f8f.9.1780065073550; 
 Fri, 29 May 2026 07:31:13 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354bb7asm4046369f8f.20.2026.05.29.07.31.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:31:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 16:31:09 +0200
Message-ID: <20260529143111.400662-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780065074; x=1780669874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqENeUsRb3tsAB7iBivY+UD6y8m/XK5iRVKuCVs7M7Y=;
 b=g8BZW81BTd7Y8SFT3RmWjfayuxwVeCWPp7kF5Wpxab/+kMcC1dWKjEh80GE3fNiIGZ
 QKqCGeB9nsZDII6w4Q4Wxt9gQYHWvfj5U1mF13arahFNJ+gipkP1x2bP41+IDneTPGrP
 tAYIri8Zzeh4fIF10c5EKMU9taTPfoOH+n+T52lt2YNjPkS30uycOUbjcVw1YI8JWI6H
 NyrEiEmHiBBCSjkDtTNI+qUrOIwDy3SVI0xk6OpHyRtJJstrfwNh/u7YgxSbYA/WSNzz
 aENuYL8Na1sgFX15brUbICNij+n99evzOXv1rA+uYqS71arP5c8J3QHwGFk4nCa3X4fn
 rRJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g8BZW81B
Subject: [Buildroot] [PATCH 2025.02.x] package/openssh: add patch trailer
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced a patch to fix CVE-2025-32728.
Since [2] the security patches neeed to reference the vulnerability with
the `CVE: ` trailer in the patch header.

This patch is no longer present on master branch with openssh bump [3]
but hasn't been cherry picked to 2025.02.x branch.

The 2025.02.x version still had this patch present and thus need to add
the trailer to it.

[1] 211e822d43 package/openssh: apply security patch for CVE-2025-32728 (sshd)
[2] 1167d0ff3d docs/manual: mention CVE trailer
[3] a127b7e999 package/openssh: bump to version 10.0p1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-fix-logic-error-in-disableforwarding-option.patch       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
index 2c64ec1910..d068002638 100644
--- a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
+++ b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
@@ -9,6 +9,7 @@ Spotted by Tim Rice.
 OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
 
 Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
+CVE: CVE-2025-32728
 
 Fixes the following CVE:
   - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
