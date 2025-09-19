Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789DCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 06:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C1A60D78;
	Fri, 19 Sep 2025 06:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCqKRuu0Vt1B; Fri, 19 Sep 2025 06:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E9360D7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E9360D7A;
	Fri, 19 Sep 2025 06:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B07E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66CE640D7D
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoW1ZHy17Pdm for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 06:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D961340D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D961340D71
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D961340D71
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:53:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45dd513f4ecso11934235e9.3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 23:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758264785; x=1758869585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iaj5BpK2IA7ho5jBfUUStsAKj/DS2JEBOc4pfqqcSlI=;
 b=mLNN8pPZ2JWbVpDw2qRV81nVBJGtBYOIJ+CK5iz79sYuNLO4VG06Gi3eWqGK1wdWOm
 NM9nYvgWsU7B1gWhmML0wF6m9yVrdKn7Lv7RQq1FjKMvnbxqKuzrTqF1da7d/ahTtuxw
 65D88aXByCi7pxtkHH6yZ0Kf0K0kSwaTY6oaXroKdJOCodaA18F6E0FbhhHMzcXLmtUn
 SMRD2sDXjqJ+nFPhjQ+aTC27drwy1c2p+RSY6ajoBYsFCpzR+SlSGYmY/0+F5JqkMncv
 HXG97Q1xuhLIUiS2ftxKDXJbNZ46vWUGhJOjMRyFg9EMDDahh1GmTSOie+zg61zwqtB1
 egTg==
X-Gm-Message-State: AOJu0YzzFY3tl9K2SADeQo3twRogSrWS9gLebMJP2YLMPqL6mG2fphkI
 KKs/NvySkDtbInZ1pfgaaDFFCnF5jHVdbquIhdH7uWfHY8w0tOj12tinq4c9gyZkWD+xcqfYHbc
 Dk4PdC20=
X-Gm-Gg: ASbGncvGvVo1zO50ELroPinKFeQ14KJyRSivdBQm5WFcYbTTsakJTlEiR8VVX1Xrw7j
 0ThwzZKbzQzh2bXC5MjR3Zq6zmUBCfjWbrtJ+6ZqdYgNY+JL2Ju33IkhnBHGLTzPXIdcfaMBqNy
 NZqyp2YvhqmD1UIan/SVNl/BExpC5NLnGSj4ylEt3FnqJpzrvKW+nD0d4yR/ECbGaT9ZqqTb/Iv
 1RtJOLfLx1mVUYcTjAVX9aLc4SpF80J056TP+h2tGQqSnyIIwSKm+hnSGw/YbRtuSlNjFlp9OSD
 yG43KrGUMzbtQZONSm845Hzkr3CHzvteSyCB0jMfFOfTTZndt+mgenjht10VajEdNEy4Ih002kM
 CvyepkTAK8V4AzVJGy3muRRrkAQ==
X-Google-Smtp-Source: AGHT+IH/QA/EW2RapYtO0AwvHkCiBh1qguZcslTe06+H4l5GIRDguLZFbYFi6KWcI0Ok9OmGNJGK7A==
X-Received: by 2002:a05:600c:4711:b0:45d:d718:3b9e with SMTP id
 5b1f17b1804b1-467ec742d07mr15968575e9.10.1758264785401; 
 Thu, 18 Sep 2025 23:53:05 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f4f9f339sm82858895e9.14.2025.09.18.23.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 23:53:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 19 Sep 2025 08:53:03 +0200
Message-ID: <20250919065303.60285-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919065303.60285-1-thomas.perale@mind.be>
References: <20250919065303.60285-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758264785; x=1758869585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iaj5BpK2IA7ho5jBfUUStsAKj/DS2JEBOc4pfqqcSlI=;
 b=g6k00vpGrlEQEH4L3aJ8+dCGCMQB+JsVRYvzrR/2MMBNLce4Hsj+FsWgwgpoe++HWX
 KiXbKvmQixiqi6b36AKypnytffw3FteLQzRVE1YnfmXc+RGy0M2Mbb7m0Ajqb+O8jioJ
 Ud27QhkFQvps/Ey6EJP9h2iFC3GG0mH7OUPpdrgyhmiDpFY1VtYwWDgp5ePxDxoKnFx8
 SfS1CzqA/stkO5wLX8rNc2WyFnu4xmol4WvCQ7+ZujsWU8QP+FZiXNKOwDLSLlOfX5VH
 rJvvTCOnvhV99Vzo1wVrwOTBodnQhjwATT+UtH7VhIT576zjq4GczI+Vj9NftS+i40yy
 IHAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=g6k00vpG
Subject: [Buildroot] [PATCH 2/2] package/poco: bump to v1.14.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump includes the security fix for CVE-2025-6375 which was addressed
in the previous patch.

With this version bump, some code has been marked as deprecated. See:
https://github.com/pocoproject/poco/issues/4426

For more details on the version bump, see:
 - https://github.com/pocoproject/poco/releases/tag/poco-1.13.3-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.0-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.1-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.2-release
 - https://github.com/pocoproject/poco/releases/tag/poco-1.14.2-release
 - https://github.com/pocoproject/poco/compare/poco-1.13.2..poco-1.14.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-SEGV-at-Net-src-MultipartReader-cpp.patch | 34 -------------------
 package/poco/poco.hash                        |  2 +-
 package/poco/poco.mk                          |  5 +--
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch

diff --git a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
deleted file mode 100644
index cfb22d690a..0000000000
--- a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
-Date: Wed, 16 Apr 2025 09:15:33 +0200
-Subject: [PATCH] fix(Net): A SEGV at Net/src/MultipartReader.cpp:164:1 #4915
- (move assertion out of ctor)
-
-Upstream: https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
-CVE: CVE-2025-6375
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- Net/src/MultipartReader.cpp | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Net/src/MultipartReader.cpp b/Net/src/MultipartReader.cpp
-index f3a2f2bba2..f4aa27dd86 100644
---- a/Net/src/MultipartReader.cpp
-+++ b/Net/src/MultipartReader.cpp
-@@ -36,7 +36,6 @@ MultipartStreamBuf::MultipartStreamBuf(std::istream& istr, const std::string& bo
- 	_boundary(boundary),
- 	_lastPart(false)
- {
--	poco_assert (!boundary.empty() && boundary.length() < STREAM_BUFFER_SIZE - 6);
- }
- 
- 
-@@ -47,7 +46,7 @@ MultipartStreamBuf::~MultipartStreamBuf()
- 
- int MultipartStreamBuf::readFromDevice(char* buffer, std::streamsize length)
- {
--	poco_assert_dbg (length >= _boundary.length() + 6);
-+	poco_assert (!_boundary.empty() && _boundary.length() < length - 6);
- 
- 	static const int eof = std::char_traits<char>::eof();
- 	std::streambuf& buf = *_istr.rdbuf();
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 0a1e900b3f..6979a9a1e4 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c01221870aa9bccedf1de39890279699207848fe61a0cfb6aeec7c5942c4627f  poco-1.13.2.tar.gz
+sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index f7d9cdc009..a1da9adeaf 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.13.2
+POCO_VERSION = 1.14.2
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
-# 0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
-POCO_IGNORE_CVES += CVE-2025-6375
-
 POCO_DEPENDENCIES = \
 	pcre2 \
 	zlib \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
