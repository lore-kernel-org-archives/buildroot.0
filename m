Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC43C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 19:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D9940147;
	Sun,  8 Jan 2023 19:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D9940147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pj0OsAMQLNNP; Sun,  8 Jan 2023 19:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 927AD400D2;
	Sun,  8 Jan 2023 19:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 927AD400D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2671BF577
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E89D5408F4
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 19:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89D5408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWzAsXOvcAKV for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 19:14:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9446D408F3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9446D408F3
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 19:14:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h16so6150437wrz.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 11:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NN8TTUJEE4yjpZySOZPOebU1NFduCDYQPCRKYLuAdNQ=;
 b=oUan/MwinVPHq6rgSzeqF4oPGFFqgfohi7DMQ5ZgSTggGqGnsohy3gRTQ8y0SQecg3
 gh+MBiKh8mtj2lptv9QAkFZ42HP/O56FxoSBtOkeUF9e4/+e36wModSRLAQf8JYYpXc0
 O3WeHqGl4B5oTBElh5CJljRv+HSonXhdKFa6MdlK1p1O8uBm4hxZJiU9f+L4VzM8ILW1
 i/RHxCq36c6K/N9DLk5HmTHzcFj6ZcS90DGqSjN61HZZPgpdFXnNAGYqFNw1KQJnjBhY
 wITRmbbUV1mJsaQXjBSrEuiLu5mpP1tQwLydK0K1K4KxtHVm/pexxLfYFAQLeU48psW2
 FK6g==
X-Gm-Message-State: AFqh2koHHPWZjQ91TSIz2cJv4Jvcs017O1feX0hBF5j+8rd2XYbanSEN
 uO7kdJiBeQ3xrCzzBnPL1xEqeoxBKMA=
X-Google-Smtp-Source: AMrXdXuxkjXQK0ml/IbwDCU5IkkOhUlJqLdfsiu1dvl9FabVE93vT3Hegro3EJpotavzZRbpVXW8pw==
X-Received: by 2002:a05:6000:1707:b0:2ae:d9e2:7c80 with SMTP id
 n7-20020a056000170700b002aed9e27c80mr12601652wrc.8.1673205252437; 
 Sun, 08 Jan 2023 11:14:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm6757714wrz.56.2023.01.08.11.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 11:14:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:14:05 +0100
Message-Id: <20230108191405.9608-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NN8TTUJEE4yjpZySOZPOebU1NFduCDYQPCRKYLuAdNQ=;
 b=lx3Fh+g9W+ZGBII88vWy0zXaO9lP+YtD+E42OA40lTFFyBjTe07ivyO0WfUZeZmShJ
 yv2lmm3B/Vfd83GSbTrjemwjbQfuvusPttuWW0B/CUSniqKk6YLtstVKmHEYzpp4D9L6
 +MGpBNYqCoXju25dDByxGEPHRLl0QK5Dap1VdA4DQw+V1aUAypn/vqjA3LKyeZ1c+8/Q
 zgHcSyYOKZ0kKlEPOUYFBCpQfp5oyDdssA+m6zoPqBk0QOZluvLLLs894DXJh0E66mxc
 jIL7WJJvJ+f0eHdoTSatDiH6CZNAvmjONptLBl1++2+c2yh8+55qhJhh8sVILVv/Dl82
 TFMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lx3Fh+g9
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix legal info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4aca99f51cc97cfc3bcd3affa65f4694004dd444 forgot to update hash of
COPYING file and add hash of README.md due to the following commit which
moved the introductory note about the GPL from the COPYING license text
file to the README:
https://github.com/wireshark/wireshark/commit/d2b6b89b94bd3e18520c472affae9cd4a03283e2

Fixes:
 - http://autobuild.buildroot.org/results/aaed32b55cc56beb32152ed61ac9b7f69d3ebef5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 3 ++-
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index ae06ab09b7..e9026b8caa 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -3,4 +3,5 @@ sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
 sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
 
 # Locally calculated
-sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ee3d6b1905..e2a424ef0f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -8,7 +8,7 @@ WIRESHARK_VERSION = 4.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-WIRESHARK_LICENSE_FILES = COPYING
+WIRESHARK_LICENSE_FILES = COPYING README.md
 WIRESHARK_CPE_ID_VENDOR = wireshark
 WIRESHARK_SELINUX_MODULES = wireshark
 WIRESHARK_DEPENDENCIES = \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
