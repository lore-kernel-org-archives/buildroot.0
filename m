Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609CDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:16:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A32A60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A32A60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E6A838ED;
	Tue,  3 Aug 2021 21:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DrltJu75ZdgA; Tue,  3 Aug 2021 21:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440CD834BB;
	Tue,  3 Aug 2021 21:16:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE101BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A79C640275
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3oqNSQgCy-g for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16A5140291
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 60DC487BB7; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 18:22:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5aa3c5883aec704050c15c97adde920e58856bb
X-Git-Newrev: f3b07e2dedef5f02936f66c9d2d69f09bd2dd0ee
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.60DC487BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: add
 column reporting ignored CVEs
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f3b07e2dedef5f02936f66c9d2d69f09bd2dd0ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When doing analysis it is helpful to be able to view what CVE have
been patched / diagnosed to not apply to Buildroot. This exposes
that list to the reporting and prevents a step where you have to
dig into the .mk's of a pkg to check for sure what has been
ignored.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998@free.fr: only set background if there are ignored CVEs]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 76bc88b0ba..c7e30dfd2b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -735,6 +735,10 @@ td.cve-unknown {
  background: #ffd870;
 }
 
+td.cve_ignored {
+ background: #ccc;
+}
+
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -909,6 +913,15 @@ def dump_html_pkg(f, pkg):
         f.write("    N/A\n")
     f.write("  </td>\n")
 
+    # CVEs Ignored
+    td_class = ["centered"]
+    if pkg.ignored_cves:
+        td_class.append("cve_ignored")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    for ignored_cve in pkg.ignored_cves:
+        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (ignored_cve, ignored_cve))
+    f.write("  </td>\n")
+
     # CPE ID
     td_class = ["left"]
     if pkg.is_status_ok("cpe"):
@@ -948,6 +961,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CVEs Ignored</td>
 <td class=\"centered\">CPE ID</td>
 </tr>
 """)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
