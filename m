Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247DCAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B766740EED;
	Fri, 26 Sep 2025 10:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNGKn2hL4QRh; Fri, 26 Sep 2025 10:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0214040F0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0214040F0E;
	Fri, 26 Sep 2025 10:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E56F177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A8C340E95
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IqAlV2lruoN for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 217DE40D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217DE40D09
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 217DE40D09
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so21582785e9.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881177; x=1759485977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uM6crlnfNkYr6tsWM+AaZl+oDK7vTmSKNcfqsroPvQw=;
 b=H6wjIDLiW1bRojZU7iQoXnrBZ6cA3IlZp+c3mmDfGRGcKePuoc5LoId1B2gaaiqvfZ
 hd30TJDXjg2Un3XMCDKv4CS/VYlZE1QNFAamOppyzWB4FcWw3JYljcEDbPz0ygGHY8xc
 fPEbkZ4X9sf3j2HREInwlxkrFcsg36NnFd+oy817YVD3n5/KgLo4t/cYu3xaQLF/6lAG
 A1+KGLVq0mF2ELdi3CnicX30fhApDdq+XJ2HBPMvBLISyRL4vgy2aHCzMM01bvtcmezb
 xZLK8kb+7kpXM9VMWp0odHOa5yL8Q7I1gr2vOf97oIecxm3EyJ0MLTYck2uckBNB5h1L
 SQbA==
X-Gm-Message-State: AOJu0Yy9IlqqswSZuuXeInApctk8IAeHbXXA0jrOJ7r7aUamhonqLi4Y
 vA2UwLpskxvvcB7eHEW5FZCpUuTE9TTZrW3KBU76YDIiBqnJ/MFFD0qiSsDrnXbY175f+YIXynU
 +T8bJfqc=
X-Gm-Gg: ASbGncsSJEwuSj9jJT8T2bNAQnqWliXwgB36Q3PTRKP6PuCXytduE2hWJVYV4urFgJc
 ikP3hvOAqgKSa1ckJgq0txZfe9ANMb1Tod19trir6d8h70KDbWSDvlT0v1jgCL2jUiGC2ElqrKA
 7dC7riqFUzPCK0qkoEYQfprESSY0ji0sPTeavZru/iTy/mWXjeGGKI3cc0PD3tPTE5bPYsf7wvB
 mloRDOsIiIE6+4TYXD+FthL1qtUw/RKocsoxL9Ym2hu92At2kWxF7hp4JGE7kG9TYeJok5SajtB
 0ZEz/3ZHtv3b8tITdbZ1FEf6tlXOGZ3QQFUNkNTJ1bk6+4pagQNG3V+OuDFbndh7oaGjPTukeXp
 LiP1lsWII2q3UaM3kU+a6LDl6AO3P+7gQc7NMwQKtqUYIvPwH4F7hFfkPbVLpErb8g+0552yDjg
 ==
X-Google-Smtp-Source: AGHT+IHierQyTVNDw0+vpreSOl+IJzhlI7Gi8lXIlWRl+lwXNMECxEtCKNQChsbkn3Hr3gtghd4eBQ==
X-Received: by 2002:a05:600c:1c24:b0:46e:394b:49b7 with SMTP id
 5b1f17b1804b1-46e394b4d15mr35904385e9.37.1758881176809; 
 Fri, 26 Sep 2025 03:06:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm112622825e9.21.2025.09.26.03.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:06:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Christian Stewart <christian@aperture.us>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 12:06:08 +0200
Message-ID: <20250926100609.4158676-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758881177; x=1759485977;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uM6crlnfNkYr6tsWM+AaZl+oDK7vTmSKNcfqsroPvQw=;
 b=MtkTf6b3FaPMx5u+BlkGMWPEnvoPpoMbmHw84wMq8nvE0NIBRelskD/VokumqPZVLp
 FLc1yjDbUJgP7GK4yVGAbBHTWlPmLbzg0G0LcHpvANqi1Z8LTmyswZVksSNIWMm/bX+1
 QFUxqeJQaW9C9q/hMJVDyxLWMKxlzcSHfnsuQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MtkTf6b3
Subject: [Buildroot] [PATCH 5/6] package/mjpg-streamer: fix
 MJPG_STREAMER_VERSION
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

Make MJPG_STREAMER_VERSION compliant with release-monitoring.org.

Fixes: f1adb7952d5176c33581db0ded48740043d257fa
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/mjpg-streamer/mjpg-streamer.hash | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index 980549f657b4..8afb8b357384 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb4de7fed9f8b15ee6d8ca2b0417aff2854cd018582b7090e28eb0aaa19bc808  mjpg-streamer-v1.0.0-1-g310b29f4a94c46652b20c4b7b6e5cf24e532af39.tar.gz
+sha256  eb4de7fed9f8b15ee6d8ca2b0417aff2854cd018582b7090e28eb0aaa19bc808  mjpg-streamer-1.0.0-1-g310b29f4a94c46652b20c4b7b6e5cf24e532af39.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 5e52b45b01c1..9a39cd0ff482 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = v1.0.0-1-g310b29f4a94c46652b20c4b7b6e5cf24e532af39
-MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
+MJPG_STREAMER_VERSION = 1.0.0-1-g310b29f4a94c46652b20c4b7b6e5cf24e532af39
+MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,v$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
 MJPG_STREAMER_LICENSE_FILES = $(MJPG_STREAMER_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
