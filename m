Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE0ECAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 08:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7251C81149;
	Fri, 12 Sep 2025 08:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFehYE8i1a5G; Fri, 12 Sep 2025 08:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE328114D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE328114D;
	Fri, 12 Sep 2025 08:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5248512D
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 08:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F37360BA8
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 08:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCAGXBPqAfYC for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 08:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::363; helo=mail-wm1-x363.google.com;
 envelope-from=anton.bengtsson@plejd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E91860B9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E91860B9E
Received: from mail-wm1-x363.google.com (mail-wm1-x363.google.com
 [IPv6:2a00:1450:4864:20::363])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E91860B9E
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 08:35:03 +0000 (UTC)
Received: by mail-wm1-x363.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso10595675e9.3
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 01:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757666101; x=1758270901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSNKlXasf80WKjgI4mzpkE/t6Ir+3R0kKrAtZzqlgUA=;
 b=LOqIGqWaLZLjINP/T1P4A7tkxc2aVD+E5oTCyrlMSFinIp+nXyc7ZF9Yxbq+5PXS8H
 +ki3xFgRcomT8nnvcinr85d+mqESDHDXi24rHprYjbQgACIB1F4leZkQ28lgZ31w26BW
 SPu5CA/tk1EuhsDM7XkOYyU1+0NNLpiFYW2/OJSB/4Z5Ye5YLnLTjdd4Y0JcxMHR1nwI
 QdcnRKwv2f/k80RWgxTtPw8Ljj8KWGoH4P6n1p7ghox5Ns8u31KOSn1jdiMFrkEZD4U7
 bTHzDwO4e7jTa00kncg72TaFeuVaxIkh1zM/spIzGLMx2ciBQgOZ1LQZo4aG0b8m6AAJ
 hA3g==
X-Gm-Message-State: AOJu0YzkJ6Nb3K/w2spINrQ7sASU+/pBO9/cEKh+5qrnVY3RuJhUAvnI
 vwwrVRkP3I3rjeU1dKnC9o7IsScFx3piK3bIXg07dfzuNpMkj94tjREPUJ869xP0tIHtMWDHyYd
 i6UN2/9n8ySJVt3dHw0VbFPSLr23XlNLGJgI0NBlvZFwg
X-Gm-Gg: ASbGncvk9Na7IKDQF5NAtKox16/hpnk0s+y8+Cca0dciGK8/urbYEQtH23Mhlh0GqbD
 m/sUiDrEjF7l+aW8so5JqQGbQyFBdw992iKQr2HHkjKDjc680yKxzxJqEjLMvnTbhAJ/hhnkgxX
 W9/dY4T9p4o23G7hEblRxLwFCG6KFKUqF0yogGYeAc8rFvPKjUzFmlHogiqytILgiZk3aieY5Az
 4+Y4H1x3oJlVdMtKpoZMS3PXEgsRx4H58YRPwuTPZTsp1vvVD8KRUWMiuA2UDUyIlrxGP2kqvQB
 qKcomFFXo1jSapbwIPdMXvA3V+R7Wvk6lGC+V4ZgA/gEeOGGLddgIJqjAy2uzZfdpW05Bhg94x8
 EhsEHud/p49k0miX+
X-Google-Smtp-Source: AGHT+IF6A/liOpPK/eAUX4Rt/XLOmy7cgAu/33TeU3BwUKEFBQgwyWmLs/BHy1f3fMAbfJMI9XTS0bshOoAM
X-Received: by 2002:a05:600c:6c8a:b0:456:19be:5e8 with SMTP id
 5b1f17b1804b1-45f21214918mr14187135e9.20.1757666101110; 
 Fri, 12 Sep 2025 01:35:01 -0700 (PDT)
Received: from anton-b-thinkpad (h-213-164-192-18.NA.cust.bahnhof.se.
 [213.164.192.18]) by smtp-relay.gmail.com with ESMTPS id
 ffacd0b85a97d-3e7607effc7sm794601f8f.44.2025.09.12.01.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 01:35:01 -0700 (PDT)
X-Relaying-Domain: plejd.com
To: buildroot@buildroot.org
Cc: Anton Bengtsson <anton.bengtsson@plejd.com>
Date: Fri, 12 Sep 2025 10:34:31 +0200
Message-ID: <20250912083432.3444568-1-anton.bengtsson@plejd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911121235.3062715-1-anton.bengtsson@plejd.com>
References: <20250911121235.3062715-1-anton.bengtsson@plejd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=plejd.com; s=plejd; t=1757666101; x=1758270901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSNKlXasf80WKjgI4mzpkE/t6Ir+3R0kKrAtZzqlgUA=;
 b=UMZKYXnHLddfFdrHfc0awjM6jI513JJX4pUb/e55fbjHvEBG7b2Uothf7Zd8zzluuv
 +EPNF0gpxP20nJxiFcuAlzaqgGAj7yz9E8xdSBX2EIzgaT2k/GAeM/mf3gB+bG4hxCBQ
 KMfC1p37pH4tg8+VXnugp+Jo2znktLeogbHKY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=plejd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=plejd.com header.i=@plejd.com header.a=rsa-sha256
 header.s=plejd header.b=UMZKYXnH
Subject: [Buildroot] [PATCH v2 1/2] support/scripts/cve: replace distutils
 with looseversion
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
From: Anton Bengtsson via buildroot <buildroot@buildroot.org>
Reply-To: Anton Bengtsson <anton.bengtsson@plejd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package 'distutils' was removed in Python 3.12[1] and looseversion[2]
appears to be a good drop-in replacement for distutils.version.LooseVersion.

Also added inline script requirements suitable for uv, similar to the one
added for utils/check-package in 6ffcdb52e80b63e68c890aed52ff7f4d00e079b8.

[1] https://docs.python.org/3/library/distutils.html
[2] https://pypi.org/project/looseversion

Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>

---
Changes v1 -> v2:
  - Added inline scripts requirements for uv                (suggested by Arnout)
  - Added python3-looseversion to support/docker/Dockerfile (suggested by Arnout)

Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
---
 support/scripts/cve.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index ba41762fa0..524f08f48f 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -16,14 +16,20 @@
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+# /// script
+# dependencies = [
+#     "looseversion==1.3.0",
+# ]
+# ///
 
 import datetime
 import os
-import distutils.version
 import json
 import subprocess
 import sys
 import operator
+from looseversion import LooseVersion
 
 sys.path.append('utils/')
 
@@ -190,7 +196,7 @@ class CVE:
         by this CVE.
         """
 
-        pkg_version = distutils.version.LooseVersion(version)
+        pkg_version = LooseVersion(version)
         if not hasattr(pkg_version, "version"):
             print("Cannot parse package '%s' version '%s'" % (name, version))
             pkg_version = None
@@ -202,7 +208,7 @@ class CVE:
         # version, as they might be different due to
         # <pkg>_CPE_ID_VERSION
         else:
-            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
+            pkg_version = LooseVersion(cpe_version(cpeid))
 
         for cpe in self.each_cpe():
             if not cpe_matches(cpe['id'], cpeid):
@@ -214,7 +220,7 @@ class CVE:
 
             if cpe['v_start']:
                 try:
-                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
+                    cve_affected_version = LooseVersion(cpe['v_start'])
                     inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
                 except TypeError:
                     return self.CVE_UNKNOWN
@@ -226,7 +232,7 @@ class CVE:
 
             if cpe['v_end']:
                 try:
-                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
+                    cve_affected_version = LooseVersion(cpe['v_end'])
                     inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
                 except TypeError:
                     return self.CVE_UNKNOWN
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
