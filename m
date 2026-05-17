Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4C7CD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D17E94294E;
	Sun, 17 May 2026 21:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVpOluO2ILvM; Sun, 17 May 2026 21:42:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002F54294F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779054136;
	bh=seJUDLV/T0illV2SQUE/twU0fHTzFmkXhk3F0hJDcag=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jg1wkVc/SgPA7yl6e8pK7CEo+mCf7pOlCbJYCX3bHZKE3uuRRS+wIOvMLuR7shnrd
	 TLlHnlLE6fMTsBJsa2M2xz9lj4em2y6Vr4MdMq4JtUnZpC0ZHvMCyA+wdPzbgp22iM
	 JiTIEt5giBqydGB2TDUcyM2w1JjKJnodX+Z+NDzbqcA60oDVvDcMnTwWKBkc6Msk1h
	 JiLXT+jrxaK7SSg6tsWJr7Ib59kRLPSBfEJgaGEWGfkmcn3LvaFes4sshbE2WcaapF
	 FEMgzDNnoStlqb8yJfsvgCr5Ew2UgNNhcSX6/7sC7h4p5SHEIPUTJ/toxVTJaw0ad2
	 8huZzMoVdDbTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 002F54294F;
	Sun, 17 May 2026 21:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBEFF390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE9F485882
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvLJTtHbKCu7 for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:42:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BACCB8587F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACCB8587F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BACCB8587F
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:42:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b150559bso12304965e9.1
 for <buildroot@buildroot.org>; Sun, 17 May 2026 14:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779054130; x=1779658930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/3LduFPbFPjpGdq0S/Vrp3PkPk56C8ln1ULcB1WHOrI=;
 b=DxMPJRz+7/ykF3e/IkVEezY6x1llieqMRGuHh9doaAmXbZ22FkgoR532cx65Kt4Dh3
 g/35ntuwPw1NMTthtBt8m84JMG+b7dt3mIJljNoNtZrDZVP87ItpwoWiUp9dFVVxKui/
 k+eIjLX8nHwFbFyabTulIJibEZ6SCZzvSd/sw7QMxUYhiSBU01/FMMpoS5yr7XTktRkU
 gBbtDhm0d0t6SBktwyIJXLB1A7/IlDMwNOac+wbfE/TdQRNWpYy353AAdUgum8O8shOi
 NOQ5cInDK8zd1H8DCTCBiyiCj7CNtCSM4ludyGQMg0W6A55zvLgQSNsJdE4KZnOoEBBI
 ngXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KEHvwavLcjAEmlgJLZgMweQwMaoQ2zB1HmgtP6/bLkmYSP2jb0lTiiQM5lzGZQKbrzhdqEDnzD34=@buildroot.org
X-Gm-Message-State: AOJu0YzR8+VyDUq1PI6ng2iCPwVCnRLdd9FnKRRAGLE6NJzv69F/81CH
 yD0JSqsf4m99hP9qXvabZLvx9cOrYbpx0HozeLm+t3CnMBq5mDDpOztAySdLv36lZGg=
X-Gm-Gg: Acq92OFuBp3Oh01PvCwPVqYarzThou4hRMBFmNdmz+CzxWMIrgOZmeZsVQsEqw1/IbM
 8xCDTuwFXjwT1FUJ2F28VsKK9oGsv0lKOcEc49mJHQCIScK+5lJh1qGLslI1Ej+lAX8fIABGkhl
 DgghGcgUhVnkzdt9Mxt9xOetgqK2jHJMcrKw7Yb97ESp7jz0Tl3mvmRXp4s10jVmWO3ovnMVdz0
 by+FegvpsrgRgtClr45l37YoHWsJ2PD7aEQNd8NT4FdB+a5gppFSW/ZEr0s0QmT3x9o7dUHndZU
 TZXbmIJYx3E9Vo+oEt4y5TU5mJl429DfHYBOlj7BH17O9GoLS/H30hgkmURPE5NHMPo4cEhcAsx
 7rZfW8plrjZon0kztVOJk1WTSc/br1C0MJx1tzvIsCqVXA9Bof1p2N69sIILNepY2cY3STXbg+C
 W49+YrWSLVabPsRsN1iDEnN2fAe9azqV7l7XCKliLW5r/6dq5L8vmwNE91rMObZkNVkJSag9ZTS
 R3Vl1xk+xSKQTti1JeGIH8onPwqqNyzsKsW6MPGC5CQpvqsLoo4RnhQt/elPWRy4Q==
X-Received: by 2002:a05:600c:8210:b0:48a:5c23:cab with SMTP id
 5b1f17b1804b1-48fe6322447mr176321085e9.19.1779054130536; 
 Sun, 17 May 2026 14:42:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe83ba2sm65551885e9.35.2026.05.17.14.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 14:42:09 -0700 (PDT)
Message-ID: <4df73f6e-047f-45ae-bef2-5735fd79e021@smile.fr>
Date: Sun, 17 May 2026 23:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20260407123424.3983175-2-buildroot@heine.tech>
Content-Language: fr
In-Reply-To: <20260407123424.3983175-2-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779054130; x=1779658930; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/3LduFPbFPjpGdq0S/Vrp3PkPk56C8ln1ULcB1WHOrI=;
 b=msh9P8lNxHt3sQt1X9mSrEEfN5dT7/h9FxF7EIex5CJ8rHP45yZ8XzznB9F704i79o
 w4JG8Dq+kLJgGZWmjEvM974/+E99iV2sVa721NT9Nt+3z40uaeQO/N5ZycZWdcp70feX
 S23TWKRZMu0V1NDJ2Y0leis42MhBvhOuEFf8E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=msh9P8lN
Subject: Re: [Buildroot] [PATCH v2] package/supertux: fix build with gcc > 11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWljaGFlbCwgQWxsLAoKTGUgMDcvMDQvMjAyNiDDoCAxNDozNCwgTWljaGFlbCBOb3N0
aG9mZiB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gRml4ZXM6Cj4gICJtaXNzaW5nICNpbmNs
dWRlIDxtZW1vcnk+IiB3aGVuIGJ1aWxkaW5nIHdpdGggR0NDID4gMTEuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBOb3N0aG9mZiA8YnVpbGRyb290QGhlaW5lLnRlY2g+CgpJdHMgYmVlbiBh
IHdoaWxlIHNpbmNlIHRoZSBsYXN0IHJlbGVhc2UgYnV0IGhlcmUgaXQgaXM6CgogIGh0dHBzOi8v
Z2l0aHViLmNvbS9TdXBlclR1eC9zdXBlcnR1eC9yZWxlYXNlcy90YWcvdjAuNy4wCgpBcHBsaWVk
IHRvIG1hc3Rlci4gVGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IC0tLQo+IFYy
OiBhZGQgIlVwc3RyZWFtIiB0byBwYXRjaAo+IAo+IC0tLQo+ICBwYWNrYWdlL3N1cGVydHV4LzAw
MDEtZml4LWdjYzExLWJ1aWxkLnBhdGNoIHwgMzMgKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3N1cGVydHV4LzAwMDEtZml4LWdjYzExLWJ1aWxkLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvc3VwZXJ0dXgvMDAwMS1maXgtZ2NjMTEtYnVpbGQucGF0Y2ggYi9wYWNrYWdlL3N1
cGVydHV4LzAwMDEtZml4LWdjYzExLWJ1aWxkLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi5kNWFkYTUzMWM2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2Uvc3VwZXJ0dXgvMDAwMS1maXgtZ2NjMTEtYnVpbGQucGF0Y2gKPiBAQCAtMCwwICsxLDMz
IEBACj4gK0Zyb20gODE4MDlkZDVlNmY2MTFiMWQ2NGQ5NTJmNmQ5NjMxMGJjYzljNWZjYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogU2VtcGhyaXMgPHNlbXBocmlzQHByb3Rvbm1h
aWwuY29tPgo+ICtEYXRlOiBGcmksIDE3IEp1biAyMDIyIDEyOjM2OjI2IC0wNDAwCj4gK1N1Ympl
Y3Q6IFtQQVRDSF0gRml4IHByb2JsZW0gd2l0aCBHQ0MgMTEgYW5kIFBhcnRpbydzIFpJUCBtYW5h
Z2VyIChtaXNzaW5nCj4gKyAjaW5jbHVkZSA8bWVtb3J5PikKPiArCj4gK0Nsb3NlcyAjMjIxOSBv
biBHaXRIdWIuIFNhbWUgZml4LCBidXQgcHV0cyB0aGUgaW5jbHVkZSBjbG9zZXIgdG8gdGhlIGNv
cHlyaWdodCBoZWFkZXIuCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL1N1cGVy
VHV4L3N1cGVydHV4L2NvbW1pdC84MTgwOWRkNWU2ZjYxMWIxZDY0ZDk1MmY2ZDk2MzEwYmNjOWM1
ZmNhCj4gK1NpZ25lZC1vZmYtYnk6IE1pY2hhZWwgTm9zdGhvZmYgPGJ1aWxkcm9vdEBoZWluZS50
ZWNoPgo+ICstLS0KPiArIGV4dGVybmFsL3BhcnRpb196aXAvemlwX21hbmFnZXIuaHBwIHwgOCAr
KysrKystLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiArCj4gK2RpZmYgLS1naXQgYS9leHRlcm5hbC9wYXJ0aW9femlwL3ppcF9tYW5hZ2VyLmhw
cCBiL2V4dGVybmFsL3BhcnRpb196aXAvemlwX21hbmFnZXIuaHBwCj4gK2luZGV4IDY2Njg4NGRk
YTUzLi4yNDUzMDNjNzZiZSAxMDA2NDQKPiArLS0tIGEvZXh0ZXJuYWwvcGFydGlvX3ppcC96aXBf
bWFuYWdlci5ocHAKPiArKysrIGIvZXh0ZXJuYWwvcGFydGlvX3ppcC96aXBfbWFuYWdlci5ocHAK
PiArQEAgLTEsOCArMSwxMiBAQAo+ICsgLy8gU09VUkNFOiBodHRwczovL2dpdGh1Yi5jb20vd2Rh
cy9wYXJ0aW8vYmxvYi9tYWluL3NyYy9saWIvaW8vWklQLmgKPiArKy8vIE5PVEU6IFRoaXMgZmls
ZSB3YXMgZWRpdGVkIGZvciBwdXJwb3NlcyBvZiBjb21wYXRpYmlsaXR5IHdpdGggU3VwZXJUdXgu
Cj4gKyAKPiArLS8qCj4gKysvLyBUaGlzIGluY2x1ZGUgaGFzIGJlZW4gYWRkZWQgdG8gZml4IGEg
cHJvYmxlbSB3aXRoIEdDQyAxMSsgKGFuZCBtYXliZSAxMCkKPiArKyNpbmNsdWRlIDxtZW1vcnk+
Cj4gKysKPiArKy8vID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKyAKPiArLU5PVEU6IFRoaXMgZmls
ZSB3YXMgZWRpdGVkIGZvciBwdXJwb3NlcyBvZiBjb21wYXRpYmlsaXR5IHdpdGggU3VwZXJUdXgu
Cj4gKysvKgo+ICsgCj4gKyBQQVJUSU8gU09GVFdBUkUKPiArIENvcHlyaWdodCAyMDEwIERpc25l
eSBFbnRlcnByaXNlcywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
