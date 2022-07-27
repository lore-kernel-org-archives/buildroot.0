Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F91C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536C08198D;
	Wed, 27 Jul 2022 13:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 536C08198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCANc2cFpvrf; Wed, 27 Jul 2022 13:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2BF81D02;
	Wed, 27 Jul 2022 13:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2BF81D02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74D941BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BA67409FF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA67409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnDNjGq-YQvx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:16:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F89409DE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0F89409DE
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:16:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso1200057wma.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2k4U5ilCF1r6kxUMSdieFEj7CcrbaUcJ0TGr+lMWAv4=;
 b=zPg50wTyrPrxdpvZxZHcGZF/SC3WRQhQarmaQ9f6mdj450b7McideC+nNFEsdJE17f
 yGCf8VBEBOdbM05Rdtsa0pIkEukZ9la83uXiqXeufZO74G4iilgTaoALpHa57vBMt9BU
 PykIsfmqv68yo+XjUBd6DcpcELXdE+/vnGfP9BLUiCUioNJYF08EURFLyhYYymhuru7p
 EQsaNJO8voyW66uB23M3C7SjwtzUe5/3C0AOkTCrCZFdGAWd9ZfjHIM8xtXphwmrsHV/
 Dq9tYQIImwm+P1axDMqw+u4atREVgGXWfWFVq7G4zkDkE3zOxY5JKzBASYvGn4Oju9MI
 bkUg==
X-Gm-Message-State: AJIora9j/izoxGv6DPAyZpDNKXR7FepTo62jm/8EE+YfRV2/E29paFmU
 J0nWA96+9blCYRX8v/zXPJqUH0LBb7CSWQ==
X-Google-Smtp-Source: AGRyM1t+rWlgNWSGOdtNOdkX/RcJwetR9V65fNSr5qCE4kJYdoO/s4RCvBo9P5KGPG8JkMdmSKt4/A==
X-Received: by 2002:a05:600c:3d06:b0:3a3:58f6:9d96 with SMTP id
 bh6-20020a05600c3d0600b003a358f69d96mr3106103wmb.195.1658927794831; 
 Wed, 27 Jul 2022 06:16:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 f11-20020adfe90b000000b0021e43650e6asm17498992wrm.86.2022.07.27.06.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:16:34 -0700 (PDT)
Message-ID: <9abfda1c-d67b-7102-a78e-e17a06da90d5@smile.fr>
Date: Wed, 27 Jul 2022 15:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-8-ricardo.martincoski@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220724054912.2354219-8-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2k4U5ilCF1r6kxUMSdieFEj7CcrbaUcJ0TGr+lMWAv4=;
 b=k30NduzJ9RoFekM6a0KSmH37OP16Owyk4/GUcEroVm8EtRvk/cfGukqfZx3qJRYlKs
 SWA2e1YxjNQQvMB4DzEapOwk0fWlFW5RbBaUCAW5247FzB9duY/FOcDo2XkdKI/luHKd
 V96qQB+/ppD51DZW8QlKUs0LXZ7N/RAmw03jUgVO6GRZ8PASeTDrYy9nigTamdp00c1g
 qLUfkjbyoCKN9YVAzjH8RYgbV2TU+Ok2AmtO5aw5UaUcVi3iNDdLE20RkrdmUTqtUMmo
 VvkLUfBFIiSk9xk5rLY2SncRvdBe0JiUpVS4dfIHi04uDUMHvqSXzLfQcg5Pu+dxUSyU
 RPNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=k30NduzJ
Subject: Re: [Buildroot] [PATCH 07/16] Makefile: run check-* inside docker
 image
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmljYXJkbywKCkxlIDI0LzA3LzIwMjIgw6AgMDc6NDksIFJpY2FyZG8gTWFydGluY29z
a2kgYSDDqWNyaXTCoDoKPiBDdXJyZW50bHkgdGhlIHJlc3VsdCBmb3IgYm90aCBjaGVjay1wYWNr
YWdlIGFuZCBjaGVjay1mbGFrZTggdGFyZ2V0cwo+IGRlcGVuZCBvbiB0aGUgdmVyc2lvbiBvZiB0
aGUgdG9vbHMgZmxha2U4IGFuZCBzaGVsbGNoZWNrIGluc3RhbGxlZCBvbgo+IHRoZSBob3N0Lgo+
IAo+IEluIG9yZGVyIHRvIGVuc3VyZSByZXByb2R1Y2liaWxpdHkgYWNyb3NzIG1hY2hpbmVzIG9m
IGRpZmZlcmVudAo+IGRldmVsb3BlcnMsIGFsd2F5cyB1c2UgdGhlIGRvY2tlciBpbWFnZSB0byBy
dW4gdGhlc2UgdGFyZ2V0cy4KPiAKPiBXaGVuIG9uZSBvZiB0aGVzZSB0YXJnZXRzIGlzIGNhbGxl
ZCwgdGVzdCBpZiBpdCBpcyBhbHJlYWR5IHJ1bm5pbmcKPiBpbnNpZGUgdGhlIGRvY2tlciBpbWFn
ZSwgYW5kIGlmIGl0IG5vdCwgc3RhcnQgdGhlIGRvY2tlciBpbWFnZSBhbmQgcnVuCj4gdGhlIHNh
bWUgY29tbWFuZCBpbnNpZGUgaXQuCj4gRG8gdGhlIGNoZWNrIGZvciB0aGUgZG9ja2VyIGltYWdl
IGluIGEgc2ltcGxlIHdheToganVzdCBjaGVjayBjdXJyZW50Cj4gdXNlciBiZWxvbmdzIG9ubHkg
dG8gZ3JvdXAgYnItdXNlci4gSXQgaXMgdmVyeSB1bmxpa2VseSBhIGRldmVsb3BlciBoYXMKPiBl
eGFjdGx5IHRoaXMgdXNlciBjb25maWd1cmF0aW9uIGluIHRoZSBob3N0Lgo+IAo+IEFkZCBhIG5v
dGUgaW4gdGhlIERvY2tlcmZpbGUgYWJvdXQgdGhpcyB1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UmljYXJkbyBNYXJ0aW5jb3NraSA8cmljYXJkby5tYXJ0aW5jb3NraUBnbWFpbC5jb20+Cj4gLS0t
Cj4gIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKysrCj4gIHN1cHBvcnQv
ZG9ja2VyL0RvY2tlcmZpbGUgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXggYmQ3YWI5
Njc1ZC4uZjQyZGMzMTUxZCAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2VmaWxl
Cj4gQEAgLTEyMzcsNiArMTIzNywxNSBAQCByZWxlYXNlOgo+ICBwcmludC12ZXJzaW9uOgo+ICAJ
QGVjaG8gJChCUjJfVkVSU0lPTl9GVUxMKQo+ICAKPiArY2hlY2tfaW5zaWRlX2RvY2tlciA6PSAk
KHNoZWxsIGlmIFsgImBncm91cHNgIiA9ICdici11c2VyJyBdOyB0aGVuIGVjaG8geTsgZWxzZSBl
Y2hvIG47IGZpKQo+ICsKPiArIyBMaXN0IG9mIHRhcmdldCB0aGF0IG5lZWQgdG8gcnVuIGluc2lk
ZSBkb2NrZXIgaW1hZ2UgdG8gZW5zdXJlIHJlcHJvZHVjaWJsZSByZXN1bHRzCj4gK2luc2lkZV9k
b2NrZXJfdGFyZ2V0cyA6PSBjaGVjay1wYWNrYWdlIGNoZWNrLWZsYWtlOAo+ICsKPiAraWZlcSAo
JChjaGVja19pbnNpZGVfZG9ja2VyKSxuKQo+ICskKGluc2lkZV9kb2NrZXJfdGFyZ2V0cyk6Cj4g
KwkkKFEpdXRpbHMvZG9ja2VyLXJ1biAkKE1BS0UpIFY9JChWKSAkQAoKV2hpbGUgSSB1bmRlcnN0
YW5kIHRoZSByZXByb2R1Y2liaWxpdHkgaXNzdWUsIEknbSBub3Qgc3VyZSBJIHJlYWxseSB3YW5k
IG15IG1ha2UKY2hlY2stcGFja2FnZSBjb21tYW5kIHN0YXJ0aW5nIHN0YXJ0aW5nIGEgZG9ja2Vy
IGNvbnRhaW5lci4KCkkgZ3Vlc3MgQnVpbGRyb290IHVzZXIgKG9yIENJIGJ1aWxkIG1hY2hpbmUp
IGNhbiBkbyB0aGUgc2FtZSBpZiB0aGV5IHdhbnQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
K2Vsc2UKPiAgY2hlY2stZmxha2U4Ogo+ICAJJChRKWdpdCBscy10cmVlIC1yIC0tbmFtZS1vbmx5
IEhFQUQgXAo+ICAJfCB4YXJncyBmaWxlIFwKPiBAQCAtMTI0Niw2ICsxMjU1LDcgQEAgY2hlY2st
Zmxha2U4Ogo+ICAKPiAgY2hlY2stcGFja2FnZToKPiAgCSQoUSkuL3V0aWxzL2NoZWNrLXBhY2th
Z2UgYGdpdCBscy10cmVlIC1yIC0tbmFtZS1vbmx5IEhFQURgCj4gK2VuZGlmCj4gIAo+ICBpbmNs
dWRlIGRvY3MvbWFudWFsL21hbnVhbC5tawo+ICAtaW5jbHVkZSAkKGZvcmVhY2ggZGlyLCQoQlIy
X0VYVEVSTkFMX0RJUlMpLCQoc29ydCAkKHdpbGRjYXJkICQoZGlyKS9kb2NzLyovKi5taykpKQo+
IGRpZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIGIvc3VwcG9ydC9kb2NrZXIv
RG9ja2VyZmlsZQo+IGluZGV4IGY1NGMzMWI1NGEuLmFmZTg5MTFlNzggMTAwNjQ0Cj4gLS0tIGEv
c3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+ICsrKyBiL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZp
bGUKPiBAQCAtNjAsNiArNjAsNyBAQCBSVU4gc2VkIC1pICdzLyMgXChlbl9VUy5VVEYtOFwpL1wx
LycgL2V0Yy9sb2NhbGUuZ2VuICYmIFwKPiAgUlVOIHVzZXJhZGQgLW1zIC9iaW4vYmFzaCBici11
c2VyICYmIFwKPiAgICAgIGNob3duIC1SIGJyLXVzZXI6YnItdXNlciAvaG9tZS9ici11c2VyCj4g
IAo+ICsjIE5vdGU6IGJlbG93IHVzZXIgaXMgdXNlZCB0byBjaGVjayBpZiB3ZSBhcmUgcnVubmlu
ZyBpbnNpZGUgZG9ja2VyCj4gIFVTRVIgYnItdXNlcgo+ICBXT1JLRElSIC9ob21lL2JyLXVzZXIK
PiAgRU5WIEhPTUUgL2hvbWUvYnItdXNlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
