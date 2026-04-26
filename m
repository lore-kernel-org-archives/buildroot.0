Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886BCFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DB5B84C9F;
	Sun, 26 Apr 2026 15:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUVTIq_zX03I; Sun, 26 Apr 2026 15:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4977384CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217637;
	bh=CrhSO3cPQbs6G4k4lFb0D8y3ci/6S26pV2cXU8jykGw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gk0/2OcuimgZ0oDuHUXntWhbSwdzPWteOlpa9yPGy2watUCKvXE2WaLJ/UOwkp6Yt
	 FziFaA2RBWIOpZpg4gL0pnGqMAFvjFhEYTXaLRaGeM5ktLZWqlxCGHaBYhEKuuey1U
	 guo6/VGG7Q9HvrDup9j3BtNHxP5KD7HaPcy2Z74BD30by9IEM/n6gwmPixZnt4Tvmf
	 fm+WW0eLXliARtPa0P2ijs4oefj9eoCV9cO5qAA82j36iXvN1KD1eeO45O4kEd5Ocw
	 HjMg2Bqkwa+ufnIyg0E+WNjQVBsVQvtO7jxdXdBMEpqc6M8UIKdu0suFPb7yuaaWop
	 4yTQt/THyPyDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4977384CA0;
	Sun, 26 Apr 2026 15:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3597B231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AEA961C0B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5vrtEQFw12N for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93B1961C0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B1961C0A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93B1961C0A
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:33:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDnC-1w4M2Q2dm2-00613o; Sun, 26
 Apr 2026 17:33:52 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:32 +0200
Message-ID: <20260426153334.1026982-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iPhlHRlinecuT/CfqvzbEJrA8NHOywtFutKlpx36eMmi/I/veSP
 1HoP2B8HX9Jg8IfTWGK+QMM/W3N9ov/4ww2RdynbhSWtPNfp3tnkbROCGvmY4TnWVWJ0McG
 0O+PmEwv4tv9Ey59K0DWvLCec2439b2oQTke7Xpjln+U6J3MpFQhcfASOuz3SHb5DBv1O4A
 qU6LY/bsK+J6jBp6JEKow==
UI-OutboundReport: notjunk:1;M01:P0:R4jl6Zp2uNw=;vXpyp04KapIbV3zQ5sN24RGugrX
 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
 vGrohSzqLlIla4g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217632; x=1777822432; i=fiona.klute@gmx.de;
 bh=+2wY/U9oFbsD7+25pV+8dd0EY/8y5N0BK/0uNhO/Z8A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=g41EtGyrkntDaFTmvha3rzyREvrtfdL8jLBYzYSD6k/HLFvCAypscxkBg5qWSVUp
 9QdafmZX3Mj57jxA9xrKm9lt0Fu1yDcLLez8ZTiSK+Xytgy/gYAoiT8Y6YoOw7i9K
 F6Nyg0sXbtnDohGfBrvbHfpbZbpMVplRvBtq6u+IBovPeQS3AKw+xwApdLDfblPSk
 6f/f6Q4+HJzPCybJN+gk8PhVVrmQaBk+kUNdITkHwhPah+PDDfdrk/VaR/yspjkem
 r/eTQTUBDZJVz2hVhHYPXClUBeqpTs6UzqgwJ63mZM/30ulgQZ1J64osf3eCrHxmP
 kTjqJvvFn97bQ1S+LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=g41EtGyr
Subject: [Buildroot] [PATCH v2 4/6] support/scripts/pkg-stats: fix
 host/target infra filter
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The filter is supposed to exclude host/target infra from output if the
respective package is not built with the current
configuration.

However, excluding host packages did not work correctly: If keep_host
is False because the host package is not built, the next branch was
checked and included the host infra in output with "target" type if
the target package is built. For a package that support host and
target build, but gets built only for the target, this leads to output
like (Meson example):

meson (target)
host-meson (target)

Skip host infra in the target branch instead. Also include
Package.infra in Package.__str__() result, which was needed for
debugging this bug.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a87bb23a8e..bbd1e3e6f0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -205,7 +205,7 @@ class Package:
                 infra = match.group(1)
                 if infra.startswith("host-") and keep_host:
                     self.infras.append(("host", infra[5:]))
-                elif keep_target:
+                elif not infra.startswith("host-") and keep_target:
                     self.infras.append(("target", infra))
 
     def set_license(self):
@@ -342,9 +342,10 @@ class Package:
         return self.path < other.path
 
     def __str__(self):
-        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
+        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d, infras=%r)" % \
             (self.name, self.path, self.is_status_ok('license'),
-             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
+             self.is_status_ok('license-files'), self.status['hash'], self.patch_count,
+             self.infras)
 
 
 def get_pkglist(trees, npackages, package_list):
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
