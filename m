Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5313BCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B89160DED;
	Sat,  3 Oct 2026 01:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpYE2HeKqgrz; Sat,  3 Oct 2026 01:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4ACD060DDF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991236;
	b=Jwq4umc13yIXQoLJ2cD5Lno94tz3iCZyI+qi/rCwJtBPbu1+D0Qo5+aNvfjEsZumvrxF
	 4JB6IWfbpZFD/2kCHk8kQ+9LA3+7X7bLTLrp8Qn1ENlejjea8PX8p5vjkz8GNil9Pfuyk
	 gxro8AHOqHc7+7lnD5DKIa6RNk6YxSl7dY60Ql8jxbKj4c+SgwHZzNxpYviL7NsiREoRA
	 Lbo1FSMzZoYWcwPSnUb/GN+tPXErscU9ZLvSUbZ0EpKBh7NXUyNcqRn4khQkDlKNQS90M
	 jgOU18sQk04FPaWS5y4fljkod33JHOwvziXgIw/fdkKuy46yp8pRoM/kBqh9qSfRMuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p8M2Iwd3vPbTxh/PCkbheOvgZ/eVFoOWvUsMr1sk1Wg=;
	b=E4/t6cSKhTM44Q3DPB1qCPNlYFcBYfABtvXyiHCYhAhq7NJZGTE835zXpOdNoLg9eGwl
	 sLub/eV9YtUDyrrJaFCb2wMfvPR7LsETDmKI0b/HXb0ho1NWBfJX4XjGvIlo9+RM10S7x
	 1JP9SFhNpi0f+UOdcsqoIwXHqIb7Yy1yKUsyOLuEVE2RQ+v9juqhWuiO4DvQB0p9SrozO
	 acNqJOvanHweYHW9CifJiHLbpW/eUyDONL7+wXTFIMvnSijr+QB9bGc3876pV+TZ84bXP
	 kxALGFLxELR609it7T35lRx/aDy8dBPt/+JQITVZe0UzAB5E4sy4Zp49Qme5lVbdOQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991236;
	bh=p8M2Iwd3vPbTxh/PCkbheOvgZ/eVFoOWvUsMr1sk1Wg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fDGd0J7sDr9dQyNGhWwN4ZDIYZ2GY+EFkisG6tHD1Ps4w85mPhWADQ6AkzSeAxu6w
	 /kYEyLsYpUYg457vRVA67ydfcNMLMnNRwws0Jdd3ClisD9CjLXEIBzdpfaDkRQhEX1
	 csSVPWOpA0Qy1JkA2Des67c3yM7hfVv6EIdp0FVj4LHMo+bWE/6UcqyHl2q0KFn/EK
	 8/JJP4MhHsQs3+e6S+ibF2YNK03pM9tTyrWXPohbr0SyStveCBoY6HZSwcekBXrnYk
	 lx0Z0iRvmA3cGbOPS7lGVeWS/D2dPfQuapFz45brQ2I6lTOuMXr6Kay/BftYUXtPxW
	 vJn8sqbDYx4hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACD060DDF;
	Sat,  3 Oct 2026 01:33:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCC0F2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A5940E4B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tNKne-0yEB2 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6D5B40E51
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991232;
 b=DJJW4eQOpm4mleXzJJSb4BlhQJm9APaT8XyS0zQDBzXJc22mPTFystTsDXJoe7QMlVJ1
 inl0Ea+WR+txf7wNLmlieATJKjRiENluVtBiTYJYQqztQuvubuECKlsQjBsl6Bkql/SKs
 WV6UbQKPmsbt8lY/iylbIw89dXyzR8WoiHepg3R1FUkRC49uE1M7pNFauJPOtRzZ79Kcj
 x1xPbl7zs+w+F/YTn6deTOuWiGREBF9UJAjLhktGUCpr1LWlC0RfWo8bafhQrtEaHAWuH
 2thaGx3ow5fBxQXLrX0yLG2liLYrigHjtXnmOEq9xV24dN6sgYSfJfox6dubJ3HyJpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991232;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=aBlKqPM7xoUqcveXwefFGsYa32FWb6cwKMN4cKpq6jc=;
 b=jNxg7WWfUUW9yyGpgWAlHLq46Xb5uDg6szlzdhOtSM2RZG60HJ4fyoEfYGr7dYowR9nS
 yfJTDKNI3Vfoap4NcwEu4gMwuA4+NCNw0YnVW8+BmrdXv86SlnvYLvRcWEBbA1AXvsv3e
 UxGSiGE5Cq+pfDYf2O1SpDn9WYkpu1Ys4r1dlp+CP6EW1npneSXGxy3GCs+KMIqsC0Fh2
 yT7/z4ccnB45q47H2zzWvSs6KHujx7+MqChJNQFyxIkVr9z5aJyrRxQt1H+bH8hp93TBo
 nh4AOw4HZMhU9UvjlphVozpxoXtB1AjRwLw3hu7iJJ3lQmC98YVhFkkZu/qzvUPiJHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=j1gZKkhP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=j1gZKkhP
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6D5B40E51
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:52 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823adac76e2so211968a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991231; x=1791596031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aBlKqPM7xoUqcveXwefFGsYa32FWb6cwKMN4cKpq6jc=;
 b=j1gZKkhPR1AMRSQ3bMzw+e5wlE2tBu4pyKx07lsyMHSu6XEk5/gGkqy0lmVqNangfQ
 6sMVFRsGHDX48SKr6izNauS6qWJqTN2xJrtOFJ5nCFmjHhCym8gtueGdwuQNPXICF2TP
 /3jJGYJrlIi0SE+cidYXGJtEGZOtZsCosIZQi8Zk0WsSswHq7QAjIgBfVeGq0urD3BpR
 I5KkQHHAUpFHtSpkCXTBFYuTgPcRJlzBoZOchvX6V799nObvqusE9EUmMlc+uOO+TPds
 9jaEgSWSVeWq/ouQ8/7y3FBzt+/WHBrjY8diSBSoWziMasS+UqiXYwvo9vFH9231i/eJ
 GLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991231; x=1791596031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aBlKqPM7xoUqcveXwefFGsYa32FWb6cwKMN4cKpq6jc=;
 b=kQkw4WsLfHX1T1AG11Q0+NShX1rI82o7i6Z2tAP7xF9Op3znLPc/Kv81H5QY3OieyJ
 +RTth8Alr/XufDaSbcDu9/sfz6cguDp1KfIQ22AufGLKBJ6giPYd7lupzCI3MwINFruR
 vj7+acioLXSb0jNDy1afkZtjbf6whiPTw8FuuBlXZIG4lWibbIEQajA9mgx+X845PjEt
 muCOs+x4DnpAoFtFLF79vsCT16RzeJtKM+YrJ9x6YtVlh1UzD6SPCbTE41wqUvhhD5/+
 bLG8usgfxmNDKHpwY68TzJQIFgQbnU6wpNetxhXBuTWjB/IBMOrDGe5Y5Qnue0ffHBng
 hWvA==
X-Gm-Message-State: AFuF++k/tXXCwOHpuxyiSBmRboSqPm+1JSFc+jostYeXAiVKHf247vUl
 fKWPxR547oi83LRGEt0yEip90q7MCLgT3sQw79L0z9maETeFw1akl6z8bZ/sxw==
X-Gm-Gg: AYBFou194PGy3cdj9hb/biRnjkuwfYDAflM+FEV1utZtpeJ6jvK5Q0r/SljnTisUh4U
 u5AE3z3TJtpEmc9CWtaafbujSp0U9ecwaUQF3/74Clf6gq23oKt/s2m0+hBqPUV7szpZtinvbwj
 rIxKgZgHJd90r6Ec28VINbiTaflxZfCt0wpiKYvCpM/SgAfgIE2+xupcjXYIpt0zB/JR2TqfEKI
 4KAC6YbkmiJ2xNMk2cW2+OPo0qebKokRBNhRs8Wy6xc8tBX1Yh19VxNn2JavoZbcWiYS/1LI9AY
 zbv6kl+OdlLmfV0PQ64RvoSgNWu/pNFkkOypHNaHDXKDTsXXbd02ExMxQA0GonhTMcqqdoMhAs8
 KgfptZmMDWqCkW2+UTJat9eFb5HKYHn7TPTDrt+iVrWbVhjkn1h449+nNX4ZY1I6GPHQHURfCxP
 Ry8xny7hI1oaaPpvUpOee/++JKfgGUiVhy1sMP8eC9xKjVgkOQCPOV3pieSmkUtwMPkd+RuVhha
 DTX2YJ/QASfmXA8cB7Qdz03lKp15XRo8NMbIx7rERQ2Df0R9dKJFqHxPb+rXD6BjT/3a+h4pPNv
 Ny6Mn8bOzEOBZuJpw4UhGpZ/Ip+wlJS9e8dOZS8ZT+jG4QIFbAuwLtHsIBmcHW4LEJaJZtgrnBF
 VAb0ahJCLxT5U/wnGColgW5FMZBPBZJMOssyQ88gm/A==
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id
 46e09a7af769-82285a5a05bmr4449771a34.21.1790991231489; 
 Fri, 02 Oct 2026 18:33:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:27 -0600
Message-ID: <20261003013304.400979-27-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 1.7.0
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index bed49bf689..840e0330f4 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  2d1e880ba9520c487e52dec610a0dfc5  starlette-1.1.0.tar.gz
-sha256  e83c7fe0ddecd8719c5b840080325aec0260acec86e9832899e377b91d65e90f  starlette-1.1.0.tar.gz
+md5  09363df3ca97cae1eab654fd0d2e8bd4  starlette-1.7.0.tar.gz
+sha256  c79f74ea63cff761804fbbfb182f1e0b440c2d07b164d24700c5a1bab5d6ff5d  starlette-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 20126e11ae..732085a132 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.1.0
+PYTHON_STARLETTE_VERSION = 1.7.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/95/66/4d20cdf39a8d6a51e663b7038e3b828ff211d3891a43a713fe7e4643f3a8
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/7b/2b/3850dc6bf7ef71b088962eba31dafc6cffd2f96e577ebb0bb316df96da3e
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
