Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD45C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:41:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA22061372
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA22061372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D9BF40193;
	Wed, 20 Oct 2021 12:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIQ37FPD1oiS; Wed, 20 Oct 2021 12:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63609401B1;
	Wed, 20 Oct 2021 12:41:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 138F21BF951
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 019DE401B1
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tf_RFFMv3dcm for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:41:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C0D40193
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:41:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r4so18656220edi.5
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dx78K/yROH+PlWE4Yf5883uSkBjoEiQnljBoHQhzMOQ=;
 b=B7aPp/rynm0AzDohz6s99+t86mkYoLZ0cxVUH0bMFufPMyQjCWv3WE6s8XbaTqigkA
 DTZsH9ajS/+CAV1P/llSs6Px5sbvA0U4+2ZyFieSGHzu6MatX1CLY694xrdRDRWuoIWm
 F4SSzTpr6U8t05PbCLqMgiDC6idJfoyvaWk0hPTX0zRDFj36/Vj3p1o3OolUhN0bQHJd
 aNB3bRF8b+3V0HuklcoUJ7OPPN+aeegQLcxg8x3/kvVRgYC9nt3ZVFM7pCOqfN1mooa+
 3aE8KGOahbJ86DSthd0fC5uOZmX7xnDMsXG/6IdcknLU05uam7HuBd5wQ9Eh4SYz2Z0D
 LkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dx78K/yROH+PlWE4Yf5883uSkBjoEiQnljBoHQhzMOQ=;
 b=mbvQSwldHmivzlRjj9HmakTiO2uDBbtgIEcJfbtONyzAplSq1vYlMu+IDj+SGZxLQy
 f/+SrSuF6cUvjs5e9GIgkiVd0cK59J/XG5exokkfMD+wdv7lH+QGKadFOXjdjEZO3BC2
 i/sK2owAPypqoCW2p/Bv4hDcwfytr0z/UjNWjZD1Ns8sAPb7CqT9GxSZX8LarHIdkLzI
 v7vL37zb2F0jRPufjPlccSdknjoBJPO54EYRAA0bpdApZ9ckcoUCJD6bvgwP1XX2bl4/
 FH1Px7/XEagKJ8QgZHK5E5P7MVu/3NHCORd3pR/Q8x652BEOyd0HgLO10DVJ5yYfJ6uo
 1K4Q==
X-Gm-Message-State: AOAM530rQNZgTP6Tf6B4tj7FfYEFE0Xc6sluxMZhTZhCIhCFn2l5hrlo
 oLaK58E1sEprCPj11UJstzhxbB3xwgYsvRKy
X-Google-Smtp-Source: ABdhPJyRFGhtM9rfSWePOOykisp0TRoh4Xdx0lt4N0VtE6oS7DjBwGOs5Oz9PHIoMxQb8ulyWQZTtg==
X-Received: by 2002:a50:ce4e:: with SMTP id k14mr18464178edj.269.1634733647260; 
 Wed, 20 Oct 2021 05:40:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q2sm1020252eje.118.2021.10.20.05.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 05:40:46 -0700 (PDT)
Message-ID: <52787ac7-f1cc-1c34-f8b3-03cda8a7d458@mind.be>
Date: Wed, 20 Oct 2021 14:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Steve <sleepy_dog@gmx.de>
References: <trinity-072a3cc2-e02b-45ac-9f17-5037678caabf-1634728973216@3c-app-gmx-bap28>
 <107f4e64-9a30-0b86-48fc-769cf12976b8@mind.be>
 <trinity-925a029f-87a5-4638-b533-9c4c46e363cc-1634732988358@3c-app-gmx-bap28>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <trinity-925a029f-87a5-4638-b533-9c4c46e363cc-1634732988358@3c-app-gmx-bap28>
Subject: Re: [Buildroot] htop - "No btime in /proc/stat: Success"
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMC8xMC8yMDIxIDE0OjI5LCBTdGV2ZSB3cm90ZToKPiAgPiBJcyAvcHJvYyBtb3VudGVk
Pwo+IGlmICJtb3VudCIgb3V0cHV0dGluZyBhIGxpbmUsIGFtb25nIG90aGVycywgc2F5aW5nICJw
cm9jIG9uIC9wcm9jIHR5cGUgcHJvYyAKPiAocncscmVsYXRpbWUpIiBtZWFucyB0aGF0LCB0aGVu
IHllcwo+IAo+ICA+IFdoYXQgaXMgdGhlIGNvbnRlbnRzIG9mIC9wcm9jL3N0YXQ/Cj4gCj4gIyBj
YXQgL3Byb2Mvc3RhdAo+IGNwdSDCoDc1IDAgOTE3IDM2MzE0NzQgNDcgMCA0IDAgMCAwCj4gY3B1
MCAyNiAwIDMzNiA5MDc4NzIgMSAwIDIgMCAwIDAKPiBjcHUxIDIzIDAgNTM2IDkwNzI0MSAxNyAw
IDAgMCAwIDAKPiBjcHUyIDE5IDAgMjIgOTA4MjQyIDcgMCAwIDAgMCAwCj4gY3B1MyA3IDAgMjMg
OTA4MTE3IDIxIDAgMiAwIDAgMAo+IGludHIgMTIzNTU2IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgMCAwIDAgMTY5IDIyNzUgMCAzIDAgMCAwIDAgMCAwIDAgMCAwIAo+IDAgMCAwIDAg
MCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDYwIDEgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAg
MCAwIDY0NCAwIDAgMCAwIAo+IDAgMCAwIDAgNTUzIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAg
MCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgCj4gMCAwIDAgMjU3IDQ1
MDQ2IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgMCAKPiAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIAo+IDAgMCAwIDAgMCAwIDAgMCA3
NDU0OCAwIDAgMAo+IGN0eHQgMTg0NzgxCj4gYnRpbWUgMAoKICBBaCwgc28gYnRpbWUgaXMgdGhl
cmUsIGJ1dCBpdCdzIHplcm8sIGFuZCBodG9wIGFwcGFyZW50bHkgZG9lc24ndCBsaWtlIHRoYXQu
CgogIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgYnRpbWUgY2FuIGJlIDAgdGhvdWdoLiBJcyB0aGUg
dXB0aW1lIChpbiAvcHJvYy91cHRpbWUpIAphbHNvIDA/CgoKICBSZWdhcmRzLAogIEFybm91dAoK
Cj4gcHJvY2Vzc2VzIDE4NAo+IHByb2NzX3J1bm5pbmcgMQo+IHByb2NzX2Jsb2NrZWQgMAo+IHNv
ZnRpcnEgMTU2NjU3IDAgNzA2MTkgMzMgNTM1IDU1MyAwIDEwMzUxIDcyMjA2IDAgMjM2MAo+ICpW
b246KsKgIkFybm91dCBWYW5kZWNhcHBlbGxlIiA8YXJub3V0QG1pbmQuYmU+Cj4gCj4gT24gMjAv
MTAvMjAyMSAxMzoyMiwgU3RldmUgd3JvdGU6Cj4gID4gSGVsbG8sCj4gID4gYSBMaW51eCBpbWFn
ZSBidWlsdCB3aXRoIGEgcmVjZW50bHkgZG93bmxvYWRlZCBidWlsZHJvb3QsIHN0YXJ0aW5nIHdp
dGggdGhlCj4gID4gZGVmY29uZmlnIGZvciBSYXNwYmVycnlQaTMgYW5kIGFkZGluZyBzb21lIHRo
aW5ncyAoaHRvcCBpZiBpdCB3YXNuJ3QgYWxyZWFkeSwKPiAgPiBuYW5vLCBvcGVuc3NoLCBvcGVu
dnBuOyBhbHNvIHRoZSBsaW51eC1tZW51Y29uZmlnIHdhcyBhbHRlcmVkLCBjb25jZXJuaW5nIFVT
Qgo+ICA+IGRyaXZlciBzdHVmZikuCj4gID4KPiAgPiBXaGVuLCBpbiBtZW51Y29uZmlnLCBJIHNl
YXJjaCB3aXRoIC8gZm9yIGh0b3AsIGl0IHNob3dzIHRoYXQgaHRvcCBhbmQgYWxsCj4gID4gZGVw
ZW5kZW5jaWVzIGFyZSBtZXQgKGFsbCBwb3NpdGl2ZSBkZXBlbmRlbmNpZXMgYXJlIFs9eV0gYW5k
IHRoZSBvbmUgbmVnYXRpdmUKPiAgPiAoc3RhdGljIGxpYnMpIGlzIFs9bl0uCj4gID4gQnV0IHdo
ZW4gSSBjYWxsIGh0b3Agb24gdGhlIHJ1bm5pbmcgc3lzdGVtLCBJIG9ubHkgZ2V0IHRoZSBsaW5l
IGdpdmVuIGluIHRoZSAKPiB0b3BpYy4KPiAgPiBXaGF0IGNvdWxkIGJlIHRoZSBwcm9ibGVtPwo+
IAo+IFRoaXMgaXMgc3F1YXJlbHkgaW4gdGhlICJ0aGlzIHNob3VsZG4ndCBoYXBwZW4iIGRvbWFp
bi4uLgo+IAo+IElzIC9wcm9jIG1vdW50ZWQ/Cj4gCj4gV2hhdCBpcyB0aGUgY29udGVudHMgb2Yg
L3Byb2Mvc3RhdD8KPiAKPiAKPiBSZWdhcmRzLAo+IEFybm91dAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290IAo+IDxodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3Q+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
