Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA0CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 07:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 807FA80F6B;
	Sat, 20 Jun 2026 07:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcl1Ns0QRLcM; Sat, 20 Jun 2026 07:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9EB80D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781939060;
	bh=bF9JxzwP3a4BkhTBkvrcdyOgRxXKiplNT6zxG2k96A0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U3t08i5DKhH+AJ05JF34XD7VjwVY/T2bqBsUmyLlbfjMTqwb44k28W/ULGS+lzCOs
	 HNfbaXoUz2MEJNw+lEeDEISrFHS/8a7m2ZvjF4v/aPYXDzLkenxTJucBQv8+sa59pi
	 rLFGF+l4lnvnaiBwzt5BczMZIZ0Vryvn/ucU9wPD3Z9FD5QTs+AbiaKm7DZ/DMzXw4
	 IdWN/5Gn3JOZFocgVUPxiHJ1uKUiF8/7JdqtJi55bYPsDxePOTil7LNDLZex46QDBb
	 vtKBNIMdnt2zfmcSURXGDJKcZvnU4o5i89KfOZ4aRh/4ASm74wMpmxdVO2tKpbS8m7
	 xhR7Emr5NHFtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9EB80D9F;
	Sat, 20 Jun 2026 07:04:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41269367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27450428AF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0rclsodoqVT for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 07:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0297C401EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0297C401EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0297C401EF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 07:04:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26BFBA4C112E;
 Sat, 20 Jun 2026 09:04:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wapkU-000000004fI-3Rg9;
 Sat, 20 Jun 2026 07:04:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Sat, 20 Jun 2026 09:04:14 +0200
Message-ID: <20260620070414.86981-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781939055;
 bh=vi9maINu0wqDLaEob7pUesdOGh0GQPQ4myXxuDBpMtw=;
 h=From:To:Cc:Subject:Date:From;
 b=qZ630qGxiDeeeNZsr6ODQU/J2smgDGVbJ+dQaoTNkm2/ZezU7OdYe2mVhiqJU4wMD
 Sv8h0VgmfJ+GuLHMq2RtRg8LHLfVEyulNGm8cpJqYOWArBJw/hGfQZT1Lqztq7j14i
 3Z9892nYHfCczMZL3KWnVGlGLEFOYyL74EK3Re0q1N43Dy2I5v3LuiQG/ePRzPBlxA
 cW9004200clArBfl700BqfFXzH87D2e3tdDsB1uot0ffNpW6uL+AC5B9+9DJSewDT2
 9XaqVc+R7O9xC/rXtNYSL1Hd9UR724Ds/K3pQpwLI6xMBlxamgMMnzLz/wMBESky6o
 YMT9Ejxr3s9ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qZ630qGx
Subject: [Buildroot] [PATCH 1/1] package/cpp-httplib: security bump version
 to 0.48.0
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

https://github.com/yhirose/cpp-httplib/releases/tag/v0.48.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.47.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.0
- this bump includes a security fix
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.0
https://github.com/yhirose/cpp-httplib/releases/tag/v0.44.0
- fixes CVE-2026-45372 & CVE-2026-46527
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.4
- fixes CVE-2026-45352
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.3
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.2

https://github.com/yhirose/cpp-httplib/compare/v0.43.1...v0.48.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8fcef356cfff282f19aea18a7ef8f1c214bcefc1

 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index f3e05951e9..842b96f3eb 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
+sha256  d9ed142d319c6e19a961f477257e67f846909ce15288502188df2281941be84e  cpp-httplib-0.48.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index e8bc0a56fe..94f270df94 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.43.1
+CPP_HTTPLIB_VERSION = 0.48.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
