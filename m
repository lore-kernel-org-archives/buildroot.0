Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C820CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBCB1400BA;
	Wed,  3 Apr 2024 08:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jguLyCE3mJI2; Wed,  3 Apr 2024 08:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4B7D40527
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4B7D40527;
	Wed,  3 Apr 2024 08:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF211BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9802140314
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTchiLodj3VO for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:28:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 825744030C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 825744030C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 825744030C
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 08:28:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4162500134dso781785e9.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 01:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712132916; x=1712737716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GTK0TgDFW+uPpSqqY2/0JfzlMzgldwD6m1avhSf06c=;
 b=g/8p4Iqjn6JPiNAZkHmSP3jW8b3yUWIE0KpJMIyOWDLIe3fiU4bDRt9nwyugr7+WEd
 P916OnHnd7RSy3/fEY0Is3E02ehRFWXoQhwscRhFjDd8t9ZStVVtWfyk2e/7yFhzBRH+
 c0T18fzzd9AkbwssLKnz/Cj1qrHW5szMbpk1mq6IMCbCZPfFhHEvUX6fKNSM9G2vETrS
 u+MxwF8l7lRZpYPJuCUF9CVm4JpZaAooYLNYh8VgZYp2GyfgVe+24qu7fdDT0VL/MPev
 f5l1Vd+AXbHBMHAEtX4L/7arw7UW8YJNEcmi210en5P4enmkCeZwy5o1YbXIwSiVjXEq
 N1lA==
X-Gm-Message-State: AOJu0Yz38JtVvYxq8DXjY367X6MJnK6+11W9NKRtQzffYDVWVVpjqO5R
 fjKu7D6ffAVbteojKMthkYXQWWkuS4xgyJkU8D7tzMiaW13e2iOOsL6iHeeULyQ=
X-Google-Smtp-Source: AGHT+IG7GpC7F2GS0iQCTgtNQJ/5knAqgIEnRLUcN3G9e5FHZ9U1Y1U8+usR+VMf81dMzCdMhMwF9Q==
X-Received: by 2002:a05:6000:49:b0:343:9af4:7a90 with SMTP id
 k9-20020a056000004900b003439af47a90mr647393wrx.69.1712132915953; 
 Wed, 03 Apr 2024 01:28:35 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1034:c083:97c8:fbff:84a2:888b?
 ([2a04:cec0:1034:c083:97c8:fbff:84a2:888b])
 by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b00341e2146b53sm1346784wrb.106.2024.04.03.01.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 01:28:35 -0700 (PDT)
Message-ID: <fb91444b-65b9-4c8a-877c-00bcfe754729@smile.fr>
Date: Wed, 3 Apr 2024 10:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-12-dario.binacchi@amarulasolutions.com>
 <20240319151642.iqpbgwlcqxcumi52@bryanbrattlof.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240319151642.iqpbgwlcqxcumi52@bryanbrattlof.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712132916; x=1712737716;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8GTK0TgDFW+uPpSqqY2/0JfzlMzgldwD6m1avhSf06c=;
 b=fRrTWGBwbdqbS0Do7iRUdSFGDBZKEjB7gHc0fLUl3/8a08opTVdQIGlxZPZxgtLehC
 +9e4dM6izF8Qf8Y6e7YHnhE0JvDtGuHITdt/yYO8p1GpiB4VEm0OcOvWS8981JFkQh8E
 /YfZ4F8AuKre5MVn6Rs1rCKEWHJSUsQ30hxyJmOoJDvYhPYXpSzwctnm/BQw4KLicQuJ
 qQf2YYPI4VkPEDvky6VGsB2vxGJoTbl9BqE5Ta4+GYnNAQfyelvTPSQ9eNbOKb4VppKd
 dKNp+ggflJgFNHqXFDZtsj/fpZB7TrHRhaiKPCws7o8AZnOII8/mv9NhbfCKzDK+AKlr
 MaWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fRrTWGBw
Subject: Re: [Buildroot] [PATCH v9 11/22] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnJ5YW4sIEFsbCwKCkxlIDE5LzAzLzIwMjQgw6AgMTY6MTYsIEJyeWFuIEJyYXR0bG9m
IGEgw6ljcml0wqA6Cj4gSGkgRGFyaW8sCj4gCj4gT24gTWFyY2ggIDQsIDIwMjQgdGh1cyBzYXll
dGggRGFyaW8gQmluYWNjaGk6Cj4+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFu
IHRvIHByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4+IGltYWdlcywgZnJvbSBzaW1w
bGUgU1BMICsgVS1Cb290IGNvbWJpbmF0aW9ucywgdG8gbW9yZSBjb21wbGV4Cj4+IGFycmFuZ2Vt
ZW50cyB3aXRoIG1hbnkgcGFydHMuCj4+Cj4+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9JTkRJ
UlMgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gcHJvdmlkZSB0aGUKPj4gZGlyZWN0b3J5IHRvIHNl
YXJjaCBmb3IgYmluYXJ5IGJsb2JzIGFuZCBzZWxlY3QgdGhlIHBhY2thZ2VzIHJlcXVpcmVkIGJ5
Cj4+IGJpbm1hbi4KPj4KPj4gVGhlIGRlcGVuZGVuY3kgb2YgYmlubWFuIGlzIG5vdCByZWFsbHkg
ZWFzeSB0byBmb2xsb3cuIEZpcnN0IHdlIGhhdmUgdGhlCj4+IHBhY2thZ2VzIGxpc3QgZnJvbSBi
aW5tYW4ucnN0IFsxXSB0aGVuIHdlIGhhdmUgdG8gaW5zdGFsbCBhZGRpdGlvbmFsIHB5dGhvbgo+
PiBtb2R1bGVzIFsyXS4gTWF5YmUgaW4gdGhlIGZ1dHVyZSBpdCB3aWxsIGJlIG5lY2Vzc2FyeSB0
byBhZGQgaG9zdC1sem1hIGFuZAo+PiBob3N0LWx6NCBpbiB0aGUgZGVwZW5kZW5jaWVzIGxpc3Qu
Cj4+Cj4+IFsxXSBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL3Yy
MDI0LjAxL3Rvb2xzL2Jpbm1hbi9iaW5tYW4ucnN0P3BsYWluPTEjTDM3Nwo+PiBbMl0gaHR0cHM6
Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS90b29scy9idWls
ZG1hbi9yZXF1aXJlbWVudHMudHh0Cj4+IENvLWRldmVsb3BlZC1ieTogTWljaGFlbCBUcmltYXJj
aGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+PiBDby1kZXZlbG9w
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+PiBTaWduZWQtb2Zm
LWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gU2lnbmVkLW9mZi1i
eTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
Pgo+PiAtLS0KPj4KPiAKPiAuLi4KPiAKPj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tayAKPj4gYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1y
NS1sb2FkZXIubWsKPj4gaW5kZXggMGZmY2I4MjM1ZjJlLi5mZGIwNThmM2I3MmEgMTAwNjQ0Cj4+
IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+PiArKysgYi9i
b290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4gQEAgLTM5LDcgKzM5LDEy
IEBAIFRJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBcCj4+ICAJaG9zdC1wa2djb25mIFwK
Pj4gIAkkKEJSMl9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAo+PiAgCWhvc3QtYXJtLWdudS10b29s
Y2hhaW4gXAo+PiAtCWhvc3Qtb3BlbnNzbAo+PiArCWhvc3Qtb3BlbnNzbCBcCj4+ICsJaG9zdC1w
eXRob24tanNvbnNjaGVtYSBcCj4+ICsJaG9zdC1weXRob24tcHl5YW1sIFwKPj4gKwlob3N0LXB5
dGhvbjMgXAo+PiArCWhvc3QtcHl0aG9uLXNldHVwdG9vbHMgXAo+PiArCWhvc3QtcHl0aG9uLXB5
bGliZmR0Cj4gCj4gSnVzdCBhIHF1ZXN0aW9uIG9uIGhvdyBib290IGRlcGVuZGVuY2llcyBhcmUg
cmVzb2x2ZWQuIERvIHdlIG5lZWQgdG8gYWRkIAo+IHRpLWszLWJvb3QtZmlybXdhcmUgdG8gdGhp
cyBsaXN0PyBIb3cgZG9lcyB0aS1rMy1yNS1sb2FkZXIga25vdyB0byAKPiAnYnVpbGQnIHRoZSBm
aXJtd2FyZSBiZWZvcmUgd2UgYnVpbGQgdGlib290My5iaW4/CgpJbmRlZWQsIHdpdGhvdXQgdGkt
azMtYm9vdC1maXJtd2FyZSBwYWNrYWdlIGluc3RhbGxlZCwgYmlubWFuIHdhcm4gYWJvdXQKIk1p
c3NpbmcgYmxvYiIKCm1ha2UgdGlfYW02Mnhfc2tfZGVmY29uZmlnCm1ha2UgdGktazMtcjUtbG9h
ZGVyCgogIEJJTk1BTiAgLmJpbm1hbl9zdGFtcApJbWFnZSAndGlib290My1hbTYyeC1ocy1ldm0u
YmluJyBpcyBtaXNzaW5nIG9wdGlvbmFsIGV4dGVybmFsIGJsb2JzIGJ1dCBpcyBzdGlsbApmdW5j
dGlvbmFsOiB0aS1mcy1lbmMuYmluIHN5c2Z3LWlubmVyLWNlcnQKCi9iaW5tYW4vdGlib290My1h
bTYyeC1ocy1ldm0uYmluL3RpLWZzLWVuYy5iaW4KKHRpLXN5c2Z3L3RpLWZzLWZpcm13YXJlLWFt
NjJ4LWhzLWVuYy5iaW4pOgogICBNaXNzaW5nIGJsb2IKCi9iaW5tYW4vdGlib290My1hbTYyeC1o
cy1ldm0uYmluL3N5c2Z3LWlubmVyLWNlcnQKKHRpLXN5c2Z3L3RpLWZzLWZpcm13YXJlLWFtNjJ4
LWhzLWNlcnQuYmluKToKICAgTWlzc2luZyBibG9iCgpJbWFnZSAndGlib290My1hbTYyeC1ocy1m
cy1ldm0uYmluJyBpcyBtaXNzaW5nIG9wdGlvbmFsIGV4dGVybmFsIGJsb2JzIGJ1dCBpcwpzdGls
bCBmdW5jdGlvbmFsOiB0aS1mcy1lbmMuYmluIHN5c2Z3LWlubmVyLWNlcnQKCi9iaW5tYW4vdGli
b290My1hbTYyeC1ocy1mcy1ldm0uYmluL3RpLWZzLWVuYy5iaW4KKHRpLXN5c2Z3L3RpLWZzLWZp
cm13YXJlLWFtNjJ4LWhzLWZzLWVuYy5iaW4pOgogICBNaXNzaW5nIGJsb2IKCi9iaW5tYW4vdGli
b290My1hbTYyeC1ocy1mcy1ldm0uYmluL3N5c2Z3LWlubmVyLWNlcnQKKHRpLXN5c2Z3L3RpLWZz
LWZpcm13YXJlLWFtNjJ4LWhzLWZzLWNlcnQuYmluKToKICAgTWlzc2luZyBibG9iCgpJbWFnZSAn
dGlib290My1hbTYyeC1ncC1ldm0uYmluJyBpcyBtaXNzaW5nIG9wdGlvbmFsIGV4dGVybmFsIGJs
b2JzIGJ1dCBpcyBzdGlsbApmdW5jdGlvbmFsOiB0aS1mcy1ncC5iaW4KCi9iaW5tYW4vdGlib290
My1hbTYyeC1ncC1ldm0uYmluL3RpLWZzLWdwLmJpbgoodGktc3lzZncvdGktZnMtZmlybXdhcmUt
YW02MngtZ3AuYmluKToKICAgTWlzc2luZyBibG9iCgogIE9GQ0hLICAgLmNvbmZpZwoKU28sIHdl
IHNob3VsZCBhZGQgdGktazMtYm9vdC1maXJtd2FyZSBpbiBkZXBlbmRlbmNpZXMgdG8gYXZvaWQg
YnVpbGRpbmcKdGktazMtcjUtbG9hZGVyIGJlZm9yZSB0aS1rMy1ib290LWZpcm13YXJlLgoKV2hl
biBidWlsZGluZyB0aGUgQU02IGRlZmNvbmZpZywgdGhlIGJ1aWxkIG9yZGVyIGlzIG9yZGVyZWQg
YWxwaGFiZXRpY2FsbHkgYnkKZGVmYXVsdCBhbmQgdGktazMtYm9vdC1maXJtd2FyZSBpcyBpbnN0
YWxsZWQgYmVmb3JlIHRpLWszLXI1LWxvYWRlci4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
PiB+QnJ5YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
