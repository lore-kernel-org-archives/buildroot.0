Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CBDC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F5660E61;
	Mon, 27 Jun 2022 20:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F5660E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8gfaW2C8jQv; Mon, 27 Jun 2022 20:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3247560D6E;
	Mon, 27 Jun 2022 20:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3247560D6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9E2C1BF57B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B7883FF2
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B7883FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgURkhtOvP21 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:53:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E606083FC5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E606083FC5
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:53:03 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ge10so21632578ejb.7
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 13:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+FeQHMuU6iE0870wVtDVkFUwsmEcxUPY/WUjwxQaaxc=;
 b=dhzBwosje/7ebUmTnz3yy6lgOA2jzEwcgB1Zx3EHmElCZWtCHnnmCf12lwzEGnEjBG
 z39CVCF46SlrgIVOJsZRE22gfBjWUeoS6YAX5M64Q0MUeQozIGHsbWdJd8qMEfQ+Ki/P
 2NyMgK/QKiMIWtV/ctjkkrjkfNnslqT8RIrkieXnjIrR0e2j5aQUedwIcPaWaYCiTY9T
 SHqqBqHfb61iqTKmkbrU2ZbbZZXAloFwHS/6tjHTgwMTlFouqvgRBLU9kkXbqe3s/9ED
 saUtvvzrktORItEoWvaRp/TA/SWUfiG461AZw2Dq5n7eAwVOLP5MKeccuqxW/J8PRC0X
 5LOA==
X-Gm-Message-State: AJIora8XTbT5HbQuC2MZKdi6Qq4hmuk9Z7ubDyMg4r7Mpg+p6eyPqucK
 3qBlf2NCo86NYrAqDuZD0RBcjA==
X-Google-Smtp-Source: AGRyM1ss+ZIrotLpzBYjJgxNZ1wJDEOv+uBTqgoH6p2jVjSy+vCO36osCc/tjqTfsScY3VuEjeicTg==
X-Received: by 2002:a17:906:c151:b0:726:95c0:85dc with SMTP id
 dp17-20020a170906c15100b0072695c085dcmr10458841ejc.118.1656363182152; 
 Mon, 27 Jun 2022 13:53:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 lc3-20020a170906f90300b00705976bcd01sm5403527ejb.206.2022.06.27.13.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 13:53:01 -0700 (PDT)
Message-ID: <ce3f0851-3a29-5d97-152b-b46c289b9139@mind.be>
Date: Mon, 27 Jun 2022 22:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220621203415.3601501-1-clg@kaod.org>
 <20220621203415.3601501-2-clg@kaod.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220621203415.3601501-2-clg@kaod.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+FeQHMuU6iE0870wVtDVkFUwsmEcxUPY/WUjwxQaaxc=;
 b=OAblWc7YxgU9k2DxD32DTXJsfNkN4AfZw2UbIaanojrNs9zVSmjpzWTru2yZu4mr/l
 bBWbgtQ6fb6tsAiRJoMo17WE9yF0+wkaeUuzvY1ewETPnFTaW+RkHq99ZP+mDgTo4x4H
 IhDRG4WtzHTBz48YIeKB/pQXgWTaNEhS8sfx8bX3o6WOFRjgkj/osI2cpCZDZhOMxOFr
 CjHXpdDxNWmMnlo8BKV4AFKRk4lRZCAqcF5CdUFbKXmllSl0Bk+b+tGBKEhKFjnonIxy
 6B5SrF72GAnUtq3KASCR8jCg7UkE1Zg3qBeJN+kNLgXFniDpYdpUO/KcEhv2fSQhA98y
 m/Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OAblWc7Y
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/aspeed_ast2500evb: new
 defconfig
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
Cc: chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMS8wNi8yMDIyIDIyOjM0LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPiBUaGUga2Vy
bmVsIGlzIGZyb20gdXBzdHJlYW0gd2l0aCBhIGZldyBleHRyYXMgdG8gcmVkdWNlIHRoZSBzaXpl
IG9mCj4gdGhlICdhc3BlZWRfZzUnIHpJbWFnZSBiZWNhdXNlIGl0IGlzIHRvbyBiaWcgZm9yIHRo
ZSBmbGFzaCBsYXlvdXQuCj4gTWFpbmxpbmUgVS1Cb290IGhhcyBlbm91Z2ggc3VwcG9ydCB0byBs
b2FkIHRoZSBrZXJuZWwgZnJvbSB0aGUgZmxhc2gKPiBkZXZpY2UgYW5kIGZyb20gbmV0d29yayBi
dXQgaXQgaXMgc3RpbGwgYmVoaW5kIHRoZSBPcGVuQk1DIGJyYW5jaAo+IHdoZXJlIG1vc3QgdGhl
IGRldmVsb3BtZW50IGlzIGRvbmUuCj4gCj4gVGhlIG1haW4gcmVzdWx0aW5nIGZpbGUgZnJvbSB0
aGUgYnVpbGQgaXMgYSBmbGFzaCBpbWFnZS4gVGhlIHBhcnRpdGlvbgo+IGxheW91dCBtYXRjaGVz
IHRoZSBPcGVuQk1DIG9uZSBmb3IgMzJNIGNoaXBzLiBJdCBtYWtlcyBpdCBlYXNpZXIgdG8KPiB1
cGRhdGUgdGhlIGRpZmZlcmVudCBwYXJ0aXRpb25zIGZyb20gTGludXguIEludGVybWVkaWF0ZSBm
aWxlcyBjYW4gYmUKPiB1c2VkIHRvIGJvb3QgZnJvbSBVLUJvb3Qgb3ZlciB0aGUgbmV0d29yayBv
ciB0byBib290IFFFTVUgdXNpbmcKPiAta2VybmVsLy1pbml0cmQvLWR0Yi4KPiAKPiBSZXZpZXdl
ZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiBTaWduZWQtb2ZmLWJ5OiBDw6lk
cmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKW3NuaXBdCj4gZGlmZiAtLWdpdCBhL2JvYXJk
L2FzcGVlZC9hc3QyNTAwLWV2Yi9saW51eC5mcmFnbWVudCBiL2JvYXJkL2FzcGVlZC9hc3QyNTAw
LWV2Yi9saW51eC5mcmFnbWVudAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4xY2VlOTVmODQyN2IKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvYXNwZWVk
L2FzdDI1MDAtZXZiL2xpbnV4LmZyYWdtZW50Cj4gQEAgLTAsMCArMSw3IEBACj4gK0NPTkZJR19L
RVJORUxfWFo9eQo+ICtDT05GSUdfQVJDSF9NVUxUSV9WNz1uCgogIE5vcm1hbGx5IHRoaXMgd291
bGQgYmUKCiMgQ09ORklHX0FSQ0hfTVVMVElfVjcgaXMgbm90IHNldAoKYnV0IHRoaXMgd29ya3Mg
YXMgd2VsbC4gSG93IGRpZCB5b3UgZ2VuZXJhdGUgdGhpcyBjb25maWc/IGRpZmZjb25maWc/Cgog
IEFueXdheSwgSSBhcHBsaWVkIGl0IGFzIGlzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiArQ09O
RklHX01BQ0hfQVNQRUVEX0c2PW4KPiArQ09ORklHX1NNUD1uCj4gK0NPTkZJR19FWFQ0X0ZTPW4K
PiArQ09ORklHX0RFQlVHX0ZTPW4KPiArQ09ORklHX1NVU1BFTkQ9bgpbc25pcF0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
