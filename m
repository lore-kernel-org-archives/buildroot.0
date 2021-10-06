Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3962EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:31:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D7F61074
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04D7F61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD3D583F8E;
	Wed,  6 Oct 2021 19:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C94pinpWxBRQ; Wed,  6 Oct 2021 19:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AA1D83F35;
	Wed,  6 Oct 2021 19:31:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F73B1BF9B6
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E69A40803
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kac8Dt-pDrsj for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8D740111
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D69C493467; Wed,  6 Oct 2021 19:28:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ae5ca9b67f321552f6428de14105192cebd7e8f
X-Git-Newrev: 324612d68e09d0db44c51c451bc6b87466f7f874
X-Patchwork-Hint: ignore
Message-Id: <20211006192813.D69C493467@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/kconfig: fix compiler warnings
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
Content-Type: multipart/mixed; boundary="===============7144983427720103193=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7144983427720103193==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=324612d68e09d0db44c51c451bc6b87466f7f874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compiling on Ubuntu 20.04 generates this:

./util.c: In function ‘file_write_dep’
./util.c:54:18: warning: ‘..config.tmp’ directive writing 12 bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
   54 |  sprintf(buf, "%s..config.tmp", dir);
      |                  ^~~~~~~~~~~~
./util.c:54:2: note: ‘sprintf’ output between 13 and 4109 bytes into a destination of size 4097
   54 |  sprintf(buf, "%s..config.tmp", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

and similar warnings on confdata.c, lines 778, 989, 995, 1000, 1007,
1040, 1046 and 1054. Avoid the warnings by enlarging the destination
buffer of fprintf().

Normally, we want changes to kconfig to be reflected by patches in
support/kconfig/patches. This makes it easier to resync with upstream
kconfig. However, in this case, everything that is changed here is
already changed completely (and differently) upstream, so there is no
added value in keeping the patch.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/kconfig/confdata.c | 4 ++--
 support/kconfig/util.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 892da74fdc..9ab980edd8 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -744,7 +744,7 @@ int conf_write(const char *name)
 	struct menu *menu;
 	const char *basename;
 	const char *str;
-	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
+	char dirname[PATH_MAX+1], tmpname[PATH_MAX+20], newname[PATH_MAX+1];
 	char *env;
 
 	if (!name)
@@ -974,7 +974,7 @@ int conf_write_autoconf(void)
 	const char *name;
 	FILE *out, *tristate, *out_h;
 	int i;
-	char dir[PATH_MAX+1], buf[PATH_MAX+1];
+	char dir[PATH_MAX+1], buf[PATH_MAX+20];
 	char *s;
 
 	strcpy(dir, conf_get_configname());
diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index 18a8e52391..8665f5bb89 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -35,7 +35,7 @@ struct file *file_lookup(const char *name)
 int file_write_dep(const char *name)
 {
 	char *str;
-	char buf[PATH_MAX+1], buf2[PATH_MAX+1], dir[PATH_MAX+1];
+	char buf[PATH_MAX+20], buf2[PATH_MAX+1], dir[PATH_MAX+1];
 	struct symbol *sym, *env_sym;
 	struct expr *e;
 	struct file *file;

--===============7144983427720103193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7144983427720103193==--
