Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FFFCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1562560B6D;
	Wed, 22 Oct 2025 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9b_0lxZcnG1; Wed, 22 Oct 2025 16:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2118E60A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2118E60A7B;
	Wed, 22 Oct 2025 16:32:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D371543F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA90440888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxoVuL8T6ymt for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B40A440083
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B40A440083
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B40A440083
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:32:30 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b463f986f80so1376683166b.2
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150748; x=1761755548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mr8VsPow5fVJVotXCbh8OlJOjDsd/PUUoVEj4ShQ2Uo=;
 b=N5/6dSXbUM5WMJWBtFjVdWxSTr2dLe8orstHAbu1KDyvxxUeVxi9vkJI+7E5P4/Rmm
 x7oEgGhj6OWaQS7DrWxMHDLTRhFXbypdHxuhaZ9GYs2jxuI81xlF8T9+RD+q6dYjNx9M
 poFMefOwkTbaF8eNelKsa06SC8Z94cPr1IE6DlZnrA9Xn4+U/9qcYIgmarcDrv4WxsD1
 1yKDIhJ+y6+OJvcGRl7iXNHSjRyxv6E3m881M7Pu21zp2mMebP8RYKyPUw7cnqZdppnf
 a+ZXV8cCx2nEBgzhz/xi0d4try1rfFNPCAf6m9NhbFuQgY5Qk8lJgmw0OfKnBFqhwmHy
 pNgA==
X-Gm-Message-State: AOJu0YxxVY9HqCmpSUPN5CYjzaX2KijSIkHrXHRcIrMEcMQ5rnFePV8D
 p2H0XJ8phlhaEkrJb0+9aP6tDRTf0/M/VDl6xBr+uiA4iXquvBemmxgPLXvguWGoNBicSsMd0u/
 P69ak
X-Gm-Gg: ASbGncsEqMg3IMZjdqQa1efuMQ15Z83RCQCBroeuZL8z2pWBOL7MGsSvOIRRZHgZPse
 GZCGK4368ahsOomQ8ZRutPQVRtsczSgxGE8IoS7gwle1siNPpVk4bpTYtDuDAleG0S5V16PZjH9
 kaS2SAlX4pPTTC0ogbbo0nbFv9fYj/j2Mrh+jTYy7J/6ZmqYEA0Gq8CDXlH4K+ZTeI18EsDcyTW
 DE/4BUKL/eRtg/QxbmmtKvzHlBbVx9oBuDkxYtaS0G7jGSOheNsHxYkAJzlkIMe2Zk1kfX5PKq3
 MAGrijXX55+uYctYi6SclQzuCswsYZSJmE7vQ0FgOhYCRTh/uxM/j7ODGP9F6lH4wm+3WaMUC3s
 fVkjfCq5qYJ30FO6Dz1MKvbzMlq2K3oRit5a9HzuhFzjl2B/kQz0FBx4BMiq9zdFAoYTeR3NzhP
 ZbRd9AmKg8HRCsfT/GzvHALXKzTIFer6m65ciOng==
X-Google-Smtp-Source: AGHT+IG/pUAGrJCGfLgfPkuOTR+gAr802RwyLgEmFZHq9Ez6s/iTwg23teuzpyaChmun1luogLUVXg==
X-Received: by 2002:a17:907:c0d:b0:b3d:8fe0:536d with SMTP id
 a640c23a62f3a-b647304515fmr2611635466b.15.1761150748531; 
 Wed, 22 Oct 2025 09:32:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3b4f48cfsm103947966b.41.2025.10.22.09.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:32:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:32:25 +0200
Message-ID: <20251022163225.18079-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150748; x=1761755548;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mr8VsPow5fVJVotXCbh8OlJOjDsd/PUUoVEj4ShQ2Uo=;
 b=dTZRQxExu5TRWJmjkTxiLnPxf0xqanzQdpRpsWYwgi/dDurpQYqUMGxRrhTR24z90u
 mKtHTFBZAbOWCppNzM4AQNaZXyKA1Kq2/XviVI9E57z0MVTXNSMV0VBdOa1MGpKT9fGJ
 xDyJ57r9ikb8eP+4PqS8GUnuUma2ol2sJAruI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dTZRQxEx
Subject: [Buildroot] [PATCH 1/1] package/libglvnd: bump to version 1.7.0
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

Release notes:
https://gitlab.freedesktop.org/glvnd/libglvnd/-/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libglvnd/libglvnd.hash | 2 +-
 package/libglvnd/libglvnd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglvnd/libglvnd.hash b/package/libglvnd/libglvnd.hash
index e463a8def5ec..a1a3f2614a5f 100644
--- a/package/libglvnd/libglvnd.hash
+++ b/package/libglvnd/libglvnd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c4a884503d2412dc1fa209613aa8a77193aeb7065b823fe1775dc8b6f3e45211  libglvnd-1.4.0.tar.gz
+sha256  13ae5bb99a5a2869fbe00aadb49b21fd9c13dfbf59844b0f88d521098094d44a  libglvnd-1.7.0.tar.gz
 
 # Locally computed hashes for license files
 sha256  f84a3eca98cc5bdf5318741124c38c5e877f856df8c7e229ee5065e5c61038c2  README.md
diff --git a/package/libglvnd/libglvnd.mk b/package/libglvnd/libglvnd.mk
index 95ac19dd91e7..6e375e2e6356 100644
--- a/package/libglvnd/libglvnd.mk
+++ b/package/libglvnd/libglvnd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLVND_VERSION = 1.4.0
-LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/uploads/ca5bf4295beb39bb324f692c481ac8a1
+LIBGLVND_VERSION = 1.7.0
+LIBGLVND_SITE = https://gitlab.freedesktop.org/glvnd/libglvnd/uploads/c24806c283070dc70700234ca8ffacf8
 
 LIBGLVND_LICENSE = \
 	libglvnd license, \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
