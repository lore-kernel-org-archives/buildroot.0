Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C4DC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 22:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E6460C31;
	Sat,  9 Dec 2023 22:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E6460C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_qU8fyJeTdY; Sat,  9 Dec 2023 22:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B054760B26;
	Sat,  9 Dec 2023 22:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B054760B26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0A21BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 22:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67E3960B25
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 22:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E3960B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zji4IMn00PdU for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 22:58:52 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F37D260B1B
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 22:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F37D260B1B
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54ca43031d1so3024925a12.0
 for <buildroot@buildroot.org>; Sat, 09 Dec 2023 14:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702162730; x=1702767530;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fI4VKkseAjnLSZn+0Yd7V+9CxQkB53uDzC2NjA9Bivw=;
 b=MmxF+PQyrAYd2w8+cF4mmjPCCwdjyupZDIeByVPMBiYmm5AdmXcpfhxblx1LURUX2L
 mEPh8Hu0maYYbKhPSLDbReZUvlktIy643QWiorvDEdGIQ4VtR/9E5v6fg/iAO39hEr6I
 sF83oFTebd/4X9jvx7nP7Um5A1wFHl7x4Olnz/Si6ULxCjAO0SWxZhny689952bdiV1G
 FtTjy+8vpehbFqKuYJPfCCmuG5sZWPmyYp9W5iz8crdY7SDp+/gafmfErm/NoXOk3tgv
 FQTfF4/q6c/snW0DTKV2S5lA767Z7uBpCSwAHP+eo6QGgxiSCn0QnmK7AL5UFNOl2njv
 Kg+Q==
X-Gm-Message-State: AOJu0YwCh6EWxt/0ncTkCuyrV9/rE4gl1EZpwVx9slQX/AXVYjfWEVI1
 w9R5xBVDaVTNtLcsPIIQgifZyG3aolKnw1G8OjA=
X-Google-Smtp-Source: AGHT+IFWjUmmyi7absp5W3pPxCdrSMyfTUgrZq5anukwNewUyCo3TAUsMdcZdOI+Y2iI/mFd2CIzzg==
X-Received: by 2002:a50:d54c:0:b0:54c:e59e:aa69 with SMTP id
 f12-20020a50d54c000000b0054ce59eaa69mr1457797edj.12.1702162729869; 
 Sat, 09 Dec 2023 14:58:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a50a45a000000b0054ca16087ebsm2125910edb.80.2023.12.09.14.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 14:58:49 -0800 (PST)
Message-ID: <3ac4d88c-4e69-4a64-b2ca-ceff46d3c7dd@mind.be>
Date: Sat, 9 Dec 2023 23:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: John Langholz <jlangholzj@gmail.com>, buildroot@buildroot.org
References: <CAPL9kM2QC4aXUyMe2HX5MQNR0U=8jDK_=0Eopjq_nGUL3ScVGw@mail.gmail.com>
In-Reply-To: <CAPL9kM2QC4aXUyMe2HX5MQNR0U=8jDK_=0Eopjq_nGUL3ScVGw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1702162730; x=1702767530; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fI4VKkseAjnLSZn+0Yd7V+9CxQkB53uDzC2NjA9Bivw=;
 b=KLEyWfIb6X4Rg0Zy2f6JKtgDrkrFpIe9IkjYe+Y3CbtOwC1zoOOu511KI0AnXYYxrj
 2/TIGn6AXcleAaRcIeLlHoqrNrbsDNDyuCzPr/yrVpMzi9LFJEUt2uJ7dT3FBxdEhT9n
 jIrVOmuskvSCCit7hhaHrHfJIoWKK2piWFwGsyb+nFVzJ7QNlkx4GrBzLFtV1wMlCLIM
 kVCpm9mYc5Nc+drVVaEoXRiYaTAPuZD3R7Ui/CGWi6rg6c47FNDSzxWJ8HuU7zyc7uGh
 I5b1JBTdkSzrZano44EK6GtzJlk6LzFxSLEn5G2SKpK/0LLxqjXotshW+hDD9quiGgq0
 PpWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KLEyWfIb
Subject: Re: [Buildroot] python and tkinter
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

CgpPbiAwMi8xMi8yMDIzIDE5OjQxLCBKb2huIExhbmdob2x6IHdyb3RlOgo+IEkndmUgYmVlbiB3
b3JraW5nIG9uIG1ha2luZyBhbiBpbWFnZSBmb3IgYSByYXNwYmVycnkgcGkgKHNwZWNpZmljYWxs
eSwgYSBDTTQpIAo+IGFuZCBoYXZlIGhpdCBhIGJpdCBvZiBhIHJvYWRibG9jayB3aXRoIHB5dGhv
biBhbmQgdGtpbnRlci4gSSd2ZSBiZWVuIGFibGUgdG8gCj4gaW5jbHVkZSBzb21lIGFkZGl0aW9u
YWwgZXh0ZXJuYWwgbW9kdWxlcyBhbmQgdmVyaWZpZWQgdGhleSB3b3JrIGluIGEgcHl0aG9uIAo+
IHNoZWxsIGJ1dCBJJ3ZlIGJlZW4gaGF2aW5nIGlzc3VlcyBnZXR0aW5nIHRraW50ZXIgdG8gd29y
ayBhcHByb3ByaWF0ZWx5LiBXaGVuIAo+IEknbSBpbiBhIHB5dGhvbiBzaGVsbCBhbmQgdHJ5ICJp
bXBvcnQgdGtpbnRlciIgaXQgdGhyb3dzIGEgdHJhY2ViYWNrIGVycm9yOgo+IAo+IHxUcmFjZWJh
Y2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6IEZpbGUg4oCcPHN0ZGluPuKAnSwgbGluZSAxLCBp
biA8bW9kdWxlPiBGaWxlIAo+IOKAnC91c3IvbGliL3B5dGhvbjMxMS90a2ludGVyL19faW5pdF9f
LnB54oCdLCBsaW5lIDM4IGluIDxtb2R1bGU+IAo+IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1v
ZHVsZSBuYW1lZCDigJhfdGtpbnRlcuKAmSB8CgogIHRraW50ZXIucHkgaXMgYWx3YXlzIGluc3Rh
bGxlZCwgYnV0IGl0IHNpbXBseSB0cmllcyB0byBpbXBvcnQgdGhlIF90a2ludGVyLnNvIApzaGFy
ZWQgb2JqZWN0IGZpbGUuIFNpbmNlIHdlIHBhc3MgLS1kaXNhYmxlLXRrIGluIHRoZSBjb25maWd1
cmF0aW9uIG9mIHB5dGhvbjMsIAp0aGlzIHNoYXJlZCBvYmplY3QgZmlsZSBkb2Vzbid0IGV4aXN0
LgoKPiAKPiBJIHVuZGVyc3RhbmQgd2hhdCB0aGUgZXJyb3IgaXRzZWxmIG1lYW5zICh0aGF0IGl0
IGNhbid0IGZpbmQgdGhlIHRraW50ZXIgbW9kdWxlKSAKPiBidXQgSSdkIGxpa2UgdG8gZmlndXJl
IG91dCB3aHkgdGhpcyBpc24ndCBnZXR0aW5nIGluY2x1ZGVkIGluIHRoZSBidWlsZC4gRnJvbSBt
eSAKPiB1bmRlcnN0YW5kaW5nLCBieSBkZWZhdWx0IHRoZSBvcHRpb24gZm9yIHRraW50ZXIgd2Fz
IGRpc2FibGVkIGluIHRoZSAKPiB8L3BhY2thZ2VzL3B5dGhvbjMvcHl0aG9uLm1rIDxodHRwOi8v
cHl0aG9uLm1rPnwgZmlsZS4gSSBjaGFuZ2VkIGFsbCB0aGUgCj4gfC0tZGlzYWJsZSB0a3wgc3Rh
dGVtZW50cyB0byB8LS1lbmFibGUgdGt8LiBJIGFkZGl0aW9uYWxseSBlbnN1cmVkIHRoZSB0Y2wg
YW5kIAo+IHRrIHRhcmdldCBwYWNrYWdlcyAodW5kZXIgIkxhbmd1YWdlIGludGVycHJldGVyIiBh
bmQgImdyYXBoaWNhbCBpbnRlcmZhY2UiLCAKPiByZXNwZWN0aXZlbHkpIHdlcmUgaW5jbHVkZWQu
CgogIFlvdSdsbCBhbHNvIG5lZWQgdG8gYWRkIGEgZGVwZW5kZW5jeSB0byBweXRob24ubWssIHRv
IG1ha2Ugc3VyZSB0ayBpcyBidWlsdCAKYmVmb3JlIHB5dGhvbi4KCiAgSG93ZXZlciwgaWYgbm8g
b3B0aW9uIHdhcyBhZGRlZCB0byBlbmFibGUgdGtpbnRlciwgdGhlbiBwZXJoYXBzIHRoYXQncyBi
ZWNhdXNlIApub2JvZHkgaGFzIGdvdHRlbiBpdCB0byB3b3JrIHVwIHRpbGwgbm93Li4uCgo+IAo+
IEkgdmVyaWZpZWQgaW4gdGhlIGZsYXNoZWQgaW1hZ2UgdGhhdCB1bmRlciB8L3Vzci8uLi4uL3B5
dGhvbjMuMTEvfCB0aGVyZSBpcyBhIAo+IHRraW50ZXIgZm9sZGVyIHRoYXQgaGFzIGFuIHxfX2lu
aXRfXy5weXwgc2NyaXB0IGFzIGV4cGVjdGVkICh3aGljaCBiYXNlZCBvbiB0aGUgCj4gY2FsbGJh
Y2sgZXJyb3IgaXQncyBmaW5kaW5nKS4gVGhlIGV4aXN0ZW5jZSBvZiB0aGUgCj4gfC91c3IvLi4u
Li9weXRob24zLjExL3RraW50ZXJ8IGZvbGRlciBsZWFkcyBtZSB0byBiZWxpZXZlIHRoYXQgdGtp
bnRlciBpcyBiZWluZyAKPiBhZGRlZC9idWlsdCB3aXRoIHB5dGhvbiBidXQgdGhlcmUncyBzb21l
dGhpbmcgZWxzZSB3aXRoIHRoZSBjb25maWd1cmF0aW9uIHRoYXQncyAKPiBub3QgY29ycmVjdC4K
CiAgV2VsbCwgdGhlIGN1cnJlbnQgLS1kaXNhYmxlLXRrIG9wdGlvbiBpcyBhIGJpdCBvZiBhIGhh
Y2s6IGl0IHN0aWxsIGluc3RhbGxzIAp0aGUgdGtpbnRlciBmb2xkZXIgYnV0IHRoZSBzaGFyZWQg
b2JqZWN0IGZpbGUgaXMgbWlzc2luZy4KCiAgSSB0aGluayB0aGlzIHdpbGwgYmUgInNvbHZlZCIg
d2hlbiB3ZSBnbyB0byBweXRob24gMy4xMiwgaW4gdGhhdCB0aGVyZSB3aWxsIApub3QgYmUgYSB0
a2ludGVyIGZvbGRlciBhdCBhbGwuIEJ1dCB0aGF0IGRvZXNuJ3QgaGVscCB5b3Ugb2YgY291cnNl
IDotKQoKCj4gU2VhcmNoaW5nIHRoZSBhcmNoaXZlcyBhbmQgYXJvdW5kIHRoZSBpbnRlcm5ldCwg
SSBmb3VuZCBhIGZldyBvdGhlciBtZW50aW9ucyBvZiAKPiBhIHNpbWlsYXIgaXNzdWUgdGhhdCB3
ZXJlIHJlc29sdmVkIHdpdGggdmFyaW91cyBwYXRjaGVzLiBJIGNyZWF0ZWQgYSBnbG9iYWwgCj4g
cGF0Y2ggZm9sZGVyIG9uZSBsZXZlbCB1cCAob3V0c2lkZSkgb2YgbXkgYnVpbGRyb290IGRpciBh
bmQgY29uZmlndXJlZCB0aGUgCj4gZ2xvYmFsIHBhdGNoIGRpcmVjdG9yeSBpbiB0aGUgbWFrZW1l
bnUuIEkgdHJpZWQgaW5jbHVkaW5nIHRoZSBwYXRjaGVzIGluIGEgCj4gIi9weXRob24zLyIgZGly
ZWN0b3J5IHdpdGhpbiB0aGUgZ2xvYmFsIHBhdGNoIGRpciBidXQgSSd2ZSBub3QgaGFkIHBvc2l0
aXZlIAo+IHJlc3VsdHMgd2l0aCB0aG9zZSBlaXRoZXIuCj4gCj4gVGhpcyBpcyBhbGwgYSBsb25n
IHdheSBvZiBzYXlpbmcgdGhhdCBJIGZlZWwgSSdtIG1pc3Npbmcgc29tZXRoaW5nICpzaW1wbGUq
IGhlcmUgCj4gYnV0IGZvciB0aGUgbGlmZSBvZiBtZSBJIGNhbid0IGZpZ3VyZSBvdXQgd2hhdC4g
QW55IHN1Z2dlc3Rpb25zPwoKICBJdCBpcyBwcm9iYWJseSBub3Qgc2ltcGxlIHRvIGJ1aWxkIHRr
aW50ZXIuLi4gQWx0aG91Z2guLi4gSSBqdXN0IHRyaWVkIGEgYnVpbGQgCndpdGggLS1lbmFibGUt
dGsgYW5kIHdpdGggdGsgYWRkZWQgdG8gUFlUSE9OM19ERVBFTkRFTkNJRVMsIGFuZCBJIGRvIGdl
dCBhIAovdXNyL2xpYi9weXRob24zLjExL2xpYi1keW5sb2FkL190a2ludGVyLmNweXRob24tMzEx
LXg4Nl82NC1saW51eC1nbnUuc28gLSBJIApoYXZlIG5vdCB0cmllZCBpbXBvcnRpbmcgaXQsIGJ1
dCBJIGRvbid0IHNlZSB3aHkgaXQgc2hvdWxkbid0IHdvcmsuLi4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
