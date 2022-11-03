Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731BEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA42381EEA;
	Thu,  3 Nov 2022 18:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA42381EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGsTLdYRGMHY; Thu,  3 Nov 2022 18:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109DD81F5C;
	Thu,  3 Nov 2022 18:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109DD81F5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 510CE1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B38081EEA
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B38081EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxXpegQfucp0 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DAD81ECA
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47DAD81ECA
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:29:24 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id r81so2084251iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iwVmLxttfXxQZSZTOcXCz3JUpPB8k14RFfQtAllNI88=;
 b=Xc3dmG7qbxRfBBZfMC8F7p4yc3sBCX6YMbMfMwkJEjDHeeKQvJdR8w9KE9AMrHybJk
 of8L85XGU+J/W+IYQvMUR0CcfLmqQphD57cH6u3bs0Ip7CRbDUvERNoS3ilr8GRN8Rx5
 W4zZywkCo8AXdClJJyvPwn24+z2+41+t7msYYSLUGKtd4E95du1cHzV7HwHLBH1OV0dR
 eQcmRJVveHhDrNexyibwNPUg1axtrQVYW2Ctkbz8IYKYgVCnV+RBGzJdfyarHPd/GFdD
 4b9rMNSldGvKhsBmoF7Fjd++Ey1fziwgIZhI4ot4QOcHHc/rWjYfUl9j35JUtMnixtg4
 9I5g==
X-Gm-Message-State: ACrzQf27ln/zOjzBd8P8O7el6ri0RKt56xU+0UMZCvH/hIBZ+871d5OW
 87bh3YlXs00cAysZ3ev1odmKkhoEOjbIHzEw
X-Google-Smtp-Source: AMsMyM7kh/5xvf/ADaJfFfcy/UmyqYJWAZvHZ569Wfs6b2cBjDvbTCDtJT7NpZXRVXUSUbuCtGLz+w==
X-Received: by 2002:a6b:760f:0:b0:6d2:9e3f:8a1a with SMTP id
 g15-20020a6b760f000000b006d29e3f8a1amr11894893iom.14.1667500163027; 
 Thu, 03 Nov 2022 11:29:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 u133-20020a02238b000000b003634aa4a55asm432476jau.82.2022.11.03.11.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:29:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:29:21 -0600
Message-Id: <20221103182921.1128266-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iwVmLxttfXxQZSZTOcXCz3JUpPB8k14RFfQtAllNI88=;
 b=c2F48Sh3BdOpa2Je1nQgk7e/a3+9EBaBoEWxWQ/VAIR+57/BCZOoKLgkvsl+Y+0u6k
 iaKEx6dmSUW5FOrvwaFmMa/dLE1OvKt0FgYDiWAL6BqYPpMIE2ABHqt5qgazQO12cYSR
 rt7ZStwLXrqBk+Y0oAE0AKozMtNAGMTI5/FivhHx0w9a9ACWLhoiXX9vECSZunWyrvn6
 8YjBg8m6hDFjv+3utEuEJ7H5qhgUTgwGi+AansLaufroz5p/zenlbHn18aBkZk9hUgP3
 SFNbpKTA7CTdWoCJHBIDMY3vo1rrR/R8Mg2rFBL/jJD6EOPXEUmnFw39qNybYu2zWGCp
 nAVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c2F48Sh3
Subject: [Buildroot] [PATCH 1/1] package/python-pytablewriter: bump to
 version 0.64.2
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
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 27a84f5fda..f082542dfb 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablewriter/json
-md5  4909dcdba8c6df35e14dbecbc6c94b6c  pytablewriter-0.46.1.tar.gz
-sha256  9d52ecc84bb89197c312e193b4ff04a3c934b914f3c32e4826d44a0acbc7764f  pytablewriter-0.46.1.tar.gz
+md5  0eaa4a2429d22389b5e4b8c5f5135bbb  pytablewriter-0.64.2.tar.gz
+sha256  99409d401d6ef5f06d1bc40f265a8e3053afe4cbfbaf709f71124076afb40dbb  pytablewriter-0.64.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index a63f7f8a2a..d865a89330 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.46.1
+PYTHON_PYTABLEWRITER_VERSION = 0.64.2
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/bb/86/d5f3dfec35d2d7583c9f3f1d731adf729851d1fe01011f07a747eb8c7df0
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/a6/e1/50c1cd9734a9edc1386913b178f9e4757c1bc37665c1855a6596c25957d6
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
