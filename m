Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82871C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 410E780DBB;
	Sun, 23 Jun 2024 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOycz9-Pig4G; Sun, 23 Jun 2024 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA0380D19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA0380D19;
	Sun, 23 Jun 2024 20:58:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFA5E1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E79E04028B
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pg8_fnePgjFB for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 20:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC32140275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC32140275
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC32140275
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 20:58:49 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7ec2d71059dso145006139f.2
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 13:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719176328; x=1719781128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9y5QiEZFYHY9R5qMRVVLh0KJ/FXf95XAMjqDGsswxTo=;
 b=BGa0J/ViP4lCfesRj1qRAGQkuMg8h6PKFgy7VUyYZ1qmqvKEvYmdoQQMPaOy8TKbI/
 HQh2CIKPGuNih0vtTkN54sw4y8tD4vOoQFm4BUQPa8XwRerCXWmSdM+8XG+Waf64iw0b
 xnlbIOiZfAI1xBJiMguS2AFtjvSHi79vzOeEIyc0R8Zc9cwoHS0+gF3ga8AdaN0QVmVm
 vcEgYjnvu7B25LAm0ZA6ELRQ2ZEk3/TxplNfTNPrQgs3cb1wjNcWiFde/Kq90mLVSH1S
 s28Ulz3ff0vC56IDyPB3uJPm/an+VgnldZ3fW1sLe6vQl2XWuyTEi9pYuDNRt6z9Q5L3
 OlNQ==
X-Gm-Message-State: AOJu0YzU44A8VuyKg4/oqkpitchpGOvrhgBRjZ/bZvZ/K58iIHYMX6Xv
 cjTYdL/NU+Se1Mt/PxUSOnHCE3iJTNFu+9hnnRR63OjaDWcajOxPYix5HA==
X-Google-Smtp-Source: AGHT+IH2AINcqq7FoYrufO0mZeA82LTwg984bGt73v3U8KGerdqe0ldgeQsL1YDdaST0o4sLdZnuHg==
X-Received: by 2002:a05:6602:6c0b:b0:7eb:8887:d6bb with SMTP id
 ca18e2360f4ac-7f3a74d7044mr354546939f.2.1719176328415; 
 Sun, 23 Jun 2024 13:58:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b9f18e0a34sm582818173.23.2024.06.23.13.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:58:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 14:58:21 -0600
Message-Id: <20240623205821.3833321-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719176328; x=1719781128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9y5QiEZFYHY9R5qMRVVLh0KJ/FXf95XAMjqDGsswxTo=;
 b=eEOWdmxmMEn+GnSaQPjUE2q2EbQwY51iifwdwRY37H66J7wSoYoT26ybSL00GcyltT
 oO689PTtihHs05m1PdFOBJwObLopI0irICaJ+fK9BwJlgLfBzl8cnwO/vqYmMjXKh+x6
 ywDS5TvK5LcOf5gP9dDC+65s6If0aOTmaF4TYMvSixiluthR98euNQMSOpb5aR0bxvJs
 lacH5YFUjf6g61T/NZLifN32oalL2jVhboK/6MOs1II6GaxG7ayNStVi4bAYD/KPxokC
 s1to6zzajKDwqOvVGsxhNpxxhHbcaa2Vhjs2Mj+jt76/HslaarXPdvZL53+I1PcBZgkh
 q+IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eEOWdmxm
Subject: [Buildroot] [PATCH 1/1] utils/update-rust: use pathlib with
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This avoids the requirement of running update-rust from TOPDIR and
is slightly cleaner.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/update-rust | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/utils/update-rust b/utils/update-rust
index 6799324fac..b274beb85b 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -68,11 +68,11 @@ LICENSES = {
 
 
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
@@ -82,8 +82,8 @@ def update_mk_file(mk_file, new_version):
 
 
 def gen_hash_file_src(hash_file, new_version):
-    with open(hash_file, "w") as fd:
-        fd.write(f"# Generated with {sys.argv[0]}\n# Do not edit manually\n\n")
+    with hash_file.open("w") as fd:
+        fd.write(f"# Generated with utils/update-rust\n# Do not edit manually\n\n")
         f_name = f"rustc-{new_version}-src.tar.xz"
         print(f"\r\033[KUpdating {f_name}", end="")
         h_url = f"{RUST_DIST_URL}/{f_name}.sha256"
@@ -99,8 +99,8 @@ def gen_hash_file_src(hash_file, new_version):
 
 
 def gen_hash_file_bin(hash_file, new_version):
-    with open(hash_file, "w") as fd:
-        fd.write(f"# Generated with {sys.argv[0]}\n# Do not edit manually\n\n")
+    with hash_file.open("w") as fd:
+        fd.write(f"# Generated with utils/update-rust\n# Do not edit manually\n\n")
         for host in RUST_HOSTS:
             f_name = f"rust-{new_version}-{host}.tar.xz"
             print(f"\r\033[KUpdating {f_name}", end="")
@@ -132,13 +132,11 @@ def main():
 
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
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
