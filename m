Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC14C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 223E84061D;
	Thu, 24 Sep 2026 18:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6l8ZUXAEWRu; Thu, 24 Sep 2026 18:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D8D1740BF1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276244;
	b=IomXmxvpfL2Ge9ytD1iANbmRRQ7ga6K5g7he/1vCyvvnmIGcfxeFNVKhzAzO5MCnxJ3B
	 4tAmQChsLeg5OaoEw5l0xYoAeRTfc5zJ+re5iZXbR9b1awMVvc6lzLRndUFPeZUz76eID
	 O2c0LLdcFLAwa4CTs7MiXNpCjbKUUeLn0a6txVVfQpsVNN5eaSm0Sbx7MpQnoTiq9xZ1d
	 S3x6REc0E28xBxbmlM+MfHxIJF3iNvPswvw6u9+/QoBL3YdZJDnbt+qOnldjie8cJ1fRg
	 4YbIHPUSKS/IrIbdJtfH7K4Mf9KFkfyu12HHg8GIwaWTxURY4y7rCESEwifD4qWvrSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WHRoARnolzjCh+7stdGcU+aasltTcMipBX2KuAmhZwc=;
	b=bI3LImGhnMtQrswz/ss4hF6xe1aXf0FZm/FOWUdeZhVve65bovPj9snPAmR6sdSQm6rW
	 eY+Jhse8gXg7Eo5phlSzg9a7cn+Pe/3GUDhIbTcLN7NFUmcFI+6xSzRyqL3CIIHFAqY8o
	 aj339VoR7lPf6CbkgecxOFXApbetbzX7AtEMH4t2p5MD9B0Yubg/ngiWY87sGGcx5rD3Z
	 KN7KudAh9e26wkC1vkJeOoNiBOcgU493yz4BSxej8oiwhhBd3xubmr4oIcoREIO5dhYhd
	 KEhsPywDayKdALMrYW5CaSNcWOTJbIte5zuEx7wMbE5h11TT5ufjkEUDEhPHQf8nXsg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276243;
	bh=WHRoARnolzjCh+7stdGcU+aasltTcMipBX2KuAmhZwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mlFfsAs98AJ3WKdBgFoR68IP4A7jQ37UZLm4VWGXqyxPoQC1NmwDQKKPwwtsulXT8
	 ja0234uykkCxRyviAZi+pwldIGWct193kEagOdVO9mJiM/6DNloOmYsDheCv3RWv45
	 Jo06OUOHiwQTeicfxOKsuITJk1un3nCkZ8dwmklY0Oxf4J2mLdM80Mj7/qp2p8jQ2W
	 R9/wk3FLKO5eNBnr/fbQkR6DIQfN0gDznQfwN2hHEaDj2bpTHrFiALF4bZFkDebfCF
	 vYmowN6Rp3cYiEHMBQghX1LklhuEGgM2blLYjBg2h1GsyDrva8L1cc/nHOaG4wLVTQ
	 EH3gYwC+AQZYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D1740BF1;
	Thu, 24 Sep 2026 18:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E83417
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC9A40ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNBXzCzFvyTh for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 444E240AB3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=gc7JePb5YMoHfQBcgzHzDJMuelBCTQn2KDkCPUT2nxD1MkOiuSh42T60nfB48t9Nqalp
 Zeclhpn3iB1FW20QPe0q7HaCbaxjx4+W+n/NFmBrDt/CdPq8/60wvttwqHh75C3EQQpdz
 d8KwLi0zZwICrqjYVIUu3/OaEe5sil93nO0FQnPWpWUNXQEhcCrDMxOV4vETMbQXhIfYr
 DV2flG1gF4HDTm+oTXz0y9OI1f4XH878oGpmfatd4wI/32fBpeuZybu62jwfaX2pwSyj5
 z0TVsvL2u8qHNe4NopGYa4rp1tgvVNyYfP1z2CqDfjhFBb+tCkm3Frp1MxpgXno7WZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZeHW9RA/zGXeNa5uMPEZWZpSN8Sah3uTU06nZxTETwM=;
 b=sSaRJ78ZNgQXkng+cxb9pZbQ6M/F3dSvKraFfANJH9CN86ez8u3v/+aQw8TTpWoyGhZG
 iHplCm7EZD42A7X4O6AJciMO1kw2Zvu/p1qIgP16PToIm38bIDjndncg7keEvqV5/7W0r
 qT4mIMxfh1PQa6c9HYLIhdr0TWPeMPFtqgqJgfpmIZjL7lUNVbPGFPL51wxh8vf61QnQj
 W8CqjdapCgJMHpPq89UrByrZ8mJwWv1+iqLoGJnVMO1h5RlsSsxDM4YOv5T+KYyTpbkAf
 eMpiHeiTS/XWVdIz30qdyMIGgoG9D52MMh78+/+3YaYSbZ8RNBqex5Qk1Mcd/+4JrlA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 444E240AB3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC0EF98385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:13:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bef7c59106b55ad8e76aea1db3dbdea87f0f051a
X-Git-Newrev: eb53f3e00aeed08fee2e4babd9e7d1fcf4e61947
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.DC0EF98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: bump
 version to 9.20.27
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
Content-Type: multipart/mixed; boundary="===============4248641688564812564=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4248641688564812564==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb53f3e00aeed08fee2e4babd9e7d1fcf4e61947
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/notes.html#notes-for-bind-9-20-27
https://downloads.isc.org/isc/bind9/9.20.27/doc/arm/html/changelog.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bdd74f011f88fd1a3d7dc4c2a93a54ed7ce7286b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 36ff7b2d0a..2131f51978 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
+sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 172bbf79b5..2b42e87d62 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.26
+BIND_VERSION = 9.20.27
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES

--===============4248641688564812564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4248641688564812564==--
