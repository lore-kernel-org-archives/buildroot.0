Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E21C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3515F83281;
	Thu,  6 Jan 2022 21:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wI49U2jIDY2; Thu,  6 Jan 2022 21:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1264831C1;
	Thu,  6 Jan 2022 21:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8361BF340
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6802C4018D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHseFkuq-OGV for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63819404BD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E65CE100005;
 Thu,  6 Jan 2022 21:00:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:51 +0100
Message-Id: <20220106210000.397694-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 03/11] support/download/post-process-helpers:
 add helper function for post process scripts
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

download post process scripts will often need to unpack the source
code tarball, do some operation, and then repack it. In order to help
with this, post-process-helpers provide an unpack() function and a
repack() function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/helpers | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/support/download/helpers b/support/download/helpers
index 40d5eea591..4c5eb466cc 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -72,5 +72,27 @@ mk_tar_gz() {
     popd >/dev/null
 }
 
+post_process_unpack() {
+    local dest="${1}"
+    local tarball="${2}"
+    local one_file
+
+    mkdir "${dest}"
+    tar -C "${dest}" --strip-components=1 -xf "${tarball}"
+    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
+    touch -r "${one_file}" "${dest}.timestamp"
+}
+
+post_process_repack() {
+    local in_dir="${1}"
+    local base_dir="${2}"
+    local out="${3}"
+    local date
+
+    date="@$(stat -c '%Y' "${in_dir}/${base_dir}.timestamp")"
+
+    mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
+}
+
 # Keep this line and the following as last lines in this file.
 # vim: ft=bash
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
