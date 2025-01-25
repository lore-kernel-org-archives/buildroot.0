Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98BBC02182
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 05:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E8D606FD;
	Sat, 25 Jan 2025 05:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCt_-2Vx9bbG; Sat, 25 Jan 2025 05:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BC706071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC706071A;
	Sat, 25 Jan 2025 05:30:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9DC2941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B60B381A65
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6aw5JDSfPlu for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 05:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBFE081A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBFE081A58
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBFE081A58
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 05:30:47 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2eec9b3a1bbso4060559a91.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737783047; x=1738387847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQxsJCEwg4fHh15Xa8TCTlTe6F7zB2Ip7Lsi/yi4B08=;
 b=YTd5Y7qUMd1O1SOT9uVCjmDfiESdIOFVBP5SbdQG+j4tbk3cVNC+S4BLJ1PE2bgXcd
 SVeTxObE6ei2rvQWcMpsgoZZIOyZ0nuSCP6rmONyA5ja5Qy+4gT+SrSRaRvkthv7InrR
 mBoFl/Kbkzn4ANze0Njk+B8QW33rJXM6pSgZ7Bxcy1344ZykMMeIK4sT5vGTPu9MyhXp
 FpoqYShvIL1zrQM6V2kBl/tZ7Eqg5MmNPKYFKtgpqrV1WutMyQ4fIJ0UdSaFn5NusM99
 rGUoSyCTccb4tBhYsZq05D+rSw5o1CCQZZmPafy/wZgZoVj+h0sRtBYhTpzOEIuCc+mA
 92og==
X-Gm-Message-State: AOJu0YzinkxIveez4XpvbddYvx8lNihmKjjTD+J0PKeVEnh3K7w0Fzjq
 UIyhXZBsynbo4oSUOUS+6jT2bE8MdugKs1WbjdwXob7IoB9BToX+TarjQe9y
X-Gm-Gg: ASbGncvQrS7ZdXmKsyLbeAHbY6U2O2U8bPVMU0nOnCSOzpy+sGr7kaJbjG1Q/9eq75G
 dpZO1AbtC1wTul9lkIkAbe+DoL4ivsdjloFRqMrBDTji0VeC3rV9ArxTUtBWuv3lm8559FmogK6
 SsyYU8dfKF3kMi+nhnpLEb1qHsn/SFXxz/NLEjcOZiXFPQ8/AN2HEm/QQ8UIWx8VToIGNrpDXfj
 YfmZcFNC1b1gNQzaDSoGYmkr4QNOWy+RC+Kh6p6bw7C8eOkUNNT0MqH1SlIF3AknuF4z6WQAABs
 5p9UknGg9ULBXQUPMSX+9Xiy7Es7gVK1sSQ6MYzqR7ElnHKftEmG00naUe6EXSEX
X-Google-Smtp-Source: AGHT+IGxXZnDZ/R/mv5as1JZDgZvSMumuYIqnonnTZPqVpICqdXniduaVDHBIL6sN8fhW4RKbz1DVQ==
X-Received: by 2002:a17:90b:2703:b0:2ee:ab29:1a57 with SMTP id
 98e67ed59e1d1-2f782c6298emr51468991a91.2.1737783046874; 
 Fri, 24 Jan 2025 21:30:46 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb194c0sm2721618a91.43.2025.01.24.21.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 21:30:46 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 24 Jan 2025 21:30:43 -0800
Message-Id: <20250125053043.86742-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121091917.19379-1-nemaakhilesh@gmail.com>
References: <20250121091917.19379-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737783047; x=1738387847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQxsJCEwg4fHh15Xa8TCTlTe6F7zB2Ip7Lsi/yi4B08=;
 b=inFVqSWWMIHHY5wHeNa22GDCAgCXmZgde3E7Myw8GLWIvlX8nObKCMk6CkcenFtYuZ
 E+NCHCa+1IO/LxSiZdh/w0pWDgaxg/EMJk2ilOaTA7q/3aiiIptxzU7KqGDR0KpuZTUQ
 XsxaPhiGNsgYUm7TWyl1SRaQwMdEM3GD6Y27TxulfrsPV2t1P260byo5uxg08s+xQ7Vz
 bGQU8i+G+RGIEd+c2bMQti4oxkASmR/JZmE6pSjvgdhgmn95pgBX9QbqnU2ihKK67XFh
 0hXLQxWKBGEGx9EPSFKpEwYakMjmYBVdvjg+ZyNx4soSKi3d6xlrv2bW3mu5YEMIFT14
 lGdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=inFVqSWW
Subject: [Buildroot] [PATCH v2 1/1] package/lzip: bump to version 1.25
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
https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html

- Updated hash of the COPYING file (FSF's full name and address was added)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
Changes v1 -> v2:
   - Updated hash of the COPYING file.
---
 package/lzip/lzip.hash | 6 +++---
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 7900835e11..ec8a86b29f 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html
-sha256  30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162  lzip-1.24.1.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
+sha256  09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f  lzip-1.25.tar.gz
 # Locally calculated
-sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index c88be5680e..9c8c54a8b1 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.24.1
+LZIP_VERSION = 1.25
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
