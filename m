Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F40C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4940B60F9C
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4940B60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9CE84057C;
	Sat,  9 Oct 2021 20:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84YsUjmMn_GU; Sat,  9 Oct 2021 20:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5681C40670;
	Sat,  9 Oct 2021 20:56:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAA61BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F110824D4
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fj5FloJAzGwR for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5B478239A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:31 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id r2so6769938pgl.10
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6CNHubw1/qezfHXfL78dhEevF7MrsfNImsuQlUoU3FQ=;
 b=TTFzrxhe4vfzLm7gb/oa4azpMyKGxKpx+K4PsaQfV9tLG+qtOTBws4A2KhSLq/hWVf
 q2jAnWG128g1gK9m7+MoXYCZBfJV4N8gku/yu4tNiqwMzm3aqB1SlArAYo+YBZVRoB3r
 MHrCHe2IhIsV/eB3rgV8WiC6FgeejCXD5kfMaUvuB4qydo4N4FPC/AXB+FfAxjB8tfd5
 LZpo/DMX2lRouX9m31v1FlssPiXth3gVaJSo7TovJHFuctUYHrgbKbErBG9h/1k7jLQO
 CgU+P6F3Bp6LnKZ64Uf/w9KHAtIB4mYqKV9uqP7id0wh/rLTTtx2mpD3zkRpYPswa4+9
 9Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6CNHubw1/qezfHXfL78dhEevF7MrsfNImsuQlUoU3FQ=;
 b=pdjkscm4vG9gPOfYfgC0TsmTjZLa++K6+Q2FVsfoVqZXFiKTNNAoRWshziKZJFXLfJ
 TQXbfXJQqxEFk3JU4X8M+uMnbuPc7Xj7QuAegdt0ehe7qKmpEeOnyt1kXOCjxscI6bIg
 J7S1unoUJ5z9aaRhH+krAS6xXK1zfZ4ayGzVyUjRjz5nt+X775kbzqiA47ZDhE3J4Tu8
 WU5fT9gKX6R07AzPVg8mz1Ynm5OvZUeFA89xfIZ2nnIV862jck3+RMdTJe2Qq6YDXcaO
 CdpCJL6VYUvm+8kfZt7CJYB7JDPai2dWL8ea3n0vF38n5P/beuC30irFpJR+qX7pijmA
 jE3A==
X-Gm-Message-State: AOAM532eqLf1IXkiEQsRDRl6fXJhCxnN35nahz9KG5/hZaSObsVRlO29
 p9SxreVXKvjuCLj/5xQNXYag3qXJGQxS0w==
X-Google-Smtp-Source: ABdhPJyPqeiC8gWDo3SLG+8b086TwciQPoB0UkKllxrtYthqZlhMibEOwNTRh2bAdUGn7ACfYh2MZQ==
X-Received: by 2002:aa7:8116:0:b0:44b:e0d1:25e9 with SMTP id
 b22-20020aa78116000000b0044be0d125e9mr17240575pfi.53.1633812931007; 
 Sat, 09 Oct 2021 13:55:31 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:30 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:07 -0700
Message-Id: <20211009205523.3137859-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/20] package/python-git: bump to version 3.1.24
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-git/python-git.hash | 2 +-
 package/python-git/python-git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index db3d743857..0c8c764bf3 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,3 +1,3 @@
 # locally computed hashes
-sha256  78baf9fc223536e38a6e0d9241536fedaecf79bc000b3a05962257d83571fc5d  python-git-3.1.20.tar.gz
+sha256  8282d0d1169a3a98546979bfae1524608670fadc4ca7636517aadd428e0cfbeb  python-git-3.1.24.tar.gz
 sha256  fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 0e158434fd..9b2771ca07 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.20
+PYTHON_GIT_VERSION = 3.1.24
 PYTHON_GIT_SITE = $(call github,gitpython-developers,GitPython,$(PYTHON_GIT_VERSION))
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
