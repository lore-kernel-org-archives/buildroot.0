Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD0CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50E434069C;
	Tue, 13 Oct 2026 20:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1ZVC4lnFUES; Tue, 13 Oct 2026 20:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61385406C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924763;
	b=AWimD0HEN8xnYcQ9dFWiHlKyRN23KSd8v0XwJw8CzxgX8dSA1AV03x5kvQtNPCOQxLTB
	 rwwJXKLhMOjvgxrak5bpKu23xA3/JJmFJnyOQA7AQAyNhiE9mhHY6OYyPFrYmQ5f6Mj48
	 +Y6zvAhnglN18tq6tbdYp9k7XyEbE6zOECrz1gs8BdjJlPGPiV0pFH8HL/je34XZ8oV4S
	 ZCl8KFtZWum7m00uaE6kueuOFOevRIyE/ZJMVUF5ysgCKbvw2c0ZBMjT7arQQK6pg9oSA
	 t6PqQrowc/kTIEGd5nvEs1pY89IkDYoS8IrXowagSJTGnxskyTYDyh+KQNqlCumfnqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zdk7WP1TfMU73C7FP1E28WFlUWPC3Q/DQowvsRt7DNw=;
	b=VLKKba6DGtHT8XF9DVhLSy/1cD4b6NFvKkYOxxrU+i1Nt3EIoKsUg6aas7XShEfMtCUd
	 VyqJvARJTwfBd8IAtuKOA5CzOVDWTBURb7uyVuR0vHUjTi302zBKRkxKlxCmqvITK/QXm
	 Hir8bxrSRI2LZRzliXcc5aonNgc8+RguO61WW5Vp7tew9elZDvjzsT22oxhTANMoQccRu
	 HA8HCQUxfCZ/vDbjYJLSKSBrtbzeBTTfImtm6DD5t03ikWYIMS2mxTSmMJispa0HEboXr
	 yCqeMtbbGUoA2TeSlWoGh6L43bMBddrbPzR1MmsDuOcAmdg7Lx9F0JdCihBiZbVaxoQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924763;
	bh=Zdk7WP1TfMU73C7FP1E28WFlUWPC3Q/DQowvsRt7DNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z5m5xr12vAkDMGdOcyxAUmy9zaUkvDaIYf/YjWLSXpRXWidmyaq5v9/z8IZyetrQ7
	 kMcavIGabP22A8F62p52Z9Bj7wkZx3WagHs3mD85cLxy/KHjQntlikrIVvVDnLsLT9
	 sg/5nTPQeRmjxLipMExm5663Mtdtv2YjCsSIW1pJPBt8No1ucLT3pbCmax0TCQfF8F
	 fZjn4HFKLWBnSUqs0HmiDdxz9xq/qsh+enK/haNfQpCum92NkDhiwVpFe8fKZuSVxB
	 2MwcCTBi5RUnSr404rcyJw09kXtelJS0Bi70YRFRHEt2l1aRLSZ0IGmjJm8TviKZAD
	 PGlbezVQMMQRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61385406C3;
	Tue, 13 Oct 2026 20:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A636343F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A401140619
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qH70toEpWps for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C498B40640
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=lG8h+CMmtjsmdGQraHh6Omu9nv6Hk0KhCSeNMccLMOJKX0MVwI6ityQMBkVICZdr1r5Z
 Lv5KwicMHgnvMUVxNh79JYdhP56dNAEe+1YGxwBk5/vXbY5421CL9pMwVh3pn9nphssO6
 7w3lQxi35Icc2HRX5NQeuBEcAsFJJeFXqXYaBiKJ7xAgpqH1aTyn8nK6hrY6Vtf6zHsY4
 FzLP7RVc5oBpR9yCtcznZhF9j2B+RxyJbQlMPgwEKOkn6aYhUR+ipiFYrtFTLUuXqjpm0
 rWmNohfjLSxbKlJUgh6eClXMWvRfwy3MNkdrb7ZiLOu06gxqVHXNiaC6Hi0dRwVsbjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Pok32oL6wtQtCE6DWv8FXLcXwTCs0IWMLVhWOqWxVms=;
 b=Sllys0n+SCijmFqvtF56TaIJg/FC2VreorczOxw0DLGoAy8uWMiVmfqJkx2nOidPt1sq
 er155PDIgM8sjWQvqvscSeESLqlkggr29jGCk+xZLe8hPzwhkjli+Yq825rkiDsnbmPSR
 qpBu51y9tQnDaZ2rIioIVNT042BsC6gcNRT4Cfiu/njj2JcM5M2B2N8pYjrIboB8onyEj
 v4Xbx1myMveJ6+261Fd1RHPqRBU1js0nacQGKuoqljbHxbEux63NLoN2caQLIfz7553PE
 rc6O5PPUXBWa6Ea+SJR6+fbfqeiJOcrbaA8CnM/3MaDxu8bgQxX0iUWYPQWOZWw4Zjg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C498B40640
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AB28956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4e596db61a3a28572b8aba14483098fe3e5e4bd
X-Git-Newrev: 2045e55fac6e401dfe64956d5feeff82c21de3b9
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.0AB28956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: bump to version
 3.58.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2045e55fac6e401dfe64956d5feeff82c21de3b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 755b51bb32..2081c1fda6 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.0.sha256sum
-sha256  45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca  pygobject-3.58.0.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.1.sha256sum
+sha256  4c80598ade17fbaa7798e01a25d0bf29ce109740786026a074c5c62bb3e79d23  pygobject-3.58.1.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index f15129a076..6f2271ad86 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.58
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
