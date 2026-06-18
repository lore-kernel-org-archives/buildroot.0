Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C79CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 01:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC04809E7;
	Thu, 18 Jun 2026 01:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzLN_dQAQKOr; Thu, 18 Jun 2026 01:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABAD809EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781745828;
	bh=J8lXRR8GhTAEHMF8xvE3B/+2fiM0Ejo0RDI4W1q13CU=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s94XBdgyvPAcU9QbrlS9x2+WA9s07N8XuyBHphXoUUKcXtB+vKDEe1iPjLndLhWej
	 JB5NBGJQ5/vqslOOXQoTSs8oi2pUzcKg7YCEFVqVO5gx+fg2q/vwFYybkchO8N7N6E
	 pi4SgqCnLWkhpbFlmvN2KGqF4H2orT/I7lKUodxXmADPBu6gUM6GtghhDvIeq1lJMV
	 0Nn6qZjtypcxEH+yIom8oApoUToe7KsvV7mgStLaijx43ihKV5g8WidK6QNQzG2xW2
	 NLMxH/cYiJcpEbs+k29idmqBjkMmF2u7L6PyVM/aKKEWd45aWcp75NAN2R+h7q6M3o
	 2slnkZAvaOiZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABAD809EC;
	Thu, 18 Jun 2026 01:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD31D131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE79741143
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjZwiseGo7Bo for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 01:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B294B4113F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B294B4113F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B294B4113F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso2281925e9.3
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781745823; x=1782350623;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6dbjc8qFjf5ocTrR1A+QaCPS78AmXliBD/03jSZ2ezo=;
 b=m4rH4nPscQ+NJfG7+8uymfYOvUMgpsb/ViZSESYUVumz59f/Oc2J5ebofs85oKoyVn
 tWug8GgG66DPm2WozBJp5DLoHuF8JuhWIofFE1Em412zgM4Qkx8gWshXjSWaRzKx1t0r
 GVy3BnY6ui54trjM7GsFzlpYYdAdyJFL1xIEdZv4JEJV1VU7EC2vuUrZifDxK73KZqCW
 ZOJ6jn6u7kYS+mJCw817L4Hu8+ygCDndOF7+3zvO07W9xI9L1fu8fuUbtNmJgIW+LCiC
 OeXxqDlfjUZSebYSA8eKrjNUIQUEgo4szLIBNudHD2ovTOasAdmgTwXGVveRNn8LkcfG
 QAfg==
X-Gm-Message-State: AOJu0YyTCkYcxeOJkFkiOwzvgDHw7BcCGpMrI5bC2+iwS3B4Au1bqjkF
 GWtxODUfcR0geq/5ndfRgebUjBdyYnCRmOqeU0FQj3YE0nclVr0Ny7inn4DnsgmbKtg=
X-Gm-Gg: Acq92OF8nCBTHGAaP6KrotOYOAIvcIMqh4wYsPTa2hHCejwWFeQV2/IZwg4O0r+iGC3
 SwvYXHCAlnmtDxKfC0WXCIpOPTe0OjCwe+u0nf2ZEGa+rX/utNBqfGHM/rdKcS9FGKdfV6TV0/O
 keUB4Z5NfzPbwkZ0jdEPOAsFmsJdOa2makcCuiYAYMYtz3ulunutrzolH951+I3AfPLsNKCfW1N
 zBeUsNhrG62wAdk3K837ZZg/awBFrl9403gjFOdMNV7KjYKrZtCVucjhS6RJLQ5JZwq6RZUEArL
 FZIdFZ0T+lqs6BfMhOifRP38xmu7/4QkYsn3fot2bFDSKHIblSG/qbeWCJcCNdLT+6rV+g99m0D
 rKxN2CLBQl28u6Q1w62XSNkSpAtZj7tFORXytGwIPBirLDj7paxUbj0Mrt17xkO6P7JVnfcLrVH
 tBl5J+xi5hdj44SqmD6VjW1Aj8wUhjuvbSQ0tpdNKFCN++EEHfZsTNoX1uQtL3TOE6oLsOjBfZD
 iJUaW7gpDzvAiaGllrquCpNWdQGFSr0orpg4hm2ncYNjkyjKG64l3/XO2+Rq5Kw55i76M+IHcLU
 YlsTmtTsLNkXkM5ElwiLQQj1UDvxbq9PNgydFouvJ2FZcxDPcM4yy2tx6wQ=
X-Received: by 2002:a05:600c:4715:b0:490:b446:fb8 with SMTP id
 5b1f17b1804b1-4923a97f870mr426685e9.11.1781745822561; 
 Wed, 17 Jun 2026 18:23:42 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a0e9e4sm189017175e9.0.2026.06.17.18.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 18:23:41 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Thu, 18 Jun 2026 02:23:30 +0100
MIME-Version: 1.0
Message-Id: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-2-65fa5eb2acf4@gmail.com>
References: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
In-Reply-To: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3714; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=vN1m7L/pAaGip2tLk7YQUKdKqluPLPu98Q6PbTVE6eY=;
 b=kA0DAAoBY03E8GhwRvgByyZiAGozSJvI+gElhEoFinfGpVCV/bw0pOcElw5tU60K3CH3HXiVz
 IkCMwQAAQoAHRYhBPGL3ItsJfkKoj1RdGNNxPBocEb4BQJqM0ibAAoJEGNNxPBocEb4ZFoP/1eL
 13C84xKF1K01+qU7OKcp83/l5e4eTcy3DbJLljLkrbfGzLIO3n5pESu4SBxwAhlqoXhqwb8/gr5
 XP3uaTRbKmE0Gee15FX+4lsWQ1qRgU57lyewMbFoEv8rE2Oq2m12dj4FG5vKDQFhb9JOOyK01RG
 mPDsXJ7K2kqkIYq6LLaN7Y/lMj3L1PzptRbuxhq3KPivwhLcyfo/3xwS/K4dvFBbVWyt0ornFLQ
 08HS31hpdvNG7iWekJpq2x0zhtvsbcmpZwl0NGN1ISrVMKyHxyYmPp5dSdCZXlz5sTLwBmXBhve
 s12VvHDYol7tndkimtUxuN1MjUqpEwdA8GGFAQzUMs0AidpRJT0PYm5ibU+Iu+Au5s9liCgDPxg
 1xrK2zV/N6IQl/xAi1tECTluVg3iKzdgQN7HBVWTYcwRo4XDxTVlZGYS/OA6FtqL22YseQs18g0
 PcYpZzK3GKjtUMTnRFqt5Pj0PLDinTL6lWpU0E51Vkdu7lWlm2LPdWBGuYChN6lpZVQHy/RJZ36
 9KD0tc8xeJWOcnyrR7aTCNWzDPPiAWoPYMvQeoKdEYPQmR5ZBtoND4hl/brBpNt71IaVBkHeYtl
 kAS+A1p2aAeQkGu7U0dDUpUjiFGCIGXVAT7RqaDdwwfPw8z9RaYLxBnQrDCKw/xhlPBuQiEnWLS
 afYWY
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781745823; x=1782350623; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6dbjc8qFjf5ocTrR1A+QaCPS78AmXliBD/03jSZ2ezo=;
 b=SdDzvb2t8itPCnRToAhqNRalyVUYpQTxZ5oP2nVvZUS21lLGC2e9Yi+Y2nw99FOUX/
 oqe9GpC6hJivuIPwHohR5dRXWFOXab/3a7k1ZKVm9sk6xeOiIyW5tdi6vmqvT6+mfkOA
 ud63HbXP0EltAN6cf0PojkkQ9ba5BYM3FlV4gcnU6Vso8bhDjP/9i3INKuSxxOPF5ooy
 nI03nnuTfTjDkwcE+lLWKPR7KITTAyofpotF6xfm3FsUs3IAxdDQv56HncDUCsCEiIgb
 UTQo6HU6jksnprL7Y/OPx3aV48sFNmnUZ+tNvGLV9L8NH3QO/ydsAgMOw2ATeMHHkNir
 DJ/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SdDzvb2t
Subject: [Buildroot] [PATCH v4 2/3] package/osslsigncode: add host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

osslsigncode is an OpenSSL-based Authenticode signing tool for PE
binaries. It can be used during image assembly to sign EFI binaries,
such as bootloaders or unified kernel images, for UEFI Secure Boot.

Add osslsigncode as a host-only package, since its main Buildroot use
case is signing generated artifacts on the build host.

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/osslsigncode/Config.in.host    |  9 +++++++++
 package/osslsigncode/osslsigncode.hash |  3 +++
 package/osslsigncode/osslsigncode.mk   | 21 +++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c77d02afc..8cba141a77 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -708,6 +708,7 @@ F:	package/perl-x10/
 N:	Christopher Obbard <obbardc@gmail.com>
 F:	boot/efibootguard/
 F:	package/dtui/
+F:	package/osslsigncode/
 
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
diff --git a/package/Config.in.host b/package/Config.in.host
index df57cc0c17..2b88adbaf3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -81,6 +81,7 @@ menu "Host utilities"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
+	source "package/osslsigncode/Config.in.host"
 	source "package/pahole/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
diff --git a/package/osslsigncode/Config.in.host b/package/osslsigncode/Config.in.host
new file mode 100644
index 0000000000..6606402bcc
--- /dev/null
+++ b/package/osslsigncode/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_OSSLSIGNCODE
+	bool "host osslsigncode"
+	help
+	  osslsigncode is an OpenSSL-based Authenticode signing tool for
+	  PE, MSI, CAB and CAT files. It can be used at image assembly
+	  time to sign PE/EFI binaries (such as bootloaders and unified
+	  kernel images) for UEFI Secure Boot.
+
+	  https://github.com/mtrojnar/osslsigncode
diff --git a/package/osslsigncode/osslsigncode.hash b/package/osslsigncode/osslsigncode.hash
new file mode 100644
index 0000000000..2564b5cef7
--- /dev/null
+++ b/package/osslsigncode/osslsigncode.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  ee95638b8bec0c019ddf28cb14988645abbd180dcd017536338b7d0d5eaaea96  osslsigncode-2.13.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.txt
diff --git a/package/osslsigncode/osslsigncode.mk b/package/osslsigncode/osslsigncode.mk
new file mode 100644
index 0000000000..b8843a25b4
--- /dev/null
+++ b/package/osslsigncode/osslsigncode.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# osslsigncode
+#
+################################################################################
+
+OSSLSIGNCODE_VERSION = 2.13
+OSSLSIGNCODE_SITE = $(call github,mtrojnar,osslsigncode,$(OSSLSIGNCODE_VERSION))
+OSSLSIGNCODE_LICENSE = GPL-3.0+ with OpenSSL exception
+OSSLSIGNCODE_LICENSE_FILES = COPYING.txt
+
+# osslsigncode is generally used at image assembly time to Authenticode-sign
+# PE/EFI binaries (e.g. for UEFI Secure Boot) so only a host build is provided.
+HOST_OSSLSIGNCODE_DEPENDENCIES = host-openssl host-zlib
+
+# Upstream installs the bash completion file to an absolute destination; instead
+# point it inside $(HOST_DIR).
+HOST_OSSLSIGNCODE_CONF_OPTS = \
+	-DBASH_COMPLETION_USER_DIR=$(HOST_DIR)/share/bash-completion/completions
+
+$(eval $(host-cmake-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
