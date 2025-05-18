Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4055CC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2493711D4;
	Mon, 19 May 2025 11:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3Pewg4SXLQ7; Mon, 19 May 2025 11:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA916711D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA916711D9;
	Mon, 19 May 2025 11:05:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E84ED4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71897414EF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp6GKqCuS9PB for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B36423AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B36423AB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3E6082A2E; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b93b80245d9aa8853d6590ca1d2bbd02b1550a54
X-Git-Newrev: 14aa0f5ec143eeb8a96160b5538945eedd801da1
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.D3E6082A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sox: add fix for
 CVE-2021-23159, CVE-2021-23172, CVE-2023-34318
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

commit: https://git.buildroot.net/buildroot/commit/?id=14aa0f5ec143eeb8a96160b5538945eedd801da1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fix is integrated in Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the sox_project:sox
vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sox/0007-hcom-validate-dictsize.patch | 38 +++++++++++++++++++++++++++
 package/sox/sox.mk                            |  5 ++++
 2 files changed, 43 insertions(+)

diff --git a/package/sox/0007-hcom-validate-dictsize.patch b/package/sox/0007-hcom-validate-dictsize.patch
new file mode 100644
index 0000000000..722b64675b
--- /dev/null
+++ b/package/sox/0007-hcom-validate-dictsize.patch
@@ -0,0 +1,38 @@
+From 54455f59305d9ce94cc73100bc2dd542865fed4b Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:33:16 +0200
+Subject: [PATCH] hcom: validate dictsize
+
+Bug: https://sourceforge.net/p/sox/bugs/350/
+Bug: https://sourceforge.net/p/sox/bugs/352/
+Bug-Debian: https://bugs.debian.org/1021133
+Bug-Debian: https://bugs.debian.org/1021134
+
+This patch fixes both CVE-2021-23159 and CVE-2021-23172.
+
+Upstream: https://sourceforge.net/p/sox/bugs/350/
+Upstream: https://sourceforge.net/p/sox/bugs/352/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/hcom.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/hcom.c b/src/hcom.c
+index 594c8706..9e8b03c6 100644
+--- a/src/hcom.c
++++ b/src/hcom.c
+@@ -141,6 +141,11 @@ static int startread(sox_format_t * ft)
+                 return (SOX_EOF);
+         }
+         lsx_readw(ft, &dictsize);
++        if (dictsize == 0 || dictsize > 511)
++        {
++                lsx_fail_errno(ft, SOX_EHDR, "Implausible dictionary size in HCOM header");
++                return SOX_EOF;
++        }
+ 
+         /* Translate to sox parameters */
+         ft->encoding.encoding = SOX_ENCODING_HCOM;
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index eba166f68b..6ce9ed3508 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -64,6 +64,11 @@ SOX_IGNORE_CVES += CVE-2019-13590
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
 
+# 0007-hcom-validate-dictsize.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
