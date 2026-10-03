Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B84CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B6980CA7;
	Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I21DzVTreADA; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C32080D00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042846;
	b=r7UtelMHUwTjNC8E2dLapvlM/WVKkA7ZQW1ibpBLf1eOq9hoGw69Cjm+zkeUsT98n0Kx
	 LSNVVCsOsVO5/WAyvbIGHoXcowvx0pgsUZQxPpiksiGSVgnK6jBI3cQxTPCKp20yyPYbI
	 kObUP1a2KSAGad6lAr7CVcXIBDFxioqCQsjBEM1+UzicsPTmoH4qMVPRdgaeMoxPAf2vk
	 T8NpqPGkkTkk4oybPnBk+TuDyeMdJ1ConTqQ/2EYKSllCuTNahyZ8tkz+OxIIicWt1NKj
	 sgtQ0pH/EplHJ9NOjSftFQHK/aKMoDxURUPXoMQAZnN3dUVLk0oJAyfem2eVTuWH4xA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N3yoaccRpnwTu3YwmyfvggKGZuj09Yo3m2nK+E8F46E=;
	b=TAhtSHAnee2MBxz3Scoj3kkhIVIlLviii3877ri1srb/7GikK/mp607kR7ZjHHgAMZ4s
	 4RvaAa6IgfQftqExXKz0JrqUkkaBvoBqLB6AQEZ/Xc3wmR9nqLHEdENKd519kpl0KC0DE
	 6MzHXlvWG7s7QQv7S2x90YQ1WZx87b/5bXoV7lp4na/9X7D0jPuQ5nU3qNlEjn4SnX+WI
	 AZMHRFIXoN6SGIPv83tCvq51OpCP+cP4ijS72rYxuE7qG5uiXviVhd4dMyqXH72aJ93QG
	 oqkDD6qEmhUQENTkKvpixjdcuryTnVCUCoAZPvLV9Oi2OdUCYqCrvKfo9zv5lUmf3tw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042846;
	bh=N3yoaccRpnwTu3YwmyfvggKGZuj09Yo3m2nK+E8F46E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZVh2AsgsL+kqyVeHPtLTV1jyOyemzvPd3zMp7+LolakUBEPJf/fnVEln7JZEZ1kDR
	 BnlT1gM6iGr4lMcVCQoS85ujyTzKLXeYMm1V1C4W851dpQ67saL2ikDu1m0fIqU1uM
	 LPYWJr1+daxFnY4mQZxKDHtlQ7+PjaMq5PzBNBqE1mzZvKwmB5yYrxL6zPh/cdRMrU
	 26rIcj59wocQ6KsheZbPHeWqRqY6KOOH5W+FbNzyBjSOkyYyLo4jIiHxXBbYl2xyI9
	 dZVu2BatIclbW6obO7jdLj0jyFIatsU1LU5LVLa+BX2MksmAAvORLsCr1KBBkJ8+Hy
	 UJ2TJ8AWhLnCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C32080D00;
	Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA114476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDC380CE9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uBuAqvAtPX1 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E63780C80
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=JgTegcLjGeQLozZXlpZ+/HX8kDvkzaLT4myiYwslIAk+aFwiEYZFLe+6Gk0HFC6XGOrx
 Q4Mj9pRdOyQqZUiTDjwzmZGFa1NGhQ3akPE06z6HcWmRthINccchnhsqZCvdFsQEqyFnu
 I/nhbDDBsAbE+qqRce1tNh7O4yR/9hzeUnpTtAJ6lPvmqXZNAazDkq5yUhyWuRF4Gg/VM
 uHsr8Pw+O0QRTjBQ9v6iVixHIJFbyP+Zx7i1bn5QSpFDv/rmxZxYPLWu1eBfMlZ9WnSF5
 XG98g9ZZRdDr4lBbGTPnZBT7DGFmCLvFiXaZp7RRM+4d6h5l70OObxoIqsr6DNsgDIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GhJGCJlsml9tQ512ScZ6FgToulg6SgE/hERhkVPsH1E=;
 b=rO+galPFEn5tSdk4rqXXZhkcXKwnDJCxKOPxekG+7tbZG9M5ibGvxwsGv0lPSWnq+CgG
 u2aiqHIdI74GA7yaGy/TlUjlFwU26VbAueIQRUQAlQ//NwW1ueTmcPoUcI8TRB3jgCZhO
 e33+Ppmi12+y2t3or9uGQtm/KnktHYNf/pq/f0w7HBRx0gpZsQSBY8CNYSXEvC9PnFLT/
 McsoczPpBzKOT8iXFMM2bo0qugPmCrTi/Fxvl59pT1L64xblqhvrf1N+DyljM5dHkjZf0
 bHF+h3LmstVZgwbjgEU9Os/yLrAavEOZ/enzeYupz+Ukvt0xNNmAcNo29X+7BNteSew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E63780C80
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 673EB8908D; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c76a48cab84b04c5124fbb042fde194d54ac790
X-Git-Newrev: bbf4256610cf48fe69c56e929bcfda022b1ee04c
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.673EB8908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apscheduler: bump version
 to 3.11.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbf4256610cf48fe69c56e929bcfda022b1ee04c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-apscheduler/python-apscheduler.hash | 4 ++--
 package/python-apscheduler/python-apscheduler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
index c29064c590..f0da3b306a 100644
--- a/package/python-apscheduler/python-apscheduler.hash
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apscheduler/json
-md5  22f9437792d120a17dc4154b5ebd1594  apscheduler-3.11.2.tar.gz
-sha256  2a9966b052ec805f020c8c4c3ae6e6a06e24b1bf19f2e11d91d8cca0473eef41  apscheduler-3.11.2.tar.gz
+md5  2adccf3fe49758859f5738924a9dba9c  apscheduler-3.11.3.tar.gz
+sha256  cd2fcc9330039a81a5893472ad49facf23a6d5604cbe1d918c835c6de7834d5a  apscheduler-3.11.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index 0b66bb83c2..1af81a6205 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APSCHEDULER_VERSION = 3.11.2
+PYTHON_APSCHEDULER_VERSION = 3.11.3
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/07/12/3e4389e5920b4c1763390c6d371162f3784f86f85cd6d6c1bfe68eef14e2
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/8c/6b/eeff360196bb20b312c9e762a820fd1b2c6d809466c755ef57863478e454
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
