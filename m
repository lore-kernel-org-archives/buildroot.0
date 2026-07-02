Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F56C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 07:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3041A821EC;
	Thu,  2 Jul 2026 07:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fEwM0yvvIsw; Thu,  2 Jul 2026 07:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D950821DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782977846;
	bh=3YzXlhiEFcroPnGDWMGjFEFKHIvCd0j6dnMH/p7ied8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JBxb/5SUgURFEOuOshi0hoR8uHj4NcB3Vk9T75V0BRkiNxTpRCMtI1OgE+iUP5wMf
	 vDZ6iDDGsyX7MFw+2hDX+E5zKS4OeYFmHnKiQXcEHm5D0lcuUuOjKaOnCEjdWBjZ5O
	 u2g6k1Bhvnd5P20bQ90owUXfb57XQPo0o0nNh3V4Tyz1+74tGi5hxgwvZVkG7Nxhgx
	 5MGohTP5VCMisfRIMJj90wJmAq+JFPYPLdU9kGgB+o68tiabj2RVi5NLmHp2Vy0xHs
	 HtEotsoma1mA8/TfsCKWKthhZ4zMcnXy09/GdI3waFHHCBUfnhf0+m1JylrHEnJCOU
	 +VwfTB4OWndKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D950821DD;
	Thu,  2 Jul 2026 07:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70245127
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 07:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60EE440E39
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 07:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIGMiFTZhaRO for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 07:37:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AC2040E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC2040E34
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AC2040E34
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 07:37:22 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 07BAD31E054F; Thu, 02 Jul 2026 09:37:11 +0200 (CEST)
Date: Thu, 2 Jul 2026 09:37:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <akYVJ5F5kodcxrfK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1782977832; bh=5zFZqrX3Oy36bs1Naty9p2VrIYWZavZcl+/TFvxlC08=;
 h=Date:From:To:Subject:From;
 b=Y5IpOfahhEQmYM5pUDps6pMg+nEaQJ58yrGfh5TeL+PqP3bBhyVjBJ8EStIJFp0x9
 +rSMlc1hEkwFwSWZvO86PGCvTpTKGIdWyWfqZv2CzJSq2e06LFg4fBgaekuAkMze2e
 yIjWxL/DtThF0n2qKpsGJTq2UFM3MJSKjxmuyX20EKNSpUxk01Qz+zv/Y7ryMYSzLV
 lVctFj1U+P73u7MDyAcUU2j4qYE1wlD2xxPZzg1rg7pyEyWt1JJ3UpdcdFgx87NRgh
 EfTrib4eUkLnJ9DM7dgOjPV4NO2g8yg5I4ET6tsa7r+uCGT3PLy+a4tvXv3BXV7PVM
 yvt+E15Zro1xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/nginx: security bump to 1.30.3
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

Changes with nginx 1.30.3

    *) Security: a heap memory buffer overflow might occur in a worker
       process when using a configuration with "ignore_invalid_headers off;"
       and "large_client_header_buffers" with large configured values when
       proxying a specially crafted request to HTTP/2 or gRPC backend,
       allowing an attacker to cause worker process memory corruption or
       segmentation fault in a worker process (CVE-2026-42055).
       Thanks to Mufeed VH of Winfunc Research.

    *) Security: a heap memory buffer overread might occur in a worker
       process while handling a specially sent response with decoding from
       UTF-8 via the "charset_map" directive, allowing an attacker to cause
       a limited disclosure of worker proccess memory or segmentation fault
       in a worker process (CVE-2026-48142).
       Thanks to Han Yan of Xiaomi and p4p3r of CYBERONE.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 5055b4bd57..6c3afa889d 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
+sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
 # License files, locally calculated
 sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 3f6aecebef..ad61ef6140 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.30.2
+NGINX_VERSION = 1.30.3
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
