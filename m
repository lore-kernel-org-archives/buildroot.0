Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9820EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 00:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1183980CEA;
	Sat,  1 Jan 2022 00:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eiXTi9yGOjK; Sat,  1 Jan 2022 00:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7D480C7B;
	Sat,  1 Jan 2022 00:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2DBA1C116E
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 00:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEFB660DFD
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 00:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jN_YoCfs4jKc for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 00:31:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E33D760DE5
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 00:31:27 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y70so34287079iof.2
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 16:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sOxDpHrlyJO4s/dXurU6FcRpFmi3NZv3LruMhqr/arE=;
 b=izHiBiCGnkWO4K/wzGlEGSCp861Qs4t3ikg2WO0sP0pS8nAYsXKWnikw8LFctwbe9M
 zWDb9VRyCZncjUxJ9XPpQU3o4pa6FVXdYRfKafCXG6aqANtpcQuvkHEa9dj3GcIHQwQC
 5jsm66oak9YTlNbKvWe3UzEC5YF0dGuV0KGNk0xQKmWBE0RRz3S/4IjlEhqYIpi7+Bou
 UOaC+Fldmnq76AuhF2tG75xtonmy/a5WvzsAhOfdINdvLU1QZ1JHZ9VUe1Iu1LYOOvMH
 jStChdlf0epvqr9V8H8kUmav2ajAPaqKPW+QPAXRxr3TLh/gI4FliocdTJ/uUpClNScE
 fodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sOxDpHrlyJO4s/dXurU6FcRpFmi3NZv3LruMhqr/arE=;
 b=XTzU2qwL8tgfS1qT0A9Fx4Ntmo67Rwc2nmuU1///QulywRFgDkMK/RYJT2iepu8tTg
 D2tjHxLHI+4RS51Z/0bgFcJDuHorh+X8VvaThGNiFQZ7+1NDbijItEdro1oGN2g+EoC0
 fAtVcbtnkPj/L59VT439VqDEmxdb6oclf9HbtTYXx9oqcpFwDLYwcHQ43FSPHzDWvekl
 oiwWT4ziorDP6yLiM/Si5x4pndmKeyoHSg3L5MUJLmMljSvc0DhBZvHUdR8A5dHpUQbt
 QSV3wBRVyFjLlg/td+BzwOJLlgJ1haAA6Aczth9qDqahHvMKrzPd2/rS5AUgyTUVa5uh
 5zcQ==
X-Gm-Message-State: AOAM531l9JPQ8a7Z45QOdwzHoKXbur5KF6JYTIqiN497Du1AYKH85XTw
 nnRmAIhJlFHCS7MhqbJGz/vVx/dPJRw=
X-Google-Smtp-Source: ABdhPJy87hAuA5dRqdSL7N2Yo5QeCsfkj5+I1eySJOYKRpKDN7ZKcKbsOXyqnom6HbUM+lhF/3dMkA==
X-Received: by 2002:a05:6638:260b:: with SMTP id
 m11mr16960384jat.280.1640997086861; 
 Fri, 31 Dec 2021 16:31:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id j11sm2991627ils.31.2021.12.31.16.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 16:31:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 17:31:25 -0700
Message-Id: <20220101003125.1957739-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-sse: bump to version
 2.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to full text removal:
https://github.com/aio-libs/aiohttp-sse/commit/307fd35a84a66b7fb5adfd70cd5b7d709fa8508c

Fixes(python 3.10 compatibility):
  File "/usr/lib/python3.10/site-packages/aiohttp_sse/__init__.py", line 107, in wait
  File "/usr/lib/python3.10/site-packages/aiohttp_sse/__init__.py", line 144, in _ping
TypeError: sleep() got an unexpected keyword argument 'loop'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-sse/python-aiohttp-sse.hash | 6 +++---
 package/python-aiohttp-sse/python-aiohttp-sse.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
index 2f21da462e..224601450c 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
-md5	d2f394fb75f591045b2c94fc17c8533d  aiohttp-sse-2.0.0.tar.gz
-sha256	547e1eaa129749f090d02b31956215edbcde74ce99721f5f0ac902a9ccb1202e  aiohttp-sse-2.0.0.tar.gz
+md5  822cd0c30325e8a711101c1a1ede4058  aiohttp-sse-2.1.0.tar.gz
+sha256  dfe8f7271ab4470891fa1bfa1913d6889b3d19015dd3d3a4cab949e66971bbca  aiohttp-sse-2.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
+sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index 7a7a0d0a70..2aef1579f5 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SSE_VERSION = 2.0.0
+PYTHON_AIOHTTP_SSE_VERSION = 2.1.0
 PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2b/50/e127729f7df53c32c96b5c71932a7262cad40c83f1e19c218b068c816d51
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2f/3f/cc4f5a3fe6cb50ad5b9d26bb7738c5da1f61645b517d4230df2fc32d89f0
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
