Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14105C5472C
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 06:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EFC809EC;
	Sat, 24 Aug 2024 06:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMFbYz6cTNsg; Sat, 24 Aug 2024 06:08:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4A281EBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4A281EBB;
	Sat, 24 Aug 2024 06:08:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A10591BF349
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 06:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C61F40135
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 06:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3z4AkN433nr for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 06:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC189400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC189400FE
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC189400FE
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 06:08:02 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ef2c56da6cso24029071fa.1
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 23:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724479679; x=1725084479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KhPWqlRcxicePhLVPe0VFbGtFzrIIzulOK3wIRzTV7o=;
 b=piX6sDLqntH7Aj8r55m3HCxUEayaxflZJ6huJipML0olclzi0XCcfq3YiB3Ggb9nSA
 I6/3WWZdnG2R/xyf8XTaxqaGReakc2xX1SKHwwT3s2m439bJmJ3hOACV9x7UojGeWVWW
 xXSaFLm73hvSHaaJnDHovhha9tqkeQr7gF36px8BgyO94x8SvC5G3By/DB1YGeSFUpl5
 BBTTq96muoIWHWvhDQ0Rep5OHwWtWya0+BV0GWHwixpk5apOK53RCU4am+aiqv4rIqWe
 ghjbrjRf2279Q639musv0O3r5IliVZkT7WpfzMDlTpA5s6dnbp7YZutd2aQ3VBJQMfSV
 IPdw==
X-Gm-Message-State: AOJu0YwsVoqwy4IAis/SJ8pvEvc5SLdMcn9R+Q2QBGsvevmDElZmPhfF
 tZw/fyW/NoTee/ttlyUOzgfuXLwQfVPxqhYKIof8JTphyiDjVUsDbvlaMOEI0aGQKPVUrzrBnc+
 +X/Y=
X-Google-Smtp-Source: AGHT+IE3JLsA+qIo8jQKeRXebzFf/2ZZUpsoksq+Re1p4ngqCdj4OYpcYPEbKHYMiKDeCqF2avBzNQ==
X-Received: by 2002:a2e:a992:0:b0:2ec:6639:120a with SMTP id
 38308e7fff4ca-2f4f48f0c00mr28317311fa.10.1724479679175; 
 Fri, 23 Aug 2024 23:07:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3ca798sm2898621a12.32.2024.08.23.23.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 23:07:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 08:07:54 +0200
Message-ID: <20240824060754.1929956-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724479679; x=1725084479;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KhPWqlRcxicePhLVPe0VFbGtFzrIIzulOK3wIRzTV7o=;
 b=TlMj/gRpcmzSPsAo6eBMvSTl6guFz1SYQg6HeunXEQ8ZkqN/F6rUaTwE6Iv2LwCjRn
 51ymm4SA+xdk1kVY5ns81WoFIyhXnelGMJ5rWyvxtZwczGrbTBeiyNgbiRhthsM7obCL
 4nIWsoFf+DRozWsfH+3YEJ1nboaRkD3+389HU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TlMj/gRp
Subject: [Buildroot] [PATCH v2 1/1] package/libcuefile: fix build failure
 due to implicit declaration
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
- http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v1 -> v2:
  - Add Dario Binacchi's Signed-off-by tag.

 .../0002-libcuefile-fedora-c99.patch          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/libcuefile/0002-libcuefile-fedora-c99.patch

diff --git a/package/libcuefile/0002-libcuefile-fedora-c99.patch b/package/libcuefile/0002-libcuefile-fedora-c99.patch
new file mode 100644
index 000000000000..3f76dd315c7c
--- /dev/null
+++ b/package/libcuefile/0002-libcuefile-fedora-c99.patch
@@ -0,0 +1,27 @@
+From 7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19 Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Thu, 27 Apr 2023 17:24:58 -0400
+Subject: [PATCH] Fix C99 compatibility issue
+
+Related to:
+
+  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
+  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>
+
+See Also https://bugzilla.redhat.com/show_bug.cgi?id=2190307
+Signed-off-by: DJ Delorie <dj@redhat.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://src.fedoraproject.org/rpms/libcuefile/blob/7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19/f/libcuefile-fedora-c99.patch
+---
+diff -rup a/src/cue_parse.c b/src/cue_parse.c
+--- a/src/cue_parse.c	2011-06-18 07:28:43.000000000 -0400
++++ b/src/cue_parse.c	2023-04-27 16:10:13.314263314 -0400
+@@ -1513,6 +1513,8 @@ void yyerror (char *s)
+ 	fprintf(stderr, "%d: %s\n", cue_lineno, s);
+ }
+ 
++void cue_delete_buffer(void);
++
+ Cd *cue_parse (FILE *fp)
+ {
+ 	cue_yyin = fp;
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
