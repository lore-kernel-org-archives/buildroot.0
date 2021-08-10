Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270F6C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 09:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C31EA6109F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 09:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C31EA6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85222605D1;
	Tue, 10 Aug 2021 09:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKyZN4deRZOt; Tue, 10 Aug 2021 09:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DC6760800;
	Tue, 10 Aug 2021 09:15:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 778D81BF308
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 09:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DF1404AB
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 09:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Y9B1zaUcF-4 for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 09:15:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A6FD40263
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 09:15:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i4so7820816wru.0
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jPmmK1i6K5/EcBsQo5ler2H9e43CqcrWkfDs/8mIuMY=;
 b=iop+qt+5bOGWQKCZjNaGUK+53uildhTkMcPYwcL4tIX3Xt6vrQkOobPYUSlz/qydCg
 QNzlBPhtpUzZylG/au6yO9Zilj5zjeegkjitBwH7XLX91CMOQjc3/5772yY0McrNs7Lx
 r9ROWI7ETCQitQ6zgjHaSn/6otZkuoyhF+GYIn1cL/0YJvpPXrdJi/+Pgo+utlalrG1C
 QSnVBMQ9L5cBnYUOMSEAQ1VmbK59QJAbJUvH1lk0dHjACpzltqXBtwn0emnhNJ1p5xjv
 JYmCo8zKE3v6JMDOQQ07BjnNVfHI22MZ/UCXY32AMWr5LyoX42G/IW4Lt02qMeOawMrR
 6W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jPmmK1i6K5/EcBsQo5ler2H9e43CqcrWkfDs/8mIuMY=;
 b=oHdzvRr0uhhR9tLKoOtpaRoXt+FFaMagXhP4D31zDkvy0VIXUc+qRDfV9Ks7Vx0/oy
 ONe9MjTzetqsEGBddL3I6z4FlAFqrnaENhMMmyYA+zUigeFhAu2AFGadlcqSn89bYGyQ
 QThQbJiJ5RuaZliGuSqmRQYx3EVXeMhOak71z+c47fCDQwG8Z3UxZ5BVyiHqkfhOMGIx
 StyqManFZpkiZhzRUumRk6gfYrnOHDsoF9eWMrw6SWlEePS2v7UYbgGiGxanfW4Lyl68
 ag3EjTNwJfDUoWFQ+bFnuGuyilY75ytBvvl2pcecjnsYNl61WnpwCVg8Umxu+JU54wMg
 1YbQ==
X-Gm-Message-State: AOAM532OD3+WWTqOfXShwWnfH/mlY3oAZjmSVR6buibRkl/tUohF5Qf5
 dm3hvQacuf9pqVJddGLl/5iSPPLH4WkKlg==
X-Google-Smtp-Source: ABdhPJz7RMe836DhXtaYvhrD3wclLMJpwYEbCwaMZof9FwJm9E9JhYyggJy87ZYvc8lK0pwy2CF2fA==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr6410293wrp.114.1628586900078; 
 Tue, 10 Aug 2021 02:15:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id d8sm22736503wrv.20.2021.08.10.02.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:14:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 11:14:45 +0200
Message-Id: <20210810091445.3652881-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with gcc 11
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from ../sconex/sconex.h:229,
                 from ../sconex/Descriptor.h:63,
                 from Descriptor.cpp:22:
Descriptor.cpp: In member function 'void scx::Descriptor::add_stream(scx::Stream*)':
Descriptor.cpp:150:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
  150 |   DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
      |                ~~~~~~^~~
Descriptor.cpp: In member function 'bool scx::Descriptor::remove_stream(scx::Stream*)':
Descriptor.cpp:204:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
  204 |   DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
      |                ~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Descriptor.cpp-fix-build-with-gcc-11.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch

diff --git a/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch b/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
new file mode 100644
index 0000000000..335be82f7d
--- /dev/null
+++ b/package/sconeserver/0001-sconex-Descriptor.cpp-fix-build-with-gcc-11.patch
@@ -0,0 +1,54 @@
+From 5e4cb613d9bb287e9f54da86f99a51d0338b1faa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Aug 2021 10:36:53 +0200
+Subject: [PATCH] sconex/Descriptor.cpp: fix build with gcc 11
+
+Fix the following build failure with gcc 11:
+
+In file included from ../sconex/sconex.h:229,
+                 from ../sconex/Descriptor.h:63,
+                 from Descriptor.cpp:22:
+Descriptor.cpp: In member function 'void scx::Descriptor::add_stream(scx::Stream*)':
+Descriptor.cpp:150:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
+  150 |   DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
+      |                ~~~~~~^~~
+      |                                 ^~~~
+Descriptor.cpp: In member function 'bool scx::Descriptor::remove_stream(scx::Stream*)':
+Descriptor.cpp:204:22: error: ordered comparison of pointer with integer zero ('scx::Stream*' and 'int')
+  204 |   DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
+      |                ~~~~~~^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ccc9562e83fd2bd312d21b3124be42dfe4b7e850
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/sconemad/sconeserver/pull/4]
+---
+ sconex/Descriptor.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sconex/Descriptor.cpp b/sconex/Descriptor.cpp
+index 590adba..4adfd86 100644
+--- a/sconex/Descriptor.cpp
++++ b/sconex/Descriptor.cpp
+@@ -147,7 +147,7 @@ bool Descriptor::dup(int d)
+ //=============================================================================
+ void Descriptor::add_stream(Stream* stream)
+ {
+-  DEBUG_ASSERT(stream>=0,"add_stream() Invalid stream");
++  DEBUG_ASSERT(stream!=0,"add_stream() Invalid stream");
+ 
+   m_streams.push_back(stream);
+   stream->set_endpoint(this);
+@@ -201,7 +201,7 @@ void Descriptor::add_stream_after(Stream* stream,const Stream* after)
+ //=============================================================================
+ bool Descriptor::remove_stream(Stream* stream)
+ {
+-  DEBUG_ASSERT(stream>=0,"remove_stream() Invalid stream");
++  DEBUG_ASSERT(stream!=0,"remove_stream() Invalid stream");
+ 
+   std::list<Stream*>::iterator it = m_streams.begin();
+   while (it != m_streams.end()) {
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
