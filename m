Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB60EC19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8108A81A58;
	Wed, 27 Jul 2022 09:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8108A81A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QAJpCFY_sBw; Wed, 27 Jul 2022 09:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB0581A0D;
	Wed, 27 Jul 2022 09:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB0581A0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBADD1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3EFF60B19
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3EFF60B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojwv1-FNTvv3 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:09:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C3C60B0B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8C3C60B0B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:09:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u5so23297923wrm.4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1VuSPAAw8ChTvxc5SbytuqMHCpvOGFlta8lzKXMejrk=;
 b=xPavWgnc+Vh2q+bqjP4nyr+ZID1Gv/7+TB1fYb/RD3+neE0nyKeqGxuw+hayhFbKpE
 MjQSjs71hQaLJ1c7+e/dKmgVdNHiDuyR+Rc//WRlQC4ZhFwT7POnyahauEl2gN4NgYuh
 GC851rylEnljdUZnJFKva/O727pC8/Ds7MyCu+X6jezbPR5ardKv4iIkMgnIgL0GUxvG
 RgJG3bzt2gnOvKgKyzDb61WbQkoHG/vEvG1yuqKdRKu9lQvhO2Q9gH/EhKKjYdO5JWPM
 4XcyMu9XZyUiu07d/lPa8U0nnE7f3HUu/rJSsaryMfqwnyg9MbaIhTSl5gn86CLFFQ7S
 OV6A==
X-Gm-Message-State: AJIora9E2oAIL8OsxGjQqVVcQG2qGBoXL2Cgg+Ojsd46m9DwJFUSksRT
 /NygRWOy8+ajALuBr42I/XMXdtbZ1xmyIQ==
X-Google-Smtp-Source: AGRyM1u61X7Hw2AC3WFEMKGRhTTVgf6BNVT207VufhiuwCTv5A4kBaH5qxkBHkgTCPkDIqEwoQxELQ==
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id
 u1-20020adfed41000000b0021020a526c2mr12921555wro.603.1658912967603; 
 Wed, 27 Jul 2022 02:09:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 bg2-20020a05600c3c8200b003a35ec4bf4fsm1754304wmb.20.2022.07.27.02.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 02:09:27 -0700 (PDT)
Message-ID: <8ad63d4a-86d2-d005-b3b8-e7b85b7229cc@smile.fr>
Date: Wed, 27 Jul 2022 11:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Danilo Bargen <mail@dbrgn.ch>, buildroot@buildroot.org
References: <20220117001814.2645cd1b@c3po>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220117001814.2645cd1b@c3po>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1VuSPAAw8ChTvxc5SbytuqMHCpvOGFlta8lzKXMejrk=;
 b=QO587Eoal5z6gsCOzBO0s69O1HxjAU4vff1uyBt8uWckIjYV5N4taKgsSPcCpL7cDi
 47LckkRBvwbO1nJZS3YE4Vy2ZXYWktRei7/+pI7MlIUNthOMUgFXczwfop9iUDF4n7D/
 1RZFtn3X8IuZbD8DvvVa48GyBcxUSAzhY7p/zxVVvpVCldqjhWTIj2QZKeZX7yIQu4Ak
 TiQ1NsFMVYJ+7DJfcXQ9EHFVTUDn4MedvxqW17eqM3P+cOQnn9zd8EVSEAfbqcXSFA0+
 NFZKGZ2jOYg2kCXrZwx+9oPl3egTrO++pXSSm+PQHtG5EJTr4TaI4IEPsw9kJWbKFD4x
 n2hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QO587Eoa
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: new package
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

SGVsbG8gRGFuaWxvLAoKTGUgMTcvMDEvMjAyMiDDoCAwMDoxOCwgRGFuaWxvIEJhcmdlbiBhIMOp
Y3JpdMKgOgo+IFRlYWxkZWVyIGlzIGEgZmFzdCBhbmQgZnVsbC1mZWF0dXJlZCB0bGRyIGNsaWVu
dC4gdGxkciBwYWdlcyBhcmUKPiBzaW1wbGlmaWVkIGFuZCBjb21tdW5pdHktZHJpdmVuIG1hbiBw
YWdlcywgc2VlIGh0dHBzOi8vdGxkci5zaC8gZm9yIG1vcmUKPiBpbmZvcm1hdGlvbi4KCklzIHRo
aXMgcGFja2FnZSByZWFsbHkgdXNlZnVsIGZvciBhIEJ1aWxkcm9vdCBiYXNlZCBzeXN0ZW0/Ckl0
J3MgbW9yZSBzb21ldGhpbmcgZm9yIGRldmVsb3BlcnMuCkFsc28sIEJ1aWxkcm9vdCB0cnkgdG8g
bm90IGJ1aWxkIGFuZCBpbnN0YWxsIG1hbiBwYWdlcyB3aGVuIHBvc3NpYmxlLgoKQ2FuIHlvdSBz
aGFyZSB3aXRoIHVzIHdoeSB5b3UgbmVlZCB0aGlzIHRvb2wgb24geW91ciB0YXJnZXQgc3lzdGVt
PwoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2RicmduL3Rl
YWxkZWVyLwo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmlsbyBCYXJnZW4gPG1haWxAZGJyZ24uY2g+
Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2Fn
ZS9Db25maWcuaW4gICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3RlYWxkZWVyL0NvbmZp
Zy5pbiAgICAgfCAxMCArKysrKysrKysrCj4gIHBhY2thZ2UvdGVhbGRlZXIvdGVhbGRlZXIuaGFz
aCB8ICA0ICsrKysKPiAgcGFja2FnZS90ZWFsZGVlci90ZWFsZGVlci5tayAgIHwgMTIgKysrKysr
KysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS90ZWFsZGVlci9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdGVhbGRlZXIvdGVhbGRlZXIuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS90ZWFsZGVlci90ZWFsZGVlci5tawo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIv
REVWRUxPUEVSUwo+IGluZGV4IGE5MWUyZGZjZGUuLmQyZjIzOTY4ZDAgMTAwNjQ0Cj4gLS0tIGEv
REVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtNjQzLDYgKzY0Myw3IEBAIE46CURh
bmllbCBTYW5ndWUgPGRhbmllbC5zYW5ndWVAc2FuZ3VlLmNoPgo+ICBGOglwYWNrYWdlL2xpYmZ0
ZGkxLwo+IAo+ICBOOglEYW5pbG8gQmFyZ2VuIDxtYWlsQGRicmduLmNoPgo+ICtGOiAgcGFja2Fn
ZS90ZWFsZGVlci8KPiAgRjoJYm9hcmQvcGNlbmdpbmVzL2FwdTIvCj4gIEY6CWNvbmZpZ3MvcGNl
bmdpbmVzX2FwdTJfZGVmY29uZmlnCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmlu
IGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCA0ZGYxNDc0YjkxLi42ZTVlNjlhNGYxIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBA
QCAtMjYwNCw2ICsyNjA0LDcgQEAgbWVudSAiU3lzdGVtIHRvb2xzIgo+ICAJc291cmNlICJwYWNr
YWdlL3N5c3RlbWQtYm9vdGNoYXJ0L0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9zeXN2
aW5pdC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvdGFyL0NvbmZpZy5pbiIKPiArCXNv
dXJjZSAicGFja2FnZS90ZWFsZGVlci9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvdGhl
cm1hbGQvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3RwbS10b29scy9Db25maWcuaW4i
Cj4gIAlzb3VyY2UgInBhY2thZ2UvdHBtMi1hYnJtZC9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvdGVhbGRlZXIvQ29uZmlnLmluIGIvcGFja2FnZS90ZWFsZGVlci9Db25maWcuaW4K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjk2ZWQ4MTYxNGIKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS90ZWFsZGVlci9Db25maWcuaW4KPiBAQCAtMCww
ICsxLDEwIEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9URUFMREVFUgo+ICsJYm9vbCAidGVhbGRl
ZXIiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQ
UE9SVFMKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDCj4gKwloZWxwCj4gKwkgIEEg
ZmFzdCBhbmQgZnVsbC1mZWF0dXJlZCB0bGRyIGNsaWVudC4gdGxkciBwYWdlcyBhcmUKPiArCSAg
c2ltcGxpZmllZCBhbmQgY29tbXVuaXR5LWRyaXZlbiBtYW4gcGFnZXMsIHNlZQo+ICsJICBodHRw
czovL3RsZHIuc2gvIGZvciBtb3JlIGluZm9ybWF0aW9uLgo+ICsKPiArCSAgaHR0cHM6Ly9naXRo
dWIuY29tL2RicmduL3RlYWxkZWVyLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3RlYWxkZWVyL3Rl
YWxkZWVyLmhhc2ggYi9wYWNrYWdlL3RlYWxkZWVyL3RlYWxkZWVyLmhhc2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjBlNTMxNzQ4NDEKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS90ZWFsZGVlci90ZWFsZGVlci5oYXNoCj4gQEAgLTAsMCArMSw0IEBA
Cj4gKyMgTG9jYWxseSBnZW5lcmF0ZWQKPiArc2hhMjU2ICA0MmZlYmY5ZWU4NDcyMWI5MjMwMDc3
ZDYyZTJmYzUxMjAxZmQ1OTYyNGQzYzc3NmNjYzFhNjM0Nzg4NzY4YTYwICB0ZWFsZGVlci0xLjUu
MC50YXIuZ3oKPiArc2hhMjU2ICA2MmM3YTFlMzVmNTY0MDY4OTZkN2FhN2NhNTJkMGNjMGQyNzJh
YzAyMmI1ZDI3OTZlN2Q2OTA1ZGI4YTM2MzZhICBMSUNFTlNFLUFQQUNIRQo+ICtzaGEyNTYgIGEz
MTNiNWU2MmI4MGEwOGYzYWFlMGZhNjJmZjNkZTg0ODJlZjU1MjQ3Mjk5ZWIzNTJhYjQ0Zjg3ZWY0
NTZiMWIgIExJQ0VOU0UtTUlUCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGVhbGRlZXIvdGVhbGRl
ZXIubWsgYi9wYWNrYWdlL3RlYWxkZWVyL3RlYWxkZWVyLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jMzk2MjI1MDk4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvdGVhbGRlZXIvdGVhbGRlZXIubWsKPiBAQCAtMCwwICsxLDEyIEBACj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyB0ZWFsZGVlcgo+ICsjCj4gKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gKwo+ICtURUFMREVFUl9WRVJTSU9OID0gMS41LjAKPiArVEVBTERFRVJf
U0lURSA9ICQoY2FsbCBnaXRodWIsZGJyZ24sdGVhbGRlZXIsdiQoVEVBTERFRVJfVkVSU0lPTikp
Cj4gK1RFQUxERUVSX0xJQ0VOU0UgPSBBcGFjaGUtMi4wIG9yIE1JVAo+ICtURUFMREVFUl9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRS1BUEFDSEUgTElDRU5TRS1NSVQKPiArCj4gKyQoZXZhbCAkKGNh
cmdvLXBhY2thZ2UpKQo+IC0tCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
