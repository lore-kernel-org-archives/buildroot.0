Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48143CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B7B610BE;
	Fri, 12 Jun 2026 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lp_DtJi9Nql; Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E22A6108C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263453;
	bh=FZba05ODvMugv+T+DlfeAZrbJpbqJUnjnvUjg6iGBVg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I4bJ11O9+4eEbHpohogC565yFceBL+85Vh8K478hF++4N+5xPw02HxW7aJh1ULQAq
	 JMwWT6Xv3pTmLdfdSPx4AQYUMthnz0TqwrT/gk9EHJs2WRVJsTXLXhJXSmyIRMNcfw
	 Cl4AGM5QvUMJUZJKMToBcb16/zCs5ss7W3GgBTMhNiypeMMUo5CzKc3C/yurhjeM9g
	 W+ichMwti/brr98lF2wDkVk2uSUbhFuhElFSU2xkgLf7OOeCfNWJO2xbsnlu16V4P0
	 dE9ETiD5p7HW8wS6Kaf6pbMc4AT5t5eh8gY0mJkZ0MiKk+/bkBRsHAqW0+aEaneomR
	 E+Ww5PKGx7H3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E22A6108C;
	Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47803321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44FCA41144
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09c-jIurKMs7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8276341111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8276341111
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C75A880E9; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:09:59 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cf5072ec131c937f22184f27329cb1dabc040804
X-Git-Newrev: 366039c7965cbece9d3bf15e6b90fa84fb38c87f
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.3C75A880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
 fix hash_file location
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/366039c7965cbece9d3bf15e6b90fa84fb38c87f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The 'show-info' output always the location relative to the Buildroot
root directory.
When running 'generate-cyclonedx' outside of the Buildroot root
directory the hash file locations are not correct. Only using the
'hash_file' variable coming from 'show-info' doesn't guarantee the
script to succeed.

Use the 'brpath' variable to correctly reference the absolute path.

Fixes: 1791b79422 utils/generate-cyclonedx: add hashes from .hash files to externalReferences
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 2df4f1d573685234cc59361cde6c624885056c79)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 11edc05d80..bade018cd4 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -302,7 +302,7 @@ def cyclonedx_source_hashes(comp, source):
 
     hashes = []
     for hash_file in comp.get("hashes", []):
-        with Path(hash_file).open() as f:
+        with (brpath / hash_file).open() as f:
             for line in f:
                 line = line.strip()
                 if not line.startswith("#") and line.endswith(f" {source}"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
