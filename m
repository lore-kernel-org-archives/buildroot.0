Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB5CF885D
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7066F50D;
	Thu, 20 Nov 2025 20:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndE5czqzFRyj; Thu, 20 Nov 2025 20:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B91336F4EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91336F4EC;
	Thu, 20 Nov 2025 20:35:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20581117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D4840579
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hebk1kOhXTfY for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43DB24024F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43DB24024F
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EF2185C55; Thu, 20 Nov 2025 20:35:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 21:34:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a7ae995c58ce3536eab54cde316b05cd1e083a
X-Git-Newrev: e09bf9e9511c28f5d35e3a5ae7a09f1aec57874d
X-Patchwork-Hint: ignore
Message-Id: <20251120203529.2EF2185C55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: add information on CycloneDX
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e09bf9e9511c28f5d35e3a5ae7a09f1aec57874d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds information on how to generate a CycloneDX SBOM in
Buildroot. It also mentions how to track CVEs with that given SBOM.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: reword slightly]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.adoc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 43caa3a9bc..7437a7c3c0 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -180,6 +180,34 @@ a newer upstream version for those packages.
 make pkg-stats
 ----
 
+=== Generating CycloneDX SBOM
+
+Based on the output of +show-info+ Buildroot can generate a SBOM in
+the CycloneDX format. While it doesn't offer any additional
+information, CycloneDX is a format specification that can be consumed
+by other projects.
+
+----
+make show-info | utils/generate-cyclonedx
+----
+
+For more information check the help of the +generate-cyclonedx+ script, the
+script call can be tailored to your project.
+
+----
+utils/generate-cyclonedx --help
+----
+
+Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
+analysis from the NVD database.
+
+----
+make show | utils/generate-cyclonedx > sbom.cdx.json
+cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
+----
+
+For more information about CycloneDX see https://cyclonedx.org/[].
+
 === Graphing the dependencies between packages
 
 [[graph-depends]]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
