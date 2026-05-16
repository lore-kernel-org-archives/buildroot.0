Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179C7CD4F48
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 01:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56446177E;
	Sat, 16 May 2026 01:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbtUof2jft3X; Sat, 16 May 2026 01:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0252261B31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778895843;
	bh=qeT2pyiI5YGGXnTWe+SK+cXN9IAlQe6lbRLFPvd+bWM=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmHrdenCk6E0z2EOx3hU7G3Pjlu98wd/RK73VS8Q1INEYExTj1wfKzxEOsPqVTlyW
	 Kyy6K5pVH4Fl6c5myhSjcBytm2XIAcDaKxLFkq7SUqP/YUblX4/Ob4gnO6ODh0yB17
	 Hgsefhc2QnVpck87+YoraoV+EIBQysjCFFBrOCOXCV3Gn/R10LU/jMNSHGMDnQ70kR
	 p46ajmIo2OHvWqlDmTjXLEp+LwmV1bi1Sc+3FWQSOTAYa0VsCNJWC4gttXAUgTFpXN
	 OEmpSlCgoXAcXc9t6Ma2H0BigcPyWzBIqoSAnVhZiBwotH38ai0b6RJfYu3B86x/Bw
	 atWxy9lobeuOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0252261B31;
	Sat, 16 May 2026 01:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 911F545B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75B7784A04
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9Uwn_OzLuGO for <buildroot@buildroot.org>;
 Sat, 16 May 2026 01:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5303B849F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5303B849F4
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5303B849F4
 for <buildroot@buildroot.org>; Sat, 16 May 2026 01:43:58 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-836ebdeb969so197023b3a.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 18:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778895837; x=1779500637;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0YTCCu6VB+dq8jxhRi6RM6CbYcyaBj9Wa6KC+K3Rr+o=;
 b=JZ8VUq+owAEgbe3IvY7HxduwLG/LSESWWdpJwjxIGGqawZDNRtMmubAwXF4CHDb97Z
 e8J6du+7VhJU9auNto5YXynSbYwej16KwrZLyO0ckBgmbz/oL8ao5wKesxZ8gKQEl2L5
 mdPdovvHjqRLrFIFxoFxLHVoSpb4wCK2HobsV4b1xaoR/0kBjeYglljzk+qeAqlgjI6w
 kJrhALTmdEvgN/XZntnqpaWLtUbtCsOLp2h58G3TfZt63WVvzxgK6wecFpwMr41Vhcw4
 61JDrPW/bvRDV48kN6TdXyGVp+SDugg5heQjy1SsRpoSAlMaBVTIDmCYjTIoTUO239UB
 MMSg==
X-Gm-Message-State: AOJu0Yw6c9zZADpkgaQjYWbZNCw+Vp1FG5ixfPvhn4OasRCyUQEnwSBm
 grg4rLqy7G9GkpJu/XwYkJXYL/EJ/NL1OHARis+zDvuJmmlM0t4jWmti
X-Gm-Gg: Acq92OE6aYK6GvUeLwHA9a5g1rMR0ZJGJmPqiNL368RYgxOR+2Q1ZHl0mEXwd5eul5b
 dyrSyIes2YMx3WBpj5Pr+E/eBbaihYcBFWshPzIYS1N8vy4veg4+zTgVMI8guwnVMelyILicYbW
 PXJFcGkaN/YuDYjiEinxVJqd3fKJvaZBmcmVbeSi1hkQNIQ5JCM7sQlEzbuJGTw2fbgb6s3DGyi
 4J93DMxSIfVd2VFBJCiYMaxd3amGDPPTTezLsJgXdXjjWyz2IWF/ASY4/VzyJb94UqyNzSIa+U6
 7dm8S+pLMfk1PA4jXPpwZQV3Zz1BFSEppbWhoB1cAvNzctLndW8fpfeKLBujOvM1Pujs8iOQW95
 Rqu/J3dtLXGUMM/mJb2IMPoU+6/omrAIxY5nCoYOTNGMIBfbDY8sOw6+6DGLIxylrlkVFXSRsQJ
 FJFC5IHbLcM/yKtyT5A+xQFJTI
X-Received: by 2002:a05:6a00:1908:b0:834:df57:9d67 with SMTP id
 d2e1a72fcca58-83f33cf0bddmr6955387b3a.32.1778895837492; 
 Fri, 15 May 2026 18:43:57 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19c5ceb3sm7227670b3a.34.2026.05.15.18.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 18:43:55 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 18:43:36 -0700
MIME-Version: 1.0
Message-Id: <20260515-virglrenderer-v6-5-d9081c13baf9@gmail.com>
References: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
In-Reply-To: <20260515-virglrenderer-v6-0-d9081c13baf9@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778895830; l=2121;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=t1I7vhbxbbylbah+L/q436JRAKySLpH8vFAIRq6m0DE=;
 b=0+yc9JgeCSqFa6UxtVXp8frW268JoPc9fggglYUEB6LQ0O5TOoy5/V169pKzbj8rT0KCeodbD
 H+NwUXqyiaDCL3oNRYCXYd+6vvpEYbMZj+E2wOiBsIGCCwf56XmGhxV
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778895837; x=1779500637; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0YTCCu6VB+dq8jxhRi6RM6CbYcyaBj9Wa6KC+K3Rr+o=;
 b=GoL3vuCrJkjzamkN2b1lDGJ3yaPMoYQx2Xz5jf/U5u8RCcJQnadbcd1ag2SHHgqYRR
 UXDfQeYQ2go0aREOH+vqV5zktO3lyCeYQlDu2TDiFoWQOQ7YzUHAqGBFNzJFLLpIVL1T
 84YBmyaZSNGjryP0tfh1hjbNUTsmk4c6JF99Zlm4VRIaXwCIyZc1sB4D2FBLj4Hr5Nl1
 js5dcjBHQOPiWAd45BCxoB6EwV1WCh3XvUdtbQ5l7iJ1HygnyImPxOtfuqoLXzpq2Pgd
 Xxyq11kCMmmBbKhtPOjOGiA/GMW/yHj7VmwZ1ZktvCLg/gzot5FTeViGvxCeaLKqiREX
 Wm7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GoL3vuCr
Subject: [Buildroot] [PATCH v6 5/8] package/virglrenderer: Fix build with
 glibc 2.43
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

Add an upstream patch to fix the build with glibc 2.43, not present in a
stable release yet.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 .../0001-fix-build-with-glibc-2.43.patch           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
new file mode 100644
index 0000000000..fda1d9b218
--- /dev/null
+++ b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
@@ -0,0 +1,39 @@
+From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From: Maximilian Hofmann <maxi@maxiicodes.dev>
+Date: Thu, 26 Feb 2026 23:28:58 +0100
+Subject: [PATCH] fix: build with glibc 2.43
+
+Several glibc functions now return a const pointer if the input is a
+const pointer and a non-const pointer if the input is non-const, causing
+a build failure.
+
+Fix this by declaring the output pointers as const if they are never
+modified, and for the lone failure where the output is modified, instead
+make the input non-const.
+
+Signed-off-by: Maximilian Hofmann <maxi@maxiicodes.dev>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1599>
+
+Upstream: https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/986b5fc57b07c06b5e0b3a3694d06898ebc80163
+
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ src/gallium/auxiliary/tgsi/tgsi_text.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
+index db7d7b95..7e37bf79 100644
+--- a/src/gallium/auxiliary/tgsi/tgsi_text.c
++++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
+@@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
+ static inline bool skip_n_chars(const char **pcur,
+                                    int n)
+ {
+-   char* str = memchr(*pcur, '\0', n);
++   const char* str = memchr(*pcur, '\0', n);
+    if (unlikely(str)) {
+       *pcur = str;
+       return false;
+-- 
+2.53.0
+

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
