Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660CCE8382F
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 20:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0C160BB0;
	Mon, 16 Feb 2026 20:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akNAzH-mB08t; Mon, 16 Feb 2026 20:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5250460D7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771273799;
	bh=JnvVOcMGn5hufDSUWZ8z435x5NMHxaw3buWngKb0AuE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O4VDcuKdjr1E4R+5XykTewFnU5TrQbacvzQ2+bM+o77kamsdK1zpfzH1x/vdt+V0i
	 ZNxiMr9J7te1YRc++Nk0JQCuDutfsLSZ4yw+UcYtfT0zntQZrOV7SXgjUu2e2EScKk
	 NiG3eRYNmi9X0PnK68ecJNl0PIjjGu8lsWxscizMGng0bez3cS06PSBQ4BY772U2U+
	 BbHdxEmHrWI9gvYb9ZftFmIYS+KwVdodyzGq0Dapkz/aUceek2A/xmvE0vhav3uUnT
	 iYy5CRg8zHxwIOaiIDP5l87du1/8+P6+J18sDn7tHHH1RjnQ3077hbhg8jUoq2Q4aT
	 SXmHqk/sZK8jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5250460D7F;
	Mon, 16 Feb 2026 20:29:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86FDD35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7825360D7F
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSCcroiKHTYw for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 20:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9C9460BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9C9460BB0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9C9460BB0
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 20:29:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7056D60132;
 Mon, 16 Feb 2026 21:29:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Feb 2026 21:29:51 +0100
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 21:29:51 +0100
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Brandon Maier <brandon.maier@gmail.com>
In-Reply-To: <20260216-host-dtc-build-failure-v1-1-75dd77ff4650@bootlin.com>
References: <20260216-host-dtc-build-failure-v1-1-75dd77ff4650@bootlin.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <170245d07b4e17f6d8503cc04487b4d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771273794;
 bh=k28qbdq3aXL0q0ZU/9uhBB1d+selQnu5m6LB7qDhew4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hVJolWlZYxgg3iwJE8QGUydf1HP2A/LeaZdTCIsQ1jzHvlZp0wjQ7qJOvD4a3CFXq
 zb5JEj7YuXw9XOXxXfL9qoY/4Q7q2e9AjmeMp0Si77q1CpRi2aMoG5Wb8zCEoR+1WT
 b+xDK25kpsDztnC57MzmEmy/1KhPVT6onXWdhlWYolqs+HHEvIKKbRcWx6pGGUFdIn
 fcRQ4StN1IXoSm8NC9ZDsD6XHoS7ERNdpCV76AnCFnobBy0ocYG7pXLGUFAP/R5TVP
 r7G5MRw4Xt9PyT50agTDg+RIL/HbntBR3fSabHpyeEA7eC+YSMoz4V+sTt9zU4Ig7T
 UfC6KPsJhIRYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hVJolWlZ
Subject: Re: [Buildroot] [PATCH] package/dtc: fix host build with glibc 2.43
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTYvMDIvMjAyNiAxNToyNiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
ClsuLi5dCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpGb3IgdGhlIHJlY29yZCwg
Z2xpYmMtMi40MyBpcyBmYWlybHkgcmVjZW50ICgyMDI2LTEwLTI2KS4gU28KbW9zdCBsaW51eCBo
b3N0cyBhcmUgc3RpbGwgYXQgMi40Mi4gSSB3YXMgYWJsZSB0byByZXByb2R1Y2UKdGhlIGlzc3Vl
IG9uIGEgRmVkb3JhIHJhd2hpZGUgKHVwY29taW5nIDQ1LCBub3QgeWV0IHJlbGVhc2VkKS4KCkJl
c3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
