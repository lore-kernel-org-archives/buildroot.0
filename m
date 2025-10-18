Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708B3CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2567A40F39;
	Sat, 18 Oct 2025 19:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XC7bOJDE3vlv; Sat, 18 Oct 2025 19:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E8CD40F98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8CD40F98;
	Sat, 18 Oct 2025 19:43:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56E09D8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4889640F98
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWkW0Yjq12Rt for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C2BF40F39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C2BF40F39
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C2BF40F39
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 50D45C09A20
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AEF796069D;
 Sat, 18 Oct 2025 19:43:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1207E102F238D; 
 Sat, 18 Oct 2025 21:43:27 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sat, 18 Oct 2025 21:42:59 +0200
Message-ID: <20251018194314.114284-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816609; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=XFdGSjcZQzIDf52rb4qOtHbRlCEMrKGds4nGcVf7mlk=;
 b=vEIBPRICWmARl/+fJCv1qX6mFISc9w5/AqD5eFoc1+WQNR9773CV5zcYFEhGd5K5rVUEoJ
 srqK75uE4Go+9dj92Z+PxKfXyKISoT5muP0qYNhkjime+ErQxjwHVSvw5QgLI0Jhp9RlAd
 ygaZCyOsUudy3kVhweQ4fxpgTp1S90CcUakneDdoIOZ7odeuyZhgboxkAA3YgY8kX078+Z
 0lkvoJjhjse/S0Sa1YXODCyzp6dSdSuR+c8wIcobrC9Gp+rOhJDlNJ9OCqYpx9Zy9if55m
 OMChGkMRU2vXxDrZWbhxP1X0pc+cxhAbEy94E1rQnrLxGCSI+0BRJESuWxIeFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vEIBPRIC
Subject: [Buildroot] [PATCH 01/11] support/testing/infra: improve
 run_cmd_on_host() to show stdout/stderr
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When run_cmd_on_host() runs a command that fails, we only get an
exception with no details to debug what happened. Let's improve that
by catching the exception, and printing the command output. This
requires redirecting stderr to stdout (instead of /dev/null) and
asking to get the output in text format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/__init__.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 1f003f24c6..52308395a3 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -59,11 +59,20 @@ def download(dldir, filename):
 
 def run_cmd_on_host(builddir, cmd):
     """Call subprocess.check_output and return the text output."""
-    out = subprocess.check_output(cmd,
-                                  stderr=open(os.devnull, "w"),
-                                  cwd=builddir,
-                                  env={"LANG": "C"},
-                                  universal_newlines=True)
+    try:
+        out = subprocess.check_output(cmd,
+                                      cwd=builddir,
+                                      env={"LANG": "C"},
+                                      stderr=subprocess.STDOUT,
+                                      text=True,
+                                      universal_newlines=True)
+    except subprocess.CalledProcessError as e:
+        print(f"Command failed with return code {e.returncode}")
+        print("=== STDOUT/STDERR ===")
+        print(e.output)
+        print("=====================")
+        raise
+
     return out
 
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
