Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E248EA8541
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D4040B68;
	Sun,  8 Mar 2026 20:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVD_z-VCXEbE; Sun,  8 Mar 2026 20:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C8840B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773002162;
	bh=HHVaH0YeLI6jUNVkLABK9665THZBBud0UoJSXstzNiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IWd/O6Ba41uf7asp+It7gObMqN9JzvkWsf5y37gFkLh3+wNpH8jqkSXhCqxa5DC89
	 vE/kahPKHXnoTvZJxz6CO5qYu5AmaL4NW+EDkhetM9MjtVQt+btNFjaDoXGWYhx6oM
	 G+H2tPh0xkdZsqlvuj37UEay3054bINR6rE5DoQ8q5TWlCAW7lsS67lr4sB5it960J
	 awk/vl0HB7oZlnZc2wHcN3e3mOseSFrMs+iC28aLliCy5Iz1nn3gn5xQ2GQOW3JzTm
	 zVQ2LRtlGG5TuqDQGkfU8KvLAOg4Wgtgmalzate9KFDbz5CvbBRk/9eAUYU95PCwJ7
	 RUCKkPYAmREJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C8840B62;
	Sun,  8 Mar 2026 20:36:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD09358
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD42083264
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ocb2_bzG6ZJ9 for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 20:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B048980D81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B048980D81
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:35:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAD9984569; Sun,  8 Mar 2026 20:35:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 21:34:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04dbf7a38f4e83a1c6444b910209a0e3a350b14c
X-Git-Newrev: d32b12b54833a237096fce58739044b8e5ef23bf
X-Patchwork-Hint: ignore
Message-Id: <20260308203558.BAD9984569@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: fix build without threads
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d32b12b54833a237096fce58739044b8e5ef23bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 03a1732dea67e088ec85f92853ca14f5a3c0f7b7 bumped the
package from 2.0.33 to 4.2.8. This bump includes upstream commit
https://github.com/jasper-software/jasper/commit/91fca092098396938830fe458f57109f0dd58a54
which was added to version 3.0.0 and causes build errors when threads
are not available:

    message(FATAL_ERROR "Threading support is not available.")

because JAS_ENABLE_MULTITHREADING_SUPPORT defaults to ON:
https://github.com/jasper-software/jasper/blob/version-4.2.8/CMakeLists.txt#L124

Add configure options to disable thread support when needed.

Fixes:
https://autobuild.buildroot.net/results/870/870d6adbac166b22cce217628d477b1bce538320/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jasper/jasper.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 88633c9661..9ed54989e2 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -32,6 +32,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=ON
+else
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
 JASPER_DEPENDENCIES += jpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
