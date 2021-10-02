Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DD4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ACB661B46
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4ACB661B46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E1A6080C;
	Sat,  2 Oct 2021 20:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jl7Rsgp3Gpjs; Sat,  2 Oct 2021 20:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 650976068C;
	Sat,  2 Oct 2021 20:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A96851BF345
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A23A1400E5
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tv9ee7xeNXAK for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 20:44:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FC4D40132
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 20:44:41 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v17so21573952wrv.9
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aDgs4WalIpCjcyfM8c9vnYlyHk+qYJhENakO6oOQAbk=;
 b=AucVehPxvFFz15Yu7L/dgRuFxT3ScOdncy5uSn0BTuy+M/CBF6DJT/BtTONv/umCyg
 VBk4W5+GwQ9XrkyNKQTjs4uS8bvYxtX9Xml5TM6cFcSuqJMAHMHFBERednoJK7yJnPqR
 u2IXxZJ6qqXpHrpGoqzfJcZ/6oMj/h3E1kZeX7SvO9uTygRzLqZ7+mfXDrfn7mNWmdip
 Hc4g7/NTznuj7XTMQWe/t6hZZfXJC9pydwS7gcBZMeTVrd8Tzo4EFfOOsTUXypHZdF/h
 ESon7zWVLSmHC26vsHElKGU5An3bgaRxozTvAXhxybf8pJpA7vxlhwuoeNp7yR8UShZL
 WXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aDgs4WalIpCjcyfM8c9vnYlyHk+qYJhENakO6oOQAbk=;
 b=gozLfK6ysa63CxHJFJO2mjpppeej9BXx/vRLBm+XGiv7mvGElvFZjaR69JsZkOqyUg
 vFDpXS/EJY8rH4/xIdpZz+2yn7cpd1yfhoTKICoqPgaOPahrtPEBsIsszrgLhrUhb4J7
 A1VhW9cabF9OmSO/hZW0QSEQsOMqqNgKUVjNssJKE6ItCmTCc1RUGXwsOPrLqcu3G/y0
 IfC6vHSOSC1NIaIzZ5fZW1ePFeKlntrBKMEezampsT/HR6YKlIQSTDgSuDQUubtuEkTK
 Qryqk/+lYU0rvGQOPek6TMFCwxQppuguqu7ff5VpTJvnBo9YBOyMWvYoeokebhdil+7f
 WNJg==
X-Gm-Message-State: AOAM532QTTzsIkQjA9QeXHdv8i5/+HDWaLET69hxR9cbJEdNMBMn7uN4
 QKbSdEsvBSACqB9oGPLEp3E=
X-Google-Smtp-Source: ABdhPJxdjFHi7cv1EHfPCd4q/P3EyKMeT5LFlfzwzzuhz/4EQ3cbYM5BpZzP389fdWHhGJHXP4Tc+w==
X-Received: by 2002:a5d:6245:: with SMTP id m5mr5094783wrv.148.1633207479596; 
 Sat, 02 Oct 2021 13:44:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id h11sm8828397wru.10.2021.10.02.13.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:44:38 -0700 (PDT)
Message-ID: <910c11b4-2b8f-d47b-6f83-7a3e8dd0048d@gmail.com>
Date: Sat, 2 Oct 2021 22:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
 <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
 <6d635d7e-e88a-3b23-9682-a19ff3d08b7d@gmail.com>
 <20211002202534.40ca92ee@windsurf>
 <96717f4f-256e-0fc6-fa20-979233a6093a@gmail.com>
 <20211002203447.GY1504958@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211002203447.GY1504958@scaer>
Subject: Re: [Buildroot] csky 8xx toolchain issue
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
Cc: Guo Ren <ren_guo@c-sky.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDAyLzEwLzIwMjEgw6AgMjI6MzQsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIxLTEwLTAyIDIyOjIxICswMjAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBMZSAwMi8xMC8yMDIxIMOgIDIwOjI1LCBUaG9tYXMg
UGV0YXp6b25pIGEgw6ljcml0wqA6Cj4+PiBPbiBTYXQsIDIgT2N0IDIwMjEgMTc6NTg6MjQgKzAy
MDAKPj4+IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4g
VGhlIGNza3kgdG9vbGNoYWluIGlzIHN0aWxsIGJyb2tlbiB3aXRoIHJlY2VudCBob3N0IGNvbXBp
bGVyIGFuZCBvdXIgQ0kgd2lsbAo+Pj4+IHN3aXRjaCB0byBEZWJpYW4gYnVsbHNleWUgc29vbi4K
PiBbLS1TTklQLS1dCj4+PiBDb25zaWRlcmluZyB0aGVzZSBpc3N1ZXMgYW5kIHRoZSBmYWN0IHRo
YXQgdGhlcmUgaGFzIGJlZW4gbm8gdXBkYXRlcyBpbgo+Pj4gdGVybXMgb2YgQy1TS1kgc3VwcG9y
dCBmb3IgYSBsb25nIHRpbWUsIEkgdGhpbmsgd2Ugc2hvdWxkIGNvbnNpZGVyCj4+PiBkcm9wcGlu
ZyBzdXBwb3J0IGZvciB0aGUgQy1TS1kgQ1BVIGFyY2hpdGVjdHVyZS4KPj4gY3NreTg2MCB3aWxs
IGJlIHN1cHBvcnRlZCBieSBnY2MgMTI6Cj4+IGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdj
Yy5naXQ7YT1jb21taXRkaWZmO2g9ZGI5MmJkMjIzZTM5NTdlZTU4YjVhMGMwZmZmZDhiNzc2NmYx
ZGVmMwo+IAo+IEluIHRoZSBtZWFudGltZSwgd2hhdCBhYm91dCBqdXN0Ogo+IAo+ICAgICBkaWZm
IC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZpZy5pbgo+ICAgICBpbmRleCAxODUz
ZTI2YmI0Li5hYjQwMjk0ZGRjIDEwMDY0NAo+ICAgICAtLS0gYS9hcmNoL0NvbmZpZy5pbgo+ICAg
ICArKysgYi9hcmNoL0NvbmZpZy5pbgo+ICAgICBAQCAtNzcsNiArNzcsNyBAQCBjb25maWcgQlIy
X2FhcmNoNjRfYmUKPiAgICAgIAo+ICAgICAgY29uZmlnIEJSMl9jc2t5Cj4gICAgICAJYm9vbCAi
Y3NreSIKPiAgICAgKwlzZWxlY3QgQlIyX0FSQ0hfSEFTX05PX1RPT0xDSEFJTl9CVUlMRFJPT1QK
PiAgICAgIAlzZWxlY3QgQlIyX0FSQ0hfSEFTX01NVV9NQU5EQVRPUlkKPiAgICAgIAkjIE1vc3Qg
dmFyaWFudHMgYXJlIHN1cHBvcnRlZCBieSBnY2MtOSssIGV4Y2VwdCBvbmUgdGhhdCBpcwo+ICAg
ICAgCSMgaGFuZGxlZCBhcyBhIHNwZWNpYWwgZXhjZXB0aW9uIGluIHBhY2thZ2UvZ2NjL0NvbmZp
Zy5pbi5ob3N0Cj4gCj4gV2hlbiB3ZSBpbnRyb2R1Y2UgZ2NjIDEyLCB3ZSBjYW4gbW92ZSB0aGF0
IGRvd24gdG8gdGhlIGluZGl2aWR1YWwKPiB2YXJpYW50cyBpZiBuZWVkIGJlLi4uCgpBdCBsZWFz
dCBJIGNhbiBidWlsZCB0aGUgY3NreTYxMCB0b29sY2hhaW4gdXNpbmcgYmludXRpbHMgYW5kIGdj
YyBjc2t5IGZvcmsgYnV0CmJ1aWxkaW5nIHRoZSA1LjAuMTIga2VybmVsIHJlcXVpcmVzIGEgc21h
bGwgcGF0Y2ggdG8gYnVpbGQgd2l0aCBob3N0IGdjYyA+PSAxMAooaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lk
PTM1YjM0ZDI2NGNiMzQ3OTA5ZWM4OWQ5ZmE4OTU5MDAwMzVkNTQzOGMpCgpodHRwczovL2dpdGxh
Yi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTYzNTU4ODE3MwoKQnV0IHdpdGggdGhlIHNh
bWUgdG9vbGNoYWluLCB0aGUgYnVpbGQgZmFpbCB3aXRoIGFuIGludGVybmFsIGNvbXBpbGVyIGVy
cm9yOgoKaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MzU1ODgx
NzQKaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MzU1ODgxNzUK
aHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MzU1ODgxNzYKCkJ1
dCBldmVuIHdpdGggQlIyX0FSQ0hfSEFTX05PX1RPT0xDSEFJTl9CVUlMRFJPT1QsIHdlIGhhdmUg
dG8gcmVtb3ZlIHNvbWUKcWVtdV9jc2t5KiBkZWZjb25maWcgdG8gbm90IHRyaWdnZXIgYSBidWls
ZCBqb2IgaW4gZ2l0bGFiLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJlZ2FyZHMsCj4g
WWFubiBFLiBNT1JJTi4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
