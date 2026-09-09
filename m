Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F912C79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 15:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF12605F8;
	Wed,  9 Sep 2026 15:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74X4m5133Y1d; Wed,  9 Sep 2026 15:01:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3923760773
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788966105;
	b=PaBx3njCpmm/cI6huWh73+d/huwvEEaW80EQOMFJqBz4L3k5ID4VwOoPsLLUSk1EbZLd
	 5/JR1wfzYMCrygCYQzv1L3iF9Eq7Du41bAcYTi1OwianrV4hUJFKuSwfB15z9g0LKl+M9
	 rA1is64DuFq3Z+GOjE7f/S6xkf83REnNlK27PKM7F58A4TFKeLfHfxMJ9FRmfTR2sVE/g
	 Tr9nKvz/Y/R8W0245VGSRQ+Ha7eTR9ObEbTXhdov9z8KJn7IARw1dly7xJLWrlHBG2fvD
	 qxhJreDee87w8dLo/CztgWiv/ePyLJBLQaudWkjKHMViAH3ssvwFpctGWcYyEpwJW0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788966105;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XY+PETwf77xdA90uiC0diFJk/R93gC7z5EKCj9MIjOk=;
	b=V7UQhJSSoW4P/wVBb6GpuIOCbib2VHVQ2R+jg57SoMtE4T1JPUDSmuPnPn5LHOurL1Js
	 0MH0EMMhu0ELrp995d9Bftqax1GlTrpptlGERJt7y7ECCtjyXoVmafMnr9/eEntkfua6z
	 9rCDF311MaiZoF7MBi4VunRgD6hp7413jZWwAshdbSSJLe2NXeZqKUTB3bGQzq3qbx/BE
	 G4NSJifo38O6XdS1nAi9AfMQJrvyiMmvwXi85enwcB4kCQdTBcLwFBUkIMTr3Yy81s0Fy
	 Pj68b21uGtCeveo7Gl15MF9rTriEvY9sXmvKJYWBnDdjX6Nvy/Sq5iwWe6IDBNGVA1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788966105;
	bh=XY+PETwf77xdA90uiC0diFJk/R93gC7z5EKCj9MIjOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oJ4yZFyruIDDC9I0KUFsQ9M+9AtMbqRvqnmpGRQA5bSFVaMFHQT56FnZtqz2+pFHO
	 yac4xZ6i/Edm3OPvS7fcqRKIUEI+9AOwDihqlLGacHOEUjG0Z1qH+DFgWiENOedWP/
	 EO5fBkC4aVNjil7QfXq90fwaxjyvKUAa5nM0LUKJ6G/NtAfqzne2uqoqnWDJIcQNIf
	 KR1KmvFdRDIVl6c9hta4o9JeCSbNviZZWAUWgG/b6CWse+ZelV0gZ/Xn3hRnlNMUQM
	 meb/3viP495CIpXkepzTLoyhpwhXvh4SaOm0OxSDh7cmsa097zlxbdxAEexlq9VCCG
	 lrxN85agumOnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3923760773;
	Wed,  9 Sep 2026 15:01:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B8AB2E3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69029406FA
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFguDVe1EZWW for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 15:01:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AFD5F40663
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788966102;
 b=MOQ0J3oKKj41hikAiER7vmMslEr+ypZmam0cX8nTOPcORHsKfyjSkeiU6s+Bw7LYjAZs
 b01to5+sWkdSd7sMRwgh3xK1YsevG44s0bjIJf4glw/YBVum2QRwSjjRtbPs0Z0prDfx7
 3PLBnueBTiDwaOJmOWWbbpnn0cY3nXeGCu7uqhbf4ob59+Yt+drzNI42N6UB8i41OpwAf
 E00eCTaXpruHVMRY4gLfAtFYDeAkNnnnEq2m/JKa1bXSVoLIieeWhhRYl5fHxl67JQvf5
 +FnA25dRZjaLCqs9UkmW+XWp6BdzMN3IGJwSEgLjvMxy3Zj9Hw5nDdqTdn8PcqHENsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788966102;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/3mGbapgK42QzN5gRHFBcqzRi2L706zT9mBDHOS6i+E=;
 b=fSgi36RHm4Vh4JaGmdKtQAoCzg0De0IkPCdRs9xMp73DHs1wEHw5SNDeZztSYtwIUG/o
 DNixaeAgFufPhaqvQOV3iGyPlocXaunuWeDvRnzdBQnrpnV1IUu0GpehS0cdXPgOdteMX
 6SoVVjPZXPJ+IHTQZv0BrHBMs/xhv8OJuih6uIEopmdj0gHElCKkNFsFH5+X7vhj8Appc
 SJ9c8Mc/Q3Hcch3z6Jmtj0CKhgBrWU52VnCJVkDC3EiwkXoV+bswI/rhft2Mnu9x1+5h8
 tqG0rJ6jt6BFHbtNgaoQl1rsoinTC3wPLT9+S0h34IesCSmoqvUH5uUyjckWUudQM+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFD5F40663
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B84F0954D9; Wed,  9 Sep 2026 15:00:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 17:00:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36fa003547306899347c39d3955ef8f704baf660
X-Git-Newrev: 2ffcb1e181b5de9afa4efa76f2548f8adbc2a088
X-Patchwork-Hint: ignore
Message-Id: <20260909150039.B84F0954D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mini-snmpd: bump to version 2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ffcb1e181b5de9afa4efa76f2548f8adbc2a088
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
- Reassemble SNMP requests split across TCP segments, and drop
  over-large messages, by Noam Rathaus
- Fix encoded-length accounting for decoded OIDs, by Noam Rathaus
- Zero-fill memory from the internal `allocate()` helper
- Build the interface trap OIDs without a run-time format string
- Avoid needless variable shadowing under `-Wshadow`

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mini-snmpd/mini-snmpd.hash | 4 ++--
 package/mini-snmpd/mini-snmpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index d1e8f51f8e..937de891ad 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/troglobit/mini-snmpd/releases/tag/v2.0
-sha256  851acf49a1a36356664af0a7a040fa31f75403eb26e03627eba188ee15d4854c  mini-snmpd-2.0.tar.gz
+# sha256 from https://github.com/troglobit/mini-snmpd/releases/tag/v2.1
+sha256  2f9936e4c62d1469a13e43611001b6ac36901ddb9809e3c7cb2297830615a6a1  mini-snmpd-2.1.tar.gz
 # Locally calculated
 sha256  8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56  COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 9873ad2dee..157aabfb53 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = 2.0
+MINI_SNMPD_VERSION = 2.1
 MINI_SNMPD_SITE = https://github.com/troglobit/mini-snmpd/releases/download/v$(MINI_SNMPD_VERSION)
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
