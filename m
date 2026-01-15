Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716A3D4660A
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 18:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D0240502;
	Thu, 15 Jan 2026 18:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGGnxfyfWo1w; Thu, 15 Jan 2026 18:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B13F40274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768500390;
	bh=UsuKvyKXPk4wbmUDZBFJ3zmNCEPJXEj+G2vJ0hT5t40=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nxbd6fegILCd/NYVPZCDTZ+88TKgZFeMClK+q1a+CTWpbZR9fuIL25KTCBACGlodO
	 ldX7WNeUmcmBcf1wU96NbiwfOJEGjrpH6xVsJz9Dhjh9mLZL8xOmym7qVyqOCQjmY6
	 lcxyXRlZvbCkASfFrCRp3X4OOV8z3AyXcOP9OHVfEK9a/tBT18O+LA8Lw00oqkvI1q
	 etj9YfV+iusD2rr4rC7aTeQ5MkULEoMlQuJU9csmDR9UfI+u2sXBf7EZiK645zrKPe
	 NSY0Qm/M4pXpjMyDW69yEUCtqeyWz/WjNhxyyrg/oTFEzL5nGQ7gnbCMvuiRZL3p5W
	 A63DSx06ULsKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B13F40274;
	Thu, 15 Jan 2026 18:06:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF6E01C3
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 18:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF59C84549
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 18:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66wP00TnODBy for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 18:06:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15DE684547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DE684547
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15DE684547
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 18:06:24 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CBADD31E0485; Thu, 15 Jan 2026 19:06:19 +0100 (CET)
Date: Thu, 15 Jan 2026 19:06:19 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aWksm0JZ9Ldtv5OE@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.57+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768500379; bh=4LnkVkiEtra7k53KTI2C7hfHYmb1U5dEMN3nI4LQYVo=;
 h=Date:From:To:Subject:From;
 b=IuOZtv5abE8tSNcIth9VAdqP+bPZUWoOGIcJN5D7mTegaPdunuGK/gXYoPCESiA+t
 8K0FtY461+Ktz/I6dsbCT8OEGmKwn7b0EbPrZW02NfyxcHz/0A1xaxDWWMw4EhS47y
 wVa82lUBEGX7EF8baj6bfWeotxX2CeZICFT/P6BikBISRV7qk/kfIkA9D5wvxFEDTP
 hihl4bZdca3DQ+Sbm3ZMr8aF8KTCg5ZWfH+TP/6b1IjcAzvgEPWe2LyZ7mlWttN2no
 DijeeRJsEmYlHr95FX5+EEz8bGx8S6R6T+skzROeL6H6FmMgziK79T9gezfiBxnvI/
 ThBfe9xIhbypQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=IuOZtv5a
Subject: [Buildroot] [PATCH] package/evilwm: bump to 1.5
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

For changes see this page here:
https://www.6809.org.uk/evilwm/doc/ChangeLog

README was updated, the LICENSE part bumped the year to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/evilwm/evilwm.hash | 4 ++--
 package/evilwm/evilwm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evilwm/evilwm.hash b/package/evilwm/evilwm.hash
index 7fede9641f..f34b84e5a7 100644
--- a/package/evilwm/evilwm.hash
+++ b/package/evilwm/evilwm.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d5945b20b12c91db2412fac0dbda3fb9c3ec8debb8e1b109838992b2b1bbe5d4  evilwm-1.4.3.tar.gz
-sha256  e98134d702e297c35e2b1150918a2b0cffea523f67644fa64e8dbb823fb55986  README
+sha256  6104852413e6d50669361dcadda5a25d39e2b2b0c95a6384022c905957a2740f  evilwm-1.5.tar.gz
+sha256  0863b8912894e6688c8ceb9a600983640099d68396e2fe0c5f08cf772dd18c09  README
diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index 12934427b9..0c5d414ef1 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVILWM_VERSION = 1.4.3
+EVILWM_VERSION = 1.5
 EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
 EVILWM_LICENSE = evilwm license
 EVILWM_LICENSE_FILES = README
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
