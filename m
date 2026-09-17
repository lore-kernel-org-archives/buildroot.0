Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F2DC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE8381053;
	Thu, 17 Sep 2026 20:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEtQCFC9gAYU; Thu, 17 Sep 2026 20:08:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CF69F81026
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789675702;
	b=TUt6RliDOsU+2xV1O9ltSHgJp6VLrPPXpxFWSepjXL1oI/At0cv+ox7KugGxyZ34ZjIc
	 QaGyZBp9kBiplBxF6dU2taphaAbwtFlAB5/sS5JMTIAmsCuZ+0pgoDhcFjbrROJkPqYwQ
	 eOkWcEI61kcf+oh8Ag0z5C4aKNQQ/p1ffxzFFUbM27jqf8jE7VgMixutnYLhHRFQzpWKO
	 BLqd7fuGTcpQZKsnxEMgXL7yQiskE6HMXakF0ubZ9QQp+1zYomy2DvjfocusizZ022j3b
	 WEo5Huq6DFXP18sWkJFreegEo+HtJKIEeiQmTwowgbQzqlMTASVqTNHm2VjuGjBQLww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789675702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xzC91Qu0f7tCu/RvOBNgFvNmj22NnszLLavzZFu/3Ac=;
	b=bPytiAxAJ/1Hc/BuMY72BdnfGq6YW7AVmPrRRBl+2Uf1TtWLtkdsBR2zAqVNX03fL2jA
	 B5x1YTTqFUH+9QHX9gqWxymmbl13r0EvAZvv+PUIRuI9PUP15X6BHdVDIDrRWlzsIYyHx
	 vCGrv0Mw2Lxl71ozOUn9bwtQb1TwPa05hYQDGn4/+Rsyrv+EaeeVlh70YvQGEc0aco3r0
	 wU4DPPKcuvbzy2AviiWkKLJrGQsHWBe5+8uvnJ0Fnr3ocOoewBvCjBxXtX6VgJrWOEpqq
	 Duo0UOm9UhInNIpGnR4XmNPuI2e6Nu6VvpAEADbCsHDjzBwY4zxmzSh82Ixv0nO/I7Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789675702;
	bh=xzC91Qu0f7tCu/RvOBNgFvNmj22NnszLLavzZFu/3Ac=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YKCDsTBE13VXAcdq6K+BOJlrhjDpFf6bTPQP78FayS30wZkuMtY9nfaLSKzDrlz5B
	 +yojTT46lmC0Nse9wOh7JwAej/YbnhvtugNpXiw40dfo0nnc4mLIMc8JXySwlZyfjG
	 E4nthO4tIyPXSpYJN01SzvCAALYNh5hAt8S9rsL41SEsKXfLgKDgVkLgRk+C8Ftkci
	 QN19M4GSDVf6RCdhExfur+GZgurxQFtfumkwFJXx5+bpMMfOrl4ArGM4F2Y3lUiMkl
	 7yqWxM1Zsd7suO0YZQEgcF6jk4Ua5iL0xmQ4kYVkt7xTPwFiPwqU1asMbArrOjPONt
	 HUcFutHOdfiIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF69F81026;
	Thu, 17 Sep 2026 20:08:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 758E8352
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B13D40856
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4y6DU4cKm6L for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 27F5C40852
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=74.125.225.76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789675700;
 b=G0g/CGEKyLp8vMxws2A+5dZGpQIfnahZEn2jncIHJLyna9c+u4wxHc3VYyPiQJPOUVYN
 a2WRObA7hy0DTXlc55n6Chk7ko/RrsTHUFeNTLAcrQLwBpAcg4iOdWpMVj9HwqKITCoK0
 brYlc99Wdu9x8nfbHiNrnw38hbD3Aea07+bBtKVoQBmncgH0ybBpRKgojQGCFVwP5RBH2
 kwMmSiK6hVoL+U509q7fSFIPHnCg5bcLxlLD1vsGsFxUv6aPjG2gd8RPOX4r8J+boMUVD
 MxyCYfKtiF8yd7Px0TySXjyggcRIEz6T5DvQq9Q2nGr366YIGWVFHx6clvISxw6jhyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789675700;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Bl5Sd3zP7yxILGvl8F1GmVWzZ0jZG6oGDY9Dm763O2A=;
 b=I0dZK1x3iM4yHTTs3akMU+cXVdj8veBo+L4iV0zlJwzf3doZscPTy7UV4zLEeMl/o3Pq
 MSZD+WuhZ8PocqCadNTKJKSA+WpHZt1h4GADNVvmcAl6IMhh0dagNiwJo1+5BUmKDXE+T
 A+zf0gRIOFiIUPHt6S/e2F0YCGQMdVFvjMkknPUVIa45MrvpSZMdWuyYPDNX3bkBO9a/E
 VbYmw0ASs9NwNFTvkzQsNZ589lMPI9+D7Kau9JvRjM2ssTpVHHidF8iU87z/sJ11gVWT3
 u2cbpjVeGoAhxKSvv+D4VmYXK/JAVWm/E9r3dPxHCavUep+h4blvtLASJ0xWR8dcSyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 arc=none smtp.remote-ip=74.125.225.76
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.225.76;
 helo=mail-wr2-f12.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27F5C40852
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:08:19 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843f22dcb8so916123f8f.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789675698; x=1790280498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Bl5Sd3zP7yxILGvl8F1GmVWzZ0jZG6oGDY9Dm763O2A=;
 b=bRr99YWyEurex2V/T3xAT5RQKjB2TbgY2Ldqfjj91Qywm4BOs5DlZFWDB4FODSu62a
 BSoc2Tza8Fmd04QY+B20eP8gwSR2zc8GhcOM+Ue4WX6i+QqNTX6qewpT5oueKMb+bfCy
 RKqYbJTJDN4il4NJJ2vco6eeNZU02bP7NwXQj5inzcwVbnaxSwnwVmSR4Wr5IJ5mAWLC
 wo+NxG+Bu+Go5seTNrqe2B75AQOc2mqUzLS6gXFKXCjA6/StoQwnMgbFQqIZZd35OZMp
 68pfI4vaVXcAqiHD6/3MB8INvy049SOKLXry+JsD+ZGm/5cqppG47N+B3hXXnck8Gl/+
 Wk0g==
X-Gm-Message-State: AFuF++kvVOSWhiip+LGOsk0VmD5zkwj5O1Y+eHQA/mYngybWqjhx5Aab
 IcT6CXdJaUiJM1qQUs6m2CU0AjBSZI8FlBqzwO5Mgql+OoLMm7Mp/zcITcHbTw==
X-Gm-Gg: AYBFou3nyorryidqWckA11fupYZKilly+QTB9ws+Qgw8qcMb9gVvMEjeyqRpM4h+USX
 GeCBP/CUDChMpGz50sWR2Sx3FNu8c1BE5oVDXvtXTXWbz6AeXJ6GDUev0QFXnd1VKOIqmJ9czNY
 tFgqtDChKaB15VeGlrg9h1Rd9aq/OxPpzBYJ07vXFmhMG3JRjMQ+9tTHrclB01l6H2MtDe41qHb
 mEGvfkRmnQdntgqi683u7brA46tKR1vdRFLtD8TPP/s7gHN2YXVP+YTf7Vu5ZaNl2icAJQ8sIYP
 ce/5zbNMgiDLZxUUn7Mtdfd7xFN0OvJzbYGEx3g3n/vq1/Frzt0+R5fNz8+PtsvIJbcmlYKKpeE
 V6As5/Z3QsULuesDceIUmi2Mqun0mU+aJ98ARRzPOW0YBRYaQeZfppgyBJ/w5mmD0P0bS7ZLDH8
 P59edi5b6JHmtzUgmaIy6NMSa+2wFEEaQb8PgpGNNU3N9p4W2xRlJBDYS4qkMlZQpJmlOtMG+yc
 KWaSWOQnkeqEqzkyqJHaO12Ky/eoAon+dLpYHWq1Dq7kK+l1tfdybURHqkzuRNxEDxpMz5sr0RV
 4Wpzgj7tI05OmyTw7umgxg4WTO9QZ+iBYm2kxHRll4M=
X-Received: by 2002:a05:6000:4809:b0:487:360:58d8 with SMTP id
 ffacd0b85a97d-4871e36fcf0mr18783f8f.46.1789675697583; 
 Thu, 17 Sep 2026 13:08:17 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:7e12:1f7c:582c:d90b])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27c65sm18919692f8f.21.2026.09.17.13.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:08:17 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 17 Sep 2026 22:08:14 +0200
Message-ID: <20260917200814.1721973-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/lighttpd: bump to 1.4.85
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

See here for changes:
https://www.lighttpd.net/2026/07/08/1.4.85/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index d0ee0a5da9e..2e7bf874091 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha512sum
-sha512  47d3e802093822f5aa42b9b3324a95668d305c2e2074366b12be9bc812291ba423576e08b2a163a5f752b110139a76c7973086fbc01051f8f639998d8146ed00  lighttpd-1.4.84.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.sha256sum
-sha256  076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead2400b56efaa026f70  lighttpd-1.4.84.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.85.sha512sum
+sha512  b5fb0039d0f3a54eda55229f762868db4a5941532448036a83a12de3065f6fcbe04f57f8be030a25ad6a82cabc014474449ebb01f0a23d08c23bb729737783a9  lighttpd-1.4.85.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.85.sha256sum
+sha256  18de51b393bac4a6827879e1a7ff377c169e414bae92cd245091d80fc2601d13  lighttpd-1.4.85.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 613715b8891..a7fe0748241 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).84
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).85
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
