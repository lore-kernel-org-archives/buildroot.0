Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93301E66882
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 18:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567AE40659;
	Fri, 19 Dec 2025 18:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JD4dYBhu41c4; Fri, 19 Dec 2025 18:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66961410E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766168389;
	bh=HPxdAvHjbLWWZPpMm0rmuT/bHRafMQaLkqhc015nG4s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qDsytzvt1N22ibg7fxHFQZlBcQ26DlThGC1tKQhB0oDfjGLzvslyPboB+aeTdFBzP
	 fgodf+LyHT5gxfWJ5hX/mJaztzNYYhwfSz9tuaakWFwxffCZ81jsu4iW0rVWtTe/so
	 93dX+6disS+EKQE5pccifpoxMskKMC/wfH50JTJZOTIJA/4FVKAKx3d7uoltSb48A6
	 Gvgcr4+sC/38kAOu0teQucx8HEMyTb2qVMZWJ6UePmCm3NHDHfTvetUHl3AasQ1epZ
	 +na9nsiSmahET6AP2yZ7gY5HJjws0Ax/b0SlgFK0UMokf+pDZkTO4PZjKjuXQnOigj
	 mt1VGG+bHa8YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66961410E7;
	Fri, 19 Dec 2025 18:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6FC1119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C889F4019E
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2FCVJ35PMZW for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 18:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDF1540057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDF1540057
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDF1540057
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:19:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CEA18A4C4303;
 Fri, 19 Dec 2025 19:19:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36880)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWf4q-000000007K4-3WmN;
 Fri, 19 Dec 2025 18:19:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 19:19:44 +0100
Message-ID: <20251219181944.1912692-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766168384;
 bh=VV9V9svUXJQrsI4KR6zd/fey/nHf7B0f/+AxTph6Utw=;
 h=From:To:Cc:Subject:Date:From;
 b=K0DMvaLgETArtY0CpNuNOzlJyVLFpI1iTbr45ukNUN5DTrp9uC8TiBbyTqcWZVCZi
 io4jXBrwqmVJZBqp851wnm+7WqjYUAk8UpjVvzqEtoOIndOHcCxYtz029hG2fVGLeh
 g46n21HaPLwnlfjWw4t22OMX3nh3An0kD/ICW5BHwiPFJiXP8zFdcWT5N0iw7n1KzI
 UEQ/aUN9NHMn58TpOPFnE/73WgwUz2mGdyCTVNyFhpPdaBeS94gsulblpMLb8L2QhE
 /FZl2+YB0IcQdoKpJ8T2+ElAW6dyqVp0opJrHgiJZLCVyMGbWCE/6YD891DOZNqlIA
 mkOowMEcgzTcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=K0DMvaLg
Subject: [Buildroot] [PATCH 1/1] package/python-gpiod: fix md5 hash
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit b243b77ebe5eedf8fbc683d5539d9bf386da4420 added this
package including a hash file containing a typo of the tarball filename
for the md5 hash. Updated comment as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-gpiod/python-gpiod.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index bbcc7181ff..dfaafd4d4c 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.g
+md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.gz
 sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
