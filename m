Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B67FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BE9B827D2;
	Sun,  5 Dec 2021 10:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRD-bAU551Fd; Sun,  5 Dec 2021 10:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF8CD827A1;
	Sun,  5 Dec 2021 10:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 058AA1BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E837E605FB
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMZSbGAYbyxv for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:54:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 583CC605C1
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:54:35 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id a14so14243122uak.0
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtN9z387u3hzy8GPUTQIGWUMBXugOHBBeIPMmwzMyOk=;
 b=RzWU54Zh2jg/gu6Ww+QpSiZY+upeoYgkY+Hz4omiP8kgRTZmn1QUuwuGfYaHn5BWIT
 xBVLXsNmdtPUQvFoHqg0HPfe2wA1lPA4oqJ3GR8ehEQVDTdBrUw480+kcgLZE9yxZJIo
 bJ1czM+pL2GcNu1/8/K+dg2kDsPWum2n7ALwK998UzgzbZ75H2XrL84aKYhbmkI/LvTN
 QxlvWMhZPwwxADBO592n1eMnmWXAnXlUTUqMnLI8ct11zQ71+qP7WGm5pKGqpxb5dn2u
 2uM2V+45QO8oPD5h8HrZBtMQSP0OrumLKAH3lvN4q77BKq2oiLcnKRhD3fABqWvLXvZT
 DzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtN9z387u3hzy8GPUTQIGWUMBXugOHBBeIPMmwzMyOk=;
 b=JKtaL9oOLJ1Rle7CjbYzCs5YNjocFn/oRO/5Z/8415MJ+VvSL8/n9SJrcH0EAzoUim
 UX87HcyX70AjqgYk6NioKNGUahhidM4QNX/EvEQqYNYGLLB4zq6kIWlAf5d26TCmEbDr
 t9mnfZYfiRytrMCGlBBDO0doxbFjQYJ79sPSZ3zfGFTwi3TzA9VtaKzheuE4tIqBPtx/
 9PMPwuOrIMo0pXJw35jRE9oURtw0SE0PXTptoLF6IlkUgWFOjcdjk9EkGStsEGZH6ipw
 Jkqjl2K1fRVe0B1pkEL4ACBXqlRPdk+jzRWhgQS9b6ZDILS+3yOWpyu3tV7dTmNyztOS
 PeQQ==
X-Gm-Message-State: AOAM532X3R1By0EAeBPW+U5jbBqJfn3fMToW/8FA/GYEO/cz0hQXPNof
 xisCrw6KGeEfVKBWWuQZxhdH7aEDPLo=
X-Google-Smtp-Source: ABdhPJzzhOluSKvyIAgqw8mdcXmHN7xLQcu9mm+Row2A8c01pBj1+HWzICdBfHJZ8PAusFZF2KWNDA==
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr29575111vst.42.1638701674255; 
 Sun, 05 Dec 2021 02:54:34 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id n27sm2417081uab.5.2021.12.05.02.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:54:33 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 07:53:16 -0300
Message-Id: <20211205105318.2755542-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
References: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next 2/4] support/docker: add python3-pytest
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

... so the unit tests for check-package can run in the GitLab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 2aee129668..a5d54b6e9d 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -40,6 +40,7 @@ RUN apt-get install -y --no-install-recommends \
         python3-flake8 \
         python3-nose2 \
         python3-pexpect \
+        python3-pytest \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
