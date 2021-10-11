Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD40C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFFB660EE2
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFFB660EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC65D80EC6;
	Mon, 11 Oct 2021 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlklMzJj5RO5; Mon, 11 Oct 2021 21:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B4EF80EBD;
	Mon, 11 Oct 2021 21:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCC51BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A817402DF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkcdR3D98oHu for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:19:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B0E4022F
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:19:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g10so71995307edj.1
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tq2hoE+UbfVEXPKoyDDIN8aC6uJhqeqlBl+dNzrBx/A=;
 b=c8GrgEV7h2RTtbMPS3YJUdTCgwy6Rx9t8XW0EZXi0+lOos0s018wmpm7lKYXe4rKGK
 X5yjLTy62zJjeds1xFGkghIyHFPr0f7c40/129HG8YqJoDTnPSJRA6g4PMB5x8sD2yZI
 mkKQqyUSuwN+uNrhDbbsnRowa56X+V7wAjoQxu09yXILX6SRDKKbLRBYnDEbUEx0QSyS
 vABQdXJkTSyTu+dM9YvLHKvzRkp3+eLVeOhmRCvs2yev9wS6dR3OVRzFwheJ4cmBm6LK
 NbNaTlHYTh+K7D/MayD6byPP8OjKf/fPY94gMyMOsB/bAewAg5W/iJZnT0OaJRMdL3kF
 Ne7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tq2hoE+UbfVEXPKoyDDIN8aC6uJhqeqlBl+dNzrBx/A=;
 b=nitUg2cEEUyM5xFGYSZrTHsFD1MlYBlomwDGA2W+iJsj57QEHXGVKrsUe2Ce9rpBxz
 pnvJM6BVWBnfyOmHch21GpGU+LsfSrJW34a9cAHEoX4N/yaRhwFdBy4JHC96G2lilA3C
 Xo6y5ztDOx5hyHBsZgIvbt+nF2XLySmSOsE2eE7V6gPuPW/+gbfGTUg5Q27ER11bNWEw
 tFxjIjezVxXc1iKZbiwlPx/TAmTo66dZbch1KUy8VouK78lGvTN/tGxzVYrxcyqQ6OpJ
 UY2UuO4VQTstODtHpfAtW/rXV91uhu1DpZjFAoqeKfPtIukM5z3gQjUD9xOX3V1ab9X1
 7i7g==
X-Gm-Message-State: AOAM53260o834Cf2iRyou/gtW5C6lFYMrDgyoCzw4/vdCfSLk4Mpgk5y
 ANTEZFo3B5/Fc7pzS3qkN9R9Qw==
X-Google-Smtp-Source: ABdhPJx9j0KNcm2u1GKVOX9iaCr4vTo2ohWBzXQ52ykrPRCs8EMJEFyJZD2sSRAD3n0yfyes0uGnBQ==
X-Received: by 2002:a17:907:7388:: with SMTP id
 er8mr29016813ejc.324.1633987183362; 
 Mon, 11 Oct 2021 14:19:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lm14sm3958224ejb.24.2021.10.11.14.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:19:43 -0700 (PDT)
Message-ID: <6934caa6-22cb-a37e-3b27-26571934cfab@mind.be>
Date: Mon, 11 Oct 2021 23:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
References: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
 <07d1425c-7351-cc34-381c-a6fde26185fd@mind.be>
 <CAJPV9Mpn1vDk5oGcZD2rxZRyJ7uYmcZpHm8xzyt=4HOeQtdH3Q@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJPV9Mpn1vDk5oGcZD2rxZRyJ7uYmcZpHm8xzyt=4HOeQtdH3Q@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/audit: Fix type output on log
 folder creation
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

CgpPbiAwNC8xMC8yMDIxIDA3OjU2LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IAo+IAo+IE9u
IFN1biwgT2N0IDMsIDIwMjEgYXQgMToxNSBQTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0
QG1pbmQuYmUgCj4gPG1haWx0bzphcm5vdXRAbWluZC5iZT4+IHdyb3RlOgo+IAo+IAo+IAo+ICAg
ICBPbiAwMS8xMC8yMDIxIDA4OjIwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+ICAgICAgPiBU
ZXN0aW5nIGJ1aWxkcm9vdCAyMDIxLjA1IEkgb2JzZXJ2ZWQgdGhhdCBhZnRlciBmaXJzdAo+ICAg
ICAgPiBib290IEkgd2FzIGhhdmluZyB0aGUgZm9sbG93aW5nIGZvbGRlcnM6Cj4gICAgICA+Cj4g
ICAgICA+IC9jb250ZXh0Ogo+ICAgICAgPiAvc3lzdGVtX3U6b2JqZWN0X3I6YXVkaXRkX2xvZ190
Cj4gICAgICA+Cj4gICAgICA+IFRoZSByb290IG9mIHRoaXMgcHJvYmxlbSB0dXJuZWQgdG8gYmUg
YSBkaWZmZXJlbmNlIGluIHRoZQo+ICAgICAgPiBvdXRwdXQgb2YgJChzZWxhYmVsX2xvb2t1cCAt
YiBmaWxlIC1rIC92YXIvbG9nL2F1ZGl0KSBjYWxsZWQKPiAgICAgID4gYnkgUzAyYXVkaXRkIHRo
YXQgZnJvbSB0aGlzIHZlcmlzb24gb24gbG9va3MgbGlrZToKPiAgICAgID4KPiAgICAgID4gJCBz
ZWxhYmVsX2xvb2t1cCAtYiBmaWxlIC1rIC92YXIvbG9nL2F1ZGl0Cj4gICAgICA+IERlZmF1bHQg
Y29udGV4dDogc3lzdGVtX3U6b2JqZWN0X3I6YXVkaXRkX2xvZ190Cj4gCj4gICAgICDCoCBXaGF0
IGlzIHRoZSBjaGFuY2UgdGhhdCB0aGlzIG91dHB1dCBmb3JtYXQgaXMgZ29pbmcgdG8gY2hhbmdl
IGFnYWluPyBEb2VzCj4gICAgIHNlbGFiZWxfbG9va3VwIGhhcyBhICJzY3JpcHRhYmxlIiBvdXRw
dXQgZm9ybWF0IHRoYXQgd2UgY2FuIHJlbHkgb24gbm90IHRvCj4gICAgIGNoYW5nZT8KPiAKPiAK
PiAgICAgSSdtIGFmcmFpZCBJIGhhdmUgdHJpZWQgYm90aCBhbGwgdGhlIG9wdGlvbnMgYXJvdW5k
Cj4gCj4gd2l0aG91dCBhbnkgY2xlYXJlciBvdXRwdXQsIGZvciBpbnN0YW5jZSwgLXIob2YgcmF3
KSBzdGlsbAo+IHdyaXRlcyB0aGUgJ0RlZmF1bHQgY29udGV4dDonIHBpZWNlLCBhcyB3ZWxsIGFz
IHRoZSAtdChvZiB0eXBlKS4KPiBJIGtub3cgaXQgZG9lc24ndCBsb29rIGVsZWdhbnQsIGJ1dCBm
b3Igbm93IGl0IHNlZW1zIHRoZQo+IGJlc3Qgd2UgY2FuIGFmZm9yZC4KCiAgSSd2ZSBhZGRlZCBh
IHN1bW1hcnkgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBhcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiAgICAgQmVzdCByZWdhcmRzLgo+IAo+ICAg
ICBKb3PDqS4KPiAKPiAKPiAgICAgID4KPiAgICAgID4gVGhpcyBwYXRjaCB3aWxsIGN1dCBpdCB0
byByZXRyaWV2ZSB0aGUgdHlwZSBwaWVjZSBvbmx5Lgo+ICAgICAgPgo+ICAgICAgPiBTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbQo+ICAg
ICA8bWFpbHRvOmpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPj4KPiAgICAgID4gLS0tCj4gICAg
ICA+wqAgwqBwYWNrYWdlL2F1ZGl0L1MwMmF1ZGl0ZCB8IDIgKy0KPiAgICAgID7CoCDCoDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICAgICAgPgo+ICAgICAg
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdWRpdC9TMDJhdWRpdGQgYi9wYWNrYWdlL2F1ZGl0L1Mw
MmF1ZGl0ZAo+ICAgICAgPiBpbmRleCAwZWVmODgxY2VlLi5kZDNkYzIyZDZkIDEwMDY0NAo+ICAg
ICAgPiAtLS0gYS9wYWNrYWdlL2F1ZGl0L1MwMmF1ZGl0ZAo+ICAgICAgPiArKysgYi9wYWNrYWdl
L2F1ZGl0L1MwMmF1ZGl0ZAo+ICAgICAgPiBAQCAtMjAsNyArMjAsNyBAQCBzdGFydCgpewo+ICAg
ICAgPsKgIMKgIMKgIMKgIyB0aGUgZGlyZWN0b3J5IHdpdGggU0VMaW51eCBwZXJtaXNzaW9ucyBp
ZiBwb3NzaWJsZQo+ICAgICAgPsKgIMKgIMKgIMKgY29tbWFuZCAtdiBzZWxhYmVsX2xvb2t1cCA+
L2Rldi9udWxsIDI+JjEKPiAgICAgID7CoCDCoCDCoCDCoGlmIFsgJD8gPSAwIF07IHRoZW4KPiAg
ICAgID4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgbWtkaXIgLXAgL3Zhci9sb2cvYXVkaXQgLVogYHNl
bGFiZWxfbG9va3VwIC1iIGZpbGUgLWsKPiAgICAgL3Zhci9sb2cvYXVkaXRgCj4gICAgICA+ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoG1rZGlyIC1wIC92YXIvbG9nL2F1ZGl0IC1aIGBzZWxhYmVsX2xv
b2t1cCAtYiBmaWxlIC1rCj4gICAgIC92YXIvbG9nL2F1ZGl0IHwgY3V0IC1kICcgJyAtZiAzYAo+
ICAgICAgPsKgIMKgIMKgIMKgZWxzZQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWtk
aXIgLXAgL3Zhci9sb2cvYXVkaXQKPiAgICAgID7CoCDCoCDCoCDCoGZpCj4gICAgICA+Cj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
