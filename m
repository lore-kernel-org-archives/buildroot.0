Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EEEC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E7F38177C;
	Wed, 27 Mar 2024 22:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Oz3UL-1lsqi; Wed, 27 Mar 2024 22:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 740BC819D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 740BC819D1;
	Wed, 27 Mar 2024 22:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB4D61BF33B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7EDA60BD2
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TJaxEClSUrH for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C34326065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34326065F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34326065F
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:05:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4149749cc36so2499205e9.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711577154; x=1712181954;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sy6/hgrqFfYd9SoIpFR7iazA3WbKKGcJyD3mVv+wdRI=;
 b=BSkUlfejpuiLYuO+Yl2Z38zxaaSfbz12Irwjb8DpaEJAGImd66aUCfgEWOWoie88Rt
 JP7mhZMk4GtbPCBWW2+UAWZgEVPHvbdwhT6aRHjJA9y+l4oS56gxNmt+YSuq3whwj4yO
 cZaGy/bZKJJFKDi7mTGaHb6gjeICLOeyLREd34JslmCwIkWYzZM38WA25zX9+3M2G009
 I2/4C3F7b4MMQfuHRMVEz396dTkdo4tmRFxnIsRIgTm/uMMGwKyXeyFru5Gkz+tT5KsW
 i7frJnkaoAMwts6FIjJXgg+Lu2MoI0FqqhFPZV4IujF0jruNZSCfCDXjus8APwOAlAhz
 COAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcml2eim29tPbsholjPkpqPRxgvuUwB8mFcPjzWhmutM9kgwfG+P+5No5drxVeiZHT0SSZCYmGMKJ5Qx729KpmYueud+CYWA==
X-Gm-Message-State: AOJu0YxQkBrvFD0LirBBmIieU3lQYlbvhbRXV3N5OGqesNkeeUSbXx+v
 d6t9patu+jrSZ8wssY9VigZuHhdKsnJ42odIbP1ADzVTE8SLrrpaK1tEbkp8vKlDeb5DfrmKbnR
 l
X-Google-Smtp-Source: AGHT+IGCIiyJT6HjRXr0OPiUx42LBzJudOXRaZGT0i4xDu/ua+t67322d22d0VSj1t/ec6gOdFAung==
X-Received: by 2002:a05:600c:19d3:b0:413:1ae3:8dd2 with SMTP id
 u19-20020a05600c19d300b004131ae38dd2mr951226wmq.37.1711577153834; 
 Wed, 27 Mar 2024 15:05:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ay34-20020a05600c1e2200b004149315600fsm3373017wmb.7.2024.03.27.15.05.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:05:53 -0700 (PDT)
Message-ID: <30e774b9-e87f-43d9-b4da-0688f8cce62e@mind.be>
Date: Wed, 27 Mar 2024 23:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Juan A. Rubio" <jarubio2001@gmail.com>, buildroot@buildroot.org
References: <CAE58QoO6hJKVEvrpzCOf5bxv7sUVUn4dYaq3tKHibMtYj1KwsA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAE58QoO6hJKVEvrpzCOf5bxv7sUVUn4dYaq3tKHibMtYj1KwsA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711577154; x=1712181954; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sy6/hgrqFfYd9SoIpFR7iazA3WbKKGcJyD3mVv+wdRI=;
 b=C0tO984GXESJ5RWTaUMMzf8gKTWqpDHnhnB/E3EH2Rq233gDchhFyWF6cX1EkQayn9
 EBPFDulcUTF7/bJjS225EHeZkPU6nElr6x/t6fMieDVrQO94wOFLOr0k7NAgudevfuds
 ZRgB1Ye+Mj8m1zQdWmOzR7GeOyW4FzSGW7UKm4BTPReOKlUBvl/FvhAxg2mibsLWssta
 B96qwpDwvZ0Ip/BxPC98T7ClxwQ+62+0ZGqQWrhhulJeF9SPd0+hZ4huvK9xW3fT+svM
 mtHi9xZCkkpFssqD632bVHGo3F4Xy1OuO7PayvCdypKAvftdMkGqIyEDiBUVF7YKY9jw
 B0AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C0tO984G
Subject: Re: [Buildroot] host-flutter-sdk-bin 3.16.8 errors related to Python
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wMy8yMDI0IDIwOjQ2LCBKdWFuIEEuIFJ1YmlvIHdyb3RlOgo+IEhpLAo+IAo+IEkn
bSB1c2luZyBCdWlsZHJvb3QgMjAyNC4wMi54IGJyYW5jaCBhbmQgSSBoYXZlIGZvdW5kIHRoaXMg
ZXJyb3I6Cj4gCj4gID4+PiBmbHV0dGVyLWVuZ2luZSAzLjE2LjggRG93bmxvYWRpbmcKPiBUcmFj
ZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gIMKgIEZpbGUgCj4gIi9ob21lL3ZhZ3Jh
bnQvd29yay9zdGFyZmlzaC9ic3Atb3V0cHV0L2hvc3Qvc2hhcmUvZGVwb3RfdG9vbHMvZ2NsaWVu
dC5weSIsIGxpbmUgCj4gMTA0LCBpbiA8bW9kdWxlPgo+ICDCoCDCoCBpbXBvcnQgZ2NsaWVudF9z
Y20KPiAgwqAgRmlsZSAKPiAiL2hvbWUvdmFncmFudC93b3JrL3N0YXJmaXNoL2JzcC1vdXRwdXQv
aG9zdC9zaGFyZS9kZXBvdF90b29scy9nY2xpZW50X3NjbS5weSIsIAo+IGxpbmUgMjIsIGluIDxt
b2R1bGU+Cj4gIMKgIMKgIGltcG9ydCBnZXJyaXRfdXRpbAo+ICDCoCBGaWxlIAo+ICIvaG9tZS92
YWdyYW50L3dvcmsvc3RhcmZpc2gvYnNwLW91dHB1dC9ob3N0L3NoYXJlL2RlcG90X3Rvb2xzL2dl
cnJpdF91dGlsLnB5IiwgCj4gbGluZSAxMiwgaW4gPG1vZHVsZT4KPiAgwqAgwqAgaW1wb3J0IGh0
dHBsaWIyCj4gIMKgIEZpbGUgCj4gIi9ob21lL3ZhZ3JhbnQvd29yay9zdGFyZmlzaC9ic3Atb3V0
cHV0L2hvc3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9odHRwbGliMi9fX2luaXRfXy5w
eSIsIGxpbmUgNDEsIGluIDxtb2R1bGU+Cj4gIMKgIMKgIGltcG9ydCBzc2wKPiAgwqAgRmlsZSAi
L2hvbWUvdmFncmFudC93b3JrL3N0YXJmaXNoL2JzcC1vdXRwdXQvaG9zdC9saWIvcHl0aG9uMy4x
MS9zc2wucHkiLCAKPiBsaW5lIDEwMCwgaW4gPG1vZHVsZT4KPiAgwqAgwqAgaW1wb3J0IF9zc2wg
wqAgwqAgwqAgwqAgwqAgwqAgIyBpZiB3ZSBjYW4ndCBpbXBvcnQgaXQsIGxldCB0aGUgZXJyb3Ig
cHJvcGFnYXRlCj4gIMKgIMKgIF5eXl5eXl5eXl5eCj4gTW9kdWxlTm90Rm91bmRFcnJvcjogTm8g
bW9kdWxlIG5hbWVkICdfc3NsJwo+IAo+IEFueSBpZGVhcyBvbiBob3cgdG8gcmVzb2x2ZSB0aGlz
PwoKICBEaWQgeW91IGRvIGEgY2xlYW4gcmVidWlsZD8gSSBkb24ndCBmaW5kIGV4YWN0bHkgd2hl
cmUsIGJ1dCBzb21ldGhpbmcgaW4gdGhlIApkZXBlbmRlbmN5IGNoYWluIGVuYWJsZXMgQlIyX1BB
Q0tBR0VfSE9TVF9QWVRIT04zX1NTTCwgYnV0IHlvdSBoYXZlIGEgCmhvc3QtcHl0aG9uMyB3aXRo
b3V0IHRoYXQgb3B0aW9uLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBUaGFua3MgaW4gYWR2
YW5jZSEKPiBKdWFuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
