Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376C5CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 21:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCCD1400B8;
	Thu, 28 Mar 2024 21:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyZZKRTX8bgZ; Thu, 28 Mar 2024 21:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E304B417EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E304B417EE;
	Thu, 28 Mar 2024 21:54:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28CC51BF47A
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22ECB417EE
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvCKTguyt7ts for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 21:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 013A8400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 013A8400B8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 013A8400B8
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 21:54:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41545616455so7035425e9.0
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 14:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711662890; x=1712267690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zzJ/FFWwG6qC9HWzFovWNvkLmeDXL4FcCh5vAP+2QRc=;
 b=PElTC6dyflyIM0G9LuDGgBN6ptwbeFEg8fyCBsLYp9L5ddlK7xi8nyZ6Ra6yFgOSCF
 QgeSsGsKHMBymdnDA5zv1SmZ+E9mxkrdl48jTmRVpmO5SOFOVwKwuFRb9C7QljBjpdL6
 uj6JFa3jEfFLG9/zP6Nn6N+7KVhuXSRqxymshqnmEu/bgwFc/Dewm1HEHrISWjUb1TLD
 7KWrdt08ldvauIzkPBv33uuhhc028ligWc7mySJdv4tVSFGa7qziO8ujHMX1n3tF/WsG
 lMNvI9hFDB7+9vlMJZkWMNajQ1t/tQcgWU3v3gHF83Jc8F2Z+x79XBRZQZanbeUbEdKT
 BtBQ==
X-Gm-Message-State: AOJu0Yx6BHZsHlbRPb6+KJgubJJ5KNq+Rsavou8pnEardt7sZHlJPN7B
 cbxSNun4Sj7VGHvfHlEjhJyhi693CbcIfXSRXtupEMD4uKEP4piAVmv72q6E
X-Google-Smtp-Source: AGHT+IFTm7RywUoEih3E1xrXtTcSYIxC13rCptaJ7Vub+jC5hLXEHyYLpFgcWpCNaoqCXKnHlG93Uw==
X-Received: by 2002:adf:e7cb:0:b0:343:3523:da9f with SMTP id
 e11-20020adfe7cb000000b003433523da9fmr200434wrn.7.1711662890479; 
 Thu, 28 Mar 2024 14:54:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ch9-20020a5d5d09000000b0034330c9eccasm2212018wrb.79.2024.03.28.14.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 14:54:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 22:54:48 +0100
Message-ID: <20240328215448.66328-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711662890; x=1712267690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zzJ/FFWwG6qC9HWzFovWNvkLmeDXL4FcCh5vAP+2QRc=;
 b=Zvihe5v8cAOwLwiijVOC/4TsPmtqOS3YLxdgbbnNz1D7CS9JrlfKqn9kFbAimXKZOU
 IuvTPx669ysJevG1601Ozn9zSb7xvENRmzrKEdhKbX1FeLaldBkz48c8RJmmdKNh9X9a
 d4zXOVVnhNovj56HW9XoeekFoy1CY8+xKC8+1VT+ERgX9E0i4rZ4e4P3/V1fv7zlqmDY
 JPgOBhTWOZUU0uzNG1/zK7KfaTd30EvJkQHS/HJuUuelqbafPDNjBE0Zg/DFW+/aDqD0
 zRUYBPnVMV07EDPBJgGqVuZsluqB5zVBZsAkiT9sXhg4lwVwHbAGIssF60TskTV8PKMs
 DDYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zvihe5v8
Subject: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/libidn/libidn2/-/blob/v2.3.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn2/libidn2.hash | 2 +-
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 1051231bde..3d2a41a00e 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,5 +1,5 @@
 # Calculated locally after checking signature
-sha256  93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f  libidn2-2.3.4.tar.gz
+sha256  4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64  libidn2-2.3.7.tar.gz
 
 # Hash for license files:
 sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 9d24e93d27..59db3662e4 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.4
+LIBIDN2_VERSION = 2.3.7
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
