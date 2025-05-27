Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD29C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A326417A6;
	Wed,  4 Jun 2025 18:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WwrjhQ_EeqU; Wed,  4 Jun 2025 18:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3CC40E3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F3CC40E3C;
	Wed,  4 Jun 2025 18:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2610C1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3354140084
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBMZXqGMoH5p for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6012D4017C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6012D4017C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E72686517; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:28:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8b59257b822ffa77c394819d63edc3c52d0c6b7f
X-Git-Newrev: 36e25128937644488b0864b2386991a7e96dcf62
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.5E72686517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tinyxml: set
 TINYXML_CPE_ID_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=36e25128937644488b0864b2386991a7e96dcf62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

With the recent addition in pkg-stats to detect stale ignore CVE
entries, the CVE-2021-42260 ignore CVE entry is reported as
stale. This is because TINYXML_VERSION is 2.6.2_2, and the CVE is
annotated as affecting versions up to and including 2.6.2.

But in fact, 2.6.2_2 is a special version from the Kodi community, but
it's close to the 2.6.2 release, and CVE-2021-42260 is not fixed in
it. To get meaningful results, let's tell our CVE checking logic that
the tinyxml version is 2.6.2 by setting TINYXML_CPE_ID_VERSION (we're
splitting on the _ and keeping the part before).

Because we're now setting TINYXML_CPE_ID_VERSION, we must drop
TINYXML_CPE_ID_VALID to avoid a check-package warning.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 677b24ebaf154aaa0af59d34e91471b95d9a861b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tinyxml/tinyxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index 01c25f7c1c..c6150b13fe 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -12,7 +12,7 @@ TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
 TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
-TINYXML_CPE_ID_VALID = YES
+TINYXML_CPE_ID_VERSION = $(firstword $(subst _,$(space),$(TINYXML_VERSION)))
 
 # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
 TINYXML_IGNORE_CVES += CVE-2021-42260
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
