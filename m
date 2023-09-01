Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71036CA0FF6
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 22:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA6E42114;
	Fri,  1 Sep 2023 22:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA6E42114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1fPdKkGYLJB; Fri,  1 Sep 2023 22:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8505D42115;
	Fri,  1 Sep 2023 22:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8505D42115
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2188B1BF21A
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 22:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF2C4403BF
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 22:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF2C4403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLgrdzKgJLDw for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 22:07:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9180640131
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 22:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9180640131
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 69A3E13F8AD;
 Sat,  2 Sep 2023 00:07:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  2 Sep 2023 00:06:58 +0200
Message-ID: <20230901220659.522842-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693606039;
 bh=gFWb5sXGh1jlUVKW437OCkA71azM4rxBiMMseXcaZPI=;
 h=From:To:Cc:Subject:Date:From;
 b=QpTvQoP8g8EZmtMnCfFUbnE4ZXNsFhzEiPMs92RCX2sMTzm6JJfz0jdaJqLJl6hob
 v59xJgqT7HMsw8Ez5byr4xl3G5pWi0Tkydr6raRN/Fo8m8DK4VuzVsabovtcoQ66zy
 suVP88FgF0eSJNss0o8gEs//pYmBGOvkb+y68XamTMCdA1u/aTlD2+SD0GNgjiKYKz
 0gXhUtnx4mPT/XVit/f2oUeH788+ZCj3ZRKGy+IuZeCVY+RtJZdjaNC4kpaIpf0I1F
 7rKl22trrwrfmRUDufJJhnfTAegD0yEhUa3faNrnsbXDVzEfA5aqw4iw4oiKLmiwAm
 vYbcJ7YSN4PCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QpTvQoP8
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: always use gpgrt-config
 from buildroot staging
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gpgme updated its gpg-error.m4 macro files to detect gpgrt-config at
several occasions. Those changes are included since buildroot commit
13f3b8e124 "package/libgpgme: bump to version 1.20.0".

gpgrt-config path needs to be forced in _CONF_ENV to make sure it
will work in all host environments. See the log entry of commit
d7f2d8403e "package/gnupg2: fix build failure when host provides an
old gpgrt-config" [2] for a complete explanation.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=history;f=m4/gpg-error.m4;h=gpgme-1.20.0
[2] https://git.buildroot.org/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpgme/libgpgme.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 21a0b30d3b..eb63b7c013 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -33,6 +33,10 @@ LIBGPGME_CONF_OPTS = \
 	--disable-cpp-test \
 	--enable-languages=$(subst $(space),$(comma),$(LIBGPGME_LANGUAGE_BINDINGS))
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+LIBGPGME_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 # Handle argp-standalone or it errors out during build
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 # musl libc does not define error_t in errno.h, but argp.h does.
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
