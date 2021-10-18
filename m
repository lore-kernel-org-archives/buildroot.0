Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFDEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D236113E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22D236113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA07581A58;
	Mon, 18 Oct 2021 21:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lq32YlXMpoBr; Mon, 18 Oct 2021 21:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23EE381AF4;
	Mon, 18 Oct 2021 21:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9681BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DB8E40474
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFidNKy_Dzs7 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:55:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1104340154
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:55:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso560336wmc.3
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21KtWKou9mYRu1GRlMfQB6MK/gDIuqIwOeugBvFnkvM=;
 b=AJbnR5jX0kxUBmAAOIcZYe0Y227T/WL6XfNpP0V7D/lEzTVhtWb31BUbNNJcpiNwgi
 rWRqBs7zS8B9eGOkVlWsG8FcfdgyX72BSYGlRrlz+UElKaq+g/e4hEh0F2Wnx9/FXqsS
 PMSPFeUfwmRLk2s01KeQu6S54/mVm9shABqOMDgjmoWiBSZV0rEonH9mJhbQKjO9a5dn
 hURGoln50iz/elSX5z4VVH8U5RpjFPsLzfvhyxiEpien7W4DTbxj7ceU7sBT3XlhfXi/
 OdNZOCG5/LE0Kv0y02AHZfPqPEmL2Z9Yx9BWLAA6GbT9S3VMezbuwxVHuGtcRBrellIB
 PlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=21KtWKou9mYRu1GRlMfQB6MK/gDIuqIwOeugBvFnkvM=;
 b=KfINFEWxN1jlb9JCFF36Z7SLOyLM0IMsi8y5c5LSRRgEyEsZa3OVf5Upwh2/IjsJys
 Uz0eN5ipqD1OTZBTN2Q2kZNEbIGBlCJ2RQIvciANMxsFYm5E+hSwu0+/TSH02StCRf1E
 rbkhshAa9IeOssDiWXtPrutbce2dqEMMcPyXIUa/XeabNkxjyUI1XHr8DgJ9iVqqWYhi
 UhTsF3Os3qRFrfhYC1VDWusUuDONcAWqBPErQ7DTGpzJJYp6FIDMb/rMJMMAhJCsNG1D
 BY7/ybuKjWyN2fZHjtUwh+D7TwDr1J4Drb61Oat8ThUDp5m6vpbuzSt/ptExMOXvKTSO
 l5xA==
X-Gm-Message-State: AOAM5339WTMJk5mbN+Kv3Q/z2sb0jX4JaS7uEVP1IDNPxptuW3qeBUC7
 ClxCADqTdI2vrkgt9vAF9+ZpE53ZLXY=
X-Google-Smtp-Source: ABdhPJyX0YvWMk+TnKFAcCcMwKLDVeIaAoYJ88wkNBZR6NX9corNvGHZG1xYR9KzkyCnQsifWuEagQ==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr1666859wmq.154.1634594122018; 
 Mon, 18 Oct 2021 14:55:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u13sm5336351wri.50.2021.10.18.14.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:55:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 23:54:07 +0200
Message-Id: <20211018215407.1515240-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sloci-image: bump to version 0.1.2
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Jens Rosenboom <j.rosenboom@x-ion.de>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Update hash of LICENSE (year updated with
  https://github.com/jirutka/sloci-image/commit/ab128a4a1f12321d39188de38f81652b5852e35c)

https://github.com/jirutka/sloci-image/compare/v0.1.1...v0.1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-from-the-contents-of-working-folder.patch | 37 ------------------
 ...002-oci_arch-fix-arch-arm64-argument.patch | 39 -------------------
 package/sloci-image/sloci-image.hash          |  4 +-
 package/sloci-image/sloci-image.mk            |  2 +-
 4 files changed, 3 insertions(+), 79 deletions(-)
 delete mode 100644 package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
 delete mode 100644 package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch

diff --git a/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch b/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
deleted file mode 100644
index 3d048e3843..0000000000
--- a/package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 66c73c2ba3057634f19f37d3cfbbe752638c9f9f Mon Sep 17 00:00:00 2001
-From: Matthew Weber <matthew.weber@collins.com>
-Date: Fri, 27 Aug 2021 12:24:19 -0500
-Subject: [PATCH] create OCI tar from the contents of working folder
-
-When testing with containerd, it was found that the tarfile
-created with sloci can't import because the contents are inside
-a folder.  Looking around online, it seems that the an oci tar
-should container the blob/index.json/oci-layout in the . of the
-tarfile.
-
-Upstream: https://github.com/jirutka/sloci-image/pull/3
-
-Refs:
-https://snyk.io/blog/container-image-formats/
-https://github.com/opencontainers/image-spec/blob/main/image-layout.md
-
-Signed-off-by: Matthew Weber <matthew.weber@collins.com>
----
- sloci-image | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sloci-image b/sloci-image
-index 90dba26..7f3c775 100755
---- a/sloci-image
-+++ b/sloci-image
-@@ -425,6 +425,6 @@ if [ "$OUT_TYPE" = tar ]; then
- 	file_name="$IMAGE_NAME-$CFG_REF_NAME-$CFG_ARCH"
- 	file_name="$file_name${CFG_ARCH_VARIANT:+"-$CFG_ARCH_VARIANT"}-$CFG_OS.oci-image"
- 
--	tar ${DEBUG:+-v} -cf "$file_name.tar" "$IMAGE_NAME"
-+	tar ${DEBUG:+-v} -cf "$file_name.tar" -C "$IMAGE_NAME" .
- 	rm -Rf "$IMAGE_NAME"
- fi
--- 
-2.17.1
-
diff --git a/package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch b/package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch
deleted file mode 100644
index 27c4ab8c16..0000000000
--- a/package/sloci-image/0002-oci_arch-fix-arch-arm64-argument.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 67b16c65cdf0f654275802d6d12451a81a4d2796 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sat, 11 Sep 2021 14:37:20 +0200
-Subject: [PATCH] oci_arch: fix "--arch arm64" argument
-
-The --arch argument presumably should take the appropriate GOARCH-type
-string. The oci_arch() function does some conversion on it, which is
-needed because without --arch the architecture is taken from "uname -m",
-which yields something different than a GOARCH-type string.
-
-However, oci_arch() converts arm* into arm, which is wrong for arm64.
-Since arm64 is a proper GOARCH-type string, it shouldn't be converted at
-all.
-
-Upate the case statement to convert arm64 to arm64 (i.e., do nothing).
-Since the arm64 match comes before arm*, it takes precedence.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Upstream: https://github.com/jirutka/sloci-image/pull/4
----
- sloci-image | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sloci-image b/sloci-image
-index 7f3c775..6844023 100755
---- a/sloci-image
-+++ b/sloci-image
-@@ -214,7 +214,7 @@ oci_arch() {
- 	case "$1" in
- 		x86_64) echo amd64;;
- 		x86) echo 386;;
--		aarch64) echo arm64;;
-+		aarch64|arm64) echo arm64;;
- 		arm*) echo arm;;
- 		*) echo "$1";;
- 	esac
--- 
-2.31.1
-
diff --git a/package/sloci-image/sloci-image.hash b/package/sloci-image/sloci-image.hash
index 117f0ba6e0..ea1368e422 100644
--- a/package/sloci-image/sloci-image.hash
+++ b/package/sloci-image/sloci-image.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  56fbc335c193eccc3992f0a723c6dabe762f6d4854fc52059be074bdf5060d9e  sloci-image-0.1.1.tar.gz
+sha256  4c5baee9a4915ca88e3a54befa1ccb8616be20208070cf54ac366c195647da79  sloci-image-0.1.2.tar.gz
 
 # Hash for license files:
-sha256  8ea53673b084576813fc40cd63817c5a1619438942b5e6c30dac1d10707c27e4  LICENSE
+sha256  4c86c21e003875b85b4b9299156f8cec72c8e8e1abf5aa1f2d3c4dc665a3bea0  LICENSE
diff --git a/package/sloci-image/sloci-image.mk b/package/sloci-image/sloci-image.mk
index 232127bfa2..7361c49de4 100644
--- a/package/sloci-image/sloci-image.mk
+++ b/package/sloci-image/sloci-image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLOCI_IMAGE_VERSION = 0.1.1
+SLOCI_IMAGE_VERSION = 0.1.2
 SLOCI_IMAGE_SITE = $(call github,jirutka,sloci-image,v$(SLOCI_IMAGE_VERSION))
 
 SLOCI_IMAGE_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
