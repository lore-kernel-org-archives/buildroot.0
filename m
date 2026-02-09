Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20098E94622
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 23:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD6760E07;
	Mon,  9 Feb 2026 23:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UacOx6uSEb1H; Mon,  9 Feb 2026 23:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C147460DC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770681031;
	bh=EJJXBj2AOx489t2dn7EeQdpuPOK0eYjuNVJFV7DMHEU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OuXHFsgnrpelB/OA2ceZDYu16VF9WphC2LKqv0CTORLdIrnuXuDJWJ8BdrLmGp5Bf
	 JLuhp7/CEPSDnVY96o561Z6tNymqjzMlVX/1PxRMuMutE7goiHjNclGLM6f9WSHeq9
	 Qm2dihkA6wUmO/2L0UGYAMrrp2yZ5TOyJGfyzPNdG2pbrKN+9IdZZTGZ2fMkhYcmeL
	 S7ZHsI7P2YThzTK2X0wI0g0X7GpPJSAiKMphlqGqJ89+DjDwQAGn+o8bea8mo8uVtw
	 EmWXspY8GSgc4E/WaPJvkftC/eBpf51NatNCk8zAh1xkvyP9+GA0AiTDL2GY9TLbq8
	 pq6uHeJZRdTcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C147460DC2;
	Mon,  9 Feb 2026 23:50:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6139F1A9
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 23:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 463E840C50
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 23:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dzr-QJAYBcZU for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 23:50:29 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 09 Feb 2026 23:50:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0357440C40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0357440C40
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0357440C40
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 23:50:27 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pauUvTM0K5gYjpauUvmo5v; Tue, 10 Feb 2026 00:43:18 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 10 Feb 2026 00:29:01 +0100
Message-ID: <20260209232901.2915903-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfITdtEYa+Sb2CdVByxHH/nap0rP6mtGaQQ7B+ympVD7ISUvV/fwa2kWANs9XDTwRhSVzTYk8PdMIlXkpcU6s/qPkvGjhd0N5M3qQkzFwJ6ghDSMpZTnx
 ZWWNVbwxNtC88iO2j83bDhx5CkPlx4r9NjsRC5MEbiADT+xusEw6VhqtzN82KqjO9FyhXDWZmojlKXJLtWeszX3YJsrOCFtz5OekfUKaNIL3/3QuYZpsko9Z
 KmF+K+m3rduufeXSQBqMAamqeYTosFvLmNyAWjDf9tA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770680598; bh=ZghVzFwlkTpZZNxv6MiBoJLhVsgk678OXbdgV1eEwzM=;
 h=From:To:Subject:Date:MIME-Version;
 b=bSiGJYIjE7YIzoCNUXLSLWAMJfFPqu1yo61xg1WmVIAdl3ENYVC/+tdfLPiDZDvPW
 l+NiEfirIuF8WmmDvnBAuPWS2trA4QIrwuSmK9UqNlD8sALVeA/DPcBwUlqpG5tB1d
 PCMgYLVZMP0wqBiw2WsWEWmIUv/r+gBCm/eWokrNhoJBAt12hhOqGsK1lgdfn0z2UH
 rwCTkqVAQBYruz3F2FUt/DXIffQBGY13KQlCIHFWB43kxErKTwq+JtCRk5mPikJpBT
 ZSyoh2m7KaUfx3iFP8Bb1tbX8VsjRZp0wYNrC+iY9Hsra63niCVyPUTkQo+ACYS3Ab
 3Pf+/E3esK6nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bSiGJYIj
Subject: [Buildroot] [PATCH] package/zlib-ng: bump to 2.3.3
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

Release Notes: https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index a9f879ea18..b317906474 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6a0561b50b8f5f6434a6a9e667a67026f2b2064a1ffa959c6b2dae320161c2a8  zlib-ng-2.3.2.tar.gz
+sha256  f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1  zlib-ng-2.3.3.tar.gz
 sha256  6c9f0d975b41afaa34d22f55bb8986ce69e5cb7ad327cb2b28820cd425edf5ee  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 275c5b86f0..59e4e15282 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 2.3.2
+ZLIB_NG_VERSION = 2.3.3
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
