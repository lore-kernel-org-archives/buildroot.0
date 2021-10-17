Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0F3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:45:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65DBF60F9E
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65DBF60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918EE400F6;
	Sun, 17 Oct 2021 15:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkAeQ2GcFIvf; Sun, 17 Oct 2021 15:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7FE4015E;
	Sun, 17 Oct 2021 15:45:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E98BB1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6645402B8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrcWWUr0BroN for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 15:45:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90994402A3
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 15:45:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w14so60156946edv.11
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8o5Y233Yd0YVdoE04YJyvaqA5hb9ybHyY9inIXcofN4=;
 b=Z3kwKk/4wrkFXPmIaIqurzdWZhczj6ibz7/HRTQO2xX4UwrDSynOatyTyOp56zJOTK
 8VOwYvdGBi/pmqFBqh/2ZmGooT1XboO2SwUEZIqRSLc10+wiptxJlRMiMZiTxo1d10SJ
 anGZe4n7ABUHDtQ5UxvjtG4ORFnn0obDA1dQxnxEV6HIak2YhusneCmGaF7Emk4qi8Wt
 EME1lWmxvEKHOiKQNMNq75uheV+NmMUNeoJwDVrnmvAokIOCq+cUrcx2ikzbIgbv/8ph
 vnG2+EYPLKMmx9yq62pXMRgTz/tH56Me5eqfybcGWH5fe+vjiy5oCMr1dXoY0XhZ5wZC
 kVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8o5Y233Yd0YVdoE04YJyvaqA5hb9ybHyY9inIXcofN4=;
 b=O9Dsz+uyR1thNP5WwCtp6C+Pcm2rfqPEIsd0FO9VnWk+g54LMPNuF2jEE6EdBR+jC7
 tzrmS8WCSTPQ+9Fvh0Ef3aQUnUwWM8+0vVe0dtN7xdNmMXba3QbIl1IEb9V9L4lp7RJt
 CQCqy+F6lBs55Uzt2yD6YSIl+1cQrDuM/E/58OJflnz/QMyWyFS3to+OfW1QWeBZ/drS
 FcBvNwjKk1KD3CWKu/ydE+6FMbCH6uK4HXAaZat2ZccMSgSo5j57a4w0YR3vvPQ2X/dR
 bTijTq2Csas6gDqdKuUQB+KC5ULuuDpGeC8ICcmp3p9kd+JdZzrsDF2ZbrXyLcAfPzfv
 brzQ==
X-Gm-Message-State: AOAM532xgfo4kuhO0l/veoYfnDUrCJr0oyu/0FwcZfzprASvt4oZCGA9
 NShjjPl7CWwYLK1Bv+JLS/OBVA==
X-Google-Smtp-Source: ABdhPJzVCGvTa3AhaSW5QT53ekQ/IuMiOhMJDFIblEaNicyPkCwPThUnmj+eOuhv+PJHR/wqxziIvg==
X-Received: by 2002:a17:906:4c4a:: with SMTP id
 d10mr22776618ejw.391.1634485505408; 
 Sun, 17 Oct 2021 08:45:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g2sm8483016edq.81.2021.10.17.08.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 08:45:04 -0700 (PDT)
Message-ID: <468e9f16-3fe2-69be-e962-bf5eb7349c35@mind.be>
Date: Sun, 17 Oct 2021 17:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>,
 buildroot@buildroot.org
References: <CA+eej5MX+5kes-LBQkjRVTFiEBm9N4TO5qyecu01vkT98fCYwg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+eej5MX+5kes-LBQkjRVTFiEBm9N4TO5qyecu01vkT98fCYwg@mail.gmail.com>
Subject: Re: [Buildroot] how can i implement my kernel module and debug it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8xMC8yMDIxIDE4OjU3LCBFc2HDr2UgTGVkb3V4IE5KT05HU1NJIEtPVUFNIHdyb3Rl
Ogo+IEhpIGV2ZXJ5b25lIC4KPiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UgLCAuLi4KPiAK
PiBJIHdhbnQgdG8ga25vdyBob3cgdG8gbG9hZCBteSBrZXJuZWwgbW9kdWxlLCBydW4gaXQgc2Vl
IHRoZXNlIHRyYWNlcyB1c2luZyBkbWVzZyAKPiBhbmQgZGVidWcgaXQuCj4gCj4gU28gLCBpIGhh
dmUgcmVhZCB0aGlzIHBhcnQgb2YgdGhlwqAgKG1hbnVhbCAKPiA8aHR0cHM6Ly9idWlsZHJvb3Qu
b3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjX2luZnJhc3RydWN0dXJlX2Zvcl9wYWNr
YWdlc19idWlsZGluZ19rZXJuZWxfbW9kdWxlcz4pIAo+ICwgYnV0IGkgZG9uJ3Qga25vdyBob3cg
dG8gdXNlIGl0IDoKPiAKPiB8IFdoYXQgeW91IG1heSBoYXZlIG5vdGljZWQgaXMgdGhhdCwgdW5s
aWtlIG90aGVyIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmVzLCB3ZSB8IAo+IGV4cGxpY2l0bHkgaW52
b2tlIGEgc2Vjb25kIGluZnJhc3RydWN0dXJlLiBUaGlzIGFsbG93cyBhIHBhY2thZ2UgdG8gYnVp
bGQgYSAKPiBrZXJuZWwgfCBtb2R1bGUsIGJ1dCBhbHNvLCBpZiBuZWVkZWQsIHVzZSBhbnkgb25l
IG9mIG90aGVyIHBhY2thZ2UgCj4gaW5mcmFzdHJ1Y3R1cmVzIHRvIHwgYnVpbGQgbm9ybWFsIHVz
ZXJsYW5kIGNvbXBvbmVudHMgKGxpYnJhcmllcywgZXhlY3V0YWJsZXPigKYpLiAKPiBVc2luZyB0
aGUgfGtlcm5lbC1tb2R1bGV8IGluZnJhc3RydWN0dXJlIG9uIGl0cyBvd24gaXMgbm90IHN1ZmZp
Y2llbnQ7IGFub3RoZXIgCj4gcGFja2FnZSBpbmZyYXN0cnVjdHVyZSAqbXVzdCogYmUgdXNlZC4K
PiAKPiBidXQgaW4gbXkgd2F5ICwgaSBoYXZlIHRyeSBzb21ldGhpbmcgOgo+IAo+IC0gQ29uZmln
LmluCj4gCj4gfGNvbmZpZyBCUjJfUEFDS0FHRV9LRVJORUxfTU9EVUxFIGJvb2wgImtlcm5lbF9t
b2R1bGUiIGRlcGVuZHMgb24gCj4gQlIyX0xJTlVYX0tFUk5FTCBoZWxwIExpbnV4IEtlcm5lbCBN
b2R1bGUgQ2hlYXQufAo+IAo+IC0gZXh0ZXJuYWwubWsgPGh0dHA6Ly9leHRlcm5hbC5taz4KPiAK
PiB8S0VSTkVMX01PRFVMRV9WRVJTSU9OID0gMS4wIEtFUk5FTF9NT0RVTEVfU0lURSA9IAo+ICQo
QlIyX0VYVEVSTkFMX0tFUk5FTF9NT0RVTEVfUEFUSCkgS0VSTkVMX01PRFVMRV9TSVRFX01FVEhP
RCA9IGxvY2FsICQoZXZhbCAKPiAkKGtlcm5lbC1tb2R1bGUpKSAkKGV2YWwgJChnZW5lcmljLXBh
Y2thZ2UpKQoKICBZb3UgY2FuJ3QgcHV0IHRoZSBwYWNrYWdlIC5tayBmaWxlIGRpcmVjdGx5IGlu
IGV4dGVybmFsLm1rLCBiZWNhdXNlIEJ1aWxkcm9vdCAKdXNlcyB0aGUgZGlyZWN0b3J5IG5hbWUg
dG8gZGVyaXZlIHRoZSBwYWNrYWdlIG5hbWUuIFNvIHlvdSBuZWVkOgoKZXh0ZXJuYWwubWs6Cmlu
Y2x1ZGUga2VybmVsLW1vZHVsZS9rZXJuZWwtbW9kdWxlLm1rCgprZXJuZWwtbW9kdWxlL2tlcm5l
bC1tb2R1bGUubWs6CktFUk5FTF9NT0RVTEVfVkVSU0lPTiA9IDEuMApLRVJORUxfTU9EVUxFX1NJ
VEUgPSAkKEJSMl9FWFRFUk5BTF9LRVJORUxfTU9EVUxFX1BBVEgpL2tlcm5lbC1tb2R1bGUKS0VS
TkVMX01PRFVMRV9TSVRFX01FVEhPRCA9IGxvY2FsCiQoZXZhbCAkKGtlcm5lbC1tb2R1bGUpKQok
KGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQoKCiAgWW91IHNob3VsZCBwcm9iYWJseSBhbHNvIGNo
b29zZSBhIGRpZmZlcmVudCBuYW1lIHRoYW4ga2VybmVsLW1vZHVsZSwgdGhlcmUncyBhIApyaXNr
IHRoYXQgdGhlcmUgaXMgc29tZSBzeW1ib2wgY29uZmxpY3Qgc29tZXdoZXJlLiBrZXJuZWwtbW9k
dWxlLXRlc3Qgb3IgCnNvbWV0aGluZyB3b3VsZCBkby4KCgo+IC0gTWFrZWZpbGUKPiAKPiB8b2Jq
LW0gKz0gJChhZGRzdWZmaXggLm8sICQobm90ZGlyICQoYmFzZW5hbWUgJCh3aWxkY2FyZCAKPiAk
KEJSMl9FWFRFUk5BTF9LRVJORUxfTU9EVUxFX1BBVEgpLyouYykpKSkgY2NmbGFncy15IDo9IC1E
REVCVUcgLWcgLXN0ZD1nbnU5OSAKPiAtV25vLWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAu
UEhPTlk6IGFsbCBjbGVhbiBhbGw6ICQoTUFLRSkgLUMgCj4gJyQoTElOVVhfRElSKScgTT0nJChQ
V0QpJyBtb2R1bGVzIGNsZWFuOiAkKE1BS0UpIC1DICckKExJTlVYX0RJUiknIE09JyQoUFdEKScg
Y2xlYW4KPiAKPiAtIGhlbGxvLmMKPiAKPiB8I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPiAjaW5j
bHVkZSA8bGludXgva2VybmVsLmg+IE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsgCj4gc3RhdGljIGlu
dCBteWluaXQodm9pZCkgeyBwcmludGsoS0VSTl9JTkZPICJoZWxsbyBpbml0XG4iKTsgcmV0dXJu
IDA7IH0gc3RhdGljIAo+IHZvaWQgbXlleGl0KHZvaWQpIHsgcHJpbnRrKEtFUk5fSU5GTyAiaGVs
bG8gZXhpdFxuIik7IH0gbW9kdWxlX2luaXQobXlpbml0KSAKPiBtb2R1bGVfZXhpdChteWV4aXQp
Cj4gCj4gfEFuZCBpbiB0aGUgdGVybWluYWwgOiB8fHx8Cj4gCj4gfG1ha2UgQlIyX0VYVEVSTkFM
PSIkKHB3ZCkvLi4va2VybmVsX21vZHVsZSIgcWVtdV94ODZfNjRfZGVmY29uZmlnIAo+IGVjaG8g
ICdCUjJfUEFDS0FHRV9LRVJORUxfTU9EVUxFPXknID4+IC5jb25maWcKPiBtYWtlIEJSMl9KTEVW
RUw9IiQoKCQobnByb2MpIC0gMikpIiBhbGwgCgogIERpZCB5b3Ugc2VlIGFueSBvdXRwdXQgYWJv
dXQgdGhlIGtlcm5lbCBtb2R1bGUgYmVpbmcgYnVpbHQ/IEkgZXhwZWN0IG5vdC4uLgoKICBCZWZv
cmUgY29udGludWluZyB3aXRoIHFlbXUsIGNoZWNrIHRoYXQgdGhlIGtlcm5lbCBtb2R1bGUgaGFz
IGluZGVlZCBiZWVuIApidWlsdCwgYW5kIGNoZWNrIGluIG91dHB1dC90YXJnZXQvbGliL21vZHVs
ZXMgaWYgaXQncyB0aGVyZS4KCgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gcWVtdS1zeXN0ZW0t
eDg2XzY0IC1NIHBjIC1rZXJuZWwgb3V0cHV0L2ltYWdlcy9iekltYWdlIC1kcml2ZSAKPiBmaWxl
PW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsaWY9dmlydGlvLGZvcm1hdD1yYXcgLWFwcGVuZCBy
b290PS9kZXYvdmRhIC1uZXQgCj4gbmljLG1vZGVsPXZpcnRpbyAtbmV0IHVzZXIKPiAKPiAKPiB8
Cj4gCj4gfE9uIHFlbXUgOgo+IHwKPiAKPiB8bW9kcHJvYmUgaGVsbG8KPiBtb2Rwcm9iZTogbW9k
dWxlIGhlbGxvIG5vdCBmb3VuZCBpbiBtb2R1bGVzLmRlcAo+IAo+IHwKPiAKPiB8aG93IGNhbiBp
IHNvbHZlIGl0ID8/Cj4gfAo+IAo+IHxwbGVhc2UgaSBuZWVkIHlvdXIgaGVscAo+IHwKPiAKPiB8
Cj4gfAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
