Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BA7CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7210C85114;
	Sat, 30 May 2026 09:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEdWhgN7uFBs; Sat, 30 May 2026 09:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85E5B85136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135152;
	bh=Dat8CxsCzEW4d20kdmb19tCvZg6oN4CatPNSWeGhdUQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VShSW1pO/hoRzApK4BNjVfWMeK/p8xSy1Haink6ow6oMXQDq9AtAax4TZCJwALuNB
	 oGVT73TCuyOSg1fmMOK57TN7xCy6dK4H9ZjmjqDR8zCpN8vZjXu6e6Vr7ejHHHvy3+
	 zbsnBQ2EDClm6G5rKvJtGQWu99fF0UoUxCL3FmzMdDR8ZNKEyF5X7ZiGQR68Jfe1p4
	 qfetvTleDlXydkyhME/e8omFdSw4zD1q8r0NtxPwOftQ9AtRdbYSMQu35HcQMQuOAr
	 Rxlwqb6DUx0T+RENBNRJO3L/cxprQbPvE7A3Dv2g233keCn/gIlOe5fv870N0j/SU5
	 yoAOjwzNcNJhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85E5B85136;
	Sat, 30 May 2026 09:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79484D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7649F6F478
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzpQq-ICoKsK for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E790E6F37B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E790E6F37B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E790E6F37B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:59:08 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2027373453; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 09:59:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wTGTB-000000057La-2Gfa;
 Sat, 30 May 2026 11:59:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:59:00 +0200
Message-ID: <20260530095901.1219858-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LtG4JjQYsC5EbGoCwR5vSBDGoIJ4B4nPzUNZetg8Kuab3NPszaZBs9L5cyjzsy6T/xzVjQ9mp5j8VAKRZDFAZjTRvr34fje3o4QTu86mD35SfBLnOdG3tnP4tr3k9hFAKsADGo2V23WelKImm4xRWH31Z5uH6vnaFds5qLmHqBGYnF1wK9+YJL/PYYW1I4cJ3RQYcLUjq6opKbtm3V5xoDdy7I5ziMiWi05AOYbAxSlZidzz34KA1G4ZQs/dj1EDaNu9HdqCrFu1xDjiVHMXy5DG3HflipBdU4kC7msIKRqjwhyOsGuY88D8Fm+xEPaXo+FyXQylWzTjh5k5JEEMOw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ft61LwVPF/c74V/j92HBMwjaMuUIGRpyjSlya7fuswY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LtG4JjQY
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libhdhomerun: bump version to 20260313
 to fix download
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old version fails to download since March 2026:

https://autobuild.buildroot.net/results/ad8642f9fc399c721cac4fd18f45ef4244db7059/

>>> libhdhomerun 20210624 Downloading[27m
wget -nd -t 3 --no-check-certificate -O '/home/buildroot/buildroot-test/instance-0/output-1/build/.libhdhomerun_20210624.tgz.sW1E2n/output' 'http://download.silicondust.com/hdhomerun/libhdhomerun_20210624.tgz'
--2026-03-14 23:54:22--  http://download.silicondust.com/hdhomerun/libhdhomerun_20210624.tgz
Resolving download.silicondust.com (download.silicondust.com)... 172.67.69.187, 104.26.0.94, 104.26.1.94, ...
Connecting to download.silicondust.com (download.silicondust.com)|172.67.69.187|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2026-03-14 23:54:22 ERROR 404: Not Found.

https://autobuild.buildroot.net/?reason=libhdhomerun-20210624

So bump to the latest release. For details, see the changelog:
https://www.silicondust.com/support/downloads/software-changelog/

The upstream Makefile gained a special case for darwin, so refresh the patch
to apply.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhdhomerun/0001-dont-strip.patch | 4 ++--
 package/libhdhomerun/libhdhomerun.hash     | 2 +-
 package/libhdhomerun/libhdhomerun.mk       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libhdhomerun/0001-dont-strip.patch b/package/libhdhomerun/0001-dont-strip.patch
index 17a9ff49a9..c9eb2a7fca 100644
--- a/package/libhdhomerun/0001-dont-strip.patch
+++ b/package/libhdhomerun/0001-dont-strip.patch
@@ -8,11 +8,11 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 diff -Nur libhdhomerun/Makefile libhdhomerun.fix/Makefile
 --- libhdhomerun/Makefile	2012-08-30 15:46:27.000000000 -0500
 +++ libhdhomerun.fix/Makefile	2013-03-24 14:47:08.740937164 -0500
-@@ -42,7 +42,6 @@
+@@ -73,7 +73,6 @@
  
  hdhomerun_config$(BINEXT) : hdhomerun_config.c $(LIBSRCS)
  	$(CC) $(CFLAGS) $+ $(LDFLAGS) -o $@
 -	$(STRIP) $@
  
  libhdhomerun$(LIBEXT) : $(LIBSRCS)
- 	$(CC) $(CFLAGS) -fPIC -DDLL_EXPORT $(SHARED) $+ $(LDFLAGS) -o $@
+ 	$(CC) $(CFLAGS) -DDLL_EXPORT -fPIC $(SHARED) $+ $(LDFLAGS) -o $@
diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
index 66edd6a0d3..4f3b605fb9 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  deaf463bbcc3eefa72f97199efb6213f7b0e2c8e91f1b3d2cbf52056a8715d15  libhdhomerun_20210624.tgz
+sha256  792d43b98bdc146fa8872f8205f4f8feb1c1d5557e3c77edda6b6b1ede9b9db0  libhdhomerun_20260313.tgz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index 4bc584e622..179299f452 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20210624
+LIBHDHOMERUN_VERSION = 20260313
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
