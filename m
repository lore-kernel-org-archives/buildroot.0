Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0DAC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B7083BD0;
	Fri, 11 Jul 2025 10:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ww3qsm_O_OAV; Fri, 11 Jul 2025 10:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BC683B48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BC683B48;
	Fri, 11 Jul 2025 10:21:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F1C5199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CE040DC5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVAOadnKhx-u for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87FC940C18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87FC940C18
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 788CF86337; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:31:26 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e32b7876832b26142f414128f2b3d2a62a58bbee
X-Git-Newrev: 1fba91af016cefa3c55a426d87c40be2ada89303
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.788CF86337@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/modsecurity2:
 security bump to v2.9.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fba91af016cefa3c55a426d87c40be2ada89303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following security issues:

- CVE 2025-47947: Versions up to and including 2.9.8 are vulnerable to
  denial of service in one special case (in stable released versions):
  when the payload's content type is application/json, and there is at
  least one rule which does a sanitiseMatchedBytes action. A patch is
  available at pull request 3389 and expected to be part of version
  2.9.9. No known workarounds are available.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-47947
  - https://github.com/owasp-modsecurity/ModSecurity/pull/3389

- CVE-2025-48866: Versions prior to 2.9.10 contain a denial of service
  vulnerability similar to GHSA-859r-vvv8-rm8r/CVE-2025-47947. The
  `sanitiseArg` (and `sanitizeArg` - this is the same action but an
  alias) is vulnerable to adding an excessive number of arguments,
  thereby leading to denial of service. Version 2.9.10 fixes the issue.
  As a workaround, avoid using rules that contain the `sanitiseArg` (or
  `sanitizeArg`) action.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48866
  - https://github.com/owasp-modsecurity/ModSecurity/commit/3a54ccea62d3f7151bb08cb78d60c5e90b53ca2e

For more details on the version bump, see:
  - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.8
  - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.9
  - https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v2.9.10

Also this patch change the _SOURCE variable that now include a 'v'
prefixing the version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: update hash source url in hash file comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3d593a8144ad8890dae4ab6fd235eef700d3c144)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/modsecurity2/modsecurity2.hash | 4 ++--
 package/modsecurity2/modsecurity2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index fbb7fabb3a..186e13d766 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,5 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
-sha256  2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839  modsecurity-2.9.7.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v2.9.10/modsecurity-v2.9.10.tar.gz.sha256
+sha256  081cda52975494139922fa4b54f474fed8a6db4b7f586cb0d3aeec635f7a4d53  modsecurity-v2.9.10.tar.gz
 
 # Locally computed
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 36d6e1a847..b644fe7407 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.7
-MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
+MODSECURITY2_VERSION = 2.9.10
+MODSECURITY2_SOURCE = modsecurity-v$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
