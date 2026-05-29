Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F66CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C606283BBF;
	Fri, 29 May 2026 09:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syk06ZzUeb_q; Fri, 29 May 2026 09:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B8E842DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047926;
	bh=E8z9xdDhAWs8bSXl04aNBRgarjApRL47VRuuHNfR30A=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=l/5oz/sEjUkDJz41S6BpibxxzSilKXjp2AoeswvN2/Vdv28eLmt9UmeQEO8RxIDcy
	 LyNVdhNEHJY9f+GDM+QkEoUqWmu5NBdexU92StGzBeZZVxoc55Ez3Fr2pWNauWq/Kj
	 xBkD5+mHyrNyYAJWvydRswwJ9naPKPXu5lkyEg5F7zS00Tp2rbQa0Z6pi7hFLpyeH+
	 5ZO87Gy+aWlKiDY7RV0gZIpP0E1XN5iLxWBUqz64P08W8lyG1jQKaLQKLLS9IFG3K/
	 WN48TQfgVi1C6pZW+SGnQ8rsAOIKBSJNSmx9lqvyTGApQHI942SfCGffy8mV2Jxmx+
	 PhN0TIrv7tXcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B8E842DD;
	Fri, 29 May 2026 09:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D356F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E6FA83B56
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mj7y9_DbVT_Y for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BC3383B2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC3383B2D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC3383B2D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4909def6a21so1921185e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047918; x=1780652718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=erG5YwD4V/662pwSeKBk13z7StZJa3qTPHB0zZaOUFg=;
 b=a/Qo8v7dQvWza+b8hLSjUwDMh0Lb7FtQ+OeB6Os03a7JlpDhhYAJSO/LKvNuu7UDR3
 +cdSFlTQ86WIxN5Oklg7CjxElwJZt+o4SDxr1uacLHal+p8NvBeyvIPOic7v3oOHxk/8
 ob3xiwuJtUuBG45Z/sLUARGVyH5sEQ+Nlj7+6lCjn6x5GNxmyXb54vZA/etSNYRwGc93
 U67XcIg80/y0pKWHtY6RZzYx2bLe8Fl/yTfNfUrPYTO9vdggR7wPFJ0hN8t1EHWMhmXm
 KFG5RXnCnzLlFrYyCQUZm1dJTKgDyYhbIx+kNsVyM4AioNk/9oGfIRzHjD6zuOqRsfKv
 iCcA==
X-Gm-Message-State: AOJu0YzPtuBvcWiB30uUYFI0MLlzQZigKKVKCLOMARr8/YVx7HwDA7Bh
 9JTXFc1krD0wH8B0xnajfImVkvmY0eLOX2FEsoIg6Ol4W8lyzHqUM6DFK5hdViygKGjtFy+BHsA
 ICbcL
X-Gm-Gg: Acq92OFB3R1L4ZOYofXZTMRX23HV3ms03nCGL/gaIYnbNCePlJOpDHKMnfCa/XyBrTl
 PiM1hJuGohi0szLYNoeJQBGKPxDfiOKX23w6IMCekyhm5bf7AiZH/7UPO/eCWacwAF5NMxyUu7e
 5C95pZQvl9XCBbeGDNzT1MdFwgNBxsgeXRNdF1tud2R5xNH2iZL7zvlRvW4pn8uBlK+gLdPImFZ
 70QWhjkxTi52ceRueAbphU6oTh0b6x8ludVptIdTuEJLxviNsU43ZskRu9avIrlfghEgFl86xs7
 16mRsgGaEgQCOEmZMOnYpj+TWd1DkbgXCVbqJjozfE9D+vhf/cwMHA1q+t8mvksWdd2rUOaMOHq
 KfRZvAJf901BSZA257FA0EpZkeH849i5NO+yy5ojG8HF4suBjxBPvScTCAPXUJbybQ+eC50/+2W
 0R30BgELSvtXI9obyhzKpsPs0IxpXmDiLnnVy3c8qUDgH5okyjb+36yHemCw==
X-Received: by 2002:a05:600c:5811:b0:48a:5546:61a1 with SMTP id
 5b1f17b1804b1-4909c087794mr26069395e9.15.1780047918271; 
 Fri, 29 May 2026 02:45:18 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:13 +0200
Message-ID: <20260529094514.178266-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047918; x=1780652718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erG5YwD4V/662pwSeKBk13z7StZJa3qTPHB0zZaOUFg=;
 b=f9HbqDqWhsPGC0b7eQwboUOa7b8jOBBBGY6FIkuBMDYd/e6oq5v0HlO7xqEzyK5DD9
 p/+qj2ocWaQyWyatUTD5KvNlCJxxkUtheDhV+G9EPfg5UtP3m6ToDJETFqT6S51dyCB9
 1+TLS7IflG+g/O9UeAPNRgq/VpDyYrFDB4Px+DwhxrG8PF6lpbhspZR7zikOiwqMEifT
 2Qkhap43SRUM+omGTMAo5x/sa+Ko5JojYD8dAFv0LgrvpCqvgfgy7D7sk7tgfVIN1vSZ
 40N4qP5D8MDWhD+vACMlRwpWAh4V11b8u6RzfsuCGaoftyRBmvCKeXudtfkXvSb5sq9m
 iUOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f9HbqDqW
Subject: [Buildroot] [PATCH] package/libgit2: update CPE vendor
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:libgit2:libgit2:*:*:*:*:*:*:*:*" is valid for this
package.

The previous CPE hasn't been used since 2016 while the new one has 10
new CVEs assigned to it.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/libgit2/libgit2/security/advisories/GHSA-j2v7-4f6v-gpg8
[2] https://nvd.nist.gov/vuln/detail/cve-2024-24577

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgit2/libgit2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 34cb67929e..02af500a65 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -15,7 +15,7 @@ LIBGIT2_LICENSE = \
 	BSD-2-Clause (basename_r), \
 	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
-LIBGIT2_CPE_ID_VALID = YES
+LIBGIT2_CPE_ID_VENDOR = libgit2
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
