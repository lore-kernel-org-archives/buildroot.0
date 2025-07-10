Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382ABC83F22
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EE4410D7;
	Thu, 10 Jul 2025 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joG7KtSttyeu; Thu, 10 Jul 2025 20:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B1E341022
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1E341022;
	Thu, 10 Jul 2025 20:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C109A114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7B0040B3C;
 Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-qTGd5Wp57h; Thu, 10 Jul 2025 20:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED89C409E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED89C409E4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED89C409E4
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1357413f8f.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178987; x=1752783787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BZHrvN73tpTX2khDfHWEyakYk4uNYa1mZTLY3uhAFrM=;
 b=fu2YgzhhERnhEp07flCMsz1mjLXqWmh+mLSws4M2uZiqoJeAuQDV67bohV08ecyugi
 ulAUbbRlHdaq4qYMwuW0BT5QWg7TQ4+n6IRKM+v9CD8mZgOQcozqE9sHEWix7963Mlm/
 s2tXavRAoCK2mzl7RmqeNJTXhDjN/Pg40jlbNn/pZ63q4PaGs2n1Xa5fVnBJQgbpX3XX
 MAKSLGNw92/JM28vAsRoy5H02ssEimFPywy5aJ0mobNjIKkzK5POhoCis1D6v6R6iXl3
 gIL8JsR4FOkGRETh8vSvNCRyeFSjXoEwjuiJnadOPZAealVtwarIwDzfiHlMjpQR34eQ
 416Q==
X-Gm-Message-State: AOJu0YzZ7JMTtc7QcxDYH4T45Lar2uXMYArGpXZ33/P8Cji7O20a5Hgy
 +qKQIKS+V/ZpGBUiRwMiM23Vskvm+EcG4LvtdVksrfndKhmf4m1YpRMN7wDaIw==
X-Gm-Gg: ASbGncspZKau89u5ZZH63BVeoxWdYLgRf7hrWEhrhmJ9xz4B3l9u/GCKVcCeX1MJkn+
 bK9MU//bp+ghLPBD46B1fvJ8RJApydzkHm3BRNUIKMnPUCm9YFImcISUzKS15r4rp2hqqhn3G/6
 zhTm7v7CkJxfEe+IrZ5pnwkcsH3Fqn3FNNzliahucsDTryfSekKN4W4khL31n+YkvS4K2ToSMi1
 +4pwXJKDhfjiGz2kghNiKnaCP+POuCGxhueWV2KxrCtJEtfh2ZeD1Pbu3wESaXNXCinxcWj3/B7
 zW1gQgRa5cmXdWVmex5bv0EXjXfZN/bRyO2Jw+lQ1Sm5H0c0PPqQlCV6xNBofV72d4+Q17pi5sq
 kSDxDx0Y=
X-Google-Smtp-Source: AGHT+IEYaYi28+L2U2uzQhJbHKdN+uKPPTNwGj+jYM0itFWRpy0KA2j/3pPphWfKgC2MOtosNXEa4w==
X-Received: by 2002:a05:6000:2c06:b0:3a5:287b:da02 with SMTP id
 ffacd0b85a97d-3b5f2e26c3amr66689f8f.40.1752178986957; 
 Thu, 10 Jul 2025 13:23:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2025 22:22:54 +0200
Message-ID: <fd218eeee0cc449dc1967c2458e06c892943f217.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178987; x=1752783787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZHrvN73tpTX2khDfHWEyakYk4uNYa1mZTLY3uhAFrM=;
 b=O8swIRTr/a0pl7q5dj6EvIiDMkMP/suZHP2JKPDfHAUSbHUsexZEG9h0MjFn1P0fPX
 XRrQsQHPB+y+IB11luA9+2PtuSYD0OqhMnWgxnR8rUs9cPaMRzkZHzui0KyDWEXTzcgb
 Otpx5P3cmt1nIEaNGOPexx1SlSirEhPw3BeDJxfMn04JMQXo7amT5J9KI6Y49flBY9c3
 8TFXQ0dUIh9vr2TjJOnOVRR2bshn+S6P/3hcd/ORSy5ZchCMOOuZkd8n0P0DCe/ztfU0
 po/XhU42c2rJSIxI7k3PbSY8U3VCztTdR8NekYW598IcHX+IFV1fnrn8OYQWk5ZCf+f/
 tycg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O8swIRTr
Subject: [Buildroot] [PATCH 12/17 v2] support/scripts: reject skeletons or
 overlays that are unexpectedly merged
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we partially accept that a skeleton or a rootfs overlay be
merged:
  - for unmerged, we accept all kind of situations: unmerged, partially
    merged, badly merged, merged-usr or merged-bin, arbitrary relative
    or absolute symlinks, and whatnots;
  - for merged-usr, we strictly require a properly set up merged-usr,
    and we refuse a merged-bin;
  - for merged-bin, we stricty require a properly set up merged-bin.

The unmerged case is inconsistent with the other cases, especially it
allows for arbitrary symlinks that may point to arbitrary locations that
may even not belong to $(TARGET_DIR) at all...

We fix that by ensuring that the skeleton and overlays strictly adhere
to the merge-level of the configuration; i.e. for an unmerged config, we
require that the skeleton and overlays be strictly unmerged, that is,
/bin, /lib, and /sbin, and their counterparts in /usr, are actual
directories.

Thus, for all three types of merge level, the skeleton and overlays must
match the configured merge level.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-merged | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index fbda49f1c0..bff6ae2b7b 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -3,16 +3,21 @@
 # Check if a given custom skeleton or overlay complies to the merged
 # requirements:
 #
-# - for merged-usr:
-#   /bin            missing, or a relative symlink to usr/bin
-#   /lib            missing, or a relative symlink to usr/lib
-#   /sbin           missing, or a relative symlink to usr/sbin
+# - for unmerged:
+#   /bin            missing*, or an existing directory; not a symlink
+#   /lib            missing*, or an existing directory; not a symlink
+#   /sbin           missing*, or an existing directory; not a symlink
 #   /usr/bin/       missing*, or an existing directory; not a symlink
 #   /usr/lib/       missing*, or an existing directory; not a symlink
 #   /usr/sbin/      missing*, or an existing directory; not a symlink
 #
 # *: must be present for skeletons, can be missing for overlays
 #
+# - for merged-usr: all of the above, except:
+#   /bin            missing, or a relative symlink to usr/bin
+#   /lib            missing, or a relative symlink to usr/lib
+#   /sbin           missing, or a relative symlink to usr/sbin
+#
 # - for merged-bin: all of the above, except:
 #   /usr/sbin       missing, or a relative symlink to bin (thus points
 #                   to /usr/bin)
@@ -119,9 +124,9 @@ test_dir() {
 is_success=true
 for root; do
 	first=true
+	test_dir "${type}" "${root}" "/" "usr/bin"
+	test_dir "${type}" "${root}" "/" "usr/lib"
 	if ${merged_usr}; then
-		test_dir "${type}" "${root}" "/" "usr/bin"
-		test_dir "${type}" "${root}" "/" "usr/lib"
 		test_merged "${type}" "${root}" "/" "bin" "usr/bin"
 		test_merged "${type}" "${root}" "/" "lib" "usr/lib"
 		test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
@@ -130,6 +135,11 @@ for root; do
 		else
 			test_dir "${type}" "${root}" "/" "usr/sbin"
 		fi
+	else
+		test_dir "${type}" "${root}" "/" "bin"
+		test_dir "${type}" "${root}" "/" "lib"
+		test_dir "${type}" "${root}" "/" "sbin"
+		test_dir "${type}" "${root}" "/" "usr/sbin"
 	fi
 done
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
