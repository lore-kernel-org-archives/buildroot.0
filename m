Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB33C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F344277C;
	Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kg5hiXVr7Yb; Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 156D04277F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 156D04277F;
	Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6F211BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB444277B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDNgMo90Xq53 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDCE24277C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCE24277C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDCE24277C
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-35e4d6f7c5cso2164883f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779964; x=1718384764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YUVrcIXkKL9rqErODej2j/3g8E4koN0kFEHhkbNLxk0=;
 b=OM5CPM3Ah1GhQJTJ7VE78p0gQSKCSwcr9e7cPb5f0x+sasDD2iO78SyFIzom2O4oLj
 ev5g6Nak9BAEPNTW6z+hUTtfiyqE5WuPQWwyLkCUdDdsMwDURWdi3vbWgC8Fdm0trzlg
 RIsMOAkN5tQp23+Bw+zP8BrgpZj3pyiR3aWMBTZfeeFtgRDPn5sW6HLJdn+QIas/rLvL
 dJXWeANo0CRJSnKNINEDzimL675Q5YCCvIOUXth+VBeGGoUoZIvW6ogLNaiJ9wqZUMUH
 DaXavjUTONyWwYrMYNCmiAUQd/6MRoF6YaGr8OomNE43vZZrdKBbv5QKI/r+51URrHIu
 /cEQ==
X-Gm-Message-State: AOJu0YyHQIbk+R7kObZynP4Z3UKJyIqtBk677FVNXxdAOFE4nOk2Hesq
 W7BN8glrYciSGmPa4LBLp6uDR8ujBk7kc8zg9AiI0L5FeuOX/qt+Xw1+lg==
X-Google-Smtp-Source: AGHT+IEHv7BQsPQZM1Kftj7hFAwx3YAVesMhvK+Al/IdRFpPT1WcsphgnwQhqGLnqNQ1D/mVK2J5rw==
X-Received: by 2002:adf:ee44:0:b0:35f:caa:1ebd with SMTP id
 ffacd0b85a97d-35f0caa1f5bmr965492f8f.8.1717779963645; 
 Fri, 07 Jun 2024 10:06:03 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:45 +0200
Message-ID: <9d4bffd033df7518f8ce488faff9379f1f993591.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779964; x=1718384764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUVrcIXkKL9rqErODej2j/3g8E4koN0kFEHhkbNLxk0=;
 b=P2K3YFVTvlc9AZqbodWSY64cKUP/eSx5UBItzn6xUYBbMZVar0wgd4SHNoXyH3vdPb
 tfD1hGrsFQdahDpS7dbCHkx7kJ/9/ga+Yr7RS9tWJzvjf3eWgT8GuqQfRKckqRb9Vqba
 O3bQkMPBQbcgvli3q0SvXcOSyH5BPKdj/pvI0Cw1l4NqLnghoFSLfNVh9iupVVba7/vf
 fdBWMTnyEf2BIA8zu2FCXc7I+Zr5TkExW2jzafBkps695FjHVEr5/liNsc9MXFbCn0bP
 A/b35i0xDnQ3P9VtTj8LgjAA0JeqdSS8TMtbxsvtxgka2hMPdA44mGnAaHmTp7vUtID+
 ujFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P2K3YFVT
Subject: [Buildroot] [PATCH 04/20 v2] utils/checkpackagelib: instruct
 shellcheck to follow included files
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We do have a few shell scripts that have source directives (either with
'source' or with '.'), and they all are currently either globally
ignored in .checkpackageignore, or have shellcheck directives to ignore
the source statement (SC1090).

So, we can safely instruct shellcheck where to lookup for sourced files;
that does not trigger any new error.

This will alow fixing some shellcheck errors in later commits.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/checkpackagelib/tool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index 907ada704f..e12e1fa406 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -31,7 +31,7 @@ class Flake8(_Tool):
 
 class Shellcheck(_Tool):
     def run(self):
-        cmd = ['shellcheck', self.filename]
+        cmd = ['shellcheck', "-x", self.filename]
         try:
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             stdout = p.communicate()[0]
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
