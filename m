Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB988C77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9056D813BE;
	Wed, 19 Apr 2023 08:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9056D813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sa0x4iUYVdPy; Wed, 19 Apr 2023 08:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7516813C4;
	Wed, 19 Apr 2023 08:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7516813C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5D8F1C432C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA80141E7C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA80141E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubPKGbTB0dGi for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D029540527
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D029540527
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-32933a4af12so36285425ab.3
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893115; x=1684485115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZ3nO2vLQnik9QJylVCLe/oD8npumwD7Uosfvlt/45I=;
 b=JQWA3LRR4Wrbnj+Fs911uSC3t/qfNhrIZn/Imy8vOCRno4lm/1mnis0ovmCfWSMe6s
 jyD9dI00cc2orsy2ePoIWJY77cIdx4NjAUaQ6UlA/YNwPLPAY2Vo3NpGMuSotqKtzcNT
 XBkjWWraxhP8WIuybakAqZzPW7hahQtsoHU80oTpTZnyACvfl5J1LF0ZrQi7lFpLa/iI
 dDrsqgcl4SQ/X2c7DmqOSvinpfqgEgC+YlBOFaq/RAFM4/UMf4a4AYhvv5BP1KAmFmhJ
 yJLCUlf4n1UHI2ML2lN6dYEvCeOy9QO2kvIqY9+9nDHmbvMoFCwOi4y4WhAawOmlowaj
 bv8A==
X-Gm-Message-State: AAQBX9dvtow3T5GmcKCFdJ70g1YfqyFIt2C01fLXQaucnpTF6Rs5+CDF
 JQigw6UaxVhNnhNoy21n0rFhH3O+Tl4=
X-Google-Smtp-Source: AKy350Znh6K5FGI8MM6/M74kE6sfYDlh4EEseVQQxp/ytM/00WnZVCPUxSc8/tV2Ddt13rznE2MyVQ==
X-Received: by 2002:a92:dc0e:0:b0:32a:9bb1:1f78 with SMTP id
 t14-20020a92dc0e000000b0032a9bb11f78mr12974583iln.17.1681893115270; 
 Wed, 19 Apr 2023 01:31:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:43 -0600
Message-Id: <20230419083144.212921-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893115; x=1684485115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ3nO2vLQnik9QJylVCLe/oD8npumwD7Uosfvlt/45I=;
 b=gEJHpvhN5q8YG/tyqL+4CDDOmD5xysaetC2n7ZjxI4RIQrGcusDRCZOMbUgGGntjSd
 5HblUJaHkzEfr2kgfV0MogGEEqoLNnW+rOlfGUFfT0WZ6kGagiHFj12EBkrjMdr+D+/t
 OCN1Zi7WJdoZpnAejQy7t1p0BRRPvCqf/vCsjz+gB4dTTRsCVE2TrGtIFoZRJOXm9LW6
 cdoFT/vnMkAKTdVwqvvzuh4cMH2wltdXZcpfKO8N3+Dyi4sZhHs8APvBaKThhFi2S/pY
 2gnz5nYeKPcbTjhLBYdMhL49L3SG9vZxJbPzc7PIqo5VIq89fBxaBI5c2ilI11Jhv946
 EABg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gEJHpvhN
Subject: [Buildroot] [PATCH 11/12] package/gst-omx: bump version to 1.22.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 51ea74a0cb..d4a95c631a 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.0.tar.xz.sha256sum
-sha256  dbc951a99af532380e599aa8acd9e1385fdb299b46b5868cd2be4230ad888341  gst-omx-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.2.tar.xz.sha256sum
+sha256  1b0c57f2cc4ddeec5e7f0c436e502f06665c4e93c73261855b94e04fc94337b2  gst-omx-1.22.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 6f7168279b..87f162f715 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.22.0
+GST_OMX_VERSION = 1.22.2
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
