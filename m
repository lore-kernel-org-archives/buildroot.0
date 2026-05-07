Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD28CD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 16:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D2A80C95;
	Thu,  7 May 2026 16:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CECq67OD23dQ; Thu,  7 May 2026 16:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15AB883C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778170947;
	bh=pKlz8WSal424t9PJgUAqH/ezKI6okw2L/iCk93szGrU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GbbsVJrSXqoGYAAHQMPiuZVCZxVq6jKd5Di9NubFnWjQfoYCKWHJtFTLBBEyK/pKs
	 inFVQ11vDqfZgT77vPB8NDndLTBDti0pfWU2VquGYbCBgayXmPLH/YWdDLXbOEE/0b
	 a5a5kLuKgZPcwgScA/4eIxdg8Tv3may7N6EVx3mPBwMxVq2k3PXAv0EraxUkTjMcxO
	 GrEHPs5iS3ulilj+zw1kAeH3wuD7P/xAEfxcztnSRmur68+kHQSS7iUFvB6BacqD/i
	 w7cEIwcHrnTrOBy3nZkc92CBF58pN+FEQjg3QnH/x55xR0I296JAiv2FACFN3RSU4x
	 6fsdde/VeBboA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15AB883C19;
	Thu,  7 May 2026 16:22:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A242FA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 16:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56BEF83C19
 for <buildroot@buildroot.org>; Thu,  7 May 2026 16:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUMP3HjgpIjB for <buildroot@buildroot.org>;
 Thu,  7 May 2026 16:22:24 +0000 (UTC)
X-Greylist: delayed 547 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 07 May 2026 16:22:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 359E880C95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 359E880C95
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:f10:121:b00:466:eaff:fe00:1ba3; helo=alpha.isotopic.nl;
 envelope-from=jasper@isotopic.nl; receiver=<UNKNOWN> 
Received: from alpha.isotopic.nl (alpha.isotopic.nl
 [IPv6:2a00:f10:121:b00:466:eaff:fe00:1ba3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 359E880C95
 for <buildroot@buildroot.org>; Thu,  7 May 2026 16:22:23 +0000 (UTC)
From: Jasper van der Neut <jasper@isotopic.nl>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jasper van der Neut <jasper@isotopic.nl>
Date: Thu,  7 May 2026 18:12:30 +0200
Message-ID: <20260507161230.1986411-1-jasper@isotopic.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=isotopic.nl; s=20161206; t=1778170389;
 bh=m8gQaXtFIHiltsdsuEw8bBHoQebrxt29x+LS6YUL61g=;
 h=From:To:Cc:Subject:Date:From;
 b=MIIj/Qm3DBacQr2fOwdVRlu669msZ9srTJYEmDleClvcKlrg3rt91c/pi43QCkddw
 t+FvWLLmom0evrxZUF8QsgJrAiJ7bKPmgm/jHuVTMX0BO9fRfdputyzyHGl8zvK/sQ
 hGsWO7IBly/wcBerqhwlQIZplv47Anfvb+e5NGZ2wWJwD4gvCS3FlpwS6w6yvEpCTv
 HSvvno9HS4wcVtc9ASA8TGh9VAdQXM8/7zTJp0BRrkUeMwn1WdvmT3YY88yVN9KDnH
 g7k3MQ0PQ01j1ryH1KoHk7HCVJQ2ivgQiLvnu/+j2AUYGgEKJAJJ++mXpR9MnaNu+F
 uxqlkRu0Dt4Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=isotopic.nl
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=isotopic.nl header.i=@isotopic.nl header.a=rsa-sha256
 header.s=20161206 header.b=MIIj/Qm3
Subject: [Buildroot] [PATCH 2025.02.x] package/util-linux: fix
 loopdev-fl-nofollow patch
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

ul_canonicalize_path is not available in util-linux 2.40, so build will
fail with an unresolved reference.

Signed-off-by: Jasper van der Neut <jasper@isotopic.nl>
---
 package/util-linux/0006-add-loopdev-fl-nofollow.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
index 21b1e2596c..228c570554 100644
--- a/package/util-linux/0006-add-loopdev-fl-nofollow.patch
+++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
@@ -8,7 +8,7 @@ prevents symlink following in both path canonicalization and file open.
 
 When set:
 - loopcxt_set_backing_file() uses strdup() instead of
-  ul_canonicalize_path() (which calls realpath() and follows symlinks)
+  canonicalize_path() (which calls realpath() and follows symlinks)
 - loopcxt_setup_device() adds O_NOFOLLOW to open() flags
 
 The flag is set for non-root (restricted) mount operations in
@@ -28,13 +28,13 @@ Vulnerable Code Flow:
           hook_loopdev.c: setup_loopdev()
             backing_file = fstab source path ("/home/user/disk.img")
             loopcxt_set_backing_file()       <-- calls realpath() as ROOT
-              ul_canonicalize_path()         <-- follows symlinks!
+              canonicalize_path()            <-- follows symlinks!
             loopcxt_setup_device()
               open(lc->filename, O_RDWR|O_CLOEXEC)  <-- no O_NOFOLLOW
 
 Two vulnerabilities in the path:
 
-1) loopcxt_set_backing_file() calls ul_canonicalize_path() which uses
+1) loopcxt_set_backing_file() calls canonicalize_path() which uses
    realpath() -- this follows symlinks as euid=0. If the attacker swaps
    the file to a symlink before this call, lc->filename becomes the
    resolved target path (e.g., /root/secret.img).
@@ -82,7 +82,7 @@ index c72fb2c40..3d2274693 100644
 +	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
 +		lc->filename = strdup(filename);
 +	else
-+		lc->filename = ul_canonicalize_path(filename);
++		lc->filename = canonicalize_path(filename);
  	if (!lc->filename)
  		return -errno;
  
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
