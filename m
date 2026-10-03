Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0867FCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C960260E2A;
	Sat,  3 Oct 2026 08:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUj8-ePGfOX6; Sat,  3 Oct 2026 08:45:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9F5660DF8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017144;
	b=FsrXZNlCCS3NjRhOmjKLuvjMfuXaaaA7C6ZhIZdcNM7GC7MJLzN+9GkHbynXbnxLnKez
	 k8dJDy57l1fHTCsSL3bZ0/QNLOcjyhYObcoEUteP0TidzUq0V9whH4+XCleD8RoMkYZgK
	 zsKkR4rjm6w7zZLh0ju+3Gy/s+ti0wrMZxlntf9zqtzaFrAJumJyq+4ok3jrLV0i7yrEa
	 RL4XnQ7KYhYvmbWd2fzykAGngFit8eZVOCmQXxw2nDVKPaz9fXhrLqZwe6bXgnAbAwQxO
	 IlLcKX5OtmAxZ3aICXp3jJ+kR9wBMDPgu3g0xMeDi4KU7imSQp1RCpTB5bxUf0PlLzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wgk3/Uy2wk/S/UclPfYjQkCw08jYmwtOKAD8aV14MVE=;
	b=gWoS9LOt6Q6t6kdBoZ3fDy3p+I9j3edd4W7YPZOdfAW1KIdEe4LUHhjODtdjJSyur06y
	 H/1CGyDJPkQIXPUg3hfhx2DkGs2D2N21QeVADd8m2/W4vq8ZwvBkoeTJo4/MVlaKXuHC4
	 sJYVjWeJOgyAqO6/PVsnAhFyeRlJYGarZlRpu37Pga6cV88RoLu6urtTYNqETDN3Bqfer
	 im5cnvz75oOPFS3zW2DbqsKYvYrxyKfn6h1Vl7/r/Arj02poPzlTaWd5hCmCIxqHnqAoS
	 QKFFF3ePqzGc/TZnmEd9BRl0uuXAFriEt+XWWKufA7rxZUeIf4k9+9cKutk1rqS8L8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=biBEfuZj;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017144;
	bh=Wgk3/Uy2wk/S/UclPfYjQkCw08jYmwtOKAD8aV14MVE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qBmgjcS8Hy529UhqNn2vrLKfjXKS4Ta/uH/gxbFRQW+BgB7gbWgXJz2zzRMANuJch
	 1wUV5kn2gP4TlU2zjom0TB2NsBiE9AHbBu5/9lo/0PaU976hYVhlTTIwNou57P210W
	 O5nhhhqdkxjEJjy6HaOINURQ+7PSVCnF0qcduid6tpLc2xl0vCeojcgKHt13VcbTKD
	 W4o0tz/FHyx3JsCuFfQUqUMDmaKmjG/9fyLBF29Kf1SC6oLHWu79eEaELbLKCnpfDZ
	 r6y926ipLlslB4jbKf8/Roz2Ndn2y+3zxJCMSIxExl3sXQ4W6ubMGOqRPqY0kvPzyY
	 gunoGCgi6RmnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F5660DF8;
	Sat,  3 Oct 2026 08:45:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02FAF32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD36560E1C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZPpJGqWs-D5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0192860E04
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017139;
 b=C/W/n7Buxc+U4n97qyDsHnqfVfarGMt4iQCCsPokXBUF+7dk07pVJmgnsJO04gBQBDS2
 aHdDGnPABiHCN/iHf3XMns5sJyb4tjxp1xy1H8wpvt0Uz6MILMU3GSKIzplZ6eY3eU7Og
 7+0y75GlogcUFM5RSm5TqjvkpafgXvIalP/Fa+AxGViCyaWBYdtQLBzG0Cbnfymjbbf6v
 zsyzIGjHdMo19CxeAAP6y2VCfUsggJKDgakPrXoAmcsVJsB55rVaNui9eU0SKfyu8dYdk
 KxYszrd1E1mMqaAyimtMOgh+O0bkijkMPxO//1LzdQE03sACmMgDkX+Zga+O9VmmEiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017139;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Wf6nhFhwJqp+THRYM+lwrQb9RZxf+n8l0lN/9+MHTlw=;
 b=QEhd2zrrYw1b5u416PPBn4nOHFDqiIPrev11uX7991SxOIevKLJrLTjFzpfkovBkr3JH
 u23gFaWDwVHHsraPt9KtZJcCRc/FBm0T8+kH01my0DhYjpttLCOJqHrWJOzfBpmvMNNpc
 Wjl6TeAmFgqI9oqTksbRaWuqni4SzSgjo7OuG1Ror5sTUyW1NAxpd/WsI96N4awfXEFEQ
 q8MmIdhOVSclDu3qNSpkDUaFOZ8U6ZFAiO57T8JkM+S64teEjudzQOwRH6DuUh+PE5OzR
 gI+f+/asnq/3pcH0zygPet2k0jxHa+K2MBdxIa3OjxLCtKIxJkqz4hvYjiDRiKqrIEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=biBEfuZj; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=biBEfuZj
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0192860E04
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:38 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-8231c185333so369113a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017138; x=1791621938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Wf6nhFhwJqp+THRYM+lwrQb9RZxf+n8l0lN/9+MHTlw=;
 b=biBEfuZjJ8gu6EBLLIwxek153HqvvImWMU1ZwF8u0bshlxoi2tgvWSBBp1f5ezYB6T
 I3Hmh9dDO43M5F4PxeRuFrg89G8T1NOtOqn4UKGcBTl/imcysZDu/bDormnNcy4bJ8hr
 MbTb1XaTDtUj+CMjrty46UjG0x0GMRfcIq9A3MVTIRe3oDcQ/Urbk5ZI8JJN0V8nc039
 64PU1RTjfHZ70OD+6ZiH8A39d62oHJu5eGNKuTJobqbECZ1w5XVMiBT5Jg8YHtTaueib
 JaIttHu6LtLLJctPYvq3eflOwxrjwyrBaSOG+Tb8B+GFQxMEmZXDfkGlEGTdyI6BrqyJ
 qRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017138; x=1791621938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wf6nhFhwJqp+THRYM+lwrQb9RZxf+n8l0lN/9+MHTlw=;
 b=Sk7ZVk+5HG0nqhBe4B5GhekNGAA4O1voWYaNT60JGICj1tJghkj9LSDfdRUyvzn07V
 fHURlfUoUwUAIXTfidoKcUjpwXb05lXxrYsMF40yAOa8wsHOtZVajhqRjmB0YBhPh5vO
 szgD+F6Ekg2XVYk+7Fiy7PPw9LCMG1+WAs/VYV7WYBiOgGZg84q7/Snbi/p8QFMSR21K
 zxu41+YNtPXvwjPwoKzbZfWMx3VxmS0DiL1wVJYDxWkDbVz0d8JKbrbVcib4n2fvIsks
 JCaYSkHvgeB7cExchqM9nqMdqcaaCSYuJlIwVL+Gj2hmiwFaW57I48II9fqcAOn9DTWD
 yLOA==
X-Gm-Message-State: AFuF++lGQbX/bEDQs0C+uVt0rFzm8HlC2Ketcs534twaesBXUgCswJW5
 7+YMWSq7D13JaXsENer/cTwV1KZJHQv70nm7QLYkzWpJoDj3KmYWbI3oJh0ddg==
X-Gm-Gg: AYBFou0//nBtC3khqhgw/56+AQpOa6ntTpWYJD+Pm86fmwMV63h5BHaU6uVlHUKWHwH
 gBnFSZm5yWM0v8dzLTQnNp/u5UOyv7XXk2dwBEr4QdpPHBTGv1JIVPzZv61nSmXyaDVef+RNuMQ
 PkK+gz/ugtFgbnq5WL8Om9Lf4rnk2UeWYKrIBV0qTdNfz6SnQ6vqcm4U7tQE6OGlys2xsyB2S+q
 1EGzNbShrKZEKW5QrjUDvJ3jCeqJjBkKkpXMKhdqBSyzF97nYMrroLpyORQSe+iNbnhvNmdrpxX
 m2rMuQFFahFc3AgbQQqQObGMbNTA46KKwIgbJR55sP5WIoFHED7jXF+teV8yRdutv7yK9DWCZ21
 9f0VToJusWiJlhH/4+lXe114PxYPSdUWe/7wYKnOQYupRYv5Vu1+/PFHghwx+6jXwDcsY3n8hFp
 +pcbWHw4htACmUi2okbj8bDjJr6twEiT1RadY+ceTHxrYgbuVnjsN7fEr5sJCxyzoukRlfjOwd9
 Cs8b5geAmmO8WuGPR01Hv755RndgNpkmAluynv189lUp3usb9KzQoX/QOIoyJWeNvd/I1OaevsT
 J/MXM4JHmq1/WX7lPzNxbtvR7trdss+rnaXX+JU9LWWublJLFRZackG06BsPgsvY5HcUxPyz6Oq
 ZYdgv42hWd83BNhUoRU91SyMlBPxx32/yKlWV1F4GWNwhdXeBpDiv
X-Received: by 2002:a05:6830:8294:b0:811:4c27:f3c0 with SMTP id
 46e09a7af769-8227f994659mr5686626a34.3.1791017137721; 
 Sat, 03 Oct 2026 01:45:37 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:07 -0600
Message-ID: <20261003084453.545653-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-periphery: bump to version
 2.4.2
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/vsergeev/python-periphery/commit/a7361781456fcfa605b0d4d335abfbb9ced45918

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-periphery/python-periphery.hash | 6 +++---
 package/python-periphery/python-periphery.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index a758fa7a4d..f14d570390 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-periphery/json
-md5  2b2a1037fb4ac15e7b0514ce3659d26c  python-periphery-2.4.1.tar.gz
-sha256  61d461d736982a6f766e878720ab10a68151e2e8c1086600d9389ac47e40e88a  python-periphery-2.4.1.tar.gz
+md5  c7d00f4ff0409d88ede49768dad1d733  python_periphery-2.4.2.tar.gz
+sha256  9b334a31832ba64f74aa72700ee5fd6452d79d1d1fa6a0b48333bdb716d91575  python_periphery-2.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256  321124461e9f86f4f7bb9f571500bf58ec1b76206b642e505ce17db7f7c88e05  LICENSE
+sha256  baff9efffe2d42c0e58271d177c3456a7e436ec7c5c47a02da91bbc76de83877  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 7a49f305a5..54eccb46c1 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.4.1
-PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/df/f1/1a986ad2bb696033168db2121151e5ff90df033af780ffca47c8bb559f29
+PYTHON_PERIPHERY_VERSION = 2.4.2
+PYTHON_PERIPHERY_SOURCE = python_periphery-$(PYTHON_PERIPHERY_VERSION).tar.gz
+PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/81/4e/e25e53c24192b7a6192f27ae38760dc679737b5b3c44961408e1ab10e802
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
 PYTHON_PERIPHERY_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
