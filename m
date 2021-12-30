Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF658C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64CCD400FB;
	Thu, 30 Dec 2021 16:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwN9L9OVuk73; Thu, 30 Dec 2021 16:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E93F540104;
	Thu, 30 Dec 2021 16:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 708941BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 592D38137E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7egX2RcsC0-R for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36EF380C5E
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:44:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so51588152wrg.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IJRM9i2AelXmxAZ+2/u5ENqpJxVRF+u+DYRKW3MsJ8c=;
 b=X2CPLs/SYbBS+s4OlCHIX7jWLV/EOATXGlRfbZJrxGnLrz+wWsfX2AyahQHE4MLUz2
 9P5U1US25NPFr7NrrPapZnFLHDrfNKgW5hyIbpfCfFuCW0x42WX9DC51KCxH+/TQ3RS8
 MD9cbUmYzExbmI59EVgBibyl1FwycPV8SYdgKtpaWPmqLjOLYpJ95ieSUJ+Tf6PaMcPG
 P0AQPIdgW44DRN7kx3tQ+2zM7R22lk6eT9t9wfxZIJ9jpsLKuioH3E9aRWBIIC/rw9VB
 S5yY6Ow6iuz3tHNbGpKi4oJEJ0sWFZ7qNX8clDb2VqKY1jObzDzDLAjLWEdF2JlUvY+O
 R8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IJRM9i2AelXmxAZ+2/u5ENqpJxVRF+u+DYRKW3MsJ8c=;
 b=fPvB6JWe//Z0v4TGsSA6H6aSNuchZMBMi3jsshI6wCywz9dqcXKcQFokqeiDKzilGj
 Wd47xbErzfwH7IeatT2e1Eyeul+JFvB/+5LxhvAwA7FAhq/vjuc6B557sUsid05vov3n
 HtwiK/yMlkOTVcOpgcHahsJ9/vKQfF0UR5yyhmJKkLO7PEFjrcsqWDnJLskGj/Z7Oue2
 FVsHQpUC6ZIEQmCOopXK3/O6c8MKcSP1RsmV1gxjAcdjLMZ3pNyRVr7oMw3eO5hf3EZC
 R+VhtBIvooTlYGMc0CLf2Yjz+WgzD9Hhv1YTw55mGLc6A+11+xGpNyiOL0b11p2DK+QJ
 SjpQ==
X-Gm-Message-State: AOAM5305OJNwQIqX4FRXsuhg61VGxwuze5r7FYSvFK6YuE6206f3pEDS
 iwhS2SlQZSrmam6yVakxYTARi2xnihk=
X-Google-Smtp-Source: ABdhPJxkcrujbr+yQBxbHwj+I35GXVeRzu2IQ8XyH69QOpQY1rlcxHZGl8nNo44t9A+nDIOEN44oBw==
X-Received: by 2002:a05:6000:cd:: with SMTP id
 q13mr25644457wrx.302.1640882674516; 
 Thu, 30 Dec 2021 08:44:34 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id r9sm25190417wmq.18.2021.12.30.08.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 08:44:34 -0800 (PST)
Message-ID: <7e70f53d-e66f-607e-b8a7-853d25ffd19f@gmail.com>
Date: Thu, 30 Dec 2021 17:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20211229143843.1271981-1-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211229143843.1271981-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml:
 make it possible to test multiple defconfigs
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

SGVsbG8gVGhvbWFzLAoKTGUgMjkvMTIvMjAyMSDDoCAxNTozOCwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEFscmVhZHkgc3VwcG9ydGVkOgo+IAo+ICAtIFB1c2hpbmcgYSBicmFuY2gg
Y2FsbGVkICI8Zm9vPi1kZWZjb25maWdzIiB0ZXN0cyBhbGwgZGVmY29uZmlncy4KPiAKPiAgLSBQ
dXNoaW5nIGEgYnJhbmNoIGNhbGxlZCAiPGZvbz4tZGVmY29uZmlnLTxkZWZjb25maWctbmFtZT4i
IHdpbGwKPiAgICB0ZXN0IG9uZSBwYXJ0aWN1bGFyIGRlZmNvbmZpZwo+IAo+IFRoaXMgY29tbWl0
IGFkZHMgc3VwcG9ydCBmb3I6Cj4gCj4gIC0gUHVzaGluZyBhIGJyYW5jaCBjYWxsZWQgIjxmb28+
LWRlZmNvbmZpZ3MtPHBhdHRlcm4+IiB3aGljaCB3aWxsCj4gICAgdGVzdCBhbGwgZGVmY29uZmln
cyB3aG9zZSBuYW1lIHN0YXJ0IHdpdGggdGhlIHBhdHRlcm4uIEZvciBleGFtcGxlCj4gICAgIjxm
b28+LWRlZmNvbmZpZ3MtcWVtdV8iIHdpbGwgdGVzdCBhbGwgUWVtdSBkZWZjb25maWdzCgpJJ20g
ZG9pbmcgYSBzaGFtZWxlc3MgbG9jYWwgaGFjayBpbiBnZW5lcmF0ZS1naXRsYWItY2kteW1sIHRv
IGtlZXAgb25seSBxZW11KgpkZWZjb25maWcgZm9yIHRlc3RpbmcgaW4gZ2l0bGFiOgoKZGVmY29u
Zmlncz0oICQoY2QgY29uZmlnczsgTENfQUxMPUMgbHMgLTEgcWVtdSpfZGVmY29uZmlnKSApCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+Cj4gLS0tCj4gSWRlYWxseSwgdGhpcyBzaG91bGQgYmUgZG9jdW1lbnRlZCBpbiB0
aGUgQnVpbGRyb290IG1hbnVhbCwgYnV0IEknbQo+IG5vdCBzdXJlIHdoZXJlIGl0IHNob3VsZCBi
ZSBkb2N1bWVudGVkLgoKUHJvYmFibHkgYSBuZXcgY2hhcHRlciBhZnRlciAiMjIuNy4gVXNpbmcg
dGhlIHJ1bi10ZXN0cyBmcmFtZXdvcmsiLgoKIjIyLjguIFRlc3RpbmcgdXNpbmcgQnVpbGRyb290
J3MgZ2l0bGFiLWNpIgoKPiAtLS0KPiAgc3VwcG9ydC9zY3JpcHRzL2dlbmVyYXRlLWdpdGxhYi1j
aS15bWwgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2dlbmVyYXRlLWdpdGxhYi1jaS15bWwgYi9zdXBw
b3J0L3NjcmlwdHMvZ2VuZXJhdGUtZ2l0bGFiLWNpLXltbAo+IGluZGV4IDhhYWE0NTZiMDMuLjNl
MGM2ODA5MWIgMTAwNzU1Cj4gLS0tIGEvc3VwcG9ydC9zY3JpcHRzL2dlbmVyYXRlLWdpdGxhYi1j
aS15bWwKPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvZ2VuZXJhdGUtZ2l0bGFiLWNpLXltbAo+IEBA
IC02Niw2ICs2NiwxMSBAQCBnZW5fdGVzdHMoKSB7Cj4gICAgICAgICAgICAoKi1kZWZjb25maWdz
KQo+ICAgICAgICAgICAgICBkb19kZWZjb25maWdzPWJhc2UKPiAgICAgICAgICAgICAgOzsKPiAr
CSAgKCotZGVmY29uZmlncy0qKQo+ICsgICAgICAgICAgICBwYXR0ZXJuPSQoZWNobyAke0NJX0NP
TU1JVF9SRUZfTkFNRX0gfCBzZWQgJ3MlW15cLV0qLWRlZmNvbmZpZ3MtXCguKlwpJVwxJScpCj4g
KyAgICAgICAgICAgIGRlZmNvbmZpZ3M9KCAkKGNkIGNvbmZpZ3M7IExDX0FMTD1DIGxzIC0xIHwg
Z3JlcCBeJHtwYXR0ZXJufSkgKQo+ICsgICAgICAgICAgICBkb19kZWZjb25maWdzPWJhc2UKPiAr
ICAgICAgICAgICAgOzsKCkknbGwgdXNlIHRoaXMgcGF0Y2ggbmV4dCB0aW1lIEknbGwgdGVzdCBx
ZW11IGRlZmNvbmZpZy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgICAgICAgICAgICgqLSpf
ZGVmY29uZmlnKQo+ICAgICAgICAgICAgICBkZWZjb25maWdzPSggIiR7Q0lfQ09NTUlUX1JFRl9O
QU1FIyMqLX0iICkKPiAgICAgICAgICAgICAgZG9fZGVmY29uZmlncz1iYXNlCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
