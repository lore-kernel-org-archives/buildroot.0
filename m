Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E409484BF3;
	Sat, 23 Jul 2022 17:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E409484BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Et7rM6YfDt7r; Sat, 23 Jul 2022 17:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F6A984BA3;
	Sat, 23 Jul 2022 17:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F6A984BA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB0951BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84D1660F9F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D1660F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaHsV9LJTv4N for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2644260C00
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2644260C00
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:15:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso1137369wma.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 10:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VWmxmpbJ35wrjwDK39WlMkrx+JCwMFMs3eHy2prM8LM=;
 b=GFR3M3GpzcA+L8f86wHWwY02tbPMNwSuOUVAVLJEtcANl9nqmosKpXsuRt1DQ7Stko
 wOE+V5/GohxPYlrySZm8KmToCM5aIIrVHFzT/0ObdP1BA/pzQkq7tC3DKEiwTnUvzXNn
 4VPmzkcl5M0sjKmzeOqJHUp39PstqY488Zt0I/h6pubO48BM8+SVlH70XP/Q8BViNAxe
 C9baDaJ/NmqO9E+u+xsLsEoJBISgnjaqeIzgEo6vBow7fMq7YoHbcM6TgYFVZuBgBVib
 lM+UyL2AxCBEK5RwsdQvmT2I9WAg2IOXJyHWIzO7Tc3BzqNk2nrorBXuavTu2esbUnPo
 NkKg==
X-Gm-Message-State: AJIora8I3cyJqqT0+A6v/FnTuCGfZH5mGMbx70/BjmzU6u12kKMFc93Q
 o+ssCbHniW4cX3QBG69ryH3Fgg==
X-Google-Smtp-Source: AGRyM1v8NOykagKb8LyS7tP/eTxuvNjuLDkcbe5+dUZLfVVKyheDjTWjMhtl2PHUAGzyzaYyXXZq7A==
X-Received: by 2002:a05:600c:a18e:b0:3a3:10ef:672a with SMTP id
 id14-20020a05600ca18e00b003a310ef672amr15587138wmb.14.1658596552358; 
 Sat, 23 Jul 2022 10:15:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfd20e000000b0021e40019ae7sm7228856wrh.48.2022.07.23.10.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 10:15:52 -0700 (PDT)
Message-ID: <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr>
Date: Sat, 23 Jul 2022 19:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
 <20220705134402.5914-2-david.gouarin@thalesgroup.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220705134402.5914-2-david.gouarin@thalesgroup.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VWmxmpbJ35wrjwDK39WlMkrx+JCwMFMs3eHy2prM8LM=;
 b=q4kqAk/YGXupgiWrhNmEKaMcWvrRVffzymoVrqBzXMRWgwto7YNtmBV6fdFrSM+DnL
 QVTOBHJ5u0xBFHmw5eW2zfXm0bncwsPsA8ds8IDkWxPXc5P4WZMDq7ZxLdmE1jH+00WE
 BJF/O+tp67U4cuXWPfmjRXQB1effxN8Ld6BKVZuiMgP7cv3J1GeWUfEfYQ1e2MFftVHr
 jqO9fDRikr3BOhPzR6COe9UvVaOcpVdWbrjMhnlUzygkCp13ETHMEAdIoAgEQGBekVdI
 7kbdbsZaVIoIj83O2lvzn83SKmN5Y1N5eU/d0bWfqsPyZb6XhiWdb7jxbnl1vump5eN4
 yFcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=q4kqAk/Y
Subject: Re: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGF2aWQsCgpMZSAwNS8wNy8yMDIyIMOgIDE1OjQ0LCBEYXZpZCBHT1VBUklOIGEgw6lj
cml0wqA6Cj4gVGhpcyB2ZXJzaW9uIG5lZWRzIHRvIGRlZmluZSBhbiBlbnZpcm9ubWVudCB2YXJp
YWJsZSBpbiBidWlsZCBhbmQgaW5zdGFsbCBzdGVwcy4KPiBUaGlzIHJlcXVpcmVzIGFuIHVwZ3Jh
ZGUgdG8gcGtnX3dhZi5tay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBHT1VBUklOIDxkYXZp
ZC5nb3VhcmluQHRoYWxlc2dyb3VwLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9saWJ0YWxsb2MvbGli
dGFsbG9jLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5tayAgIHwg
NSArKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLmhhc2ggYi9w
YWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MuaGFzaAo+IGluZGV4IGNiZmQxMWU2M2IuLjBiYzhl
ZGI2OTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLmhhc2gKPiAr
KysgYi9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+
ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDZiZTk1YjIzNjhiZDBhZjFjNGNkN2E4
ODE0NmViNmNlZWExOGU0NmMzZmZjOTMzMGJmNjI2MmI0MGQxZDhhYWEgIHRhbGxvYy0yLjMuMy50
YXIuZ3oKPiArc2hhMjU2ICAxNzlmOWViZTI2NWU2N2U0YWIyYzI2Y2FkMmI3ZGU0YjZhNzdjNmMy
MTJmOTY2OTAzMzgyODY5ZjA2YmU2NTA1ICB0YWxsb2MtMi4zLjQudGFyLmd6Cj4gIHNoYTI1NiAg
ZjgzNDBjNDQ5ZGQ2NGE1NWM2NjA1YjAyZmNhZDJhZWM2ZjQ3MzYxMmFjNjAyNjczOWEyMjk5NTM4
MGE4MDQzYyAgdGFsbG9jLmgKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ0YWxsb2MvbGlidGFs
bG9jLm1rIGIvcGFja2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLm1rCj4gaW5kZXggOGNiYTY5OWVh
MS4uNmE1ZTFlZjRiNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2Mu
bWsKPiArKysgYi9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MubWsKPiBAQCAtNCw3ICs0LDcg
QEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTElCVEFMTE9DX1ZFUlNJ
T04gPSAyLjMuMwo+ICtMSUJUQUxMT0NfVkVSU0lPTiA9IDIuMy40Cj4gIExJQlRBTExPQ19TT1VS
Q0UgPSB0YWxsb2MtJChMSUJUQUxMT0NfVkVSU0lPTikudGFyLmd6Cj4gIExJQlRBTExPQ19TSVRF
ID0gaHR0cHM6Ly93d3cuc2FtYmEub3JnL2Z0cC90YWxsb2MKPiAgTElCVEFMTE9DX0xJQ0VOU0Ug
PSBMR1BMLTMuMCsKPiBAQCAtNDAsNiArNDAsOSBAQCBlbHNlCj4gIExJQlRBTExPQ19DT05GX09Q
VFMgKz0gLS1kaXNhYmxlLXB5dGhvbgo+ICBlbmRpZgo+ICAKPiArTElCVEFMTE9DX0NPTkZfRU5W
ICs9IFBZVEhPTkhBU0hTRUVEPTEKPiArTElCVEFMTE9DX01BS0VfRU5WICs9IFBZVEhPTkhBU0hT
RUVEPTEKClRoaXMgbG9va3Mgc3VzcGljaW91cy4uLiBQWVRIT05IQVNIU0VFRD0xIHdhcyBhZGRl
ZCB1cHN0cmVhbSB3aXRob3V0IGV4cGxhbmF0aW9uCmJ5IHRoaXMgY29tbWl0IFsxXSBiZWZvcmUg
bGlidGFsbG9jIDIuMy4wLgoKQWJvdXQgUFlUSE9OSEFTSFNFRUQgWzJdLgoKV2h5IGl0J3Mgbm93
IG5lZWRlZD8gSGF2ZSB5b3UgdHJpZWQgd2l0aG91dCBpdD8KClsxXQpodHRwczovL3NhbHNhLmRl
Ymlhbi5vcmcvc2FtYmEtdGVhbS90YWxsb2MvLS9jb21taXQvYWZiNGUyMmM0Y2JjMTViNmI2Y2Y4
MjQyNzRiNjUzZWFhYWZlNGNjNQoKWzJdIGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMvdXNpbmcv
Y21kbGluZS5odG1sI2VudnZhci1QWVRIT05IQVNIU0VFRAoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+ICsKPiAgTElCVEFMTE9DX1dBRiA9IC4vYnVpbGR0b29scy9iaW4vd2FmCj4gIAo+ICAjIGxp
a2Ugc2FtYmE0LCBsaWJ0YWxsb2MgdXNlcyB0aGUgd2FmIGJ1aWxkIHN5c3RlbSB3aGljaCByZXF1
aXJlcyBhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
