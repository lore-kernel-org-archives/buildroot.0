Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B26CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F764119F;
	Sat,  3 Oct 2026 10:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFvlmpIKNhFr; Sat,  3 Oct 2026 10:07:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C896F41172
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022055;
	b=Je91K6x/47lBvXtZGtOL6FGMEW+qDjYSUrq2xo8sZANr5c4a2KCigac399nT/tmDfKti
	 fvp820ZEjmESUy615emgHblD6hymcyub7gpki92czYA/Ksot9wHiJtUBXC1hrsA6m0gM5
	 FM1e7Q45C/1O75l5kcVXZZYFMN5jw2kerABaPNeeHr96YewewFgeQh8VywzZAqz6qWZtq
	 6rg3/wAlvL44+HqnMU1JGyHdmLF73IzQsVz4VuuCOyRtox/ThNDb8Yw4Et6P1hY1bflL5
	 XJSo5AyYmYI1y+vx4/u0/n/r391RTDD6XbFYWvVnHfZVP4U3UfgtI7FPU79giWSBS3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bm9RV6BKqex76wl8DrfwzGMRKyeuX32O5AkCg1f6lnA=;
	b=brd05iQH+RFp2l5l+bu9HGo8gVavCjeaDBPCP6K8/bKAEPXefmFrnV82/jj332msE/O5
	 uCDEpA1WenIS4T5NNlc7n0LAOHirXc87/z7Yk5nW1Anrn+nR5deVH2x2DRg2MDbGqHYKs
	 cDuraDK7qXYGgLbnCaQ1m24XE4cNg4XibRQEPvuekEc8gMZho1FLKlFEfIcN1OISsZH7p
	 7OQgOrtyhLIlMDlUweY936gHyMufyu8u8yzA7crsF9mS0/M39NKSsy7xwtnActWJpAVu9
	 CQFPb1NWNMBqHQgvuOryQyMKcXGCVECJde0tGnyZwpaJz0rle0vLFbgFnM8m4rHaJ9Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022054;
	bh=Bm9RV6BKqex76wl8DrfwzGMRKyeuX32O5AkCg1f6lnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P27OUj8MUKMwrrliFYsK1w7f4ywJfXEgspOk+KTiMJpga/8iHRY1Xhq9lqiolBx/Y
	 HeNxHbfWOTwhp0myM88ZcwMQPHh7sJoZq+cyQhBZjJEp2mkDAkUm+8C4+MauS9qA3I
	 SYu+dehSnu3kAUllJsMzOLC1QHFQj7bTiupQlWlYcFc8q08Cu/+cGXsjefMABi5K0J
	 MiKtdUXom8wI1u5PPXIs1Jf9khMD7ZwHD4aWEdM7JiQRC6B2JZUd+xQjUb5xAW3sfb
	 47KfUCHkWd9fGlqtrLJC6usnlSomNq1Htqc8JuwwQrpN9AJ2/6ikCNA6SirbIFMVP+
	 Q5WwQSl6m3tkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C896F41172;
	Sat,  3 Oct 2026 10:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C52F335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DF52811ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ox5XrbhziRwm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A29B081230
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=MaVIZs3mDiAMKdH+OOccq5iylsU+LnhMWpN6AW92LIVUa9MUrs8sQXerlGtqxldR/U3j
 YADmKLjfQgwmqiVlKB67Dhgz+aA5vj1vDny83gUyoH5aGU40CYa57X74Qu9yWwq5tsKmp
 YwkgYFTrmzpROVsVvkXdXVG66WJUpq6n0ITU1BbBbgnQt6OyY0HJljLajoy19iT7NkKnj
 jRJKIkw3I5GYx8quMgRfQq11bBajMFpXhQXp0iTvFlcTn2G869cLZmHF/2DOiNXB2KdwC
 G06DyPmCiDU9fgcKt892qouIEJkONChbyEscA7Ugkp/EfZztdNNHjBuZt+H1pQkROmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fPE90JdAjDTj/1NR+p6pQ1t3gVLTrd5E4nOTkg7Y++c=;
 b=dBZC6UYSjjy4OrwvV6J/J3mcGOIqC1KPF4HrcTxSa2NWgYqmcyCAUuK8ZSowBs3M9byV
 BsRdAn8Nmdm24IRjhjhFAVpkkc7gJD465/8/ISckx2hvYHqshC77Rsv6bTHit7o5uDLw/
 7k0FdJlSYkMBBlJT1gbF4S9pC9S65zRB/3HpOLJOHSdun0LOb+z0h9iA9fyH5kLNBr+IJ
 npPXUAnl4RUiWTVblHPflaZHe0y5YoTXHOoi1AhJHsjJyTJ6Q6fK8zI+dgb3wiggMAS6Y
 ThYcNC/dLmb76M+n3DGg1OD/PksSkzZqx4WNjI1Tq/egU6gnu7GVejLg6L5EZpqAEzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29B081230
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D67C88801; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef347d2bd156e7b6cdd984dd7b3d888cf78f8e5a
X-Git-Newrev: b5eabde2884837ce3733aa1ece7786a47b52bef7
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.0D67C88801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump to version 6.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5eabde2884837ce3733aa1ece7786a47b52bef7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 58fa1b611f..0d5fff4145 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  a1104b826ed8414130553e4482bd714d  ujson-5.12.0.tar.gz
-sha256  14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4  ujson-5.12.0.tar.gz
+md5  0821265a819a657e8b9fc5147e4cb3b7  ujson-6.0.0.tar.gz
+sha256  80e23393feb707582e0ad495c397a4477b646d08094d2df64f7316f9fafd8aae  ujson-6.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 3893a205c8..11059ef2eb 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.12.0
+PYTHON_UJSON_VERSION = 6.0.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/cb/3e/c35530c5ffc25b71c59ae0cd7b8f99df37313daa162ce1e2f7925f7c2877
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/64/7c/e1fa3fb70b53192436d751b5cb671f0ee960baa188b8351a7fec735223d3
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
