Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E394C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9BA561268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9BA561268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32A040461;
	Sun, 19 Sep 2021 12:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tz7OWJqjGU2H; Sun, 19 Sep 2021 12:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25A340467;
	Sun, 19 Sep 2021 12:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC2AB1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7DCD40467
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqRFisTDsVOh for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A222840461
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:30:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v22so45118581edd.11
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rwMuoqxstyorDXP7nOQawc4BxeS+tQtPe2sIHlrjeNU=;
 b=RMJ5iSfJf6Ivb1Qcwc6dwW22WqmJiRy/KeFp1TYH2iliCZww0JNrwo0SaJABkxQLe7
 bKnbMp1J100I+4XKYTOjJDxJCWIg+KOiV1WPWCZdExE+J0SPOi4JUyuB1HH99HzfrpNq
 eE+Qw0o37bpuJZxqz1s28sc+QRNoLAlfBpgmIoUZSfy/ps0KvJGdrZbovJ46NWc6YBTM
 XTabTn/VkJa087mdoUQ7qGoZau/d6TCmqKyZw2GJ14SXDy6mwIqqXSla/zCN2QuQYIUV
 kn0bNHuJnsFgNO8PpcfzLDkLvksxZfARJL6x4HZDFRdxcID4e5fyDpMNLaH5wWCPIe+7
 0B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rwMuoqxstyorDXP7nOQawc4BxeS+tQtPe2sIHlrjeNU=;
 b=aK0WgkR84UoIHo2HT1nH9OUapJcJt4h1GAM6eu+JHmzhueqCSiWLESd3nACN2tdIOj
 kaqMAUJqPIhWP7Mo523j9x17vREx6dv6p7m/ZGFO4HxRyp/bFH2hrPx8st2n9bXKMVHq
 VEVnVVtixAHK3Y6LlIcjE5nMSj80dUHRQBkPp9WAwiHeA/gBrBn+dh/m4B8+jBEm/S/8
 1VaSl+QbtUJyS2oMQ6wNUUQnw1pRH0mM36kCMenYmJFgDPZ2k+J/CPAiOXB2DD09X8kQ
 HSTpG6Ovi3pKBNivKdjkBrG5fWj9znG1GWPEUfM5wug6mbE/wypIh9nPYt2kVfIuggKp
 yKNA==
X-Gm-Message-State: AOAM533ljp/hOq/Mm8AXAuqP8VJv+wUFFbwSAr7faz9oXXu/sWQ+5/cH
 hVTZqPOIlS8TOmwvoE/R/PiKkowaSr2cPw==
X-Google-Smtp-Source: ABdhPJzI+Am0wCzY1PJWdC9JSDxW2wODY3aZ5RCZwiQ38gHma40gElPkbhrDpngXPhbT70pCiNeM7Q==
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr22508288ejc.494.1632054635603; 
 Sun, 19 Sep 2021 05:30:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z8sm4899576ejd.94.2021.09.19.05.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:30:35 -0700 (PDT)
Message-ID: <31476cb1-9102-0f62-c2f7-21231e2681e3@mind.be>
Date: Sun, 19 Sep 2021 14:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20210907120750.31432-1-raphael.melotte@mind.be>
 <20210907120750.31432-2-raphael.melotte@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210907120750.31432-2-raphael.melotte@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 building on mips with GCC10
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAwNy8wOS8yMDIxIDE0OjA3LCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBQb3J0IHRo
ZSBmb2xsb3dpbmcgdXBzdHJlYW0gY29tbWl0Ogo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy94b3JnL3hzZXJ2ZXIvLS9tZXJnZV9yZXF1ZXN0cy81OTEvZGlmZnM/Y29tbWl0X2lkPTAx
NDhhMTVkYTE2MTZhODY4ZDcxYWJlMWI1NmUzZjI4Y2M3OTUzM2MKPiAKPiBUaGlzIGZpeGVzIHRo
ZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Igb24gbWlwcyB3aXRoIEdDQzEwOgo+ICAgIENDTEQgICAg
IGxpYmludDEwLmxhCj4gYnVpbGRyb290L291dHB1dC9ob3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVp
bGRyb290LWxpbnV4LWdudS8xMC4zLjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxp
bnV4LWdudS9iaW4vbGQ6IC5saWJzL2hlbHBlcl9tZW0ubzooLmJzcysweDApOiBtdWx0aXBsZSBk
ZWZpbml0aW9uIG9mIGBJT1BvcnRCYXNlJzsgLmxpYnMvaGVscGVyX2V4ZWMubzooLmJzcysweDAp
OiBmaXJzdCBkZWZpbmVkIGhlcmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0
ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgLi4uLWRlZmluZS1pbmItb3V0Yi1hbmQt
ZnJpZW5kcy1vbi1taXBzLnBhdGNoIHwgNzMgKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3gxMXI3L3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIvMDAwNi1jb21waWxlci5oLWRvbi10LWRlZmluZS1p
bmItb3V0Yi1hbmQtZnJpZW5kcy1vbi1taXBzLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UveDExcjcveHNlcnZlcl94b3JnLXNlcnZlci8wMDA2LWNvbXBpbGVyLmgtZG9uLXQtZGVmaW5l
LWluYi1vdXRiLWFuZC1mcmllbmRzLW9uLW1pcHMucGF0Y2ggYi9wYWNrYWdlL3gxMXI3L3hzZXJ2
ZXJfeG9yZy1zZXJ2ZXIvMDAwNi1jb21waWxlci5oLWRvbi10LWRlZmluZS1pbmItb3V0Yi1hbmQt
ZnJpZW5kcy1vbi1taXBzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi40NjljYTdlM2ZjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UveDExcjcv
eHNlcnZlcl94b3JnLXNlcnZlci8wMDA2LWNvbXBpbGVyLmgtZG9uLXQtZGVmaW5lLWluYi1vdXRi
LWFuZC1mcmllbmRzLW9uLW1pcHMucGF0Y2gKPiBAQCAtMCwwICsxLDczIEBACj4gK0Zyb20gZGU1
ZTI0YjUwMzZhMWE1YTg3N2Y4ZjMwMTY5ZTM0OTdkMGUyOTZkNiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKPiArRnJvbTogSnVsaWVuIENyaXN0YXUgPGpjcmlzdGF1QGRlYmlhbi5vcmc+Cj4gK0Rh
dGU6IFdlZCwgNiBKYW4gMjAyMSAxMDoyMDo1MyArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGNv
bXBpbGVyLmg6IGRvbid0IGRlZmluZSBpbmIvb3V0YiBhbmQgZnJpZW5kcyBvbiBtaXBzCj4gK01J
TUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYt
OAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtUaGUgZGVmaW5pdGlv
biByZWxpZXMgb24gSU9Qb3J0QmFzZSwgd2hpY2ggaXMgb25seSBldmVyIHNldCBpbgo+ICtody94
ZnJlZTg2L29zLXN1cHBvcnQvYnNkL2FybV92aWRlby5jCj4gKwo+ICtUaGlzIGNhdXNlZCBidWls
ZCBmYWlsdXJlcyBvbiBsaW51eC9taXBzIHdpdGggR0NDIDEwLCBkdWUgdG8gdGhpcwo+ICtjaGFu
Z2UgKGZyb20gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTAvY2hhbmdlcy5odG1sI2MpOgo+ICsK
PiArIkdDQyBub3cgZGVmYXVsdHMgdG8gLWZuby1jb21tb24uIEFzIGEgcmVzdWx0LCBnbG9iYWwg
dmFyaWFibGUgYWNjZXNzZXMKPiArYXJlIG1vcmUgZWZmaWNpZW50IG9uIHZhcmlvdXMgdGFyZ2V0
cy4gSW4gQywgZ2xvYmFsIHZhcmlhYmxlcyB3aXRoCj4gK211bHRpcGxlIHRlbnRhdGl2ZSBkZWZp
bml0aW9ucyBub3cgcmVzdWx0IGluIGxpbmtlciBlcnJvcnMuIFdpdGgKPiArLWZjb21tb24gc3Vj
aCBkZWZpbml0aW9ucyBhcmUgc2lsZW50bHkgbWVyZ2VkIGR1cmluZyBsaW5raW5nLiIKPiArCj4g
K0FzIGEgcmVzdWx0IGFueXRoaW5nIGluY2x1ZGluZyBjb21waWxlci5oIHdvdWxkIGdldCBpdHMg
b3duIGRlZmluaXRpb24KPiArb2YgSU9Qb3J0QmFzZSBhbmQgdGhlIGxpbmtlciB3b3VsZCBlcnJv
ciBvdXQuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5t
ZWxvdHRlQG1pbmQuYmU+Cj4gKy0tLQo+ICsgaHcveGZyZWU4Ni9jb21tb24vY29tcGlsZXIuaCAg
ICAgICAgICB8IDggKystLS0tLS0KPiArIGh3L3hmcmVlODYvb3Mtc3VwcG9ydC9ic2QvYXJtX3Zp
ZGVvLmMgfCAzICsrKwo+ICsgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvaHcveGZyZWU4Ni9jb21tb24vY29tcGlsZXIu
aCBiL2h3L3hmcmVlODYvY29tbW9uL2NvbXBpbGVyLmgKPiAraW5kZXggMmIyMDA4YjNmLi5lYjc4
OGQzZmQgMTAwNjQ0Cj4gKy0tLSBhL2h3L3hmcmVlODYvY29tbW9uL2NvbXBpbGVyLmgKPiArKysr
IGIvaHcveGZyZWU4Ni9jb21tb24vY29tcGlsZXIuaAo+ICtAQCAtNTE4LDE0ICs1MTgsMTAgQEAg
eGY4NldyaXRlTW1pbzMyTGUoX192b2xhdGlsZV9fIHZvaWQgKmJhc2UsIGNvbnN0IHVuc2lnbmVk
IGxvbmcgb2Zmc2V0LAo+ICsgICAgIGJhcnJpZXIoKTsKPiArIH0KPiArCj4gKy0jZWxpZiBkZWZp
bmVkKF9fbWlwc19fKSB8fCAoZGVmaW5lZChfX2FybTMyX18pICYmICFkZWZpbmVkKF9fbGludXhf
XykpCj4gKy0jaWYgZGVmaW5lZChfX2FybTMyX18pIHx8IGRlZmluZWQoX19taXBzNjQpCj4gKysj
ZWxpZiBkZWZpbmVkKF9fYXJtMzJfXykgJiYgIWRlZmluZWQoX19saW51eF9fKQo+ICsgI2RlZmlu
ZSBQT1JUX1NJWkUgbG9uZwo+ICstI2Vsc2UKPiArLSNkZWZpbmUgUE9SVF9TSVpFIHNob3J0Cj4g
Ky0jZW5kaWYKPiArCj4gKy1fWF9FWFBPUlQgdW5zaWduZWQgaW50IElPUG9ydEJhc2U7ICAgICAg
LyogTWVtb3J5IG1hcHBlZCBJL08gcG9ydCBhcmVhICovCj4gKytleHRlcm4gX1hfRVhQT1JUIHVu
c2lnbmVkIGludCBJT1BvcnRCYXNlOyAgICAgIC8qIE1lbW9yeSBtYXBwZWQgSS9PIHBvcnQgYXJl
YSAqLwo+ICsKPiArIHN0YXRpYyBfX2lubGluZV9fIHZvaWQKPiArIG91dGIodW5zaWduZWQgUE9S
VF9TSVpFIHBvcnQsIHVuc2lnbmVkIGNoYXIgdmFsKQo+ICtkaWZmIC0tZ2l0IGEvaHcveGZyZWU4
Ni9vcy1zdXBwb3J0L2JzZC9hcm1fdmlkZW8uYyBiL2h3L3hmcmVlODYvb3Mtc3VwcG9ydC9ic2Qv
YXJtX3ZpZGVvLmMKPiAraW5kZXggZGQxMDIwZTMzLi4xODBkNzA1NDMgMTAwNjQ0Cj4gKy0tLSBh
L2h3L3hmcmVlODYvb3Mtc3VwcG9ydC9ic2QvYXJtX3ZpZGVvLmMKPiArKysrIGIvaHcveGZyZWU4
Ni9vcy1zdXBwb3J0L2JzZC9hcm1fdmlkZW8uYwo+ICtAQCAtNjUsNiArNjUsNyBAQAo+ICsgI2lu
Y2x1ZGUgInhmODZQcml2LmgiCj4gKyAjaW5jbHVkZSAieGY4Nl9PU2xpYi5oIgo+ICsgI2luY2x1
ZGUgInhmODZPU3ByaXYuaCIKPiArKyNpbmNsdWRlICJjb21waWxlci5oIgo+ICsKPiArICNpZiBk
ZWZpbmVkKF9fTmV0QlNEX18pICYmICFkZWZpbmVkKE1BUF9GSUxFKQo+ICsgI2RlZmluZSBNQVBf
RkxBR1MgTUFQX1NIQVJFRAo+ICtAQCAtMTYyLDYgKzE2Myw4IEBAIHhmODZEaXNhYmxlSU8oKQo+
ICsKPiArICNpZiBkZWZpbmVkKFVTRV9BUkNfTU1BUCkgfHwgZGVmaW5lZChfX2FybTMyX18pCj4g
Kwo+ICsrdW5zaWduZWQgaW50IElPUG9ydEJhc2U7Cj4gKysKPiArIEJvb2wKPiArIHhmODZFbmFi
bGVJTygpCj4gKyB7Cj4gKy0tCj4gKzIuMzIuMAo+ICsKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
