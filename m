Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050A2C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 15:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E3A6124B
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 15:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92E3A6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F3EE400E9;
	Sun, 22 Aug 2021 15:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCgPVSzboM8j; Sun, 22 Aug 2021 15:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7284340156;
	Sun, 22 Aug 2021 15:00:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D83D1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 15:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D65E605D7
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 15:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byAjkfuyAyDG for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 15:00:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C68BF605BC
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 15:00:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso12266088wmg.4
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BwzXq/PoxehUjHwP+tKSwLf1FaTsTk+ns/YgvKVMOgU=;
 b=Y7H1xGKJ4DIYVqOlNYlZ/1UWRQSmnaIdrxxp5fMa7byuoJQ/jJT/6XR8X96CaBmoBt
 zvjlLkwDZtJbwf9RWFJ0WJ0PUr5goOFogBdevQFbewMgDjlSLiZZHriaSUwcUqLxdTlp
 uIyu1/wnEr6AMS+ru1eNSI7wI3rwznxC7O7C0FOPRii9amv9QldKaIJ3f1oZRIGg+Fwm
 9RmDMTzGaY2WPjviFgF56nxcLXQd24XKeNifnvgwk9JEd7lpTqozxrh5ncKf5E2Acm/W
 ZoCIF8nqZlktmZJQPormIOslus9CGIfKTVoUtrd86ixJP4SWbBrX0KJ1IqodkuAyxYrG
 IFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwzXq/PoxehUjHwP+tKSwLf1FaTsTk+ns/YgvKVMOgU=;
 b=GbgT0UmFeH5916BE6QVbVaE5XK/Vp/aI/l9WKbB3WSEG8thsFk9zb/5VJ/nHjYlIt3
 KC6q+RRp+yVQYuLJRNg1gfHPKtYOzeWuHZm7Af/udob/aJVQtfQfQ3v5ecCdXg033gHQ
 Q0eqfsCNuYwFYGccbAbtrPK0DQQSjI5PNMGItA06jcuffjS/QO6LWJ8w8/adsKl+cz50
 GHxCtBbExVDSC0+Sr7f5CtbzDv12KO3wCrui0yYjm+bC8tG9464eqvtv3sV7k4RL9Fm9
 2Ajgjnap1DdieVQchdFuIX5b6CP2yT/CeaXGyjN4j8Bf80taffHeoH9Uh72DhjioVJWe
 DdbQ==
X-Gm-Message-State: AOAM532rsJazTR+0/H3EEXnYe0UIdxmw5KL2W4WqH9axB8sO+U/3eTC/
 UKmuS0BnVqUxM3j6HTM2BGs=
X-Google-Smtp-Source: ABdhPJyC5MOngBRxSfaXyYmZbre5gL31j4odQtO97DAgY/VMi/o/Ith0ypxXN1WjJy8zwXD/OKlkeA==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr12228014wmk.113.1629644418957; 
 Sun, 22 Aug 2021 08:00:18 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id r129sm10828480wmr.7.2021.08.22.08.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 08:00:18 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210626133238.144893-1-thomas.petazzoni@bootlin.com>
 <20210626154257.GN104638@scaer>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <2bc67042-6651-caab-c88e-75c40afb1c73@gmail.com>
Date: Sun, 22 Aug 2021 17:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626154257.GN104638@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] support/testing: use .assertRunOk() when
 possible
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

VGhvbWFzLCBZYW5uLCBBbGwsCgpMZSAyNi8wNi8yMDIxIMOgIDE3OjQyLCBZYW5uIEUuIE1PUklO
IGEgw6ljcml0wqA6Cj4gVGhvbWFzLCBBbGwsCj4gCj4gT24gMjAyMS0wNi0yNiAxNTozMiArMDIw
MCwgVGhvbWFzIFBldGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4+IFRoZSBCUlRlc3QoKSBjbGFzcyBp
bXBsZW1lbnRzIGFuIGFzc2VydFJ1bk9rKCkgbWV0aG9kIHRoYXQgZG9lcyB0aGUKPj4gdmVyeSBj
b21tb24gd29yayBvZiBydW5uaW5nIGEgY29tbWFuZCBpbnNpZGUgdGhlIGVtdWxhdG9yLCBhbmQK
Pj4gY2hlY2tpbmcgdGhhdCBpdCBpcyBzdWNjZXNzZnVsLgo+Pgo+PiBUaGlzIGNvbW1pdCBjaGFu
Z2VzIGFsbCBsb2NhdGlvbnMgd2hlcmUgdGhpcyAuYXNzZXJ0UnVuT2soKSBtZXRob2QgY2FuCj4+
IGJlIHVzZWQsIGluc3RlYWQgb2Ygb3Blbi1jb2RpbmcgdGhlIHNhbWUgbG9naWMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+Cj4gCj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAKPiBSZWdhcmRzLAo+IFlhbm4g
RS4gTU9SSU4uCj4gCj4+IC0tLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2ZzL3Rlc3RfZjJm
cy5weSAgICAgICAgIHwgIDMgKy0tCj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVzdF9q
ZmZzMi5weSAgICAgICAgfCAgMyArLS0KPj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9mcy90ZXN0
X3NxdWFzaGZzLnB5ICAgICB8ICAzICstLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2luaXQv
YmFzZS5weSAgICAgICAgICAgIHwgIDYgKystLS0tCj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
aW5pdC90ZXN0X25vbmUucHkgICAgICAgfCAgMyArLS0KPj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9pbml0L3Rlc3Rfc3lzdGVtZC5weSAgICB8ICAzICstLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9hdG9wLnB5ICAgIHwgIDYgKystLS0tCj4+ICAuLi4vdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfYm1hcF90b29scy5weSAgfCAgMyArLS0KPj4gIC4uLi90ZXN0cy9w
YWNrYWdlL3Rlc3RfZG9ja2VyX2NvbXBvc2UucHkgICAgICB8ICAzICstLQo+PiAgLi4uL3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X2Ryb3BiZWFyLnB5ICAgIHwgIDYgKystLS0tCj4+ICBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x1YS5weSAgICAgfCAgMyArLS0KPj4gIHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0ZGF0YS5weSB8ICAzICstLQo+PiAg
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVuc3NoLnB5IHwgIDYgKystLS0t
Cj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X29wa2cucHkgICAgfCAxMiAr
KysrLS0tLS0tLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9wZXJsLnB5
ICAgIHwgIDMgKy0tCj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhv
bi5weSAgfCAxMiArKysrLS0tLS0tLQo+PiAgLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
cHl0ZXN0LnB5ICAgICAgIHwgIDMgKy0tCj4+ICAuLi4vcGFja2FnZS90ZXN0X3B5dGhvbl9weXRl
c3RfYXN5bmNpby5weSAgICAgfCAgMyArLS0KPj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfcmVkaXMucHkgICB8ICAzICstLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9ydXN0LnB5ICAgIHwgIDYgKystLS0tCj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3M2X3JjLnB5ICAgfCAyMSArKysrKysrKystLS0tLS0tLS0tCj4+ICBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3N1ZG8ucHkgICAgfCAgNiArKy0tLS0K
Pj4gIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9zeXNsb2dfbmcucHkgICB8IDEwICsr
KystLS0tLQo+PiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF90bXV4LnB5ICAg
IHwgMTIgKysrKy0tLS0tLS0KPj4gIDI0IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyks
IDkxIGRlbGV0aW9ucygtKQo+PgoKWy4uLl0KCj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvaW5pdC9iYXNlLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2luaXQvYmFzZS5w
eQo+PiBpbmRleCA3NWNmYmU5YzU5Li44MGY3NzMxYmEzIDEwMDY0NAo+PiAtLS0gYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvaW5pdC9iYXNlLnB5Cj4+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9pbml0L2Jhc2UucHkKPj4gQEAgLTM5LDEwICszOSw4IEBAIGNsYXNzIEluaXRTeXN0ZW1CYXNl
KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4+ICAKPj4gICAgICBkZWYgY2hlY2tfaW5pdChzZWxm
LCBwYXRoKToKPj4gICAgICAgICAgY21kID0gImNtcCAvcHJvYy8xL2V4ZSB7fSIuZm9ybWF0KHBh
dGgpCj4+IC0gICAgICAgIF8sIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKGNtZCkKPj4g
LSAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDApCj4+ICsgICAgICAgIHNlbGYu
YXNzZXJ0UnVuT2soY21kKQo+PiAgCj4+ICAgICAgZGVmIGNoZWNrX25ldHdvcmsoc2VsZiwgaW50
ZXJmYWNlLCBleGl0Q29kZT0wKToKPj4gICAgICAgICAgY21kID0gImlwIGFkZHIgc2hvdyB7fSB8
Z3JlcCBpbmV0Ii5mb3JtYXQoaW50ZXJmYWNlKQo+PiAtICAgICAgICBfLCBleGl0X2NvZGUgPSBz
ZWxmLmVtdWxhdG9yLnJ1bihjbWQpCj4+IC0gICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoZXhpdF9j
b2RlLCBleGl0Q29kZSkKPj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQpCgpXaGF0IGFi
b3V0IGV4aXRDb2RlIGFyZ3VtZW50PwoKVGhlc2VzIHR3byB0ZXN0cyBhcmUgZXhwZWN0aW5nIGNo
ZWNrX25ldHdvcmsoKSBmYWlsaW5nIChleGl0Q29kZSA9IDEpCnRlc3RzLmluaXQudGVzdF9idXN5
Ym94LlRlc3RJbml0U3lzdGVtQnVzeWJveFJ3CnRlc3RzLmluaXQudGVzdF9idXN5Ym94LlRlc3RJ
bml0U3lzdGVtQnVzeWJveFJvCgpNYXliZSBkZWZpbmUgYXNzZXJ0UnVuTm9rPwoKQmVzdCByZWdh
cmRzLApSb21haW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
