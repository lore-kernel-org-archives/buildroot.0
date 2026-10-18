Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE91CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DCF8121A;
	Sun, 18 Oct 2026 10:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPi4jsX4rQjY; Sun, 18 Oct 2026 10:37:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6AF30811D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792319850;
	b=oxwpKKbM4GRcdK8HU62c1gg2IMz42EGl+Mos8EP6dFGcfbnCTJKjT61EL3Lz9S480pvE
	 YQwNwWf0/da9QCEGhOD0gobuCL2se2oEY5gmkmJ3fUN5kuDPCKsuhyCuDiOFhRT2Gic3N
	 UliDMXevFlYkFGrZHmXp6N4WFK6oROQDXeqpk38ueUmWD5R6GJr4XTqUq435ClVOq9CvI
	 l1VGjVKwZYbbPb3HlNDBb9pkKwzFSSgKoYppW2fSM89gs05fTemXdq6e41TSBwn4khqXN
	 +CCAugCpScx60TDcyt6rtOAuDqd6ZS1wpUb0BMWk61jTszyCh6rCcxyXdqILjdggF/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792319850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=apWJMz4rTq3+MjERECEF4UQPdqye9DB5AdGm1AwXgSU=;
	b=hENnGutwSO4KFg2AQmDzVdRzSUQ395q47pANS129C0DkqWNbl6jueQ3QgKHFWFBaO3o4
	 /lsTsxLdwqPgrKX8v+Fk6Ej11gdIhdqf0BL5w7eHvwfJ73ZwTO6g6lzk+SNYub3/sJ4k5
	 WnX3pJFNVNnoqc1P/0feeQYgwiDZjfofZSMwg4M0A+OrV446CRimawKg/Thsp6qXhT7iz
	 W6dEFhMbZ7DiPKdiIbC6mWGuDwY9oTM/MY44QKP/jDAsjsaQoR6EZ9qJLVZ8J7BLNJBaY
	 i2o8X4Cc5tIeMAlu75Cl3LGne7RWtTjKFcFR2cw8iFwflzRb+wOjL0JQDdiWq0lCQVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792319850;
	bh=apWJMz4rTq3+MjERECEF4UQPdqye9DB5AdGm1AwXgSU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qCtX26JJuGbedQyvI3yPklVCjZXSLl6TaK/NT+CKc7/Jm6ubpnVXNBWOeJV9W39t4
	 5Q4iC+pPJd0sMJKFu7PI0JieYBN/WjM2aO6FddC/gWNkGY31SuQTN4L9UyTvJ9iCrj
	 BhPt7YgJdK6vp/0LFkVR9XatjzE9Y24a8B4iuz+DISHpI0j74kEoBRyy1xiySObhTN
	 nCLbkyG+3ybHxWX+4bl584Q48lrkPiqAqZ7x8UBaTjr8ICIZkuTU98npf1OjdOoHiU
	 OS/qzbjA+kSuApt6I7WZOMSYMeNgrpiKa6WEQxU90bWHuQySTDpZ0QQ9wnt/qwQ1dK
	 fKP/s1mrOxpcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF30811D1;
	Sun, 18 Oct 2026 10:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA5842A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC275400EF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PX_M4ZHk4TQR for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:37:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D75D940060
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792319847;
 b=YCQzYK2y0kf5jKdrC6uY0w/OfXCS9+TNYUyxEUFFj5G7sShqW45dctmMR4WibrvvljbF
 SRpTpteg+culDfm1cPl+DHJKZckBGZWaMPpAvW+YxSmqaGvPT7lOlQxIryGl03XGGlWNB
 BMXt9mlkeZ8l3zSiDX/9dsNAIAkJZdOAIeWKNolZ2jVW3VvxFznpguEHBsLGPHW0ZosDK
 Xr40Aa6UJMlcaxaN7sixUvQPkm2dx8yh10QvXVS3m4EgVdc0xixRVv+Tc4iBhYsQP7mmp
 3DrpcUSINq37mx++5nI4CJZDOmK11I5MP1nCjvRKnLlg3oUtIbU6wjxVYSiqIffRhPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792319847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2uxjJ5MHHkSpeErZmwmuQsCD0+DoBEiBuhGrSp2/DTA=;
 b=Tu3rjIZGVPBsO3LY1JhkgrJpDGmUPMVYfu/fbinGYkpVvlPyKIRp7VAb59uzKSn/JyQt
 9A5c6rTIApUApGbLOU6bCnEdxdSkZ3SpMEBSZoNg0cfkfmQS8Sb2++1bdTj4SKhafrAXf
 ArvSc8Hnybzsj97oQn8d96f5bj2DBA71w7Rl7uPan4c7tEhWXAJ2/59cgc1cQXxLt3FLT
 B0jdihuT1NBX/7WRBaspRbMguMTu+Np+3CsELDU1r9Tzzb9p1uyFgmY/4KtTRu53fEOfI
 gywqURW33TiuaLH+LCK/SpddcLXaPQoMUj3wPuLE/lVnN8mwSOia4fz1SslawazAiow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D75D940060
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C472D95EFD; Sun, 18 Oct 2026 10:36:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:17:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 072720fb23b1881fc7943944cbbdd0158697a57b
X-Git-Newrev: 3b5fbe8f6e7869c41616bb7e1e97b20f52f9976a
X-Patchwork-Hint: ignore
Message-Id: <20261018103605.C472D95EFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mg: bump to v4.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b5fbe8f6e7869c41616bb7e1e97b20f52f9976a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes at:

- https://github.com/troglobit/mg/releases/tag/v4.2
- https://github.com/troglobit/mg/releases/tag/v4.3
- https://github.com/troglobit/mg/releases/tag/v4.4

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: fix hash source link in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mg/mg.hash | 4 ++--
 package/mg/mg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 85e5efa8db..a5b88e5617 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v4.0
-sha256  6b33adb70d59d1449b40343be1162201576026242470dbf76985aefad5d4b0ee  mg-4.1.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v4.4
+sha256  5955f48138bd5fc3ac53945d610f4089446afc5eea99bfb5f0a01f079426907e  mg-4.4.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 49e90532f9..a831e5e86a 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 4.1
+MG_VERSION = 4.4
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
