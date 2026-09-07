Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E469C79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A940D6067B;
	Mon,  7 Sep 2026 18:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv6qob1H8Jyk; Mon,  7 Sep 2026 18:27:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 411AD605DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788805649;
	b=Xh1pvSPNhWI1CuJyBz12uuDvnTy483fuYF/tbHHSLyynm7cxoyuB1MDySLvbgv/0JTlJ
	 UF6G5hxkeX97rFfSYcx3JtFYOxe3Vw7uIoeu9bGhfNFVXPnujbF2hMnvAoKvsn6GFYWoQ
	 EJdNN2rA3ekTIjtc8dgbBnwQIEHf4xwXBsffuP3PNkaFDcesXFdNDWchirqwu9Gar1WpO
	 B9ktO181qPLTKUiuITwuZIcl+PXGMBdNJ+g6sfxYMuDvbYXvk40Oyu/DgiA9/XfAKGkTA
	 nQE/1am99EnvJzYEKeEkzDwrXXkoe3B5JVJwf7Sia+E/+6/VfC/47BiUMF2JpmnlXMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788805649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eD64ZVnbUs+334wONnrYWH9HZ6CumQKJ6XsgaPqqVFA=;
	b=LLRmJtgrObwqxoSUNKlrsycdNCoIF6WGE/9ydN7dMB9URERbqxd3IYIrjc70juAQ70iQ
	 y9xDfIoK7YfGYLCMPT3/NiSTnAnuzkA1bz6opHIK39hxkVloQh0KMovx0804YS/yAnjJd
	 r6V79fMBzTJoTJWrSHwgpaxo+JNU7ctVPM1FK8KkDKxFtOAi2o5z5VuuemuLJZk1f1KPQ
	 e57WDNncjeO/DQWV1zGqRzPgegT0/FsuwCgFbN+QRvdHIFmgjr6lS2bWUKBrQMpDYIZx8
	 5DwaDdNo2mLMFxnDDz1npdUT5vlq5wsEIsJ756k37CzQyvfsZIGMJCi7CyNuThNFepQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788805649;
	bh=eD64ZVnbUs+334wONnrYWH9HZ6CumQKJ6XsgaPqqVFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ltyrIxQjuNyCSock85B8Eg/Aoiz1ldm0Mh0Ie0QxNJpGBu5NahH50JDzk5P1CDbEa
	 0gRHVr8py++WbkbtzteZafxDD4QHOpaWCO8I7opQF1gAXUypfDZH0EuRlseg9P5mqd
	 +hWJCjcSdcL9PM+TtKH2gsa5VjLQnUQQZh0ojDcTrCztfgWEyOj/pxN32LZHrk+f8h
	 HONu0BefMqzkx+BhTt0fR95rTjAqmgExP1Qeo3LaYI6Yaoe8UgAxvJ4ZyEjoEvYEfv
	 6W+xV5WoA3g4mj/N0AqpJq5GrdRN5pHii2l0DKKBp2b7N3CISiCusdtcTf2K6TS2Ta
	 aqhTGAF7+mnag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411AD605DA;
	Mon,  7 Sep 2026 18:27:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A53C629B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B6A640070
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqHDJTbFuitI for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 713304005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788805646;
 b=Wa0QVm+oBvlef7UaXxR6Xi2wEwbDnfOP1imcpH4+RIdZmEblF/SwqY7/nn24+PUICWUl
 +cX1Cs+tx0Yfl29OF/rGsdy8jFinVh3lF3x1DSqvzLlZ/la3yb7YcUPxdsGTYn1vX6pJw
 eLQICsoEyqobVjdENoa2AqVAXDgcKbiwZ8CchUakOdLLS+aZeqQlLx5K5UJRwIOSdm+0z
 XIyWtdhkAZM0sSz/3AwrhHW30xrLKytdTa/DD0WmvPq2MwTDtGt+oXK2Z/cjT1UNoKIIk
 othlSV0/sxGv4uxsJMCMv41LYRukBN9/rRBdtZhhEjc1itp8MQIKuvDOvw626h25e+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788805646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Nuqt6S6lSs+dHQedTbiFxNvZKLxQzy/9/qfE6tdcuxs=;
 b=Q2hU438csRhkE8r6BA7Vn+DMCsnVy0Uf0Tn9O/Fd+vm5ubEg8dkEWu9orGkgsJUAn762
 5rNGfa/pTt1uz5e8ahjPdIvAYqPmlMmCA7CRUfUU3GAutfkC8zF8b78RHxJsoRm8JbJgO
 aIiHT5DkHo7XcNT8dHPkVVRx4nt2ykY3jZ9PBrBK95KqaJZlyW8W2Nfdm3xjD3ErPMTvY
 RkGBGsa1X8Y1e0ltxlf8Idx12GjzCWrp3A389wcOXh3t0JnZNy/eYuRRpMIQXcMZX7rC3
 IPw+wBpB7Ex1acY2d9PJ/wql5Cr3xU4YhYIptm/Gddw6C+7bXPM0mDXzVD6Qd6PFLYw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 713304005A
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:27:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43B8E95470; Mon,  7 Sep 2026 18:26:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 20:20:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87e95b9877ffd29ce9a02399b8a008266a1f5971
X-Git-Newrev: 446c0f85b8cb39c360fe684762132dd26a634dd7
X-Patchwork-Hint: ignore
Message-Id: <20260907182624.43B8E95470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpcap: security bump version to
 1.10.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/446c0f85b8cb39c360fe684762132dd26a634dd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.7/CHANGES

Fixes the following CVEs:

CVE-2026-0799: Access M[] safely in the BPF interpreter.
CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
CVE-2026-18313: Fix a memory leak in rpcapd.
CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 098b059fdb..87cc77338b 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.6.tar.gz.sig
-sha256  872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9  libpcap-1.10.6.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.7.tar.gz.sig
+sha256  0b394ac90dbc0a9838ff97468e05c9c9a3e873dec2514cd58db65d859d296e31  libpcap-1.10.7.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index c4feee5766..a501ce2962 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.6
+LIBPCAP_VERSION = 1.10.7
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
