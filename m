Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F2C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 07:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C400605EB;
	Sun, 20 Sep 2026 07:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bx61xoglk20R; Sun, 20 Sep 2026 07:41:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D8FE60658
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789890088;
	b=r8nvLQXP0iUbzKj4os+FyPmorcHHfd7EpdpR4GK8sewEe8UpNLmuG3F+Zb8O8lxfP0SO
	 BWYVSVn67ZxQT6xQsm73D18qq5Rf3l/yIIEAahWYAQwqXiy8KSG4sl172oOptXfjrmbJa
	 q4XS5kROwqNwk3NcsgmZMoVZpJF0cz9NV8WjPTxZ9LAQSnKMpDwZnVovztA05ugafFMRI
	 b1UAraHFXPWopsQFnlbUw4Vy/fW/nmfbdzzvCLl7ittnGWbZlWByFSeBNtjqW5c1tISEo
	 giOOWa0Mabafs3KtDbJ9jbDfEZy7AE4SZa4m3kqjmbYm9+Dg0PextqO+goaegQeDM+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789890088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qEUwqR/IdlQahfH0VfWlDxhJAA6wsqmLQlAwRaEId5U=;
	b=eVzu8gBJYH+8q7ux9eH2w3KiZ3SMXr6hM/T2ABSYTEfN/dfhj4iZg2kAsGWQXm5gtXug
	 k9E+kDXhzNOZ2iVWW2MjGmr8E+ILzGEw9Ae7EilBQOx2ZxtK3bCqNhK/C7+gRDq+JWxdb
	 KwQLB/jh84TnNdNe/fnue2aGM/4ICQlTBW3MI3GxXtY1ZhZ2QHejhLM6ZJrQABImUENxi
	 FRWCGOf/yfcV/5Z3n3qqbvzNTq2YEaf9a07Hth6p5QUs8f1IpXMFDAUzth50GO91V/Fe3
	 reC1ASEcJmvkl2jtG6OW5PMsN+Wq2fOydzs7v6fWD2X8Yfzz1+2FAh5tbfUxUFp4v7w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=sunkaisens.com;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789890088;
	bh=qEUwqR/IdlQahfH0VfWlDxhJAA6wsqmLQlAwRaEId5U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jE26nfQ39ZRZzPHjVVnUdNPZ9blvSSRjSyREGUNJqXGPkOWqlsMxB2Pxmp9liGXG0
	 43ULhwu4b+pbVit9x6px6b2h2OXjsSZyIdZmS4fSRhsd6RAdfBGqszLPCz0rZ2A6G0
	 QkFhjcZaxgo0+q07cOdJUzPptUuJn2zZQul/J+RzFuk0XKja74oM801roZGRX93RHF
	 FAsuX3LWOXDN4jFSe1WaeML+mtV8rk7LvdUvy2De5lXsgq5DtSAAR5iqByPCVSSGHp
	 ypshKRZUmbAfyB8pJvKgku9YwHuH8dKyki3ziAtW7UX1tbMNZxft1PL/2cEAMUt5ht
	 96pbhGGULBR+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8FE60658;
	Sun, 20 Sep 2026 07:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50C43B88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E28060657
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msoVj4PjeVzu for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 07:41:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AAA1B605EB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=115.124.28.97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789890083;
 b=kMue/f0g2RkrolnWq9A5cdEgpHeRwfIJ6ZkE26Ly/4FWmXqX2Is2CRZ7oMjjoZtTUTS2
 WfKNYuOybS5rkgfxsc11oXqp9omU+p6WAAgWE5yc0QUnMuwy/W0z2jCOcl+2GweHse+Ql
 6m5/Q9NBCyh4+IW4G+IRNChLidsnNKM8j4uF0U59Mqf0JPQDXT/WROi5v8F4ixjK9SHnI
 OTicnw1thwXVBJ3pQf4vso8vVwch+zpdiqa3iv6KNoIwVLI9xNqLpWzfwlDIZuAGwStLE
 GH+JmtMXQVf2mHIUlRZMrOtyQidSaHid3hmAaPTbY9sRTjzmufcCohbm0XmVD64gkgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789890083;
 h=Received-SPF:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BKWX494C9F/mCWWhpFL4YdNe6ursbU9l9w4ldBQnOcY=;
 b=TCKD8aXzPxZdwEe3gEo52pg13+kHFcfDszypmwcFOLf+Ht2gE7DAAEWqvtrVmPTfbuYf
 NTNceYPrwfuyWx1JL6ivVTstFfNNcLvfxcBEOk3HSpnDbZY8hdJIkoszQwKcSYKUhb2LO
 Kbg8Vzxs4wqcYyHMez/tIMjI2JnogdHjSqoxkw2kS1IAVnWx5YScqOhjBhnf7gNLC6YkU
 3DciLoIwoLywT3zL89Ds9y/wTjRyGA/xhA18zhpRDm6F0z4VnW5srk9EGDaIlVE+CEr2y
 8pRNOzQQubUXsj5nFN/Jiz33taQrXsS/k5MBIG0TPk7WmVz+/XFrbkyqO/C9G04ns6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=sunkaisens.com; 
 arc=none smtp.remote-ip=115.124.28.97
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.28.97;
 helo=out28-97.mail.aliyun.com; envelope-from=daiwei@sunkaisens.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=sunkaisens.com
Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com
 [115.124.28.97])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAA1B605EB
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 07:41:17 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1317097|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0469744-0.00483557-0.94819;
 FP=17090952967393844597|0|0|0|0|-1|-1|-1;
 HT=maildocker-contentspam033037032089; MF=daiwei@sunkaisens.com; NM=1; PH=DS;
 RN=3; RT=3; SR=0; TI=SMTPD_---.jHw7ZUf_1789890060; 
Received: from Builder(mailfrom:daiwei@sunkaisens.com
 fp:SMTPD_---.jHw7ZUf_1789890060 cluster:ay29) by smtp.aliyun-inc.com;
 Sun, 20 Sep 2026 15:41:08 +0800
From: Wei Dai <daiwei@sunkaisens.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Wei Dai <daiwei@sunkaisens.com>
Date: Sun, 20 Sep 2026 15:40:54 +0800
Message-ID: <20260920074056.1320014-1-daiwei@sunkaisens.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/strongswan: enable kernel-libipsec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel-libipsec plugin for libcharon provides an IPsec
backend that runs entirely in userland, using TUN devices and
strongSwan's own libipsec implementation.

Unlike the default kernel-netlink and kernel-pfkey backends,
which install SAs into the OS IPsec stack, this plugin is a
useful alternative when the kernel IPsec stack does not support
a required algorithm (e.g. AES-GCM on platforms lacking it).
It generally performs worse than the kernel stack, so it is
not recommended for high-throughput security gateways.

Enable it with --enable-kernel-libipsec. A network kernel
backend (kernel-netlink or kernel-pfroute) is still required.

Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
---
 package/strongswan/strongswan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 2e20b244ad..0823732d1b 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -17,6 +17,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-led \
 	--enable-pkcs11=yes \
 	--enable-kernel-netlink=yes \
+	--enable-kernel-libipsec=yes \
 	--enable-socket-default=yes \
 	--enable-botan=$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),yes,no) \
 	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
