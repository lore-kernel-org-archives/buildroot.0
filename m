Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A9CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 03:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ADA740D82;
	Sat,  3 Oct 2026 03:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_piMGrTIs5M; Sat,  3 Oct 2026 03:56:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A898F40D8F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790999769;
	b=N5FSgY8CSll7VW+JUnanPCGIErlaq11lcQAGZtfvBwvR+PkU4wSWkgntchDY0Vzxs6Yb
	 jHcHN4Mj0/TRKZjAntjXizFAwlNKDzIhcnvjrj5theozrk5pSMPHsMLeRCKPTuOTTJ5iW
	 Cm/ohzOh8kvMMJ5c518rYF/DGDZKxyWPOKdExkT3NrLgRbfZ5bHLH2yvaJEyQSdt5d3yG
	 KVvVBWE4c70Gdr8hP+9wv7bWD1ce76wGn+zgrABfR8bcjBehIGlQuO0cm44Z8D7sEwd5q
	 rH6aCk3O74eudIyeqbUCTmmeVUZhvGuISPMMDhQ3PS+2pYnykwYiYyOsYmloqncq38A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790999769;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=I3YqCYAJGZcqZ+fA8wLRGM5NWmCsI6hBV3E24IRfMIo=;
	b=HiJDWIA21iIc+4+juPVRfz65iWs9TyyB2JKQKKA0o/Pr3dGk/GeH8Bj1fDQZkQBLqPT6
	 TGHvk/OwVPpg1eps8bo0dMfqEmIjYWXCQkH7FAGP9PhCltw2NWaQmC/3xxDvAUDGLWd4S
	 qRHmY/oVM7o0zxTiz26rRncCSj4vS2ezXEHnnoIgSrH5IjmweFdUDjtLzNiL/pm9BWo6Y
	 BvSrYPOjuUrrGgDrXPi55gctg05268/zYAqzB2IKReCHyMsGgKvhvnv8VZBK7afk+YpFP
	 bk+za/xYJQsXegyWXUmCSPkWmfdnTXYBQStR77Q/JCEY8orERoiIdLVho2e6dRiaabA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hn6eJAeS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790999769;
	bh=I3YqCYAJGZcqZ+fA8wLRGM5NWmCsI6hBV3E24IRfMIo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b+QtnLetJQeQYebcbrNsaEH5MPI/dlOWnwmXL8c3suLU6pi/hcf4CReRuMri/KeM0
	 fwGXwiML27AM7mHR4bSW3UzmTT8eT7QZaF9KVS0KENAEUJuIh8tkad/0yg+j60y8/B
	 njcxv6XiNUWVVsds8GAiSTBSdDifL+aEsncjDEioIihwFs5WtCLGdwH5TK+m6RiEfP
	 bBnKBLd8wOh1d8PRJXys1JxuLnPGREQPQnN0ZY3kbAdVfPxFZpY8SFEyE0uCheRtX4
	 YWNM+Hv/pdYQ27nOgzbsmnzV9FSgMBHKqooUOQrKEdZYYj463kRf0HKq5Y7jfPsinw
	 NKJbBkBBlfwRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A898F40D8F;
	Sat,  3 Oct 2026 03:56:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E308F263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D51AF40D1C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6imBFrPHDvz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 03:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EEAF640D82
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790999766;
 b=X7tjUcmVqI8eCYQl7EMjr2HIy9Sb8TrSGNbGAH+fL5/at1Wx7zI3c3voP2JoJtoAETpu
 kwepnFUZSJebLRLXEXqGmvxbZ2pTYfS0cosi+z66/aozWzQOgF1/0yIZOrctNsDAdKlSV
 HIXQG5u0PZ6DuEzim4KYtlSGc1Kbv5122CapVh0wtZXtfJUXfFE7HtViBkyWGUqszbqQg
 Se5MVVkskWWyGBu7LTDR+qkFRLGLD/AqJa/SYVgOE1FiWbj7PsPgsEwd3MEselfiM/b0e
 EmssaDufOo/GlUN2VE7BkPGLdAEHla/0VEgSbgkP/ba9VG3y6zJxqYh6lT0kGPuixsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790999766;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=J/3Fynspakn5cBbjhjhuY8dZ/tYfXL6cvR3p//UsmnM=;
 b=Zya+H4i15216UrYg5x2TTebt0lddggcmAstUpCPnXHaWY0lN7LSNT1vk9xnzfRIuqC9y
 t+vSy4N+gWG8NtsRbWXgvAPlmTKIDEfXkBewTg/zXc81cOcEaaREczJIlrDS8MHH/KNaV
 QFNN+itjovfsG/eVy/PZH5wkKnzZF43AmKUbcFDJqVYpy9Mra75ScL1UBjrDgzZ3fTkof
 1z7jz5DmW/AdXCUUnrqmVfw2Lt8h8j/+zgq/pkvJWlNpoueZVlwQZ7BnIHR45pL6atGdO
 gzfoZ2lMApZBYxJyR/rsQntFM7KuJyRXlBmXCAaQsHm/LktBv97y7+JiZnMksd6ErLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Hn6eJAeS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::e;
 helo=mail-oo2-x0e.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Hn6eJAeS
Received: from mail-oo2-x0e.google.com (mail-oo2-x0e.google.com
 [IPv6:2607:f8b0:4864:31::e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEAF640D82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:56:05 +0000 (UTC)
Received: by mail-oo2-x0e.google.com with SMTP id
 006d021491bc7-6d8709e0de8so226125eaf.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 20:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790999764; x=1791604564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J/3Fynspakn5cBbjhjhuY8dZ/tYfXL6cvR3p//UsmnM=;
 b=Hn6eJAeSkNc7La5O+Vj2A7IgaE5Kd8Js5y9v+W0MrbzFrXWzMZ/Zz13dFjuS5QAPiQ
 q7SJ9NJrAW3gACUOHasDK2vQzHBJzw4yVa6xIq4AbJEyZy/CZlDXn7+5SlBJPgEN26m0
 53LorkKtykGXJwKE70NpBQkUkxU40Lo9EjyvQhVw4b2DyjKv8PjafkbWzXfjFy/HY+un
 ximX7rXFdxjqshGg1W3t1t4M+0oPv3ROL8v1vH9MGk2R7VsxNsvJFZbEfueW1bVl3FjW
 fUI6yx4InugLYTKRT89GmxlKcXuGEWpgru/REt2fe5k7Bjy6pydF4cB3+gK/GncnR1Eq
 i2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790999764; x=1791604564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J/3Fynspakn5cBbjhjhuY8dZ/tYfXL6cvR3p//UsmnM=;
 b=YzaVAC0ThRgkvJQIVmjR0Z5jck0ROr5GpkDm+uxxKjrGB/A2QdoUmshndiFKyWLqSm
 /5UjqT7J2shDohWKzWwNbyeGtmPnhA81XlxQlieLkrOuuHi9o60vfmOUf2R+fOM0eaWn
 54nxuBXVLdiS16gKG3FDyztX0ddZVRskB37XddP8V+s0897XBqkPF6jwnYIxB//UrwtU
 SOHcccnJBCHfD9CU/xgxdwAUvzivDXQVnM0yXsBMHpNKXTIxVmFX7x7rUYXH6dZYIuAa
 TZqCCcsx0JgZn0KzZRUrnGjDG/6JDbQ3fbTE4kY9u0rl1pgGXVxRD6HKVpz/suDHqmV0
 wCdA==
X-Gm-Message-State: AFuF++mBHIcaGUmWf2edEa2N00VgB1xNKxBvDG2i0SHDYZpyRD16UPhH
 LGiaD0l++NSN2o+nxW5uyR9f0djaYwwXi05m550Jw+IJPdxAgYySUtr+AKLjKQ==
X-Gm-Gg: AYBFou1VgShBZNKin4IrdzXzaNBHaLpBbo7xsJw+Fsa/ARJRMeLoKCKakn5G3SlpP3h
 LuEGW5mU274VO4a/gs1XzcfHWdaTyq4W/YVhO4bmt2emaEbfA3/YSqIJQgqWwnv3K/RPN1Dcixx
 P+qWnYsjLH3qlVLkdFM+N4nNy/Ngdz5bfhAcPUVwmIUs2LhzVTkFGJDGlyOL3iEiKkMkA6Vf8iO
 gDRI0eTL9urOPi4nkpkMo7aJbkjX7FCCzFS66ziMZ8+kpBMwi4TphlijdwY6rIUTo17PJmq/wGK
 CkidlCLlp8vzqODTGAxfyjYDZdnyLYdB+r1th7Rh0YuMKPvqYVKI9RFBdYcZyZBSOM1StgRZ9TL
 GkESKwSIcs+ubxBuytg3x17qQviAIBor3hLw1ocAgtl0YG4kzLjbhZOJ9SxkePnuBDI4Y1eZCMu
 E48kbcqJm9BLFvWmI+CY2+eHi2jw7/6O1gyZ/oCl/dXSYoaaZSdzx8/bZ1V++cS2Qo/1BhJAbXB
 hqMfF5HvLgV26w1V9oksjm4ahijXt0ap49TCWVVNlL1FER1x9QTdvXm+otDLrX0blU56TwUjG2N
 t4N+6N2ElGM6xivXSybVp3ANQku8jSqQWi0KbnoYCWgCZfG4yLrPAikAs790GDUVZvRDuJUYvE1
 uQ8zwaugsk43Xn57/Cj5raX7tbYSYKfWXOOoejFLHKg==
X-Received: by 2002:a05:6820:81c9:b0:6de:dcbf:8b7d with SMTP id
 006d021491bc7-6df35450278mr3357880eaf.68.1790999764321; 
 Fri, 02 Oct 2026 20:56:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a1cfa53sm4658394eaf.5.2026.10.02.20.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 20:56:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 21:55:55 -0600
Message-ID: <20261003035555.463812-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003035555.463812-1-james.hilliard1@gmail.com>
References: <20261003035555.463812-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to version
 2.13.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index ded810cefd..a818d02069 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  a6b8098934bfca79f0d99334f975c22a  pydantic-2.13.3.tar.gz
-sha256  af09e9d1d09f4e7fe37145c1f577e1d61ceb9a41924bf0094a36506285d0a84d  pydantic-2.13.3.tar.gz
+md5  38980d18ae9c2e8d54a2cdd46a46d40a  pydantic-2.13.5.tar.gz
+sha256  51a9c5f7b2f8e636f04c6cada605d9b6a3bf1348fdf945a3d8869b19bba0ee08  pydantic-2.13.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 71652bed0b..f9e1baef9a 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.13.3
+PYTHON_PYDANTIC_VERSION = 2.13.5
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/ef/fc4f868f4e2cee79f863883abffceff107875f569b848507319842d2a681
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
