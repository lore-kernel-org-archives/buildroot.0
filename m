Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D1ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 06:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 890F4409FA;
	Wed, 21 Sep 2022 06:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 890F4409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXKq4TXavNfP; Wed, 21 Sep 2022 06:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4E1B40B7D;
	Wed, 21 Sep 2022 06:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E1B40B7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 129051BF962
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 06:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB5AD82CFA
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 06:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB5AD82CFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwIFryJ1l0hy for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 06:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91C7582974
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91C7582974
 for <buildroot@busybox.net>; Wed, 21 Sep 2022 06:12:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f20so7060622edf.6
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 23:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Z1PV/MTuQwflX9scaonf5QkXDk3zVNGWaHSpBhjWDlc=;
 b=vNbFSIIeHTnGY0b+/25N8PZ5JeMOnrlpMRuhD0U2be+puMxGw6GL7RsEjgmBfbrIVC
 QYW+0k8JxC+mg4LYFekErsOK9PjRo4miKN8WBPbqq0fI+m+mD3EBEftUXd//jOsuuMjT
 Dnnxb7TuRAyLlJaKySQ+Ak+FJEsX0eVBreiN7IHugMNtYASGJLqo3wtjtLK0ycfirU0U
 ObdRP5F6xijxZf3M8ydH71mcht7EyGLw/KktatB2JQ3FmmE5vYLN35HVTnYh91IDz2+T
 Fd4+3tD8Q7W0FV/kkS696U23lzFnwEgIeOZIomharNQiirQLT1w8xZDBhXLxtt43ELbj
 uwAA==
X-Gm-Message-State: ACrzQf1k6coqjgyB7Pxno9vETYyr1JtAkn19l8cIdNQLeOE+9f941q+3
 DY2vN+0ULjYaBBJhG/55GhRe/jfQTfk=
X-Google-Smtp-Source: AMsMyM4zgESDQpqBUOTTzIRwAVXR2Z4lJPL/fL0WKfLR54Uh1itc7Jlepr3SAWh6svir866R6nHK4w==
X-Received: by 2002:aa7:d392:0:b0:44e:67f2:c79c with SMTP id
 x18-20020aa7d392000000b0044e67f2c79cmr22737065edq.278.1663740720297; 
 Tue, 20 Sep 2022 23:12:00 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 kz3-20020a17090777c300b007812ba2a360sm828519ejc.149.2022.09.20.23.11.59
 for <buildroot@busybox.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 23:11:59 -0700 (PDT)
Date: Wed, 21 Sep 2022 08:11:57 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@busybox.net
Message-ID: <YyqrLXMZrKPwqr11@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date;
 bh=Z1PV/MTuQwflX9scaonf5QkXDk3zVNGWaHSpBhjWDlc=;
 b=BiEMRqzS3EanoLcZOYapbA6JoO7qedZXt3lL85+MDYliHO+LGK+LFOjdlmxqEqHTsE
 /fbO4+a0UyfXwlBEC/j4X5cYIQa+M/prVp1CMzR4HcjssHnVI9kuRlIFlE5rzpZ4HZXK
 AmdvOdeet9X195/gRLEP9U2W+6mR7hPOZbj+o66yQEmQ3FdQpePF+4rMMJFKX5bDLj3B
 f5N7VWZB5PORRfOihFdscuKKl++yURcrOcTZYHaGKoiKxT1ulEYQxLN9Hj2d9IquEjXu
 PKE/tYVe8+P2NzDLcUUzENobpsPM29YHKmp56DiPhb6BVOxRevOyhQJZkwj2sm/sBGE6
 6UfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BiEMRqzS
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.7.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

includes https://github.com/ndilieto/uacme/pull/61
fixes http://autobuild.buildroot.org/results/8fa4f0d2821796be312b366be2f095be07dd7b1e

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index f62463029a..6c71f6b94d 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e7598e794f5ec414d993c4f2f7df39e7c72f26e41302b875ddaf040d8103ec5f  uacme-1.7.2.tar.gz
+sha256  0ec8e5bcb8ed2b532572ca4878d30b2a794f607b995348ebc176d566b64d73f9  uacme-1.7.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 2482259411..a70ec3a635 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.2
+UACME_VERSION = 1.7.3
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
