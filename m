Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9885EC61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C821B40580;
	Wed, 26 Aug 2026 12:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMnWfoI4wDPA; Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747822;
	bh=U24H34i5PptgpKzAHiqHa0fJyaO9xNs3NVutYn58v/g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YT5UWDqRN9fFj1HLewYrJiwmol9co6AMvnEjywWXYWU3H+KRNyFOVjSZy1PHXem7L
	 pf85LXgB/4hxUVUjSl3Vf8itDJMpoEveIZP6wmBUBxs1KbGIx+yOfCgtjDPu59ar7O
	 +naxC38Yu2cxois6BTlNaoFebvndvCk5ksRNgsq1ZmZdXQuFoYkkOmdK+cGNLjmQe6
	 dfeovq4AYxUyoft79DAq4GWNdBRONMpGUD7imWJyxvYy3cAMqmbBNEAQUx5AyWW423
	 /yujxRb7mIDHJ7Ls8TAtuFCQv7UKYHdGV3BtDxwEEWU2HehaiKchXyuSOOa6wK5SRo
	 Ac9/lXG1SbdCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A53440557;
	Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 520DC3AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43FA3605ED
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRKmP66JW3Xv for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0963A605EB
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a5ebf75d62so907018a12.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747812; x=1788352612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+rrVNlu+HWF8baEudTEyufJcxskWjyCmlVXpZHH16Kc=;
 b=A9RztLrywgZgIepIGvhJF2g8+spv0JEXvAZlkDvq1PXgXt9m7ddKikRHX6npWajSvg
 x31ZvsH+5TnX61WlzP2yI+gdW6zbhZ/Cb19ReDVoARLk+c+20V1y6cvBn6YzWI33PjGp
 ntzfrpfCRlJB2TcItVV81TlQDWq9PVYZcEYUO9f4RPvRpBUaYOTJtQWRubKs+a37t80l
 Omh5f3CE21burUiOP3KCRP+/8kmgFLKb42wAAahNqGeauN4qcdOCyvrH1vtp07+AfSdv
 ochzIprhu6OXxl45dBrg4g4vSAnMMut0dlhuGZ7ncFeO8HiWakVdbmi2NENgYCh9GEx7
 9L2w==
X-Gm-Message-State: AFuF++mefUr0066Bk518Tw6+nubBCIjlmT57Odw/CJmtcD3snq2xUL+D
 sABkOWH2s3Z+vFRdx0g5CJE1xsaf4pWycqM1rVkxLW/k2S8d8uphsV/DTrh2bXWmyQaoz1eFBf/
 4HUqN6mM=
X-Gm-Gg: AR+sD12q/W9ZJZ1OvwoJj+gOA/CnnFu0h8Wbjh8k96TXfYDuhAwmvZS5mXW3IKhpZxz
 mlPeygfDy9mZ1WGWrCG1us8u3EbIuZ7pJUiLBRJOUhrd/EJNmjLTNL8rYXn0DAeOsOsf5O9NH/z
 dCwzACwuU7HmLrOJ6ItBgGiVqr8GIxl7B8oSUAuaqayxomwHEu9Uxm9ysY4XXVZ5n6GmOrRlllT
 F5Ks5AOva/6NbfFH/JqNp5BuH1Wn3sFr0rCpfvwhnC4bnj/VBGGFhlDoqt23l8nEeICuL/KEfhE
 4rI3AthPwrJeOctNe58y3eKACymAs/QF93b3vRl6NAbHf0e93k2K92SfOIyy8wgoUNt2wT+fugU
 IFad64xHPC0DbvlLlZT2B7MjyZ4yD8s7VQsCcwuV1aWfx0rK/uOruqW0gpzcbtAKX6l3uj44o8D
 bQHFybZZ8nrQwXidEzarT6TWNfCnHsGosMjGw4HY9WJDUk5QwksppHeEPDwGE3l910Ot++GI0aY
 chY
X-Received: by 2002:a05:6402:160f:b0:6a5:c47e:8d6d with SMTP id
 4fb4d7f45d1cf-6a5c47e8e11mr11480266a12.9.1787747811741; 
 Wed, 26 Aug 2026 05:36:51 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:25 +0200
Message-ID: <20260826123637.410258-5-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 04/16] package/clamav: add patch
 for CVE-2026-20217
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
 ...ix-pespin-cleanup-bitmap-tracking-47.patch | 46 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/clamav/0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch

diff --git a/package/clamav/0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch b/package/clamav/0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
new file mode 100644
index 0000000000..a2ac405d92
--- /dev/null
+++ b/package/clamav/0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
@@ -0,0 +1,46 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 16 Jun 2026 11:43:04 -0400
+Subject: Libclamav: fix PESpin cleanup bitmap tracking (#47)
+
+The PESpin unpacker mixes heap-owned section buffers with pointers
+back into the original PE image. Its final cleanup loop is supposed
+to walk a copy of the ownership bitmap and free only the entries
+that were allocated by the unpacker.
+
+That loop checked bitmap but shifted bitman instead. When the low
+bit was set, bitmap never changed and the loop could free every
+entry in sects, including pointers into the input buffer. A crafted
+sample can drive this path after an allocation failure and crash in
+free() with an invalid pointer.
+
+Shift bitmap in the cleanup loop so the free decision advances one
+section at a time using the same working bitmap that the condition
+already tests. This matches the existing intent of saving bitmap as
+a disposable free bitmap copy and avoids touching the original
+bitman state.
+
+Credit: Atuin - Automated Vulnerability Discovery Engine, Tianchu Chen of Tencent Xuanwu Lab.
+
+CLAM-2961
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/2410b002feb151500fa6cdee3233fe97c9fe865a
+CVE: CVE-2026-20217
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/spin.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/spin.c b/libclamav/spin.c
+index a741fb83be..d0470b317a 100644
+--- a/libclamav/spin.c
++++ b/libclamav/spin.c
+@@ -508,7 +508,7 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+     for (j = 0; j < sectcnt; j++) {
+         if (bitmap & 1)
+             free(sects[j]);
+-        bitman = bitman >> 1 & 0x7fffffff;
++        bitmap = bitmap >> 1 & 0x7fffffff;
+     }
+     free(sects);
+     return 1; /* :( */
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 84bcadde6d..017d07fc05 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -30,6 +30,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20031
 # 0002-upgrade-rust-dependency-to-resolve-a-security-issue.patch
 CLAMAV_IGNORE_CVES += CVE-2026-25541
 
+# 0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20217
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
