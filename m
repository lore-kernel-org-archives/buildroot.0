Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA537C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D1C8175C;
	Mon, 22 Aug 2022 09:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D1C8175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbo7dqtI2EIE; Mon, 22 Aug 2022 09:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E6A88143E;
	Mon, 22 Aug 2022 09:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E6A88143E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10D371BF995
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC1AD4098C
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC1AD4098C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lt9gK9CE1mb2 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:55:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B91A40941
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B91A40941
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2152287A4B; Mon, 22 Aug 2022 09:40:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 11:54:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d752f73b0c0e4ba50738cd1e7f4472f61fce9089
X-Git-Newrev: fc429c4dc6d8f42596c0c6b40ebcce8c2a71877c
X-Patchwork-Hint: ignore
Message-Id: <20220822094038.2152287A4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python: clean conflicting
 pep517 packages before install
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc429c4dc6d8f42596c0c6b40ebcce8c2a71877c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python installer package isn't able to overwrite files of packges
that already exist, this causes problems when doing a rebuild or
update without a full clean.

To fix this we can use functionality from importlib to identify and
remove any conflicting python package files before installation.

We also need to use internals from python-installer, as we want to use
the same logic as pyinstaller uses internally for getting the scheme so
that we ensure we clean the correct package scheme (we want it to be the
same as the one we're installing)

Fixes:
Traceback (most recent call last):
  File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 69, in <module>
    main()
  File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 61, in main
    install(
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/_core.py", line 109, in install
    record = destination.write_file(
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 207, in write_file
    return self.write_to_fs(scheme, path_, stream, is_executable)
  File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 167, in write_to_fs
    raise FileExistsError(message)
FileExistsError: File already exists: /home/buildroot/buildroot/output/target/usr/lib/python3.10/site-packages/tinycss2/__init__.py

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
[yann.morin.1998@free.fr:
  - extend commit log about the use of the installer internals (the
    symbols prefixed with '_')
  - check path.files against explicitly None
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pyinstaller.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
index 6dd9242327..9e689eea2d 100644
--- a/support/scripts/pyinstaller.py
+++ b/support/scripts/pyinstaller.py
@@ -2,12 +2,34 @@
 
 import argparse
 import glob
+import pathlib
+
+from importlib.machinery import PathFinder
+from importlib.metadata import DistributionFinder
 
 from installer import install
+from installer._core import _process_WHEEL_file
 from installer.destinations import SchemeDictionaryDestination
 from installer.sources import WheelFile
 
 
+def clean(source, destination):
+    scheme = _process_WHEEL_file(source)
+    scheme_path = destination.scheme_dict[scheme]
+    context = DistributionFinder.Context(
+        name=source.distribution,
+        path=[scheme_path],
+    )
+    for path in PathFinder.find_distributions(context=context):
+        # path.files is either an iterable, or None
+        if path.files is None:
+            continue
+        for file in path.files:
+            file_path = pathlib.Path(file.locate())
+            if file_path.exists():
+                file_path.unlink()
+
+
 def main():
     """Entry point for CLI."""
     ap = argparse.ArgumentParser("python pyinstaller.py")
@@ -58,6 +80,7 @@ def main():
     )
 
     with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
+        clean(source, destination)
         install(
             source=source,
             destination=destination,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
