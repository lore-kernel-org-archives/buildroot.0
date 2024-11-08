Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB52D64099
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 23:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3900D6060C;
	Fri,  8 Nov 2024 23:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3V2hUW6cKiE; Fri,  8 Nov 2024 23:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DED60617
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DED60617;
	Fri,  8 Nov 2024 23:13:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8705BC2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 23:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73CFA4046B
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 23:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFSSXVew4MOw for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 23:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A9A840572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A9A840572
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A9A840572
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 23:13:38 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id
 af79cd13be357-7b1474b1377so177719785a.2
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 15:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731107617; x=1731712417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gV0q91YFHhtsHom51nHsNB6Qhm84KO4bDWDCvJ5F1Ys=;
 b=fsk6WoqIxYIlaHmIoMApn1o58fWsq96uYx0q+/Zi2Y3Bi4yDbdqsE5BuikpEfO2V6j
 a9k6vfjNRXE68YGbqCIMrfoMgp9WyPccpqp8o8t50hO+OCl7KqcwJMkLmd0pLq58u9X+
 c30u6J0In88/uw2M3UwU1B43I6Wh7NxV3mOfLlF5MWV4nYUacH0we8tv+6S+p6tpxgfL
 tMYbKGknjDeOOMW7fFZrYrg/2M25n1z9Xf0buz/XZHfdCNgAkMFwhi4b7tK+SR0ZZlvK
 By7O+0ZwVTrhfa4J6Wt1bAZODKds1LV+/Smv1tCzASJ/864ykRDk+uu0bOg9Se3071dn
 m+hw==
X-Gm-Message-State: AOJu0Yxx5tiPLZ/WgQQqMXZJWtlR/JPIi6XFXNk6Tks1WQ4GisVzmbvy
 B8T+SJ3978ew9sDgA+UeDWUVxwiK4IZTLLeDqvJn3tBsk1pKT00/jvABGNxrQaspmhryaXAb5CZ
 MN0Jr7HaB
X-Google-Smtp-Source: AGHT+IH9l7/6QpZxZ3q8lJo2COLHpk57NDwlyafovw19ivnck10x9J6pz8uEfLB8rFJROLNiSerbpQ==
X-Received: by 2002:a05:620a:2444:b0:7b1:522a:b07 with SMTP id
 af79cd13be357-7b331e60e2fmr555528685a.61.1731107617312; 
 Fri, 08 Nov 2024 15:13:37 -0800 (PST)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-47-76-71-165-74.dsl.bell.ca. [76.71.165.74])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac88721sm204327085a.65.2024.11.08.15.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 15:13:36 -0800 (PST)
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Fri,  8 Nov 2024 18:12:36 -0500
Message-ID: <20241108231236.2838-2-git@jdknight.me>
X-Mailer: git-send-email 2.46.2.windows.1
In-Reply-To: <20241108231236.2838-1-git@jdknight.me>
References: <20241108231236.2838-1-git@jdknight.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1731107617; x=1731712417;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gV0q91YFHhtsHom51nHsNB6Qhm84KO4bDWDCvJ5F1Ys=;
 b=ksK3A6g4UJPhfMFQxNNX0zmTzJJBCkOyZmRjxVBlnLno7DeOI/CdheG9wBXYyuN3rC
 7dRq+nroQzH9W4FI70AS9AB0h2R7dhRyJHsjTkTqbawyUJaDI2NRsorxgYz4kNoC1+PC
 fWjNtbiRF/APWjwIqzoDBttp1Jrvu5SQ6WUH6LyUm4QFkLTQ/zeP/o2XR5yzfCogx6Y6
 CHtbJhtIaGWRcoKhjxVjnJYbD0iuTIpAdaZUrZTfBVq61Tw75ydu1en1exZ+86msR1mY
 dfmAP+Y8qh36P7x3mOM5tDms++cBYVHNrsvQVSUVqtYUe/FyFE5Iiq9K9hpbOChysq/i
 btiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ksK3A6g4
Subject: [Buildroot] [PATCH v2 2/2] support: add a kernel version
 configuration helper script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides a helper script which can be used to quickly synchronize the
kernel versions defined in the Linux's `Config.in` file based on the
contents populated inside `linux.hash`.

The goal of this script is to help the maintenance effort required when
possibly supporting all active Linux LTS versions in the tree at a
given time.

Signed-off-by: James Knight <git@jdknight.me>
---
Changes v1 -> v2:
  - Introduced in the v2 of this series.

This is optional. No worries if not desired.
---
 support/scripts/sync-kernel-versions.py | 142 ++++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100755 support/scripts/sync-kernel-versions.py

diff --git a/support/scripts/sync-kernel-versions.py b/support/scripts/sync-kernel-versions.py
new file mode 100755
index 0000000000000000000000000000000000000000..2684b052657b0b98ac0265cd1b74a514d03ba9ca
--- /dev/null
+++ b/support/scripts/sync-kernel-versions.py
@@ -0,0 +1,142 @@
+#!/usr/bin/env python3
+#
+# Provides a script to allow the automatic updating of a Linux
+# package's `Config.in` file based on the version information detailed
+# in a `linux.hash` file.
+
+from pathlib import Path
+import argparse
+import re
+
+
+# searching for a version pattern inside a `linux.hash` file
+LINUX_VERSION_PATTERN = r'.*-([1-9]+.*)\.t.*'
+
+
+def main():
+    # argument parsing
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--dry-run', action='store_true',
+                        help='Do not change any files')
+    parser.add_argument('--verbose', action='store_true',
+                        help='Output additional information')
+    args = parser.parse_args()
+
+    # helpers
+    def verbose(msg):
+        if args.verbose:
+            print(f'(verbose) {msg}')
+
+    # find the linux package folder
+    br_dir = Path(__file__).parent.parent.parent
+
+    linux_pkg_dir = br_dir / 'linux'
+    if not linux_pkg_dir.is_dir():
+        print('unable to find the linux package folder')
+        return 1
+
+    linux_conf = linux_pkg_dir / 'Config.in'
+    if not linux_conf.is_file():
+        print('unable to find the linux configuration file')
+        return 1
+
+    linux_hash = linux_pkg_dir / 'linux.hash'
+    if not linux_hash.is_file():
+        print('unable to find the linux hash file')
+        return 1
+
+    # extract expected linux entries from the hash file
+    try:
+        with linux_hash.open(encoding='utf-8') as f:
+            raw_hash_output = f.readlines()
+    except OSError as e:
+        print(f'error reading file {linux_hash}: {e}')
+        return 1
+
+    entries = {}
+    for hash_entry in raw_hash_output:
+        if hash_entry.startswith('sha'):
+            _, _, fname = hash_entry.strip().split(maxsplit=2)
+            if fname.startswith('linux-'):
+                verbose(f'detected linux entry: {fname}')
+
+                match = re.search(LINUX_VERSION_PATTERN, fname)
+                if match:
+                    vnum = match.group(1)
+                    ventry = extract_ventry(vnum)
+                    entries[ventry] = vnum
+                    verbose(f'detected linux version ({fname}): {vnum}')
+                else:
+                    verbose(f'unable to detect linux version: {fname}')
+
+    # read the existing Linux configuration file
+    conf_contents = []
+    has_updated = False
+    process_cfg = None
+    try:
+        with linux_conf.open(encoding='utf-8') as f:
+            lines = f.read().splitlines()
+            for line in lines:
+                # wait until we are processing the kernel version section
+                if process_cfg is None:
+                    if 'config BR2_LINUX_KERNEL_VERSION' in line:
+                        process_cfg = True
+
+                # if we are processing, check each version entry for any
+                # updates that are required
+                elif process_cfg:
+                    # stop if the section is done
+                    if not line:
+                        process_cfg = False
+                    # check if this is a linux configuration entry that
+                    # might need to be updated
+                    elif 'default "' in line:
+                        front, raw_version, tail = line.split(maxsplit=2)
+                        vnum = raw_version.replace('"', '')
+                        if '.' in vnum:
+                            ventry = extract_ventry(vnum)
+                            if ventry in entries:
+                                new_vnum = entries[ventry]
+                                # if the version is outdated, replace the line
+                                if vnum != new_vnum:
+                                    print(f'Sync: {vnum} -> {new_vnum}')
+                                    line = f'\t{front} "{new_vnum}" {tail}'
+                                    has_updated = True
+
+                conf_contents.append(line)
+
+    except OSError as e:
+        print(f'error reading file {linux_conf}: {e}')
+        return 1
+
+    # update the linux configuration file if we have new changes
+    if has_updated and not args.dry_run:
+        print(f'Updating: {linux_conf}')
+        try:
+            with linux_conf.open('w', encoding='utf-8', newline='') as f:
+                for line in conf_contents:
+                    f.write(f'{line}\n')
+
+        except OSError as e:
+            print(f'error writing file {linux_conf}: {e}')
+            return 1
+
+    if not has_updated:
+        print('No outdated versions.')
+
+    return 0
+
+
+def extract_ventry(vnum):
+    vmaj, vmin, _ = vnum.split('.', maxsplit=2)
+
+    ventry = f'{vmaj}.{vmin}'
+    if '-' in vnum:
+        _, postfix = vnum.split('-', maxsplit=1)
+        ventry += f'-{postfix}'
+
+    return ventry
+
+
+if __name__ == "__main__":
+    raise SystemExit(main())
-- 
2.46.2.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
