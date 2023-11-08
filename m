Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC53C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F215381F57;
	Wed,  8 Nov 2023 21:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F215381F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjUCqZq2c6iR; Wed,  8 Nov 2023 21:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E7B081F0F;
	Wed,  8 Nov 2023 21:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E7B081F0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35E521BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19F644027F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19F644027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lx7thzv7r9fj for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B1B640140
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B1B640140
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 345DF86D73; Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 22:14:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1aa198f7285775ad09afa0777d54d831bdce61c0
X-Git-Newrev: c3c5320ce28b059ff7913a6468b2133b6cf8f16e
X-Patchwork-Hint: ignore
Message-Id: <20231108213823.345DF86D73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: check all files
 for warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3c5320ce28b059ff7913a6468b2133b6cf8f16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of only checking .mk and Config.in{,.host}, check
all files in a package directory.
.checkpackageignore isn't considered here, therefore the shown number
includes ignored warnings as well.
Add another css class to signal some warning, compared to a lot (>5),
similar to patches.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eca638f396..9349a0df57 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -272,8 +272,7 @@ class Package:
         self.status['pkg-check'] = ("error", "Missing")
         for root, dirs, files in os.walk(pkgdir):
             for f in files:
-                if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
-                    cmd.append(os.path.join(root, f))
+                cmd.append(os.path.join(root, f))
         o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
         lines = o.splitlines()
         for line in lines:
@@ -876,7 +875,7 @@ function expandField(fieldId){
  .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
    background: #ff9a69;
  }
- .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
+ .somepatches, .somewarnings, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
    background: #ffd870;
  }
  .cve_ignored, .version-error {
@@ -1033,6 +1032,8 @@ def dump_html_pkg(f, pkg):
     div_class.append(f'_{pkg_css_class}')
     if pkg.warnings == 0:
         div_class.append("correct")
+    elif pkg.warnings < 5:
+        div_class.append("somewarnings")
     else:
         div_class.append("wrong")
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{pkg.warnings}</div>\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
