Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C3FCA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F81842BB;
	Tue,  9 Sep 2025 16:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsB-12XZ-L6a; Tue,  9 Sep 2025 16:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A8E2840AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8E2840AF;
	Tue,  9 Sep 2025 16:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75ED4CA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C87840E8B
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jP4naCUbKJsQ for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 16:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FA7740066
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA7740066
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA7740066
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:13:00 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b049bd81ce5so208771566b.1
 for <buildroot@buildroot.org>; Tue, 09 Sep 2025 09:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757434378; x=1758039178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=trKkzC0Tf3lKnfMMwBBJtQPwZL+PlSp9Pjoj77xPpfk=;
 b=AkSOApjO4hTMleEBIrbDYEv0q54GXxPS+58fxzKrXrGEz4srqFR3Ln0lAL5z3UFMOC
 yTwALZe73QZpzz6DYvg/YtVJjNJvDhXtyYhW2E69X4OYG+vR/4uFwcq/hV6DlSeTFgWE
 IF3vmgR2aXgM6YIF0GTrhoIGLJV1IMdyBepiZZi72foj/k1Z5ka3jH0xQZBuNJNPITf6
 E5WbMMSEnglsMwmYj3rX08fPhlafrIIU5QSFwATb6Tc9WnrTBL6EKEhsT3GAnwbAt2i7
 egyrL3Ul7+7/B7zpK36ut8KM7rjQSe7+aQD8294MtXSN8PQkccN6oymAOOOO8R7e6ff7
 EH8g==
X-Gm-Message-State: AOJu0YycE1UY2YJW7et5aI0EIrDFo0rUDgUII7EJt96alndjdCLyAb/e
 s9zE2gCjtiD2o7iTPX6GXXeNeiouYK9AJiDPd/DrZ1FeUpvk93B3G5EzN+O6mPfs
X-Gm-Gg: ASbGncuOQX5Ez01KO+IG0OKPSMOL58xA/emaVzNcbFSmbJNcbrVhi++H3SlJCx81aPV
 ReoePvg39F+NQoOSzSp/MM4XQNjdTQtuDls5n72KJl81QAl4+Gvev8o69rhZRhOPdhiUo/Q3zWd
 YvanxlFm+SHMj0RWAcRa88AaxW3RLRgOGtKOjmCM0I672p+qOCyHOyKL+S3jboS2WdOZHBHEFBW
 I31yy+KoVErgK+Qpdg6eqsEewxmFr4SqdQykA47+j5pqtZZAgsgrr9v5tIx40aJtDxRPjdvJ/5b
 bGwUJresi8lF1K3sJOGWHOJCDx/WzsTQDZJNL1UUFqUXFhJeeFtjqlZTIIRTc19rtkAgykDbv+J
 Tvgmo/cfCNNpo70QnCBJv+QLxaJI8yrB0QUOXTeHGZrQHvvryCmDlk2WN
X-Google-Smtp-Source: AGHT+IGrxZbEQkAsNE93GuctS5C9D8EyScCYBURTVkWGnXook5mKcO0oHgapJq3myap8PzK+Rjvz5w==
X-Received: by 2002:a17:907:1b0c:b0:b04:8943:3a15 with SMTP id
 a640c23a62f3a-b049307e6b6mr1713547166b.7.1757434378010; 
 Tue, 09 Sep 2025 09:12:58 -0700 (PDT)
Received: from localhost.localdomain ([185.254.39.93])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07830ac12asm14209466b.38.2025.09.09.09.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:12:57 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  9 Sep 2025 18:12:59 +0200
Message-Id: <20250909161259.34807-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909161259.34807-1-angelo.compagnucci@gmail.com>
References: <20250909161259.34807-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757434378; x=1758039178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trKkzC0Tf3lKnfMMwBBJtQPwZL+PlSp9Pjoj77xPpfk=;
 b=IHgKDmF9plrrwauDM8VWkRFXH1wfYBVCwmlsMhYnTeYHlBUGwA3EbIrBx7nlE8SSFm
 KGuwyHxvhGOm/vUIde57BVKtryn1OxfCNrKxcxhXs+tC6PDBCAIib2nBEVG7lQw0li/B
 +g098saizCI3LYh3XeS8o923G+5bBH2enrLY4ahL6uODxwG+9oa7lG4nMfNffRW1XNIi
 Ym56u1nKqLJBhv1/l700RM6w2lpU7h6wYZAO0tMSIehvdGjLe2TAby7gK8Q6fNXjMm6T
 Hd+JMASP5NU8y5qQjozqT5ZbmerT3+5WgGht2jENyFqeJrdAFjaTV9DSY9ceKpdFV1D1
 ag6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IHgKDmF9
Subject: [Buildroot] [PATCH 2/2] package/htpdate: fix shellcheck SC1090
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

Using /dev/null as file source because the package doesn't provide a default
systemv service configuration file.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/htpdate/S43htpdate | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
index 5971d70639..22e5e6c803 100644
--- a/package/htpdate/S43htpdate
+++ b/package/htpdate/S43htpdate
@@ -4,6 +4,8 @@ DAEMON="htpdate"
 PIDFILE="/var/run/$DAEMON.pid"
 
 HTPDATE_ARGS="-a -s -t https://google.com"
+
+# shellcheck source=/dev/null
 test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
 
 start() {
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
