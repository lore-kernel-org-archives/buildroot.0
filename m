Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5CCA5FEC
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 21:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A821406B3;
	Sun,  4 Oct 2026 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4zQWeVVoA_H; Sun,  4 Oct 2026 21:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 604F340687
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791148856;
	b=pnWpc8G6SI78rZLXyyJmYqPcNLTjZRSWl7/7D1G+aaX9duQqPdtOvZMUxdMSArspAQp5
	 AyKqyrYqCsvOaARqJTKo+10JiZf8Q9OoZ4nZSiB2uc2wg298t14U+vuB2zUMHK+AljwRe
	 a70sleXUryFKoCZzNW82wr2KYNawvA7Aifa8tUDGmjLK71GBaa1XjzmdZ7qc5MStW3K4x
	 g+9YoJDlSLRr22lODwboyJNAwyIZOoW5I8c2cfC0AMykhBpxvzgSN3yv6bC4qnPJZB+IP
	 kK+764DeuPhkRHylaW2eEMRAghnLlKoS9cbl6yoltKVt6m3xb30wUVWbfqATPrNJGng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791148856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=dRP1Ak/FaNTf6MnIDTb40ttNsNJVPLRiaodK5XoIU/A=;
	b=VPP69kZDThC3nbAbq7xZCdl1u/MHDrk2HVTqdOjIm7osxPwldlBJoLZ6ATtgahSD1dnS
	 pjY2ZwnH5oYA0WjoJovAfgRc27U6uDXpFpy/F86rOG3caqW1m8OwATqCqto+6YziFH677
	 4t5Ffi8fGGwoLKQ3z+L301riDNPFf8r2Qe0vQ2pTXEuPgC3ny1TnA+pvp+toND6cnNSRQ
	 3lUzhICbXMxFKRuEq85wQtbRhT6ygy1VvJXpPIIcCLM/2mNxEmf+3+2FqLtQt1ut6qSty
	 H1e6gABtqwp8BVM9nLY8jecdurmhHiVCPUdoXzda0lUr5Xm0/D5zepnPv4swzrKfqZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791148856;
	bh=dRP1Ak/FaNTf6MnIDTb40ttNsNJVPLRiaodK5XoIU/A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E8+Bjp4E869HoOquZdToqwe0e29H2I2FLND55+5Q0pk8kp/apoXFxVSortqbXjvK5
	 OLln7dHRUiOcCHuJwxt0lpeUd2XHza/et5q4rbaxnklYOjIj4BppRLRjq/6IJMNQDq
	 RnNcawp3xnMdi97csIUTtOLT5+cmW1LcdR5Xtk8hSZPpZBsk3pflfdqmJoorM4VL4J
	 R6euNqcHOxjyGr2+Z9Cc5IL6uNNlMAh5lmmJQJt8Avfm6+IRWRhShEv02+x0/jEdd3
	 WDfqtW2hbJflKtj8cyLj2Ga7PfNuCNM49igUgqEdD7SrQn4Qp4ce2qyHJEeDc4Bkwo
	 mc5HcBinOxuog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604F340687;
	Sun,  4 Oct 2026 21:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0788335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84B166060D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF3tqqS1SAYs for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 21:20:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C513606B0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791148853;
 b=KQdb2tjWP/eg1wEBO9PjYaQt0OfOzyef3Bg+zleUjzC+0zKvNopGlDnKi2Hl3RYcu3RJ
 aWBeS7esO0utjF0finlV5oIuk2Rktn8bYGH2Dg9aYcL2a4VaKl631egLFu8jxCyra+NNz
 mDk7We8yYTw+ttDGwNEY7ndNF+wbLwNk24jzsYPqrztPnONR4bUWmt8I4A/arMNKpH7Wj
 rNZWdxH4aTTXR/m+P/l3ExlribwzfJgcn46Dt1qfe11rXjMBFw8x8AznfoaSumnfDnXiS
 Qb1vMNy0p/nCt5GxUHFHKTks4tyMqrj7tClMe9tPvgMzATD6B/5FXSfWQ0m5Y7CqhaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791148853;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FX1jt+L/VYvG8s/BkRVlm01KXR0GgGryV92CyscZ5fc=;
 b=GFdd6Hj3+u9evRN+xJcOqy9zxnhUOOZDT6pfbNuKONjhpPNl+mB06ZGy8XURGmbo+5+W
 6B3wAWLNJpOzSs7OvF7wPmmB3MGlRVMs7+uyYUXY8Db/rTVi/eatUa2gsPPR2MVpXvoIb
 AEXzycp1Q/kXWwO0fHb70VGwL5+ggaPXgcxnl3npSJTa5/+Ehj3x5lKmQtoNqlMCybgBK
 3YIUKbwLy/XGjsbiw8vB05x+MGwY7uZ4gNOQML3gd3AsHiMOQtKD9YQfQDhKy4Yib61Va
 iHjdqyCu7zXUSJzDiRS3pVtOhcIK8JjdRIIgB8apm2iklc1ONHVYTBiSQacCvp4VGlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RJLRW5BD; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RJLRW5BD
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C513606B0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 21:20:52 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-821ff9f018bso1212476a34.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791148852; x=1791753652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FX1jt+L/VYvG8s/BkRVlm01KXR0GgGryV92CyscZ5fc=;
 b=RJLRW5BDjTs5aE2w+JnHvO0ID95KZjC57gpWgLhqd0U8vPqlYqmxJ0UHokhzhr/cLc
 UirMTaZ5+xCzDSpFPjYNlAsEk/Y34sAR1G1RjfbYvA+JMNFngndxfJERqS++Cp3LubbJ
 R1p3cQPufWMYnnzysMbODSC6IdxYCCULHDnudJz0ZBLeSSEOwPJlgMv6d+Lt22VlPGuH
 /g9m7ZZKu+GsyYZ9t3IUricK79AuzealFNt0rAUlXD4mw5yNkLHif/IJl7LeOELmndBJ
 zgypwWKddX3OWR+FNb5CvwvyDR1IkB7IMjW0/lAVqBwDozUeLVjVcQ2y4bofXoml+IMm
 w+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791148852; x=1791753652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FX1jt+L/VYvG8s/BkRVlm01KXR0GgGryV92CyscZ5fc=;
 b=ZmOHRoeDW79jYELsocejtsIYdWpFeXa5WcnLy+d+eUIxBETXpJ6VUhxldqLkt/vDhE
 SwbEo3wzNJIeoOklHgqqbAdJ3T17jAlwcJmHOQkEXEQEZWuV7Rfg6aj3l859QyzdJqxN
 q53SjSgskBlDhyH1F9elO3ELRu0yzXSdP3SZ9PuL0mFcfFlbf7/yrzEkAA019y+2kDOD
 A6BmUJ/ynny4H/TG9r3HJFYrlr2x9xnKjHRV1oJZmYM1WUFwHwJwzBWM7EGb3Z4VJrzb
 pa/5xg6yNPNm8FAKEsKX3kS+vXvI+hMnoOxHeFEbmt5AKQXHuR8sS15QqEIV9Wb2NjkX
 m7sg==
X-Gm-Message-State: AFuF++n1Ym41mYtmxtzJDVPBvX3ytG8T20gCRW8ZPFkbQlMFYN6zhUqK
 XaXJymdESC9zcZU1wEdEU7KQWbxu5JRYflPBl8JonGyM748mnNkOAZifxOm3og==
X-Gm-Gg: AYBFou2H3Zh6uS2LmxwnsZSysJutk34Qtw6drLuauJT3IiajOOUpHsMlg+aG4ZeOKNa
 WPC0/dt90xjO6X4SeLYOMofpxEDt6CrqY7EDEEaZzJLBty00+cny2qa4pOLLlRTC7wYAe46jEao
 wIzpGZi11iJPFAHGQJDTpcPoMDwXrmgxvnReppKbYhzf5iQZ8PDKMYQIQxV8Ham4U7OTLWauo6v
 gCkuvuRXVHRWzpVG42n5N3pLsAXdPUbuBEmKu6BNz4H5uQioohhXpKwERaopOu1WmV8YAKJMQPx
 oF5Mbm1p4hFaRjc6ckWbGKJe21TLU08+f4TZj7bpifNUGrOksmiIcjO3xwHO15tvtXQkbtePJDl
 x7jukLofEne67I/VXWz46b4dgsk+GTpCtMtMX5cmGCv6hEkuK4ajD7Q0f/ODJKzsfcETe/929cw
 xrqJ+EE2b83VVjIyZ9S1eDU/R9fEBBbn54Ix4HbQRs8DKtLzCFD8+ZzxAtAK1gOnaZRE/KhzUBp
 j+M9NQjYti4QG66zrbNR6oY81OP++2Z/uy9HiO+UwaiGrmH/tyjqxnCeDDbGZX0p6e8W3DZQ/ys
 OzGR2DCa/h7mvRZzhMCWRI5DzKctdiQolrrDs0aDUF59K717IL6trk6ZNcDXqpzLCgb8JnBL+Lm
 mrI/ZiGc/ZQi/VKGrJKSyZNMeWr6lPwt6DgxYw3/ANwk=
X-Received: by 2002:a05:6830:8294:b0:81c:292f:97a1 with SMTP id
 46e09a7af769-8227f9945d9mr10422199a34.2.1791148851800; 
 Sun, 04 Oct 2026 14:20:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227aa72075sm10602691a34.27.2026.10.04.14.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 14:20:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 15:20:46 -0600
Message-ID: <20261004212047.1047271-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004212047.1047271-1-james.hilliard1@gmail.com>
References: <20261004212047.1047271-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-bleak: bump to version 3.0.2
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the uv-build build backend.

Skip dependency checks to ignore the upper version bound on uv-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.hash | 6 +++---
 package/python-bleak/python-bleak.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index abc75d6917..9bb610e9a3 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  513384cf6ed28ebcad27ed829c4ad3a2  bleak-3.0.1.tar.gz
-sha256  c8ff077519f8c30a972fd0d22f47a54b981184b2f2a0886d02e55acadbc1045d  bleak-3.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bleak/3.0.2/json
+md5  0e9fc5ca42eaa90f0aa99f6d2b941533  bleak-3.0.2.tar.gz
+sha256  c2229cb8238d5876b4bd05c74bf7a1aea1f88da39d2e51ac9dfd5cc319d5265f  bleak-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index e873d1234f..fdbb7dc86d 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 3.0.1
+PYTHON_BLEAK_VERSION = 3.0.2
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/9f/dd19d92309e4a37823210827f0f42460e69603254309b99499622b511294
-PYTHON_BLEAK_SETUP_TYPE = poetry
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/16/df/05a3f80ca8e3f7f5b0dba68a9e618147c909ccdba1468f07487dc8d72a9d
+PYTHON_BLEAK_SETUP_TYPE = pep517
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
+PYTHON_BLEAK_DEPENDENCIES = host-python-uv-build
+PYTHON_BLEAK_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
