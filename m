Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B8EC61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8154840564;
	Wed, 26 Aug 2026 12:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9wpymZHRbyU; Wed, 26 Aug 2026 12:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747832;
	bh=3MFD3Xyv2G4hxVd9SrzDRJuEFmGXDVK/vo0+nZa+SKw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hQKw+1M2nDLcxnHhegHh2Lv9L+eO8nxsPAd2FQyB+Oz/UsscDE58swwshhTwVWfn5
	 vw5XlUIil5Dd+C2S9yj+NpRkzALukOQQUIAbtKEH/5O0DMKxM2woZSJ9FKrcQ74fd7
	 rYJD/jccffoC74kl0pjHGVXsOpUDSN3drzgLALwLoza2hsSuqFTOqnE3WR9JGMYo6S
	 migAGhNdONNaAKiiDUw2xYQPZsYaERdimvaLaxjmz8S2v6LkPjHTN+Z4i5L5vEpBYp
	 CP8756ZhDleVG9viQ7V+kH3Ra81Fbg7Psgk8O4rxztn3eZuAtz6Ngtr4rl4Gqts0Bj
	 2LH5sBo2U1sUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E0640653;
	Wed, 26 Aug 2026 12:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB775396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87FEE40640
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXZpyALnC3uo for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6231240562
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a3e145e1bfso1313237a12.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747817; x=1788352617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0UBG4GieWm6LC0Rqrn9/xByuUWtXsQEFufeIAtG+D6s=;
 b=T/i1spQgdnu2lGZTauZjz2ZQh8PlH2tQFuPmPsYm+fQbMOFmILX1wrE65QG5HTaHn0
 I6vIuCux3JYG7L0TzlNT/mwu1WPaPvoX53mgiIXLJzMPv0rWP2ZncVLCCJo+QSKyfHPj
 GQEJXnwuhEMiPi5BNm/r8YSQK+h4kjmrbnvo8Don52gLo8YOSEyWXTwwVEBssVix7S+y
 awcp/9RaSq00Wm9iah6/PIi6TPNUtToUQv4O/5L2xWxbhSS0OrhZNx24Sb9QW0iTIKTV
 vxVbheom1v+G44+p4eHKBIWerKXgyJAVy7ZVkeKcdp/UR0gqbs4mnhfl0IkG1MKewFaC
 6snA==
X-Gm-Message-State: AFuF++lPxPEb1AkggxUyOfUVmP2jSzpcFlAaydWXoXDz4Tt2stLp1bMS
 l3MmFO0reBRc6s7EQF+CKv+defx+lVXL7hBQA6QCquVOaElSCJIFZX/+9F0ZVKatd/FeprANIDK
 LEMXD1qo=
X-Gm-Gg: AR+sD13pUxfutLc0ugevVJS9ORaypzCx/1bCqA2bNJ9I06R/tKhIFh36GejlmtpueJY
 fQNj58RlJsRBlNF1OgWCanvGfC4bqjXrfCgap/SF1U71GJpnng9uuKkEHGeQhSKaQ85TI9WZ8n4
 sVMVfcfvLFC1VHa70Zsq+BZSlNXNuN3fUIgX0rdPwfWakXToHUtDtPzZxr2xFDozAzVw6U0KTCn
 aczci6rymSJ3LfbUFPtLZOF/94LNGs8dFPSttCtE6PSu0Rv0Y6FOQ83pzX2Z06ywSRB/NBE5MqA
 SkoSF6DsVxxFRXFFoh4TGjw4B4tx3PjD2rxGfKfN8uHUSwsaChaNKZ+el5uKOKGAP3d2oqU4JMB
 4UPvOSJlN7XOUzO2Y5VxIwdNligVS+x+xhkUahV79IyE/hFeGc/samp3A0lNbVCUOy94r1cfSyE
 R96vgphpmS8vechqmeozhtkiki2b4vGbyrDtVRYGA9jwTMWRRbQVoeGMXJPr0l928UyHL+Ix0tv
 eEtyQ==
X-Received: by 2002:a05:6402:1f02:b0:6a5:d694:6e9 with SMTP id
 4fb4d7f45d1cf-6a5df5aecfamr9191900a12.2.1787747817274; 
 Wed, 26 Aug 2026 05:36:57 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:33 +0200
Message-ID: <20260826123637.410258-13-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 12/16] package/clamav: add patch
 for CVE-2026-20345
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-partition-name-conversion-index-103.patch | 37 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/clamav/0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch

diff --git a/package/clamav/0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch b/package/clamav/0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch
new file mode 100644
index 0000000000..e5cbceb9ab
--- /dev/null
+++ b/package/clamav/0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch
@@ -0,0 +1,37 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 28 Jul 2026 09:02:34 -0400
+Subject: Libclamav: fix GPT partition name conversion index (#103)
+
+The GPT partition parser converted the UTF-16 partition name with the outer
+partition loop index instead of the inner name loop index. A GPT with enough
+partition entries could read and write past the end of the stack-allocated
+partition entry while scanning disk images.
+
+Use the name loop index so each UTF-16 code unit is converted in bounds.
+
+Credit: Atuin - Automated Vulnerability Discovery Engine, Tianchu Chen of
+Tencent Xuanwu Lab.
+
+CLAM-2999
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/434617ed00218dacdf3274dca5279f052c3f1d46
+CVE: CVE-2026-20345
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/gpt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/gpt.c b/libclamav/gpt.c
+index c92cf6bc97..9cc05d42f8 100644
+--- a/libclamav/gpt.c
++++ b/libclamav/gpt.c
+@@ -303,7 +303,7 @@ static cl_error_t gpt_scan_partitions(cli_ctx *ctx, struct gpt_header hdr, size_
+         gpe.lastLBA    = le64_to_host(gpe.lastLBA);
+         gpe.attributes = le64_to_host(gpe.attributes);
+         for (j = 0; j < 36; ++j) {
+-            gpe.name[i] = le16_to_host(gpe.name[i]);
++            gpe.name[j] = le16_to_host(gpe.name[j]);
+         }
+ 
+         /* check that partition is not empty and within a valid location */
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index ef6d33e96d..7c643c99cf 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -51,6 +51,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20215
 # 0009-fix-32-bit-dmg-mish-size-checks-65.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20244
 
+# 0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20345
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
