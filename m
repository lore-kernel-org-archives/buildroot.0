Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0383DEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 11:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC8E40988;
	Sun, 16 Jul 2023 11:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC8E40988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lv74lki2Opio; Sun, 16 Jul 2023 11:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679034098D;
	Sun, 16 Jul 2023 11:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 679034098D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F11531BF3A0
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 11:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5A764098D
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 11:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A764098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLgxyQkKlRkc for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 11:01:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5416440988
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5416440988
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 11:01:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F57AA4C029A
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 13:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57880)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKzVE-0007i0-0i
 for buildroot@buildroot.org; Sun, 16 Jul 2023 13:01:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 13:01:24 +0200
Message-Id: <20230716110124.3810298-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689505284;
 bh=matNhnHl3GminbCoNzz5K78kRf2GQhVf9r+BnznXQWQ=;
 h=From:To:Subject:Date:From;
 b=MDUSazzNQTmXdLxinCkEK6+YVtXKrD6BrWot8FqvJFuTv3G8+WfybqZd0m68YQnLi
 hIfr2leQm0GG19DJ0iRZMI5vNBNQQbVB5KL3RznNjNsk4NLriU6X1vwYnQj32SnfrV
 OSirCwe4ewn/WgHwmlfTYR6rVspa9C5Yooy1TqNOvNCjBj/y1ckulO5Cq2PtL1zWAQ
 Rp4Ij7NQb/csSuOZwBDcwdgJnhN+lKG+HS9acFMYvsggVGcVocXOUyHINuLVk+77XF
 oVEJsjkDmsPHPGf8IzrWfOlRIjRiGYwlsdcPw5mgcWccJLq+7Bg9Q8GK+KJQ1W4/Sg
 9FHENIo7yBXDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MDUSazzN
Subject: [Buildroot] [PATCH 1/1] package/git-crypt: fix build with openssl
 3.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Fix was proposed upstream: https://github.com/AGWA/git-crypt/issues/290

Alpine Linux uses a similar fix:
https://git.alpinelinux.org/aports/commit/community/git-crypt/APKBUILD?id=25b42ad7711b08c63aaf3c24af80a4bcd7607817

Fixes:
http://autobuild.buildroot.net/results/dfb/dfb5da218bb323edc57cc609c2b75d5fbc6e1fd1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/git-crypt/git-crypt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index d562522485..82671b037b 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -15,7 +15,8 @@ GIT_CRYPT_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 define GIT_CRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 		LDFLAGS="$(TARGET_LDFLAGS) $(GIT_CRYPT_LIBS)" \
-		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" PREFIX=/usr
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -DOPENSSL_API_COMPAT=0x30000000L" \
+		PREFIX=/usr
 endef
 
 define GIT_CRYPT_INSTALL_TARGET_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
