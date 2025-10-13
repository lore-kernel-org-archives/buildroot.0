Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E45CCD18D
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 14:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9202E4105B;
	Mon, 13 Oct 2025 14:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyBvSOtj79Fx; Mon, 13 Oct 2025 14:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 483E0411B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483E0411B9;
	Mon, 13 Oct 2025 14:23:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64BA912B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60F3F827FD
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOXjkGcQ1UV3 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 14:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0B5882605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B5882605
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0B5882605
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:23:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo797046766b.0
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 07:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760365379; x=1760970179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9Y7x7/m0ccRaLjNec8nSmsG92+eb8vMvZKcvRzL/t0=;
 b=HvGLOuyka0SpMYTEnPtctTsfCeObAr8YiLU+4QUBp24Sfw5ZhACOFwDwijaqHbpgKA
 e525LHk1mD5vKtw+AZOC9gPColu6BZPCFZq5VnFSlEM27rKZLCap8HyJkzUD7GpAdMDp
 ldMyL9RDF8HdFVyAGKVpPY4oX+Wrs0C+tMMQAIG/vw4jK4AwuFerQlDUXPVXdAfpTEAn
 No3iWGm+2DofU12I+8MxnddTXJRnkt9UfPzVmaKn9I+gizzNB/1AQnz5CLmb9m/EI3MH
 tgp3ZVTs0SDzjhpC14KxZAyJQrWUowmmx1qZOnjG81+yf6xRykCXlDSPH0PiKBf9Kt7q
 m+EA==
X-Gm-Message-State: AOJu0YwOYiWYeNHl6IynrAxIGGPgfiz3VlSTQliRpQZPc8v2LG8yc6Fq
 CQPHVG2Yohooz3I3DkZCGPTEgbGAei7WrSGkghVQqZvlMRi9iLffqMBMs4wJ7u/zOS+sI0bO11v
 BxVnH
X-Gm-Gg: ASbGncuudcoMc2WUqLO/PCZnSesoLeZgYJgwVxTcDiI65nJENck/y8M3uM6PRhGM7FA
 i5/TgPAjIAMXN6AOwIIi/qGVDkaCXLwa1prav7iut+5RF2AoPW54GTvhyBljHOqGxYHcsMCmZhk
 2/38fsZYHwonVxpqgvDNmpBX2cR6jwYT9JKjqtD/vzMw/Hy/ch0vMQr55D5ORuMV948XPxNQ7y6
 9yHv9CRSg3spd3pOUwZWvpVAZsX1i6ZOYfV5joFH5znFm8lY/GrIXGHADxQHIVul4v9UZ/IqB9I
 h18kcoJqb7Wiw0gulH5n6HHJAtd3UU6o/bgRnmHJyf0JbBovHzFLxuQ5Q/JnPtHHUzXT3n/GDwQ
 XRahsZo1JSOLFYFTaMVAYrVWcMzCQcsOkC+RWII7QKmrkigR4sNw=
X-Google-Smtp-Source: AGHT+IHow0hKEz7fTc7ToRioaMAwomB6yaBPGKEwpr3peyUgeLXlJg+46hlp2NqDJaCakTvLUU74Iw==
X-Received: by 2002:a17:906:7949:b0:b3c:bb7a:c366 with SMTP id
 a640c23a62f3a-b50a9b62b79mr2083435566b.7.1760365379367; 
 Mon, 13 Oct 2025 07:22:59 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d63c9a3csm949190966b.23.2025.10.13.07.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:22:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 16:21:40 +0200
Message-ID: <20251013142140.68026-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760365379; x=1760970179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a9Y7x7/m0ccRaLjNec8nSmsG92+eb8vMvZKcvRzL/t0=;
 b=XUktWoI42QtwKM/m2JXkYaDrEfrIyn5z2PNv+D3K5sQBvMdZSqavmoCnmDENbKzpZk
 Sl0FpvLfWraTLynSyesfS5SsTuG4llf1+d9RyTfgjYokJk4HdjMz0slWIQkao/MnltA5
 gzY8s2GeSxPNb1dIbnSQvG3ga1xPapjr6lC6qiL52xwRQevk6w3nO0GuUkPt9IBSxjUe
 MuN9Zo649Oky7DUoH5Mg24j+SI+prdAn+qBSvqLva9b3bWXlZJAEb77Z+mY/z5pgqSeE
 4FPJy5WQ6we0UKq+JSdGa5tfHfL3Mcax8fD6VJ4ajjgurlC6AsFWOr+k0mw0EgBrka7T
 ZWKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XUktWoI4
Subject: [Buildroot] [PATCH] docs/website: auto-generate the downloads page
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Separate the releases data from its templating on the website.
Each line in the table on the releases page has the same information
repeated multiple times, such as the release tag (like "2025.02.7") that
is present in the text and multiple links.

Consequently, when publishing a new version of Buildroot, it is likely
that we're using search & replace in the HTML file to update them all
at once. However, other fields, such as the release date, may be
forgotten in the process, as it happened recently [1]. Moreover, the extra
surrounding markup makes it more difficult to spot all information to
be updated at a glance.

To make things easier, let's define the releases data in a concise json
file, and generate the downloads page from it with a python script.
This also makes it easier to update the templating if needed.

[1] f32e6aa226ccbc9a53a47c736a13e57bcc78dc67

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/website/download.html      | 116 +-------------------------------
 docs/website/releases.html      |  94 ++++++++++++++++++++++++++
 docs/website/releases.json      |  25 +++++++
 utils/generate-website-releases |  72 ++++++++++++++++++++
 4 files changed, 192 insertions(+), 115 deletions(-)
 create mode 100644 docs/website/releases.html
 create mode 100644 docs/website/releases.json
 create mode 100755 utils/generate-website-releases

diff --git a/docs/website/download.html b/docs/website/download.html
index d5b849ca9a..08c53bc3f1 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,121 +7,7 @@
   <div class="panel panel-primary">
     <div class="panel-heading">Download</div>
     <div class="panel-body">
-      <table class="table">
-        <tr>
-          <td></td>
-          <th>Series</th>
-          <th>End of Life</th>
-          <th>Latest release</th>
-          <th>Latest release date</th>
-          <th colspan="2">Downloads</td>
-        </tr>
-<!--
-        <tr>
-          <th>Candidate</th>
-          <th>2025.08.x</th>
-          <td>December 2025</td>
-          <td>
-            2025.08-rc3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc3/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2025-08-28</td>
-          <td>
-            <a href="/downloads/buildroot-2025.08-rc3.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.08-rc3.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2025.08-rc3.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.08-rc3.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
--->
-        <tr>
-          <th>Stable</th>
-          <th>2025.08.x</th>
-          <td>December 2025</td>
-          <td>
-            2025.08.1<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2025-10-11</td>
-          <td>
-            <a href="/downloads/buildroot-2025.08.1.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.08.1.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2025.08.1.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
-          <th>Stable (EOL)</th>
-          <th>2025.05.x</th>
-          <td>September 2025</td>
-          <td>
-            2025.05.3<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2025-10-11</td>
-          <td>
-            <a href="/downloads/buildroot-2025.05.3.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.05.3.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2025.05.3.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.05.3.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
-        <tr>
-          <th>Long-term support</th>
-          <th>2025.02.x</th>
-          <td>March 2028</td>
-          <td>
-            2025.02.7<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">
-              Changelog
-            </a>
-          </td>
-          <td>2025-10-11</td>
-          <td>
-            <a href="/downloads/buildroot-2025.02.7.tar.gz">
-              <img src="images/zip.png" width="24" alt="">
-              .tar.gz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.02.7.tar.gz.sign">[PGP sig]</a>
-          </td>
-          <td>
-            <a href="/downloads/buildroot-2025.02.7.tar.xz">
-              <img src="images/package.png" width="24" alt="">
-              .tar.xz
-            </a><br/>
-            <a href="/downloads/buildroot-2025.02.7.tar.xz.sign">[PGP sig]</a>
-          </td>
-        </tr>
-      </table>
+      <!--#include file="releases.html" -->
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">http://buildroot.net/downloads/</a>.
diff --git a/docs/website/releases.html b/docs/website/releases.html
new file mode 100644
index 0000000000..5f95f334da
--- /dev/null
+++ b/docs/website/releases.html
@@ -0,0 +1,94 @@
+
+<!-- This fragment was generated from releases.json
+     See utils/generate-website-releases -->
+<table class="table">
+    <tr>
+        <td></td>
+        <th>Series</th>
+        <th>End of Life</th>
+        <th>Latest release</th>
+        <th>Latest release date</th>
+        <th colspan="2">Downloads</td>
+    </tr>
+
+    <tr>
+        <th>Stable</th>
+        <th>2025.08.x</th>
+        <td>December 2025</td>
+        <td>
+            2025.08.1<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08.1/CHANGES">
+                Changelog
+            </a>
+        </td>
+        <td>2025-10-11</td>
+        <td>
+            <a href="/downloads/buildroot-2025.08.1.tar.gz">
+                <img src="images/zip.png" width="24" alt="">
+                .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.08.1.tar.gz.sign">[PGP sig]</a>
+        </td>
+        <td>
+            <a href="/downloads/buildroot-2025.08.1.tar.xz">
+                <img src="images/package.png" width="24" alt="">
+                .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
+        </td>
+    </tr>
+
+    <tr>
+        <th>Stable (EOL)</th>
+        <th>2025.05.x</th>
+        <td>September 2025</td>
+        <td>
+            2025.05.3<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05.3/CHANGES">
+                Changelog
+            </a>
+        </td>
+        <td>2025-10-11</td>
+        <td>
+            <a href="/downloads/buildroot-2025.05.3.tar.gz">
+                <img src="images/zip.png" width="24" alt="">
+                .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.3.tar.gz.sign">[PGP sig]</a>
+        </td>
+        <td>
+            <a href="/downloads/buildroot-2025.05.3.tar.xz">
+                <img src="images/package.png" width="24" alt="">
+                .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.05.3.tar.xz.sign">[PGP sig]</a>
+        </td>
+    </tr>
+
+    <tr>
+        <th>Long-term support</th>
+        <th>2025.02.x</th>
+        <td>March 2028</td>
+        <td>
+            2025.02.7<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.7/CHANGES">
+                Changelog
+            </a>
+        </td>
+        <td>2025-10-11</td>
+        <td>
+            <a href="/downloads/buildroot-2025.02.7.tar.gz">
+                <img src="images/zip.png" width="24" alt="">
+                .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.02.7.tar.gz.sign">[PGP sig]</a>
+        </td>
+        <td>
+            <a href="/downloads/buildroot-2025.02.7.tar.xz">
+                <img src="images/package.png" width="24" alt="">
+                .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-2025.02.7.tar.xz.sign">[PGP sig]</a>
+        </td>
+    </tr>
+</table>
\ No newline at end of file
diff --git a/docs/website/releases.json b/docs/website/releases.json
new file mode 100644
index 0000000000..476abb9963
--- /dev/null
+++ b/docs/website/releases.json
@@ -0,0 +1,25 @@
+{
+  "releases": [
+    {
+      "series": "2025.08.x",
+      "name": "Stable",
+      "planned_eol": "December 2025",
+      "latest": "2025.08.1",
+      "latest_date": "2025-10-11"
+    },
+    {
+      "series": "2025.05.x",
+      "name": "Stable (EOL)",
+      "planned_eol": "September 2025",
+      "latest": "2025.05.3",
+      "latest_date": "2025-10-11"
+    },
+    {
+      "series": "2025.02.x",
+      "name": "Long-term support",
+      "planned_eol": "March 2028",
+      "latest": "2025.02.7",
+      "latest_date": "2025-10-11"
+    }
+  ]
+}
diff --git a/utils/generate-website-releases b/utils/generate-website-releases
new file mode 100755
index 0000000000..4ff62df121
--- /dev/null
+++ b/utils/generate-website-releases
@@ -0,0 +1,72 @@
+#!/usr/bin/env python3
+
+"""
+Generate the download HTML page for the website from releases.json that lists
+all actively maintained releases
+"""
+
+import json
+from pathlib import Path
+from sys import argv
+
+THIS_SCRIPT = Path(argv[0]).absolute()
+BUILDROOT_DIR = THIS_SCRIPT.parent.parent
+WEBSITE = BUILDROOT_DIR / "docs" / "website"
+
+COMMENT_HEADER = f"""
+<!-- This fragment was generated from releases.json
+     See {THIS_SCRIPT.relative_to(BUILDROOT_DIR)} -->
+"""
+
+TABLE_HEADER = """
+    <tr>
+        <td></td>
+        <th>Series</th>
+        <th>End of Life</th>
+        <th>Latest release</th>
+        <th>Latest release date</th>
+        <th colspan="2">Downloads</td>
+    </tr>
+"""
+
+TABLE_ROW = """
+    <tr>
+        <th>{name}</th>
+        <th>{series}</th>
+        <td>{planned_eol}</td>
+        <td>
+            {latest}<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/{latest}/CHANGES">
+                Changelog
+            </a>
+        </td>
+        <td>{latest_date}</td>
+        <td>
+            <a href="/downloads/buildroot-{latest}.tar.gz">
+                <img src="images/zip.png" width="24" alt="">
+                .tar.gz
+            </a><br/>
+            <a href="/downloads/buildroot-{latest}.tar.gz.sign">[PGP sig]</a>
+        </td>
+        <td>
+            <a href="/downloads/buildroot-{latest}.tar.xz">
+                <img src="images/package.png" width="24" alt="">
+                .tar.xz
+            </a><br/>
+            <a href="/downloads/buildroot-{latest}.tar.xz.sign">[PGP sig]</a>
+        </td>
+    </tr>
+"""
+
+with (WEBSITE / "releases.json").open() as f:
+    print(f"Reading {f.name}...")
+    releases_data = json.load(f)
+
+with (WEBSITE / "releases.html").open("w") as f:
+    f.write(COMMENT_HEADER)
+    f.write('<table class="table">')
+    f.write(TABLE_HEADER)
+    for r in releases_data["releases"]:
+        f.write(TABLE_ROW.format(**r))
+    f.write("</table>")
+    print(f"Wrote {f.name}")
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
