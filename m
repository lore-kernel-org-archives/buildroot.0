Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1349EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7FB846F1;
	Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w9rXin9NHd7; Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B05846F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011452;
	bh=lMa3Kchla53oLUeulWknSLUJZPLKYawjyxFIIUO+VeU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FMwzG87jpci/bM0S6JPqGBpfSFurryMz3o7JvDzKyjv0BZqcbs3WO/Vrq0hkcKD4B
	 d68kKTy8iIGd+nWKEpZZY8TQCv8vK+RfFu98kGkjMHHQhhPWWZaSD1MOZq9KA9SwM9
	 +vsdhXIfk56wXEr9HvEUILeJoCtBM6YzgN/MHhDby7X+JEMumyutz3ktpWLRSF4wHw
	 vWuYTjr9OPcuLPhED5LpOhCzXdRsfxIpN+SiYv8xp0W0yKOqbkROhHGX0CNmlYBKA6
	 Cv2988bIRThWeyTJs8gMh/JRG5beVYLftzbarWfNTYFJJ7UZboRYBVfmPRs5bSLi3l
	 K9/gx2kOFrLBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B05846F8;
	Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9489EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA64041EB1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSj6n8yMKxCg for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1648A41E4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1648A41E4B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F04A086D69; Fri, 13 Feb 2026 19:37:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:10:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: cc61e70be436762b3ad8322d5f0090743550910c
X-Git-Newrev: 33269a8a6532f166e193d4cff0e036da7fab638d
X-Patchwork-Hint: ignore
Message-Id: <20260213193700.F04A086D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] utils/generate-cyclonedx:
 use direct dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33269a8a6532f166e193d4cff0e036da7fab638d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Since the introduction of the `generate-cyclonedx` script in [1] the
dependencies were 'recursive'. This means that the dependencies of a
package dependency were included.

The CycloneDX spec [2] states that only direct dependencies needs to be
included.

This patch drop the recursive dependencies.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
[2] https://cyclonedx.org/docs/1.6/json/#dependencies

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc4af8bfa979beb147cdbd7523b5ade26095a0d5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e864edf181..04ce8fc3a1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -337,10 +337,9 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
-    """Parse dependencies from the show-info output. This function will
-    recursively collect all dependencies, and return a list where each dependency
-    is stated at most once.
+def br2_parse_deps(ref, show_info_dict, virtual=False):
+    """This function will collect all dependencies from the show-info output.
+
     The dependency on virtual package will collect the final dependency without
     including the virtual one.
 
@@ -350,18 +349,14 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
         show_info_dict (dict): The JSON output of the show-info
             command, parsed into a Python dictionary.
 
-    Kwargs:
-        deps (list): A list, to which dependencies will be appended. If set to None,
-            a new empty list will be created. Defaults to None.
-
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
+    deps = []
+
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if dep not in deps:
-            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-                deps.append(dep)
-            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
+            deps.append(dep)
 
     return deps
 
@@ -429,7 +424,7 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
