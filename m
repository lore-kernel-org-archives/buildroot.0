Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1012AC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56B940509;
	Wed, 26 Aug 2026 20:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UR3waAgJ0MqM; Wed, 26 Aug 2026 20:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787775734;
	bh=IIHzzIOaWiR7gIglvfTdFPwJSc5HJsYmiIYlTMAiR1w=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LxCboe8F2xmJXa03tQNYT43DnKsxblW4HrHwC4L0i47fnc55cKKqN+jCwl2xjmKj4
	 xMicOqiGwQbH0iFeY2wkgsEzPVlV+LwP8fXF+Hh2oBqEd8UfJa04bfWaM3avs9i0cG
	 aDzY11IL54m+Xvjysjzy6vnPJFytXROPJ+Mo12jik6TwwCQkt8XW6s+ZuqCnN764Ph
	 TwghK+wADp9xA3QlKfMB90BsDeaw09bQO1mFuvHLBgjzvWlYMBlLT7MyadCcg87z4o
	 MB47avrwy5ooKDHxPdBgq41WAsI/hkGNqTcxGHofZDaAswW28Lv2m+lY7IzeHZS3NS
	 kUsWbafnFtXkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B785A4052A;
	Wed, 26 Aug 2026 20:22:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42788323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 285FA605DA
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XP4vZfjrKWfI for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F233A605ED
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:22:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-482db627cd8so505432f8f.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 13:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787775729; x=1788380529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dwGmuPZ1p96Gd2xiXsmlmSofZlSkJTY+ipie0A0yTDE=;
 b=VanHi4aTQrnDAMFM1AzceaacjvBJOSVgaPVOVYrGhQnytxtNnTQnxBgpIoFLANGXsD
 7gLeOSy+f/bEhoIyHabvpxmuog0RLg4AdNaoZARV5t/+8vY9boaPvHyZqbDEmnr9vVTj
 PP070zZpJyZ1fvcChIOO3wGinLBeewzaatR0PWcI2AvFVQ44BdyS/g4Od0WbquzfcW47
 Ayn+8pTc8mXkmKfitPPmhhqkEfQ19cc25aGgjlrAtagV2Nu6F3Eo3O00rVNx0pWF4AK8
 PTUVB7//PyTTvbZobgPiXeTq1mBM3DXzIm1tDChHbKdru1hYsqbdjIJsNNDzZrOVXzPq
 oUig==
X-Gm-Message-State: AFuF++lHX8gEDZopPKMSnkaxCKb/exTqmF+rM0gTzyq4w66axIuTBHTl
 FQn7q5z/zCY8HkGbOFPrjp9hWHFq7A8Uno8NcmrlH50+NUkQlhyaN1vBrpeiwdK1p9KJ2FT6RbW
 lnaAQ
X-Gm-Gg: AR+sD12URC+7XnfyddStQM57DI85gfRt9xYDKXwu+3dlZM/XZwg1ZlZnjRgO1atPwcv
 EtNZZjh0PyArWpwmLj4qrxwWO+3IbkfBXro84rcL024vGJc21Cem7lT/rSpO1v2RfFCw9ip1NQp
 WguVwlNpIvEl7JpGPQ/Xm4JrNtWe+o64W82DAzMuTIbpDCyqG8HG5oKm6SYXyBMXFQsArha7aAm
 GpZl7ggLStT5QE97eMutyUYxigSL2G+YZVR4TLMKJSM4w8Ah3K0L4t5WnZO++G9olYzdqnGLuxg
 absGZyG1NYNabAI7YyQckU9tYQz8/r1PrQhsBD1CvGtTkMx3PF/P9XsAzATTuAsvi+UOZGISdrQ
 GiG+VgZMXDglQf6fbcsk2QOg6FzuePrjEZD+aWwOlD/1FT756oEJwHQxhlAqzMFJTRLTISU63r7
 1BOPlJdUXsz7Euohl/vHNCtufokA3MKifKlqCCG8k3rj3GfpyBFXsrkg==
X-Received: by 2002:a05:6000:290e:b0:481:5ba5:994c with SMTP id
 ffacd0b85a97d-482e26d4487mr9685641f8f.20.1787775729171; 
 Wed, 26 Aug 2026 13:22:09 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9f0esm3917849f8f.10.2026.08.26.13.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 13:22:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Stefan Ott <stefan@ott.net>
Date: Wed, 26 Aug 2026 22:22:07 +0200
Message-ID: <20260826202207.976260-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/unbound: security bump to v1.25.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the changelog:

- https://nlnetlabs.nl/projects/unbound/download/#unbound-1-25-2

It fixes the following vulnerabilities:

- CVE-2026-14586: Assertion in libngtcp2 when under pressure in high
  concurrency DNS-over-QUIC environments.
- CVE-2026-32665: Remote DNS-over-QUIC denial of service due to
  `quic-size` budget bypass.
- CVE-2026-40691: Packet of death for DNSCrypt over TCP.
- CVE-2026-41637 Degradation of resolution service from improperly
  accounted client-terminated DNS-over-QUIC queries.
- CVE-2026-42955: Extra fix for CVE-2026-40622 to also clamp the TTL of
  A/AAAA records disallowing a one-time 'ghost domain' delegation
  renewal via glue records.
- CVE-2026-44621: Libunbound applications configured with
  'unwanted-reply-threshold' could eventually be abruptly terminated.
- CVE-2026-44687: Off-by-one error in 'harden-below-nxdomain' logic can
  shadow a stub/forward zone by a legitimate parent's NXDOMAIN.
- CVE-2026-44690: Cross-zone wildcard cache poisoning via RRSIG.labels
  manipulation.
- CVE-2026-46582: A wildcard replay, as another piece of data, triggers
  poisoning in the serve expired reply path.
- CVE-2026-50045: 'max-global-quota' reset by DNSSEC validation
  restarts.
- CVE-2026-50046: Possible heap use-after-free in an error path when a
  DoT forwarded query is jostled out.
- CVE-2026-50243: 'response-ip'/'rpz' can rewrite BOGUS answers instead
  of returning SERVFAIL.
- CVE-2026-50248: BOGUS configured primary hostname accepted for XFR in
  auth/rpz zones.
- CVE-2026-50251: Attacker supplied `0.0.0.0`/`::` glue triggers
  defensive full-cache flush.
- CVE-2026-50252: Possible cache poisoning attack by mapping source port
  population per thread.
- CVE-2026-52863: Memory corruption could lead to crash and denial of
  service.
- CVE-2026-54478: DNS Cookie bypass when combined with proxy-protocol
  use.
- CVE-2026-55708: Privacy/configuration issue when adding local data in
  views through 'unbound-control'.
- CVE-2026-55717: 'serve-expired-client-timeout' and 'response-ip' CNAME
  redirect could lead to a crash.
- CVE-2026-55973: 'dns-error-reporting: yes' leads to stack buffer
  overflow.
- CVE-2026-55990: Packet of death for a DNSCrypt misconfigured Unbound.
- CVE-2026-55991: Remote DNS-over-QUIC (DoQ) flow-control assertion
  failure in libngtcp2.
- CVE-2026-56416: Possible heap buffer overflow when validator
  canonicalizes RDATA that contains domain name.
- CVE-2026-56444: Degradation of resolution service when
  'discard-timeout' and 'serve-expired-client-timeout' are combined in
  unusual configuration.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 46b88900e6..85724ca243 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
+sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index fab6e67455..46fca5e2d2 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.25.1
+UNBOUND_VERSION = 1.25.2
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
