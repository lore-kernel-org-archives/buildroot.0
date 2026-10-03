Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C75FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6718260FC7;
	Sat,  3 Oct 2026 15:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-HlHbEKe6y8; Sat,  3 Oct 2026 15:56:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 595C460E19
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042990;
	b=AotYlMbD5bge6vr+0n+nnRcTq4TBBRYDVq8Xb/U4K8II5+UK+Fgl58rc2DgBiUTMz7RX
	 LoeGJ5r2HPyF/HO9AimB+F/OqNi6i7ZKNT40vpx8ankXoFIyHKuWHmUv9SqT6Z3KK1Y2M
	 NeKzOf1xXLxXX7WgUUgtL6vGajbtlX4XawRDd95OLGtaWt6+L3Fu7Pk4e6N3268M0wvwM
	 6DUooSTFpbGIp8ET0o0r95izexRJU3mbG+z26ka2jxFVmTWnhyGLG42I2j9mfxL1X2P8h
	 HfF57RH59K6CNuhsBnjPhLM57ajPUz5VnWk3vQGu2Shd/x5vY+ATALNoplL4lCT45Yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042990;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AJDmIQq8LwoJAXHflOFn7FyokpcHG6ul8m/vYScVJmg=;
	b=LgizUTbp1M0WNMuBVAuYYi1MfbOEsUisPxCxeyrazb28xRWcO8FwAWG/Y3Nysz8AArBl
	 RPMahIE9dwOSW8o/Qa+PNfNWySwQ9Bi8ObbD8ZREGujEgqGvk367Z4HE7XLZVnwcwptNX
	 kVTVZJZoXlqK+aAkJIsc6lkXn5l5Z8MqLlFe1pTPt4+yAGiS8ZaJ5ebfsEzJbIbpIQbiF
	 nyNUEgDVT8PXgFMHwuDQ3IX70UTqaYzGrX0XlLyqwTAvztx/n995z5ILqUbv9EckJGZqP
	 IfBkcLgxC9CURudCKbAx/vcHHgI8uPjrO+IegLf1cjC59/9qC7tfGi70NUzT3006aBw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042990;
	bh=AJDmIQq8LwoJAXHflOFn7FyokpcHG6ul8m/vYScVJmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iWP4I0C0y1Wiy3LXY4pz06dc/RnA6nOtaEOrW8olGyrRYU1pR5DXWDv4LXdBIZlqR
	 TyUfGLONX6bNnfoKC7YaFjGu+tZ1DNL8wNxKyNlhIUjxWWOhMSia7rHWqY67BYAQBV
	 zGGte0tANk0Q0NX/MIV+h98uXhysUujhNwM2qTscF/jW37DlZK+tqav1QopG1a1RwX
	 DInhtNTvwnYBcLtAcD463VKw5HJpxHezfHdtl6w0lg9FySH2rO0s3wGFQpaZStgxCq
	 /7kHgyMTZO4PbPZ2B8p0gSoiZBVyFLGcUOiXH9AiOBsind3pfRrdd3O/Unma1u3uk7
	 fMKLvKaFYPneQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 595C460E19;
	Sat,  3 Oct 2026 15:56:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FCB0335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 538536064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ft5aHNjCSXou for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CCE0C6068B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=H1tZGyPNEx0O3l6qjcRSxgX/kcmsaDgmx5UYARjNkcpeC6U8bsrwUhlvMkEEt7EASFys
 Se/BI3oHsY3iJXNcbrj8v+2R2TFuBWrwQ2MXvo1ywyUG3D54z9VNkQDmoj5VXZHJdqyBT
 XC2sCXWXudhL+01WTgqueFfjUKFpipuk/Z7ow8s34BwBw1eZtJaHt4xqIIPgl/ueIKqRh
 uAW8idWAPOzTIRvLjRXzW+JI3FYxi+mtYdrcjG0P4cHudtH+6Eb9EwNFgbEFsGAtXrVgO
 QOuPIKnyrNj+nXk+GPwoiiVU0YCswZ1L36YVoNv4l5RbqzUlVotwXoSfbmHinnhKtFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AqSYtBZnptC+Xj7ZnbZu3USvo7MCo2dw4CJHczSRbog=;
 b=mqvrGup3Ubx0NIpV8cis061o8Lw2aoN98XmWuPF+SStICRgnhBhHwQ07RG+KtKp+EIUE
 /PCtXso1shS+PziSzOSHP9U1v7gEX4iXEPjjy8KOyvtk3Heiih0awrX9Hu9PFGW/3F8o+
 mEv2s/g6lQHkiPBxerfE/slrZ5Sz+mBXfOpLRaJOW3I+75zvfWNRKSqqDHrZVIdH5NQgv
 4hkQtqGklq5omJKG4qI7ODFBYC8e0Z4TfNMKhKcekO5UNLNOujGect/n36ucZtPHLXvhY
 Cp+w9FBGL4yzCiwog4/0tUn/BjNkOyTT7Lbiz/+Lht8bXtjUiwFifrCtGkSXI+MIKxQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCE0C6068B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19FE48A39C; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4467dae356e78c724107434c57ef7798e36e816b
X-Git-Newrev: c4f4aa6313042769f360c8345a5da1439fff4593
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.19FE48A39C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-decorator: bump version to
 5.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4f4aa6313042769f360c8345a5da1439fff4593
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/micheles/decorator/blob/5.3.1/CHANGES.md

Updated license hash due to copyright year bump:
https://github.com/micheles/decorator/commit/91f90ce11a11141e4bb808c2114bf20d1c434298

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-decorator/python-decorator.hash | 6 +++---
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 5980427454..381bb25461 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5  984649ae1fd174f9a82369e7c9cc56e6  decorator-5.2.1.tar.gz
-sha256  65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360  decorator-5.2.1.tar.gz
+md5  4819314052ad95cfe8869f7d029200f0  decorator-5.3.1.tar.gz
+sha256  4cbcdd55a6efadb9dbea26b858f4fb3264567b52d69ca0d25b721b553f60ea82  decorator-5.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  914ee6ed78a5efc173bda698f2708444ca9d140fcc4080c60d0503d40db39da6  LICENSE.txt
+sha256  bd12cc51405c10872497c10ca21601f1d4abc50496595cc89e89ab5dad24fb62  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index d08696e773..ec6a1fef9c 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 5.2.1
+PYTHON_DECORATOR_VERSION = 5.3.1
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/43/fa/6d96a0978d19e17b68d634497769987b16c8f4cd0a7a05048bec693caa6b
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/60/8b/32f9823da46cde7df2087faa08cd98d01b908f8dcab982cdba9c84e85355
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
