Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40DFE87853
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766AE6063A;
	Tue,  3 Feb 2026 18:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nDzRDg1jOMr; Tue,  3 Feb 2026 18:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F725608C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142231;
	bh=zv8EsoVrnJAoaALlNHsrfK8GsjWqM74AerZLCB5cuiY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R/IpjCuJiru2kDu7xtv9D/G3GhAuN46qVJ8qj3c55Lj2H79cEKP9a4SkXo6/ziJw1
	 FlVtzWnNpDLjH+XX/3EmbA72K8sWHtxPHgyGFdS4De8nETPzT4moTYfwnaFxi39IoG
	 kEPbBUol5BfJwEsLUfilhPLQYHSuBZerkR5xOcaxKDsC2bcgxVWpoPvt2gwSemBC8K
	 sg9mFWtaVaeDnnaUJicb9lDNogcxz/l7C7KF76qo2stwhW/8J3S4K2oIzCH1Qz9Qwf
	 kaVSYtnhkELiu+Dk91JDDDwLDH/80Ias1+H7QIm/B7HNXDcoZMrMblbHZgl6Rjg/Iy
	 ucCG9fPJLx+SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F725608C2;
	Tue,  3 Feb 2026 18:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 964FC13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 848A14037D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id An59hMslBPcL for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DC3240205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC3240205
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DC3240205
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8626DA4C56AE;
 Tue,  3 Feb 2026 19:10:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47822)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnKqp-000000002Qe-2BRq;
 Tue, 03 Feb 2026 18:10:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Date: Tue,  3 Feb 2026 19:10:10 +0100
Message-ID: <20260203181011.2433975-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770142213;
 bh=NrjqCqW22XCh7954UjamoFQY6BYiZdPiHmuxgezBbFA=;
 h=From:To:Cc:Subject:Date:From;
 b=kfmunwQDdCwHgvUQPMi8CW4rQBqEDQyWOXbYcyV7jgoOhScGHoW59yN8oB3jSg3Bi
 HmfW9ac5/6HYawrJRpb2RKGjZZJKED8QlcyRYt14wPZ0OAoj/u/W+/6TTmBjlUbOxp
 +9kGMg4eR5vSeVCUFR4nHN7K7zXmKUX068rqUt2Iu0jjlUIbjG4dfF976MvtA/qP6X
 ghMp4mTvz8KEUQzXJjK5uTtwpKP8Trhbzhv3//7rPtoOOQN6xHQldzwPPelfFzJ1bK
 xKZOok1yGn+HEfHQCkOVSefUuxGJpCwT4ZH5EFnxvLhC3ATBbmo+xyuXoR9XdqcfjN
 eiHedrpTRlANw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kfmunwQD
Subject: [Buildroot] [PATCH 1/2] package/tcf-agent: rename patch
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

Buildroot commit 408352207c18084c331b23aa739cde98cd52d000 added
0001-fix-uClibc-ng-compile.patch while another patch numbered 0001
already existed.
Rename the patch former for proper numbering of patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...x-uClibc-ng-compile.patch => 0002-fix-uClibc-ng-compile.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/tcf-agent/{0001-fix-uClibc-ng-compile.patch => 0002-fix-uClibc-ng-compile.patch} (100%)

diff --git a/package/tcf-agent/0001-fix-uClibc-ng-compile.patch b/package/tcf-agent/0002-fix-uClibc-ng-compile.patch
similarity index 100%
rename from package/tcf-agent/0001-fix-uClibc-ng-compile.patch
rename to package/tcf-agent/0002-fix-uClibc-ng-compile.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
