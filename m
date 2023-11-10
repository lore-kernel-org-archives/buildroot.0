Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB82AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 09:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54AA8400BD;
	Fri, 10 Nov 2023 09:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AA8400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slICdEXvH4t6; Fri, 10 Nov 2023 09:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 144164012A;
	Fri, 10 Nov 2023 09:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 144164012A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 121831BF2FF
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 09:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C2A4174E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 09:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C2A4174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdUm5ktEcahD for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 09:01:32 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7537E4168B
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 09:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7537E4168B
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32f87b1c725so1166566f8f.3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 01:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699606889; x=1700211689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+SWT+xo2a1FD38Qf8sWwYEWd0KAw3PItm9Z8HBRl6E=;
 b=Ef74evcUvyFCa9LY0mZh/JblMB0i14e/ukpsrS2KSrKrJzB+08hbEsWTC5MZ5Cvc1x
 WtqrlHqH3SOWND9hI4EQAy+Ag0SJEnZYIOLZXmzioBWD43RX7lRKbOdMTZS0eJloOD4t
 2GPwHWAbLUW5G8/G9dYJXwHRTcYVfc3BDaA/2bToSU3qJIuESXhc60Tvs1BUOSs9axEW
 Up2JW2V3X6px9P+ImnQBlIcpeDC0T4IEIWYZ2FwekVglYP2pAAvpzbA/YmpddNvEXuCx
 rktUp2m7gQ40JlXB+bUn1R8pbVyXxI2OMiuudW9Sl9Sd0w7jqgO/sssZsCa0upX/0w0c
 ec9w==
X-Gm-Message-State: AOJu0YzQ2Y8yBH9m5xLKiKNYtq8gyBKp27HD6OJ2DpBJLf2ZyNW1lISF
 mdIjHpMs6DDHHEDkKjgP0BQGRw==
X-Google-Smtp-Source: AGHT+IGIz/ZWiyUMtmQCNbB6G4yEzJA3Z39mk/USTeT2CelEaYcqAfue8Iv1X7TsPpHX5UgZY32y3w==
X-Received: by 2002:a5d:4e4e:0:b0:32f:8a7f:f00f with SMTP id
 r14-20020a5d4e4e000000b0032f8a7ff00fmr5720015wrt.60.1699606889248; 
 Fri, 10 Nov 2023 01:01:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056000024800b003197869bcd7sm1480530wrz.13.2023.11.10.01.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 01:01:27 -0800 (PST)
Message-ID: <f730a063-dc3c-4937-bc76-24b17c57d6a4@mind.be>
Date: Fri, 10 Nov 2023 10:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-8-arbab@linux.ibm.com>
 <342a893c-af90-4602-b73b-1afd37b34acb@mind.be>
 <624ea15d-6d09-48b3-a004-42cd3d3b67df@arbab-vm>
In-Reply-To: <624ea15d-6d09-48b3-a004-42cd3d3b67df@arbab-vm>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699606889; x=1700211689; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n+SWT+xo2a1FD38Qf8sWwYEWd0KAw3PItm9Z8HBRl6E=;
 b=Mzf75HX+Fx+X2HMTNS3QLEuvwNIp8cWe4opQupd7OTjiqOZnfIfjByKKN0ggGsZ/q4
 RU/TzVq3b3Bp+MpDYh+/kjD/w8Ltym/iXpUStmy7tJWkKD1F78fWFlbAQ7jRoeGFtvlL
 HJ95yYD3FHqUDaCHYikr87kpbAdmjJnmRDYzLu3Cs9kTofAmPR0ioJdluDCArGCGdBlC
 AshKcgUTUHykpCeoC+N89dklGDE3Iuys1dxpn37XU7FP0EbmiAT43uRLiJL7dZqg4TrV
 2108aBGNVSs9QEo3/pGxSLoDEqVWX0vDTCzkWPzCVbbVHH8ZpbV61LIgVfB1cSHPgIs3
 /PAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mzf75HX+
Subject: Re: [Buildroot] [PATCH v3 7/8] package/petitboot: enable user
 separation
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
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS8xMS8yMDIzIDE3OjE2LCBSZXphIEFyYmFiIHdyb3RlOgo+IE9uIFN1biwgTm92IDA1
LCAyMDIzIGF0IDA3OjI2OjE2UE0gKzAxMDAsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+
PiBPbiAwOS8xMC8yMDIzIDE3OjE3LCBSZXphIEFyYmFiIHdyb3RlOgo+Pj4gUnVuIHRoZSBwZXRp
dGJvb3QgVUkgYXMgYW4gdW5wcml2aWxlZ2VkIHVzZXIuIFRoaXMgcmVxdWlyZXMgdXNpbmcgdGhl
Cj4+PiBhZ2V0dHkgcGFja2FnZSBpbnN0ZWFkIG9mIHRoZSBidXN5Ym94IGdldHR5IHV0aWxpdHks
IHJ1bm5pbmcgdGhlIGluaXRpYWwKPj4+IHBiLWNvbnNvbGUgaGVscGVyIGF0IHVzZXIgbG9naW4g
cmF0aGVyIHRoYW4gZGlyZWN0bHkuCj4+Cj4+IFRoYXQgc291bmRzIGNvdW50ZXJwcm9kdWN0aXZl
IHRob3VnaD8gSXQgbWVhbnMgeW91IGhhdmUgdG8gbG9nIGluIGJlZm9yZSB0aGUgCj4+IGJvb3Qg
bWVudSBpcyBkaXNwbGF5ZWQ/IE9yIHBlcmhhcHMgSSBtaXN1bmRlcnN0YW5kIHRoZSBzdGF0ZW1l
bnQgaGVyZS4KPj4KPj4gSXQncyBhbHNvIG5vdCBjbGVhciB3aHkgaXQgd291bGQgbmVlZCBhZ2V0
dHkgaW5zdGVhZCBvZiBidXN5Ym94IGdldHR5Lgo+IAo+IFNvcnJ5LCBJIGRpZG4ndCBleHBsYWlu
IGl0IHZlcnkgd2VsbC4gVGhlIGNoYWluIGdvZXMgbGlrZSB0aGlzOgo+IAo+IDEuIC9ldGMvaW5p
dC5kL3BiLWNvbnNvbGUgc3RhcnQgY29uc29sZSA+IDIuIC91c3IvbGliZXhlYy9wZXRpdGJvb3Qv
cGItY29uc29sZSAtLWdldHR5IC0tZGV0YWNoIC0tIC1uIC1pIDAgY29uc29sZSBsaW51eAo+IDMu
IC9zYmluL2dldHR5IC1sL3Vzci9saWJleGVjL3BldGl0Ym9vdC9wYi1jb25zb2xlIC1uIC1pIDAg
Y29uc29sZSBsaW51eAo+IDQuIC91c3IvbGliZXhlYy9wZXRpdGJvb3QvcGItY29uc29sZQo+IDUu
IC91c3Ivc2Jpbi9wZXRpYm9vdC1uYwo+IAo+IEFmdGVyIHRoZSBjaGFuZ2U6Cj4gCj4gMS4gL2V0
Yy9pbml0LmQvcGItY29uc29sZSBzdGFydCBjb25zb2xlCj4gMi4gL3Vzci9saWJleGVjL3BldGl0
Ym9vdC9wYi1jb25zb2xlIC0tZ2V0dHk9L3NiaW4vYWdldHR5IC0tZGV0YWNoIC0tIC1hIAo+IHBl
dGl0dXNlciAtbiAtaSBjb25zb2xlIGxpbnV4Cj4gMy4gL3NiaW4vYWdldHR5IC1hIHBldGl0dXNl
ciAtbiAtaSBjb25zb2xlIGxpbnV4CgogIEhvdyBkaWQgdGhlIC1sIG9wdGlvbiBkaXNhcHBlYXIg
aGVyZT8gSXMgdGhhdCBkdWUgdG8gLS1nZXR0eT0gaW5zdGVhZCBvZiAtLWdldHR5PwoKICBBbnl3
YXksIHRoZSBvbmx5IHJlYXNvbiB0byB1c2UgYWdldHR5IGlzIGZvciB0aGUgLWEgb3B0aW9uLiBD
YW4ndCB3ZSBhY2hpZXZlIAp0aGUgc2FtZSBieSB1c2luZyBzdT8gSS5lLiBjcmVhdGUgYSB3cmFw
cGVyIHNjcmlwdCBhcm91bmQgcGItY29uc29sZSB0aGF0IGRvZXMgCnNvbWV0aGluZyBsaWtlCgpl
eGVjIHN1IC1zIC91c3IvbGliZXhlYy9wZXRpdGJvb3QvcGItY29uc29sZSBwZXRpdHVzZXIKCj4g
NC4gL2hvbWUvcGV0aXR1c2VyLy5wcm9maWxlCgogIFNvbWV0aGluZyBJIGRpZG4ndCB0b3VjaCBp
biBteSBlYXJsaWVyIHJldmlldzogSSBkb24ndCB0aGluayAucHJvZmlsZSBpcyB0aGUgCnJpZ2h0
IHBsYWNlIHRvIHNldCB0aGlzIHVwLiBFaXRoZXIgcGV0aXR1c2VyIGlzIGEgbm9ybWFsIHVzZXIg
LSBpbiB0aGF0IGNhc2UgCmxvZ2dpbmcgaW4gdGhyb3VnaCBzb21lIG90aGVyIG1lYW5zIChlLmcu
IHNzaCwgc3Vkbykgc2hvdWxkIGdpdmUgYSBub3JtYWwgc2hlbGwuIApJIGFzc3VtZSB5b3UgY2Fu
IHRlbGwgcGItY29uc29sZSB3aGljaCAic2hlbGwiIHRvIHVzZSBpbiB0aGUgImRyb3AgdG8gc2hl
bGwiIGNhc2UuCgoKPiA1LiAvdXNyL2xpYmV4ZWMvcGV0aXRib290L3BiLWNvbnNvbGUKPiA2LiAv
dXNyL3NiaW4vcGV0aWJvb3QtbmMKPiAKPiBCZWNhdXNlIHdlJ3JlIHVzaW5nIHRoZSAtYSAoYXV0
b2xvZ2luKSBmZWF0dXJlIG9mIGFnZXR0eSwgZXZlcnl0aGluZyBmcm9tICg0KSAKPiBkb3duIGlz
IHJ1bm5pbmcgYXMgcGV0aXR1c2VyLiBJZiB5b3Ugc2VsZWN0ICJkcm9wIHRvIHNoZWxsIiBmcm9t
IHRoZSBtZW51LCB5b3UgCj4gdGhlbiBhbHNvIGRvCj4gCj4gNy4gL2hvbWUvcGV0aXR1c2VyLy5z
aHJjICh0aGUgJEVOViBzZXQgaW4gLnByb2ZpbGUpCj4gOC4gL2Jpbi9zaAo+IAo+Pj4gSWYgc3Vk
byBpcyBpbnN0YWxsZWQsIHdpdGggYSBzdWRvZXJzIHBvbGljeSBhbGxvd2luZyBwZXRpdHVzZXIg
dG8KPj4+IHBlcmZvcm0gc3VkbyB3aXRoIG5vIHBhc3N3b3JkIChvciBhIGJsYW5rIHBhc3N3b3Jk
KSwgdGhlICJkcm9wIHRvIHNoZWxsIgo+Pj4gZmVhdHVyZSBvZiBwZXRpdGJvb3Qgd2lsbCBhdXRv
bWF0aWNhbGx5IGJlY29tZSBhIHJvb3Qgc2hlbGwuCj4+Cj4+IEl0IHNlZW1zIHRvIG1lIHRoYXQg
dGhlIGxvZ2ljYWwgdGhpbmcgdG8gZG8gd291bGQgYmUgdG8gZHJvcCBpbnRvIGFuIGFjdHVhbCAK
Pj4gZ2V0dHksIHdoaWNoIGFza3MgZm9yIGEgbG9naW4gYW5kIHBhc3N3b3JkLgo+IAo+IEF0IHRo
aXMgcG9pbnQgd2UncmUgYWxyZWFkeSBydW5uaW5nIGdldHR5IGFuZCAoYXV0bylsb2dnZWQgaW4g
YXMKPiBwZXRpdHVzZXIuIFRoZSBzdWRvIGludGVncmF0aW9uIGFsbG9zIHN5c3RlbS1zcGVjaWZp
YyBmbGV4aWJpbGl0eSBpbiBpZi9ob3cgdGhlIAo+IHRoZSBzaGVsbCBtYXkgYmUgZWxldmF0ZWQu
IEFzIHBldGl0dXNlciwgdGhlIHNoZWxsIGhhcyBwZXJtaXNzaW9uIHRvIGNvbGxlY3QgCj4gZGlh
Z25vc3RpY3MvbG9ncyBieSBydW5uaW5nIHBiLXNvcy4KCiAgSSdtIGFueXdheSB3cm9uZyAtIGdl
dHR5IG9yIGxvZ2luIGFyZSBub3Qgc2V0dWlkLCB0aGV5IG5lZWQgdG8gYmUgZXhlY3V0ZWQgYXMg
CnJvb3QsIHNvIHBldGl0dXNlciBjYW4ndCBzdGFydCB0aGVtLgoKPj4+IC0tLSBhL3BhY2thZ2Uv
cGV0aXRib290L1MxNXBiLWRpc2NvdmVyCj4+PiArKysgYi9wYWNrYWdlL3BldGl0Ym9vdC9TMTVw
Yi1kaXNjb3Zlcgo+Pj4gQEAgLTEyLDcgKzEyLDkgQEAgZmkKPj4+IMKgc3RhcnQoKSB7Cj4+PiDC
oMKgwqDCoCBwcmludGYgJ1N0YXJ0aW5nICVzOiAnICIkREFFTU9OIgo+Pj4gLcKgwqDCoCBta2Rp
ciAtcCAvdmFyL2xvZy9wZXRpdGJvb3QKPj4+ICvCoMKgwqAgIyBzaGVsbGNoZWNrIGRpc2FibGU9
U0MyMTc0ICMgb25seSBhcHBseSAtbSB0byBkZWVwZXN0IGRpcgo+Pj4gK8KgwqDCoCBta2RpciAt
cCAtbSAwNzc1IC92YXIvbG9nL3BldGl0Ym9vdAo+Pj4gK8KgwqDCoCBjaG93biByb290OnBldGl0
Z3JvdXAgL3Zhci9sb2cvcGV0aXRib290Cj4+Cj4+IFdoeSBpcyBpdCBvd25lZCBieSByb290IGFu
ZCBub3QgcGV0aXR1c2VyPwo+IAo+IEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gd2h5IGl0IGNvdWxk
bid0IGJlIG93bmVkIGJ5IHBldGl0dXNlci4KPiAKPj4+IEBAIC04NCw0ICs4OCwxMiBAQCBlbmRl
Zgo+Pj4gwqBQRVRJVEJPT1RfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBQRVRJVEJPT1Rf
UE9TVF9JTlNUQUxMCj4+PiArZGVmaW5lIFBFVElUQk9PVF9VU0VSUwo+Pj4gK8KgwqDCoCBwZXRp
dHVzZXIgLTEgcGV0aXRncm91cCAtMSAqIC9ob21lL3BldGl0dXNlciAvYmluL3NoIC0gcGV0aXRi
b290IHVzZXIKPj4KPj4gQXJlIHBldGl0Z3JvdXAgYW5kIHBldGl0dXNlciBzdGFuZGFyZCBuYW1l
cz8gSWYgbm90LCB3ZSBub3JtYWxseSB1c2UgdGhlIAo+PiBwYWNrYWdlIG5hbWUgYXMgdXNlcm5h
bWUgYW5kIGdyb3VwIG5hbWUsIGkuZS4KPj4KPj4gwqDCoMKgwqBwZXRpdGJvb3QgLTEgcGV0aXRi
b290IC0xIC4uLgo+IAo+IEkgdGhpbmsgd2UgY291bGQgY2hhbmdlIHBldGl0dXNlciB0byBwZXRp
dGJvb3QsIGJ1dCB0aGVyZSBpcyBhIGhhcmRjb2RlZCAKPiByZWZlcmVuY2UgdG8gcGV0aXRncm91
cCBpbiB0aGUgY29kZToKPiAKPiAgwqAgZGlzY292ZXIvZGlzY292ZXItc2VydmVyLmM6wqDCoMKg
wqAgZ3JvdXAgPSBnZXRncm5hbSgicGV0aXRncm91cCIpOwoKICBTb3VuZHMgbGlrZSBwZXRpdGdy
b3VwIGlzIGF0IGxlYXN0IGEgc3RhbmRhcmQgbmFtZSwgYW5kIGluIHRoYXQgY2FzZSBwZXRpdHVz
ZXIgCmZpdHMgbmljZWx5IChhbmQgSSBhc3N1bWUgaXQgaXMgYWxyZWFkeSB1c2VkIF9zb21ld2hl
cmVfIGF0IGxlYXN0KS4gU28gT0sgdG8gCmtlZXAgcGV0aXR1c2VyL3BldGl0Z3JvdXAuIFBsZWFz
ZSBzYXkgc29tZXRoaW5nIGFib3V0IHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIAood2Ugd2Fu
dCB0aGUgaGlzdG9yeSB0byBzaG93IHdoeSB3ZSBjaG9zZSAicGV0aXR1c2VyIiByYXRoZXIgdGhh
biB0aGUgbW9yZSAKdHlwaWNhbCAicGV0aXRib290IiBmb3IgdGhlIHVzZXJuYW1lKS4KCgo+Pj4g
K2RlZmluZSBQRVRJVEJPT1RfUEVSTUlTU0lPTlMKPj4+ICvCoMKgwqAgL3Zhci9wZXRpdGJvb3Qg
ZCA3NzUgcm9vdCBwZXRpdGdyb3VwIC0gLSAtIC0gLQoKICBHaXZlbiB0aGUgaW5mb3JtYXRpb24g
YmVsb3csIHdoeSBpcyBpdCBpbiBwZXRpdGdyb3VwPyBJZiBwYi1kaXNjb3ZlciBpcyBqdXN0IApn
b2luZyB0byBjcmVhdGUgZGlyZWN0b3JpZXMgdGhlcmUgb24gd2hpY2ggaXQgY2FuIG1vdW50IHRo
aW5ncywgaXQncyBub3QgdmVyeSAKdXNlZnVsIGZvciBwYi1jb25zb2xlIHRvIGhhdmUgd3JpdGUg
YWNjZXNzIHRvIGl0LCByaWdodD8gVW5sZXNzIHBiLWNvbnNvbGUgbmVlZHMgCnRvIGRlbGV0ZSB0
aG9zZSBkaXJlY3RvcmllcyBvciByZW5hbWUgdGhlbT8KCj4+Cj4+IFdoYXQgaXMgL3Zhci9wZXRp
dGJvb3QgdXNlZCBmb3I/Cj4gCj4gVGhhdCBpcyB3aGVyZSBwYi1kaXNjb3ZlciBtb3VudHMgZGV2
aWNlcywgbG9va2luZyBmb3IgYm9vdCBzb3VyY2VzOgo+IAo+ICDCoCAvdmFyL3BldGl0Ym9vdC9t
bnQvZGV2L252bWUwbjFwMS9ncnViMi9ncnViLmNmZwo+ICDCoCAvdmFyL3BldGl0Ym9vdC9tbnQv
ZGV2L252bWUwbjFwMS92bWxpbnV4CgogIENvdWxkIHlvdSBtZW50aW9uIHRoaXMgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIGFzIHdlbGw/CgogIFRoZSBjb21taXQgbWVzc2FnZSBpcyBnb2luZyB0byBn
cm93IHByZXR0eSBsYXJnZSwgYnV0IHRoYXQncyBmaW5lLgoKICBSZWdhcmRzLAogIEFybm91dAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
