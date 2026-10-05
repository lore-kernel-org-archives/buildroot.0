Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD46CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3636140606;
	Mon,  5 Oct 2026 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0Nd90ERd-ty; Mon,  5 Oct 2026 20:41:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6465F405DA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791232899;
	b=nya/L/GYOLWE5Zhpnus7DwX/Kvhns5uzYYXTSwCAfUvyAwbBS70hEFMXfYyjoFHfnLND
	 3SDdnAS8I1Z0MrqIvr73H7bsd6BnJb9fYXpSPrHJaMlHEeb26RX9aGjYt4aDLxkatOC9V
	 8Pbt9ddNMRuwRQNC1mghpjJ1+B8DfoMh6Q/VXrbvRdcPIAX6BnMY98NG35s7LK0J1Qn2Z
	 ZEPvjckTdjZzy9NQJwhv/cM6Wc5WGhtk/mh9LI2YOwrYcuqIw1JVUU2XNScMFNpyswGrh
	 riYLGSDDp5UaFAozitBAIkWNaLzN5B9UKfXZTxOFg9Ugfn94mE2m46yR3NSCDtbiZ0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791232899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AcNe0Yq5zJD8XMvLaLc2qL+E7bEY+bXYK01EJdo4CNs=;
	b=tRhG3VmZd0kkMvNh0Fjem9kd5iaBHdgZxpV+GcL1zfWS4kgnRVy/rQbPtFzCdX0BzGYZ
	 6G39vpz7O4MyDfoKH0MZZa1vTneaZ0ohBSQtlIEqUTuOOK8QzXJtP4cbGpOB7+3+tLfop
	 Klu+VxPcSagoCbzKA2D8jPkP/POxar6Be+TpQLcqLDE4bQM+TtxEqLUtiHU73q9Cg0EMT
	 6+YsEPYljOzO96hdqf5psqZEjRUSQGXfw9UZRf9PnYYRrppBbQmcoet1aoKxjZIiv1SdH
	 0Ma1KfxLfAG/+GNRhIlQ3oB4bLueZfxNqdBm4GVBVQFii/WdqMkqG7SgiTOnZgYiyyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791232899;
	bh=AcNe0Yq5zJD8XMvLaLc2qL+E7bEY+bXYK01EJdo4CNs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UjSmBdumOvfZOde8KXMGHkX0B7ADnFGm1rzcHYbzHIoYufspAduIAZNjpFK+iSmzi
	 FflivG4mpkKXegfgmXqcGnSfkb0Opss+MJ1rkL9E8sBkYqADj+8W790nhKT3OxaXue
	 B9H9IBY+a/nkz/1mFdFyfuQvHi1E0bACr7xmwARjN25EDyp1k5IzUxBL5ZvGD0guzm
	 yG9lC95FDWaOFBXwepd1kpMROT2wiYW6xWotYVV7RcBD0QbUYtbs1g+znZ7zbdjX/b
	 XwXCHRuiISVHD3t1CdnA4wdSxaGbejAr20S199u10lgh9+o7rE3GMQgRcN/0ejauwv
	 pvyXEU4taCjDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6465F405DA;
	Mon,  5 Oct 2026 20:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3E822B
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F33B040042
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n51QPJbl9Gz1 for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 20:20:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E9B6340203
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791231602;
 b=iwGvshhJcdkR04avjOhnHsisEXswpzoO2qY958/6d76valws2rDZDVsbsaT7Uyzdu1rZ
 MgsZaQC2LpN6UmYj9+BG86Y4XQSpVx+WoliJPCn6Qc3WPZhXaMcxGl8AQhGXckah0H6Cx
 ZrZBYBA0btyXvlx5EdpPddisH0HvtnlsnYhwbaAqTA4GXhKzbo4Lx5WGd+wQj03kvPgxJ
 WZTT99xCTfuUsgUaEzW1OfZbNwizAeJMisbALTBS2SpLmsxQlKoVgZ4JVJvHBgKIN/ivS
 FosiYVcC16dKSxC9lVdWbk0KJHiL7Ei22X/csuZvtH2Pn0v6cDj2edWSXufG4qhLd8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791231602;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bl4a2yV9EH1vxhpgQoxyvEuMuPeaA7nfOBWzPNnx5MI=;
 b=KUwFVZ1XlFM9pqu7lRpD+oaRBL6Nu9FxxN6JNtxBiiIy2P66hGgeny1ZYQoEc7Ah7KaR
 zWtBdUO03g5DI8qQXW7o60AbSiogmzP3x+Dw3A0mafKoRk3l4QGvf2owx3tYBuzuu0uLz
 0PsVMSlzOMSk46sC/vGcvg4O7fjFvyUxHR4qwnobE62gC+kWraS5h3xf9z26b6rSKTFzu
 k/xKMYK79P/xVL7AuAvDFDj1RSGWEDAF+7km3h6EIGM18qlxToP1syxW8Kg6L82Nxruub
 RrMdjmOc5/o3J9IGMeDcMu8DyUu7c0oe9CYP+VScat58i12WeqF20uMEuRrDixlhhYQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B6340203
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 20:20:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10E838D6FC; Mon,  5 Oct 2026 20:18:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 21:56:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45903c02e328712370b25c756050155c5fbdc5fd
X-Git-Newrev: 261aaa6d63c5bc717631ea0ce2917fac321ac84b
X-Patchwork-Hint: ignore
Message-Id: <20261005201847.10E838D6FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: remove configure option
 --without-cxx-main
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/261aaa6d63c5bc717631ea0ce2917fac321ac84b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream release 3.12.0 first included commit
https://github.com/python/cpython/commit/398ed84dc40abc58e16f5014d44c08f20cb4b5f6
which removed the configure option --with-cxx-main.

Buildroot commit 36e635d2d5c0166476858aa239ccbe78e8f2af14 bumped the
package from 3.11.6 to 3.12.1 but forgot to remove that configure
option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 788d993d75..67fee2d6c2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -18,7 +18,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
@@ -202,7 +201,6 @@ endif
 
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
 	--disable-pydoc \
 	--disable-test-modules \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
