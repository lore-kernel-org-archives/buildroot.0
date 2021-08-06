Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B596C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1226108D
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C1226108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2B94059F;
	Fri,  6 Aug 2021 21:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22dyFI5ebYpO; Fri,  6 Aug 2021 21:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88829404FC;
	Fri,  6 Aug 2021 21:25:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 869371BF5B5
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74722401CF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VtPd1v3CXCLY for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:25:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CD12400DF
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:25:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso9855274wmg.4
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXt+nFhM/YCxBUzd7TrfXtJ9w3/SaQUlyUp3RMVKtlg=;
 b=Oxt2jgPk6NiOJezDI2ajkvaiQTmFjIWSRcbVHcqI9QRxuOHsL7MoqDh6AV1s7T3pwS
 YTFIGXynUhCL0TFSGT4OtP9gnFR/pbp0tbTj8YRfLTYQ4VNgxS6cCNVtk4WGx7VcxaqL
 eaYcHMUnG+gcYcQ/yQX3sixa6c1sK5VUEA+D3jdxblL98exasgG15iXWdbDfaO7bJQoj
 u0IqkVZU7vyG6SNxwLQ8m0mxKUSwfgdVZ6OrFNl8UlI9lzoDVAICQQtzG+FojmxZYbNe
 nrx3fy6CvXTWK3VpxMdRFFo86liatxA+i8sVjxAJjp7YSmzPgYE6Ii0g17CzdHPlbrmd
 ZaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXt+nFhM/YCxBUzd7TrfXtJ9w3/SaQUlyUp3RMVKtlg=;
 b=cBHvI8H3V7WbFUgBWSyv6pw2bpI79f/zrEj2juNUv3V7VP80R6ztl18mKkXaeasCtx
 MpgjNQ+UX2mypLgnitSdDXgV03dUjgsuNd9tXRXUsxLXX8KTcaSELn2fwXQwyUuhgAs/
 CwXHSw9473srfTGzOXVnD0XAEr7blDBFoYhaMPBJN+ugMibki+JnXiaz81B6Po9ZSuRa
 jC6AnmTznLAHlcZR79zVAdY9FM0C/0cFg2mGcIkZwSITK/ATeaEP8b3l9i+/s6hMhR97
 pTQ9xnb2Jyqei+kAjGMQZPihfq4FDaZNrg0Pg+5AeAyilGq6uMZXyEMdxVDEKMatgCbn
 VINw==
X-Gm-Message-State: AOAM5310RPe00077FiP9gPDZ85VVE+NqNXBu2F+nnOAb4lJjducwVWkR
 q+gzSPXZjzigXiPnmh6qvvLdttPivTdo/g==
X-Google-Smtp-Source: ABdhPJzKIxukPOC4Tg35LT6WXzVrE3QnU39mhuPnTzmNjOJ+B6nMt5ANkEroz9svq2BSL9hk59wtlg==
X-Received: by 2002:a05:600c:4f0d:: with SMTP id
 l13mr5187668wmq.18.1628285115161; 
 Fri, 06 Aug 2021 14:25:15 -0700 (PDT)
Received: from kali.home (pop.92-184-97-136.mobile.abo.orange.fr.
 [92.184.97.136])
 by smtp.gmail.com with ESMTPSA id w5sm12448370wro.45.2021.08.06.14.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:25:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 23:25:06 +0200
Message-Id: <20210806212506.116451-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xen: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

linux.c:165:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const long long unsigned int[]'} declared as an ordinary array [-Werror=vla-parameter]
  165 |                                  const xen_pfn_t arr[/*num*/], int err[/*num*/])
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
In file included from linux.c:29:
private.h:35:50: note: previously declared as a variable length array 'const xen_pfn_t[num]' {aka 'const long long unsigned int[num]'}
   35 |                                  const xen_pfn_t arr[num], int err[num]);
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f70d060cf50254694113f19f50a8ef96ef33dd1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...osdep_xenforeignmemory_map-prototype.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch

diff --git a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
new file mode 100644
index 0000000000..170d1c22c2
--- /dev/null
+++ b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
@@ -0,0 +1,33 @@
+From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
+From: Anthony PERARD <anthony.perard@citrix.com>
+Date: Tue, 1 Jun 2021 16:41:47 +0100
+Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
+
+Commit cf8c4d3d13b8 made some preparation to have one day
+variable-length-array argument, but didn't declare the array in the
+function prototype the same way as in the function definition. And now
+GCC 11 complains about it.
+
+Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
+Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
+Reviewed-by: Jan Beulich <jbeulich@suse.com>
+[Retrieved from:
+https://github.com/xen-project/xen/commit/5d3e4ebb5c71477d74a0c503438545a0126d3863]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/libs/foreignmemory/private.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
+index 1ee3626dd278..5bb0cefb0987 100644
+--- a/tools/libs/foreignmemory/private.h
++++ b/tools/libs/foreignmemory/private.h
+@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
+ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
+                                  uint32_t dom, void *addr,
+                                  int prot, int flags, size_t num,
+-                                 const xen_pfn_t arr[num], int err[num]);
++                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
+ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
+                                  void *addr, size_t num);
+ 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
