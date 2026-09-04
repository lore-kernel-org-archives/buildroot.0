Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E59C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54ABE60E15;
	Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SnwoB2buY4i; Fri,  4 Sep 2026 12:19:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6329A60DFB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524345;
	b=QFuV06/bOx+quGc185bBdChy+ckOpjtptRWojzj89I3Qw78GJMQQoMHTZ32TP2wd5/6e
	 9S1pWFvx7T2aM9zlIsU7Y3ZX6AGmkwfu664DKCIz415rINzLS0GZCAXA/QGW5+4xCPWA5
	 bQq4XDq9F4G4CggTtJ+Mwk9KvE7+AK1+TMq56+wptr5F99yZgWpMmE1BZBgZsh7PTN50S
	 61d3Hv1Fu2MHzPuzJ1swcfCYDFO2m32g8WZnBcJhNR3KdtruYjKy+dqwVS+SnT8Dgepld
	 i7rIuLLpNwwrKG6gfEaCVljnzOsE9TJjOIafeWmwlwvXoZb8aNuspi1WinExQc7ZMVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=drb+uVU5jWlozLWRymIFbW5cRwccNmAvMrd4fIWHWWM=;
	b=F9e7qLIC4L1KuyBzXKEV46Mhp5KjvoaI6B0xt7xnBgT2x6/PeXRyWlAU3OtlDRX8/tGS
	 +iypj4m8iVSqUPImDbZDyKbp+Rf5a2nbdScAJgJr719aSR/AP4hu9AFJ46q7iQxAE2tSB
	 uxm6q60fUaHT1Nkruz/JvZe2I+dB96TH5FzF8tpc7Kw9eKqjtRsTHt+Cwl5VgteEmKbTq
	 zrcS+DZkqIeBfGgMVbQzqKDLl6/U4hsAiYS4h8X95WDBRN70IEXkY5Q0Qt830/2Zy9/Vr
	 bdZOfcLQ5dUsA0YqrKbkHKPUIgJFB0eIG0gQNoQIKD8ssPH/PvbjrznZ8nUmqtiZlpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524345;
	bh=drb+uVU5jWlozLWRymIFbW5cRwccNmAvMrd4fIWHWWM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RgAPjEXZyhDe+Q8ZNRoAKdD8TJjn8F03ItPMpAk6V5GNz9PDf9fRvPxVFySqDsri+
	 sgbhyY7O80kYvGCZyIMAG8XrZQIMiPDq1Gq2bDWDyTECRJdj/weQgVwuFhgkBNJSCH
	 0TSg0SuvjmSnv+4DrrtFORAP4MN5JTK0R7oY3u8T7xh6c+35nT+JC6Y5lWnBTQbU8n
	 lRUQaNzCEjDwS1A+TAmShI84WRMxMSrJ1UoqK4+R4tMrh3eyxo8HcbFOaN3/9Kde6f
	 A4rxGXyvFXSb4zyMXxbl7UEE/nMFmjTufoHmBY8Rd4b9KgNNbMhMerXC9VfeoL+iQ8
	 HI5Hf1Hfb8NMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6329A60DFB;
	Fri,  4 Sep 2026 12:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 275A0F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D7774031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFeYy01DRaZP for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CC7ED40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524340;
 b=g8U/oSZqXAivCe490a8bNKJR7enxKfwOjuszfCNQOvjG00+9cuKdSFCxZwm39qTjEpr3
 7Y59Swa4stFE6wAyWhuD8D1qhbYUMezPowNX8Dpe9MpxCgnKeDXk0dCd+YA32iS7aPxOW
 pelx2iwCIcv3ZE2NfXlSdxYvJ1wkvdZAb2akJr+Tyc6d1x4jRnMIV/KQ5Y2oA39i5ayW1
 BnvOUnIr+XRSo1VFS41kcfPJU/6jJMZruwvm3NmysN9OvWVOzDu8v8a+oygJmCBWHbfy6
 1E8M75KivPPoAaFYEnvFxcC0rK0MHnS/Tc2J9LKr/GJ8fp5y1aaMsrl+SLOq/4cLtRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524340;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=o0B2/eGiOuiI3+Zh+iIEDbo8Zekfs35hEii9CorWsng=;
 b=CX94U8Q39/rb8MFgUIBTfFNt1ecw4iIvF7p6Bz2nyYj/8PtKZ864j1hfbxPKN2wv4BrC
 79rU05GOJecPOwG8zCFQ3DYtPsOKenadCnLX4BqUWbcvJFcTbaBc2PTWTI+ObIwWP2JQL
 rzeR1So+3nyitakjZU43LtkpSt36ilmvNsqy4UEd2viEeGGXLk39hHZusX7S0l8MlkFtu
 IE3Z4EZqmiSs8jz2vNF7evYf31XvVBRQnbfHKQz/7U8byg2AuF3dwu0m6A0J2aUnfPVFJ
 BMdmELTncSNcMXcqSOM1gfNtRLsG47M6tDeLvewl7VKWRGcrHqLAMDURMTtEGxX9qzg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DYaQOlgw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC7ED40080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so562942f8f.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524338; x=1789129138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=o0B2/eGiOuiI3+Zh+iIEDbo8Zekfs35hEii9CorWsng=;
 b=mNBy2Qyx1IGdMDkdEy6W42oYdhXxEMg2yp72Cdws0Rh4hnM9k+TicjhTOPAAYM99E1
 ACB803bMoDd3+tbsStDbvjNXdbSiNqMwuT5LvUco46gUvOycqXUXtjPT3xCAHU1hluWj
 XsK22CP4Vycl+SS/MlWXZIEYvI5d364qwfkZpnlS1sp+ynd9Rc+tKkZMYl6bNigVFFtO
 HlyZ4bD97zg6P1HppRu3oGN6UYf1xPkMOcQWMXRnNu/JZUXUCwVkls63oXz806IMENN+
 uQzMfRiw1sU9G59xkZtIsJBPW/HfBoIEFKfDoJcCPSWgZTyiec/XGzX8XK9XhRgNmF22
 wW7g==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4zG3KRgUVqEhfuQ7B7orwo//ACdY+RFJHFQU3l+9teVSxCvSkqAL5ERZ3fxe4sO92Ub/BP+tgPXs=@buildroot.org
X-Gm-Message-State: AFuF++nPHulH1cuFeMtFW9hw6XeLaLl71gbkgoD05/HYKDHsinaDq3XJ
 +e6Mv3bIjVzCPItu6DF3XFCYEYnKiDHKH8jqEUPcs70LlWeaGXQWyASZaIZ84JbjCOA=
X-Gm-Gg: AYBFou0yHFBRcBtOag4A7KAO1oKUipepjULxLyQ/AiP3Vu0o3aAQyhLGsNBzjWDBkl9
 V3ZgXuP+mSYPv+WvFyrglXAcACkGlYVf8FvSynCRZp4Ud2zLTJuN2L9nDC7w259z4PsJo8/xiAm
 UyvP2aLI6CJXoLrymz1HKmMblF3c1MCLJz9EOFWQoif8RMtiAl1T+4MqHe6rB10a+Ccs0cBCLsw
 bOiqODC8SMNmWijmL1Dau7HLoA2M2j6HDIOxRHD3OU0fex9fNZ9F8K2+VUEZnA+8CZcj5EeD4KE
 kOBTWap/KOItoQ3x3tmJkQIgS8bQmm0GgW6ACU/d7dF9MxCGVoRp5YxBRdUPQDiTuF6NCrvTki6
 CQYyruxM3J4X7H9R+Gdtih+wD+UaSH1wp6kjcnCnrEhH1v4lT9RG1uhByFkfNG8puc3BqzQTSov
 S6uwsYxyJmPImjZ9fiP2eZLI1SAxpIR6yLz3S7frPRiWSdc8VYpaCg3A==
X-Received: by 2002:a05:6000:470a:b0:485:8101:dc40 with SMTP id
 ffacd0b85a97d-48587057037mr3630196f8f.9.1788524337618; 
 Fri, 04 Sep 2026 05:18:57 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858bc74298sm3522450f8f.6.2026.09.04.05.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:57 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:56 +0200
Message-ID: <20260904121856.406260-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826142830.4040428-2-thomas.petazzoni@bootlin.com>
References: <20260826142830.4040428-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/qt6/qt6declarative: fix select
 of host-qt6base network
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The BR2_PACKAGE_QT6DECLARATIVE_QUICK option has some logic to select
> network support in host-qt6base if network support is enabled in
> qt6base. However, it turns out that this is actually required at the
> top level BR2_PACKAGE_QT6DECLARATIVE option: as soon as network
> support is available in qt6base, the qt6declarative build will assume
> that qmlprofiler is available... but that requires network support in
> host-qt6base.
> 
> This fixes the following build failure:
> 
> CMake Error at /home/thomas/autobuild/instance-2/output-1/build/qt6base-6.9.1/cmake/QtToolHelpers.cmake:784 (message):
>   Failed to find the host tool "Qt6::qmlprofiler".  It is part of the
>   Qt6QmlTools package, but the package did not contain the tool.  Make sure
>   that the host module Qml was built with all features enabled (no explicitly
>   disabled tools).
> Call Stack (most recent call first):
>   /home/thomas/autobuild/instance-2/output-1/build/qt6base-6.9.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
>   tools/qmlprofiler/CMakeLists.txt:11 (qt_internal_add_tool)
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/72c956fdf982382d2981c649c456d1edc2c9d6b2/
> 
> We did not trace back exactly since when the problem exists, but we
> verified that the problem exists in 2025.02.x. It can be reproduced
> with the following defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_QT6BASE_NETWORK=y
> BR2_PACKAGE_QT6DECLARATIVE=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/qt6/qt6declarative/Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
> index a57b203071..e24133c3e5 100644
> --- a/package/qt6/qt6declarative/Config.in
> +++ b/package/qt6/qt6declarative/Config.in
> @@ -1,5 +1,9 @@
>  config BR2_PACKAGE_QT6DECLARATIVE
>  	bool "qt6declarative"
> +	# When target qt6base has network support, qt6declarative
> +	# assumes that qmlprofiler is available, but that requires
> +	# network support in host-qt6base.
> +	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
>  	help
>  	  Qt is a cross-platform application and UI framework for
>  	  developers using C++.
> @@ -14,7 +18,6 @@ config BR2_PACKAGE_QT6DECLARATIVE_QUICK
>  	bool "quick module"
>  	# Enable host test module to ensure that qmltestrunner is built
>  	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
> -	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
>  	select BR2_PACKAGE_QT6BASE_GUI
>  	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
>  	select BR2_PACKAGE_QT6SHADERTOOLS
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
