Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3DFC77B7C
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 19:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F7A82179;
	Mon,  1 May 2023 19:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F7A82179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxS8aNH5v96F; Mon,  1 May 2023 19:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5974C82177;
	Mon,  1 May 2023 19:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5974C82177
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 139271BF4E7
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF7686139A
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 19:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7686139A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5zoNrrlFSLw for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 19:33:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E288461367
 for <buildroot@buildroot.org>; Mon,  1 May 2023 19:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E288461367
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE9D08527D; Mon,  1 May 2023 19:33:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 21:24:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8520da532b5ce366c10eb22dbbe65bf2f85ff072
X-Git-Newrev: 6b6814f149cccfb4ae7f34fbfd317560b6cd98ca
X-Patchwork-Hint: ignore
Message-Id: <20230501193313.CE9D08527D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: drop override of
 LD_LIBRARY_PATH
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b6814f149cccfb4ae7f34fbfd317560b6cd98ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A previous commit [1] (libcurl 7.19.2) configured `LD_LIBRARY_PATH` to
prevent cross-compiling errors when target == host; however, such an
override is no longer needed [2][3] (libcurl 7.37, 7.74) and causes
build errors in some environments. Dropping the override.

Fixes:
- https://bugs.busybox.net/show_bug.cgi?id=15181

[1]: a51ce3194923430fc229fc2ad98b12795b5a1876
[2]: https://github.com/curl/curl/commit/e48a821ed580cd2897b3e1b0bc88ca9245ac234c
[3]: https://github.com/curl/curl/commit/6f3369bbcf9d0ebdaa5d141f8ca446448c24494c

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1a1594a45e..dd715c1bb6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -56,11 +56,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
-# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
-# native stuff during the rest of configure when target == host.
-# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
-# are found first.
-LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
