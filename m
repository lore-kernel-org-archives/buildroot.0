Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9112ACA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 14:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE5E80DD9;
	Sun, 11 Oct 2026 14:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sipncc3jwFiP; Sun, 11 Oct 2026 14:45:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 449E380E25
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791729954;
	b=j2a8h4en+IhtgpZo7LL3iMpuWQvh1zfA6hIMV5eKrr1sjsUjX8kYT9E9gigkcqLhWHbL
	 Mbe533gFC2A5/dj7v3bXDkkfN7M4Lwa0sSKXCvbTRaZ5X9sJbS9+6zYepXrZ5tZhZYE3U
	 /N+w1oWlBjv7dzkCkBA+ziFPPusLnI8gHlsU1Je6uDib/arad3gaQhrnvvjUelguOTDUU
	 RvDkUVBkkX61tYIGq53clBqw7+Q+FK24hDK0lDG4xQZB8hfytaKGvJRXbn4u7zsgW8Oid
	 M8coL/JOnlJ0lpBc2wrgQHie5WZL0tJoU4IFTSkbCWe6lTsZb92cHuTbZddviAat0QQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791729954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d2nr+r8RYQ2ue2Yuu/T/KRcJc9t0MG7sAHPpg2tn1GY=;
	b=CEcTmWSwNhORLnHcmj5pjIaWdl6B2eMPBZ6mhXB9EM/kRy9LHnUqHMBk0Mar7TKeESSf
	 KO1ahTKc61ScZAQqo2Ka0H2nDMyn9hoerRryuwOk8iJ7nYdJD5WD+nncb/AyRcKeZzYkI
	 wojUUyDPbVJRPyfZ7WkPQ0ondKJs7M/chXvqiHnSlK3iLatkzuNB6RyPVVCmk9mJfFO1C
	 1JWmRpuqtvYlmErWPgx/4VaT+4ItQer2Na2Qmeegdke7dzDDBdwY48iNyaLsseFtJ8Hfy
	 N8SQVKOyFd8QV8iQuqZX2SFC+GV3bwiTHICRH0yQIdPJcFeYkxjHD0127cpj2hhzc2w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791729954;
	bh=d2nr+r8RYQ2ue2Yuu/T/KRcJc9t0MG7sAHPpg2tn1GY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nBwmDAJ7T4o+m76wXhJZV86O4clS/836pS+7uWQFrSEEImJ6edqILEaAlN8ialvkw
	 UM14aCd/hWtnRv7fld6QbEcivww/XCmIXRo+ZaYfwXp/8hOBy8ECAnTmz69FcId0Jg
	 /kAWzY/i5mfCnlSEZ0bBMofkLL/Vy0ohEYysMfL6GNHlezuzlWHXiMVXf0rxbtrmvx
	 xHUFRkQcLV5eUquqCA6U5k+6YiddKBysf/E1LcNQKqNyP5eGeoMZXGqr+f+2E+YfpG
	 W6o4aXWCnS6ZelJ5sfzF78Iw3IvSGZ+HPL52Y2oZ7Qm8gsKWujqRYiobt+UHu4SMGm
	 bEvpf0GXixaKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449E380E25;
	Sun, 11 Oct 2026 14:45:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C665775
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C40E840076
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGEiEqmYZJyZ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 14:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 012C94002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791729952;
 b=P3eWIx2S/cdBGAwM6blVe/jN9xE43UYHu4F/iiTNjm8UHDHXlr9n99QngLlJCzxx2GDc
 ECKep4smE9bxVYELYkjH/h+qlrqgsLKzBTZvyJWD2/dCalpv5dtgb5H4b9KWpl82JebPs
 y9a1Fjrme4n+DYmKAhkc+22uG5s+EPQmiwAGawdEgmER2yJWBSaDcSq8xCYmmi6Lm78cB
 8SkhpK3qT4qIc89rAn6s1IsDg4YgzEPE32wucQ7/sjOn40rxHLCyBAqwRxpfXlVI2VoBu
 qR/AEYLKgyszhys5nLpC0ORuyLGFoq/dt6V2/SLO1CIf1NBa+YNEuNO2WEF1Qy+4c+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791729952;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Fq4NPdblZn5xCTO/1jz0h5G2XmZld2Xhf6mYligkL8A=;
 b=MnNa3Xfbh597WJAV7Vq1i6V+/tP6gYT5RfPIN5uZ/T1voVAZBqYsQGaP3m5J+sSHb6Kv
 dOukW2/tA6ruXeNKw+eREbBBVLxtXkzrgN2AS3fZ+E8uPV/2oMQaPhtj4ShG2l2yb9Zz1
 SdgtIiVYgj0CTJGdYeVWMJT8LTUiJQCPfmIULyNGMGODMkKzibZdqvFh/sryKAHlaHMJ3
 FKVEvZj35ok7leh0TD5WKM9ivVl0t7Voc2A9v60URw/+xTWVKs5ZGeN9mIz00W+/J3yij
 1Ha7OkC7IY751ICLzi8Kh6iIWiqiLbJTsmWqKuMN2cEAJDOG4GYkI4gvoY5JBOSXyoQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 012C94002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:45:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 409E194E72; Sun, 11 Oct 2026 14:44:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 16:41:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 213e01ae9cdff5937d7022d53212aa9c9dd720e1
X-Git-Newrev: 66754d7f504075188b2ae7eca2530013986b3fb6
X-Patchwork-Hint: ignore
Message-Id: <20261011144433.409E194E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] icu: fix static linking by adding -lstdc++
 to pkg-config
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66754d7f504075188b2ae7eca2530013986b3fb6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The ICU library requires C++ standard library when linking statically.
Without this, applications using pkg-config --libs --static icu-uc
(e.g. xmlcatalog in libxml2) will fail to link with undefined reference
errors to C++ symbols.

Extend the existing fix for static linking to also add -lstdc++ to the
Libs field, not only Libs.private, when building in static-only mode
(ENABLE_SHARED is not set).

Fixes: https://autobuild.buildroot.org/results/80c/80ce2a1b8ec356dc13e3c51474fe4cac9cbe3cd6
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Acked-by: Andreas Ziegler <br025@umbiko.net>
[Arnout:
 - Remove checkpackageignore entry.
 - Improve patch comment.]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                   |  1 -
 package/icu/0003-fix-static-linking-with-icu-uc.patch | 17 ++++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 83c1e0c66a..edd5ddb3f2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -402,7 +402,6 @@ package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
 package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
-package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
 package/ifmetric/0001-Fix-issue-NETLINK-Packet-too-small-or-truncated-92-1.patch lib_patch.Upstream
 package/ifplugd/0001-cross.patch lib_patch.Sob lib_patch.Upstream
 package/ifplugd/0002-fix-headers.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
index 36a3d1f696..689e1304e7 100644
--- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
+++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
@@ -6,21 +6,28 @@ Subject: [PATCH] fix static linking with icu-uc
 During static linking with a C application and libicuuc.a,
 -lstdc++ is required.
 
-Add -lstdc++ in Libs.private of icu-uc.pc.
+Add -lstdc++ in icu-uc.pc. When building a static library only (ENABLE_SHARED is
+false) add it to Libs, else add it to Libs.private.
 
 Fixes:
 http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
 
+Upstream: Not submitted (old patch)
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 ---
- source/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ source/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
 --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
 +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
-@@ -279,7 +279,7 @@
- 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
+@@ -276,10 +276,10 @@
+ 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+ 	@echo "Name: $(PACKAGE)-uc" >> $@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
  else
  	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
 -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
