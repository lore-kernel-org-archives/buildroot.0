Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ECEC3ABDD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 08:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F194052D;
	Thu, 15 May 2025 08:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BT6s25hMeeEH; Thu, 15 May 2025 08:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5467403BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5467403BB;
	Thu, 15 May 2025 08:36:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEB4E153
 for <buildroot@buildroot.org>; Thu, 15 May 2025 08:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F85606E5
 for <buildroot@buildroot.org>; Thu, 15 May 2025 08:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBBynIADJs3d for <buildroot@buildroot.org>;
 Thu, 15 May 2025 08:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAED8605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAED8605D8
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAED8605D8
 for <buildroot@buildroot.org>; Thu, 15 May 2025 08:36:45 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22fac0694aaso5015355ad.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 01:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747298205; x=1747903005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oJfliENwx2ZN8Sskkwj+DrFueJn8BRqJ+dly2NiNKkg=;
 b=cTW9ljDXYM4iJN13/gLdeV4bC3DGJyCCdCq/kA8deAuta2TVIyp1yxyvKYEn72J5/B
 Wsnf9URj13VA+/0SQpo5MrbSUbEyf4LreNYRcpOM022iY6M2dnl7y1abfm+9nL50+AEU
 pmbv/5SbBhifXggB4qndt/PtiDx9o8FUfmqQs971DWrf80JchDJA8swL7uXd9uLsQgH7
 0bhouuTDR9ynLP2AKFkR3A2ICBdVsoFun6yQbXUajOM1G9iloHDvZlddOtYCGbTS+DYn
 v23PezPINiEEMb0xu+btobgFImu7/H2/MTTU0r3zx1A0culP1+TzfmNE/TScNX/70lxY
 7RhQ==
X-Gm-Message-State: AOJu0Yxs9cS6LZUrXlMdrAYRQYsHyPwB/zbTHjDNDEumai0Q2CECufq5
 GYPm3n4Lsr0o9hiqiT6Sg3t0x3yasWoJEMhm0jXIJWDs4LKSuK9VwBuZ5SZ9
X-Gm-Gg: ASbGncsQUlgamRbOCrFWbuSgVP5A5mKWf9IaTByMnPxwQxBiMv8W7leb4q2KPf+LwGP
 p7q1D/FTkxfMTiEVaTtZLeLUkua6HxBVjSvAmarnmTY7/F4DhXT07yU93bFynrZPDEBO/vapXSh
 8Cx/vRYz6myDzejec0dsp9ZcKeo/d4BjKzeB8qudzGO9YQAgLS+WpTIJs0dcWlxBLduJAUU6geU
 eluJqp7salYh5GWKC0OYg3HCbr5jGDhK8zJN5RYD9j06AMgEiV4mbjEfdVUIFSBER+ki7+O+Rkr
 VycRcjLeCHP5vmH6duEnZRmJOGM5CK+h7AmNAaZssFhW+cuDCNyudGzmXrVuhQOUPwBXJn9oabd
 WgRBDtmXew1ZFadIvY4GthPlk8nOanKpVrQyp9g==
X-Google-Smtp-Source: AGHT+IGQsWm3gE2zbmDoHd7z/8aGt5gvZ7OPRTyXV3XBkx0LYnqdRU3ITt0753/1nZGO/n/5me8lxA==
X-Received: by 2002:a17:903:946:b0:22d:e57a:2795 with SMTP id
 d9443c01a7336-231b5ed186amr23323545ad.47.1747298204690; 
 Thu, 15 May 2025 01:36:44 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271a72sm112471155ad.112.2025.05.15.01.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 01:36:44 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu, 15 May 2025 01:36:40 -0700
Message-Id: <20250515083640.49630-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747298205; x=1747903005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oJfliENwx2ZN8Sskkwj+DrFueJn8BRqJ+dly2NiNKkg=;
 b=XzLtlHIib1mJx+stUarR3Xl3im1VGknAz6eXyGI/Z+ZY+wq6Qzcj5MeJHXg5ATHYJ7
 TSPh4DOfRPVLsfM0tV3+1HuEAPJFGcNodDXsLVDnC2BJxda4csR0DaEik2Xfi337KVii
 sN53y/W7wW2+TFtd94pdCQI+7tKm2Nz8STxSNnj89FqjGA7dwM3v0T6Mokp1p8dvWiy6
 bT69mxr31M+9CgYQaFYdQ03QYHxUDgPZCKav+lETE4z8pA4dkYgpZe24TMHormCIffFw
 OrJy5n2hAy612LN6ZWMrmEKCEeQxj3dBPr4u072Lyc2MYQJq+bSDhS5xu+BRS+6Fmstb
 JPDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XzLtlHIi
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 -N/--needs-update option
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

This commit adds the -N/--needs-update option, disabled by default,
to list only packages with newer upstream versions. All other packages
will be excluded from the HTML or JSON output.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 support/scripts/pkg-stats | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 46b12cd992..c22a8e724f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1280,12 +1280,22 @@ def parse_args():
                         default=[])
     parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
                         help='Increase verbosity')
+    parser.add_argument('-N', '--needs-update', dest='needs_update', action='store_true',
+                        help='Only include packages with newer versions available')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
     return args
 
 
+def is_newer_version_available(pkg):
+    return not (
+        pkg.latest_version['status'] in (RM_API_STATUS_ERROR, RM_API_STATUS_NOT_FOUND) or
+        pkg.latest_version['version'] is None or
+        pkg.latest_version['version'] == pkg.current_version
+    )
+
+
 def __main__():
     global cvecheck
 
@@ -1341,6 +1351,8 @@ def __main__():
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
+    if args.needs_update:
+        packages = [pkg for pkg in packages if is_newer_version_available(pkg)]
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
