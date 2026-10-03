Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AC6CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07BCC60E42;
	Sat,  3 Oct 2026 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ogj5ut8uOAyB; Sat,  3 Oct 2026 08:45:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2566060E12
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017159;
	b=ipUFwdWJ12FpINhWGtCqBJPtFx98FfBNXERj8f3IaHfg7HdrDqtL9/f1YwjXRvvPNRic
	 VgZMecfF1z4kGrx2TUmfjuKpw9yCrRc749Kli1plLP8T7U1p57zk5CJJ047pTGk0mprvh
	 N9MiJKWFEZiYs3eUoM4lOPKJHIZ3msJqMFUmE1NRllIdlgP/CWqAFAsVX3qzPqCjjWKsC
	 ckiaGPrtz2ZfMKaCxuv4whhDNGCQjZWZUd7KIuRJUFNZY0vXWvipHWQgtwnlyWAdhrfh6
	 OX6tMXNs+EvNzu/WJdk4j5GP29QmmL4vRmBoh4kTpwzm2lGI6yz9lufFYW4YuemmZiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iWOOlUZf8EyIjk/uADnPiJTdZhT3hDik8SaksQDn/14=;
	b=rmzsHVrLdaAvBHkQYnikW/3pxUOT6HMzTTnZk0FRtTLLWtyvQ/s81m2LHHGzyXJLQRVu
	 4WXJIUCODSPRkdSleg9xK2mkzxgzN040UULENOp0/E/voRwWT/JXoIVzrYeQ4OSPCRCpM
	 /ufAWx5ZiShHhnTP2uOTR5bUr1kMW+mFnX5SlbSmoX/5EmW9DjAb455a+w9yaGcIKorPK
	 36HCORF36YIQm0yU2H1mjxokAgeICwcRXtx8FgJSNlOlDNUjtm2xomgIMZ1+KLEYBABdI
	 uH1PHYnC49zLfZ1+oazT5ukT+katOVQfaWXsodKCtHgQgB41MaLT2ELcuY67MZoyn4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017159;
	bh=iWOOlUZf8EyIjk/uADnPiJTdZhT3hDik8SaksQDn/14=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LPOGy7KG+cDeKaxGOMq1ERkv5FnIpU+jga+6IM4P+BzJkYjxR5rPPn5dRe94H1qvZ
	 ik5ivYF+Cs9tgCe7nd19gaPbcH20uAXB6Uwf+d4c5UtRCWaUXeN53Q9zx1fcDGidRM
	 iZdnCwjQtqeN+27/CJc56BS3zfsU5VPU0w0jCBNU5qTCiK1Jw/mEQmElHJFDQr50n5
	 gfj3hIr33fp1z+MQK9t8SjeNttq4z0WTdTTp8Q0POkXl62U/w4/q87UvnFb1KpS8Tj
	 VFkMDXLRsY32/Kx1ZXSrmQI2HHniGysISFuh9euLFyYZw34AHYn+TuIpJsq6XFD+0+
	 jVXuXdEO4E7fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2566060E12;
	Sat,  3 Oct 2026 08:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3182E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81545400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtsBSsH66ZwC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A05A040059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017156;
 b=Joe4kT2ioK+8Az248e8UDU/ue0Rtt4ihE7yqKygS58r9pGxCVfqM+4PWZVkGyWrH7uEz
 MndPOMAh3Ca7MytR24EmjV3KypaJwBrcr5ZbMxO/PSXTsyoDDDj0j2aVgv41sDRfJNVGl
 dlKKse1gw8v+TM9Sk7k/x+FLpOGGkDyk8WV+eYjqdNE56K+d1cCQkmrFyEPdZz13NOTkX
 ruRQ0GeelAOnf7GBzqPcjd5IMDLvh2vAYjHIURb8HIXhoJwa2qEVqXGHupO7ifZ89G123
 h9HIqgUpj4p8S+7k0WyDfuDHGAXS+Y1gW3GCr3Z/8XPxNMDOR4gXmHT0RjCQjyA3GmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017156;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=q8ybWSikuooCKBLZuuhTWlGyNwpaj9tCqlova6Sdkb8=;
 b=iqujIWwPFx4UoN8bZrXTkZuvTr/8Yl9grKuXkT1H1XhurNQLWQYqebG1yCmhm2ld8eoC
 wS4IMBli4U6dpN3NIVKInq4euojT6dbiZoNfMka0tIdkjXQs200TCa0+1tsnYOisjiF50
 m2M4KrweJ4K43D9/Ol9R8PZw+9eI1RZ/ptIckusi8cwqa0jW+VFQ0RDyZSqwMcZkWAwWd
 iCznm0lcT92eUsx4keCSkK7MTOT8/O6HyHHQ1wMZegdvlCzPINr3uQDjERRfLfxJ2Q5Av
 grvqZjpcWOvn7LNAWe6BAYu1GVkYQwZh0OdA1v2CKdGzhkeE+VYrDdVCwr3E7pPuIRw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WYntnHxo; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WYntnHxo
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A05A040059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:56 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-81be5042c56so455757a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017155; x=1791621955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=q8ybWSikuooCKBLZuuhTWlGyNwpaj9tCqlova6Sdkb8=;
 b=WYntnHxoy5xDPLf/9HOKQRuTAZb5AHkUJ/QNqdLt6Hh3bDzrzGFBboRBvAQ9PhVfEj
 m9ziGRGFK/GEi88E8h8pwUi957MaOPZfTSvqeSDv3t9hxpcY3VlcRG+6B+olDEQimzY6
 lvF3T0KrdDASypVVRr6D7k9VTZndNYnQayalg9KmcT5MgcY5uUPrWKrrALWT/i0A+Of8
 urM8Ogwp5nHccGbDvIXPb8b06KYcixoubYM09ImJjKWer+9sB4Hrr2cd6rTJSbvfRF1r
 X+TK8JUEgoycaG14+x72kA46YA9KX0nTWQ3HVl2XxfRgAvIdA9cqjfDPLMLFs762wo7G
 Y8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017155; x=1791621955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q8ybWSikuooCKBLZuuhTWlGyNwpaj9tCqlova6Sdkb8=;
 b=KrppWA7iqFYbDbmUpHPLcffUS6VhYyf+jTj1aZBo7pfzrdv9BfQQXkuIl9fIDLz98m
 Da9485Iycg3iV6vzvpYyt4d7WGvAinrY2JIHyQ0IEKdUaRwId9DKQXGSJqJlwY3eGdiD
 mE56e9vdJOyd9AAyetXFzDXafDqKdSg4+nUrQp4dQUowPBHnGqcW65Euj+qvyJ8BMa1Q
 6/hcrq0FYOFrlk5SPzbUet5a5RrJFdn1wE4PpxlT4dwOTsCBGy3iGnGUP97qe3RYdEiI
 uaG2S9u0igq73rOgfEl1CtjJJGQLhjq0r8d6Vow9O9MdE+SZPHsqfepAMUKhqqqtIWVI
 xjmA==
X-Gm-Message-State: AFuF++kt9CznO7b7N8micTIgSzDmoQPNXfk0fjvn5ulGcN5ZgTgwQwuV
 nWlkXjX5uj1C5SsZk3j9cmyhkfdRhWEKHpw4AyQIb9b6+sm7LC1V1Tm/zgSsug==
X-Gm-Gg: AYBFou1SqdFNcRb49OXvvQZHToy79Gbf6Mns3cStPuwtmMKqgvhPFwxiyi6Ah/760G4
 ycPNqv3CctUjhh376eGfz0zXPdZWpIVvviM34wIjRjuMxwBICceQBKFofLTYy0VtDYLyjnM+ZRy
 zslbwpRl7OV4eEAsHUwCZBDz/8DYmZd5miBpi2BvHYZWn/kzde7EnSz9eZyo0wociA/u5eRIx5h
 q5AYKkaWnV5aFknSHnZjNuoxrrkJEjpYo3pFSmCij+/59/sHkiV0ulH0697zDzlA4Xuz2XTHATS
 /pmeMBvkHz027RRmptSKW8RvCn2WGjPo9EeYgTAj7EMGO/EHi0JnSaxzVHMvMVI9xAs0XxIhV9C
 1eCntxzsMB0LdeqbSMUJGtsGkqGU1QtSKo+Mq+z4dX8e6fSD+WIGxFuMgG9oTvK3et366El2QEG
 mxwcjfR8foAzoEkjO7Zf2AEVnpJ1X9i300efyv+2jrlKRk4iR2lrLnUai5CN7rtXz59lFumEOMq
 Q95gil3rSsy1akdT0GWGfbjnd8sudAvprwiLyYrQ+nBik/Zz9qdlNNb2sU65YL2gWjXv64mSkCl
 yYh1zHiFsEpGPMI/ipR8U8h0GlSZ7oym3gwweJZ3Qe2GPv70u2tMyXmNt7+kWm00+J5Rgfm/WEP
 RqsOUKe65e6UYZRqBtxmXh+WqMIc5C+6R6WjjoUBELQ==
X-Received: by 2002:a05:6820:c8a:b0:6bd:5506:aadc with SMTP id
 006d021491bc7-6df34680c09mr4507336eaf.35.1791017155416; 
 Sat, 03 Oct 2026 01:45:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:16 -0600
Message-ID: <20261003084453.545653-31-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.23.0
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 78165c2f68..874d37133b 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  3fdd58ac1b7c2a520ed05e3151a64515  uvloop-0.22.1.tar.gz
-sha256  6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f  uvloop-0.22.1.tar.gz
+md5  1a247fd41018a438b73f89248e1c3316  uvloop-0.23.0.tar.gz
+sha256  28d160f51ab4da3b187063652e643dea6831072add4adc1e6d62afbe73b6be27  uvloop-0.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 419ee33062..6f5767d165 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.22.1
+PYTHON_UVLOOP_VERSION = 0.23.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/fa/42/02c739ce85fb2ee8d99212c61417da8140c6b87e9d97c430bea520d76044
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
