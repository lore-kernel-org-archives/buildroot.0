Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE81DC369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 08:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E54834C6;
	Thu,  1 May 2025 08:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzQutwQQBXLp; Thu,  1 May 2025 08:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB202834E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB202834E8;
	Thu,  1 May 2025 08:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFAA922D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACB8A8350D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftZiOIrWuVHh for <buildroot@buildroot.org>;
 Thu,  1 May 2025 08:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB0F6834C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0F6834C6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB0F6834C6
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:57:26 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2295d78b45cso10728815ad.0
 for <buildroot@buildroot.org>; Thu, 01 May 2025 01:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746089845; x=1746694645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZHb84xc3ptknPTOB5JEZFQEiU6ZOcba3lL4ollrnvs=;
 b=vqgiLdlssNt2OxAGq0M9M7uy7Qg2QiUZyBJBwT/HZJ61V5O5dxcOxixgqrEQN428+D
 v+zJD/8625MVpK1uH6ej+LlyL/SJeq6GKyNSDeRkoOR1bUNfdPCxWSDR8O/Ip14Y76Xc
 nVLBQ7CNxK2QuTSGyOx2H/ggkTgtGd7pvZWPWzj7aI/XKhotY5enrAd6wwleR986vxlr
 Laip1VnRu0N2sDN8STbSsUnhSDjOSuts3oOlfuNT1Cis4kKutLWkXkzQlpwtXhA8MnvV
 J/uaaB/kluCsmAe7i6ZaqP4UTR50QNjqvX3WEX5dA4DZo9/hnkzL61EFC4jurpuDJpTM
 GZSw==
X-Gm-Message-State: AOJu0YzfPon7GucI1WVpZEwHoNcpO/zN/byDr4YrJUSQvBEfLWItQqOK
 cJdo90a0C2jSGF1MaWr4lJw1ZIIiedkGPxJM1hoeD64jbehagnGiJjudYXHo
X-Gm-Gg: ASbGnctHWIDIyl+SjOpNKCB5iw5IfKat55R+Q4xfPEX38xWN3C3cuP3ijYGyU4Z9dHy
 Hx4DZIs8sfpF4BJ/7Dht0s4JtmPprYrm2W+c3hmHhdvDeWQJ4awhImPTi/nZJLPj6D/4ch6SEfZ
 KKKA/40Idc46zjy76/goaqpZ7PREtCmTRnGC/ds6mlbHLMG93QB6hNx5VuVzGHabH/GfLkgZN4V
 oBV/uwzLCdW6lnUVWb8buewL0cata/mkyOa/iMzgEAG55chsO8Y8f1swWfkJ1pyo0wB1Co9KhhW
 sHj9KVblk05S1PR5JTeE47Wv4Q5KWi1uNsoTywlcXc/zEl1oJxDl18x0S7q5eQ0au8WCqFACkUn
 XaYaSpchnrvIB3imnUFLar9kGQ/I=
X-Google-Smtp-Source: AGHT+IGOyzvC+hQdIbL3DsZgE7ZWO4D1Byg+T6O8RddMbVn/TXpAwTy6usbXAd0MlVoemg86zjqfsA==
X-Received: by 2002:a17:902:e84b:b0:223:5c33:56a8 with SMTP id
 d9443c01a7336-22df581e52cmr100697165ad.35.1746089844705; 
 Thu, 01 May 2025 01:57:24 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e0bb04e98sm2509095ad.48.2025.05.01.01.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 01:57:24 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 01:57:21 -0700
Message-Id: <20250501085721.58508-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746089845; x=1746694645; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZHb84xc3ptknPTOB5JEZFQEiU6ZOcba3lL4ollrnvs=;
 b=CcrC47/lCw2amIri2YVXq1xDJknArgXOWcdCuLkcX1MJleT7nULh1qinjaukglFEEZ
 bfBbuVS5HF0b0bPoYWvO7BOP8+Ocgr3gYjzE4NTVXLrkmHQXScMBHxJ6GmW3B5QbV4tA
 8A1ATBXoHj0bQwn/8TV3xE2KRqFqPSMdmUYepipA0nUUca72Nu/1WA9G4tIo9o1aJD7H
 RSy+ieigoYLFD68qjQcd+SbhQ6eUaHBtoYDoh/Ld+oh7h1NbvNMIQbGGn/sfEZWMYYt9
 r0HxjKcWsOzZDYHx2LMNm5RJGPC3W6INvTGmRErcgQ9VqanVcZhebaE1rJn+6sfY+kPZ
 HbBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CcrC47/l
Subject: [Buildroot] [PATCH 1/1] package/traceroute: bump to version 2.1.6
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

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/traceroute/traceroute.hash | 2 +-
 package/traceroute/traceroute.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
index cf2eb127a2..5619338848 100644
--- a/package/traceroute/traceroute.hash
+++ b/package/traceroute/traceroute.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412  traceroute-2.1.3.tar.gz
+sha256  9ccef9cdb9d7a98ff7fbf93f79ebd0e48881664b525c4b232a0fcec7dcb9db5e  traceroute-2.1.6.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 133f8d3c3e..bd246e5f9e 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACEROUTE_VERSION = 2.1.3
+TRACEROUTE_VERSION = 2.1.6
 TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
