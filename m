Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD88AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 575CE60F90
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 575CE60F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EBF40460;
	Sun,  5 Sep 2021 06:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYyKR8ZIYoR3; Sun,  5 Sep 2021 06:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4B440498;
	Sun,  5 Sep 2021 06:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4518B1BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 429C481947
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NPpY6pubFNX for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B1C98193E
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:57:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so4786267wrr.9
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbkZD3bopsSIclx5ZusSiYPAsqxITxDyBm84mT+3gWs=;
 b=M7pRtGEf476zaVnmk1IhIoBCR7htnocHiRFKjJAcRRptHrJ41sqWIKS6x1twrj7FDl
 nUUoQxBKK2Luqbr2XvvBDKqear3VSRhsIWeraqRskG8bFwnbfhjRbvjXM+ePribDVyvE
 yFwqfStR4BZ/RsM3ZnN2ixxtM65GzZIfTeU4/LQdk3iNo+w5ek6Ib+LHQTKrOFYYfKfe
 QwmRQiLAte1EzmaLxVcJ6nllLaPE2rzcX1fzp5Mn0QfF+rbDtfaWL3M1wDPU3y7CFXbf
 CUjYuKfommr7TkriXzKRYGAgr1BNoUu2Z9kap0bA/ubV2GtpM8PMCIOtIBNZGUcwvHt/
 y3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbkZD3bopsSIclx5ZusSiYPAsqxITxDyBm84mT+3gWs=;
 b=micuDSLdzsBwf0xWhfDBEoRVJEey78FAzrnYB6tUJ50azMT366WN4N9TWVx2bPecwA
 NYvLU5aXghfjzC6J6ocxCxrT0LlSw8rFYY5IlhiK5W7LWMRMwNsqj5mMD0neb1mQuh95
 OBwrMdjPtMCG+t3tzgcVCnJOK609uAf4FJNDuK99yUIIv/YCHkgpGuWBYVbpKmPQvtwi
 Caz91/UOQtIsvoJMjG9TehkKwFO9WQAghK7F5yqnioSDaxHzGp/tbbFgp8eCmF7Zvb8L
 6YDnGLWl1E7j4KZQOgj9Egql8GrjVRaUoAByX0OKHtKYgUDUHcQd6V2zXIDNC806eoGV
 A8bw==
X-Gm-Message-State: AOAM5302Vb1JLjwzVh9B+R3cg2ODxhsq8A0re6G4jbllo/paisfC8yun
 gFxGggnuY0+lzz8J8SFEjPo61lCQkzQ=
X-Google-Smtp-Source: ABdhPJy0woBEktVIiCjntRxt7EHO7k3SgKQAhHWrBlo3MskuIeVbz0A0eMNzHD5TUOxtTm8xF9BizQ==
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr6909218wrt.19.1630825050637; 
 Sat, 04 Sep 2021 23:57:30 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b1sm4219323wrh.85.2021.09.04.23.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:57:30 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:57:23 +0200
Message-Id: <20210905065723.1828689-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/vsftpd: bump to 3.0.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/vsftpd/0002-fix-CVE-2015-1419.patch               | 4 ++--
 package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch | 4 ++--
 package/vsftpd/vsftpd.hash                                | 2 +-
 package/vsftpd/vsftpd.mk                                  | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/vsftpd/0002-fix-CVE-2015-1419.patch b/package/vsftpd/0002-fix-CVE-2015-1419.patch
index 95ad017a1..657af289c 100644
--- a/package/vsftpd/0002-fix-CVE-2015-1419.patch
+++ b/package/vsftpd/0002-fix-CVE-2015-1419.patch
@@ -73,7 +73,7 @@ Index: vsftpd-3.0.2/str.c
 ===================================================================
 --- vsftpd-3.0.2.orig/str.c
 +++ vsftpd-3.0.2/str.c
-@@ -770,3 +770,14 @@ str_replace_unprintable(struct mystr* p_
+@@ -711,3 +711,14 @@ str_replace_unprintable(struct mystr* p_
    }
  }
  
@@ -92,7 +92,7 @@ Index: vsftpd-3.0.2/str.h
 ===================================================================
 --- vsftpd-3.0.2.orig/str.h
 +++ vsftpd-3.0.2/str.h
-@@ -101,6 +101,7 @@ void str_replace_unprintable(struct myst
+@@ -100,6 +100,7 @@ void str_replace_unprintable(struct myst
  int str_atoi(const struct mystr* p_str);
  filesize_t str_a_to_filesize_t(const struct mystr* p_str);
  unsigned int str_octal_to_uint(const struct mystr* p_str);
diff --git a/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch b/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
index 0732c5f63..605619377 100644
--- a/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
+++ b/package/vsftpd/0003-Prevent-hang-in-SIGCHLD-handler.patch
@@ -21,7 +21,7 @@ diff --git a/sysutil.c b/sysutil.c
 index 6d7cb3f..099748f 100644
 --- a/sysutil.c
 +++ b/sysutil.c
-@@ -608,13 +608,13 @@ vsf_sysutil_exit(int exit_code)
+@@ -592,13 +592,13 @@ vsf_sysutil_exit(int exit_code)
  }
  
  struct vsf_sysutil_wait_retval
@@ -41,7 +41,7 @@ diff --git a/sysutil.h b/sysutil.h
 index c145bdf..13153cd 100644
 --- a/sysutil.h
 +++ b/sysutil.h
-@@ -177,7 +177,7 @@ struct vsf_sysutil_wait_retval
+@@ -175,7 +175,7 @@ struct vsf_sysutil_wait_retval
    int PRIVATE_HANDS_OFF_syscall_retval;
    int PRIVATE_HANDS_OFF_exit_status;
  };
diff --git a/package/vsftpd/vsftpd.hash b/package/vsftpd/vsftpd.hash
index 751faf61c..485e5ba2f 100644
--- a/package/vsftpd/vsftpd.hash
+++ b/package/vsftpd/vsftpd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  6b9421bd27e8a6cdeed5b31154f294a20b003a11a26c09500715a0a6b1b86a26  vsftpd-3.0.4.tar.gz
+sha256  26b602ae454b0ba6d99ef44a09b6b9e0dfa7f67228106736df1f278c70bc91d3  vsftpd-3.0.5.tar.gz
 # Locally computed
 sha256  c9cf119e2f9dbcf187fb805ba5aded105db26a693803636fb7228c98460ffbf2  COPYING
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 8daf07c62..3e7b233e4 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VSFTPD_VERSION = 3.0.4
+VSFTPD_VERSION = 3.0.5
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
