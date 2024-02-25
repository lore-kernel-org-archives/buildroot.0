Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908DFC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 08:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4558F40722;
	Sun, 25 Feb 2024 08:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyMhQdEt4SGE; Sun, 25 Feb 2024 08:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F9240723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F9240723;
	Sun, 25 Feb 2024 08:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56D861BF232
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42CA440723
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xytD98Idl0t for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA3040717
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FA3040717
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5693887A59; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 08:41:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8982b02b6e875d39ffb78a3200b266650e3addc
X-Git-Newrev: 4350d485a441b31ebb1ccb5124f081fda9104132
X-Patchwork-Hint: ignore
Message-Id: <20240225080241.5693887A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: deflate64 needs libzlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=4350d485a441b31ebb1ccb5124f081fda9104132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

deflate64 unconditionally uses FAR since its addition with
https://github.com/OSGeo/gdal/commit/d6baebcc73ffc2ede6e9635846676b275b02bab3
resulting in the following build failure with zlib-ng since bump to
version 3.8.2 in commit d2e349301b79ad3a1840083714ee396f4302b68a:

In file included from /home/autobuild/autobuild/instance-2/output-1/build/gdal-3.8.2/frmts/zlib/contrib/infback9/infback9.c:6:
/home/autobuild/autobuild/instance-2/output-1/build/gdal-3.8.2/frmts/zlib/contrib/infback9/minified_zutil.h:46:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'uchf'
   46 | typedef uch FAR uchf;
      |                 ^~~~

Fixes: d2e349301b79ad3a1840083714ee396f4302b68a
 - http://autobuild.buildroot.org/results/8b55108dee4faa98c234d00a1a22b62ed948e8d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdal/gdal.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 3104332db9..247e13663c 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -124,6 +124,12 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBZLIB),y)
+GDAL_CONF_OPTS += -DENABLE_DEFLATE64=ON
+else
+GDAL_CONF_OPTS += -DENABLE_DEFLATE64=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 GDAL_DEPENDENCIES += postgresql
 GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
