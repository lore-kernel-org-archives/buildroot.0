Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5312FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6948F80B14;
	Fri,  2 Jan 2026 20:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qy0JLP-DqtkW; Fri,  2 Jan 2026 20:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE55809F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767386161;
	bh=e3orUYV1XoKxn8efy1cyfd8JX3xiADn5E+UIWBkAFBg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KYGdFzQww0gO7WqOcHkYEPQ9BSRyxUDmnIgI5qf/h3aRlUQmDuvq/FLkjpLl6VSqR
	 naNFVPfcAuuhhlrJmYKmE06Q5Lq4gaw1YKDm3UGWZ9plNkX8edf/KHikAlsyJXvCl6
	 WLfSaAO8wARI2XHpqbsMLmT4037jGje82Xj76VBr9dNrin7UGJ2btXhND2bJD9iBaF
	 gWqkWp/Ac3wSbdHCM+U4VAQoMbnUBq60J4Ktm/3hgv5FK5xH774J1C3bdRZdC8Vi41
	 xd48S9dv0VJ4ihuMA196saLP53arc1trsGfFyqKRbzfAXzB2NdKBeBfZK01tu4zPQR
	 dnCFeoxaM5j6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE55809F6;
	Fri,  2 Jan 2026 20:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D25D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32486809B1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkVZBIfIRmOy for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DBA680844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBA680844
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DBA680844
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:35:59 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-45391956bfcso9807743b6e.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 12:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767386158; x=1767990958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTjwigwKOvWuNCAEVyewZ2ored9av+73l9of+qqDqCM=;
 b=BDuO/5TVzsBvHBXRVH8a9SR5buvIFhqJkcy5rhfekWO91uVnv1GNgEYMGtxNNerpIy
 IUGm7xggNS3F+0D+5GLsPcrXx+HJFdvK9GYrNP3b1W5rAuXTbQnPphFUhX/ae2pwV/T4
 2Si2CVpPQN6XCNUgkRujIkkV7txTUXMLSaIwyOQCauh2jApq8ojEXt0SgZCIlnVZzWqi
 g1sV66iTP06eUJaylRWj5jrsw3qqdvIV4k4OYPRoSO5PdHBo8s07FFWmmYNx2VFn3iMe
 TlmubYGXCwPFgUTjjzFKGUTz09Lp2YOP3+6blgXZSXEqSmCLQje1zoFezkxxyUMLzbGb
 8wnw==
X-Gm-Message-State: AOJu0YwXblrPRUQ0sVLyg1EbiDqf/oH+ucg8t2dHFswr3iJisXHTiE++
 EzRzjPkyMAQpQ8KcwrIZ5lXeQk7wXLqxJHgDisCHu0CmKCo8AZS+5x6//H11EcLLxcI=
X-Gm-Gg: AY/fxX65mG4nZ8uxDoOqd6IwQXCKMrlmCOQYl8b4Bc2FdX2k8MEXVKwWTFrIij7v1BY
 OFgK0YFvJz7wYrzb2uWCbDEHVz8YI9bRZvulQQQmvgpNI21BHsICYq7U0CbrehT036/dF77ywan
 GG+7SBChwaPrcyyWC8S74451zMMGTbfOO5v+Z7E8VBxxQsdapSQKRnShN/pjcixZ4Jr6B8G7/1x
 vsWWoL3FElMXSBBzG0v+7JXhc9mcK8dhFzHBKaFVKnpnkGEThsOU12euDlxidA+Zof2Vfh87VNZ
 sKkp8zbHCFzoY7neHMkimcS0ycWUjYfkqgMRa8Q8sJRyfHs0P/LzSIFXKH5FYCajsnSlsGUEnbJ
 xqNtB8kwtBht7CTBBGpLK6HFJ3Jvc1ZamZJ8dtipGOUeP2+Ynpk+UOmSdWyyF62xF/zyrpqdzeU
 idWqw7KWS3Ec8tMnLj7ns+Ululzx3cCSC8iW4EIocOKLZQ8LsgdijZQngZQc4/7ksdQdtFscx/M
 7H0YTxCbqY3oaXunKru7KzTFVHsrl1TUgbamZS+47tucM0Sx52LNe8O37bt2QxI4g==
X-Google-Smtp-Source: AGHT+IGSEh8a3Qrrk9h3BzKPTDwi5OUBDaW5KexkUgP8gmcNUsigzKRDGlvK5U00S2n0nZrNntX6sg==
X-Received: by 2002:a05:6808:1207:b0:450:18a:da41 with SMTP id
 5614622812f47-457b211859amr18349200b6e.15.1767386157826; 
 Fri, 02 Jan 2026 12:35:57 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3ba4416sm19559535b6e.1.2026.01.02.12.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 12:35:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 13:35:52 -0700
Message-ID: <20260102203552.4183262-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767386158; x=1767990958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LTjwigwKOvWuNCAEVyewZ2ored9av+73l9of+qqDqCM=;
 b=RF+pTSnfimy8YuIMNGFQ9AZ4r7zGQD/UOBDcK9gmBL/jmhFyHCh+zZoT9nn9Erci5V
 qFUGcoQe62qbeWBNIriw1khAY05w6+QrkU6+U3XlCYtAWMtRtEOVAGj1G99luqRsDUZH
 1l9/wN4HLSJYjsXtdOwqZqXL4f2e4zUdwgFKo5tqVOElKeZEol1o0owBmL8IdAF5IY3G
 dgJ1feIIeC6TVnYTJrwIHv4adt4LFOHtXDovAQIQ2tnUAwZVjuXQfnxnv9HRninFOjhf
 ITKOu3ZeTfyeC+EN5PC/j9hxdk5lmhd1n8J4YnvKhksI9EzCrI9cipFQ6brTVcmW5Twv
 6vTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RF+pTSnf
Subject: [Buildroot] [PATCH 1/1] package/python-pynacl: bump to version 1.6.2
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
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pynacl/python-pynacl.hash | 4 ++--
 package/python-pynacl/python-pynacl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index de54fdeafb..0a76de10dc 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5  0225d0ec3dfe729ee2a52a52ffc81d09  pynacl-1.6.1.tar.gz
-sha256  8d361dac0309f2b6ad33b349a56cd163c98430d409fa503b10b70b3ad66eaa1d  pynacl-1.6.1.tar.gz
+md5  4443a25f6c2f27fa47962a75b1ecb968  pynacl-1.6.2.tar.gz
+sha256  018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bcf018f1ed8436811c  pynacl-1.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index a3d7dd98d8..38484717f6 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.6.1
+PYTHON_PYNACL_VERSION = 1.6.2
 PYTHON_PYNACL_SOURCE = pynacl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/b2/46/aeca065d227e2265125aea590c9c47fbf5786128c9400ee0eb7c88931f06
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/d9/9a/4019b524b03a13438637b11538c82781a5eda427394380381af8f04f467a
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
