Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29518CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 15:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5461843BB;
	Wed,  3 Jun 2026 15:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWAY4GCXM7al; Wed,  3 Jun 2026 15:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D822F843B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780499601;
	bh=VR/nc3BeaJAENIx/P0DyNEFGWTAzNll3GZLVvjnH5QA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AipkoQe4GmrhBV2/Uh26q2uoZlx2BoKXFagQ8veMRGQJVTEEatul3KSCVaW4QBCNa
	 XhMpxgbDFzyB8ZBE9dinw8GlkQEBLjEkXN2LMNDTT7uhWC+rNS8qq6CvllzWJY6hDo
	 1EyvSzMf5jLYcllXOjNbAClIx7sHLy+l65dKOaP8EOSOzI+3bPfkuILxhdy8x2o+EH
	 euvshZxSFQO/y+PSVgE+zScKAJXE78ch1OP6P/GY/vejCldNxiyyJfrOTuf8VTjLdi
	 QOFXXBZmNhE7ezL9EdE1Xs5rSXwlA5jNAw2wBFapP07xNCZJqrRYFqXuBXdxHreAYP
	 4oleaEm/r3L1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D822F843B4;
	Wed,  3 Jun 2026 15:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D41A192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0319A41E41
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-zJF3JXMIcl for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 15:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19A3641DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A3641DD2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19A3641DD2
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 15:13:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61E3DA4C33F2;
 Wed,  3 Jun 2026 17:13:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUnHR-000000004jl-0EsQ;
 Wed, 03 Jun 2026 15:13:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Jun 2026 17:13:16 +0200
Message-ID: <20260603151317.3499635-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780499597;
 bh=Z0/mwEa/PHVv5z7HpMuQM+njiWqWwZN9VuZQFG3taxc=;
 h=From:To:Cc:Subject:Date:From;
 b=S1n8l4F/H6du1uPOQarPkL4vq6cyuZ5pofQ5OHKItnQY47I/2Epl+i+5GaYv0BBu+
 ARwkmt9DEdKhz1DNxLc6z356eIe51yNWlldt+wP/aemw7M0+2JLP8oAoNCNIpQSAmo
 +7wtpJDICCcfjrPoxbgMHJi0Yr29fmdtVnRrrYFVjyfnQKSRKE8wJ7tHidmJsP/Use
 ++CCng2Utk8/zj8GxdAEqewtTxzKjk8BAvDfARsG1ZXyGTgxSwuiMfXPs9l3EZw5EM
 5b/nIQw1mDj4qvrUMhwb3XX8tZHkuTba0vPVnSz5WOAk7zkqfB5I+yqiQgXxAeWLn+
 W0joFFNh2HKFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=S1n8l4F/
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: security bump version to
 1.6.18
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

https://lists.gnu.org/archive/html/freeipmi-announce/2026-06/msg00000.html
https://savannah.gnu.org/news/?id=10898

Fixes CVE-2026-50031: https://seclists.org/oss-sec/2026/q2/794

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/27487f8f0d8776aa7d84a6e415932322eaf01505

with the exception of:
- bootlin-microblazeel-uclibc
- bootlin-mipsel-uclibc
- bootlin-powerpc-e500mc-uclibc
- bootlin-sh4-uclibc

due to build errors already present in version 1.6.16:
https://autobuild.buildroot.net/?reason=freeipmi-1.6.16

 package/freeipmi/freeipmi.hash | 2 +-
 package/freeipmi/freeipmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index 9d06be8cf9..97890d3a17 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d  freeipmi-1.6.16.tar.gz
+sha256  8098b23820038ad0aa39abf0f9a012e24683d384d9f91e760acb2a68b465e0fe  freeipmi-1.6.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 0581b931b0..38a9adff37 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.16
+FREEIPMI_VERSION = 1.6.18
 FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
