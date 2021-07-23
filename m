Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBECC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:57:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3DD60720
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE3DD60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4CB405D6;
	Fri, 23 Jul 2021 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0W3eXP2Jn0U; Fri, 23 Jul 2021 20:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A989840605;
	Fri, 23 Jul 2021 20:57:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20F4F1BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D8B082C2E
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9Um5VSwPQkX for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:57:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F4E82B51
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:57:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id j2so2413680edp.11
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0LDu2fsJp+xU7FOmR64reTkBHp67wiBoNWPYaHOkkj4=;
 b=L7SalIrdWWzINsw2mjfLPi0pMqI9rZPDQoglwjQvCAryU5ms9FCHflrF/wT9W3PfdK
 ANCM0CcIAEN0UrElWyQD+4I36pVZlndPMM3/mw6iy1uyAAWFT3enM08bMyj1Lmo8zVYA
 I15lilDlKxdeg82zY53/0Te+R+dmTSFVt9lUeVICPiFHjKh4q89Cr36Gam57p+R5iF5t
 6xjVkPNpSO80YJb4KvsWNHBRireOqJEnjm1Su3+3wPkO6AQy8BaJOUx3Rt7ACm1HVKIV
 UvCeOa+c0W4X6MUdeBJSR/sO6dWVh4ypr15tbbvIoR2gYwgchnqLkosfp1xqRdyHgpyN
 MZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0LDu2fsJp+xU7FOmR64reTkBHp67wiBoNWPYaHOkkj4=;
 b=paIddp85Nc4OjGyjolB/wFxoNFesGh6h8Ll0eY3Y4MVma8+R6BFKqf5YZGmhBvRBp1
 qRqzGSu+NRE/756H0q52mNjNUxJ4qb0NO4KZFhh9GtCJFhUQ+ukPFz+uLawv6lFPEI7Z
 FNR+apAmO+1jTp428M/oVNp8WjID+SaXhyZeD1ek9g/9NqAGAU4uyTeNmt6SQGb4pfLd
 Py6CRzMqZKMSWdCWrQ55UZs7UPrM2LBHV5Bh+UBzeXOiDcpvvmS75Ma5iZxoutQZNaGF
 3tVl2bzO72xKQXVD72Zp39VE/2H/8LAGIR+6KlMXh6+BVWQsd72xw6Davhr3FRyvIPTN
 9BQg==
X-Gm-Message-State: AOAM531IMgc//8qQFupRprThJp9jiyKZtlSIxz507zYkLu9INo7HcMGA
 3/urBN8QzCJMZDcX2pwU4sRdOQlFx2aBLmnR
X-Google-Smtp-Source: ABdhPJzAiL8OzCAYA9/wRlWanpItMdFubsz/E3J30tnA3vHBc92qYBOUyl7uStgUExQuj/AgdbQe1Q==
X-Received: by 2002:a05:6402:4c5:: with SMTP id
 n5mr7694426edw.322.1627073845354; 
 Fri, 23 Jul 2021 13:57:25 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g8sm15110644eds.25.2021.07.23.13.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 13:57:24 -0700 (PDT)
To: Patricia Holden <pholden@nklabs.com>, Baruch Siach <baruch@tkos.co.il>
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
 <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
 <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
 <CAJ6EmCeHd-7Xv0WSt+gLn31viKP2giaXzHKOt0=Z+7zWN8eGpA@mail.gmail.com>
 <CAJ6EmCfnhev8MLO7JNx3d8trX7uEn+DgkdWZHKguyW8kG92ZhQ@mail.gmail.com>
 <87a6mdzok1.fsf@tarshish>
 <CAJ6EmCf_yXKmbTu9UtbmzcUb6ihG3aAaoWn-asU8pgyAhMgzWg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <be19857f-11b3-0d21-1f2f-bf5393ea25df@mind.be>
Date: Fri, 23 Jul 2021 22:57:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAJ6EmCf_yXKmbTu9UtbmzcUb6ihG3aAaoWn-asU8pgyAhMgzWg@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] Question about pkg-config pc files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyMy8wNy8yMDIxIDIwOjUyLCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gSSBoYXZlIGEg
VEkgc3BlY2lmaWMga2VybmVsLCBJIGdvdCBpdCBkaXJlY3RseSBmcm9tIGEgVEkgU0RLLsKgIMKg
VGhlIGNvbW1lbnRzIGluCj4gdGktc2d4LWttIENvbmZpZy5pbiBzYXlzIHRvIHVzZSB0aS1zZ3gs
IGhvd2V2ZXIsIHRoZXJlIGlzIG5vIGNob2ljZSBpbiBwYWNrYWdlcwo+IGZvciB0aS1zZ3guwqAg
SSBjYW4gb25seSBjaG9vc2UgInRpLXNneC1rbSIgb3IgInRpLWdmeCIuwqAgSSBndWVzcyBJIGNh
biBwdWxsCj4gdGktc2d4ICYgY3JlYXRlIHBhY2thZ2UgZm9yIGl0LsKgIFVubGVzcyBzb21lb25l
IGVsc2UgaGFzIGEgYmV0dGVyIHN1Z2dlc3Rpb24uCgogdGktc2d4IGNvbnNpc3RzIG9mIHR3byBz
ZXBhcmF0ZSBwYWNrYWdlczogdGktc2d4LWttIHdoaWNoIGlzIHRoZSBrZXJuZWwgbW9kdWxlLAph
bmQgdGktc2d4LXVtIHdoaWNoIGlzIHRoZSB1c2Vyc3BhY2UgbGlicmFyeS4KCj4gCj4gT24gVGh1
LCBKdWwgMjIsIDIwMjEgYXQgMTE6MzkgUE0gQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5p
bAo+IDxtYWlsdG86YmFydWNoQHRrb3MuY28uaWw+PiB3cm90ZToKPiAKPiAgICAgSGkgUGF0cmlj
aWEsCj4gCj4gICAgIE9uIEZyaSwgSnVsIDIzIDIwMjEsIFBhdHJpY2lhIEhvbGRlbiB3cm90ZToK
PiAgICAgPiBJIHN3aXRjaGVkIGZyb20gdGktZ2Z4IHRvIHRpLXNneCwgbm93IEkgZ2V0IGFub3Ro
ZXIgZXJyb3I6Cj4gICAgID4KPiAgICAgPgo+ICAgICAvaG9tZS9wYXRyaWNhaG9sZGVuL3dpbGxp
YW1zb24vYnVpbGQwNzA2MjAyMS9Qcm8zLUxpbnV4L2J1aWxkcm9vdC0yMDIwLjAyL291dHB1dC9i
dWlsZC90aS1zZ3gta20tNDUxOWVkM2I4M2QxZDcyMjA3ZGRjMjg3NGM3ZWI1ZTVhN2YyMGQ4ZC9l
dXJhc2lhX2ttL2V1cmFzaWFjb24vYmluYXJ5X29tYXBfbGludXhfeG9yZ19yZWxlYXNlL3Rhcmdl
dF9hcm1oZi9rYnVpbGQvc2VydmljZXM0L3NydmttL2Vudi9saW51eC9tbS5jOjY5OjEwOgo+ICAg
ICA+IGZhdGFsIGVycm9yOiBsaW51eC9kbWEtZGlyZWN0Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKPiAgICAgPsKgIMKgIDY5IHwgI2luY2x1ZGUgPGxpbnV4L2RtYS1kaXJlY3QuaD4KPiAg
ICAgPsKgIMKgIMKgIMKgfMKgIMKgIMKgIMKgIMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAg
ID4KPiAgICAgPgo+ICAgICA+IEkgY2hlY2tlZCBsaW51eC1oZWFkZXJzIGFuZCBvbmx5IHNlZSAi
aW5jbHVkZS9saW51eC9kbWEtZGlyZWN0aW9uLmgiLCBubwo+ICAgICA+ICJpbmNsdWRlL2xpbnV4
L2RtYS1kaXJlY3QuaCIuCj4gCj4gICAgIFRoZSBsaW51eC1oZWFkZXJzIHBhY2thZ2UgaXMgZm9y
IHVzZXJzcGFjZSBBUEkgKHVhcGkpIGhlYWRlcnMgdGhhdCBhcmUKPiAgICAgcGFydCBvZiB0aGUg
dG9vbGNoYWluLiBkbWEtZGlyZWN0aW9uLmggaXMgZm9yIGtlcm5lbCBjb2RlLiBUaGUgJ2tidWls
ZCcKPiAgICAgcGFydCBpbiB0aGUgcGF0aCBhYm92ZSBpbmRpY2F0ZXMgdGhhdCB5b3UgYXJlIGJ1
aWxkaW5nIGEga2VybmVsIG1vZHVsZS4KPiAKPiAgICAgbGludXgvZG1hLWRpcmVjdC5oIHdhcyBp
bnRyb2R1Y2VkIGluIGtlcm5lbCB2ZXJzaW9uIDQuMTYgKGNvbW1pdAo+ICAgICBlYThjNjRhY2U4
NjYpLiBCdXQgdGktc2d4LWttIGNvbW1pdCBjZjdmNDhjYjMwYSBwcmVkYXRlcyB0aGlzIGtlcm5l
bCBieQo+ICAgICBmZXcgeWVhcnMuIFNvIHRoaXMgaXQgcHJvYmFibHkgYSBUSSBrZXJuZWwgdGhh
dCBjYXJyaWVzIHRoZSBoZWFkZXIuCgogTW9yZSBwcmVjaXNlbHksIHRoZSBjdXJyZW50IEJ1aWxk
cm9vdCBtYXN0ZXIgdmVyc2lvbiBjb3JyZXNwb25kcyB0byBUSSBTREsKMDYuMDEuMDAuMDgsIHNv
IHlvdSdsbCBwcm9iYWJseSBuZWVkIGEga2VybmVsIGZyb20gdGhlIHNhbWUgU0RLIHZlcnNpb24u
CgogUmVnYXJkcywKIEFybm91dAoKPiAKPiAgICAgVGhlIEJSMl9QQUNLQUdFX1RJX1NHWF9LTSBo
ZWxwIHRleHQgc2F5cyB0aGlzOgo+IAo+ICAgICDCoCDCoCDCoCDCoCDCoCBOb3RlOiBpdCBuZWVk
cyBhIFRJIHNwZWNpZmljIGtlcm5lbCB0byBidWlsZCBwcm9wZXJseS4KPiAKPiAgICAgYmFydWNo
Cj4gCj4gICAgID4gTm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgc2FtZSBmaWxlIHRoaXMgcGFja2Fn
ZSBpcyBsb29raW5nIGZvciwgYnV0IGp1c3QKPiAgICAgPiByZW5hbWVkLsKgIExvb2tpbmcgdGhy
b3VnaCBjb25maWcgZm9yIHRoZSBrZXJuZWwgdG8gc2VlIGlmIEkgbWlzc2VkCj4gICAgID4gc29t
ZXRoaW5nLgo+IAo+ICAgICAtLSAKPiAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB+LiAufsKg
IMKgVGsgT3BlbiBTeXN0ZW1zCj4gICAgID19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQo+ICAgICDCoCDCoC0g
YmFydWNoQHRrb3MuY28uaWwgPG1haWx0bzpiYXJ1Y2hAdGtvcy5jby5pbD4gLSB0ZWw6ICs5NzIu
NTIuMzY4LjQ2NTYsCj4gICAgIGh0dHA6Ly93d3cudGtvcy5jby5pbCA8aHR0cDovL3d3dy50a29z
LmNvLmlsPiAtCj4gCj4gCj4gCj4gLS0gCj4gUGF0cmljaWEgQS4gSG9sZGVuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
