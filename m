Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFC6C98304
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D4E481E9E;
	Wed, 23 Sep 2026 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Gtvcti8GI9u; Wed, 23 Sep 2026 19:36:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7687E81E53
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790192204;
	b=tcQGmxNJKDXAnc85ynPDBfLdrHiTTfyzqR3L4F2qfdv4uikEswvoeDG08J4IHa/xfeq+
	 0iGm3uE38lt8D30vK0BPid6med6YCP8O25SFhaQbUAL1tYC4okHmV7bvBmFKWFYgF1PQ/
	 7Rqeh6EW60kooPWqvLmK8pzYUca2hThuQzd0q9Lj81L1WKeERhOnYKfkYKBN7Cp0PpTeQ
	 QpYSh9HfB+63zI6q4ifpeDGCdgb6aflj1hmBuptjw4Kif+Lkl2MemALIGUB3YV4kQpJnM
	 EwUDGJnnbttt7nexO9nemXHupCszK0cFKNlmxAgj6ubwVlE//21+JYm580/dL60dTog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790192204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=loUPZ+4K3UMoGypAN1EF0w5zVYLomPvzj2YmdHNzS18=;
	b=ABXPwQa029SnWx1uZtrfcennHgBQ2/d+WJPZp1avxq7mZY4j15f5mal966fKvKYo7ev3
	 nqoXjjyhlWw1Q1aSFigFGns6DxsGGflPcFZFG2CkYxkge95JJ1Z23Ct4S9PwbEs2479tQ
	 89AzyIlIsl1hVTd2L8VQ1WWHK7I3ENwf+tbMEqoQYpK6ylLfIYxZBN2r6+MXD6XIw1Td9
	 JKmPMYGUQaCI4N01LjGHnM6ds2MNeYbVPln8WzH42iPr0llkcTt7hbR6R9ycfuvx8AbwB
	 1OCjuQU07kBM7+10E1LAWkqlmiXsbJ1U3bPFm9pblftxI9p1x9Q2NjWRFXv7eZr7WTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790192204;
	bh=loUPZ+4K3UMoGypAN1EF0w5zVYLomPvzj2YmdHNzS18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ncvJedeCtWDbqJbNcp4yUXnFkK4JawUjH6vz/dL8wo3knG5dXoCMCSj9OyBWl5bvb
	 dwGRpm451l7X+I46cj9DehnG2JyImVZRUQ8q1lOjPX8qx/WUT+dDm5bCn14RfSpq2z
	 CbOuDqtiJ58Pe7iqG+CwG/9dfRbvgKlRgI7YIoVVA3BOopEyYyT4ODQuxF6ihkzghU
	 A73rS/xSjv6/wog4mPTyJI57VTwFnCx7sRv2kfKkbY+37MSN9GWHyXu8JAvO1mK26w
	 MAcTehqVW4gyAjF2dcQw1wjPewoLeuzJLNv3sVXZ5CK4sHRTknI8853eiGB/YrlNrF
	 jzhEkci64U4Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7687E81E53;
	Wed, 23 Sep 2026 19:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5023E13B
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41AB941207
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_-VF53nJ8HV for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 19:36:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 715CD41156
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790192202;
 b=Z/F7tfAFhCzU3NZKn644L+HxnrdLK/0T+MxsA4OljVjdNAiEY8OG0JZdEvfaxT2EDLWG
 Qr74p7DRBQtuI4HZylM0gv1j/GJjYorW/jMJ466WkJkkAdV9E105TkihFy6ie5cPNXcDD
 N1Ceyyv+yrZYXFRmCu55Kjdcq06PsQv+cqm6gVrcICDYzx1y91Oz1UWOmFMF28G3Kke8V
 nHs6aX/PlQ8R3nBBaSbcCTFq4OoLyY5q/hiW3QjtLixWdZomcRsjHeATZp0fx3PfvJUJY
 xjHJN1xMUpqrjdmCWyXesmVhKn4+EMcsan/2eQOjYjkaJNYQgqR3G8WxxXwmRJT1C/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790192202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=woi+aMCSeGlPPd0k5BnYSeeSt/tvqCLvUlQ0w3ikhCc=;
 b=pUZz+fKTzPuAVv3dKzLq/ZIDP6ehDmdd5aSeAnp+pru8fL8IyJGZlm1i6Bj+NSJ81c/7
 hIFkKCuTfexTFwKtJjwjftQc7e16by0e/NFiR+NdUsRUBp6q0ERxvwsuFCILGgq/h1d6D
 qAj+C8WbmPNgQb9GvUSYjhFdRoD8JQ41wuKfibsbfUh7a37Alr/5Lgpngm802kyfbQh+M
 hUnL6QrO4fl+7bRTrbplOam7X65E61LgFkAUaf2u/SvTZ0vSzsNPOi+9jvNpiUZg7yakc
 wOjf0owuLzKqUqIdqUkpLEY3YJ766WuiwXoad2MoM8uH7uwreWhXw9gZzbUR9Zqa35g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 715CD41156
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:36:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7427498352; Wed, 23 Sep 2026 19:35:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 21:33:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67380a32f78ca09b4e302a92307de585b9ee18d7
X-Git-Newrev: dc5cb8f02d6e8c24645e5f623e96067f7ad79840
X-Patchwork-Hint: ignore
Message-Id: <20260923193532.7427498352@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc5cb8f02d6e8c24645e5f623e96067f7ad79840
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.13/ReleaseNotes

TROVE-2026-012, TROVE-2026-030, TROVE-2026-038, TROVE-2026-041,
TROVE-2026-050, TROVE-2026-051, TROVE-2026-052, TROVE-2026-053,
TROVE-2026-056 & TROVE-2026-058.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f0ebf5d909..92e5fd4782 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
-sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
+sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3fb4f52973..8de7ba50f9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.12
+TOR_VERSION = 0.4.9.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
