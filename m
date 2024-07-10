Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8441C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D69C60850;
	Wed, 10 Jul 2024 21:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CzKmEIFWUbA; Wed, 10 Jul 2024 21:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACECE6066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACECE6066B;
	Wed, 10 Jul 2024 21:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3C41BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C6356066B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0eu2fRUDKhH for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CCD16066A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CCD16066A
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:03:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3910A846F3; Wed, 10 Jul 2024 21:03:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:03:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8436a5141bca7ec24fc1f85fbce1f6c56faaca7a
X-Git-Newrev: 0fa7343b6bd20938a65dc4d2e41339b8422040d8
X-Patchwork-Hint: ignore
Message-Id: <20240710210359.3910A846F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/update-rust: use pathlib with
 relative paths
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fa7343b6bd20938a65dc4d2e41339b8422040d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This avoids the requirement of running update-rust from TOPDIR and
is slightly cleaner.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/update-rust | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/utils/update-rust b/utils/update-rust
index 407ef69847..3301434d70 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -2,7 +2,6 @@
 
 import argparse
 import pathlib
-import sys
 import urllib.request
 
 # When updating this list, also update:
@@ -68,11 +67,11 @@ LICENSES = {
 
 
 def update_mk_file(mk_file, new_version):
-    with open(mk_file, "r") as fd:
+    with mk_file.open("r") as fd:
         lines = fd.readlines()
 
     version_var = pathlib.Path(mk_file).stem.upper().replace("-", "_") + "_VERSION"
-    with open(mk_file, "w") as fd:
+    with mk_file.open("w") as fd:
         for line in lines:
             words = line.split()
             if len(words) == 3 and words[0] == version_var and words[1] == "=":
@@ -82,8 +81,8 @@ def update_mk_file(mk_file, new_version):
 
 
 def gen_hash_file_src(hash_file, new_version):
-    with open(hash_file, "w") as fd:
-        fd.write(f"# Generated with {sys.argv[0]}\n# Do not edit manually\n\n")
+    with hash_file.open("w") as fd:
+        fd.write("# Generated with utils/update-rust\n# Do not edit manually\n\n")
         f_name = f"rustc-{new_version}-src.tar.xz"
         print(f"\r\033[KUpdating {f_name}", end="")
         h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
@@ -99,8 +98,8 @@ def gen_hash_file_src(hash_file, new_version):
 
 
 def gen_hash_file_bin(hash_file, new_version):
-    with open(hash_file, "w") as fd:
-        fd.write(f"# Generated with {sys.argv[0]}\n# Do not edit manually\n\n")
+    with hash_file.open("w") as fd:
+        fd.write("# Generated with utils/update-rust\n# Do not edit manually\n\n")
         for host in RUST_HOSTS:
             f_name = f"rust-{new_version}-{host}.tar.xz"
             print(f"\r\033[KUpdating {f_name}", end="")
@@ -132,13 +131,11 @@ def main():
 
     args = parser.parse_args()
 
-    try:
-        update_mk_file("package/rust/rust.mk", args.version)
-        update_mk_file("package/rust-bin/rust-bin.mk", args.version)
-        gen_hash_file_src("package/rust/rust.hash", args.version)
-        gen_hash_file_bin("package/rust-bin/rust-bin.hash", args.version)
-    except FileNotFoundError as e:
-        print(f"{e.filename}: {e.strerror} ({sys.argv[0]} must be run at the root of the Buildroot tree)")
+    TOPDIR = pathlib.Path(__file__).parent.parent
+    update_mk_file(TOPDIR / "package/rust/rust.mk", args.version)
+    update_mk_file(TOPDIR / "package/rust-bin/rust-bin.mk", args.version)
+    gen_hash_file_src(TOPDIR / "package/rust/rust.hash", args.version)
+    gen_hash_file_bin(TOPDIR / "package/rust-bin/rust-bin.hash", args.version)
 
     print("\r\033[K", end="")
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
