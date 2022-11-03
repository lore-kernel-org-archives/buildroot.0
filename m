Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7456C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47933815CD;
	Thu,  3 Nov 2022 20:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47933815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XK7NrvI0Puh3; Thu,  3 Nov 2022 20:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4133A8143F;
	Thu,  3 Nov 2022 20:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4133A8143F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D31391BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADA8940928
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADA8940928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tq8BEp3Ktfb9 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703B14090B
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 703B14090B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:25:30 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id i5so1219627ilc.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DvD6JNN5f9pbFSDTUbfplbo7ztcxuEhTLpLhQ7Dbw0c=;
 b=6jG4CtM9F2nNzyRqBravohmSszD8Ob4pYp6AyX4SWPDPN6QK3oViF51kcCD/FHmqQk
 JmB49qSfd5lMZzCWHtysvre5YlwzcrtHsnKq/S+7OUC+IJi4fCkq/qpYT1ovLIIr0kdP
 6loVguRpqiF4JS2nAhMNBuBBqSLWS+rv0YoR1zBBC7hg1AgWIaJbj9cu1NcfdfEO4Nqd
 JzimO5T8rXONS9XPp3XeUP2sGTtfFy60EyRTTKkzxtcDX6jkBu8uwJsMH3QWgbiIUh6X
 bdblinQCYMwU72TGAvbafKUkT+j9uXM6bF9bz++t5PMWuHdGVtGvHdXw31mAWVhJnFxs
 Bvnw==
X-Gm-Message-State: ACrzQf3OmnaCeOjM2HyomlFpavXN7Ygp0hFEvJuJ8IH4D8nnkh2Fv3YC
 ub+xAUoa4Xa2jDfe7q7sz5q3n5iO34A7n/Ca
X-Google-Smtp-Source: AMsMyM7wb5woBXl2NG2iR43WrITH8VWqsRRFFpg9mPcIe6SBcdBoGj1xkrPgm7sBZuGNbWTe9wiXoQ==
X-Received: by 2002:a92:c6c3:0:b0:300:96a0:9cd0 with SMTP id
 v3-20020a92c6c3000000b0030096a09cd0mr18663326ilm.145.1667507129275; 
 Thu, 03 Nov 2022 13:25:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m18-20020a02a152000000b003636b73cf29sm528731jah.8.2022.11.03.13.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:25:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:25:27 -0600
Message-Id: <20221103202527.99721-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DvD6JNN5f9pbFSDTUbfplbo7ztcxuEhTLpLhQ7Dbw0c=;
 b=WeopEzYMTKjo1jyxYG6juTScDOxRY/Ijt1kPdcNBq5cw09NtJa4CM1kt5a7QQcm+U5
 FEb4UcNXp7AA6zZf8OK+4UAKrH+/czEAlhYV1rPeGZEIkjzCLSmXi3W0sN7SSFowXWir
 Q9x4UPyUwlD2MlHp/dVY/Y7v3FbYv6CgOyGlEq3mnKs/KgG4/HaajDgBs+A6vhPUBw1A
 meSymHlGYrds97pExCTbyEQ4zCSy2G1RiwrmM56SXZgbU9Kzv0Bil/XmCbrG7azmsZOF
 I6HT005UQjlfqM4QwHIueQK4qWp1NjQvvZj1R6VPCq43NOz4/wiOA8T6pO0ucQuBriOx
 Cucg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WeopEzYM
Subject: [Buildroot] [PATCH 1/1] package/python-txtorcon: bump to version
 22.0.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 220b5fb23e..9c8e3599ea 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5  dbb53821a3ce3e921e09c5de4f722fdb  txtorcon-21.1.0.tar.gz
-sha256  aebf0b9ec6c69a029f6b61fd534e785692e28fdcd2fd003ce3cc132b9393b7d6  txtorcon-21.1.0.tar.gz
+md5  17a84954a4ba13fa6ee443129bdc401a  txtorcon-22.0.0.tar.gz
+sha256  89a1b65e32a4b369d67e6c166387fbc468cc5d05227448d239a5e7e9718aa053  txtorcon-22.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index acf586cb8c..c17d5da074 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 21.1.0
+PYTHON_TXTORCON_VERSION = 22.0.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/eb/43/2426009377cef519c53bdc8969590cb100e9fd745846859963c881c6d176
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/47/ca/7941660345c769637a97bdbaf25202460fbab35eead55c538fb1fe61b71e
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
