Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D5AC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B914A6078F;
	Wed,  9 Sep 2026 12:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OauhjEsqBqgX; Wed,  9 Sep 2026 12:39:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E4B2D60769
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788957590;
	b=YzC6Ruok2m3RYxCk5TdacQYt7Y5XLy+KYcjfhRXw9XyGEEzViptrl3q6MSpXCnB4YHQs
	 JE3w8HacySYur3mOxNkGI4EGwurR4vWxlRxVDuNwHM/Rf8RUh+XXUi+6Uktp3QTPYPsNr
	 GUjJ5uEHbb3pgM2fCQ0ThCKAHlOuezzw245i+Yr4YUNHeI4Tf0TXPSoVirwNSkocTaeXk
	 UdyZGOS04+4vpYiYNUpyyPMgQ0bl2B//xExH8fB+lLE6udn3yLcsWzGYygkFMGQ5Zm8HB
	 6jrDyhhWl6xzqDJZ2AHrhEuoHHpAOGWliv/km7THi5CX6i+TXPj1wyGRsYpQ34CSapw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uFvJQBg7NFMWt74SctcqzvUf1Xu9jCFfgykClViX2Zw=;
	b=C5huTYJhsBhiWJBWmXzxleE9FNbWxdUX9DjWSoa5YYmky4rCN3GfHV5Vxy0ktPiRuSx7
	 7tbU6U525OzFJ/A0y4BXxY4PhnAzfphvHj9X5Q16U2wfC/AJas5yMFJUdkGaCikkpMfba
	 KR10W8gxHCT71qR7g/ydJVZfF+hCKAYwja5zC0ptkcyKJ/1ddP3819Iff7RogQC4SxxMi
	 FfHcuRtQpqDQ5E+ZeCpRrKm88PybB8p9+Nmu+aKlQ0sNBwE0A7JFl2FIG7Ih2qeOIaGKh
	 xQN4QKc3oPM60v18ykb5in8n03mvnVCzg+Hs8qY9812PRYEMr1scU4MCQpSXgRfqCRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788957590;
	bh=uFvJQBg7NFMWt74SctcqzvUf1Xu9jCFfgykClViX2Zw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bYehQ0T8JJ5Y6o33M5/R99NGlixZK6iK+lnOHp+TnB/iwmaBarQ3JdLIiu8xpN1tq
	 m1XY1C2FEqBL/64/uVTAQd8D4JgokJDdaz0tFBySriX2xShD4YGyFn1RsHQRCEJym+
	 EWKMpVwJTxTIZ3DHo5v+8r+NGqcxowBBpyHvE9lpgkOaUjoxqlLJgLPtmPSwJvan9D
	 YeWCseo8yzCJZ0s73LFQkNCqb6KBXdfudGG21tY7JwiNLB9+GuTnWf8+YMbn3eZKpq
	 lkd3/vEBqfaZERmRqToR4u2pH7sZQQf+yoPUFyB2hAF0VpOjU2+7XtijoKkHs+17A6
	 CG1/3dI0Ok9KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B2D60769;
	Wed,  9 Sep 2026 12:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 541982E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4643D80D8B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ims8IHk2lPbh for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:39:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5576F80C25
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788957587;
 b=PazHfYWKVyGjSg206Y4Ab/hy0DOnuHd16aKRTDm2/MydM9/Tjq4UZYTUbKdRNlItBjYg
 3zFVpF4+lgTG6WrWH8U6U+863SItAFbwk+lgGTWwTukGYQmBUM0plKh2nePTYvn13u85L
 Pz12Q2xiehBbCBBG5rxU/XrFFPuyEu353PriPlvS09kPTxzN63vN9TfilkBln26O9YDV7
 7Fpw26shi6kY3xvvv7NbI7ZxekWsht7PUwF9Doo6y+WHopADkp1bSOYF4dKQ0W6f/DyDc
 oXq8z5aouYsFm4lI6iVWqsnUXs9aj3/ZwDZJeMyBDmNV8agHeUecTMzKTwAdPdDmY/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788957587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Ed2ROL+QOFSLB7OBOn1uV3lynlhoX5LcMS2mRpgIAP8=;
 b=h1pbP1FIxrZLMro9nO2Bthn6qT5618iLqY3uPjYxVAPvcphLlISscfkdPXa5/GhSbnsI
 L0H0ZN275iWpU6X7TYPlKnbA56D/SZMK8qxm/N8+5E55Z/ghvor8C4Czgv66xiCAS67i+
 51gRXHrsBaMo2po4UfNiL30+GIUagZqj26Z++6b0hZswb9h1feTfLH3sdfQ8uc7vQos7Z
 OfPrWdZuwJ1zBEGS2Ms+Sf7wj+b+rRMkMB8Ury+4PYDukdg3dc21fnVunJSIWi81YfkYo
 kt15Tiei+UqkJopfb5G54onWiBCYyA4cXinTW1gfb3s1As8DuGi2ZKP7IlmzBOWykzg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="SrqR/QBe"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SrqR/QBe
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5576F80C25
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:39:46 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-4c14d66d922so52435b6e.0
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788957585; x=1789562385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ed2ROL+QOFSLB7OBOn1uV3lynlhoX5LcMS2mRpgIAP8=;
 b=SrqR/QBeYzsnGWaIRJdJSxx9ru+hvJvIEtPjU7ChSRuT2tF14afGtos3Jui1XOo025
 7jLKxrC3NF2mbi4bGOEpBl3pe/Sk3p1SxYQ2C2GF3hjRtO5bdLXyW1JxqMWlU3gm3lmE
 dI12v2BqP4iv1qfhA38s0OSRFd77DC4uEvy0oA9pt24kROLDM2lmDR7wdCGknJzWR+qt
 cWggB6EMDKSd9J5CSKYUK6AYLoFPvxwW9R409YcLw3whvd6zGBPHmiFWzY3qfeIQvra7
 X7vS8sWFLKnDcbSdHZbHAvfcsp9i20wQ0hWofBe6meia2B1EGINIxwPZo+15a0LQjJFd
 LgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788957585; x=1789562385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ed2ROL+QOFSLB7OBOn1uV3lynlhoX5LcMS2mRpgIAP8=;
 b=WK8fl8pO7d8RKW7ZGibQlXJmGusqcsBLKALAkucQp0jhvF6XsQ6LIQE8qfMbwhjkS4
 oFZYgYX9AAvJGJZ/NR1C2g+qlSlolIZaiMCh+6PBgQlN+xG3SEzKeI1kklJWnK4M6czV
 flTcXTQcujIuGFiU/DS77VDd/IouT2i07OQ11P0wpgMeLTR5l+hi8I8BgSI3glMyiDs7
 nVN3+WvClV0GXZeMIJTKH2P1965SnSt+buLqPB7GZgVFtS9zsD0Vb4nDOmu7IfIYGDX2
 dyCYrSylDctY0Swadx7gVBqQ5OyLbXrxSf5aWSXKjJozIstjn0Kc/5ZyGG7UA+eUcqBw
 NP9A==
X-Gm-Message-State: AFuF++mnoCSSFqrYcSJHqfTkOItAC8yL6HkFTrF1JpHkfFvbgLcN0i2p
 oOgp/kCubJ1AsAa68tagIV+W3Qwza3ZiUCf12QBr6CykLc/b7CjeuOdJWGG2rw==
X-Gm-Gg: AYBFou2+E+cF7px5MxAWPFj+xJ/5HDoJ6BKZNy6yUXH9ZoN9MqOOwkXzX9Mh6SMQL8b
 ABqrH1Kr8ylKSBylYq0528SzvkG+okVYPM4O5qBJ9N3W5Wa/59p/+J7JEAkur6XC9RsbHFMXLIE
 X7S4XL5C99WtMTtTOcikOau/mBl9UDf57VCCttpCYbpuJSL2KCTr6LVVlrkBq31gIH22q2/z3do
 tD2NOcNzBFTzNI8HfpviGRmgyP4E0MIRJz3c3Ig7krBKklfQo//EpY4j1O/2ShHjWd4SGXJVj8L
 fD2tjSgjHOYatFsuQkFZAbCxpOzYcaULai1uPGoYmVLMncQbrY43BxqlItvONkL63VrZzfpQpi/
 ig0NhNkXFelQJR2xtNdeMlu0YYIEj9vkGYDwPbwlxI5rHc5FGZipsWfDJ3d5/gcB1xijXifVila
 3rjOwEpMWEW3zd+4gtI4Ig0K1Vqn9Qro8NSpkKFpmyKJzo9ZHMc6X4PLci5O68vXe5ImoGxXMDA
 NNhI4qZL9ZMNQ5ftEZDvvxfXCLfqzihsMQzmxBU
X-Received: by 2002:a05:6808:4f27:b0:4b3:7aeb:1b73 with SMTP id
 5614622812f47-4b9645205c9mr21607547b6e.2.1788957584958; 
 Wed, 09 Sep 2026 05:39:44 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b971c8ed6asm16218585b6e.17.2026.09.09.05.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:39:43 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr,
 Matthew Weber <matt@thewebers.ws>
Date: Wed,  9 Sep 2026 07:39:25 -0500
Message-Id: <20260909123925.29971-4-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260909123925.29971-1-matt@thewebers.ws>
References: <20260909123925.29971-1-matt@thewebers.ws>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] support/scripts/check-host-bins: allow musl
 libc names
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

musl-based host systems can name their C library libc.musl*. Treat these as
toolchain runtime libraries, like libc.so*.

Assisted-by: GitHub Copilot [VS Code]
Signed-off-by: Matthew Weber <matt@thewebers.ws>
---
Depends on v3 of the check-host-bins series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=520240

The test script is available at:
https://gist.github.com/matthew-l-weber/34fae15a4319a81462961eadf0e31164

Test 3m builds a synthetic shared library named libc.musl-x86_64.so.1, then
links an executable against it. It confirms the executable has the expected
DT_NEEDED entry and verifies that check-host-bins accepts it without an
error.

Test 5, the cross-distro container test sequence, was also run. Its
Alpine 3.24 run exposed the missing libc.musl* allowlist entry; after this
change, the Alpine test sequence completed without reporting the musl C
library as missing.

 support/scripts/check-host-bins | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-host-bins b/support/scripts/check-host-bins
index 7e9b51cd4c..42063d9c91 100755
--- a/support/scripts/check-host-bins
+++ b/support/scripts/check-host-bins
@@ -99,7 +99,7 @@ get_libs() {
 
     while read -r lib; do
         case "${lib}" in
-        libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libatomic.so*|librt.so*|libutil.so*|libresolv.so*)
+        libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libatomic.so*|librt.so*|libutil.so*|libresolv.so*|libc.musl*)
             continue
             ;;
         *)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
