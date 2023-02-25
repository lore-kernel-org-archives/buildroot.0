Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5313EC7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0173340914;
	Sat, 25 Feb 2023 09:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0173340914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f_EywsER7X4; Sat, 25 Feb 2023 09:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A64A40B15;
	Sat, 25 Feb 2023 09:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A64A40B15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 061A01BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C220F81E70
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C220F81E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTyUDeGyXnAc for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA6F81E71
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA6F81E71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF1B486922; Sat, 25 Feb 2023 09:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:39:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02b6af266340638d154257bf2634ccc13d47ec69
X-Git-Newrev: 5215f56e5bed387575b35de65b78d815b96ba6f3
X-Patchwork-Hint: ignore
Message-Id: <20230225093924.EF1B486922@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: add host-pkgconf
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=5215f56e5bed387575b35de65b78d815b96ba6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-pkgconf is mandatory to find lz4 and zstd resulting in the
following build failure since commit
9cd2e6e090449f9d2f371d24152580c038892f3d:

configure: error: in `/home/autobuild/autobuild/instance-5/output-1/build/postgresql-15.2':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables LZ4_CFLAGS
and LZ4_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

Fixes:
 - http://autobuild.buildroot.org/results/8744277ebe9910635ef8fe290c8ba4eee420b538

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 5e3601cb46..a2aed9a2eb 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -92,14 +92,14 @@ POSTGRESQL_CONF_OPTS += --without-libxml
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
-POSTGRESQL_DEPENDENCIES += zstd
+POSTGRESQL_DEPENDENCIES += host-pkgconf zstd
 POSTGRESQL_CONF_OPTS += --with-zstd
 else
 POSTGRESQL_CONF_OPTS += --without-zstd
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
-POSTGRESQL_DEPENDENCIES += lz4
+POSTGRESQL_DEPENDENCIES += host-pkgconf lz4
 POSTGRESQL_CONF_OPTS += --with-lz4
 else
 POSTGRESQL_CONF_OPTS += --without-lz4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
