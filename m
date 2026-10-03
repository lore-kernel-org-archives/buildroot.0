Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885B3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A0EA60E37;
	Sat,  3 Oct 2026 21:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xX7vL5FNYlc1; Sat,  3 Oct 2026 21:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4B508606E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061726;
	b=QqXyXqGFpR5nHdtH8obIx2a6rIclprYWtvS56/V/VeIfi4DepP7kzu1x182JEWkP4UfP
	 6W4A7yqIJiGurCxjx7AcLH+nYCQ/G6yzK/0cyAVWiI8idu/zCIJNhv6LO0fLZWZRMCj1C
	 33Y805O9ONZo8iHhk+0VJlxrdfRY7K+dja5OWFxW9HTTZxNREs88T3nYgQAsrXbs+1mMn
	 at7DJkVu/sGvZuHLczt8OujXuIQq2okB1bUL8avob6GEey/k6oKbPGcAnhHZwStbHj8sx
	 Qt+j/GbBWsGuLQQ6J/UHpRiV5HZT1ac7G8eYbK09C1kczwGJ5JWU1OaXEpl5vr3ZFng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061726;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zO6PAIHiEX+r4C+qnNzGFfyKnlBTCLqPVkykFfW8Dsw=;
	b=K6jGjjIbro/G+bfWHTofuoMakvzs39oM7Cq/r8lrVjpbglVs74F0evc8+eY2piVEOx/y
	 Ap0S4SS8VErGQaosrlA7BKHN8ha2Q3AVoSQBLp7anYFMf2k9+uwvew/cmRJAgG7/rl43b
	 /kd6crl+rQBa0uX0/1kX36w6BGjA/VDaHHwkHgS3InDpK9BGX7gGhJLoVmm8TyzpCwdve
	 wGb4iUL54lZpkE0mgUwGBWLBYBWFdPRnUTSSYzoE/P0xiOpUwtdg1W6JVkGm1lpwfuW3r
	 +ymc2hXUg4eT5GEU9HM1roDLCJGzdkW+u0U+N9GufAd9kaLUQBlSwHV2CnZVDeA4jnQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sfVoBXqE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061726;
	bh=zO6PAIHiEX+r4C+qnNzGFfyKnlBTCLqPVkykFfW8Dsw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Sttag/mfGXwAXgg36NBo0b+Bdzjgc6MB1Sbsmo38pDMMhUgUSjVvUXx6f3WxZrGPa
	 fG1PE4uz2VMulxrzKkmmHL0yDEqoYNh6YyO+2cgjGmdQELPJ3BsheIWqFoHEe5UXq9
	 1G1zmzo60Tf5D+4MupKypYYBk/7Q112mlYVxl2vdfZSQg+5QRKhj3F+ry0G5P82l1d
	 mxId0oWpi79hWjmI4zAtzMYNg3EDaVgAeUKAYFznEHKgWe00A7BHkfX4a1sGuqBypH
	 MPFdshzJMqjIZIUWjECIM0AbGcJaqxzWvAbMKBMCk3MVa76RG4RoobBYYywlzdAEnG
	 HQBZIkzhtTXlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B508606E8;
	Sat,  3 Oct 2026 21:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2A21A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC7160DE5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSsueDff7krr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A848605F3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061723;
 b=R55WSBH9+Q28pXz23UTLQ0/cQE7Rgn/ftePHs+3iUpeaC62y2NLizcuK8VTxhiDxaWSo
 cTQBXBTBOU7Qh+sK728bvXJ4EiWQtGa4qUUjNJ0IDHmYuqwDbms/nvywLZrjFh9yEZqCj
 sE+Z3LRRAgkMYh/js8xtooDjJCnU7/pwyMAgb8yTfdJ+5jdJtcp/LoE4fxUAed5JCPp6U
 lHEK9bH9lK10/zI6M2mAo9/CdTL9fdEMc+FsMzB4DNisXfXPeratbOVPI0v8Os1TNBSCt
 aI1X+5eNxePszA7JyfVns8yJtC4BCOcVdPSQW6bsWnELAWe2V1a4RwqmbXqRvqINnTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061723;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=duK+WvEZhmqb1/A2AJpOrLJvky77r3tPiPai74X6u5g=;
 b=CFMZrgcJcqTTX6hEMFQubccQql1WMrWtH1khxn5JT9H8gxDzmTUY0RwYn9njw7GuJzfO
 zBLd/Y7qYriBU9bWOjERq6kgzez28jWrgpVYKg82JIj8qFXl8REES8UijwqusCT9+tHhJ
 m6WXZWLIcmZVuMZi+mhAldiLYpR4cWQHG51qTICkUPAUceIROaTpnFS43Z1a1RICVLl71
 ccwLTkvo7yqAKqHYLMGbpkU2wh17FEbBjEras5l2WK4tw+QCOfOW0VWNPEeBxCGdFlF5y
 5S5hXKOtfuYIkgTeAue6Os5+m9jbkDT9MQp7VqGFalv+TYzJJgLbJhjAXFmlFSHm8ZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sfVoBXqE; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sfVoBXqE
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A848605F3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:43 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 006d021491bc7-6dff7185cdeso409819eaf.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061722; x=1791666522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=duK+WvEZhmqb1/A2AJpOrLJvky77r3tPiPai74X6u5g=;
 b=sfVoBXqEfhHehLmysF36gc8hoNNdiORe2lMcVlz2bRp88061dCbrbuWS7XFH7KLtAF
 DJtHXuJiSk12/O63i8VzG/n/YgXJhX1prsAf1BgC/OhBshxB4He1X/B4/hrsOdrAuOph
 dhdgOnyHQWDg9s8lVzHdeFSsC1xBlg+aBeLxwWPUjXuFJidEGtu4DSyirNUvK3mFXBXi
 YoDFyXBX9QpR4lZ9rOj5Cacb8Rh8feueBr15buXJvM3r+JyJcWczqvdPAHZ2UBeXJDY7
 xPULZ+cJwZwIxcfw7+D7rFx07hZViAqIgpbru88IzgoDJ8O8Llmk21bWG7sxToNza7tH
 9WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061722; x=1791666522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=duK+WvEZhmqb1/A2AJpOrLJvky77r3tPiPai74X6u5g=;
 b=21wx3hkNfB50ZnY7EBgjQHxjGTdy+VcfKrSGshHBSrr94l1Jn7CpP7sU+p7F+k/4I5
 tk8pJ/qpv3kJ8h67SE5vO1fTudKjltSSU8wiTS2tzhJFmJPFLXdCZPoZGubuVYdagFy4
 931ZGyeLptHQgMYFZvD7jFZfLzKGTiQTAibXf1zoBspLXzQdGpgIvXXTJl/wnXmwr2AF
 DjDkdzE3+QLTfDCmftQcHhxPC9qplNEDBmI90nyL06Vpcn6NMFeIteyvV2e17OtDo44q
 Od78hiNoZS+abNec/KtcOSNGU3xeXEc9iPDVj6tQ8XHap3Bf+ZENWzYDi982J3X/U/RN
 pWDA==
X-Gm-Message-State: AFuF++m8Hh1xnO5L2be7WaQgFh3htFtCr5zSsM21cH+lOFKbef0/7FGa
 bHvHnjfiH8Gz6inKi2gCXAqqm9FausBGmQNFKkNqHbCQDLdyGSJJQOP180S13A==
X-Gm-Gg: AYBFou3BoE+351zY81JKlXv0HsRUKm+oqfIbpW2e2SZlevc96J0O7dDEr26ZPhuGfAp
 oUCV1U0qgjiZwvxWXEMUbZ9Mq77rRKnUCztpJi32awQPOm20b3PqWZ95PTkVWWETTKI/4LF5BDS
 FAsFdxp6+uFDDpYwUvICQrDPayU9kh9wG9vf2aLpdsugk55+wYDXUD9P3O+fB3O95qpvLXgtUcO
 1Gxs3mhM3bBno2rfxAqPibZqGOEruADCq7J6c7XUTL6lrlgQ5D6IhothaOHMqH1PI0i/Sn+CsQu
 xqfzl6kdYZtvdU19/bWxbHZwQ7odyGu1qd3nPKy0XpjX0kKaQF02FkReRoBhxEZmpb+ns66bpWZ
 Sosc+pelm0PlNVpmENqie8sJx4eOR9KjlTYYLzZUWAAcery/MMe+zPc3km+IZj5oBuNJisIeQYY
 gBZ2dPffV938bI5AM5ejDwg4L4+n3aYNp/IqEA+AQVC4a8sY4TIEEBpfHX5SGjeRQjHbGZnyele
 DLrdvJ+pev7L/DdOLclZaGYaJv6XHq8+1kSUCj4AgmGjQARKZ579j8rCyd0quHZUHeuTCGCCOnk
 S3Yk0GdOfrX3eooI3FYYMtuC7Xh9b4d32+IBa8aR/h4IlQ8L2RD1vOcSBnQ3/5BipI4tUNIBjRF
 RGdUIyc+R0CoUkOU5tPHeK4p5iECY5XMPggwnHaJTVg==
X-Received: by 2002:a05:6820:f013:b0:6b7:46fc:1d8 with SMTP id
 006d021491bc7-6df3428cc64mr6191745eaf.55.1791061722117; 
 Sat, 03 Oct 2026 14:08:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:54 -0600
Message-ID: <20261003210833.735937-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.66.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 57e03d1f08..388546308e 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  c9a3637bc4d32de7254a1cce3212eff2  fonttools-4.66.0.tar.gz
-sha256  ef0610dfe7bb5bf574d9bdad6f597403ebc9807d124ac6f148d7604b2609be98  fonttools-4.66.0.tar.gz
+md5  2a762cb1eff7c310f0be506618a23e40  fonttools-4.66.1.tar.gz
+sha256  64967c6ddb0d4c610dfd8cb1485981b2d27972ddfb7d4bbbd9e199d2a089c450  fonttools-4.66.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 16979468ae..028861f4ec 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.66.0
+PYTHON_FONTTOOLS_VERSION = 4.66.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/a2/24/86f9930b930b97fc82266083320f3c34643ef67261c32651e893db525aca
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/87/b6/126c659ab7e0e03e01a5f5d223abf7b2c0691ae92718085a212a3924a2a3
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
