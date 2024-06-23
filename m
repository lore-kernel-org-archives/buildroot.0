Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2774DC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 20:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC7F04059B;
	Sun, 23 Jun 2024 20:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YF_xiFk_5k2h; Sun, 23 Jun 2024 20:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EFFC402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EFFC402F2;
	Sun, 23 Jun 2024 20:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08B471BF2EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00BB281418
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKN3f89mfZX2 for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 20:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECCCC812D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECCCC812D4
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECCCC812D4
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 20:36:09 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7ebcc7676c3so155198539f.0
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 13:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174968; x=1719779768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HddpcbB6cq3f9CibOsxPEwxqBbmFtE2TYk73sArI+AI=;
 b=a9yfagmm2ntfqP+BSXNLeg7d3SvojI6C0DdRESKfNdqKR19T1qz55RhVJ1hUHagM0S
 Wq8hRd/W+I4yV/i3dY57OX2WeIcp36ARqb91PwThy90veIasaoCm3gslpiO+WiBJCZXe
 jQeM+jYDZZnkUC8vNI8edrRqjoL+DNV0zi4aEsySX8hCeGWmYvs0AYy5nf5LOf1WJSFC
 rx2tDTDKckUwyMLglcvcpr/iO+prZtDooY628cGaX029SM16HsGvLZwzEwEsuH2uhNAf
 4FWyp8hnYyixs8V0e9q9E9VS06ukMxzxX7Gp1scaoWsq6yS4fyEMA+C4mJjefvbn5IzV
 zNcg==
X-Gm-Message-State: AOJu0Yy3AicyQalrVZTKqb81lz0k3MzSEGinDr2cxQKE8egXVC39IYXJ
 pFk0DsbT5sJ+/F6BjkJoeI0P39V5AnHR9XMjXYVF3figpBTKpkeEt/PMjA==
X-Google-Smtp-Source: AGHT+IFy4vNFQJWY608fZVSmQGpQwEncG9tZifVanuqEslNZX+93ZMREwapNGdZySdugdMiKSpItAw==
X-Received: by 2002:a05:6602:13d5:b0:7eb:8cbd:16a3 with SMTP id
 ca18e2360f4ac-7f3a75fb78fmr220116839f.20.1719174968116; 
 Sun, 23 Jun 2024 13:36:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b9d11e9ae9sm1639442173.109.2024.06.23.13.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:36:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 14:35:57 -0600
Message-Id: <20240623203557.3830122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719174968; x=1719779768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HddpcbB6cq3f9CibOsxPEwxqBbmFtE2TYk73sArI+AI=;
 b=btKGmkbYWDV36ekxgNcWe8ERVzvYjMa5ISjpU2dusNP3m1wf9JW2lXr0AXaZsuA2/p
 /2lXuUAAeZQZGNBoEnQHkhrJ/Hn0mckfUGBXX4KKZ9ClmJ0+LfkiOCUCS1PpbuKAmjDs
 616o45kjGgsH1Fndfi81K9N5CVNreieE966sA3mAIZY3f2SOZmUOSFbnJSRIhrhVwz3w
 a+UdNj9ytHg2njYTpnN8XtFOxJWbfazIMg0DoCs75zyaRPhLvflmzToaVPmHkXv1J/06
 0BQIbOUQM9eStBcuhMDsy/EVno9Hsimyk0U4liis5tP0CVVGZ6b6nRqsgjKwP9hyRZQD
 /bzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=btKGmkbY
Subject: [Buildroot] [PATCH 1/1] utils/update-rust: use urllib.request from
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can use urllib.request without adding any addition lines of code
compared with requests which is not part of the stdlib.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
