Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BAC98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A05C40DFD;
	Thu, 24 Sep 2026 18:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ctrdbxd6vih2; Thu, 24 Sep 2026 18:57:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3292140E2E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276266;
	b=Iyhw4Z+x/qaq5Wde9pvELVk10Aq3cyWzPyhbJR0th+GZoTSfOBZP4Uyr/IWR1RGrthQs
	 ooOMhCN5YQ7kJKd/Vlb6HljKsnGA/aa8NP6rlgmWFN8YI0ORYyoPdlK9duxPE4aE0s/1B
	 6Q9uTIQd6+OOy60toYyq+fWXRAbyO9B6BvZtkYxEmCxEOX49eo9QkMnoGNT2DkBPnnJxO
	 p293T0we3PXIlT/SWCwZqUhOFJfgGfH7EUVYrv4nOfDaOmyu2XkFOW5ardwrB7XosPuwO
	 0yiTrNgwLmJq5+uXjryY5h5Chao5n3WgoazXFWiRY8G3hOtWai95QazdnWE90NUlyAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=u5YLCI/xzOisszQHqL13hZ5V1iYXPjK5KurtEPEAfbU=;
	b=j4GSmRwAhxW46Omb9Aj8Ee4wm8DzoTeet2u3YnxQYwvMJYbg6aeXYBzJ9F+3D6u4o36Z
	 Anr1ayraStLmVMzvJCkJ3l3Sbd4IzkD+yJfCs0QWT67ocA97V4l/4hJPxChM92VNXo574
	 KdmlJEqX8gVOlgE0OliWF6ejzNqQkF/yIrmWQKD/xmfhZZR7YTXslUnLyG8dtaOXuiGDa
	 4dMWq0WOz05L8xYahSWUq+01QFzvMP+6fZ8ddnVqJBXfrnNDZkbun5k45x8v+nl4wxTPW
	 dIq95g4R2vqEE3kl8C7ZRkdH2k4j+wL9XXESRsqiUlSxMBEjU8LiNHlUAIp6gEAqvzw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276266;
	bh=u5YLCI/xzOisszQHqL13hZ5V1iYXPjK5KurtEPEAfbU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o8QzFfvTrXcGDzU+My1mdOUxNwbgvOdevM2WXIYHV1RBxcOWw8bdLBllOZs9QJjnH
	 b4k9TKpx5f3zwXl27SstSyTrkSh5GbK/xAqulPYdxFdE+qdtLda6l5rb3VUXfYLvrt
	 WQHy/EqweuYa9mUNNOWd9Z1jVCIwEsxvRp2Ppc0q1UXFuVJBCxht2ks/KOD+ia3EAX
	 bH8RRf9AN/vhh10W9gT9B/TmKqJs/bF78QXivuHjqlvxhA4QvfyPN5TZHqcLudzQ9M
	 VOAm79m/yxnWm7TeL42RrpGLlY5dUCdOPf3YUMbOWpNlQK0EcB6G+iTTpoMfooSMI0
	 IBiTZXjkyg6bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3292140E2E;
	Thu, 24 Sep 2026 18:57:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDBC4417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCC540AB6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m7-zUi-Ytyk for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75EA740ABF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=cY/iC+G0zvBDmdF0Wb9EAnJ90FHQrYM7gUCCvKEXsoIlDCxSTbLTdqnhFbaUeYIcGKp/
 qxgmBDGq49MtSDxJio6Sc1BaJ+cTsreFyApBymCw3yFjKByiwC8CqFrNneT2V6RagX1KN
 nqnlUuzV//520eTwC9tQthq/ZqwYfXRLwLjTWzCZlsrKNFiQGHxbM9qbjTjb8UOt4bd0G
 6NW4JgSFgmi0XJsqV1q5gWkYnMzFAQpoANjn7v/dxwo4Z1yg1/GKQk8CrcF3PL1onqnFo
 OjUmmTxr5D67UUPMAZxzi70+FM40MxnBn4oBS1Gmfdl4iAjvcPgD9GU8HrAKToWjgYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ge77i52KVawbAlEKxIHEgQ2yC7im2Jh3tNx2CIKGraQ=;
 b=iKOgyFeXNbpS66hc6JksHaYfBNWKDEpczBNI+1jMVaW5bYiW2/oS8DZ6/gTiE+09fk6D
 a4hu1f4uJt3dUAXBkmVPfZ9u3EXoRDeLMpCmHshc/oKpZfQOLCF+NKwUudWzanyrv9Jhh
 bveUY2J8SxdgIrrh4gKXOZxqls8ozsqxqgFsRlqSehVhyL+DJqP9JRcZvTwe8lX8JdDv+
 KIUypdpc67a/pSi+UjLhMCAujF3oIZ9fBomt0rJe/H3rp/DjatxgBAYHct01RWiMeXE14
 RS3wXYbprZW+NrzK2ly4wxZrDdplwKfl4uSi4AjKVVIYdkWDlLUfQJrFd5fYe2TuWNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75EA740ABF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 199FE98332; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5ed7fea89998239d4faea6062e95afed9ba7ed9d
X-Git-Newrev: d22254b6c6a285157687a61d1d42ce49a6bc8f35
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.199FE98332@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/unbound: bump
 version to 1.26.0
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
Content-Type: multipart/mixed; boundary="===============3648676370410023067=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3648676370410023067==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d22254b6c6a285157687a61d1d42ce49a6bc8f35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 531be778bd4bfc98142f372d1f4136d8a0759d8d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 85724ca243..a6bab2218a 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
+sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 46fca5e2d2..a3a1baaa94 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.25.2
+UNBOUND_VERSION = 1.26.0
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl

--===============3648676370410023067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3648676370410023067==--
