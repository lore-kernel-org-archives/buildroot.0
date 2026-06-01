Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9FFCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FAB60DA8;
	Mon,  1 Jun 2026 09:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_-gUc3n06bg; Mon,  1 Jun 2026 09:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F8D760DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780306923;
	bh=vtS0dbiIZdlAUvmUAbHnKSUi8yXuzftBHf7UsA2l2A0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mEC9c5LhFFeAj1K5cfL8qGTZ4KzBIZZrDRdZzZaPM0i8GeDHRCpf9PemfbbA2VMtb
	 WJS4kcksgDQf+/FDVvEPgH1pIfVSdk5As+Va97aXTeL8m4EypMhYDuhqVfcsZELP9N
	 24z7P3OmVQ4nkVNGS/PTGsUtVyqwHhYwdh4JzW/7HxKTtwXQbaumMkfqD82jWHaHqy
	 nGFvEL2bOOdKTV4NCki5dwlxdPvSDR8RZUZ/nA0hkpK/lHaC1l70oQ2iYLoTh/pm6t
	 PDO0SYEhYPnygReHO62FKgd/kj2vvr2i12ASbrOnekrYi2OUcuc8UeO3/Fb3pjFMTG
	 3aaa5ZFPnWXkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8D760DAA;
	Mon,  1 Jun 2026 09:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22EA7257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14A804083C
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgJqr2GJZVDe for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 09:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BA9340825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BA9340825
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BA9340825
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:42:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6877c719cb0so16449982a12.2
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 02:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780306918; x=1780911718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IcEklbR2zEr67FDn/0puETkiMOeIDiPxodcdwUC1/Y=;
 b=XHAsSPihCWOkyf/gqYKRRynyUna/xuL3tA1KX4Q5dSh5ixGD4TbiwHB0gawMTqx4Ws
 F1e0S3c2Hs8bl+O7RNjeecX51TLwUBK3D6vjLjWlUUHp8F8swShKM16x6dhcAY+Cgzeu
 1Aq1v5FyQwEC51RmgtLd/K7HRufh61TeBhyGrWf5+iq+mZzVmHESXFYNL/uiCp8bw8WK
 5O/24xSXdoyoRQS3/6+9lAeXnvMjDsXTldH1VDXbuyUx9XEQcYa6zW6c9zplvS2a7kwA
 4JcmCroq7I4CYZzacKaRweb1Vc4gEezKTcKV+K9KKny76H/3KBJXBZWG/6OiVyPPM23z
 vkyQ==
X-Gm-Message-State: AOJu0YwiEUKx3y5YdxQORqNEEkTFJU6uRzA4ERz2V/p7cbePo3RHdAKp
 QEMX+VCAK2qNG5Mglv7I+FZPURgUBMp6wuCQnoQnduI7nnOGMOSnegHaMGx8mOv4X9SaDFpGO4d
 9YYrV
X-Gm-Gg: Acq92OEeo+fy0lzdyhM2K6oJhOuGRbCGxaKFg4txujOBstBJu6SYBeVPV9syQnN7rBi
 RQkkjC+W0dfPXC2lPc3vI1TszWMApLHAQbHqVSaHonK16OS7qbORenHcN1na83EUJVnEYxjLpQu
 JhnuEZBip7C4b21VcOq817v2yNnZdna2UnWePfbVyz9OF+pZ2HvuYmrkiysrnqxHFoBDF79lLVN
 0TeXajY2WSIMHAGTy6DdugdfanDaspeYUoO6Dbb1kUORNtyCwc3P28urbZM/Q4Sa2KkyS+2CR4n
 57h+slbChiawvZxrqgsKgnTV0NKFvLwcN0iSlZpB5B2LOqtfk+WAoPPzgHuRL4svoXsnYA3KO+X
 /3+kVWUYyXkNn9hCKcvh4+1HEvkFMFx+SEyyCup2xpm/+wfElmQxVrsF9l2GPl9QZtlJM9DLPlH
 Z7Vt0lLMnCB41VoD/Rfr0M6c5CFr56yd45KclHXbe71UkwDd67rysvdS2fZA==
X-Received: by 2002:a50:cbc8:0:b0:68c:4424:a09b with SMTP id
 4fb4d7f45d1cf-68c8a37309amr3341212a12.4.1780306918395; 
 Mon, 01 Jun 2026 02:41:58 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68ceb7916e9sm1803117a12.6.2026.06.01.02.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 02:41:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon,  1 Jun 2026 11:41:57 +0200
Message-ID: <20260601094157.118235-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780306918; x=1780911718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9IcEklbR2zEr67FDn/0puETkiMOeIDiPxodcdwUC1/Y=;
 b=SGxL1BUZD1MS+fwExvVx8hDwLUUiKX+KunX7dQCnsndcLKTotctsiEx7DEhjgvd3+z
 fxnER6Skeh3J8e2vBC+WpY3jQTpkcKct54+lrlSZ8sZF5f2TI8hutWlYBs2R4m9I/Cba
 MsIgcRInfzW1vbGM2+2NWqjUHfG/gIG0iIbIh8b8JERlz1AsY6vtHbwl+amZfZ8WFJ7y
 vNB4bSzvI2dtHGTiFcH9Koh7yCiw/Jk4A5sqsO1dpr6A37T9dB/w0qjcBa0Wj0MNxBPP
 U/kU1r7gBfhHZeZrIvYada/Kl7n0usOroQS4/WvKyC6d+ttq3/T78i/pepB40IZsF8mI
 HsMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SGxL1BUZ
Subject: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: fix hash_file
 location
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

The 'show-info' output always the location relative to the Buildroot
root directory.
When running 'generate-cyclonedx' outside of the Buildroot root
directory the hash file locations are not correct. Only using the
'hash_file' variable coming from 'show-info' doesn't guarantee the
script to succeed.

Use the 'brpath' variable to correctly reference the absolute path.

Fixes: 1791b79422 utils/generate-cyclonedx: add hashes from .hash files to externalReferences
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 11edc05d80..bade018cd4 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -302,7 +302,7 @@ def cyclonedx_source_hashes(comp, source):
 
     hashes = []
     for hash_file in comp.get("hashes", []):
-        with Path(hash_file).open() as f:
+        with (brpath / hash_file).open() as f:
             for line in f:
                 line = line.strip()
                 if not line.startswith("#") and line.endswith(f" {source}"):
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
