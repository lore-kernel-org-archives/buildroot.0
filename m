Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F166CA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13D1A40204;
	Sat,  2 Sep 2023 07:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13D1A40204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kL8jV2yhs1hA; Sat,  2 Sep 2023 07:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570EC40297;
	Sat,  2 Sep 2023 07:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570EC40297
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7E21BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FDC441FD6
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FDC441FD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rxEWDHMcb7k for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:36:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B532F41E3E
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B532F41E3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9194783BC5; Sat,  2 Sep 2023 07:36:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:35:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbcc1bf533e721c7393315ca68e8faa3af9d3194
X-Git-Newrev: bf7926230c7d47dd809e59646a6ff4f7fe35b833
X-Patchwork-Hint: ignore
Message-Id: <20230902073601.9194783BC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: always use gpgrt-config
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf7926230c7d47dd809e59646a6ff4f7fe35b833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
