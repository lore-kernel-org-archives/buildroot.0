Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3929DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B99F4408E3;
	Wed,  2 Nov 2022 22:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B99F4408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfgoYrEGN_1l; Wed,  2 Nov 2022 22:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE3604014B;
	Wed,  2 Nov 2022 22:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE3604014B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFC921BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B977A416EA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B977A416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T59FcJIrqXb0 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFDE64168D
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFDE64168D
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:09:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d25so29974745lfb.7
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6aG+jvZVbyxSYqWUlUf1Yr3wLb9HgqZgHWp/npjCrw=;
 b=8PFec/UA7O9so+UYcTC2/sh0vmqL2is+1/qTCJzL8kolZusEeAv2x8vUsq7nT0UzVl
 UxafjAjIWb/3IE7W/LAWYKYk39QMmFhlodAd3cI59OurcNy7v0Z1/YVBqOHEpKb/OFJR
 Zhd9h3jkDuwiF/1AO1pKUSpc76uKl7t1xPOyRUzKF6nOyBL7a0o0q+HWDfwlmFEpFfMj
 Yh/jZyyyNdriYkp8OAWF08Do9ORJx64uqgnllo26k+jUqdL2e5nytnp98SeXQDE4AlDT
 kZqd21rYe/zxvbbFwzRUdSD0M8uL6DtML2Qjilx7oIFg42sUJSI+IDnOVhVjl56j3yZD
 gdJw==
X-Gm-Message-State: ACrzQf3GK5jPhwBnOEse4bFquQJu0+phNmIFVGDEzRVCT/+YgpoAwYPh
 hImYlM5sOp1Cp3JiGzZZLHc=
X-Google-Smtp-Source: AMsMyM6hxHBgB4IStaXn+bgCLMfShv+Eu9fh0kHPEygd1oPEwPJcdtpVpECqNE+gx+EyLVVh7Wsqwg==
X-Received: by 2002:ac2:4827:0:b0:4af:d7cd:5d59 with SMTP id
 7-20020ac24827000000b004afd7cd5d59mr10916509lft.321.1667426938440; 
 Wed, 02 Nov 2022 15:08:58 -0700 (PDT)
Received: from [10.0.196.136] ([98.128.186.104])
 by smtp.gmail.com with ESMTPSA id
 bn2-20020a05651c178200b0026dd4be2290sm2322087ljb.90.2022.11.02.15.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 15:08:57 -0700 (PDT)
Message-ID: <9017709f9301e7f7f4e195ffaf5b30fcbd9e78ef.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Date: Wed, 02 Nov 2022 23:08:57 +0100
In-Reply-To: <20221102222138.50541ee7@windsurf>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221031214739.6b258cb3@windsurf> <875yfzf8gy.fsf@gmail.com>
 <20221102180608.4ac368ae@windsurf> <20221102211923.GA3918838@scaer>
 <20221102222138.50541ee7@windsurf>
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=W6aG+jvZVbyxSYqWUlUf1Yr3wLb9HgqZgHWp/npjCrw=;
 b=ZoQ0MkokPnjotY95AAysz0F/pFWehS1tp1WJYuds2tj0FuzosJlOHfCrWdzCH3HzWo
 ozkj10ippIfgnEQA09IIIZ47R/RT1O+0VsFqImXbNbXOQL9x5Cr5t7OJuIZMArtX81U4
 VJH0xL7MjtQeJ5i7Pu3ZLDld/1BOVkrPf4y/OayWhQ5iBFxrWpXzuG7tfbrRJLZAg/Rc
 y4RPiySzEKLvDa+O7lOXDqgCFg4rN43HvpgcqZ/L34nfhRPVuho6mqsxsUjlYkyrtVM9
 Es+41UVG0kJcmoqt1Xz+Smfb+vAY+HU6te7zEqpK/JI7tstVduiFOJkooWBELz18gdsg
 moVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZoQ0Mkok
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIyOjIxICswMTAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Ogo+IE9uIFdlZCwgMiBOb3YgMjAyMiAyMjoxOToyMyArMDEwMAo+ICJZYW5uIEUuIE1PUklOIiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gSSB0aGluayB5b3UgbWlzc2VkIHRo
ZSBwYXJ0IHdoZXJlIEpvYWNoaW0gKmRvZXMqIHByaW92aWRlIHRoYXQKPiA+IGluZm9ybWF0aW9u
wqAgaW4gaGlzIGNvbW1pdCBsb2csIGNvcGllZCBiZWxvdzoKPiA+IMKgwqDCoCBDaGFuZ2VzOgo+
ID4gwqDCoMKgwqAgLSBOZXcgY29tbWFuZCBsaW5lIG9wdGlvbnMgdG8gc3NkcC1zY2FuCj4gPiDC
oMKgwqDCoCAtIFVwZGF0ZSBjb3B5cmlnaHQgeWVhcnMgKGFmZmVjdHMgTElDRU5TRSBmaWxlIGhh
c2gpCj4gPiBTbywgb3VyIGV4cGVjdGF0aW9ucyB3ZXJlIG1ldCEgOy0pCgpUaGFua3MgWWFubiEg
PDMKCj4gU29ycnkgYWJvdXQgdGhhdCwgSSBkZWZpbml0ZWx5IHJlYWQgdG9vIHF1aWNrbHksIG15
IGJhZCA6Lwo+IE15IGFwb2xvZ2l6ZXMgSm9hY2hpbSBmb3IgbWlzc2luZyB0aGlzOiBpdCB3YXMg
YWxsIGdvb2QgZnJvbSB0aGUKPiBzdGFydCEKCk5vIHdvcnJpZXMsIEkga25vdyBob3cgc3RyZXNz
ZnVsIHRoaW5ncyBjYW4gZ2V0LiAgV2FzIGp1c3QKc28gY29uZnVzaW5nIGZyb20gbXkgZW5kIDot
RAoKVGFrZSBjYXJlIQogL0oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
