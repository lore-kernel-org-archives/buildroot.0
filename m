Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85B9ECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 21:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AABE60E0A;
	Sat, 27 Aug 2022 21:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AABE60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMtU9vXL2wM1; Sat, 27 Aug 2022 21:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7749B60BBD;
	Sat, 27 Aug 2022 21:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7749B60BBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 760401BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F86E409F3
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F86E409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6TQoQbrM6gT for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 21:02:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 204D7409F2
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 21:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204D7409F2
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B09A587E43; Sat, 27 Aug 2022 20:47:58 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 23:02:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f903c9ba8f4f68df530b3de43247865f59d1b77
X-Git-Newrev: 6c7061f3a855d789a225a78ec0c96882463c8c17
X-Patchwork-Hint: ignore
Message-Id: <20220827204758.B09A587E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: fix
 flake8 errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c7061f3a855d789a225a78ec0c96882463c8c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes flake8 errors:
support/scripts/pkg-stats:1013:133: E501 line too long (164 > 132 characters)
support/scripts/pkg-stats:1018:36: F541 f-string is missing placeholders
support/scripts/pkg-stats:1110:199: E261 at least two spaces before inline comment

For the first and the last one, we chose to split the long lines rather
than adding noqa: 501. Indeed, the long lines make it very unreadable,
and there are relatively natural places where the line can be broken.
Also split a line just below the second one in a similar way.

The f-string on 1018 doesn't need to be an f-string.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/pkg-stats | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index aa3b49c809..3248e3678d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1010,12 +1010,13 @@ def dump_html_pkg(f, pkg):
         if pkg.latest_version['version'] is None:
             latest_version_text = "<b>Found, but no version</b>"
         else:
-            latest_version_text = f"""<a href="https://release-monitoring.org/project/{pkg.latest_version['id']}"><b>{str(pkg.latest_version['version'])}</b></a>"""
+            latest_version_text = f"""<a href="https://release-monitoring.org/project/{pkg.latest_version['id']}">""" \
+                                  f"""<b>{str(pkg.latest_version['version'])}</b></a>"""
 
         latest_version_text += "<br/>"
 
         if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
-            latest_version_text += f'found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a>'
+            latest_version_text += 'found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a>'
         else:
             latest_version_text += "found by guess"
 
@@ -1107,9 +1108,11 @@ def dump_html_pkg(f, pkg):
     if not pkg.is_status_ok("cpe"):
         if pkg.is_actual_package and pkg.current_version:
             if pkg.cpeid:
-                f.write(f"""  <br/>{pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={":".join(pkg.cpeid.split(":")[0:5])}">(Search)</a>\n""") # noqa: E501
+                f.write(f"""  <br/>{pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?"""
+                        f"""namingFormat=2.3&keyword={":".join(pkg.cpeid.split(":")[0:5])}">(Search)</a>\n""")
             else:
-                f.write(f"""  {pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={pkg.name}">(Search)</a>\n""")  # noqa: E501
+                f.write(f"""  {pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?"""
+                        f"""namingFormat=2.3&keyword={pkg.name}">(Search)</a>\n""")
         else:
             f.write("  %s\n" % pkg.status['cpe'][1])
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
