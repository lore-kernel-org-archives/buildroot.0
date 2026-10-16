Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D1C860B46;
	Fri, 16 Oct 2026 13:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pR1GjHBW06gj; Fri, 16 Oct 2026 13:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 627A960AA8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156125;
	b=FlsER7W/OFpp2a8BPP2A9AOlinL9/6yOMxEXdFFmbQejjICZgMlXyuLu5XWPLg2txGOc
	 HHpOiHfF3mSMHqlQ2oq2hYSa84SLAPT9c/EZApH/tjT9QwtIzFoxXwn6D34XCaooYpjqy
	 wG015UjPO7uZGB42UTzSl/whrx7Hj2qi7k1Ty/f9TI06RvV2NZqqzTCo7jW9WoeR8otin
	 dWeLXJLWTJy3MXqW2i+a4hF/LIPimIVVWQtTYoWDdhFIFZ0xoGGfdUQst1kzIUh1SSaKc
	 lOY7PHL+8kr7WlQK6Ypl0zwKbvuH71KMWYl+1byG5LEDksP85A6cSO0h2TP4O9O6uHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tJIB7+4rF1byw0AaLOIbkxABDbOQcC/3iYKr/j8aDN4=;
	b=nESXlSfwGOzOguc1UEYLidaFH3oRmxF/Eed95EkIFk3aPusOpFY6KaXsrGbBBcz5aC9a
	 Wc1b+42syYgD8cujhU8SH/k5Pk3a4i89pdkITnBKwrknSzgqwy0g2fVJzC9lG/eGcYBHQ
	 AZKwEXDs4HvHoOVLoxDatPC7upbDDSTeOmyPTYoo4giGKLzXk4j3x804A6F3oLh9ma9A2
	 M9KGtFnCxLS8Xejrw8GUqsGQ2D+gb4XO9VTJ3eb8Xu2Cds+XYsiMzk3QfBai1swih1ZZq
	 2HlJpZ9kPB+KDDrJ7GgNoJiKKwDQRltdOMBQ6xwjQUiSW+MX0tqjXJ0cFuWW2a778Gg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156125;
	bh=tJIB7+4rF1byw0AaLOIbkxABDbOQcC/3iYKr/j8aDN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iLj/DEtQYqbbNGea6GPvaT2WgNGIIA57aGsKOQtgpQ2ITmo6cyv9tPGNayDNTSjzw
	 xgCYYSRuR+EXUb60jbVu7oTZ9dpNLiVyLVQEFCJvhNj2AIEo3utB8wareM4vRZBPwT
	 ZnA8JCQseYUUhBzXdDn20T2dwCIHf7ynEsN9OAYxanaMRRJXwQHlcJnUA/UX+lQXC/
	 xM8LnqzdilCmoRdQiRPN4VY62clF3bj//Lw5FH/ABJSSg/qriNAMoCKUfKZ2L59wnw
	 vIbLHfYzcViMIE852GZZMfrE5eDVJl0EEtNDW9v3cgvU997IgUbni+9CcVmRiVB5Vw
	 Vnvw9ACCp5dLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 627A960AA8;
	Fri, 16 Oct 2026 13:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C3B255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008F0409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuT0Rdtd6_5W for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE5C5409F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=Dx6RGEBumd9yKKSJeqaVp3eQKiQ9CZWGSxeNPJMexh9/khnPFOdexeijAC26RJ23WtyC
 HcIpfNVNR1lPxpDUzt96IEvpXSbOEk8kwZNBoo+PsVLCFwmj7PkesBj5a+s5nGqh3nXMQ
 kPpC3D5hMr7CCARD9FLqTug+MZCYDDv/ENxCijmqhfU6V4y981ZWut3eOBGf2HkPNuYrt
 NUsbw7Q55s4OQ08sIesQtBC3WO5zNFs1n8ZzZpZ1gCDR/GGrqT74M8jyOTZ8SJtqRQ8jD
 bWKCyoSxo6mV/4aSXihr88Pl8jDAs3C4YCMsYzgslqp9Z68oKicc07ANEoPW4wBKDhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z4QRfryswb29HUC6v2cjQaUj7qzkSkKuwErWsQVKPQg=;
 b=G72+gjML4n+QlI7/z/8FWfv5/xmsxeSMzXIKYXicoYYgTq7qg2r42OXOIWHB0lEvnVKA
 eUai1OEoDJHQUoXypm/Ffr4m3bLT+feiPEENwRHcgwTfioxT8AelZJu6jpma80o55S3tk
 MCxhfUIU/k6D3slzPVXo47NxSwwWkz/4wRwAS5CtPsWPenYSeZxL5KUgQ48AJDuEGRqQJ
 YR3LSIkTWw7rfyNTk2PJC3wMCOLeTC7D7pbAMLbDIMTk01umK3FKi6kXyBO2EASOqVXgT
 dIn9vVaa4//fmc+eh66rhMJTfbshPG5PdeqcqRtMRQJp2ubZwNaqkZqv+56NprIu7og==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE5C5409F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C11B9960DB; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7d2d6f17772479a4508ac2113696d0d83672fa2d
X-Git-Newrev: d4c72064f96e5a476342d59a3fcd3950c5798741
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.C11B9960DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: remove
 configure option --without-cxx-main
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6483506682755020218=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6483506682755020218==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4c72064f96e5a476342d59a3fcd3950c5798741
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Upstream release 3.12.0 first included commit
https://github.com/python/cpython/commit/398ed84dc40abc58e16f5014d44c08f20cb4b5f6
which removed the configure option --with-cxx-main.

Buildroot commit 36e635d2d5c0166476858aa239ccbe78e8f2af14 bumped the
package from 3.11.6 to 3.12.1 but forgot to remove that configure
option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 261aaa6d63c5bc717631ea0ce2917fac321ac84b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a842dab2a9..a2371b1a92 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -18,7 +18,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
@@ -194,7 +193,6 @@ endif
 
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
 	--disable-pydoc \
 	--disable-test-modules \

--===============6483506682755020218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6483506682755020218==--
