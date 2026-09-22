Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB66C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 18:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E636760625;
	Tue, 22 Sep 2026 18:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7xkjmuGS3U2; Tue, 22 Sep 2026 18:13:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C383D60666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790100825;
	b=OLWCuop83xDeE3KoDPX4fBt9C52VD/n+sXA/Pqhs6aurPa7wUHPmsEDTkWFWleSRoa1p
	 sFD9oT8ndeAQJmAKWcuRylu+K0mbRflALY++ReJ5HBidl9PSapxYJXSnMoQSKNYLj6wAb
	 Uu6jeDnVV/Wiyiuhn7vCxA2m1JLMUYdOl47kWZdmmplOLIPANjIXBspApxknoZ+8dOMtK
	 jByytrE8Qi2g8CZ6aLT4NWV2D9ZxXwpHAGr9WDpvF5VgNnUvcCiarvdnPwk5fYM1xw9AI
	 xfO9W97sOLHRKGZyAXrSEoRRZym3dR6q89eCipDgEFLzFAY5FQS90QkrtPDTaro4kVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790100825;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/5MMrAcRtq0lZjLDXO6PUErN01Yz1L2mTy9sxo+sWmE=;
	b=Ls1BhV4dj/Ly2SsswiZNgqz2828nbpIF9kTcXBrOsywBJpDOT22FMgZ2ETPh8LQawVWI
	 +/QwDTVxGzb51ayai3sCFyGGDi2p4BvbnBKg6sJQUFM9/W2yQzYuS97cDNlEkFYPUBrcK
	 MSyGimMah2G4DdOBpjy6MnQil+hGZCBm06kJYTCYV8sw9qQmF0K+1pYIgzzgc5kECvyPq
	 XfuketfEOzZzh4Cvw0mJghNnra2DGpHi0TMUzfmQ6DyBcrQ68nv91wJkKC/jy671i2YV9
	 oymI5STp2F6wAFZY8yu0fX1Yoy3Hcev+DxpO6YXA+CQd65QB5Oz9JK1JNeFokEDjg7w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790100825;
	bh=/5MMrAcRtq0lZjLDXO6PUErN01Yz1L2mTy9sxo+sWmE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DZ4jAArU7zWsKe3LeBj/KHANbyFj8zlnrvjcKNmyibVEyZsVOXF3tehEzGlZRCrMz
	 YQ7DosjfhETNOL9+3coT+PkAax9ygcoanb1KzwGuOCEEdFiWZ/iyqqTtFykGqKJc1A
	 KhmGVsxxRfeDrlRy772HOGs5eJREsabTd7X3vrPXd5AyFx7HI/Umj05uQ5VtFFbagw
	 mAO3PxFHUSdAFtuCuk5gmUUInJGIQtfOKriDK1IdPGJeqHaz2+CEnfFmXiwW6HN9Xx
	 t52tPHVO69GAld8eMTRw2sqBND7wlZdjEGfNNNiwwJdG7liFNHpDtRnQtUSgEOdbTb
	 iDiatcEBuDiig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C383D60666;
	Tue, 22 Sep 2026 18:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E71A312C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCEA840076
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzQKheasZytg for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 18:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 96DD14004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790100823;
 b=mZw7/sfYwapWnHDKMZchCRpG4PwPwrKhm4Cr9YWO4JtA+QPUzozjByRzMmgJ+3fa+WjT
 +QDnF9xuUFziphYbcA4tOt6gru/aFiR7pLfr3wzSKFmeQkxmXmBsW4o9liy4P6T6PMJXa
 ue/pta61BWkXGqkseUm0cNreuYh/ROQfBJEt32x5EstPWln/WsVpZzYasygOTL/MK1Bai
 sF3925rJ4lsJCE2PdyXTa0PoYV2CiHcsZsntPiUlEI31GAqEMzCfzof+ij0zbWHZuavfQ
 XLCZoW8oteiviZaAaRxETWwDE+5KjBNIIFuZMpT/J0PAf31JvFVKUWQh9mNJkH3PPEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790100823;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t8b0GaRYjfmg8pqWL/Skjvpeia5zLfEHqbcYszz4zBk=;
 b=gAsjuur2PQEElvHSvcVWWqkpRR2qPo0PMb2V9adcNiKt3zAGADabm7E4UZo2jfHDdPUN
 DAnk4BBSNrZ8IUWCSVrqckZfP2O0zDpJlRJOoZ85VlvFjFLSwXX6VTn4RAUuXg/rChXCB
 W1xMZNix8DtJ4pSekgqW32rSnLfk8m5Mcc0hx0WtMr3h6amzsbHt3+I55fplRw2TJ6/Un
 MIUH9PSq62brHxatT/kbyqjIgsB6Qa0LGxMfpJGaDAg+oYdfaJfrMYOKXT+C0telHi2gz
 +HhzuKFj/sa2SJ1KcLddoknwu9NNHgwPtp8EOPkhKMokLu/pQcQ48enidI5dqfsemMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nIcH8zdD; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96DD14004A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:13:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3F7C260139;
 Tue, 22 Sep 2026 20:13:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Sep 2026 20:13:32 +0200
Message-ID: <20260922181332.1533919-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] .checkpackageignore: remove entry for
 mrouted package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] (package/mrouted: fix invalid daemon path in
S41mrouted) removed script execution permission but forgot to remove
the corresponding .checkpackage entry.

check-package is reporting the error:

    package/mrouted/S41mrouted:0: NotExecutable was expected to fail, did you fix the file and forget to update /builds/buildroot.org/buildroot/.checkpackageignore?

This commit fixes the issue by removing the entry.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16661195972

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d8f408b1f16d067d2e676f3db91e7b337aebe160

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 47e8dedb72..6d2a024e07 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -608,7 +608,6 @@ package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
-package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
 package/multipath-tools/S60multipathd Shellcheck
 package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
