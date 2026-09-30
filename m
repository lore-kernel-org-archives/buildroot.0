Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0876BCA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0FA440DB7;
	Thu,  1 Oct 2026 14:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psFX1lUAXOEu; Thu,  1 Oct 2026 14:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D362040DA1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864614;
	b=Yx8iWoXlg8LJwTj+SUk4gawQN7+iEhTs5ZlJtgl4DIyRO7HNRuZ4zfJ2CY5nd290fx7v
	 psm8yMtazjNqZQFaF2aRJzOPrWOURZGu/eKjUqYId6iuxXuyCDz6kMoEjaXAT8MZ36FhC
	 z5hH5Rihhy2C9zyjnDM2RMqjdgJcQ726vV+a2kuSJc/mAErz5C1NKxvzoFsMOudf7Z++Y
	 Q9TFbVfhThxqsm8EqjSUkCN8WMKRkBUB6p9nJEgo85+AgbAlLgGx9iW+JyfcMmFwFL/CN
	 47gxPcWjv2YUkY2j4adP2ql8gvn7HRAxJWqHSLX+U67Y0W1bXJJceW7sIE1S8nLNAUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864614;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=uZCh7cTQmOXM2mr3cR8qpXJ6RpANOAhcARFkTT+GjQM=;
	b=YP/lVIjnFB8qjXtUkFEXh+9FB2bV3Tpr6LAF2OgoXSOduvqxPcTpQ3T3hF3I++pTZ8f9
	 +Nvs6h0aKSuwi0k04hDC5dJOGCIVSpLas4NVWFruDJwuAmvNkA7RBAob8kRKZpDpcWkwA
	 Kp0P2v08AkJmLzPS+i5Qpf5txPduLoQSF4wffQ+cLMG6MH4RUklpybPxLEP0F10s9F30e
	 l8me/mmuMY+W0eZnYU2rhFC2p3ZHF8P4cUQtB0T2kgiu0tEVf7YaBKltHRot+ZmFmnNm7
	 vQHH1CkIossO1+taskRXgbk+J9l9Euiv/+1g31wOSMAFVxwjqcDhbCZi9GytVz9qPEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864614;
	bh=uZCh7cTQmOXM2mr3cR8qpXJ6RpANOAhcARFkTT+GjQM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=spOq5o2zFdWO9/Bxbg/hVYsnUQiLmB3oDbou1Fgw5AArhh3JZyHW/LfI1LKhpTt2Z
	 lhzABLlve8NlEwFcn9IqDVWBflpnQ5rZpSCJPjQlurxNIK69EIzPtsAMj9ws5Y7xSo
	 VfJcDX8fuomK5N1cSxnf/rr1ne9eUGXcTEBsZwqWdXphU732x3FuUzAocQkHzRdTJo
	 61gudS1P9kE8hfGyP1/7/HbZDm1M8tek2yY4SZ+FIb5xRrnW7GBym7uGgjIvtIDULT
	 Zh6kbGMNqmzIC7PgdW2kuqpXnEifEMbbP1eP9hTNNJJyd/eNme0v10ls1OxT1eq7PM
	 mHre3pbH1JwCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D362040DA1;
	Thu,  1 Oct 2026 14:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBBA7116C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8F5B40512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ouv-fEEWD1pS for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 05C144052A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=cT2203OQQjZd//DOZiaqggue3X1VtfFjkL78vdvaXT9cIH6PPigf5ivqr/JnSHhfIGCe
 x++AoamDQ7Q/l5rWXbSG9/es31yNdcD7fSgJviLKnUDEL72UKrUisfRfCNt/GSqmBU8pi
 haZPkSo1iwQhMTjTmZ4xAwujyXDYYuL3qZW/vmhU1VJYS+cUBBuxBixvk+2x3j6mR0VaW
 IQFIFu3FZR5+YPMYWMkl9SlLl2P1hZLkjSVgEcrY7v4yfgN/GPdpYbBJrWS5oDLS/fNKt
 CozQjHogaY0tK6tpZ52hN1ttN7ITPi7n6TQeQ71r6Hj+wFSo/r8VF/gCbElXPcrNk/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qGDMcST5s+vikqtkdILKxH9mPXH8143OXAVEbjqoXjU=;
 b=n6GsIeclK1w9jQNmiYGCNvnOo921TD6vkjQZCnA37iLYF77yPFcKV4JUfZr/IimkRyio
 hmTxPvbHi4/4zIeJRAC0uRZebAsHZb2ycoBqbRoRFB8sKyNDIYhxghe4e4F2gepBzfRjP
 +zPHvqr9sjYGPr8RU2lzVRrqDDMKXEjnYDRSdibBxuFpxFEVFS7lljjyhRkAyglo9ipPB
 /6ldE4r+7lOf1FlNUwYu0d7RWe3bsEHA62ru7MQf3Htc5wnfllt3FwThb1EtfX73otYj1
 wgA9ODvLKb8t3ZH7kx0IiZHHoqA0+sxgkNQAJ5DteR912LVS3SsXkxL0jA+nvClLCrw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05C144052A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D1A598461; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:53 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: cb17178ea6ca234846bca8e081a20cc31e376ceb
X-Git-Newrev: 2217b0b2c30c6fc7b0921394695f1ac4990ccace
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.4D1A598461@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_image:
 security bump to version 3.4.6
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2755772178274733576=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2755772178274733576==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2217b0b2c30c6fc7b0921394695f1ac4990ccace
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For release notes, see:
https://github.com/libsdl-org/SDL_image/releases

3.1.1 was a preview release. Among the changes since, it fixes the XCF
loader issue reported as CVE-2026-35444 (fixed in 3.4.2). See:
https://github.com/libsdl-org/SDL_image/releases/tag/release-3.4.2

The LICENSE.txt hash changes because the copyright year was updated
upstream. The license itself is unchanged (Zlib).

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 74fe3559d6d415d30833596afdb23586c95876e4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_image/sdl3_image.hash | 4 ++--
 package/sdl3_image/sdl3_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
index 83f5e7eaf1..e0eb2d2cc8 100644
--- a/package/sdl3_image/sdl3_image.hash
+++ b/package/sdl3_image/sdl3_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
-sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
+sha256  d2e4637ae700f72e5196b8fbd749850ed2e5e1e09c5a5be8d06ff55aaccf3b01  SDL3_image-3.4.6.tar.gz
+sha256  e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  LICENSE.txt
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index fadb870b6f..43127c463c 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL3_IMAGE_VERSION = 3.1.1
+SDL3_IMAGE_VERSION = 3.4.6
 SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
 SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
 SDL3_IMAGE_LICENSE = Zlib

--===============2755772178274733576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2755772178274733576==--
