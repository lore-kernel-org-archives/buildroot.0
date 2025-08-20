Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE62CA0EED
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 07:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8848827FA;
	Wed, 20 Aug 2025 07:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xleLFZltHkn6; Wed, 20 Aug 2025 07:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E173D827E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E173D827E0;
	Wed, 20 Aug 2025 07:11:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45EEDDE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 07:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34793827D9
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 07:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9LsiFAzD_Q4 for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 07:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 204EA827D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204EA827D2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 204EA827D2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 07:11:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 549309254; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 Aug 2025 07:11:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uocys-00EXiz-2D;
 Wed, 20 Aug 2025 09:11:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 09:11:19 +0200
Message-Id: <20250820071127.3466191-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250820071127.3466191-1-peter@korsgaard.com>
References: <20250820071127.3466191-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JAghBQ8diCBo5caroeEUmiPvPlYS4Qt/LxacKKHZGxseugwDsw85b0BFdrK3Q+Q6D2Iev4qs3xv9BCU8S8SNQbHhrJGW4EBcdLXtxiv80eEeHWWHUmFOycrwT+VNmF/paR+1iKARSFAqEATTY4bmIwQ+KruH+V0Se2+88Nb9d76/NsSWD2Y+QBXWQWIKo8k/4/Ya1uCOCgd5n4YAjD/6LlBEeIJAJNwtrKWICGnEn8qqxyetG80LuaD4xSgHTXIfh5AZKxkIpSbZDNahOr1xY958P/0/3NoTe/iXWp79dfPF6NN1ZwAfVjRLsO+Ixm0t+cEX99Fga92GIa/OV0rhpw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=uyA94gchIdQWbJwHpWukTlCihh9gabVWsFoWjtGPEAI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=JAghBQ8d
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 03/11] package/gst1-plugins-good: security bump
 to version 1.24.13
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

Fixes the following vulnerabilities:

- CVE-2025-47219: An Out-of-bounds read in the MOV/MP4 demuxer that can
  cause crashes or potentially information leaks for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0004.html

- CVE-2025-47183: An Out-of-bounds read in the MOV/MP4 demuxer that can
  cause crashes or potentially information leaks for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0005.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 0c5192c515..a8b17f3d0d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.11.tar.xz.sha256sum
-sha256  94bf3b5118dd4213af66048faac830569cc9a94a8c8e59e8a6d33b315f518462  gst-plugins-good-1.24.11.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.13.tar.xz.sha256sum
+sha256  574ac6f9fd84b32eb04e80572391d6762df6f9802a47bc0386cd6cc48c14d08b  gst-plugins-good-1.24.13.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index a7ab9a0326..cd1b9f45b9 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.24.11
+GST1_PLUGINS_GOOD_VERSION = 1.24.13
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
