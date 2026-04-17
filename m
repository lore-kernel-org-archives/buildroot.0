Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BAEF43698
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 12:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3295281460;
	Fri, 17 Apr 2026 12:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z96t6saUIuZG; Fri, 17 Apr 2026 12:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E5AE8145C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776427609;
	bh=NKq2GIK1xNzov68THfe0IWMxFh+NcCc1BMWHj8LAL/c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oiUfEi90yYabeKuXZUF4uDNEcHqilzFA+SJu7L++i29XL+tNOb0C3CJVyL3oftHEc
	 KfmFYTgZoycXgoEF4D6wFOSShgAMxOY2ik/EXkuXr/cP2tUnStgSvT6G+GX1QEDdmI
	 E6L+9l/ywWjZKmWVbeuUKrYRO+aLKEUU8pxZZbfAJ0E5k37pxcEM6qUBmPaKMq8byw
	 i+7rimZstSYUJVumendN31xagpgumtIkg9P6cpHJ4gs3eUfe8tUFjsBwkGeO+ZUyx8
	 n1KmKWBiAcLtI4QnKxmto5WIDPmHfv8IrPoMmJz/bq7ZI7QUlzpwOiDmd1cvieSHhh
	 UnERwIeYKDhdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E5AE8145C;
	Fri, 17 Apr 2026 12:06:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62C93396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6050E8145C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyu6l_vsLZdg for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 12:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54D958145B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D958145B
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54D958145B
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:06:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d70c30767so994210f8f.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 05:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776427604; x=1777032404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1oJZQztYI/4Fy36/ni5sv+6HWszuTEfPoUNTgI9F07s=;
 b=OftOaYyUD7tkkLrcFy997Ftu4y40w6x5MC/Iqg5bzZh47AiW1hq58wITQ3gkBNWv15
 OTU/lUQF9KUYF8nHUy7VjWsdPVWU7J+4C3eM7YslEwPTCaOZWw9pmG6QR3GHKfA5FxuW
 KroARQVn26E7n+ZAQxI5vlDMLapGNQ8d4/IeXTs2JTIHIF7E6FdIUSzXEbru3mQERQR4
 R8s4vZrZXjPbgVxxlZF+5XZZNHU+YNq1a64LN9gyaCFWPWHi2yPDWG2eKSHNoLupc6oN
 /NnWbrvzJdl2Ix68YF4Wcu2as6hCgezdngKKyAy2abXU8a4YKfFpbxd/EUaBQ+4dotDd
 qmWg==
X-Gm-Message-State: AOJu0YzKOlXrYHIUplbzFVAx2UMbN7msHSpsNbGK5JSlCt3qStKBP8KV
 2QYNXOnyf/l5k+5WWktcl5Xl9Ekt5eD86YO4qp+g04EblN+qE7FsFys67Np7A92L9OOw+R1aKw0
 tTM18
X-Gm-Gg: AeBDietuaotIqVlLQY3aWPqVOmYf/+trWSbczbZc4uZ1FtcEOgetW3u4K23ML4LA7Ci
 7bb3nkNyT1F7voJuHyFVeQMFj0PvF44m6wwuweirFBo56J6iYNvD/EjLe63PbFXlEUMr/FhUPGB
 8B++CktlnonG5qtrjI+xMHYVBvreJE8tPrPRubDKXbboHtWmZKsvvXKhZaM3kbkTBP89ClKCFzP
 xvV77p64XsMfVi5P+7jv1Ua939NxdYMwMqQ1pxmYW9OBNeuNQ1LG5qpLDcm0TYVhgXFJm7CsdIM
 DLlfxO3Eao5Tv9eEsTfVFp6m8KUBGsChpjeCFJAmQoUhfwz1818LJVpnUpu96cV+CTIU5ZcK7NP
 eqvVCoDSqDIrCVXx3k2aa2B8/NbPx0g4tfEr6oMlXUOcByxPrM815tluhMOvaSiZA7tzQJXeNK3
 dVABJcDjL71Uxw3NOFT7jin5HBYqM=
X-Received: by 2002:a5d:6f14:0:b0:43d:7086:b03 with SMTP id
 ffacd0b85a97d-43fe4032b76mr3317587f8f.1.1776427603876; 
 Fri, 17 Apr 2026 05:06:43 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm4421878f8f.24.2026.04.17.05.06.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 05:06:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 14:06:40 +0200
Message-ID: <20260417120641.174060-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776427604; x=1777032404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1oJZQztYI/4Fy36/ni5sv+6HWszuTEfPoUNTgI9F07s=;
 b=Bexwa7rirfwnpmeF3GuZvCvYQ9nylhF+7MIDr2uEWIflbcvLaWeT2+BcBw18ImIJPv
 Xaml9ZmZJnvZRr7I3pqg6tfbYLT5bHp2H6W+2b16p4rwVCrt5BM+NjqtPyEOgRqpZsIP
 dXH9XDQDfnYdR0CHPhqV4I9b1BIiedobL43SC1lQjqnk0bXL+lLd5gomhoFjogKRgSJf
 pxF67rMTwDQZ43VGEe+zSXa+g/zkUJvPbVE0IBfqJBkIAHy6o0lnBmoUmDwrnsbkSl4c
 oM1Ec8dWLuyhYmMStxqsM1nPyl9YJeIepsr0oRPWop43av21BxUL3A0FmMulcBNa8M8V
 adPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bexwa7ri
Subject: [Buildroot] [PATCH 1/2 2025.02.x] package/xz: add patch trailer
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

Commit [1] introduced a set of patches to fix CVE-2025-31115.
Since [2] the security patches neeed to reference the vulnerability with
the `CVE: ` trailer in the patch header.

This set of patch is no longer present on master branch with xz bump [3]
but hasn't been cherry picked to 2025.02.x branch.

[1] 06c6c49fe8 package/xz: add security patches fixing CVE-2025-31115
[2] 1167d0ff3d docs/manual: mention CVE trailer
[3] aaa50b0e61 package/xz: bump to version 5.8.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch               | 1 +
 ...02-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch | 1 +
 ...03-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch | 1 +
 ...04-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch | 1 +
 4 files changed, 4 insertions(+)

diff --git a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
index 2424fb0d13..41870a8282 100644
--- a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
+++ b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] liblzma: mt dec: Fix a comment
 
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/831b55b971cf579ee16a854f177c36b20d3c6999
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
diff --git a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
index 7845380a8c..14985ebc8f 100644
--- a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
+++ b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
@@ -12,6 +12,7 @@ called (reinitializing the decoder always calls threads_end()).
 
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/c0c835964dfaeb2513a3c0bdb642105152fe9f34
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
diff --git a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
index 9915e6b275..d370d8b613 100644
--- a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
+++ b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
@@ -26,6 +26,7 @@ Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
 Reported-by: Harri K. Koskinen <x64nop@nannu.org>
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/d5a2ffe41bb77b918a8c96084885d4dbe4bf6480
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
diff --git a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
index 1a914e08db..b3fd11b29d 100644
--- a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
+++ b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
@@ -21,6 +21,7 @@ Block before the worker thread is activated.
 Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/8188048854e8d11071b8a50d093c74f4c030acc9
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
