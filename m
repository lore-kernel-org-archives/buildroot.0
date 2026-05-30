Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7E8CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB91852D0;
	Sat, 30 May 2026 10:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7hu1etIG0fC; Sat, 30 May 2026 10:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A97852B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780136875;
	bh=aaN1nJ7aiS+i8pIYSZu331PHBmaAnxVnhce1X35mumA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GiI9VRrb8jW5UEDkeeqzDvf1HmPUmoOFK3u2LzpctfIDZ6PT0u1Wjy6I1OW9742ac
	 fbzXeXAG8Awd/ZvDIddHF/029K7sh81GRxuRpZ+MdpsZVRp/ShUCn8y7EdKbIKNnCc
	 N3iqKeK77FjlXq+NWCzZSs075X4fGVA6zFWOIAONGmRSssNzcG6jg9gOVmk7fUUDTA
	 MakcXGEOZ1lcYTAmbrOn57XmP8Npaa/9V8ygs3c0KpKikijDbRSvvQkGd1hHK4ESnH
	 1VzjUGU3x969UDncvaTg2bBHLP23pbLPpPqx0t7bTIRv6L/5Yo7h+KKK95c2r/k7bC
	 CS/zaVQSF5kCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A97852B9;
	Sat, 30 May 2026 10:27:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1695EF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1360B4081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uReeEh3fFRx9 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:27:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87D7A407DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87D7A407DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87D7A407DB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:27:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 475BAA4C2EB9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:27:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46048)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTGv0-000000002xB-1SKV
 for buildroot@buildroot.org; Sat, 30 May 2026 10:27:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:27:49 +0200
Message-ID: <20260530102749.608157-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780136870;
 bh=uEV8AkandlNZ2L7GqXVnUUPchbDqUmvSG9prHMoU8T0=;
 h=From:To:Subject:Date:From;
 b=fe6+M/Y89qr3YGWihOF/2DOHNeQzPRdefg1v4u71JrzVy7qblZh/BnITIK6gL4LsY
 v+yPJFluk488NmO/jeEeeUHwTO0slYiQuEXD4/Nelhzqb8nAsSbgODQJmWfPErRoJ3
 8wJ0TtSBZpffoipI0M2sG48PuY2ZRa3lO4LCgFa/jfgDXs+nPZL3qS0zIpKHO84nhF
 kMPHhDeiThp9FWjWcjcbFb+5jgIJLayUcfI2/8qUl2sC27G16XxOj0KZK2szKMtz+L
 qJRLghWf26m/RaL7npfnoWZZysMqYvbPzIae8fU5hMRBnXZOYKxfrCl8IFGVdbws4X
 wjfUmRaKb24rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fe6+M/Y8
Subject: [Buildroot] [PATCH v3 1/1] package/collectd: fix wchar dependency
 of mariadb
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

Fmt depends on BR2_USE_WCHAR since its introduction in 2017 by buildroot
commit 81fe75c855f9a598695f83b7384713820383efe4.

Buildroot commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f added fmt as
dependency to mariadb in July 2023, including the wchar dependency.

Buildroot commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 from March
2024, which replaced the mysql virtual package with mariadb, causes
build errors due to the wchar dependency not being propagated.

Fixes:
https://autobuild.buildroot.net/results/ef2/ef201a7d04330463ce46b93e6d5702dfefc6ad6c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ea3608057a7d9d9381810aef18b83cab4a7a7157

with the exception of bootlin-riscv32-glibc and bootlin-sparc-uclibc
where build errors in mariadb occur that are unrelated to collectd.

v2: updated patch description, git-formatted patch and pointed source
    URL to versioned git tree

 package/collectd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 127bcace6d..d1ed36ef5e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -393,15 +393,17 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
+	depends on BR2_USE_WCHAR # fmt -> mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MARIADB
 	help
 	  Connects to a MySQL database and issues a "show status"
 	  command.
 
-comment "mysql needs a toolchain w/ C++, threads"
+comment "mysql needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_COLLECTD_NETLINK
 	bool "netlink"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
