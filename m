Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C825CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF43D41B68;
	Thu,  7 Apr 2022 16:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-yESUFodJTf; Thu,  7 Apr 2022 16:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A596941B64;
	Thu,  7 Apr 2022 16:40:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 089011BF312
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 16:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC1AE84089
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 16:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7egaVxgAqEpw for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 16:39:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91D3E84016
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 16:39:58 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p15so12039393ejc.7
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2cvbDJKdxWYW8bqZgA4tApVbXzavFxOQqpBFE1HFUUE=;
 b=AiMJZC5pWkabHxISY6UmQpychVFI5WDnnwsY7PzUde86uKVo9nrSDfy6hvRNx9rK8i
 SYv86ngWA2VoF0NYubKHb5aFgkMqrxblzHKROKQQTmKoZlaqMYcc3kIKhCMS/jbD4Ol5
 c9VTKLm3vwVbmKATm/kzsWOqbhG9P59RncryiwVqNSYliCrXjH5xo+0p4DFsb1JNcli9
 /AI/EoA+nWigH7ejF9GkiklOjp4RLxAbS6GPRVtQskWO+Ooh5syZ1mJu4elXkUDKP5md
 ajBaYlXQSYuqxQBNnJff0QM+rLwUneONmYPFBRyfH7DMQGiea68Qj/8kSQrD5Yx1RLYm
 7HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2cvbDJKdxWYW8bqZgA4tApVbXzavFxOQqpBFE1HFUUE=;
 b=KTx0VN9C/Lvt7FFgH1rJQCwDtra5xRyj7BbhSac40/k1nM9iNvgIqVGx7b6PZjtjbG
 BuuWbeUJ0usAmJwtkzGIOhZDX7oKt4dsghXlEVTcClq/6JEh7BvGUfC5t7UEw8rk6P7b
 kpqslES/Tk9+SjGJo5OV8dhDPT7ylS8Z6d3gwPEJDgjL0UIK76qJw0r8XFu4zJNFLG7s
 LbZuAZ3RJsmUXPk2xEfJsCWlt9sEf5aPsxoeq0++sYlLTFBwKjFqSh4LLYuqmnr6YQDi
 hv6f3pwSctafQkT4GzmKgGifkKIADIlNs0rXvRoF8qtHKOnbPjeMvzws5NxLiGCUIwW7
 dT7w==
X-Gm-Message-State: AOAM530eh7LyDxHrC8jXmTgbv2Yy2LmM0k3LFLzfzZsI+vSjuYe7iBsQ
 1D/vu+qLGmAcwDy/YVxuDHEfLvzk03nTPg==
X-Google-Smtp-Source: ABdhPJySyMNt1C6PbxTea6wPhheTE5r7xKA1vZLjzexX1w4qQ6CZaRQ8JCq9o58Lr9WGRveFU9WsrQ==
X-Received: by 2002:a17:906:c08a:b0:6ce:36f8:bfe8 with SMTP id
 f10-20020a170906c08a00b006ce36f8bfe8mr14124559ejz.52.1649349596346; 
 Thu, 07 Apr 2022 09:39:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a50e68b000000b00412ec8b2180sm9365028edm.90.2022.04.07.09.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 09:39:55 -0700 (PDT)
Message-ID: <06e4e2da-419c-5c33-b086-ad07263e14a4@mind.be>
Date: Thu, 7 Apr 2022 18:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: buildroot@buildroot.org, Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Vincent Stehle <vincent.stehle@laposte.net>
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
 <40cedffc-e46e-e4d5-e2f3-c0dd398906cd@mind.be>
 <YktJLL+SywDe7TYm@romuald.bergerie>
 <2646beec-15db-f2e9-5490-0f7fd551857f@mind.be>
 <Yk3xbfOrlY4N86C3@romuald.bergerie>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <Yk3xbfOrlY4N86C3@romuald.bergerie>
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
 minimal config
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNC8yMDIyIDIyOjAwLCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gT24gTW9uLCBB
cHIgMDQsIDIwMjIgYXQgMTA6Mjg6MTJQTSArMDIwMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6Cj4gLi4KPj4gICBCdXQgdGhhdCBhY3R1YWxseSBjYXVzZXMgYSBwcm9ibGVtOiBpZiB1ZGhj
cGMgZG9lc24ndCBrZWVwIHJ1bm5pbmcgdGhlCj4+IGJhY2tncm91bmQgYW55IG1vcmUsIGl0J3Mg
bm90IGdvaW5nIHRvIHJlZnJlc2ggaXRzIGxlYXNlLCBidXQgd2lsbCBrZWVwIG9uCj4+IHVzaW5n
IGl0cyBJUCBhZGRyZXNzIGluZGVmaW5pdGVseS4gQWx0aG91Z2ggdGhpcyBzZWVtcyB0byB3b3Jr
IGF0IGZpcnN0Cj4+IGhhbmQsIGl0J3MgZ29pbmcgdG8gY2F1c2Ugc29tZSBwcm9ibGVtIHNvbWV3
aGVyZSBkb3duIHRoZSBsaW5lLi4uCj4gCj4gSGkgQXJub3V0LAo+IAo+IEFmdGVyIHlvdXIgY29t
bWVudCBhdCBmaXJzdCBJIHRob3VnaHQgYWxsIHRoZSBuby1NTVUgYnVpbGRyb290IGRlZmNvbmZp
Z3Mgd2VyZQo+IHN1YnRseSBicm9rZW4gOi1TCj4gCj4gSSBkaWQgc29tZSBpbnZlc3RpZ2F0aW9u
cyBhbmQgbm93IG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB1ZGhjcGMgZG9lcyBpbmRlZWQKPiBk
YWVtb25pemUgYnkgZGVmYXVsdCBpbiB0aGUgbm8tTU1VIGNhc2UuIFNlZSBbMV06Cj4gCj4gICAg
I2lmICFCQl9NTVUKPiAgICAJLyogb24gTk9NTVUgcmVleGVjIChpLmUuLCBiYWNrZ3JvdW5kKSBl
YXJseSAqLwo+ICAgIAlpZiAoIShvcHQgJiBPUFRfZikpIHsKPiAgICAJCWJiX2RhZW1vbml6ZV9v
cl9yZXhlYygwIC8qIGZsYWdzICovLCBhcmd2KTsKPiAgICAJCWxvZ21vZGUgPSBMT0dNT0RFX05P
TkU7Cj4gICAgCX0KPiAgICAjZW5kaWYKPiAKPiBUaGF0IGJlaGF2aW91ciB3YXMgYWRkZWQgaW4g
YnVzeWJveCB1ZGhjcGMgd2hpbGUgcmVtb3ZpbmcgdGhlIC1iIG9wdGlvbiAoaW4KPiBjb21taXQg
WzJdKS4KPiAKPiBBbHNvLCB0aGlzIGlzIGNvbmZpcm1lZCBvbiBxZW11IHdoZXJlIHdlIGNhbiBz
ZWUgdGhlIHVkaGNwYyBwcm9jZXNzIHJ1bm5pbmcgaW4KPiB0aGUgYmFja2dyb3VuZDoKPiAKPiAg
ICB+ICMgcHMKPiAgICAgIFBJRCBVU0VSICAgICAgIFZTWiBTVEFUIENPTU1BTkQKPiAgICAgICAg
MSByb290ICAgICAgIDYxNiBTICAgIGluaXQKPiAgICAuLi4KPiAgICAgICA2MiByb290ICAgICAg
IDYxMiBTICAgIHVkaGNwYyAtUiAtcCAvdmFyL3J1bi91ZGhjcGMuZXRoMC5waWQgLWkgZXRoMCAt
eCBob3MKPiAKPj4gICBTbyB3ZSBzaG91bGQgZmluZCBhIGRpZmZlcmVudCBzb2x1dGlvbiwgYW5k
IHdlIHNob3VsZCBwcm9iYWJseSB1c2UgdGhhdCBpbgo+PiB0aGUgTU1VIGNhc2UgYXMgd2VsbCAo
anVzdCB0byBrZWVwIHRoaW5ncyBjb25zaXN0ZW50Lgo+IAo+IE5vdyBJIHRoaW5rIHRoYXQgd2Ug
YXJlIHNhZmUuIFdoYXQgaXMgeW91ciBvcGluaW9uIG9uIHRoaXMsIHBsZWFzZT8KCiAgSSdsbCBh
ZGQgYSBzdW1tYXJ5IG9mIHRoaXMgZW50aXJlIGV4cGxhbmF0aW9uIGFuZCBjb21taXQgaXQuCgog
IFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+IAo+IFsx
XTogaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC90cmVlL25ldHdvcmtpbmcvdWRoY3Av
ZGhjcGMuYyNuMTM1Mgo+IFsyXTogaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC9jb21t
aXQvP2lkPTIxNzY1ZmEwNjM4MzA5MjNkMTM0MjZlYzY5ODljMTZkYTkyMTBlNDkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
