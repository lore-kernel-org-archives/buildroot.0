Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBF9C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 06:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F2A840C01;
	Sat,  5 Sep 2026 06:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUbfuWA20jEj; Sat,  5 Sep 2026 06:02:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2349C40BD9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788588179;
	b=VnhncnOCiUpSUma9O4HD69Yk3p3+HmQXsu+WDGRPdkcNy+3DlBne/YgQBTzBdgNukU2s
	 26XLgojhKPb1dCSgvkRA3+MwPS62TfKR4/PyFuIzf3NmiG0kPeCrMGi2Sj1E0hWFq6tV/
	 8WUG0TafkzHNamVIIaDIpCss7rkfnwveQ6Mhv8ggxC0VGTn19YaqG2rPBwXknkJ3rfkyx
	 xas0Kq25mHUDRpYK2qkV/z/oJISa/h/aTVDuhApTeip2kqXqrSoJbukpPTLr8jSfEm87m
	 YEeQhMqJ9qXj7N03bGFrg5XqinzuE4hQyjDA6f0l3W+ju4N/Snhbpc68xoj7pUHnFjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788588179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0KOuXkaW4dhLGgzKd0M+PfHXodKZHATuy9LyVGeigKI=;
	b=XzZb2B5zfTLpI/p3oqVF/un0kN3mLqQsF0z8bhAvzVIUHtpZkFWKfY+wPFiVI77G2vGi
	 ltyYLo375NWPzHwugENCLky31FpE1XjCMzC9rpkCkVEh3V9vVQCs3T8yZZgVs4mi2r2cP
	 9edkReLbT5ZVsMjyj673cT3Mza944ZoTghikzLZF6o49wQ6bTvpCHuVKAXp7HLavSPnyt
	 misGCJaC3VibSif1xwPcuIuO5nqR3gmdLZmR5FDm6KzJyCEfZz5llo0eW9JkLw+llXtbP
	 ztgedToiPFsWbGxBe9PUjKNQOuhf5NhoJGYESA1XHGT7EvDXni7uthnfqNu+LHU/guw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788588179;
	bh=0KOuXkaW4dhLGgzKd0M+PfHXodKZHATuy9LyVGeigKI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5At6qUfRO86XTkV59k9KhvDa+gjeozqnhXPyJmX8VWPgPWgpsR/MGMj4cE5ASJhY
	 Cpsrt3cy+wMbKbzcPOqj2y+jysgMNjDBbvF93pLdaX4LXOcbm/Pic2BV/8ZkTJk2w2
	 oeQgE+tFDzTWTRSWlKsRYBWaMcJ4i6AKopEW3m85pGFGxhNLY47y2K0ydNhE/9rgGo
	 GEv159Js5r9wg/HkLxrvc45z4B1QhGRIuP4w+7GZCexivUazCB9+rgWCLaZvUTh1E8
	 kmwTPiNKIbx40IV5o6wCV6gj9Y0OSYVdFg8blIfJti0XRV7riakGxHPSkvww4cxMRG
	 zS9TBW2MHWFmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2349C40BD9;
	Sat,  5 Sep 2026 06:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 291C5230
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E56C60BED
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xH8COGb3pPC6 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 06:02:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4ADEC60BC1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788588175;
 b=CcoA/23Kg5Ynzk205odknbIhhACMVTpSCUdB6c0Qld3WZomoRHvITW9mq5o79T7YpFG0
 nAVN/iTXqoAAGFEwdZ0y8kJRcK5MHOrKueH3SjWTuhlTws1GuGWEflR8daMW1aWmTJdmU
 cN4RkRVJ5zcnLfY6JUkMYa/n/2W4TOLi14Uq/+e74EHj40MKeXTzZ5G8zFX2qX4W+oqFh
 HLrw1v0BHYn50EArSVrcE2/0fN4R7PeR16qW8TGI1sIc8DEVz5kyMGOqzO8b+dWKWssrw
 eKqgk09kMvrLwctmkDCnblXYB1oKiVKxTYeaqPf+hCtZ1yf1M46+Mga7uzGxrUSJpGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788588175;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Yf13d7i4QKTqphirNSzlfXesP2OCHqdAZFD6qVv0Kvk=;
 b=brU4ScLWd/7vJmPVGIvXaWpiiQq21A2dikoWGFX8qFc60FINEws85yUmFGEZ90NFKxEc
 dyZmbMrnH8m2qDiIHypULwY1R8N1ziQM3ntGbAqsgyOrM/v5CLDWMqu8AQdIZ7UmeegWT
 4SjwGqCDXL2zWdbw3XXCila3WAmIr38hY44hyRlJxH4XJmFHEiZSE/O0vdgnoqjEExN5p
 Xm+nxzjXbLWdDdMyvJkos9IFDeUQA1SrGfTSkywH7GDabXwzd2W77AdDeGJQPMWbF8CL0
 eqMXfjxokjpv/ygF6gDvaF1GvImHOHGEqBnm85vvo9sX1TZ4rr9UcCdrHuWm7gXtgXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=szX9t7SU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=szX9t7SU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ADEC60BC1
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788588168;
 bh=Yf13d7i4QKTqphirNSzlfXesP2OCHqdAZFD6qVv0Kvk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=szX9t7SUppH2goGuqZTP4zkFutXmxxhxRVH4dptzZFFu4Y/zftP9BP+GU4lvNuLSu
 3xh80JuDbi2vbhOiDIEBgBJMigvLRDX/jwEDvFWkCBWxR4cZwFXpzQCIKJE6Qjkj6f
 Ac487U74Gn8smuHIvw+Twch9HTZf9qRpCqSsEtJ3cuDalr2Y53sDhaEjCq6gdO5vTg
 YG1+LH8k8OpzF0DMf6/uNLKax0H+x234xVdzx225gDpQuMaiX1zSlmQgZOqY7iRo8R
 agW6WUBWQy85VZhntKRARzZjqkV9hvLZXUIM2uflYINWpik+n0ngAikFqGWmikOd7k
 aOEvhDWpmuziQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB620A4C05CB
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:02:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35818)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2jUG-0000000078N-1UD6
 for buildroot@buildroot.org; Sat, 05 Sep 2026 06:02:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 08:02:48 +0200
Message-ID: <20260905060248.332445-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905060248.332445-1-bernd@kuhls.net>
References: <20260905060248.332445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.3.3
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.3
https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/8916a0a9433c6954a513445a1f29b8b2335bdf54

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 82043b23f5..bedf9f8af0 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  56f4494b5cd408ec245aee6107c3bb93565218c24fe466940d1d1a89c4045053  intel-vpl-gpu-rt-26.3.1.tar.gz
+sha256  70782df455555dfd216507d727f67fcca191959b9c911e27ae23ecc8852664ce  intel-vpl-gpu-rt-26.3.3.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 4dc062acbe..f953cd20aa 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.1
+INTEL_VPL_GPU_RT_VERSION = 26.3.3
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
