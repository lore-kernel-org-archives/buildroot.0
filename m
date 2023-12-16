Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C12C46CA2
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241764179A;
	Sat, 16 Dec 2023 16:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241764179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RawMi9BJFqty; Sat, 16 Dec 2023 16:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB3541836;
	Sat, 16 Dec 2023 16:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BB3541836
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 629671BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B0C400B8
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B0C400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4Bv_DJBrDMf for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D81A40146
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D81A40146
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so16252275e9.3
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743004; x=1703347804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sYZLrsqazpTy0MHZviDjEebIeZMJN6qXHR7zhxwQrvw=;
 b=kB6fhOCL/5b/d56ZoXbJ+WC/2Js8QSe7M7xxHgo8dwo/09RlXSBsNd9tthtZ4DqLMi
 Top7JvhegEYbVe/E5WawrV3bzM6zne33kzCzRGKHGtyF2pGixS665fd7vnFd05g8eQR6
 4EpuerrW7UmqyKWiohquDNXbVyGm39vdJb0YY/hPhF9FAB1ymut4xa8mXhPZF9cdo82S
 JE5qBittIhQr35lEbpSGNoY7l+c16ajVFkrutXPy7aMr37lAstY8D6JEwENT1IjSVIXH
 TcpfZHGycUek1Qt3enkxWDgxwTw35zG1z7LFNWgRTxBkqmOmV0SK7OYhiDUTuk3fOlOi
 gqjw==
X-Gm-Message-State: AOJu0YzCou0jpajjgYFBxMLEDs0MOXjDvzhwfogGOKmuh6okKWrpxQ4E
 /Pi7vQ8ZF3GnsEsUayT45qD5u2Mprmg=
X-Google-Smtp-Source: AGHT+IF40wQQPv80p7MxS3dwHpgixCPJqyl3FbyClx1AE8aVtsdqSCJqFOwK7LczJnLJhrOusu2NCQ==
X-Received: by 2002:a05:600c:1d23:b0:40c:6a86:3f2e with SMTP id
 l35-20020a05600c1d2300b0040c6a863f2emr1955643wms.96.1702743004194; 
 Sat, 16 Dec 2023 08:10:04 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:03 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:09:57 +0100
Message-ID: <b735aab8208cfbdb4423f217d22a8506ed574ef5.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743004; x=1703347804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYZLrsqazpTy0MHZviDjEebIeZMJN6qXHR7zhxwQrvw=;
 b=MoTUOm2yi9JfjwRe7o48cd8RfvJNnKreUBp6i98/B+bfM4C/T68xI4sNuiNQlrdCei
 uAbaKC+fwIlA0Kd3ohyX7+b8O8JY3ZjeqCFvPWBESjQJTgdqDqSW9kHWhrtNo95ZdUEG
 ZwSU7Gz1T/nyPXxq8yOEHrAfgFPlNi/ZHc+5GTBtzacmh5xOudONtQZWDBu68z7l2N59
 PIN0V/wn76Ujrg2qz1QqdRZ7QNsz3noFFdk0r+gcyGKcIN8MqXYzq6Tpb5FjwIOSpiyd
 VdTeVfalDxBe0+b09Hb6bvwop7UAl/ExfiEIZm5O8gn7spIWGeFnJST354VIwbDCyllJ
 RfMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MoTUOm2y
Subject: [Buildroot] [PATCH 4/9] support/docker: allow the br-user to become
 root
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When our Dockerfiles (and images) get reused by users, they might need
to locally add new packages or tweak the iamge to heir local needs.

It is posisble to become root in the container, but implies running a
second command from another terminal, like so:

    (term-1) $ ./utils/docker-run
    $ colordiff --version
    bash: colordiff: command not found

                (termn-2) $ docker exec -u 0:0 -ti NAME sh
                # apt install -y colordiff

    $ colordiff --version
    diff (GNU diffutils) 3.7
    [...]

Usually, however, people are a bit lazy and prefer to go the traditional
way of using sudo. ;-)

So, register the br-user to become root by running (exactly!):
    $ sudo su -

This will allow acutally becoing root without prompting for a password,
but no other command will be accepted, and no other paramter will be
accepted either, so that it is still possible to catch packages that try
to run sudo as part of their build/install process.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/Dockerfile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index dd9b9c0f93..b62cf32824 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -49,6 +49,7 @@ RUN apt-get -o APT::Retries=5 install -y --no-install-recommends \
         rsync \
         shellcheck \
         subversion \
+        sudo \
         unzip \
         wget \
         && \
@@ -60,7 +61,9 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
 
 RUN useradd -ms /bin/bash br-user && \
-    chown -R br-user:br-user /home/br-user
+    chown -R br-user:br-user /home/br-user && \
+    printf 'br-user ALL=NOPASSWD: /bin/su -\n' >/etc/sudoers.d/br-user && \
+    chmod 0440 /etc/sudoers.d/br-user
 
 USER br-user
 WORKDIR /home/br-user
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
