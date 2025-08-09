Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103DC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22FC481A2B;
	Sat,  9 Aug 2025 17:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6nYN6grinOG; Sat,  9 Aug 2025 17:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638D881A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638D881A58;
	Sat,  9 Aug 2025 17:32:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC58831
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C2F840AB5
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeBYEYEtvrBE for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1589640B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1589640B08
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1589640B08
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:32:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so1896754f8f.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754760768; x=1755365568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y/S3A/a19HqwNLTKTzBfHjglyPch1UYxcBu5JeiZW1o=;
 b=LJuOadFsTVELa4PY/IkhW4Z25EK298XC2bysRMUDvE9HKDI1g8DWrsx1L0yLWkYpYr
 hjCZJCmhfTBCK74kzqwoLO26TJhpmVHE4Dx7vuwTgeySAQ/WtT8JffH3NCJvSu+0/WL9
 ZbOBeJGvWrsOBTypm5RQb+op1ZfX55ChLEB173Jp4ClVdX906tNfCYFWIG/EDO0p/qlS
 JH/2wUQgse6txT6I16ZlurfsG/cTZvXlPRRVVixxvdSPJ41TxaWaUEJcl3TTTr+2SBGi
 fsIMfaOSkSiDaLDsxkOnUptewF/nWNXmK1mWGyIx08n4BX4oxIVpXud4/lTCOsAxsx7r
 bZkQ==
X-Gm-Message-State: AOJu0YyJ3IvNKzr7YkmfLOP2Wyc8LRM7SqsBSX4YnjU8QfpeiHuZsSAj
 rqp6+dR2V5GByZwktjAcKuHHLXNH6gMnB7VX9K/ytUARLMRMQz98NXGHZdHsP4DokKLcpTVPhrg
 fOSiK
X-Gm-Gg: ASbGncsny7BkcK2h9RMkvGF0byY7t0kGIiAf6+C2wsUjDGChYtttUf0CGF+3BZ0qHlv
 OQZqfEDiMTH/gDqgGux9kVRiE1zZRLC8DLEgwfb5PqcrEncfMd4PqmgeRSsku2XSeIdF0ymYD2T
 fV5Pt2/yuKTf3Sb00F/17b0wX4G8x42kIZ1mIr/bUijqb/h2uPTxRkxEiq/QwPe0Bs5/MHLsCoU
 yzkDNT12okCmdZVOxlhVRlO2ChSjg/6qfLKOpJiPEVI5xm3k9uVMgpAkALHZbeF2huy21SHem/l
 5cU0agFFjkoiHipg1gLP++QY4xfm9xdUUncCeEywQIxNu7xQAklXJW5Fxwwi7SR2SOSV8f9qpod
 zJVWXL5I/LtLfc6UxlGJyl0OP
X-Google-Smtp-Source: AGHT+IElYvXpGRWBRhJQRTAkT+6NjAC835HqX1ZETuW5tLchV3C7yfE7jZrORJiX3Cfj5bjei885Xw==
X-Received: by 2002:a05:6000:24c6:b0:3b8:d900:fa79 with SMTP id
 ffacd0b85a97d-3b90092cacbmr6226617f8f.5.1754760768107; 
 Sat, 09 Aug 2025 10:32:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0683045sm25400975f8f.41.2025.08.09.10.32.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 10:32:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  9 Aug 2025 19:32:46 +0200
Message-ID: <20250809173246.304259-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754760768; x=1755365568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=y/S3A/a19HqwNLTKTzBfHjglyPch1UYxcBu5JeiZW1o=;
 b=bfyseATc/eUQ57eiTz/CkAxf9Y1hqeKVUKD3YWKS2n3I5cecw2Zm3Eg2g74GlWfqv3
 CE9gR+dEr9v2czJfg++HM58+XEWaklSgQAMVymL7+HQMD6EOKUqD+TQhDJTeyJy+CUbs
 jmNr+oJkTFbzEdDVhWao+HGnJE2DZ6YCCgblUg4tZ520Wx49BdS726QgitNhP38c7yqS
 Zdj54gKVqOsHV09wR/VAd37mtX/VknuCT8JFkfmjfR2MMhAk/dY85SX3F4fv7RWPVx4R
 I3fbukSJoPo2bw0fJl4NdD/b5CRRjY8p5MrI9ZSXFs3Fo+rZAMs9q76SRbA81kfy9cT5
 JhIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bfyseATc
Subject: [Buildroot] [2025.02.x PATCH] package/gcc-bare-metal: fix symlink
 to gcc 14.3.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With gcc bump to version 14.3.0 in [1]. The gcc-bare-metal version
was not aligned to the same version which led to the following error in
the autobuilder:

```
make[1]: Leaving directory '/workdir/instance-0/output-1/build/host-mpc-1.3.1'
ERROR: No hash found for gcc-14.2.0.tar.xz
make: *** [package/pkg-generic.mk:179: /workdir/instance-0/output-1/build/host-gcc-bare-metal-14.2.0/.stamp_downloaded] Error 1
```

This patch align gcc-bare-metal with the version of gcc 14.

[1] 1e8c1e0ef0 package/gcc: update to 14.3.0

Fixes: https://autobuild.buildroot.org/results/3a2/3a228e885cb04e0c91eee470f9622e0e44eec3d7
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc-bare-metal/14.2.0            | 1 -
 package/gcc-bare-metal/14.3.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 120000 package/gcc-bare-metal/14.2.0
 create mode 120000 package/gcc-bare-metal/14.3.0

diff --git a/package/gcc-bare-metal/14.2.0 b/package/gcc-bare-metal/14.2.0
deleted file mode 120000
index 0737236850..0000000000
--- a/package/gcc-bare-metal/14.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/14.3.0 b/package/gcc-bare-metal/14.3.0
new file mode 120000
index 0000000000..429ecf8646
--- /dev/null
+++ b/package/gcc-bare-metal/14.3.0
@@ -0,0 +1 @@
+../gcc/14.3.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index ec245db35b..a69d86057e 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_VERSION = 14.3.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
