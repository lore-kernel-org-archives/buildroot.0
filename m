Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5607FCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232C3607A9;
	Tue, 13 Oct 2026 16:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsPr2PUotSbG; Tue, 13 Oct 2026 16:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 48F2760791
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909788;
	b=WaobspxBmBiGv9hRbGT5pPhSYT7Vj8RYeNur9O1lcmjl+az36GKAOwnvyubJYsaMI6BK
	 df5rYaCgtk1FMklI1OcYOJbF8WXAqHXnN31YZpKUdDoCw+m2Tkh5Huo/vS/Q/iNeBBg2a
	 f2LwtHbIvh7xsZklQ9M/R4QcY0sJeQwG+rJMBgNSVTV/T6AprVoB1P9x54gzlPw7v0OME
	 JMBJUeau2hPuPqJKenjeSb+G6A7C3FdzCZar5fs1zp24YPS79pjPlWniMWYHQG6/gGlIE
	 7dfmDbHVaBo84784PQb0UEl0VYc1AEWh/QrO72slp6UDsd0MfdJkmF4G/sMeQAp4OmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QFVu4DN9aVTIz0n06wsLfyjHbtDQhElGA4LcCwDZ9ks=;
	b=M+C1kYcJSMQZp3SfsXnxgyYhHDOIXF5jf0lGkEcISWvV+meYxCQPzDLSM5QwWlmwd0ri
	 mSM+H6rMCSzyueisiS0zOVLYpqP8VGtP5SiyMb3MHH3ClOI/lOKHNjgggVFUKj9ZZb20/
	 T4tHFNiBqF4KvcZI0YulYChRUsRuTbHfHx56KmGZ8rubS8HVKGWAeeN9vpqaNBfWJVEhX
	 nYSuda9q+vIyMyCWyqz0tu3d6tfHcJLF5bg03pOxRntNIvpfKlIkgRI/6UiKX8uHUfi2n
	 GSIxN237CycJtGQZrVUb36uah4OTrVKVOUGmDjYpu/E2TG72O6GQy/qKCbbbwDTqvQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909788;
	bh=QFVu4DN9aVTIz0n06wsLfyjHbtDQhElGA4LcCwDZ9ks=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ekx5ku6+6MYnt1JJg2ybhm8yCs1IuwR2V2Q1pjGcxZPwQrcTu8+dZMSu3oR043VnB
	 QwGIH+BcnBdoQbFmnM1wynbpF4PQwTgTWNFlxn+GKXlSSxQPPBYIFEH+EPThskPlVV
	 w51YkfHuZidZ0F9X/htkN3CLAXHmnKP/SdMqvx8pS3DX5ztALIPXcQmQ5czw/b6n4K
	 G9wl75Z1Nv7APETAEVcyNkULgvUThejMPQg+llrlNS20kQLO1TqW9Ilqlf1hcLQxCS
	 sIcpUr/7HvoS72ej+/V5HnydltLmfmqF4OM5Lb8qybea+bKtZN53xhFENSV+wc/yq4
	 pexYY9CisOhGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F2760791;
	Tue, 13 Oct 2026 16:43:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A22B61DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948074007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Tqtt54vUJZi for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B388240049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909783;
 b=FEy/2ocH5vT37eAJ2IGZROPPf1/Z++IC7FcljZk/fudUmbdLWtNkHt9B260tGkn3wfXj
 P0x07uYo2rQKTn3f9LHqVokq3nViqnwM97CfFkNJ4OMtlh7h1eGRKzkewBU+FtE0j0xWB
 di+q9mdoLVTrgOlwTriFwWMIFgScSX7Hi5OUiU2C/UxolBowdISBS0R7gc6URSzSTPupH
 3FaTGMF0uMIJF9RsHdBSVcR+3rehWIVJUka/jZkXqn+XnvwFAZEaKR5LjKbyeHkOr2uoE
 PF/hfDBHoU493hSrr9ApyvCh7xxbkf5NMb/RNRawKGB/BXy+zg4X/jhCLYPxvNHEetA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909783;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kkfUL/M+mcxAfMSBsnaTMcf+e6beJNtgwcjZTEnI1Pc=;
 b=US1TsrgZZU0WKqUuNbMA2rd+fpskY+6gy6tKXPauPkZowqL9F/1PJCJgJ4pXXwy9/uQE
 AHW2hideNT3ulI6FIe1VTUsVBBbHp2nBv4E+6CGPklV7dgxK94qwUuVCefRYCL7U5E1tE
 kbyAIpwt1t26Xp51Z7yrzNaxrHoJeZ8KwR2dV+X8oRUUWmPpEOADBbkSLa9wyPUV2TNZG
 uE00wIMKJA5dC4pxFJuYp78kZjhtxPvpVNriKqhgzp2xGXEgFVNS0K8mzoaK+oaOHCSHb
 vRQdrhnOLdDUlQGx+O2mhWifsCgd16Pppfqr03FDDdcjEyvgeIa4FKX7EAj53IR+30A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rGeNef6g; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rGeNef6g
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B388240049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:02 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6dde81a6820so71489eaf.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909782; x=1792514582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kkfUL/M+mcxAfMSBsnaTMcf+e6beJNtgwcjZTEnI1Pc=;
 b=rGeNef6gQ7onFp5ZPLJ1Y0fHZO/W2mZZA72VPK1OMz9d5V1PTULVzdwLVdXdNm3HTq
 w6/eZsO+/9zOdtWOYtRArdnpL1zjov8rWLJUW/7/JudgLLXAwDFJFRyQhody/7V9pIhk
 R3XlG097bgXRX9gi5nXyL6xZyeh29w2bZZlVc3T8GM8rmo/h4cEgEop7oRDUb801um4f
 7TOj2ITg2aN5/p02BzO/LBB9deyDdeKlGMVCXMf0ZPk6VdEqSyRwlVrToptsSrKj4F6m
 Gq/Igu1XCzabRpKf/un4kLVcHvv3GGv5fqdRCF4E6dwt62tMvwUoYcNgmdeTOnG9f2/q
 1d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909782; x=1792514582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kkfUL/M+mcxAfMSBsnaTMcf+e6beJNtgwcjZTEnI1Pc=;
 b=gSUCxbLtgBvrYOUNSqHaMpelBW9ymvSd5rKfs1FlsHGY72b221UJoih8kNbBHnvDIK
 LlSSmuuduwX3H+VFea90ouK0Qeo/4JLDJA1XkgF3BANshIksQetwgparCu6DKqEqC2O2
 SXBqLssQ24X71O/ZCw5s0cR/u3cmsB6YBYyF9g+JXA8HNYLG4Md8nHfpZGUO4ckuPM/U
 GjhyzJC7P7JkX3/rsjQD4QmogHlZ4p1FzEkxEk71ZqdnrOsUZRaJV8oCcoyf1RlfPu/q
 D3tFEYqBV3VYgxZMGnFKTLsYEFPXNK7o430cW9hI4vKNPjB+tU545NUUhdVElqncA4Ni
 Mv6g==
X-Gm-Message-State: AFq9FYLXKgqwj4biEBZWmHx3tFnIEAZlKQxb8Dd3GbhkBjnfbi1+SOOp
 KkxPozr/z4s4G+WWwk/wm/qY4HvAazHmjObESnqEjZq3XX0IiNaLckw9K9uCGg==
X-Gm-Gg: AYBFou22xuguXc7SZH9/oi9EMSN97YJk4Z8IlX4Ry/akp9pwhTWMfyEOnlscqa085Q4
 +5o+D8uCkNIDDLNT+y/KruZHIOkbIgsxbGwoyax3nlzOOzWM1PK3c05U6C94+AifltcPf4Cvtq1
 b0MX+BQEkDjxISSbqAdWAX2ngkyBV+sBlpZuNJzq42Yio0Y0lMnbai/hlXmOg0MSg2PPUy+VW4r
 DM1a24oqMW3fxU8vSf96BNPZIUPl6uqClQkIVaJ/zKcPm7As/KXFvAX7DfHIPW+iIqhxwl8da7t
 7I1MU3uqdmExj1Qn2fpMKJjlRozM9Z1XUDqJMWjA4mr1DVcoToU7Ak/b0nOYbVs3ZCqm685f2ON
 C07clhvqEhZCc3F95/ETvnl13OfxNVcOA3gd8gFIzroT/ounvlVYtdiZTS6gFLmtxBAoxQ8A/Zp
 9IcZixbiv/cnMfdnOnBTpfK9pL9DXVDF9yJGJva6VlsR7OJZZQvk+4QTvAb0D5kJH4G+6la3x45
 hh/v45LGh+noLLPzSzEajfWanz+YfMG7ioex5Ydr2Z72/RYffDdSZqBROSDSvy+59WNShohjtNI
 hesDu0gOgNEXiBp9uBftiMQht4vq/rccTBdopYdsjFkSH2VkuzyZ0FRwl3s7rQ3uRCYb8JqX2Ju
 nzqMF1ZwqfEY611KPeYzOsmDI8b8U1NnaWZOHB3pj0ZQQd/UvfHdjUg==
X-Received: by 2002:a05:6820:f023:b0:6f7:2050:a2af with SMTP id
 006d021491bc7-6f72050a9ddmr4767968eaf.53.1791909781888; 
 Tue, 13 Oct 2026 09:43:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:51 -0600
Message-ID: <20261013164254.1476592-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-contourpy: bump to version 1.4.0
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

Update the license hash for the copyright year change:
https://github.com/contourpy/contourpy/commit/df247e3ff3102d2db3cbe861580fb5957ca9781c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-contourpy/python-contourpy.hash | 6 +++---
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index 2d5acb2375..13cf8b67e0 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  3592ea8e491e04fc7a87721e0beb7b0e  contourpy-1.3.3.tar.gz
-sha256  083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880  contourpy-1.3.3.tar.gz
+md5  e44efbc1575ba21c84e7e925130119d3  contourpy-1.4.0.tar.gz
+sha256  20156f5a1ac4f8ce02656e39a61e82164a3d359796dc8026f75b062783d500e1  contourpy-1.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  34170979fc64f4f5e6dfa66ef27dec314ffffc5852000c60f4836ec1dfbf156e  LICENSE
+sha256  11401c428c7014a75728e8679f9c000aacf262015aaba65a760d41aa1130b3af  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 4fe04f5f71..92f91e164e 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.3.3
+PYTHON_CONTOURPY_VERSION = 1.4.0
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/83/5a/a55177dd22553a277388e8a1b3220e92de91bacb28356cdc73caa240121d
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
