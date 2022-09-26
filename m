Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27511C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF2961013;
	Mon, 26 Sep 2022 20:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF2961013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgJP1xiYs3Vp; Mon, 26 Sep 2022 20:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F0C161010;
	Mon, 26 Sep 2022 20:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F0C161010
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB2821BF370
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A610861010
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 20:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A610861010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXQIow7Bru49 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 20:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FAB600D1
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32FAB600D1
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 20:45:10 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id n192so5067653iod.3
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 13:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ERQl4ZNqSA9CgvXxpbTYfkqb4fgLhIsY+guRZiXlx58=;
 b=zyVN7IM5Qp8bG0p8RiffMfziud9+H8GD4artgu//ktR4xkm1W+xxTzYeuE/ZbkWcpw
 CuWU6KaZKGHUXIaXd7IVF5CttgAAvMhrmGjUGwDH/gR5v91J4mQUWjFyBDzA3O5WWL3E
 HzOtJ4XMSl1BGrRX79A7BsVRnkwWaQ3hsen5JfHAe9nFlnK4q0R7GfHvvH4jEQiTgI0J
 yBuxv8wGTKP1Z2EFWV0ALmQOVBA0x/d0fpwa24FPOfNwL8rH/6HUvxTiWwMuvlbfUOYu
 tDHN/P0CPk1AYDmS4ON6ciLwUV87H2TGsF5FkvzsOgdddq5TunoIcM9kelhYyUKWNYS+
 jbgg==
X-Gm-Message-State: ACrzQf1itO1t+2ImslYPKchgqIsi4lU+ucxY8Y81nmdypWMjWRWvxC3A
 OiUVW5NF8V/6v1aKe0nf4JV2HPSv8ZfWRQ==
X-Google-Smtp-Source: AMsMyM4y6T3smC/1YdA6dusbHk/sBeAezIjF/W+1XYu7SN52DmrU+FQznJ85CoJesttUtQZ5Si9FOA==
X-Received: by 2002:a05:6638:1686:b0:35a:2566:6786 with SMTP id
 f6-20020a056638168600b0035a25666786mr12683287jat.180.1664225108692; 
 Mon, 26 Sep 2022 13:45:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d5-20020a026205000000b0035a242f30b6sm7467515jac.175.2022.09.26.13.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 13:45:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:45:05 -0600
Message-Id: <20220926204505.1870869-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ERQl4ZNqSA9CgvXxpbTYfkqb4fgLhIsY+guRZiXlx58=;
 b=oONSiPTtVRCJAPGkgofbuXo5ZZL4mh5wauoMnbyD44Nw+1b1ROsCvdxchKWpDjOLOU
 EB9kvR7tSLQEst6WXQAcQ8ZtZ2CL+MgKOybyD0ZnrU1RZ/jIqnkDBNoTOsXIWthIVwvV
 9KFU0rfTTkz3RospGp9N4mUQXoGfoB24nX/rMI/Q60bX0meeJv+w7Mg5UpPctSoS6ozL
 BObM6FvEdlijNHnVTVkpQKfKwUnWht7SPyYrmSUgCiN6PeCC/AJhRw6CQEmiGOD/jXyP
 N5ffqDspXXDl3BDIF7L/UmnOyHIKX1AtmXCnJ4cxJA6CfdMkLgKBjQc8N3Yx8Jty65FF
 theA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oONSiPTt
Subject: [Buildroot] [PATCH 1/1] utils/update-rust: add new util for
 updating rust/rust-bin
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

Manually updating the rust package is tedious and slow as we have to
update and validate hashes for all supported rust-bin arch specific
toolchains.

To simplify this process add a python script which will update and
validate hashes and signatures for the new desired rust version.

This script is additionally capable of resuming an update if
interrupted which may be useful on slower network connections
as validating gpg signatures requires fully downloading each rust
toolchain distribution file.

This script has no external dependencies other than the optional
python-gnupg library which is needed for gpg signature validation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/update-rust | 226 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100755 utils/update-rust

diff --git a/utils/update-rust b/utils/update-rust
new file mode 100755
index 0000000000..2aad3fffa3
--- /dev/null
+++ b/utils/update-rust
@@ -0,0 +1,226 @@
+#!/usr/bin/env python3
+"""
+
+Utility for updating rust
+
+"""
+import argparse
+import errno
+import urllib.request
+import tempfile
+import shutil
+import io
+import os
+import hashlib
+from pathlib import Path
+from os import fdopen
+
+try:
+    # Requires the python-gnupg library
+    from gnupg import GPG
+except ImportError:
+    print("Unable to verify signatures, python-gnupg required")
+    GPG = None
+
+RUST_KEY = None
+RUST_KEY_URL = "https://static.rust-lang.org/rust-key.gpg.ascii"
+
+TOPDIR = Path(__file__).resolve().parent.parent
+PACKAGE_DIR = TOPDIR.joinpath("package")
+RUST_DIR = PACKAGE_DIR.joinpath("rust")
+RUST_BIN_DIR = PACKAGE_DIR.joinpath("rust-bin")
+RUST_MK_FILE = RUST_DIR.joinpath("rust.mk")
+RUST_HASH_FILE = RUST_DIR.joinpath("rust.hash")
+RUST_BIN_MK_FILE = RUST_BIN_DIR.joinpath("rust-bin.mk")
+RUST_BIN_HASH_FILE = RUST_BIN_DIR.joinpath("rust-bin.hash")
+
+
+def url_data(url):
+    with urllib.request.urlopen(url) as f:
+        return f.read()
+
+
+def rust_verify(sha256, sig_url):
+    global RUST_KEY
+    file_data = url_data(sig_url.rpartition(".")[0])
+    file_data_sha256 = hashlib.sha256(file_data).hexdigest()
+    valid_sig = True
+    if file_data_sha256 != sha256:
+        valid_sig = False
+    if GPG is not None:
+        try:
+            tmp_dir = tempfile.mkdtemp()
+            gpg = GPG(gnupghome=tmp_dir)
+            if RUST_KEY is None:
+                RUST_KEY = url_data(RUST_KEY_URL)
+            import_result = gpg.import_keys(RUST_KEY)
+            gpg.trust_keys(import_result.fingerprints, "TRUST_ULTIMATE")
+            sig_data = url_data(sig_url)
+            with tempfile.NamedTemporaryFile() as tmp_file:
+                tmp_file.write(file_data)
+                verified = gpg.verify_file(io.BytesIO(sig_data), tmp_file.name)
+                if verified.trust_level is None:
+                    print("Signature validation for %s failed." % sig_url)
+                    valid_sig = False
+                if verified.trust_level < verified.TRUST_ULTIMATE:
+                    print(
+                        "Signature validation for %s failed: %s"
+                        % (sig_url, verified.trust_text)
+                    )
+                    valid_sig = False
+        finally:
+            try:
+                shutil.rmtree(tmp_dir)
+            except OSError as exc:
+                if exc.errno != errno.ENOENT:
+                    valid_sig = False
+                    raise exc
+    else:
+        print("Skipping validation for %s" % sig_url)
+    return valid_sig
+
+
+def update_hash_file_entry(hash_file, old_version, new_version):
+    tmpfd, tmpfpath = tempfile.mkstemp()
+    updated = False
+    with fdopen(tmpfd, "w") as new_file:
+        with hash_file.open("r") as old_file:
+            line = old_file.readline()
+            while line:
+                words = line.split()
+                sha256_url_line = None
+                sig_url_line = None
+                sha256_hash_line = None
+                has_section_start = (
+                    len(words) == 3 and words[0] == "#" and words[1] == "From"
+                )
+                is_old_version = old_version in words[2]
+                is_new_version = new_version in words[2]
+                needs_version_update = is_old_version and not is_new_version
+                if updated is False and has_section_start and needs_version_update:
+                    if is_old_version:
+                        old_sha256_url = words[2]
+                        new_sha256_url = old_sha256_url.replace(
+                            old_version, new_version
+                        )
+                        sha256_url_line = line.replace(old_version, new_version)
+                        new_sha256_data = url_data(new_sha256_url)
+                        print(
+                            "processing: %s" % new_sha256_data.strip().decode("utf-8")
+                        )
+                        line = old_file.readline()
+                        words = line.split()
+                        if (
+                            len(words) == 4
+                            and words[0] == "#"
+                            and words[1] == "Verified"
+                            and words[2] == "using"
+                        ):
+                            old_sig_url = words[3]
+                            if old_version in old_sig_url:
+                                new_sig_url = old_sig_url.replace(
+                                    old_version, new_version
+                                )
+                                sig_url_line = line.replace(old_version, new_version)
+                                new_sha256_hash = new_sha256_data.split()[0].decode(
+                                    "ascii"
+                                )
+                                new_sha256_archive = new_sha256_data.split()[1].decode(
+                                    "ascii"
+                                )
+                                if (
+                                    rust_verify(new_sha256_hash, new_sig_url)
+                                    is not True
+                                ):
+                                    raise Exception("signature verification failed")
+                                line = old_file.readline()
+                                words = line.split()
+                                if len(words) == 3 and words[0] == "sha256":
+                                    old_sha256_hash = words[1]
+                                    old_archive_name = words[2]
+                                    if old_version in old_archive_name:
+                                        sha256_hash_line = line.replace(
+                                            old_version, new_version
+                                        ).replace(old_sha256_hash, new_sha256_hash)
+                                        if (
+                                            new_sha256_archive
+                                            == sha256_hash_line.split()[2]
+                                        ):
+                                            updated = True
+                                        else:
+                                            raise Exception(
+                                                "archive name mismatch in sha256 file"
+                                            )
+                    if updated is True:
+                        new_file.write(sha256_url_line)
+                        new_file.write(sig_url_line)
+                        new_file.write(sha256_hash_line)
+                else:
+                    new_file.write(line)
+                line = old_file.readline()
+        if updated:
+            shutil.copymode(hash_file, tmpfpath)
+            shutil.move(tmpfpath, hash_file)
+        else:
+            os.remove(tmpfpath)
+
+    return updated
+
+
+def update_hash_file(hash_file, old_version, new_version):
+    updated = True
+    while updated:
+        updated = update_hash_file_entry(hash_file, old_version, new_version)
+
+
+def update_mk_file(mk_file, old_version, new_version):
+    tmpfd, tmpfpath = tempfile.mkstemp()
+    updated = False
+    with fdopen(tmpfd, "w") as new_file:
+        with mk_file.open() as old_file:
+            version_var = mk_file.stem.upper().replace("-", "_") + "_VERSION"
+            for line in old_file.readlines():
+                words = line.split()
+                if (
+                    len(words) != 0
+                    and words[0] == version_var
+                    and words[1] == "="
+                    and words[2] == old_version
+                ):
+                    updated = True
+                    new_file.write(line.replace(old_version, new_version))
+                else:
+                    new_file.write(line)
+
+        if updated:
+            shutil.copymode(mk_file, tmpfpath)
+            shutil.move(tmpfpath, mk_file)
+        else:
+            os.remove(tmpfpath)
+
+    return updated
+
+
+def get_old_version(mk_file):
+    with mk_file.open() as f:
+        version_var = mk_file.stem.upper().replace("-", "_") + "_VERSION"
+        for line in f.readlines():
+            words = line.split()
+            if len(words) != 0 and words[0] == version_var:
+                return words[-1]
+
+
+def main():
+    parser = argparse.ArgumentParser(description="Update rust")
+    parser.add_argument("version", help="Rust version to update to", type=str)
+
+    args = parser.parse_args()
+    new_version = args.version
+    update_hash_file(RUST_HASH_FILE, get_old_version(RUST_MK_FILE), new_version)
+    update_mk_file(RUST_MK_FILE, get_old_version(RUST_MK_FILE), new_version)
+    update_hash_file(RUST_BIN_HASH_FILE, get_old_version(RUST_BIN_MK_FILE), new_version)
+    update_mk_file(RUST_BIN_MK_FILE, get_old_version(RUST_BIN_MK_FILE), new_version)
+
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
