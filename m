Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A66CCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 07:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21DEA80F58;
	Mon,  2 Sep 2024 07:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mm7sk1E4XGyc; Mon,  2 Sep 2024 07:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2618C80F5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2618C80F5A;
	Mon,  2 Sep 2024 07:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4B41BF33B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 07:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA50404D6
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 07:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqlLwSQsXMZC for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 07:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D816B404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D816B404D4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D816B404D4
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 07:41:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42bbbff40bbso23531705e9.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 00:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725262874; x=1725867674;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6XbYEcWdcFzSj27v2KPI+ImofYBIaCasMjzfJNT+9fs=;
 b=o3hUVP4sQ/IYZzJ7NigHVA1DSgek8jv+KZ/JHDMiFMQfUffkv3s1kKXv+47zh5P3SS
 h3XGJeq87dM5nhD1WyXdsam9W0PrvyeMeDL/8ltm+7oVamvj0arr1nyxypOiA8o4tSdo
 b9513PbCPKhWRzsY7KeIsZl5yzF6A8tdocYvVTgaIbOcOGtlClw9g3Hcsx+lHXzGTxtL
 JERPTIATzZj9Z9L/4P8Y3uF6CkN9mGsDOp3H8Rgs1zzDRPj/vTavzAVEBGRLtpFXLloC
 cmnS+rNt1AvXXanJs6tv9s3PVuIY4+kmizbeLcIwy1oi7TzwR6lTYW7oo7R/TWXr7fsj
 RlAg==
X-Gm-Message-State: AOJu0YxUUG5Y5qPNmTM6o7CW4ELAsdVjwSSMITXOxPkDSCYavjdC3OP6
 ByZvr7ocqly/UCCpy5AHlgRzwAlUCakDqKxy0YUlU0CnCS/tgWg5O4mrwgwRJ1QBZOfD+zDqTLO
 zRKM=
X-Google-Smtp-Source: AGHT+IFZdj90HMu3OEst/T2Inc/E4T5oaOjxAecmtmHhDRfe20BA7MYsiH8XQfpa6sdDcPcAtl/PZw==
X-Received: by 2002:a05:600c:3c9b:b0:425:69b7:3361 with SMTP id
 5b1f17b1804b1-42bbb2167c8mr72155185e9.18.1725262873694; 
 Mon, 02 Sep 2024 00:41:13 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (93-35-133-65.ip55.fastwebnet.it. [93.35.133.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e355dfsm127989565e9.46.2024.09.02.00.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:41:13 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 09:41:08 +0200
Message-ID: <20240902074109.50173-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725262874; x=1725867674;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6XbYEcWdcFzSj27v2KPI+ImofYBIaCasMjzfJNT+9fs=;
 b=R19pPyq9YzT+W2s6s3z+yPdySuIbPOd0nRA4ypPF7izy3eY++/zQhI5tAuDT8NIl8Z
 wMJAO1AS1/zrtZix5oMR6k4UPiIPCX4fBzvcvto/fn+o/v+xHcyxgOCHZcdoDKJa66WQ
 0eBCNRK8pxRf0KAbsxfFxwhMgRz4kTpospdbw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=R19pPyq9
Subject: [Buildroot] [PATCH 1/2] scripts/cve: Avoid to do a complete clone
 of cve git repository
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Just a simple clone --depth 1 should be enough to parse the
cve and generate the pkg-stats report. The space now does
not take in account of the full history and only use 2.2Gb

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 support/scripts/cve.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e25825581e..7d115a28b5 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -82,7 +82,7 @@ class CVE:
             # happily clones into an empty directory.
             os.makedirs(nvd_git_dir)
             subprocess.check_call(
-                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
+                ["git", "clone", "--depth", "1", NVD_BASE_URL, nvd_git_dir],
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
             )
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
