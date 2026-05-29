Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C3CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF6F85AD8;
	Tue,  9 Jun 2026 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WI6Lu9OHeDxV; Tue,  9 Jun 2026 13:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F127085ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010231;
	bh=1PyjL8cxt/CKP9FqNlMUPAFySdynyrvm9I/j0uZt8BE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dkm+BirYJNuLutir3qGmPhgTXNltIvQKa/ww31pkT2r7pSMl1OxS5Bnl9MCShVTom
	 hJGuGB6DFXdVWlLYt+7QycU5jDzp6HzqTu6xhhQrQmE+YtLoztIz4jwRx0eZyIVECa
	 7Vh+ROCInYETNeN4bDN4np0OKN2a4rS3IHT6dHY96GQ18b2IitvSV6ax6erzJsl+ER
	 yhGgXXKPWoU0gI09/4P+SDcAwhlmihU7O9WBQnbML5nzTyUSXtBQyKrhNj/lFvXsIU
	 krVELvi/SMTE8/6ZLnTBcxQCMf7fNAg5mmSENLG1cUqFlDW8HVcwpAd4G/BjGjF+0E
	 D9mk/6eObqEWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F127085ADB;
	Tue,  9 Jun 2026 13:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A68196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB037411B2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyhzzU3cd3EW for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F9B411F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94F9B411F2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D095B87E7E; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f24135c56f6aa8f0524307b7339512fecfa6f92
X-Git-Newrev: 87c525ddb7046b96ee1640f56c5ac555771e496c
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.D095B87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: optionally use libudev
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87c525ddb7046b96ee1640f56c5ac555771e496c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libv4l only requires libudev, not a full udev daemon.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libv4l/libv4l.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a70cec79d3..f2069390a3 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -42,9 +42,9 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 LIBV4L_DEPENDENCIES += libgl
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBV4L_CONF_OPTS += -Dlibdvbv5=enabled -Dudevdir=/usr/lib/udev
-LIBV4L_DEPENDENCIES += udev
+LIBV4L_DEPENDENCIES += libudev
 else
 LIBV4L_CONF_OPTS += -Dlibdvbv5=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
