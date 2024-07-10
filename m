Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3B5C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9914F60673;
	Wed, 10 Jul 2024 21:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjLuWete5aUq; Wed, 10 Jul 2024 21:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9CDC60876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9CDC60876;
	Wed, 10 Jul 2024 21:04:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 086031BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9125402C3
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSNaQutxhGQg for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C439C40267
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C439C40267
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:03:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25F5B84688; Wed, 10 Jul 2024 21:03:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 22:40:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b9d62dac564b6d1bfa5ba5e0dd72e731fd95d55
X-Git-Newrev: 8436a5141bca7ec24fc1f85fbce1f6c56faaca7a
X-Patchwork-Hint: ignore
Message-Id: <20240710210359.25F5B84688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/update-rust: use urllib.request from
 stdlib instead of requests
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

commit: https://git.buildroot.net/buildroot/commit/?id=8436a5141bca7ec24fc1f85fbce1f6c56faaca7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can use urllib.request without adding any addition lines of code
compared with requests which is not part of the stdlib.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/update-rust | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/utils/update-rust b/utils/update-rust
index 6799324fac..407ef69847 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -2,8 +2,8 @@
 
 import argparse
 import pathlib
-import requests
 import sys
+import urllib.request
 
 # When updating this list, also update:
 # - package/rustc/Config.in.host:
@@ -87,12 +87,12 @@ def gen_hash_file_src(hash_file, new_version):
         f_name = f"rustc-{new_version}-src.tar.xz"
         print(f"\r\033[KUpdating {f_name}", end="")
         h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
-        r = requests.get(h_url)
-        if r.status_code != 200:
-            raise RuntimeError(f"No hash for {f_name}. Has source been removed?")
-        # rstrip() content, and explicitly add the \n, in case
-        # a hash file does not have a trailing \n.
-        fd.write(f"# From {h_url}\nsha256  {r.content.decode().rstrip()}\n")
+        with urllib.request.urlopen(h_url) as r:
+            if r.status != 200:
+                raise RuntimeError(f"No hash for {f_name}. Has source been removed?")
+            # rstrip() content, and explicitly add the \n, in case
+            # a hash file does not have a trailing \n.
+            fd.write(f"# From {h_url}\nsha256  {r.read().decode().rstrip()}\n")
         fd.write("# Locally generated\n")
         for license in LICENSES:
             fd.write(f"sha256  {LICENSES[license]}  LICENSE-{license}\n")
@@ -105,22 +105,22 @@ def gen_hash_file_bin(hash_file, new_version):
             f_name = f"rust-{new_version}-{host}.tar.xz"
             print(f"\r\033[KUpdating {f_name}", end="")
             h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
-            r = requests.get(h_url)
-            if r.status_code != 200:
-                raise RuntimeError(f"No hash for {f_name}. Has host {host} been removed?")
-            # rstrip() content, and explicitly add the \n, in case
-            # a hash file does not have a trailing \n.
-            fd.write(f"# From {h_url}\nsha256  {r.content.decode().rstrip()}\n")
+            with urllib.request.urlopen(h_url) as r:
+                if r.status != 200:
+                    raise RuntimeError(f"No hash for {f_name}. Has host {host} been removed?")
+                # rstrip() content, and explicitly add the \n, in case
+                # a hash file does not have a trailing \n.
+                fd.write(f"# From {h_url}\nsha256  {r.read().decode().rstrip()}\n")
         for target in RUST_TARGETS:
             f_name = f"rust-std-{new_version}-{target}.tar.xz"
             print(f"\r\033[KUpdating {f_name}", end="")
             h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
-            r = requests.get(h_url)
-            if r.status_code != 200:
-                raise RuntimeError(f"No hash for {f_name}. Has target {target} been removed?")
-            # rstrip() content, and explicitly add the \n, in case
-            # a hash file does not have a trailing \n.
-            fd.write(f"# From {h_url}\nsha256  {r.content.decode().rstrip()}\n")
+            with urllib.request.urlopen(h_url) as r:
+                if r.status != 200:
+                    raise RuntimeError(f"No hash for {f_name}. Has target {target} been removed?")
+                # rstrip() content, and explicitly add the \n, in case
+                # a hash file does not have a trailing \n.
+                fd.write(f"# From {h_url}\nsha256  {r.read().decode().rstrip()}\n")
         fd.write("# Locally generated\n")
         for license in LICENSES:
             fd.write(f"sha256  {LICENSES[license]}  LICENSE-{license}\n")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
