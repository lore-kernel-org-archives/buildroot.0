Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B091CA5FAC
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 17:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFCF80E9C;
	Tue, 29 Sep 2026 17:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hf5SOoeoEoZ8; Tue, 29 Sep 2026 17:53:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 293DE80E0A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790704431;
	b=DKkUqTrvcu3bY032wb/V60lO9Rx/eSVGz3pZcOAGqwP5J2gBBA7WRgkLFN0JQnf/6eXp
	 W9A/ipsNu8KxilCMLPfJ1U464f9w7p1RxfNoLD03aJgb07DZUDL8ShEkL2vn7aQRHHVMF
	 Jbnv670w1UCd+GOnknUSpKbWqDudrG1lebg6CD9NpNoNP4TMlpHyxcfMEtf1npoe7FZcT
	 /1GFPo0j2Dn6j4abIRNQODbuN680XW6aJ497OHuAt7EsYA3T8VPF6hTkeuU1ggFRVyUI0
	 C/lj2qmdAcoOHmOZzR9xybJHyDZ8UlPF0NuklHPejNPrQUgmC2fd5Fgq6bwUJrx0ztA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790704431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aiURvMJm5ncR5a124idMjo77DimS9QilpsyFLN+LeQU=;
	b=Kdsfsfebf2DYQohGThHaGhCeJHOn2sadEMxnL3BX8wIyd2epUkDEt3y3stdfUThVX0XL
	 umXYShzzYdB+FGf0+elKtSLb2os5sQIZh0RlbtodTUDy6meYMryE6BRXQnhVSpLeaElaj
	 KQU/PqLlNTtaasAY8IQ/QyzJJ/nVz+1ELuHve/eXErMg/jQkFziS7IxspNTdqFEqLdMnN
	 +3lIKFtoUte8EJPU8I55VEGtJAeNZGVmLKSVYXzQgYsY+TWxywjxG+BuCPGBw7P74OyO0
	 Cx3JHB8TbvvBBzD4qDDlouH4WUL9KJFICDfNDBEoZTIbkXl+7PCxENBNmJnSQQMVb2A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AZlYmJfS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790704431;
	bh=aiURvMJm5ncR5a124idMjo77DimS9QilpsyFLN+LeQU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JW8kszRL01YUk0UD3xVM272XWe9g1O3tQwveEg1l2a4tZZ1ch8EQ77fF/rPj9+rMy
	 /DHXQtev9lUNflV3hcW6UGKvAkme9o5beQ/7Su0rlWiXLV7eVI04kF3FtcFmWV81ru
	 W7w4cyJhJ9uLwk3AUJ6cdH+MnmyYtR/UceZnG7KyZoyoSdp3zoWraI53xxqojnMUGY
	 5efgJ7Mjy8FH/8fYQidY2HzY3+KFLRtlpof+bipH5nMh00ArZ6I1TbRoBDPIwvjXkf
	 mlA2zFxhlP3wCpBTDNtBYNfPtfjDyOEB8i68+Id6nWcQ/ereHT2m92Dp6HxGUdtNrx
	 kmwnvjUcFNxSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293DE80E0A;
	Tue, 29 Sep 2026 17:53:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E987532A
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF80080E0A
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gscbXdNvTvjK for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 17:53:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A833C80DF6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790704429;
 b=rrVwP6f/FE8j20kTI1mZx1ecN2E9Xa4IzzC1Le26Xs9t+dSeiG8Es8o3C5i6v7v56JbQ
 sn5RY4K/O5v9ihjSE+kCTMrqHSY570eyWB/C2EAsWSYIeNYp82yskuNKFANKNijCPNBkF
 mxW9YcUpyONBrjEaxu3xG2TPnS2JRlIdixulcghcN3mCMlsdL6UQY7T80OP4XM7hGol12
 z9r2hJQcGEvWZTCkVceGAN6NVUjFTat1d1RDtniNuFoiWwgvfloNUGHE6iByvD84Edqq0
 waCHDYom04mrTDZDK/53u2F/3vyjLlBrscadnzS8qIJlo5ONZaZ5tTI8uFtbFefL8tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790704429;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7qOacypcS2XuIwgbenewnLFRpycEr4oJpe8WpSpTun4=;
 b=AN80/QIB1mVsSlqgNJigIMGBicuFTDCmFcoqdy7oC6B7T3zRcWSHY7+P51zX3ke+8LJ2
 2w8vy2ETXteK/B7j+hS4u05B5wBfE7KT2vYtkhEiw9sJFE+wF7r7Mev7Zy81NjJ6bX3Ft
 ctcU5W71MbXnsmObCaZGxUDjAF1bXHGWNrN9rI1t61idXoiIWwElQZeAwMIx6OI6dSmqd
 1vCriE9OysxLFEL2zjL9fBdYNGyXopiZaOHgmThEzLuk0tPuYkIHefRCREpiuIRHHq0vB
 bvvRlgAI+vk9sFox/3y2nIaUtUGGjP2R+qHve2MajijZbkTf7V/Q9+l/NOjxQh1OvrA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AZlYmJfS; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AZlYmJfS
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A833C80DF6
 for <buildroot@busybox.net>; Tue, 29 Sep 2026 17:53:48 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so17414395e9.3
 for <buildroot@busybox.net>; Tue, 29 Sep 2026 10:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790704426; x=1791309226; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7qOacypcS2XuIwgbenewnLFRpycEr4oJpe8WpSpTun4=;
 b=AZlYmJfS7q+f4IO/um20W/dxGjx0EUmsFgciRmrVDrcm3+KK5DHZrkvhJ1Fj7jXUgE
 aN0+6/5J0FVQ1XesT89sNppc8wG6qdl/IS0H00UyhGe7uBQKXCLFnSKz1d8XDzp5ncK3
 z9q2xYZjqbILu0fclw4+2GQkMdaFWTVMkIvSVKXtPPG2XCOzcTJ4soGVOVArgdZKvlvb
 ekais6SuBJzyC1fdAEZ9vLRLY04J4RBzXs5ZIdIINnlcnDmY9HRBCnOvDbKM8lY53i3b
 POZgChBL0p+4ixiNeD8eeQHQtNzTyZUQw7W8gjOKGp5zPDQrirzgDQ2Hu/Bdz3oVqBzB
 4e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790704426; x=1791309226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7qOacypcS2XuIwgbenewnLFRpycEr4oJpe8WpSpTun4=;
 b=MKwKF6+13NMuD70bV/35K9YTI6Kw9jaca3+Vftu3PkrgEcJk05qxKG3lK0s1GMiTuC
 pmXfZ1OKusBQN3OhiRv+PFyPYUTaDrK64lxqKIayDrazhSn0ZjYoPfJzkzVTw24Ce44a
 ehmAAD/isiERPVBcOIZz0bVVdQtlCIkEKJK97N1CqiRSDvPWNm+SOPGtrKxskyi5ihht
 3yWx+JZXgksfikz5KBCei1rjZ3uc3gZZWG6Ng+Ce07S0+Uqz/+AWPgbRUbw/em6mtPlQ
 P7ljdH/LL/i7di+QFe81iTvHPQY1WZm/CevhvqqfUbjIdfmdc3LtPXBYI+inbyVGZdhX
 d+6w==
X-Gm-Message-State: AFuF++mnRt6i0V/eirJ4BdeKYHw4/AYDRmIXv1GqsUZBVT0vFgXH8ZVp
 waDC+SV5Sg5zIBkg/nf25O3GjqBI5ZvAMOjEqAOwKikYIoPllxda7c4C8xvBvw==
X-Gm-Gg: AYBFou1wwc19BzWllY75kUSjd65OuwaHd2JtM/Lr17W+FoVa4xZpSfKzBY4As4Bkbzz
 HbvT0x2wccs4WDV5AvWAF8xobsNRqBr0deAq2JtSDgco1cklFn2BpsMjSHDD+LiY+11ZB9ZOLzH
 zgTebdxpo2629bNJHX5Gxv4beG4vnk0FWuaUKJOMv+2m+0jKnlE9ItViNc89GAcalSHBQ3I600o
 wes0PIm4+s4dZ1i7aoZPlqRKzvOAPM05Pj1tnOAwl1YlrPWILOggPSxH/BCS0hXAkfVwlxoY2/z
 DN/bARzQhyOp1Pro5NoYfc6wNTY0A7YSQz0S166WW5jb7eORrLxEHRxVEEuQpHrZrxxlHApg7b0
 L62uuOGZqra6Qxy7MLfyUW0WtvmC7spqTzYL4noeqDkGdu+Ii6eOwmmcbd564LYUuTgxKEkNa30
 bDHhdmO0H1UxCmUW0wu+adBDXtwovDnciGtikeg2Op5uYIDtMpMomhF9UxxELFQTVCLK/kytJfz
 TbLBkKn56Y64w+Ba2ZYWGvn2Qm8eEjEWFyspGnhlAn5DIj1GQE9tg==
X-Received: by 2002:a05:600d:82e7:b0:4a0:146d:1f24 with SMTP id
 5b1f17b1804b1-4a01475cc3fmr6543855e9.2.1790704425844; 
 Tue, 29 Sep 2026 10:53:45 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d0f442dsm91001545e9.13.2026.09.29.10.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2026 10:53:45 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 29 Sep 2026 19:53:40 +0200
Message-ID: <20260929175341.2329-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/haproxy: allow Lua 5.4
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

see commit "MEDIUM: lua: Add support for the Lua 5.4"
https://github.com/haproxy/haproxy/commit/08ed98fd7963968de49593304fdd9234812845a4

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index d2fba7f92..de2df549b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -40,7 +40,7 @@ HAPROXY_MAKE_OPTS += USE_THREAD=1
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 HAPROXY_DEPENDENCIES += lua
 HAPROXY_MAKE_OPTS += \
 	LUA_LIB_NAME=lua \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
