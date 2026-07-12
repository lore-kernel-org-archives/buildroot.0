Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE663C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F47440766;
	Sun, 12 Jul 2026 11:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGyW52UARC0J; Sun, 12 Jul 2026 11:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9126C4078E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783854331;
	bh=2uAXAAugsS9w/i8uF9q7mhfiHlJFF121gMY5Oreg7cI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kIuGBTGbm1ruQ2EpcldyesDhQqx6LA2IQiwi/xL35huG40nnV/+xua1Gq9aCteCtp
	 BlvzaiAhA5raOiIATYYwPuyYHwQyIDOyL6Dh9NNL/YT7nGUihk8muIot2Xq0d7wTdz
	 cgs37KZe9gbFqN688yIR0E/m3CHsYwCi0JkZGUFXuVVOQUfTUU+YJEs1bg6BGt0Vyn
	 zOA2GYg6WhFooUelXKNpPOPJWWSup9tFztdPlcwXvXei7DKHycAkV5ONEXRPkr2eXZ
	 4BkhTYuhlkBSE/ON0HDbZqmIovIlUygze+g7Ec8yPFKvBfQJjJ+6lBbtExUA8fotjh
	 jssQUoFvEOaTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9126C4078E;
	Sun, 12 Jul 2026 11:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1812EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34774028C
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_LLKZrNjqBc for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7495040108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7495040108
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7495040108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:05:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 540E0A4C31F5
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:05:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wirzx-000000003re-43n6
 for buildroot@buildroot.org; Sun, 12 Jul 2026 11:05:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 13:05:25 +0200
Message-ID: <20260712110525.1544641-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783854326;
 bh=X1wU/0cbLfzR4LJCzjZcWKnMyCMXA+zYbIb170hN3pE=;
 h=From:To:Subject:Date:From;
 b=tVuDHrPiC3Ct7y9rSAzZvIYL+nu0/RexzpzwOYaJEyG0iWTCC38JURN/zQpXkXlAA
 ECapTexWNRrw4Q1kaYMNFSSq/vYzB26ftgKQygdD1Ap7frPp678rReS6IuJVWGQUDN
 Iohnr7ECG231yhZOqEcOXelLBXoFjjPr3SxKEvAwyCOfihpsRB8w5pFdGbvY0jWHLW
 jP+fxMNYVZ5A9S5ApDaF9MCzgYiug38GmSTFaADMc1IIrKqFF4JsWdy9YuZ2d7n8Nv
 wC0UTPQJ5N5oVXkHWldIDJ/hKqYRQkOGT+Wg6xLDWP76ptF4e6VKYoGtBeVUbgz5wd
 Gd4pZUaB0TLnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tVuDHrPi
Subject: [Buildroot] [PATCH 1/1] package/screen: security bump to version
 5.0.2
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

Rebased patch 0001.

No CVE entries are found but these commits are part of the bump:

TOCTOU + chown-follows-symlink in socket directory creation:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=3dea5ff20c58ad497062d094b6a9b80a7535a7db

fix potential null pointer dereference:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=ff9d98b8e39f33b07156995188ca55f3459f4d53

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/06012fcffc60a88cad7beb43b73b149d453eb3db
https://gitlab.com/bkuhls/buildroot/-/commits/1f1b7f8d36e68f6ded627ff203413de028443d8a

 ...001-Do-not-create-backup-of-old-installed-binary.patch | 8 +++++---
 package/screen/screen.hash                                | 4 ++--
 package/screen/screen.mk                                  | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
index 4a8a55dcec..36a8c9a2c2 100644
--- a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
+++ b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
@@ -11,6 +11,8 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [Julien: rebase on top of 4.9.1]
 [Julien: rebase on top of 5.0.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Bernd: rebase on top of 5.0.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.in | 5 -----
  1 file changed, 5 deletions(-)
@@ -19,8 +21,8 @@ diff --git a/Makefile.in b/Makefile.in
 index 92f434a..860ecd7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -77,12 +77,8 @@ tests/test-%: tests/test-%.c %.o tests/mallocmock.o tests/macros.h tests/signatu
- 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@ $*.o tests/mallocmock.o
+@@ -85,12 +85,8 @@ tests/test-detach-cli: tests/integration-detach.c tests/macros.h screen
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@
  
  install_bin: screen installdirs
 -	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
@@ -32,7 +34,7 @@ index 92f434a..860ecd7 100644
  	rm -f $(DESTDIR)$(bindir)/screen
  	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
  	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
-@@ -107,7 +103,6 @@ installdirs:
+@@ -115,7 +111,6 @@ installdirs:
  uninstall:
  	rm -f $(DESTDIR)$(bindir)/$(SCREEN)
  	rm -f $(DESTDIR)$(bindir)/screen
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 61bacd88ff..f030e45490 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz.sig
-sha256  2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d  screen-5.0.1.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-5.0.2.tar.gz.sig
+sha256  ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332  screen-5.0.2.tar.gz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c85abaf411..c279fed8bc 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 5.0.1
+SCREEN_VERSION = 5.0.2
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
