Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD453CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5431F80E78;
	Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcaFv3pYI1Hx; Tue, 13 Oct 2026 16:43:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6CD4380E7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909824;
	b=hbKbROlFoICtVGfhKmaNnOaMenEpIuJwZNnUtlmmoj3xRKkxVsKo1pSRAjPGMZl59SHH
	 K/7Zqgok5DYzsZ8eLHhbsGCz9t8PvuZcuF5rTiNqvrEbgiweF9k1Nteb07We++UJpXhRh
	 z3rvYI3sl5wGXUzyKkCF7AZ3zR3P2a+pSNDhuIWqwgfcOmvH+89sQ9f+z2+W/kfK4bMlz
	 1O74oXC1tqTxI+yjqmPd3K/VHlWhEoNhH9wt3QuKaGeS2p5OjYQk+WDVSIHScSbc9T2bj
	 j56uX9g3fCP5lOewP3bR7Rr3YODIF7L3BZ7rAp0wc9DPi+p4k1Yphi/cYLE/hwRUkkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909824;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qDrpbT/TLdKVjO1cBjn+Pen06A64TnI0DmePnK3xwr8=;
	b=puKSNXBwbGtWF5I+4tY0A92k98bJkX6fB/UqzfAfMjtHdzVheRPCcEVM0NplDceUNQaV
	 tv4zT0DygouhDrDI/g94cbUFPaJRtDtlOVTjg418qwm9wcNx6njn+kU7w/cH0scfqmBLb
	 S2w2A1q6doOQgL0ztj4CRVygOAhKGlpH+98G2FYh56kTsoZO47tM/bDgsSkIusODT6stK
	 52S6TYs78U9vfH4AcpBkmnRQdRe6dkN8XPKL/aXoRfRQqoWRtOERVqWxlSk4UDdIV2cVC
	 avSQqzp44NSZPF/ubckYNpPJ6JFrB4Z5uhv6y1srifoLeji0zEf2Nf+Y1YA+mQqSJeg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909824;
	bh=qDrpbT/TLdKVjO1cBjn+Pen06A64TnI0DmePnK3xwr8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RNg5BUgTjb7neH3nxt2Pd9MUnPAardvyHgih+zUGM2KEyfgyZdmKOFWPASiDaxbDB
	 lbQiOqALIWZRYkYv7xV2KOfzDPvCNtBIvsNtNeqr7zy2rvP3z8RL8ZiO0M+02V+pF4
	 xCZW3ObrBOUqaIZwfWgRjzhj+VsQQjIraIKHHN41k0Hf02dixJWiv4OyqM7x1HHR3Q
	 QvG8O3U9+aapGMbAaJE96EdIl32q1P4cLuJhdcKAsiHWQiP830o5vcEMr2K7gEXtOy
	 Lsmm3WlJnT4KIqB9cuDgMVOAJYwC5nxUUY9jBQFu3WU6v1vWCAgmCZ1z12p9B24x6T
	 wfp6ktxmoPyHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD4380E7B;
	Tue, 13 Oct 2026 16:43:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2964DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B389D607E0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogFrfdRVMK7C for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDB34607DC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909818;
 b=cMQgs86cWPXgu3aXnU3q85osYBBp4o/n+9gmUL+mkZ07ArU/b7s16+6f0e1WBxqkDWXe
 waefv+Pqx08jBFxm7FGq1Ae6FDABNoHOsSJMBz1xAJu4AFEPB1ET1CMv3TmbbmJlIObCq
 8mWL1tSi+RxP/YyESd8fA5cuHQWZNhBetWMxINNK9mslDDxaNyQfuAwThpF7CNjcxdoGy
 tj7VaOSFPh22mf5WydsCyqcnlrYIktpb2xEZTtcx67apr6FdKFShSVgx6xkGPvrhGy0jE
 6EzdsxHVvl1a7QxhWDRTqPq/DBgwZfjjoDApoeNRmZatU0BqENT33eC1JuckcqmyE5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909818;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=v3ZZBBAeaDu7AbsCxoizehxeZV9fpFaVChRy7poTNGI=;
 b=kXpXTVhf2PoHIDm4ZDC/nu1LWsGwphjwstynnWJjUPTlUZME+NSWKI5aTCaPDVP8YJmA
 x9FEhyXh2K3GETXC66IR1dhrL2+d0fFpbRVuxxqgMTeRqHUaD68/d8sX4UjWlBVuVw/oY
 Fy1eOPMiQlIpHwDmaecOfGcZFlPHXkbl2SCn+q3HXwr5mV2tqc+1b95zS1qUizxrezXdp
 6gW6THQguuwFS5nDRLdCUypct1H7Ubj3yywuMSSyXAjLureSqCb2a5teCpYNVKy06iJ6t
 YAvdCV7Cpm6Q2zzIRS8bfVB3o3ayT9hJOKns/8bcPU/+OHzRu4KNbK/uGJ861F21dSg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=i6LshLSh; 
 arc=none smtp.remote-ip="2001:4860:4864:20::32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=i6LshLSh
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDB34607DC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:37 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-4a691d29614so987147fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909816; x=1792514616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v3ZZBBAeaDu7AbsCxoizehxeZV9fpFaVChRy7poTNGI=;
 b=i6LshLShU0hjcsJylPymimWYP8UQzAJ2UETuQhhOnXhO8/qmz+mwX7e7o96zGkDhrk
 SVKkvfsq/+NeuhmjDOPReqbY97Ns0NTAJnMzXWA4YAyNkjLOVXQKZWUIN9QpPz+HI2sY
 TCPu02kb44jzVcmh8wEmPuXMlHtZgdJhAAXA8S4IRAn/wb3LEG4xor4u5rbyQs9tmJYx
 ZsXJA69QXgO8+WIm1lzWCeIgbRAi4VSSCPh3ZdtiTM7paalUWWCtjgIKKaKl9PKkYq4t
 7cy6N76WvCoCQBpPJ3QWeNWzdslAhhmtRpJJatvn420UziTVMm1SRHuN08qDqeiDalth
 8YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909816; x=1792514616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v3ZZBBAeaDu7AbsCxoizehxeZV9fpFaVChRy7poTNGI=;
 b=K/8v4qAOvEv5WXj/YbHPvSngJ5R9KpUTa9mb2NnVwg3ED4KhfUnezQA5GJ7yAajJqK
 B5WRL+o7HxUeSWJ3d5iVCsL2FvijKptzJaHNGWHZ8HQKOHoxfoxQYNPRz+LPyrrG5ILi
 p6MoT9wBrgaYTAgkuXU1x8b5AAdBl/RW+lF+7XoRHbBQfH3q+hTRwUAQqF8AkSbqJsE9
 qdxVorTxooa+Ad5ml8visdKYx9ydJs/mWHNL4SIgwEdQcUon2bcKYVyZO2zOEHYojXcs
 0Je1aXdSSCuQGVCrjveea4of9ZDSF9Yn6OYH+LDpPhcg+1QFbvmU8aZYSrJi5KWMfI7y
 u1gA==
X-Gm-Message-State: AFq9FYK7Ec7K0gY9r3NrotL7TQbz/Mw/71+FSJm8OS0fQqkafEif2qUq
 /LshnnA+DZnZNKYeyIrAVp5/7LtnAZLo4He7A5dnvNjt14kxRY24J22/bIhIdg==
X-Gm-Gg: AYBFou1yOgyUnGZyzQeqEWxPTUtWA4lNfUZTvztO/0OMCa4V2ksDIvczQ+SIiyNGE2B
 Z5irxq+DikD+fnN7ENiAdbhfvTtdAiYVkl6IIiLbo2jBBNqQCss9wts86WMCXRBkAXOh7LU+IVo
 o/gld1wjHEb2nfddgCfiDzLlZx2hasbi+otCVY00bbcU5xjdY31MWmuRx7w7GG8EfpUtA+SAvFh
 XZnHmHnKchtxIYzVP4KzttbkaWi8d+s+pSXHJjAb8chCmI9Pu6teGBSG/5f0DA9HwqOC1lwaP37
 OJ3BZUIeY4u/zzSc06XJ0pGQcGQc5N/tBrMIA5yrNZxHcmiFVkaiHVvW0tLH80Z7UNIXhTkiI4q
 cAtrIqzIobgE+ZKNDIco9Jg0KmaIOVZSZfXCNzskU87EDYjiEADWh8vNnfsDhGKtLCsGAauZTTF
 G9bZItJ89em0XDqYzmNnfzZbNmT7ge0bOgHtMnlP2SVbBsOrTzuq//y06GmBpwVug6RK6UltCOA
 TicqhQwtf2yDvfG5P0hlHkhngOKVTt2OKpkUKCBcUppDOl2wYGepgGAXiW84uIICouqxrc6afbg
 mMPqe5t2I3QBlDFoDFzK71Muuh5yN/oqenMPi5eLtOS/fEW4vhVQboGDSgNl+OmxWctNxckX7IB
 hI1bMATbQrxAs4MQ1FJjcoX1I2KNAfnuYzWr5ZNYVkWI=
X-Received: by 2002:a05:6870:7023:b0:48f:e363:5cc8 with SMTP id
 586e51a60fabf-4a2a89bd581mr10876442fac.54.1791909816490; 
 Tue, 13 Oct 2026 09:43:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:12 -0600
Message-ID: <20261013164254.1476592-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pymodbus: bump to version 3.16.1
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 85eaa0e103..2e05002a8a 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  fc14238eed9f8d3ae4287e82911f9111  pymodbus-3.15.0.tar.gz
-sha256  4c5f715128bfeba59f4c9fb3542b0c32a8afd4b90081111e39c12f7af0c89aae  pymodbus-3.15.0.tar.gz
+md5  41a9113d266bc1839563a681c57846ab  pymodbus-3.16.1.tar.gz
+sha256  19e571826dff37860afc31c845c1fd2fb72acffca02a233506b32d94fa022c33  pymodbus-3.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 40f0e14c3b..6f87d54c61 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.15.0
+PYTHON_PYMODBUS_VERSION = 3.16.1
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/e5/b8/03dace16e0e5d1c3eb16e8b9bcce9885f5e8a38db34345ec375cd70ed2e2
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/65/ca/2552fdc467e87a04654af2b6cd994a29653cf767e371792810e15f4715f6
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
