Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A863DCCFA1A
	for <buildroot@archiver.kernel.org>; Tue, 11 Nov 2025 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF264050D;
	Tue, 11 Nov 2025 21:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHJ5PYh7EDLv; Tue, 11 Nov 2025 21:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E006408AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E006408AF;
	Tue, 11 Nov 2025 21:26:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12842230
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 21:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECECC408AF
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 21:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxMTQGkzSA81 for <buildroot@buildroot.org>;
 Tue, 11 Nov 2025 21:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A82E4050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A82E4050D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A82E4050D
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 21:26:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso1619425e9.3
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 13:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762896394; x=1763501194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z61IkOJDourCDIQW15DKRKX8SJROGcj1OModKVpYCvQ=;
 b=LZGnGU7aX+IJoAwnIICat+8CYu//S48fW/86Z3TmebarCg6peFjhAiU+JP8iQlcHJ3
 0czkZ4amBeFWohYyFlNiwoxB+wwwahOXNEZ3ufGZVj8cxbe2/CIvR5AWDo+srcG8NEVP
 lRSZY9FDPabKPjx0YUVpKVXECAXQRWcPFT3LvwUy5ahHqsWPgVHZ9TWJGIb/HUix23BI
 KV4NjK+CQBMh2C8YoXw6V6Xfz7Ckh4tzs/13hI7sdEtWzvygkprq9MfBHqr3DX4ijgBb
 Hpx76NnNXr+TJ6/7nl4hOsDghvWNYvqeH1Ti6mKUDJFAYGLxoQPzTyHPFsbZm6XI0kBE
 rRMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFkpvXgnfnzSzxQbAxuaIkt/tsbSm1ek20bC8sPsluO19Kq4+27Sw0cSFTlKMr1mxqiVwcPYMvPQA=@buildroot.org
X-Gm-Message-State: AOJu0YzSj9455FlIt08K5DDBeU5KkjxYU39NzNrO7TImETsKBUo3pP6M
 yHXgmN7G9DsCmdLahI1qM/+2LLzr8rUXhOuaWaknFSkSG2v0OzYs8eGxOlO3S7clwYo=
X-Gm-Gg: ASbGncu/YhlffB5N9HczK80O+L/m7Sv0DE7UaadYGq35J4AUcVrMU9wfQGDKnlNvrMB
 WAn6o0MFY7vNWcu2wR6C7/nwTyENaMSCizOUWXUqTsVcNmAri4F3Bg/N4q38CGddHZ21MCN2wvx
 ZW9CM6iDac+p85Lo0P/pz5ja23cklCnLL1MXFdkJHSVb0vbL08WgB2cSv5OWiI0DvgBFkOuqi2V
 K3BweCZoghfI+/PC/HzFJ/Vrgga9GFFLQ7n2VZCpulNsSCGlinU1PQL52b38lFGljJ2/BrF+0k7
 4WTz8bD3aEpL06FM8frUv1OZ2xWu7kLkd3yGOHm/UmpZVPaMYKWlspsFL+CPlEAliICoEY70pDz
 goLNjnRe8FjpLVvGL0C5EN1/gS12LMqUyLZ3X2KHs3xuY/KQvJQ22kZ42eozy1p+zoLiUFKkWq4
 ld4cvNzjRfqj4p5PWBZGah4LTAfE3DudNkOKV6
X-Google-Smtp-Source: AGHT+IHXnqbiGFIFQJTRHnM9SB8ab2WZL/V02oVCbWRrlFlvnil9EIMWo7/oDrKiUSE+ng2iu4HGDA==
X-Received: by 2002:a5d:5f82:0:b0:42b:3d9d:c605 with SMTP id
 ffacd0b85a97d-42b4bda4f01mr495217f8f.49.1762896393980; 
 Tue, 11 Nov 2025 13:26:33 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b303386f1sm21636674f8f.3.2025.11.11.13.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 13:26:33 -0800 (PST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue, 11 Nov 2025 22:26:31 +0100
Message-ID: <20251111212632.51340-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <5c1798fe-09b1-4449-b137-08a2141f9aa3@gmx.de>
References: <5c1798fe-09b1-4449-b137-08a2141f9aa3@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762896394; x=1763501194; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z61IkOJDourCDIQW15DKRKX8SJROGcj1OModKVpYCvQ=;
 b=dF8UlrmO7HmieeHymahp4RCOZCPjnMhdqROn1a4kgdsoIwY9p9xq7ivx4/rc5S6JSA
 W+X7Fa4RTgjPrIE80YgVMIk+rcI9pr6q2RatZjOen8ybmFZo/8CUoRreGxEk5LVHMTc2
 pdRO5na9p05NMrHPkJxA2YQASnoQchzYCoe1okNq1EgLBhfP+6MoSSkbyfJ4hvt3WsuW
 4yfJxwOidFK6cCtSb/IPvYWO6nJGeBxUno1fljyO6IEhruW2vrEyQUuIeFpVqnajBice
 xjdfdroJLiJbc6GCHSwsbRmY4UfyLaLOt+fb80PI31S/EFe5WvfdrFJenox3dSSKWR/+
 +Oyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dF8UlrmO
Subject: Re: [Buildroot] [PATCH v4 0/2] Add external tree information to
 CycloneDX SBOM
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJbiByZXBseSBvZjoKPiBIaSBUaG9tYXMhCj4gCj4gQW0gMDUuMTEuMjUgdW0gMjI6MTIg
c2NocmllYiBUaG9tYXMgUGVyYWxlOgo+ID4gSGkgRmlvbmEsCj4gPiA+IFRoYW5rcyBmb3IgdGhl
IHBpbmcuCj4gPiA+IEkgYWdyZWUgd2l0aCB0aGUgcGxhY2UgdG8gZGVmaW5lIHRoZSBleHRlcm5h
bCwgaWYgSSByZWFkIHRoZSA+IHNwZWNpZmljYXRpb24gKGh0dHBzOi8vY3ljbG9uZWR4Lm9yZy9k
b2NzLzEuNi9qc29uLyA+ICNtZXRhZGF0YV9jb21wb25lbnRfY29tcG9uZW50cykuCj4gPiA+PiBB
IGxpc3Qgb2Ygc29mdHdhcmUgYW5kIGhhcmR3YXJlIGNvbXBvbmVudHMgaW5jbHVkZWQgaW4gdGhl
IHBhcmVudCA+PiBjb21wb25lbnQuIFRoaXMgaXMgbm90IGEgZGVwZW5kZW5jeSB0cmVlLiBJdCBw
cm92aWRlcyBhIHdheSB0byBzcGVjaWZ5ID4+IGEgaGllcmFyY2hpY2FsIHJlcHJlc2VudGF0aW9u
IG9mIGNvbXBvbmVudCBhc3NlbWJsaWVzLCBzaW1pbGFyIHRvID4+IHN5c3RlbSDihpIgc3Vic3lz
dGVtIOKGkiBwYXJ0cyBhc3NlbWJseSBpbiBwaHlzaWNhbCBzdXBwbHkgY2hhaW5zLgo+ID4+Cj4g
PiBJdCBzZWVtcyB0byBmaXQgdGhlIGV4dGVybmFsLgo+ID4gPiBJJ20gd29uZGVyaW5nIGlmIHRo
ZSByaWdodCBwbGFjZSB0byByZWZlcmVuY2UgdGhlIGV4dGVybmFsIGlzbid0IHRoZSA+ICdzdXBw
bGllcicgPyBBY2NvcmRpbmcgdG8gdGhlIHNwZWMgKGh0dHBzOi8vY3ljbG9uZWR4Lm9yZy9kb2Nz
LzEuNi9qc29uLyA+ICNjb21wb25lbnRzX2l0ZW1zX3N1cHBsaWVyKQo+ID4gPj4gVGhlIG9yZ2Fu
aXphdGlvbiB0aGF0IHN1cHBsaWVkIHRoZSBjb21wb25lbnQuIFRoZSBzdXBwbGllciBtYXkgb2Z0
ZW4gPj4gYmUgdGhlIG1hbnVmYWN0dXJlciwgYnV0IG1heSBhbHNvIGJlIGEgZGlzdHJpYnV0b3Ig
b3IgcmVwYWNrYWdlci4KPiA+Pgo+ID4gVGhlICdyZXBhY2thZ2VyJyBwYXJ0IGlzIHdoYXQgbWFr
ZXMgbWUgdGhpbmsgaXQgbWlnaHQgYmUgdGhlIHBsYWNlLiBBbmQgPiB5b3UganVzdCBsaW5rIHRv
IHRoZSAnZXh0ZXJuYWwgY29tcG9uZW50JyByZWZlcmVuY2UgaW4gdGhlICdib20tcmVmJyA+IHBy
b3BlcnR5Lgo+IAo+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGhlcmUsIHdvdWxkIHlvdSB3
YW50IHRvIHVzZSAic3VwcGxpZXIiIGZvciBwYWNrYWdlcyBpbiB0aGUgImNvbXBvbmVudHMiIGxp
c3QgdG8gbWFyayB0aGUgZXh0ZXJuYWwgdHJlZSB0aGV5J3JlIGZyb20sIGluc3RlYWQgb2YgYWRk
aW5nIHRoZSBCUl9FWFRFUk5BTF9UUkVFIHByb3BlcnR5PwoKWWVzIGV4YWN0bHksIHNvcnJ5IEkg
ZGlkbid0IGludHJvZHVjZSBteSBwb2ludC4KCj4gCj4gVGhhdCBkb2Vzbid0IHNlZW0gZml0dGlu
ZyB0byBtZSBiZWNhdXNlIGFjY29yZGluZyB0byB0aGUgc3BlY2lmaWNhdGlvbiB0aGUgc3VwcGxp
ZXIgaXMgc3VwcG9zZWQgdG8gYmUgYW4gb3JnYW5pemF0aW9uLCB3aGljaCB0aGUgZXh0ZXJuYWwg
dHJlZSBpc24ndC4gT2YgY291cnNlIGFuIGV4dGVybmFsIHRyZWUgaXMgbGlrZWx5IHN1cHBsaWVk
IGJ5IGFuIG9yZ2FuaXphdGlvbiAob3IgaW5kaXZpZHVhbCksIGJ1dCB3ZSBkb24ndCBoYXZlIHRo
YXQgaW5mb3JtYXRpb24uIElmIHdlIGhhZCBpdCwgd2UgY291bGQgcHV0IGl0IGludG8gdGhlICJz
dXBwbGllciIgZmllbGQgb2YgdGhlIGV4dGVybmFsIHRyZWUsIGFuZCByZWZlcmVuY2UgdGhhdCBh
cyB0aGUgcGFja2FnZSBzdXBwbGllci4gQnV0IHRoYXQgd291bGRuJ3QgbmVjZXNzYXJpbHkgYmUg
YSBvbmUtdG8tb25lIG1hcHBpbmcsIGJlY2F1c2Ugb25lIHN1cHBsaWVyIG1pZ2h0IHByb3ZpZGUg
bXVsdGlwbGUgZXh0ZXJuYWwgdHJlZXMuCgo+IAo+IEkgdGhpbmsgaXQgY291bGQgYmUgdXNlZnVs
IHRvIGV4cGFuZCB0aGUgY29udGVudCBvZiBleHRlcm5hbC5kZXNjIGZpbGVzIG9yIGFkZCBhbm90
aGVyIG1ldGFkYXRhIGZpbGUgdG8gKG9wdGlvbmFsbHkpIHByb3ZpZGUgdGhhdCBpbmZvcm1hdGlv
biwgYnV0IHRoYXQgc2hvdWxkIHByb2JhYmx5IGJlIGEgc2VwYXJhdGUgcGF0Y2ggc2VyaWVzIGlm
IHdlIHdhbnQgdG8gZG8gaXQuCj4gCj4gSSBkb24ndCByZWFsbHkgc2VlIGFueXRoaW5nIGluIHRo
ZSBjb21wb25lbnQgYXR0cmlidXRlcyB0aGF0IHNlZW1zIHRvIGZpdCB0aGUgcm9sZSBvZiBhbiBl
eHRlcm5hbCB0cmVlLCB0aGF0J3Mgd2h5IEkgd2VudCB3aXRoIHRoZSBjdXN0b20gcHJvcGVydHkg
KGFuZCB0aGUgcXVlc3Rpb24gd2hldGhlciB0byByZWdpc3RlciBhIG5hbWVzcGFjZSBmb3IgQnVp
bGRyb290IHByb3BlcnRpZXMgd2l0aCBDeWNsb25lRFgpLgoKTm8sIEkgd291bGQgcHJlZmVyIHRv
IGF2b2lkIGFzIG11Y2ggYXMgcG9zc2libGUgYWRkaW5nIHN0dWZmIHRvIHRoZSBwcm9wZXJ0aWVz
CmFuZCBpZiB0aGVyZSBhcmUgbm8gc3VpdGVkIHBsYWNlcyBtYXliZSB0cnkgdG8gYWRkIGl0IHRv
IHRoZSBuZXh0IHNwZWMgcmVsZWFzZQo/Cgo+IAo+ID4gVGhpcyBpcyBhbiBvcGVuIHF1ZXN0aW9u
LCBiZWNhdXNlIEknbSBmYWNpbmcgc2ltaWxhciBpc3N1ZSB0byBleHByZXNzID4gdGhlIGNvbmNl
cHQgb2YgZXh0ZXJuYWwgKG9yIHlvY3RvIGxheWVyLCBvciBvcGVud3J0IGZlZWRzKSBpbiBDeWNs
b25lRFguID4gSSB0aGluayB3ZSBjb3VsZCBjb250YWN0IGRpcmVjdGx5IHRoZSBwZW9wbGUgYmVo
aW5kIEN5Y2xvbmVEWCB0byBhc2sgdGhlID4gcXVlc3Rpb24uIFdoYXQgZG8geW91IHRoaW5rID8K
PiAKPiBUaGF0IHNlZW1zIHJlYXNvbmFibGUsIGVzcGVjaWFsbHkgd2l0aCB0aGUgcXVlc3Rpb24g
YXBwbHlpbmcgdG8gc2ltaWxhciBjb250ZXh0cyBlbHNld2hlcmUuIEl0IHByb2JhYmx5IGFsc28g
YXBwbGllcyB0byBzeXN0ZW1zIGJ1aWx0IGUuZy4gdXNpbmcgImNsYXNzaWMiIExpbnV4IGRpc3Ry
aWJ1dGlvbnMsIGlmIGV4dHJhIHBhY2thZ2UgcmVwb3NpdG9yaWVzIGFyZSBpbnZvbHZlZC4gSSdt
IG5vdCBzdXJlIHdoYXQncyB0aGUgcmlnaHQgcGxhY2UgdGhvdWdoLCBtYXliZSBhbiBpc3N1ZSBp
biB0aGUgc3BlY2lmaWNhdGlvbiByZXBvc2l0b3J5IChodHRwczovL2dpdGh1Yi5jb20vQ3ljbG9u
ZURYL3NwZWNpZmljYXRpb24pPwoKSSd2ZSBzZWVuIGEgbnVtYmVyIG9mIHF1ZXN0aW9ucyBhcm91
bmQgdGhlIHNwZWMgaW4gdGhpcyByZXBvLiBTaG91bGQgSSBvcGVuIG9uZQpvciB5b3Ugb3BlbiBp
dCA/Cgo+IAo+ID4gT3RoZXIgdGhhbiB0aGF0IHRvIG1lIHRoaXMgaXMgb2sgdG8gYmUgbWVyZ2Vk
Lgo+IAo+IFRoYW5rIHlvdSEgOi0pCj4gCj4gQmVzdCByZWdhcmRzLAo+IEZpb25hCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
