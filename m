Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5678FC021A4
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 22:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E644251C;
	Wed, 12 Feb 2025 22:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z_YwEFQI2SJ; Wed, 12 Feb 2025 22:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 972F44250B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 972F44250B;
	Wed, 12 Feb 2025 22:23:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D581A3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46C1A840A0
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mvBh1tM32Aa for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 22:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 860BF84099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 860BF84099
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 860BF84099
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:23:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so107567f8f.1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 14:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739398978; x=1740003778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v12XCWWlxDs0Cjww9P+IedgTFCD1b78h/sTjGKfeqdQ=;
 b=e6G4zI0FUtglHWbwGgDtInRbgr49zXQkpTM6O4HYijT3fovN6oDso7H9wqykamHCuS
 d8hZVg9Z3iDQ+TM9dz/fMkhc6nC/Sso5QWP4ODHB8t+0t/1+a2WYl17MQ62KTHsFcgc2
 N+KrYx4BKi9DMFTRAGUY/y+/CBn1Rh1Z58VWF59oFyf98ktpe/F8gtI/jwLIV+xnZc//
 bpLAp5gGL8y678TT5rakWimMVyz3BHruwF+MoXyHMeTMSuqPFu6N0AWQDElovre3bDEp
 aAi13I1VcfeNSC3anDveMp+iqA/4r9xpNVPCxsSXH9LxGk8jow/BSJe20moqGzdBc2Zv
 Dg4A==
X-Gm-Message-State: AOJu0YwkCg5CTGiL06T9T+S+8Op+t9eWMqD+xnDGfMARDd9YbpDBo+Uk
 2hX7C6C2TkfpZDnAs2miVTFIayzLY0Q+wjAx7Eeha5ZGXayuvvrzvdNZ1vHSI/lqA6wigrNEfbn
 m
X-Gm-Gg: ASbGncuLGWKWprZCLgjjAWCTlxb189hU28FZlM3n/y09+X3jio4B+NYVUoJ+zxYgkZ6
 4/9748ijpDuLH+ScpMbNBI/s7+VzsQvzbCH1XtqFl7p64PpscSCg9GbbCrwedN8Fw/AjQW2/B/Y
 CcGEAYcpeSS8UiNUiIYKvsbE0m/v7I/JfcRqwr7BnT0sxle4UHdGzhyej6pQTdBjBMTk1VVLmb8
 GksXfT+7a5Z8pz9AMgH54duo+/NFupVUnlUyYEMasVYSrxxvCCHul+WQd+e0Shv09qaKa9lApYD
 6qn1olqH6sbbCkgoOATQGKt6jS3TRko4Zyw5D66BlUU0AzMjozHhFi7u0yuZQZ2lVkaVUCpZoGW
 VP/VfeIllnC66
X-Google-Smtp-Source: AGHT+IHnqzNWSn9dzl2+3axQY3uwqL1uHaZ/Pp7gUwKVFqQOSCY73+GTVGB9MT6SjHvEo413ky/kQQ==
X-Received: by 2002:a05:6000:1786:b0:38f:225b:3122 with SMTP id
 ffacd0b85a97d-38f24519c10mr1076042f8f.44.1739398978520; 
 Wed, 12 Feb 2025 14:22:58 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f217sm31344185e9.1.2025.02.12.14.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 14:22:58 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 12 Feb 2025 23:22:53 +0100
Message-ID: <20250212222253.719983-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212222253.719983-1-romain.naour@smile.fr>
References: <20250212222253.719983-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739398978; x=1740003778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v12XCWWlxDs0Cjww9P+IedgTFCD1b78h/sTjGKfeqdQ=;
 b=q5zDxaV+MZLEVSgu5ntWMSelMDYk5d8TX1uoB64DKnFkk4XwqK+ZjOiWRdmj8bOph0
 hEaN3yKyoe2jg8ZJzSB2ejAfzp48DcuNZ5/h+mCfM4uxuIFjkjSd1TUFSfP3tTCTH4jo
 85Eiq0zhXCE3NKB0I43YBOsgJeOvUEYbdeOGo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=q5zDxaV+
Subject: [Buildroot] [RFC 2/2] support/download/dl-wrapper: use curl
 download backend by default
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by Julien Olivain, in some cases the "wget -O output ..."
does not get honored when GNU Wget2 is used as drop-in replacement for
GNU Wget.

For example, qt6* packages archives are failing (due to multipart
downloads: HTTP response 206):

  [Files: 1  Bytes: 46.00M [388.39KB/s] Redirects: 1  Todo: 0  Errors: 184

  sha256sum: [...]/build/.qtbase-everywhere-src-6.8.1.tar.xz.bFXkzc/output: No such file or directory
  ERROR: while checking hashes from package/qt6/qt6base/qt6base.hash
  ERROR: qtbase-everywhere-src-6.8.1.tar.xz has wrong sha256 hash:
  ERROR: expected: 40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf
  ERROR: got     :
  ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fedora 40 is one of the first Linux distribution providing GNU Wget2 as
wget [1] and does not even have the old wget available in its repository
anymore. But some incompatibility issues with Wget1.x are discovered with
early Wget2 versions.

This is the case here with Wget2 2.2.0 and Metalink handling that
ignore -O option [2][3].

The issue was not noticed until now since the download infrastructure
uses a mirror (s.b.o) as fallback.

GNU Wget2 appears to be still under heavy development and bugfixing,
and the commit fixing -O option [4] is not yet part of any release.

So it was decided during the Buildroot developer meeting FOSDEM 2025
[5] to use the curl download backend.

- Update the download wrapper to use curl download backend by default.
- Check if 'curl' is installed on the host (it's a new prerequisite).
- Update the manual accordingly.

Even if not recommended, the wget download method can still be used:

  FOO_SITE_METHOD = wget

[1] https://fedoraproject.org/wiki/Changes/Wget2asWget
[2] https://gitlab.com/gnuwget/wget2/-/issues/685
[3] https://gitlab.com/gnuwget/wget2/-/blob/0651b0a447e4d6dd3f100800d0d93db90f2bd2fb/docs/wget2.md#-o---output-documentfile
[4] https://gitlab.com/gnuwget/wget2/-/commit/15c06c2f2a5f5eaa962893beec97a5211743ec05
[5] https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Tested with and without the quiet mode (make -s)
Tested by downloading few packages selected by a defconfig
generated by the autobuilder.
---
 docs/manual/adding-packages-generic.adoc | 3 ++-
 docs/manual/prerequisite.adoc            | 2 +-
 package/pkg-generic.mk                   | 4 ++--
 support/dependencies/dependencies.sh     | 2 +-
 support/download/dl-wrapper              | 3 +--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index f0b0508f53..7352d2f0c8 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -286,9 +286,10 @@ not and can not work as people would expect it should:
   is unnecessary. When +HOST_LIBFOO_SITE_METHOD+ is not specified, it
   defaults to the value of +LIBFOO_SITE_METHOD+. +
   The possible values of +LIBFOO_SITE_METHOD+ are:
-  ** +wget+ for normal FTP/HTTP downloads of tarballs. Used by
+  ** +curl+ for normal FTP/HTTP downloads of tarballs. Used by
      default when +LIBFOO_SITE+ begins with +http://+, +https://+ or
      +ftp://+.
+  ** +wget+ for normal HTTP downloads of tarballs.
   ** +scp+ for downloads of tarballs over SSH with scp. Used by
      default when +LIBFOO_SITE+ begins with +scp://+.
   ** +sftp+ for downloads of tarballs over SSH with sftp. Used by
diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 5d3aa297a9..7b591b4537 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -40,7 +40,7 @@ between distributions).
 ** +findutils+
 
 * Source fetching tools:
-** +wget+
+** +curl+
 
 [[requirement-optional]]
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8fb6f97be8..5f04370d9e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1276,8 +1276,8 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
-else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
-DL_TOOLS_DEPENDENCIES += curl
+else ifeq ($$($(2)_SITE_METHOD),wget)
+DL_TOOLS_DEPENDENCIES += wget
 endif # SITE_METHOD
 
 # cargo/go vendoring (may) need git
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index fb0defd0c9..a7dab2b11e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -154,7 +154,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
+for prog in perl tar curl cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a7..6ac5c953fa 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -96,8 +96,7 @@ main() {
         backend="${backend_urlencode%|*}"
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg|sftp) ;;
-            ftp|ftps) backend="curl" ;;
-            *) backend="wget" ;;
+            *) backend="curl" ;;
         esac
         uri=${uri#*+}
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
