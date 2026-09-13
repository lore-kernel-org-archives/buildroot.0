Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22A3C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D5DB80DCC;
	Sun, 13 Sep 2026 10:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DwuM_9XyqEv; Sun, 13 Sep 2026 10:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6272F80DF0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789295035;
	b=rId/E9xeTay/hD9G75nSmmNOh6wuth5j6sJzC1u8wWu6G6lyihhPAdXh3APBGZ3iGBhe
	 Se5xKP8mc4d50LJSzW4+qdIA64PSUO1l0p6hv42dpcww3gKB+DEeBAI+nCUwHpZ1ax5QG
	 +aB8oU/1Nj9cGCe6Yyhi/ejCPMgUqpRoXSoCYWiepES6SiWlddrXjur6zIv2qZvC20ASp
	 9ODM71L+37Jh/tXGAJ5gTau+CsXW4q/biJhm8v0Jh3O9wWg+u1A5f+Ep5Mx+QVArRnT9+
	 hfycPu4ZKp++JD4dw1AvJdRcGl0ABAGEgQzmFJzso9YQ7nT6seAJtn8WxIZvPb8Z+gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789295035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=o9dsXPTeBYUcsxATMP2ljb1TRakgsgxWmGd30AQJM7g=;
	b=Pbv9zqOpQ5Tdw3uilH0hVqZ+zkN50tauMEWrdg5rlZ4wTO8qsqF0DMfut9H7Y3atc6Va
	 H3fVKZ4l+5TQ+DtXbbex/5vJ5R2MRE7QeNESuVWH2RA1fBalWyryq5dxCBY7trdQ3JYRR
	 VjkEaQe5G2wROo18fObaM6pELO2co3QyixXJKpUrpN6IC3nmWoML8X0lE6dmlTMZDpnBG
	 W/Oc4aNKos55zAIxjdQci14la2GSh8X3+eYViID5XTYOWp07Rb7i+6phyM5hLkzNqx6OB
	 5Ss+lEKbEu5RQIdyi/jpCJkqxJxGAx7oQQ05oX533OtZaMAm0j8bPuSVrgGds29O0fw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789295035;
	bh=o9dsXPTeBYUcsxATMP2ljb1TRakgsgxWmGd30AQJM7g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qp9h0mGLxtcyQ01qOlmf0slj6VZQZWObLvfgJ27v94he7AvifgMzkMdtohqaoWOta
	 EFUz6su16SoF8Ov469LJPBFSMDFlEoAgbVfel/ogHE8nx+Xgv9eWejwHcD65oHmNQ0
	 0bNTX3xrhcHNMf9rp2dJxIUlk9QWG8ZKhbGcQGOKcasJnS3z1xn6hTeaYErEnMrQJj
	 jYaob5zatmhBtdNCOrFU6sZJn3Z7zgA3wPZzvtvtv6JeYKHI8DaHwhaCV+/rz2ITPr
	 2PAutTRHNPJA76AXQsAiNJarcynbS7NXbIDiv1YAAFhCvDx0dj04z42+VmiicTXCPJ
	 kZPCEyz0yeuwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6272F80DF0;
	Sun, 13 Sep 2026 10:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F3D23F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83998400CD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dDANQVfmW2o for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:23:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1E76340022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789295032;
 b=IqXWLFLsgSzFpv88bIG/BGtpKgc/K8Ui5XlQ4eCKdwCJosIMV1IFj2Ifxnfp7M9vE9gj
 CBnWXk5/sECVm1aW8OBUuYJNWHarbpYMLo2ZzFNNAULfBY1ngQBmWhqsMulEneyZDiC0w
 l15ooqx3LJhAwZRiXsbfmnCcxQiRC7L/O8GELSBR4QV9BuaeuMhB1v4Ub5mPSzRuLPiV1
 6q7TXbnkrSbfLcL1s6/8PDQflyGvElJOJCUiqjMRz1ZfccG+kU3c665PCrm3xVAz4C/1k
 MyJiBsDLVLtKbz2WaHPGZZZQrngOLRWoALE7Jw3ChwZWGtH639qX0q3KXlFpAytKqQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789295032;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EP1z7WAQk+AjTBAEkfmu87gx2ijEs0QCsPOmPoHSZy0=;
 b=N4vcRIxnMpk7wzwysoGDtFui9eDxYL5CA0uHJkpaIMvELF2TAoGqh/Io7A09Cwiwag5I
 ICdF0S8F6UH80hMn8tc1/UbqyIW0fs91X5/StHJ9rhegQPIrUO5gh7BArqrwo6KvvI0jf
 BZ4itPt2h5tPIM2xSWu7NzW6TfaAdXdlHA5dWNQoOZMIo5vz7X0W/jqG8FsEjjFCZvXf+
 jZIS1lIFjK9ccoaGx8eM9k14trdJ0iUzhi6SBpc/Z7TbQOTptjGdhKU+QBL69yzeSZ5JQ
 ShQ67yA5d4uYG0RjShP/G1J0y+vKAubuOxbugo2ycmoBlRqeNLnIJFfWRqTc2WC8gSA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E76340022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:23:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E2F195B96; Sun, 13 Sep 2026 10:22:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 12:22:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5990da7b19454852fd0cc2f530962f29ba89401
X-Git-Newrev: 60084ced054b6347cd7b0e500aca2cc89b606682
X-Patchwork-Hint: ignore
Message-Id: <20260913102247.3E2F195B96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libconfuse: bump to version 3.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60084ced054b6347cd7b0e500aca2cc89b606682
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The backported fix is dropped, as 3.4 ships it:

  0001-Fix-163-unterminated-username-used-with-getpwnam.patch
    -> upstream commit d73777c2c356, released in 3.4

With the patch gone, LIBCONFUSE_IGNORE_CVES is no longer needed either.

3.4 also fixes three robustness defects that carry no CVE:

  #180  isspace() argument fix, could crash the lexer
  #182  stack exhaustion from deeply nested sections
  #187  null dereference on an empty comment with CFGF_COMMENTS

Upstream release notes:
https://github.com/libconfuse/libconfuse/releases/tag/v3.4

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Fiona: add link to upstream release notes]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...-unterminated-username-used-with-getpwnam.patch | 43 ----------------------
 package/libconfuse/libconfuse.hash                 |  4 +-
 package/libconfuse/libconfuse.mk                   |  5 +--
 3 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
deleted file mode 100644
index 44e15468ac..0000000000
--- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
-From: Joachim Wiberg <troglobit@gmail.com>
-Date: Fri, 2 Sep 2022 16:12:46 +0200
-Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
-
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
-
-CVE: CVE-2022-40320
-Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/confuse.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/src/confuse.c b/src/confuse.c
-index 6d1fdbd..05566b5 100644
---- a/src/confuse.c
-+++ b/src/confuse.c
-@@ -1894,18 +1894,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
- 			passwd = getpwuid(geteuid());
- 			file = filename + 1;
- 		} else {
--			/* ~user or ~user/path */
--			char *user;
-+			char *user; /* ~user or ~user/path */
-+			size_t len;
- 
- 			file = strchr(filename, '/');
- 			if (file == 0)
- 				file = filename + strlen(filename);
- 
--			user = malloc(file - filename);
-+			len = file - filename - 1;
-+			user = malloc(len + 1);
- 			if (!user)
- 				return NULL;
- 
--			strncpy(user, filename + 1, file - filename - 1);
-+			strncpy(user, &filename[1], len);
-+			user[len] = 0;
- 			passwd = getpwnam(user);
- 			free(user);
- 		}
diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index bb968f7a52..19453828d8 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,5 +1,3 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.3/confuse-3.3.tar.xz.md5
-md5  a183cef2cecdd3783436ff8de500d274  confuse-3.3.tar.xz
 # Locally computed
-sha256  1dd50a0320e135a55025b23fcdbb3f0a81913b6d0b0a9df8cc2fdf3b3dc67010  confuse-3.3.tar.xz
+sha256  36bfa3928f9c323914c7c8317e8722cb22f41db69d7c9d4c24b4689fa955445d  confuse-3.4.tar.xz
 sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index fff684a55b..ac3866f746 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.3
+LIBCONFUSE_VERSION = 3.4
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
@@ -14,8 +14,5 @@ LIBCONFUSE_LICENSE_FILES = LICENSE
 LIBCONFUSE_CPE_ID_VALID = YES
 LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
-# 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
-LIBCONFUSE_IGNORE_CVES += CVE-2022-40320
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
