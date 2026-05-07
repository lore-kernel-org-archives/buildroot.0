Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FE0CD3445
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 23:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37127412AB;
	Thu,  7 May 2026 23:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5VMppW6s8LF; Thu,  7 May 2026 23:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C64D412AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778195009;
	bh=3gogGToz4WzxTA9yCtSKCI2tfLhwAwbO6CeW9JcT3qY=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DmVNWnuI5/DKXh/2HQAmy+UuMJ2ttcGBt9aakIaG7Yh7xYUHBlUF1tPztjWRIL6vd
	 Kjt3i99lNhMcPHcrDjnnCoAKhdI8mVeQd6xhycosFQ2JIJ31bz6HFRmI+/jf2tHiSE
	 JuwF+GM3yY4TDKRIcgvRoNLRl+VqOA/h1JrTCyzFbwFTCdorJEHv62MCJPT+3WMmtR
	 9WHTIDDfm/CZNI8PjbHxRcnCUY/w7SMysvOiBym+W3k9yNPSoLzR6YS9Y6cHSTiXNN
	 dYjzLyCxRVv6iF7CEJj6z5i2eOSeyEJZzZqzQUoJ3Hkkkx02bmYd9UZF+ERswxWefx
	 rb+BOQBebM+jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C64D412AC;
	Thu,  7 May 2026 23:03:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FF04317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 23:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15C14407F0
 for <buildroot@buildroot.org>; Thu,  7 May 2026 23:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPISTffcIgzY for <buildroot@buildroot.org>;
 Thu,  7 May 2026 23:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBE38400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBE38400A2
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBE38400A2
 for <buildroot@buildroot.org>; Thu,  7 May 2026 23:03:26 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-393800f638bso10951471fa.1
 for <buildroot@buildroot.org>; Thu, 07 May 2026 16:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778195004; x=1778799804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6m0h0Y2JYdE0WFCQYNgSreEzlv1OUoqtLsNf0R3p4zY=;
 b=Ap4VMBT5ftzUmHRvYv+RhEwOjeIczEEN2eg0BmnpXQ5mUUMmyR7Y5Zz3lMqNmrZt2q
 M+cX+4b60lyQ3WHbMLZshTrfHRYurNDfBavR9IzdxYStzBKoceFkKxLd0GQlCVPuBIo9
 0wn2kc7WCAupl74Ql3GMBFI7X/CdZc0g7QlFOJmcmFY5cqQdHMjcf+qqH/jo/AjkLSg2
 jwsFNAP8jySGciYLDcmF1lzFEluYI0kR6/bS4RaEBkbG8WU8P4QEQTbp6KlAGadbo1JC
 JN6HsX8vTgmJuauChXumxTFyBf3pwR3kqI8SP35CuGBdfJJZwmMTa4WuL9UdIaPm9cID
 s1vg==
X-Gm-Message-State: AOJu0YyaG1D2PkT+VgcZtyQBHcVpOU7+vSjcYtL632EbcjQ/G5njUBIm
 z0wIohC0bgLh4Akr5e5aiP6M72gXjzGZE6R9b/BXWG+Pb1cac33O4fJ28QsJX83I3RF3/BNH5aQ
 Om0hi0mHk6A==
X-Gm-Gg: AeBDievJ/lEne1KGbL/w/nVt/AihMdIgb+2g7m1P/DIx64HkDQaxXIERssWjbxH9jbV
 dQCl2X9F4XRXJggdxYCXQk+2LlgJghm8oBX7fucAoqkdKCjDMtlLn+6vG+eGffZHPLLyyJN7ZNb
 K30PESoJPMKxwiygQNgDDSGT8Qo0M7vh4zRbzyoFtd/QWp/Tl5Os1XDf2LkIBcpEje0xafTvDib
 p0SYuSK0WIDVgjvYgJx/xhmi5qtWXtyjWmiVbjKNmUidnOqeXAiI6gj4wQUDsNLFuG3Xdh2JgbW
 X3piNiRjRaIhQaYfqb3fvq5O0BFVFzS6C8QxE6RPzzVc7zF5ZXZUWNq1ikMV9H2b6PHOb3982Jt
 UEwI+iBJLqatkAqJfQWgQB3P1clpTwf+tvwVeBa5sBXdg0Eki7wKJlP7aGgSX2UNiBW55nO4T0U
 vv4Yg/QN/tV/XhDdUYdoNYbkKQQ2ICKF9DUIA/Oo5JYZdkLQ86U79p08laOQTNnKnn/APEnbgYa
 /UC
X-Received: by 2002:a2e:a547:0:b0:391:1570:b6c6 with SMTP id
 38308e7fff4ca-393c40cf49dmr38990751fa.2.1778195003848; 
 Thu, 07 May 2026 16:03:23 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-393f6131c08sm319461fa.30.2026.05.07.16.03.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 16:03:22 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39380e79936so18728721fa.2
 for <buildroot@buildroot.org>; Thu, 07 May 2026 16:03:20 -0700 (PDT)
X-Received: by 2002:a05:6512:304b:b0:5a8:6e64:a932 with SMTP id
 2adb3069b0e04-5a887cea7efmr4332079e87.32.1778195000289; Thu, 07 May 2026
 16:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260507195049.1002469-1-peter@korsgaard.com>
 <20260507195049.1002469-2-peter@korsgaard.com>
In-Reply-To: <20260507195049.1002469-2-peter@korsgaard.com>
Date: Thu, 7 May 2026 16:03:08 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oBboZAUtUcCrXCygJ7c66+4k+iFNLEBeyTFhUQA0pq-w@mail.gmail.com>
X-Gm-Features: AVHnY4JRJNt-LLC9LabBf8QmyzOV2QA2vWbyGFwnW6up2utgZ8_HO59DZWBw3QE
Message-ID: <CA+h8R2oBboZAUtUcCrXCygJ7c66+4k+iFNLEBeyTFhUQA0pq-w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1778195004; x=1778799804; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6m0h0Y2JYdE0WFCQYNgSreEzlv1OUoqtLsNf0R3p4zY=;
 b=S5IxaBqzrGb4wXpy/giDO94HQ1mnVjuwsuX+3eT9ruRDEuB5BqXVudMWBz5OZflcKs
 w7E84JoedhMPX+FXW8635WOuSVc9p5EZGjGNdiZCLTA7WZclVTxm3eSrT4squ9ZS+EZQ
 TePBBXHJ1sgfP8rxYG6dhbgwOFYFzZG0zOt0+CZYYQ8iYveztGqeBGMCLYMn8RVoWs1X
 qFGa3kQKwzu2hz4guu4cA7vez3j+EYOPSNFiStQzX6H1O6wU71ZLJczgKXfGBYp51l3v
 80Bh6ftKNYdkIfdAEoAqvFXSjZVtEOKCFUbXDeuToaUNpgR/J75VYtjRfwXV0z0bLbsn
 4m4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=S5IxaBqz
Subject: Re: [Buildroot] [PATCH 2/2] package/go-bootstrap-stage5: security
 bump to version 1.25.10
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKCk9uIFRodSwgTWF5IDcsIDIwMjYgYXQgMTI6NTDigK9QTSBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBz
ZWN1cml0eSBpc3N1ZXM6Cj4KPiBDVkUtMjAyNi0zMzgxMTogbmV0OiBjcmFzaCB3aGVuIGhhbmRs
aW5nIGxvbmcgQ05BTUUgcmVzcG9uc2UKPiBDVkUtMjAyNi0zMzgxNDogbmV0L2h0dHA6IGluZmlu
aXRlIGxvb3AgaW4gSFRUUC8yIHRyYW5zcG9ydCB3aGVuIGdpdmVuIGJhZAo+ICAgICAgICAgICAg
ICAgICBTRVRUSU5HU19NQVhfRlJBTUVfU0laRQo+IENWRS0yMDI2LTM5ODE3OiBjbWQvZ286ICJn
byB0b29sIHBhY2siIGRvZXMgbm90IHNhbml0aXplIG91dHB1dCBwYXRocwo+IENWRS0yMDI2LTM5
ODE5OiBtZC9nbzogImdvIGJ1ZyIgZm9sbG93cyBzeW1saW5rcyBpbiBwcmVkaWN0YWJsZSB0ZW1w
b3JhcnkKPiAgICAgICAgICAgICAgICAgZmlsZW5hbWVzCj4gQ1ZFLTIwMjYtMzk4MjA6IG5ldC9t
YWlsOiBxdWFkcmF0aWMgc3RyaW5nIGNvbmNhdGVuYXRpb24gaW4gY29uc3VtZUNvbW1lbnQKPiBD
VkUtMjAyNi0zOTgyMzogaHRtbC90ZW1wbGF0ZTogYnlwYXNzIG9mIG1ldGEgY29udGVudCBVUkwg
ZXNjYXBpbmcgY2F1c2VzCj4gICAgICAgICAgICAgICAgIFhTUwo+IENWRS0yMDI2LTM5ODI1OiBu
ZXQvaHR0cC9odHRwdXRpbDogUmV2ZXJzZVByb3h5IGZvcndhcmRzIHF1ZXJpZXMgd2l0aCBtb3Jl
Cj4gICAgICAgICAgICAgICAgIHRoYW4gdXJsbWF4cXVlcnlwYXJhbXMgcGFyYW1ldGVycwo+IENW
RS0yMDI2LTM5ODI2OiBodG1sL3RlbXBsYXRlOiBlc2NhcGVyIGJ5cGFzcyBsZWFkcyB0byBYU1MK
PiBDVkUtMjAyNi0zOTgzNjogbmV0OiBwYW5pYyBpbiBEaWFsIGFuZCBMb29rdXBQb3J0IHdoZW4g
aGFuZGxpbmcgTlVMIGJ5dGUgb24KPiAgICAgICAgICAgICAgICAgV2luZG93cwo+IENWRS0yMDI2
LTQyNDk5OiBuZXQvbWFpbDogcXVhZHJhdGljIHN0cmluZyBjb25jYXRlbmF0aW9uIGluIGNvbnN1
bWVQaHJhc2UKPiBDVkUtMjAyNi00MjUwMTogY21kL2dvOiBtYWxpY2lvdXMgbW9kdWxlIHByb3h5
IGNhbiBieXBhc3MgY2hlY2tzdW0gZGF0YWJhc2UKPgo+IGdvMS4yNS4xMCAocmVsZWFzZWQgMjAy
Ni0wNS0wNykgaW5jbHVkZXMgc2VjdXJpdHkgZml4ZXMgdG8gdGhlIGdvIGNvbW1hbmQsCj4gdGhl
IHBhY2sgdG9vbCwgYW5kIHRoZSBodG1sL3RlbXBsYXRlLCBuZXQsIG5ldC9odHRwLCBuZXQvaHR0
cC9odHRwdXRpbCwKPiBuZXQvbWFpbCwgYW5kIHN5c2NhbGwgcGFja2FnZXMsIGFzIHdlbGwgYXMg
YnVnIGZpeGVzIHRvIHRoZSBnbyBjb21tYW5kLCB0aGUKPiBjb21waWxlciwgdGhlIGxpbmtlciwg
dGhlIHJ1bnRpbWUsIGFuZCB0aGUgY3J5cHRvL2ZpcHMxNDAsIGdvL3R5cGVzLCBhbmQgb3MKPiBw
YWNrYWdlcy4KPgo+IGh0dHBzOi8vZ28uZGV2L2RvYy9kZXZlbC9yZWxlYXNlI2dvMS4yNS4xMAo+
Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTUvZ28tYm9vdHN0cmFwLXN0YWdl
NS5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTUvZ28tYm9vdHN0
cmFwLXN0YWdlNS5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dvL2dvLWJvb3RzdHJh
cC1zdGFnZTUvZ28tYm9vdHN0cmFwLXN0YWdlNS5oYXNoIGIvcGFja2FnZS9nby9nby1ib290c3Ry
YXAtc3RhZ2U1L2dvLWJvb3RzdHJhcC1zdGFnZTUuaGFzaAo+IGluZGV4IDVlNDBiYTdlNmUuLjU4
MzkxNDcxZDkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nby9nby1ib290c3RyYXAtc3RhZ2U1L2dv
LWJvb3RzdHJhcC1zdGFnZTUuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZ28vZ28tYm9vdHN0cmFwLXN0
YWdlNS9nby1ib290c3RyYXAtc3RhZ2U1Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBGcm9t
IGh0dHBzOi8vZ28uZGV2L2RsCj4gLXNoYTI1NiAgZTk4OGQ0YTI0NDZhYzdmZTNmNmRhYTA4OWE1
OGU5OTM2YTUyYTM4MTM1NWFkZWMxYzg5ODMyMzBhOGQ2YzU5ZSAgZ28xLjI1Ljguc3JjLnRhci5n
ego+ICtzaGEyNTYgIDIwY2YwNGE5MmU1YWY5OTc0OGUzNDFiYzg5OTZmYTI4MDkwYzlhYzk4NzY1
ZmExMTVlYzVkZGY0MWQ3YWY0MWQgIGdvMS4yNS4xMC5zcmMudGFyLmd6Cj4gIHNoYTI1NiAgOTEx
ZjhmNTc4MjkzMTMyMGY1YjhkMTE2MGE3NjM2NWI4M2FlYTY0NDdlZTZjMDRmYTZkNTU5MTQ2N2Ri
OWRhZCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFn
ZTUvZ28tYm9vdHN0cmFwLXN0YWdlNS5tayBiL3BhY2thZ2UvZ28vZ28tYm9vdHN0cmFwLXN0YWdl
NS9nby1ib290c3RyYXAtc3RhZ2U1Lm1rCj4gaW5kZXggOTAwNmU1YmY0NC4uODU0Njg0MTRhMiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dvL2dvLWJvb3RzdHJhcC1zdGFnZTUvZ28tYm9vdHN0cmFw
LXN0YWdlNS5tawo+ICsrKyBiL3BhY2thZ2UvZ28vZ28tYm9vdHN0cmFwLXN0YWdlNS9nby1ib290
c3RyYXAtc3RhZ2U1Lm1rCj4gQEAgLTYsNyArNiw3IEBACj4KPiAgIyBVc2UgbGFzdCBHbyB2ZXJz
aW9uIHRoYXQgZ28tYm9vdHN0cmFwLXN0YWdlNCBjYW4gYnVpbGQ6IHYxLjI1LngKPiAgIyBTZWUg
aHR0cHM6Ly9nby5kZXYvZG9jL2dvMS4yNiNib290c3RyYXAKPiAtR09fQk9PVFNUUkFQX1NUQUdF
NV9WRVJTSU9OID0gMS4yNS44Cj4gK0dPX0JPT1RTVFJBUF9TVEFHRTVfVkVSU0lPTiA9IDEuMjUu
MTAKCgpMZ3RtLgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVy
dHVyZS51cz4KCkZvciB3aGF0IGl0J3Mgd29ydGgsIHRoaXMgaXMganVzdCB1c2VkIHRvIGJvb3Rz
dHJhcCB0aGUgR28gY29tcGlsZXIsCnNvIHRoZXNlIENWRXMgd291bGRuJ3QgcmVhbGx5IGFwcGx5
LgoKQmVzdCwKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
