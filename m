Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB05C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7641940733;
	Sat, 22 Aug 2026 12:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsKAgXXGc3NY; Sat, 22 Aug 2026 12:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787400399;
	bh=/jc7GO3zsGjO6QkvGmdknYymi3CerQJ8Jt7BUv/z30Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UWB9wma8x6eIzV3otuqZv9WjzgHQXKXrWjggpDZ83l5xu6XMtNVGiaOQ6M/S1aFAR
	 8J8XZqgLZO6WkRRTIFillsyuQTi+m3krMSUYQJKCM/9HM/iLp6dmAPEOZAxKrTPhhb
	 kDv627kz34XGYk46N2bmW/jIgQ8XhFztdGt4naOtVZU14A8cAWYk3rZJw4oowiN6SU
	 +HmarbvwyaMCWjptlHx6HDKuLIaauc8yb8LgOa1rxGIkGYmdLHKY78dL3mJeAmkNxw
	 yKAC/iOyyEgwtq96swBZ5dC15V2t3dXITxi7+4q/a3fzYfUOXnKnizpYlrD9JxxAxx
	 aFyDf9kyzgJFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A904072E;
	Sat, 22 Aug 2026 12:06:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A4A476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6C59605D9
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpD0rBDs1S-9 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 095EC605D7
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:06:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c1671ec8692so280892066b.0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787400395; x=1788005195;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vdGEHjzAhtsWi7VvYvO0i7rBE7NVKttDBYauJqyHIEA=;
 b=CXedAU3WrsX9gwKePa7C0bRPENkndltWX00ipYfYc7fwxjErRC+FwXMwEfhk2vwjaW
 TbvLjepvGdbJxYzjaqXmUr757OS+cF4ZUO4UryLRtYmQKtbFn7AO5/zXXTmCezjDPyH4
 MZGB/FXAGRedRTyOyzlfL4ayaMUjjtjSUUT1MCR8vKz1To07pXgJm4AZPHpWDUJr+/OM
 f5eATxDcig8QpsOWP0Wv0JlEk1OpX54mm1/Swh9pGraLy0vx/0mz6WPrHblYYVpJA75+
 UQa6rVex+zycLN9HR01dnyVKiyfN0l/5ud7PtVjAMpj4lhBhcbtG6Bup6v8AzeuWb/ZH
 nkQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrc5w3Yw2Ekvvw0ZLabEEYciThamdZMbeXGvWYdwBP2mNI6DgyqsEsn53XkPteGASn5Vu8wNvHpxGY=@buildroot.org
X-Gm-Message-State: AFuF++lvucnLfVEphS/SPx2u9VB9Z+BUNqKA9Y3L1AhfTTI/YH8WTC1J
 6lpK4JYEa8A6rxpcBiHnX9T01+wnC/1XrWeP1hbqeU/d9/Hdn5k6QdaQ6k6zhigO1Ew=
X-Gm-Gg: AR+sD11L7xPLGPuFZsMpu0iV5qIcz7ov+jmGK90DC1lIupCgbn03pPqDZVRyJl/MDoF
 6wruEZZK1fAQEz8uYv4SNKNKOCYtfYEq0a0ACtzHhMPvyy0TdO+r1c6hIIfDl9vabIr3GcZHsN3
 I9c5aHhq4nzrVg4gMq44fyZISkZPOXqRzxYS17epqWi7wt2gBZDM5wTbQ9yVyyy6ISLNyJc8VNd
 Lfpckg+YgeM1qxYa7ECqB7XWghkSNuSnS99MvHBaPZMpUwe7IMRDezaF8slEYnOUCo7dAOjka73
 bF/6mze5WYW30awsuBwoIcCtpWrfllR622RhrVEwJVGmEz2CToMJ4QWa3WsToReGGCqvPGti3km
 4qyuCzvYyYeq68au4KDD/uS6Pogy5hdTMv8SImCllVsS9RNloNGtTJMlpXl9ghg9J1sdehQh5uo
 IuMwFsAIyRSab56XIK8chQGH9XMUcjsU3IEcaNOcHhPiVua+addkKsJTt2HfdkJXyU+AT3gQgOO
 5LoVsp5hOMSeTEI7wcmLdN+upnlusD/wQJDvipV/9dc3aRkxdrb5q+oJyQ=
X-Received: by 2002:a17:907:60c9:b0:c21:992e:63f2 with SMTP id
 a640c23a62f3a-c2491c28461mr564019566b.1.1787400394180; 
 Sat, 22 Aug 2026 05:06:34 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2495ee5295sm306908466b.0.2026.08.22.05.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:06:33 -0700 (PDT)
Message-ID: <968da06f-6fc9-4ae2-a258-6d864b033b42@mind.be>
Date: Sat, 22 Aug 2026 14:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260811-add_missing_tests_in_developpers-v1-1-4ee158838089@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260811-add_missing_tests_in_developpers-v1-1-4ee158838089@bootlin.com>
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_add_Alexis_Lotho?=
 =?utf-8?q?r=C3=A9_for_libldns_and_python=5Fscp_tests?=
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvMDgvMjYgMTY6NDAsIEFsZXhpcyBMb3Rob3LDqSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFdoZW4gYWRkaW5nIHRoZSBsaWJsZG5zIGFuZCBweXRob25fc2NwLCB0aGUgY29ycmVzcG9uZGlu
ZyB0ZXN0cyB3ZXJlIG5vdAo+IGFkZGVkIHRvIERFVkVMT1BFUlMsIHByZXZlbnRpbmcgY29ycmVj
dCBub3RpZmljYXRpb25zIGluIGNhc2Ugb2YgdGVzdHMKPiBmYWlsdXJlcy4KPgo+IEFkZCB0aGUg
bWlzc2luZyBlbnRyaWVzIHRvIGVuYWJsZSBwcm9wZXIgYXV0aG9yIG5vdGlmaWNhdGlvbnMgaW4g
Y2FzZSBvZgo+IGZhaWxpbmcgdGVzdHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9y
w6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgpBcHBsaWVkIHRvIDIwMjYuMDUueCwgdGhh
bmtzICEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
