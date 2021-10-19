Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD77C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15D46128B
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E15D46128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CFCC6065F;
	Tue, 19 Oct 2021 19:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzO_HW8m3UAO; Tue, 19 Oct 2021 19:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D476E60683;
	Tue, 19 Oct 2021 19:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B439D1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3722401FA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4ODaGVsBToJ for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 19:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CC594017B
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 19:01:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a25so16453910edx.8
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ktAOA8ywSA8PlwwoNkoc9/l0cNz18As0FBdifxo8KL4=;
 b=Gl6SAuN3hldHxQr/7sEpzybgRjovKbc6DvvPEY/AedAxr5fH/5ogA3qhvvh/L/nPFT
 uexIK5ZXeNG+4V3RMAwqkDV+bRfB9ThDvA51N0Lp5yJfgAvC5azJk+5w/FJmVzGUfVOQ
 F45AKKS6rRoahD5csBddF7wWOKq9V3+dsimaMOVn7ynlBQyeqR7v5o0rhYJ7X1fUJuAE
 UCAL+j+eFbt4O3aeRh8dB0//5VBMRugETJoW9A9qsMgefp1C6Hde8XAl14C5soqkGekd
 5Ib3H6v6AS/ZgNBTIKAkaRYTCn/owYm9zXiXXjj90frc5R/tRetNQm1n4iDAt0opOgxA
 ynzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ktAOA8ywSA8PlwwoNkoc9/l0cNz18As0FBdifxo8KL4=;
 b=EvlrjtZ65gljhUJvaPTEQhbW46i+w+SXqPdwo4quHud3UM2yP7h6p/s9R4f0eFJr7c
 YMEO3QSfSu+abC/6bQud0Qh1v3TyqoCNfD39Qz4pQXQ/30ZIFWJvmysH0gpuHTVxdaMg
 EZPSP+jA/yuR6EZ1je95ca0WgrXkWy4OIQpkiy52Pq34y7xPiWHWFRGs4T6ru/oQQ0MT
 +xiQvTzLxjLk8GkGHqrmNrO6WEC+tCbM370JFpGD1n3T9R21w4O6RtfOvJKdiOsMpYdl
 7sElDegRUarzxSvEWurkQRXTQA43gEvQU4vURfPGlvaXKDDbNziaJrBzRgRCDXG4LiFH
 9PfA==
X-Gm-Message-State: AOAM5329kFtA1Bw2+ssth818lAPV8eVVyVnYqYlC2HR4jWn4XFIJ0yrN
 gfie5CxSNbGUX5cwM/ATmXeN7g==
X-Google-Smtp-Source: ABdhPJwyORj4sXtx7WDmRoMLVpmOtLhdUIcM4oDfWZyvs5k5vtlBBlMI5oxXap07aG0+ZcZ3gQrkMQ==
X-Received: by 2002:a17:907:987b:: with SMTP id
 ko27mr39949126ejc.130.1634670086591; 
 Tue, 19 Oct 2021 12:01:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v9sm10447762ejw.22.2021.10.19.12.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 12:01:26 -0700 (PDT)
Message-ID: <3b977617-5e9a-c874-6355-72fe81f8da38@mind.be>
Date: Tue, 19 Oct 2021 21:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <A62E77A0-E4CC-409B-A64B-0B0AADAFB933@benettiengineering.com>
 <3ABFFAEE-644C-4CB8-8B04-1F28AD3CBFC1@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <3ABFFAEE-644C-4CB8-8B04-1F28AD3CBFC1@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix parallel build
 failure
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8xMC8yMDIxIDE5OjU5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBPcuKApgo+IAo+
PiBJbCBnaW9ybm8gMTkgb3R0IDIwMjEsIGFsbGUgb3JlIDE5OjQwLCBHaXVsaW8gQmVuZXR0aSAK
Pj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0dG86Cj4+
Cj4+IO+7v0hpIEFybm91dCwKPj4KPj4+IElsIGdpb3JubyA2IG90dCAyMDIxLCBhbGxlIG9yZSAy
MToyMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiAKPj4+IGhhIHNjcml0
dG86Cj4+Pgo+Pj4g77u/Cj4+Pgo+Pj4gT24gMjIvMDkvMjAyMSAwMTo1OSwgR2l1bGlvIEJlbmV0
dGkgd3JvdGU6Cgpbc25pcF0KPj4+PiArKy5OT1RQQVJBTExFTDogJCgxKQo+Pj4KPj4+IFRoaXMg
ZG9lc24ndCBtYWtlIGEgd2hvbGUgbG90IG9mIHNlbnNlOiAuTk9UUEFSQUxMRUwgaXMgc29tZXRo
aW5nIHRoYXQgCj4+PiBhcHBsaWVzIHRvIHRoZSBNYWtlZmlsZSBhcyBhIHdob2xlLCBub3QgdG8g
b25lIHNwZWNpZmljIHRhcmdldC4gSSBoYXZlbid0IAo+Pj4gbG9va2VkIGluIGFueSBkZXB0aCBp
biB0aGUgbGlibnNzIGJ1aWxkIHN5c3RlbSwgYnV0IHVubGVzcyBpdCBidWlsZHMgCj4+PiByZWN1
cnNpdmVseSwgYWRkaW5nIHRoaXMgaXMgZXhhY3RseSBlcXVpdmFsZW50IHRvIGFkZGluZwo+Pj4K
Pj4+IC5OT1RQQVJBTExFTDoKPj4KPj4gQXMgSeKAmXZlIHRlc3RlZCBpdOKAmXMgbm90IGxpa2Ug
dGhpcy4KPj4KPj4gSSByZWFkIHRoaXMgZnJvbSBbMV06Cj4+IOKAmOKAmeKAmQo+PiB8Lk5PVFBB
UkFMTEVMfAo+Pgo+PiAgICAgSWYgfC5OT1RQQVJBTExFTHzCoGlzIG1lbnRpb25lZCBhcyBhIHRh
cmdldCwgdGhlbiB0aGlzIGludm9jYXRpb24gb2YKPj4gICAgIHxtYWtlfMKgd2lsbCBiZSBydW4g
c2VyaWFsbHksIGV2ZW4gaWYgdGhlIOKAmC1q4oCZIG9wdGlvbiBpcyBnaXZlbi4gQW55Cj4+ICAg
ICByZWN1cnNpdmVseSBpbnZva2VkIHxtYWtlfMKgY29tbWFuZCB3aWxsIHN0aWxsIHJ1biByZWNp
cGVzIGluIHBhcmFsbGVsCj4+ICAgICAodW5sZXNzIGl0cyBtYWtlZmlsZSBhbHNvIGNvbnRhaW5z
IHRoaXMgdGFyZ2V0KS4gQW55IHByZXJlcXVpc2l0ZXMgb24gdGhpcwo+PiAgICAgdGFyZ2V0IGFy
ZSBpZ25vcmVkLgo+Pgo+PiDigJjigJnigJkKPj4KPj4gVGhleSB0YWxrIGFib3V0IHRhcmdldCBh
bmQgaXQgaXMgd2hhdCBJIGV4cGVyaWVuY2UuCj4+IEl04oCZcyBhIGJpdCBhbWJpZ3VvdXMgaG9u
ZXN0bHkuIAoKInRhcmdldCIgaXMgdGhlIHRoaW5nIG9uIHRoZSBsZWZ0LWhhbmQgc2lkZSBvZiBh
IGNvbG9uLiBTbyBpbgoKLk5PVFBBUkFMTEVMOiAlLmJtcAoKdGhlIHRhcmdldCBpcyAuTk9UUEFS
QUxMRUwuIE15IHBvaW50IGlzIHRoYXQgdGhlIHRoaW5nIG9uIHRoZSByaWdodC1oYW5kIHNpZGUg
b2YgCnRoZSBjb2xvbiBpcyBpZ25vcmVkLiBJdCBtYWtlcyBubyBkaWZmZXJlbmNlIGF0IGFsbCBp
ZiB5b3UgcHV0ICUuYm1wIHRoZXJlLCBvciAKYmxhYmxhYmxhIC0gd2hlbiB5b3UgdXNlIHRoYXQg
TWFrZWZpbGUsIHRoZSAtaiBvcHRpb24gd2lsbCBiZSBpZ25vcmVkLgoKU28gd2hhdCB5b3UncmUg
ZG9pbmcgaXMgdGhhdCB5b3UgbWFrZSB0aGUgd2hvbGUgdGhpbmcgbm90IHJ1biBpbiBwYXJhbGxl
bCwgbm90IApqdXN0IHRoZSBidWlsZCBvZiB3aGF0ZXZlciB5b3UgcHV0IG9uIHRoZSByaWdodC1o
YW5kIHNpZGUuCgoKPj4gSW4gdGhlIHBhc3QgSeKAmXZlIGFsc28KPj4gZXhwZXJpZW5jZWQgaXQg
b24gYSBiaWcgTWFrZWZpbGUgd2hlcmUgSSBoYWQgLmJtcCBmaWxlcyB0byBiZSBjb252ZXJ0ZWQg
d2l0aCAKPj4geHhkIGFuZCB0aGF0IGdhdmUgcGFyYWxsZWwgcHJvYmxlbXMuIFNvIEnigJl2ZSB0
YWdnZWQgaXQgbGlrZToKPj4KPj4gLk5PVFBBUkFMTEVMOiAlLmJtcAo+Pgo+PiBhbmQgdGhhdCBz
b2x2ZWQgdGhlIHByb2JsZW0uCj4gCj4g4oCmaXQgaXMgYmVjYXVzZSBpbiBib3RoIGNhc2VzIHRo
ZXkgYXJlIGNhbGxlZCByZWN1cnNpdmVseS4KCiAgQmVjYXVzZSBpdCBpcyBjYWxsZWQgcmVjdXJz
aXZlbHksIHRoZSBoaWdoZXItbGV2ZWwgbWFrZSBpbnZvY2F0aW9ucyBhcmUgaW5kZWVkIApzdGls
bCBydW4gaW4gcGFyYWxsZWwuCgogIFRoZXJlZm9yZSwgaW5kZWVkLCBpdCBkb2VzIG1ha2Ugc2Vu
c2UgdG8gcHV0IGl0IGluc2lkZSB0aGUgbWFjcm8uCgogIEJ1dCBpdCBkb2Vzbid0IG1ha2Ugc2Vu
c2UgdG8gYWRkIGEgcmlnaHQtaGFuZCBzaWRlLgoKICBBbnl3YXksIHNpbmNlIGl0J3MgYmVlbiBh
cHBsaWVkIHVwc3RyZWFtLCB3ZSBjYW4ganVzdCBpZ25vcmUgdGhlIGlzc3VlLgoKICBSZWdhcmRz
LAogIEFybm91dAoKCj4gCj4gR2l1bGlvCj4gCj4+Cj4+IEFsc28gdGhleSBoYXZlIGp1c3QgdXBz
dHJlYW1lZCB0aGUgcGF0Y2ggWzJdLCBzbwo+PiB3ZSBjYW4gdGVzdCBpZiBpdCB3b3JrcyBjb21t
aXR0aW5nIHRoaXMgcGF0Y2ggb3IKPj4gYnkgYnVtcGluZyBuZXh0IHZlcnNpb24uCj4+Cj4+IFRo
ZW4gaXTigJlzIHVwIHRvIHlvdSA6LSkKPj4KPj4gQmVzdCByZWdhcmRzCj4+IEdpdWxpbyBCZW5l
dHRpCj4+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4+Cj4+IFsxXTogaHR0cHM6Ly93d3cuZ251
Lm9yZy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1sX25vZGUvU3BlY2lhbC1UYXJnZXRzLmh0bWwg
Cj4+IDxodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL21ha2UvbWFudWFsL2h0bWxfbm9kZS9T
cGVjaWFsLVRhcmdldHMuaHRtbD4KPj4gWzJdOiBodHRwczovL2J1Z3ppbGxhLm1vemlsbGEub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xNzMxOTExIAo+PiA8aHR0cHM6Ly9idWd6aWxsYS5tb3ppbGxhLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTczMTkxMT4KPj4KPj4+Cj4+PiBhbnl3aGVyZSBpbiB0aGUgTWFr
ZWZpbGVzLiBUaGlzIGlzIEJUVyB3aGF0IHdlIGRvIGluIEJ1aWxkcm9vdC4KPj4+Cj4+PiBBbmQg
aW4gdGhlIGVuZCwgdGhhdCdzIHRoZSBzYW1lIGFzIGNhbGxpbmcgJChNQUtFMSkgZnJvbSBCdWls
ZHJvb3QsIHNvIAo+Pj4gcGF0Y2hpbmcgaXMgbm90IHJlYWxseSBuZWVkZWQuCj4+Pgo+Pj4gSWYg
eW91IHdhbnQgdG8gYmUgYSBsaXR0bGUgc21hcnRlciwgeW91IHdpbGwgaGF2ZSB0byBtYW51YWxs
eSAidW5yb2xsIiB0aGUgCj4+PiBkZXBlbmRlbmN5LCBsaWtlOgo+Pj4KPj4+ICQoMSk6IHwgJCgz
KS9kCj4+PiDCoCDCoCQkKGZvcmVhY2ggdGd0LCQoMiksJChNQUtFKSAkKDMpLyQkKCQodGd0KSkp
Cj4+Pgo+Pj4gKGNoYW5jZXMgYXJlIEkgbWFkZSBzb21lIG1ham9yIG1pc3Rha2UgaW4gdGhpcyB0
aGluZykuCj4+Pgo+Pj4gT3IgaWYgaXQgZG9lcyBidWlsZCByZWN1cnNpdmVseSwgeW91IGNhbiBw
cm9iYWJseSBjb25kaXRpb25hbGx5IGFkZCAKPj4+IC5OT1RQQVJBTExFTCBpbiBzb21lIHNtYXJ0
IHdheS4KPj4+Cj4+PiBBbnl3YXksIEkndmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgQ2hhbmdlZCBS
ZXF1ZXN0ZWQuCj4+Pgo+Pj4gUmVnYXJkcywKPj4+IEFybm91dAo+Pj4KPj4+Cj4+Pj4gKyBlbmRp
Zgo+Pj4+ICsgZWxzZQo+Pj4+ICsgJCgxKToKPj4+PiArLS0KPj4+PiArMi4yNS4xCj4+Pj4gKwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
