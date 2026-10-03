Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEF4CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09EC460E19;
	Sat,  3 Oct 2026 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG286LGRROSL; Sat,  3 Oct 2026 21:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EAE7860E98
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061748;
	b=Fa0TqSgVeXbJjT7UjKy8cnbas8cDLPQvueB6fg3QeMQl3p5dK5d0/BXtnANR0dH9v50L
	 7XNz2svVxR8PLoNi6MFd8hMFxC3rFbLQhkq+pR/zhJfQJp5UGNVogRn+wFqyEm6Y05vCa
	 NIZ8U0Cwh9ZGyjoyYO39y+bd/mHLfLbckS3hZXX38VKrxeq4WPSc2HKnu6uGcbmxgMSrS
	 +jt0hh43eY3pAoSFDdIiP9yRZs/Gp7WeDbpvyS+0T+PaAPBetBWaCCnooflrF0AGQxfxl
	 DRoiyobM92VRZ1/sumd2LoEgnDQ7bp9mPEB0wmpxGLyVk8iiFaRDW6aUrOMbNvGhnXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061748;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FAoN7WuCn9mXbldjptZiqfSwzPaxvfGlMwP4kOssPp4=;
	b=UJog569C+qi5aGZ1N4PLIdlM+42evHNynxDRzwgXRDUenQz7MqgHMKiWYcS0JpRAOjgV
	 iTc5GCq5HqjqCmffl2LQm1wdo5GZZWW6MI/rJbzRcxWptmnkRLDAYl1aA1PzoQ18Tcxy/
	 jFRJfw+TTUAcKyTQp1lYmuUBZ50KYoK33sB/Y42A4G2Ui8BnNaaq3nBWwU1DBP7iis/jm
	 /mwAzWVRoUSCoQIAEb1B/mR074nGzwOAoZY2FyJRaXi77ozlezkTRerbJnxR2l+8d0nD3
	 AceCcwAGwoFlc+el9L+2pZJeWhAzNOSkT0Nq9dZ7GpPljx3QRzt9TgEuwyL4iGV4t3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061748;
	bh=FAoN7WuCn9mXbldjptZiqfSwzPaxvfGlMwP4kOssPp4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=R17+E7IJxCwGjxkqDWQD9bM9cfodNfQpaUji3q75TjaJmn9HF1MO0oPDKHf1vTQb0
	 X1sanTl7XnOuaswW3aOx6oEj8jFQSamhmRuJr1jesNRauNKSidYvcpOh3TSu1dCJCK
	 fOTgOWVYULhup3inV973x/zu+NU5EXXzD41ujWZZfhhxegJwpOMqoVuO9ln3tqBmIh
	 /CkwQZ5T+vtcICA8brMsuGm1MNzijVOQ3/5VNOpjMVjQgQO2/FG1gPChFZUEg4jGA9
	 QZ2fX3h9y/28HuCyUNWOSKDeDWlNhJWGPhYhJb6DUjEOX+cjqsmIomjZoB83N1fo9D
	 jVy5/2jHS4NyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE7860E98;
	Sat,  3 Oct 2026 21:09:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C01801A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1E7640A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkGY9csiI_4V for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D101740A7E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061744;
 b=jIIb6ks2bNJS8kRJkIcofTNKbEdAVKTgiNC6DM2l6alIglwcET5+boY5zDvcr7PvCEOv
 F39nuArg0DfN9LhSjBdBAvGOvI0449EAmROytIeuEOGvQ+ztBH3CzrY4u+/5lF/jhO535
 saMcvK8hdXweCnA2OHchL+rvJpHUuFE15H4x0481/+hNZVVsd7gW7A99BkHaIi5Tx/U/8
 HUJsK0ngDIqDp22hXj3OX/YK9svW5LBKvO7K10y7z6o+DnA04NXCri4fjb7gmm0+rGMx/
 fG/RyE7o5PvPyMkodnp/6GIXKo02iuMfULErn2vSb6NM+70MaydYymkvURE/6S+TH7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061744;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=l/njJN+XZZg26sFHKiRgoFW0I1gL0lws/7EC71vWRdM=;
 b=JuqP4gTijk47rX5daS3j7ich6QPglrkE1iD5SvbQichINJCxFa9shQF67rDMtUDpiYgB
 tXwFih32jJKiVfjfhi8ehAdJdy9gf0O4wFTg38qYzNm0IwHRu4LYwLY7UkzmtrEnji/N5
 2NdDWJSlSoIsCzTm7HrZZHknl3sXwNy40a/h+Sx1mzZ/gka1PO2mXMeyJQ3wXi2Yob6u3
 HvJKF4O9GLjkTqt+YZTfTA9PNK9j3tEtUMh7eBeqTEI9FQoWguL70jeAFeT1v8tNnS7dI
 vzX3vXUkmhGm6RXRRAjD8GPZI+iMgEh3OguWKBxF83NJnVi0Ti2h5l5bPmuNMVVwppg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Kn3wGsHQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Kn3wGsHQ
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D101740A7E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:03 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so753311a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061742; x=1791666542; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l/njJN+XZZg26sFHKiRgoFW0I1gL0lws/7EC71vWRdM=;
 b=Kn3wGsHQ9HGYWzlevnBjTpqph9C/1GurD4ZMH5Nt9sfJSc9EpF0mzDxHF8ENeF2ar7
 9ckx55KjXVxGm98cbvIZXgahIWu4Ps31Kar2R3033mMz9cnuDdJQETwOLxfCtv/xd7h9
 ZrqeO92gKLN+rOoxdtA1GdSYUsgXX2xvo6UZi/CvMEIRs7spDPXC3oMe1y3QF8e1lNVa
 0AhQCsEWu3OsWk0J7pEtuSm0Kp8J5JACYDZawSVRxKOvWAv0/fKLvHPWxM8hvTyiS5QJ
 /bQsPMvpq8vHJfY2od2MfuzCho9wdhoVbRrxFyAdhkYNU4tTJUZ+EY5RP7hezLuJIuUr
 kvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061742; x=1791666542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l/njJN+XZZg26sFHKiRgoFW0I1gL0lws/7EC71vWRdM=;
 b=ftF2fJ3qmkojaPKB+S+5E8CEahLfrD3bahzb9rFqNSnmXhstcwycOw6Wwhxxlnrdjl
 1fHGgdVHT34/JvfyaeEaSljwCIBM0CPZNafCXxvyO0Is59TJBSpohHvSmOoV3GuYU4Xb
 j5j8bh765qPXJMiiYk1yKsxR6R28lS3n8W8V1Ef7kXk/9om+E0I/rTDnHePGkQGp/M+w
 TouxiwAKJqk0dtPdy/EqJ1Cd/a/o9TKG4hE6KWPIS0XXKy5Ah8WhAlXgNW6xLhYDa+3J
 4/QfF8jSgIaTJWV4IURbReqK5i9zrUJHwnhv3O5Qnr7V+Qd8xv+dnWfgvXYFmSQfdoQ8
 ecnQ==
X-Gm-Message-State: AFuF++lWv2r/vQt39R1lZlRLrh3hclannF3RKhgjObHMF08CGnbKP583
 +aTvhrAMS1aJiZ7QeybM0GqYVSrvyljwBTuj8gRTUHHGgAUxtaixIYOtwZ52Cg==
X-Gm-Gg: AYBFou0BWieNAxkUkFIqbaHbWSQTwlwQ9vfxckShIiUBvONgUr4fwuLPgjTy4c155T8
 0U3XXjANA8dHMd15EIFHeBNwpFd+MUAEMNmAC9PruvKU/rR2QMVKdcFTwmYLxXWr1aReViPJTzZ
 D7iwpIC6ePJyetJQfR0Eoh0d6PY18zLoiphJYkc+SP+WcAasbiM2+zNeMHQsRmVy+G7090AfSNM
 9nxGGPC9xPJ2c+mQOBe1Xt4s7oxwluFKOawVuPSP4PyTwHDe4UEWa+HuWALEtrfjBY0qjSFTjm5
 VLA2Q3bZZoZAejNiI2Fc9nHJK5QFFlJXiUHoZ28KVB2mQJCDu2oMp8V2HIKvuCcyHr9uC5OyLcB
 et8lQQXHvuAzahFt/3b9rvUQJTNiCtvQB+chk2Wb0Ejy3wzNk11REj4qMdmGwrmC1h8q/gq+Yn8
 gdo5i66yzgoyG0kpdpV8DRE2avbyZD4OJKTjr49eiNWMLWSrCU6TAYemEppemiM7HQuUj2d0U5x
 U3n3gl7AP0+dERlij/i1OZFQEu0doed6K0VBsu4cXAU5TlNd3kroxSrKJDrzzWzxFhim/UbP9Vq
 42i2rVKe/qLL7GemphaJom1UGxBubPvtbM5TPaU9K3ydRNaQ2d6W980srxJeCUUQZGCvXK7Ht5W
 m1RJeFnD0k25Yut+kvP34zmD9cWbWNPM3grIgKJlx4A==
X-Received: by 2002:a05:6830:374c:b0:81c:37e2:2012 with SMTP id
 46e09a7af769-82284c589b0mr7038760a34.15.1791061742499; 
 Sat, 03 Oct 2026 14:09:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:04 -0600
Message-ID: <20261003210833.735937-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.30
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/lextudio/pysnmp/commit/fc678e541972a2f43c2a06f2d373cf6048653728

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 6019925c4b..13686eba23 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  33203585898e346a35bd49c2344deb5b  pysnmp-7.1.22.tar.gz
-sha256  37ac595c7f0c1c00514505939b4dcf5b4fd5a9ffe51b0349f60bb640c11b0f77  pysnmp-7.1.22.tar.gz
+md5  af979cb67cd5fc816e90ca8eedbec289  pysnmp-7.1.30.tar.gz
+sha256  db72f439b066725d2586dff068478dc8e9b303a4dba3294462b0e76b3cb63bc2  pysnmp-7.1.30.tar.gz
 # Locally computed sha256 checksums
-sha256  1c372007e7b71c1773a8ccc4fa840061822cb8053000f232a51da830b9d6d287  LICENSE.rst
+sha256  aadf5d3f4d90a949f05e2c185b783b877efbf625874992c361f70a536bed83ee  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index e82ba2bdcb..fa6cc9b341 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.22
+PYTHON_PYSNMP_VERSION = 7.1.30
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c5/f7/63a4833b675f3f85296d85f2fddaed93d76799f29a813a2d5ca2bbe7fc50
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/55/2a/ab68df5b1a2f673da731da7caf39c29d924735359e7d50eacb80d2d38e53
 PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
