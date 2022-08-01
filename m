Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D871CC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 16:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7897D409EA;
	Mon,  1 Aug 2022 16:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7897D409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1elbxciEi9X7; Mon,  1 Aug 2022 16:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FF1409EB;
	Mon,  1 Aug 2022 16:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FF1409EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F34631BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCD0404F3
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCD0404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlBfQrAqxG3z for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C334018B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 16:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C334018B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0532B8388E; Mon,  1 Aug 2022 16:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 18:47:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a592f0b2a400825a95e19113ce996bbc5c431d7
X-Git-Newrev: d45b5377c12367941a2cd7502ec773e99bb52f52
X-Patchwork-Hint: ignore
Message-Id: <20220801163619.0532B8388E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: make cells with
 many CVEs collapsible
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

commit: https://git.buildroot.net/buildroot/commit/?id=d45b5377c12367941a2cd7502ec773e99bb52f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes a package can have a lot of CVEs.
Rather than have the CVE cell make a really tall row
(that means you have to scroll a bunch) this collapses the CVE
cell to a fixed size scrollable element with a
sticky button that lets you expand and collapse it.

If Javascript is enabled:

A stylesheet is generated and appended before content rendering,
amending the cells style to have a fixed height and overflow.

Also, the expand/contract button is unhidden.

This means the CVE cells are rendered in a collapsed state
instead of being rendered in an expanded state and then
slamming shut.

This avoids a "flash" and *helps* (vertically at least) manage CLS
(cumulative layout shift).

see: https://web.dev/cls/

If Javascript is disabled:

The cells stay fully open and the expand/contract button stays hidden.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d795131cef..8ce4e3f260 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -747,6 +747,14 @@ html_header = """
 const triangleUp = String.fromCodePoint(32, 9652);
 const triangleDown = String.fromCodePoint(32, 9662);
 var lastColumnName = false;
+const styleElement = document.createElement('style');
+document.head.insertAdjacentElement("afterend", styleElement);
+const styleSheet = styleElement.sheet;
+const collapseRule = ".collapse{ height: 200px; overflow: hidden scroll;}"
+const buttonRule = ".see-more{ display: block;}"
+
+styleSheet.insertRule(collapseRule);
+styleSheet.insertRule(buttonRule);
 
 function sortGrid(sortLabel){
 	let i = 0;
@@ -759,7 +767,6 @@ function sortGrid(sortLabel){
 		lastStyle.disable = true;
 		lastStyle.remove();
 	};
-	const styleElement = document.createElement('style');
 	styleElement.id = "sort-css";
 	document.head.appendChild(styleElement);
 	const styleSheet = styleElement.sheet;
@@ -809,16 +816,37 @@ function sortGrid(sortLabel){
 		let rule = "." + listing[0] + " { grid-row: " + i + "; }";
 		styleSheet.insertRule(rule);
         });
+	styleSheet.insertRule(collapseRule);
+	styleSheet.insertRule(buttonRule);
+};
+
+function expandField(fieldId){
+        const field = document.getElementById(fieldId);
+        const fieldText = field.firstElementChild.innerText;
+        const fieldTotal = fieldText.split(' ')[2];
+
+        if (fieldText == "see all " + fieldTotal + triangleDown){
+		field.firstElementChild.innerText = "see less " + fieldTotal + triangleUp;
+                field.style.height = "auto";
+        } else {
+                field.firstElementChild.innerText = "see all " + fieldTotal + triangleDown;
+                field.style.height = "200px";
+        }
 };
 </script>
 
 <style>
 
-.label {
+.see-more{
+  display: none;
+}
+
+.label, .see-more {
   position: sticky;
   top: 1px;
 }
 .label{
+  z-index: 1;
   background: white;
   padding: 10px 2px 10px 2px;
 }
@@ -1029,6 +1057,8 @@ def dump_html_pkg(f, pkg):
     data_field_id = f'cves__{pkg_css_class}'
     div_class = ["centered cves data"]
     div_class.append(f'_{pkg_css_class}')
+    if len(pkg.cves) > 10:
+        div_class.append("collapse")
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
@@ -1038,6 +1068,10 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("cve-unknown")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
+    if len(pkg.cves) > 10:
+        cve_total = len(pkg.cves) + 1
+        f.write(f' <div onclick=\"expandField(\'{data_field_id}\')\" \
+        class=\"see-more centered cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
             f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
