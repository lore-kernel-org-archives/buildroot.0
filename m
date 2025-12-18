Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBBDD6E2DC
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 20:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6BF41034;
	Thu, 18 Dec 2025 20:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9V3pkFIi1f8; Thu, 18 Dec 2025 20:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B56840626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766088400;
	bh=qtm9LVrTuBWmSBxlp7oWkka7cWaqyuXRJGQ4a3Qg8MA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=k5xfYkpWZKHXknK8BlLr8pOfxFJnH6XoxZiJzaZ7UsLbMNTi9aiX8O/4LFy1KVeZ8
	 5qcGghpVg8tfOLmEArItf1XaI0Cq2eNsLQghjLnsVz/GXZWydSPHWZHGSgk+RjWR15
	 7s//F9Ol/RWCN4x+sbue3TPg7MUhOw7aQdBwx96VLGczwqY4yXkLJVD+ev4fbO5u0R
	 BiCpkGI78SqPjG2PnV4WlcM3vVd22aautNmz0amhicAEX0XpRtwmuB8jHqyn5NSYc7
	 T2yG6Vxi+ff8CJYp2oujv+tN2R8kjl6uTuguB9FB2SdYf6tqS9ga0oDnpXdXXSfUDa
	 8+qxcR5i7qSAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B56840626;
	Thu, 18 Dec 2025 20:06:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 796EC2A2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B7E74007C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpZcS97ugkHN for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 20:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E06E940055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06E940055
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E06E940055
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:06:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.46]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1vNlg82x29-00UZU4; Thu, 18
 Dec 2025 21:06:33 +0100
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Dec 2025 21:06:28 +0100
Message-ID: <20251218200628.2615661-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:FO9/s4iimJiZ5Y2+Y/JXQjj/RscVSDJDJXnQtG4jkvnUsK/uCzM
 bq6jpNgV2FZZ9DtBtUdOdWgGZ5Hyp22skxWOS88Vut4n8LcGhwGioNNO/bwTfj0OoyyC0jU
 V4yxfm1wj77WlCKRru3/jMaNpg0LvJHNHbF5/Rn4JheEEkI1Q8uqs8PT0vfFcGRH+XFvtsD
 oI51MQgGZ7msN6UzO1suw==
UI-OutboundReport: notjunk:1;M01:P0:bGKmVQN1Im8=;ue1H8751ytXIHoi5hJnYvvC/YYt
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1766088393; x=1766693193; i=ps.report@gmx.net;
 bh=aozgGinf2+KaaWB27lYs+RFX3RAl0CMMHrg5cPQ097c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IJbPoDySTl4b8LDgPmjgC/DUiUQT/pjtdS7qyv4IpW9vzLxlv7CF/wQ+v4PvAr50
 8RWcpvco3DHSeqxCXujcdq7pn+zxZ5WIhiNDUd3Juf4oYBDXhE+PMSMigRNe/AWgJ
 vMJy+MVf6s6X8VTbmYpFme29DqSN0ofw3WmFSTOdzfDwFNHxXudwFVOwLROzFjZbc
 Sj8R60MWXnv4/GO+a+Pnez7KA9BQZFQQSVzFA7PTWPePMSr8w4h40sGFOVDUNaGKr
 1lO2pGNn/ATIqZrbnoWquWhOv3hiK9KhPZPQ2gKdsZx7ir0ygWr68t04eIKrdQ8JA
 FFeyk8OHRBkx+W+xog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=IJbPoDyS
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: use BR2_VERSION_FULL
 instead of raw commit hash
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- use BR2_VERSION_FULL instead of raw commit hash

Fixes:

  $ wget https://buildroot.org/downloads/buildroot-2025.11.tar.xz
  $ tar -xvJf buildroot-2025.11.tar.xz
  $ make raspberrypi4_64_defconfig
  $ make pkg-stats
  fatal: not a git repository (or any parent up to mount point /)
  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
  Traceback (most recent call last):
    File ".../buildroot-2025.11/support/scripts/pkg-stats", line 1387, in <module>
      __main__()
      ~~~~~~~~^^
    File ".../buildroot-2025.11/support/scripts/pkg-stats", line 1339, in __main__
      commit = subprocess.check_output(['git', '-C', brpath,
               ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
                                        'rev-parse',
                                        ^^^^^^^^^^^^
                                        'HEAD']).splitlines()[0].decode()
                                        ^^^^^^^^
    File "/usr/lib64/python3.13/subprocess.py", line 472, in check_output
      return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
             ~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                 **kwargs).stdout
                 ^^^^^^^^^
    File "/usr/lib64/python3.13/subprocess.py", line 577, in run
      raise CalledProcessError(retcode, process.args,
                               output=stdout, stderr=stderr)
  subprocess.CalledProcessError: Command '['git', '-C', '.../buildroot-2025.11', 'rev-parse', 'HEAD']' returned non-zero exit status 128.
  make: *** [Makefile:935: pkg-stats] Error 1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 support/scripts/pkg-stats | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7d9170e30f..27a44cde57 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1233,21 +1233,21 @@ def dump_html_stats(f, stats):
     f.write('</div>\n')
 
 
-def dump_html_gen_info(f, date, commit):
-    # Updated on Mon Feb 19 08:12:08 CET 2018, Git commit aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
-    f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), commit))
+def dump_html_gen_info(f, date, br_version_full):
+    # Updated on Mon Feb 19 08:12:08 CET 2018, 2025.11-322-g1bb2eecc3e
+    f.write("<p><i>Updated on %s, %s</i></p>\n" % (str(date), br_version_full))
 
 
-def dump_html(packages, stats, date, commit, output):
+def dump_html(packages, stats, date, br_version_full, output):
     with open(output, 'w') as f:
         f.write(html_header)
         dump_html_all_pkgs(f, packages)
         dump_html_stats(f, stats)
-        dump_html_gen_info(f, date, commit)
+        dump_html_gen_info(f, date, br_version_full)
         f.write(html_footer)
 
 
-def dump_json(packages, defconfigs, stats, date, commit, output):
+def dump_json(packages, defconfigs, stats, date, br_version_full, output):
     # Format packages as a dictionary instead of a list
     # Exclude local field that does not contains real date
     excluded_fields = ['url_worker', 'name', 'tree_path']
@@ -1271,12 +1271,12 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
         if not k.startswith('infra-')
     }
     statistics['infra'] = {k[6:]: v for k, v in stats.items() if k.startswith('infra-')}
-    # The actual structure to dump, add commit and date to it
+    # The actual structure to dump, add br_version_full and date to it
     final = {'packages': pkgs,
              'stats': statistics,
              'defconfigs': defconfigs,
              'package_status_checks': Package.status_checks,
-             'commit': commit,
+             'br_version_full': br_version_full,
              'date': str(date)}
 
     with open(output, 'w') as f:
@@ -1336,9 +1336,7 @@ def __main__():
     else:
         package_list = None
     date = datetime.datetime.now(datetime.timezone.utc)
-    commit = subprocess.check_output(['git', '-C', brpath,
-                                      'rev-parse',
-                                      'HEAD']).splitlines()[0].decode()
+    br_version_full = os.getenv('BR2_VERSION_FULL', 'unknown')
     print("Build package list ...")
     all_trees = get_trees()
     packages = get_pkglist(all_trees, args.npackages, package_list)
@@ -1378,10 +1376,10 @@ def __main__():
     stats = calculate_stats(packages)
     if args.html:
         print("Write HTML")
-        dump_html(packages, stats, date, commit, args.html)
+        dump_html(packages, stats, date, br_version_full, args.html)
     if args.json:
         print("Write JSON")
-        dump_json(packages, defconfigs, stats, date, commit, args.json)
+        dump_json(packages, defconfigs, stats, date, br_version_full, args.json)
 
 
 __main__()
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
