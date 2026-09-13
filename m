Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B1EC88E5A
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 11:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A078440612;
	Sun, 13 Sep 2026 11:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0f6DWwiErUA; Sun, 13 Sep 2026 11:03:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B18D240624
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789297386;
	b=d44ulcEn4vsFCidac5al1KUGTMDSATFV3tmv2my535MPjbe7hu0Qz77112GW3L4gd0LB
	 XZlXTYWFHeHtw9zFPRdDkR7sqldHAZazI5e/hts78DwNqAJotYVPF6hcgJR4IKthEeo9r
	 Qck9oR4f+L9POu8E44kVc/qW/6DSfOnBLDt2MmAoDHVYU3MroDkPYzdJ1qIq1UPJMJJcJ
	 TQQpr1Qw1QYW0JXO7hdosNwVZDowkwNNo/GAAdQ9KmKEJBA/5YQWHtivL+glhQqV1HlK1
	 Phef/kNDeQlQfgFB82qypeGr4n6Fc+tFa6qDEwX93QccnSLEfdJU2le7SyXax1C1HyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789297386;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=frSmUtKh36LvzK7N99UcfkODei1dsiEJNlOB8yX00wM=;
	b=kyWHrZeP+/Lo84YuQd0FaaGz8f5W3fXnX7CY/N5nLFH5k1K9j0sZ9o0rLvWg7RWwBJVh
	 klkbcuRNgNnIw27n/WBksGsyJZsEoITU6MUUX2qOOVGzqSMsR260JDkozYQX37G1T0R68
	 /fszRVeC+vlNkaIFz0lZNwI8hCgcAGNFOg0byldX/yQaZnPI5WGHbqg2joNk5outCaC5O
	 vh7tAxytVvZS6Rt7k6dnDiq+CV+6adyPgJY4oZB8T3YaFI9lB+gz+/LAYG5UL2W9BpQnX
	 xyHsDidNyWhCqn4mp2O7Xc86XIwLlfVbJmhIILo+5bF0v4+ZUlbkkIUDTpojaZrn2SQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789297386;
	bh=frSmUtKh36LvzK7N99UcfkODei1dsiEJNlOB8yX00wM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TcrEOsxJM7INZmmZXql/DKZmjCe3Akn3d1g5C7eq9RwzUA4KdDCqjEhuKCUrnuF5e
	 MoIkmBORHuTNBsp3M/tRiBEUV2p0ih+vqT7+rFHyFcCGZEIFAnM0CtfztN8zs6jL72
	 9mvZxnTWDlG3lj6CJjWUjmCOL6ufTNbHkNCe6vYtXakc2cY4HNZ91gjBpFrGK5ReLZ
	 oj6ww8HU9dCu55QChpWVqUhK7wjvBc15CP8yqNtg3KwX4TPBx6ubqiPJQSacrW+icv
	 T4VOqwI4bwKdXiLUcPpieb4F0vrcBBxVw3gaNRfMK5QiOYgX1UOtLGH7iMBbc0NpYs
	 PaHV0OomX1KAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B18D240624;
	Sun, 13 Sep 2026 11:03:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F62132F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 11:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34B0560621
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMei93tbSmnu for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 11:03:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 48C1B60602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789297384;
 b=AmOhOTKG81Jff3d4JkHBIdFX4nX0pWvKs4lvR9EEljAjMTjsDjGx13i2vTUtY/Yq50Ez
 as/XEMp2gE9kAMRdGzeWBhloWjgKIRb8R5oPK24waKTJ5wpnD/0IUDgt1XUasD7/clP3G
 BM1oH6irp8CcL+zd3C9KOXObe/2Lufz9uMvTHFOXCXuZLuAQpRxER6qK2rZ7HY2HRMq5r
 jQ6qE9xuC3n+ZVoKAGSBCWL3dZEJWu1R746F4ebo+ldh7Om93X73mENL/gv0C5HB0Rlaz
 NfPqA8VIZFb8Ost6aYGkt9ML7wBl6K2wMILUeU5HHp18KVu6K3jkYog5djI2wPioQEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789297384;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=G4sDy1duK0l02jMVVCo0X8CEWmdcfsL7bgNgrGLoxxk=;
 b=fAFteZ3tNAut17JqIikCH0hV8WJqEhNDmeweeLdboaMvZQNbppYU3Wu83gOq6P23u27S
 kXH5qFj+zInfUBkiBBULycOy0puWl0HUAbI+lebBeOLiLn+n5i4+jNr2n1ESwAxZYjDbb
 cO+ITdViLPEDkyMYETIuf74wyuERKdKnRdeDRsjnY8WQRROchwEAeIfCGqKJMMDhoNPV1
 XrdFXUlarGfGgN9lYYCKr0a8pCMqr9CMmd7PWYlvFU1gBdBAdn7k6hMFqr3oJ1U5Ip3xa
 bA2LriMlIlUhARGXzRTc70bJjZYjosdTfETnUx3yCD48IJBY6aiwFy6BSeEK3a5H5bA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C1B60602
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 11:03:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65CC395BD0; Sun, 13 Sep 2026 11:01:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 12:54:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c314f34213e9fc0f14b9b32b82f80399de896800
X-Git-Newrev: 6dc29e431fb4105692cce08ed48eba2fe4a6e03e
X-Patchwork-Hint: ignore
Message-Id: <20260913110159.65CC395BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zellij: bump to version 0.45.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6dc29e431fb4105692cce08ed48eba2fe4a6e03e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/zellij-org/zellij/blob/v0.45.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 73ef5729db..4520d6ff8a 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ca775a98e78fc8b721dc3c67ca511733c3eaa106423652e621ae66b6d10ecbf8  zellij-0.45.0-cargo6.tar.gz
+sha256  e9e67742687f3e1447df546bd2828b01edae39762bc6fb0795a686030c00674a  zellij-0.45.1-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 39cfe2e460..956a99aafe 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.45.0
+ZELLIJ_VERSION = 0.45.1
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
