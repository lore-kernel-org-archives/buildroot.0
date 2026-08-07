Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A48AC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0995C60A57;
	Fri,  7 Aug 2026 11:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRDN5fapeXfB; Fri,  7 Aug 2026 11:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC2360A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101220;
	bh=wAOnstU/MKunQlHTPsj6VFbgjZqMA8DdiKGtybc0UGM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=OaP5qfvjIF3Vo+ri4TOFLcr8ldEvfrOcJlx9kbZIqyc59fDhTuBc29lolp1pyM7LT
	 jpFEJOhchcNDuxnkOzlZo2822SWQFEf54lXSWqNhhvFh+2uMcqXL5QUb0cl/Mhyq8F
	 jAoQdDpSDXqQF7yI324ilqYBHvLF8SewODzxq1itcW04EtEPmm76Yw5KbOCsEymnkx
	 y4LkcFoPJTUsADIPUcedeyOgW+QYG2iPCR6dKi3NS7UJwTv2r3P0GHKKyIPH9dwdww
	 CJUdDZltvCxKZJwEiea5hHcPVkYgrq1ZPkVTrgv1PZFMn6bt8JmOp5E151TZed7n+n
	 uWeLg9tqUS+UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC2360A3C;
	Fri,  7 Aug 2026 11:13:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F89C10E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 415E6403F0
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ief9t1Mor6Zk for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFF2640207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF2640207
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFF2640207
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:13:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4807df69172so179364f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101216; x=1786706016;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ymlxJIxC3iuk+Ya3d45XaZ9n4mMSeHgQM0ODbdExRXs=;
 b=hCs0ASPCFnCYMi5SMlgLJMjCl9VKvL+HZ6wiFA8IcyS85lTFDGawAPyUrXHXrhGJkS
 lMsp6vLuHuyy/J2kvZxWiYwyDAMRICRl5H7qq2oa3SFq9GzVzeKxQks9PVL8RNSv4RIT
 19PvvJSKf0QCi43NhLdjAtJzaP/7qtgokyjunGdPPBVMtXKjJOKpBkCGachY9PuDHeeK
 WREonCiplzoOGfKYgJMDs8Ok1ZLW+dsjGDua+jtT9r4vH/VxzzscA+wg+DuqNdoM436V
 Tdu5fDH5oKaTh/frQ4L/uSdm6vxODHMBmom0f4Vfv9xruFYHlhpBC5GJJrTypF5KK9r/
 KcGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUFNOqAt7yWsRda89stbUx7Eer4PXsymiX6hibzUiK41PidUIz4oNLrqJxA0gkNZRPuqF8wUcepSk=@buildroot.org
X-Gm-Message-State: AOJu0YwKdfgFCSbENdM2ftlGsW3B0Xm9zeMJsnyZg5/5Wy7v4JIpsCDb
 6luGDlAHqIXoTcYldFhYYAdzCvCOFNSOaotYH7wi6V+TCBqSMj2f3PBR3WajqEJOW5MDT+mqovs
 0RuB1
X-Gm-Gg: AR+sD11zuD0G1JpvuCaA3lWv7iFUU2gItEha1UmGAiJ0MqtWqXuYOpBlhfi7wICRVq6
 6p9WcCxNACf2M/FPGv+9BlRAEV8jfFL+/NbsEx+FWgJeWUz+TmvOK/aGOObhA+6lulV8cEpeBsj
 lGW0sijf6UIpF60+/7LVXrLff2TqofUhjHX9BeshCNMRa4qbR/hByN/qvYLVIk/sML0ZKzIBoQW
 dDeZeDpWaFXXhwm2PMwf3+nQ4ASyBpgoD62EnSi+urTWan/hjs/FabW12CP7HUo9qRg+E3q2Jbj
 KMsNhlAyUjfZMwyaLk2OSf0eGdRoLhmcih6KgASDXPwYz8YRWgDWOqTb1L5t6J6a92dV0BvXPsK
 Gk3lBq1hNlAWMo9/6S4VsCsPF7ZRmH9z63z2uEyT1D6aWfHiOdoR24u7p7vi61nG745kckKyp+O
 xdH/KVeTy8rt+ArIT7n2dOcg/RK3anKuWKxNQtKlIGxAkvJqrTVkEqYAVPv6kPVEoLD3j8+fvzw
 sw4iLXbORTTEZtjrpjJYGbuAzIB8+kidUQsK9msRSkSkWq/
X-Received: by 2002:a05:6000:4007:b0:47f:ec53:1d2d with SMTP id
 ffacd0b85a97d-47ff4cc3307mr20610622f8f.7.1786101215314; 
 Fri, 07 Aug 2026 04:13:35 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021f9182sm4859804f8f.28.2026.08.07.04.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:13:35 -0700 (PDT)
Message-ID: <3d2ce1df-1130-4394-b4da-36deb62c4398@mind.be>
Date: Fri, 7 Aug 2026 13:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260727154523.3265562-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260727154523.3265562-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101216; x=1786706016; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ymlxJIxC3iuk+Ya3d45XaZ9n4mMSeHgQM0ODbdExRXs=;
 b=ZdYokSY1AaV3lOcpJOenaWpBTnCHJO1NdIB0ensDRuNF6jhSLVz1cLjRmDCFlRliqV
 LinOOo3UMQtK9djGWKYh+F1aSisMMaFZP0zmGmkEFGesRaNdxhP71zXwl9krxvy3Xlmd
 7Hm/MgNrYnHu79AkeRkeIds5aHSLVLrokmYizujR9tg5KvcZtS6mXflgOgb6xaXTvjWD
 t7uiwAd3Q2CpXUrBvkEvuanHY8wN76BdDyOVAEtktq/bG6I1bgpveB/sHcr6YFeHKQ+i
 3vIgcpoV0VzXu3sAtp6WKAgNkqXvpjmnBJ+mM+BhLu9QC3iKXLhj1SxNKWbwWGzlWzWv
 MSSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZdYokSY1
Subject: Re: [Buildroot] [PATCH 1/1] package/p11-kit: explicitly enable or
 disable systemd units
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

CgpPbiAyNy8wNy8yNiAxNzo0NSwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBG
cm9tOiAiRmlvbmEgS2x1dGUgKE90aGVybW8gR21iSCkiIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4K
PiBUaGUgLS13aXRoLXN5c3RlbWQgb3B0aW9uIGNvbnRyb2xzIG9ubHkgaWYgc3lzdGVtZCB1bml0
cyBhcmUKPiBpbnN0YWxsZWQsIHNvIHRoZXJlIGlzIG5vIGJ1aWxkIHRpbWUgZGVwZW5kZW5jeS4g
RGlzYWJsZSBzeXN0ZW1kCj4gdW5jb25kaXRpb25hbGx5IGZvciB0aGUgaG9zdCBwYWNrYWdlIGJl
Y2F1c2UgQnVpbGRyb290IGNhbm5vdCBhbmQKPiBzaG91bGQgbm90IGluc3RhbGwgc3lzdGVtZCB1
bml0cyBvbiB0aGUgaG9zdC4KPgo+IEZpeGVzIGhvc3QtcDExLWtpdCBpbnN0YWxsIGVycm9yOgo+
Cj4gaW5zdGFsbDogcmVndWzDpHJlIERhdGVpICcvdXNyL2xpYi9zeXN0ZW1kL3VzZXIvcDExLWtp
dC1zZXJ2ZXIuc29ja2V0JyBrYW5uIG5pY2h0IGFuZ2VsZWd0IHdlcmRlbjogS2VpbmUgQmVyZWNo
dGlndW5nCj4gaW5zdGFsbDogcmVndWzDpHJlIERhdGVpICcvdXNyL2xpYi9zeXN0ZW1kL3VzZXIv
cDExLWtpdC1zZXJ2ZXIuc2VydmljZScga2FubiBuaWNodCBhbmdlbGVndCB3ZXJkZW46IEtlaW5l
IEJlcmVjaHRpZ3VuZwo+Cj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKE90aGVybW8gR21i
SCkgPGZpb25hLmtsdXRlQGdteC5kZT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54IGFuZCAyMDI2LjA1
LngsIHRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
