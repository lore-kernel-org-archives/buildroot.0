Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F02CD3427
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 21:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9826441C01;
	Sun, 10 May 2026 21:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUTlQoPKdZBg; Sun, 10 May 2026 21:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE33041BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778447920;
	bh=Mb67FrqFEbOgNdJvbPnt+rNvD8xcduqKF9UZxAsgCb0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jpyf5CXgBNVsRoHogn90vUaQKMH9agn1oJ+mSbOYwbLsJGKae10QUP3Osav4zrD35
	 VWR7x3FKKB5Mg8QjdsEE1dDsBnExf+MlLgmUr6KiDg4MDp+Ysq4qdbW4zuZwIN6tEP
	 KV82F7rLGr3fzn4Od/ROLyRC2eJi0VC8STW+cYx7YNbPbfaKdIEplQYXFLs/AcNxA3
	 5KJ88JQSgNriOUZhIuNfbFeMfLQ3STNTpLF8Q7wDvbCFMyuP3p/ev/q84Hc61V2kPZ
	 PnJMYEzOeQ2cWV6RX11q6IEIi4mjg9bs3RfHgNdOm+4YxphMZbp6oJOdqZVu4EvpWe
	 Kmb/NbN/DnDOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE33041BF2;
	Sun, 10 May 2026 21:18:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33045272
 for <buildroot@buildroot.org>; Sun, 10 May 2026 21:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA9C60710
 for <buildroot@buildroot.org>; Sun, 10 May 2026 21:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIgYhwVmeF7D for <buildroot@buildroot.org>;
 Sun, 10 May 2026 21:18:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD2C3606AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD2C3606AE
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD2C3606AE
 for <buildroot@buildroot.org>; Sun, 10 May 2026 21:18:35 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id MBXkwxIJ15SteMBXkwbZq0; Sun, 10 May 2026 23:18:33 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 10 May 2026 23:18:32 +0200
Message-ID: <20260510211832.2114019-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMV5uR+25j/hh22aMBZAW+qImrYjxyz15ItxWJAGzZlo9UYbRQsiY8VunOrnnSVUDYeiKHoD6vVdjKNyT433+ry82/Ij4D504wapmWXKRT834RkgYE9G
 Mqr1B1sep2MMpLGmehL6ZvV7i+szUBUPP37kjTiBdz8OAGxxLIvaIGi7ASvI+HO55mu+KBqQ43R5/aOImapdhTGyxF/tbhq0oyeERy3/kh0w3oqnnmlhKp0o
 b3BCwOgUFnyeo4H9Ky6tq3NflEyHGvFnDhM6ZaLJ16M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778447913; bh=OigQpBocbI19GqHIsIOKlXQ/GMu+j7QqF9WjsFcJi7M=;
 h=From:To:Subject:Date:MIME-Version;
 b=JUlqk+4aTVqY4zFFZWFr55M7GXM7SdJ6ZYjY5tICJ46yEGZDcNi6SgZXXXcA6SYCm
 AEhaNgMIhqPK7dywPrLCcoq5Do8kwQ3cyNawZEUjK2U49gjXAD9gqxJq4uUWx1lKaK
 RX+SY8Ye8j4CBVKXegGblhds+blZomJgTwAlf4JGsuIMP4loGjYviJjNBLEjLILGkb
 seNDa/EtTt7FPc3808kJJ1QCtk3d7amwefP1ucn3urNcobVA+bJReqwDAS/SGobmrm
 qUuU9r0DjF6i4HgnnYm26GGo9In1noaJEtmXLCESGDWG431dkUAt0AmuVRh6F157A4
 nrnThqdurgT2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JUlqk+4a
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.4
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

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=6a1533f24b646364ad514c542292b5c85b2adabf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 95e6b440c0..3f7a9a0b32 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.3.tar.gz.sha512sum
-sha512  4f463ea9d9bd72cb9852578a43ce04a211e2e775782f4cb6b2af328d51f80fcf9cff3255c519f60027f7b0d8b9d3c9ebed100925bf6324bbef81381ebd3c77ae  dash-0.5.13.3.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.4.tar.gz.sha512sum
+sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675 dash-0.5.13.4.tar.gz
 # Locally calculated
-sha256  a83727c1299ac4c3d9d43979393b3a4eb00275d5636ae02526e7979d51d6fbd1  dash-0.5.13.3.tar.gz
+sha256  d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b  dash-0.5.13.4.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 8c9224782c..2b33433813 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.3
+DASH_VERSION = 0.5.13.4
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
