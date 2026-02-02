Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825CAE7DF11
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473AE60634;
	Mon,  2 Feb 2026 18:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzFuGssKuhHc; Mon,  2 Feb 2026 18:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4262F60781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770055693;
	bh=BEb4aKog25cJ3ArDxZmdWEvA60GOEhhwI+5bWtm78k0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ERUSCgRt0h4AkERohi5+Kbz2v/ZIwatRQ6pYzSIsLnZcHKiYlDVlCznk84Uuab/S4
	 /bLIqIWe6fobeE7i5vLCxiA23Zs6wlYJAZyC5YlA01fEzFVLFvFxMqnigC5SUH7I9c
	 dyb93bmGZd7fXbzK0U5XM9t0p8PbuPcib5I/JNvaDqj0vS6E+yQ+AGmy0YQLQjBpK2
	 PtPzWjkQH22mpCmZ/Zr9hGA4hDTc2YdLmlaf/CyaLwIE4BnhgHLFVpue1zcUX17Sit
	 krpFYVnmYL1XCbWONRbva2mJUDzf7sHamTQ0N2oL5Bf0B0q33I5eQX/LgZPnCNVPg7
	 0JWav4iNq2YSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4262F60781;
	Mon,  2 Feb 2026 18:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FDC21E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B5A882342
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VHX4mKASG28 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:08:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AF73822F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF73822F8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AF73822F8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:08:09 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so36171215e9.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 10:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770055688; x=1770660488;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F3opZjRv4/V7A7H5FB4yqmnUznOv3g+RKd7g/EviZZQ=;
 b=o6ki+BAafaIbyyoGccrURnQSaa4Gq3pobkU2TpTcXy8Dm0SxT08SDookVEzzYAbvA8
 wu7f2Tk3Te9p53nvYuvQ98mZ2mjtUAlvrrfj+06/LZLwOSJDjCxjTE9QsLymeYLDqqj3
 shjw53lgCqGL+SrvXzEhUzfQwBySevGq1T4JuGSpsYKqWedRH4op/dMWy07W+776FQkq
 dvjkFg29XwAw4uK5nCFtAxPTLVyNmXP+ZpX+Tk7gxMWFY+Bbgq1JGyWyuWIrRtvQ7ngY
 Qos9uF8q3l3HrbgAkfYz+1jQnZjqqRIhlTjr3KyYi+OfmzymBwYXsnDsABipWe78ih7e
 diTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM8aPI9pkWa+D/k4nKY2/LFVCBOwKGdOqsOKQLqiuI3kTUf8Yj49BLIGJ7LAE/o5u02GQTwWGAf/Q=@buildroot.org
X-Gm-Message-State: AOJu0Yyt/X28OnQNBN1ybgXLjP84VQTN8hRt4kJxc5GeQ0fSml9Xd5Up
 a4QTQv1CalngD7J4Lw97rKqJMFs/c8a6ayuaAwuLvFnqosTEb3ZKdERSS5arbzM4l4w=
X-Gm-Gg: AZuq6aJxeEDPDenLGrkeNsuNp6npj19Jg9woj38/M4g7se5vz5Bpp4AdGLdOwC+aHbS
 At4ggCx6l5rAWnLfGwSgpIstHuXv2EF4UtbLxe8Jizy/uW8h9BZDU5KUCfZXRnZUxv93vApp8c2
 howR+TW3443tJONGFDst1YShiACqPMqJ15Hx+3sDCUCEzTuWx/hMA2K/AFOwNuSOLqYvWSSe2l4
 cDi0L+UjYFiHUaXAN8eafPxZ22s/1aK7FSdlwDa2yN1IPQZNYB+spp/hcIOabGihAe1l2QLlVLG
 AZagb1ShY/lXspPwwb2AsSQdDxx/fXjVOEuXXSCMoywIxNuAFyC48QQ94fOO09D+KYdrimyP1L/
 i3zvWQpJaZCCpJ1uGCZlTpBbiLdkgnLMcD+2JVQNEaGTg3NqRVbxhK4+pIBm9Gld1flR8m/u2uZ
 ucyex4Ssf21PBxbvle+iviHHCfQOlv6otB7+sDhLFjPtsH8D+jXjqY
X-Received: by 2002:a05:600c:3e1b:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-482db491ea2mr158661155e9.22.1770055688035; 
 Mon, 02 Feb 2026 10:08:08 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830511bfc6sm11641925e9.2.2026.02.02.10.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 10:08:07 -0800 (PST)
Message-ID: <4d402258-0ca1-443f-a0ca-74ab44d574be@smile.fr>
Date: Mon, 2 Feb 2026 19:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
 <41a35fa0-0c72-44cd-8f47-c9eb4727a098@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <41a35fa0-0c72-44cd-8f47-c9eb4727a098@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770055688; x=1770660488; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F3opZjRv4/V7A7H5FB4yqmnUznOv3g+RKd7g/EviZZQ=;
 b=KMbS6ZtcbIRxcP3dumkqorIUnPMDExnTZzEO8P/FPI89b8TqqcMcN9/GPhC025Ytcm
 idILD+zvKAejNGZmzjFvS8k+y3XgnH8P+jKYAG/RqRq3Azz4gFVv1JxUQrpwVYzr30Qm
 PqiCMFX4Mk86chg/hQ127BlvxYjHMonv4gicQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KMbS6Ztc
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-01-27
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDIvMDIvMjAyNiDDoCAxODowMiwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
SnVsaWVuLCBKYW1lcywgQWxsLAo+IAo+IExlIDI4LzAxLzIwMjYgw6AgMDU6MTcsIEJ1aWxkcm9v
dCBOb3RpZmljYXRpb25zIGEgw6ljcml0wqA6Cj4+IEhlbGxvLAo+Pgo+IAo+IC4uLgo+IAo+Pgo+
PiBHaXRsYWIgQ0kgcmVzdWx0cyBmb3IgMjAyNi0wMS0yNwo+PiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+Pgo+PiBEZXRhaWwgb2YgcnVudGltZS10ZXN0IGZhaWx1cmVzIGZvciBt
YXN0ZXIKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+
ICAgICAgICAgICAgICBydW50aW1lLXRlc3QgfCAgICAgICAgICAgICAgICAgICAgICAgIGxpbmsg
dG8gdGhlIGpvYiAgICAgICAgICAgICAgICAgICAgICAgIHwgb3JwaD8KPj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLQo+PiAgICAgICAgICBUZXN0UHl0aG9uUHliaW5k
IHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjg1
NzQxMzk2NSB8ICAgICAgCj4+IC4uLlB5dGhvblB5M01hZ2ljV29ybWhvbGUgfCBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEyODU3NDEzOTQxIHwgICAg
ICAKPiBUaGUgdGVzdCBUZXN0UHl0aG9uUHkzTWFnaWNXb3JtaG9sZSBzZWVtcyB0byBoYW5nIHNp
bmNlIHRoZSBweXRob24gMy4xNCB2ZXJzaW9uCj4gYnVtcC4gV29ybWhvbGUgcmVsYXRlZCBwYWNr
YWdlcyBzZWVtcyB1cCB0byBkYXRlLgo+IAo+IEphbWVzLCBjYW4geW91IGhhdmUgYSBsb29rPwoK
SSBmb3VuZCB0aGUgaXNzdWUsIGl0J3MgYWJvdXQgdGhlIG5ldyB6c3RkIGRlcGVuZGVuY3kuIFBh
dGNoIHNlcmllcyBpbmNvbWluZy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gUm9tYWluCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
