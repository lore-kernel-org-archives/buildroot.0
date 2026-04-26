Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BFBFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2ED84A0F;
	Sun, 26 Apr 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LBql6DbC7cS; Sun, 26 Apr 2026 09:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46B984A09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777195640;
	bh=iCaaYhjKkqpKMsLGx0eVkQT3H+QMa4sbJjB4/JekIIU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EavR6tvHQToSq2LI9BmiqrVvppM0Qh4I+tOKFxq9HCQOSDrr4kIpEgceENUla9LNS
	 gJ1bwR/aj/AZxtL6e5TPGCz99XD5mGBBkEc+3OMqLUS1JFZZSZ14HgEmFeHwvSeqG8
	 ayibDh0Hz1IDIMBI1t5IVfJXBNbJWeJOmVMQaNRZVR8ZZ8HsjkRq/VsuzFuvhTcSQq
	 v+c7qUNMFT2XqbZnijziC6wEV8pTwAHnk8/k85mt+DAKLcnScvhk78nEbDQbD0HQhX
	 sPbZZRRSTkvNi1ElILxMJk8qZZwEp0/dKenPw9S/b8sbUH/wtGeCjB7++aKuAyeTcx
	 f73CO4YV0r/gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C46B984A09;
	Sun, 26 Apr 2026 09:27:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76884369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 748844283B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXqSiaYXBtn5 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 09:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A64E42839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A64E42839
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A64E42839
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:27:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2541EA4C0883;
 Sun, 26 Apr 2026 11:27:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGvl8-000000002lk-1KCc;
 Sun, 26 Apr 2026 09:26:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 26 Apr 2026 11:26:37 +0200
Message-ID: <20260426092637.2320150-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426092637.2320150-1-bernd@kuhls.net>
References: <20260426092637.2320150-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777195622;
 bh=kAFLmMCtlCgNu1FYCbIdJvJzaU6ibSPRsG4n8o95EDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pREFswd6k+Ryy78tx+ZV6XZdWuALo6XEJXNlZy0jndLCV0EstlnXbjoWhdqfz1B8L
 10XpZwcM0hukkkmr7bgYVMZ1QX66zQf6sTsqfqgXbGM2Zmr2X+p5/UxmYT3xcOYWkK
 FlPkV12xIQfRjPcS18uEdI7lqjZupBnm8RDHjg9Yw6hcPCYUwKQeUVjmnR1vouqbm5
 eESbYxe42/nony6QxyO3D4rVbk6uiMpEXrDYr3M7bNJqzO1mQ8gARSqe6k9le0xUS9
 6cO9WQ+1yenHXRXhxY7PJCPjzW4L3BFInaGaqmI1OSL+9osM5u/NPc4ImjEldQEds7
 YL1ItmH5e6Urg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pREFswd6
Subject: [Buildroot] [PATCH 4/4] package/libgpgme: bump to version 1.24.3
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

https://github.com/gpg/gpgme/blob/gpgme-1.24.3/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 64099df4c3..1db2f86950 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b3a938939a9fb2182684aa9ba094c8e8ecd6167b  gpgme-1.23.2.tar.bz2
-sha256  9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224  gpgme-1.23.2.tar.bz2
+sha1  e7f9be4b461907c00dfd21d23da872ba0638f6ee  gpgme-1.24.3.tar.bz2
+sha256  bfc17f5bd1b178c8649fdd918956d277080f33df006a2dc40acdecdce68c50dd  gpgme-1.24.3.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 635aea4955..80fc25198c 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.23.2
+LIBGPGME_VERSION = 1.24.3
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
