Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12394CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7159846FB;
	Fri, 15 May 2026 17:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTD2DUwdJcUf; Fri, 15 May 2026 17:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E27D7846EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867231;
	bh=EZkELTaZewd9tmdCaJE+jKIaknOOV5yci1wy5WcW5Gw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bb5wlbjtJnH/jadmrUowzrPffajTsEgQJh2v/qUIRMKTknx22yfpex5xknv5QGBgN
	 mGb+EW3uKGG4jVEf1s+7O4BaZn8aYEAe8GwqduffHRptW6o5Zjrl65W1GlBzvOl1KO
	 eOTRCT8UTNn2krlqzM4TjblFo9CCMWIlWntMLoKHmUKYUxT82ldNGcrjnaeo8L9s+Z
	 2DmTds3IZT5jy8/nKNJF5iZmAkQpLaj+SH87jSefceVFSvE7Q4Z0e3V4CGQ4jsY/Hg
	 RoVCimZRvhxNz5lKz9I+ONQSzi308em7L18rSdmsj+RBxCHPq5dZzb7+rc0gyLsws9
	 f7tUtEMl1wTww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27D7846EF;
	Fri, 15 May 2026 17:47:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1764923F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D36DC41DA8
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7alJ0AA_53Ob for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D805D41D9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D805D41D9E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 220AA863DB; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:22:14 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6ea66ebd69fa5fa2d06562d24b3ea06bfcb877b5
X-Git-Newrev: 34204529e0b19971991c458ce997ce180fe46aba
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.220AA863DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/pkg-stats: fix host/target infra filter
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34204529e0b19971991c458ce997ce180fe46aba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The filter is supposed to exclude host/target infra from output if the
respective package is not built with the current
configuration.

However, excluding host packages did not work correctly: If keep_host
is False because the host package is not built, the next branch was
checked and included the host infra in output with "target" type if
the target package is built. For a package that support host and
target build, but gets built only for the target, this leads to output
like (Meson example):

meson (target)
host-meson (target)

Skip host infra in the target branch instead. Also include
Package.infra in Package.__str__() result, which was needed for
debugging this bug.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e8dcebf4597d74dc12c86535118ae0bd16d272a0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a87bb23a8e..bbd1e3e6f0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -205,7 +205,7 @@ class Package:
                 infra = match.group(1)
                 if infra.startswith("host-") and keep_host:
                     self.infras.append(("host", infra[5:]))
-                elif keep_target:
+                elif not infra.startswith("host-") and keep_target:
                     self.infras.append(("target", infra))
 
     def set_license(self):
@@ -342,9 +342,10 @@ class Package:
         return self.path < other.path
 
     def __str__(self):
-        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
+        return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d, infras=%r)" % \
             (self.name, self.path, self.is_status_ok('license'),
-             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
+             self.is_status_ok('license-files'), self.status['hash'], self.patch_count,
+             self.infras)
 
 
 def get_pkglist(trees, npackages, package_list):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
