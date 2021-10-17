Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D1BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:53:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD36861039
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD36861039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B57A400F6;
	Sun, 17 Oct 2021 15:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oiqq_R8ChHn; Sun, 17 Oct 2021 15:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BAA04015E;
	Sun, 17 Oct 2021 15:53:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B33F1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FA281C6E
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tHn4Jmq_nVA for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 15:53:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46A0D81C67
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 15:53:35 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a25so60504326edx.8
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7rG0Tjl9mHuKkHFOa8FSHTEKsIoH+8ln2rdZyA2p+KU=;
 b=OSetDL0dnjAP24rHCa1Djt8hZhANpZQisgEZknZMFOeAKrKJUoMdPcTucWwdwofWAM
 FbB0vxwO+JiCg/6l1MYHI4CKCTaCKWW7u02h8v1kUfhWoEWaPQ4swfKjmHl30zUKFI6E
 oaMmmir1Gq6xRSSLUbjnEAaGfMejyFiJmuPtxzLrLCC0d7WzC1sD8JAfK9uxua59PV4c
 XzRTu3dvdoVh96Qw8MWzFLNNDQ3Qopae89QuTbskNwH6yH2TihWGxWWJt1U9gSY3MX+H
 Va3MU0ZNfywx3MHkmqRaRlUChmdL3rf86GMRkn1SI+7LVHea0TJtcEBhc3En3tO/rT5T
 KDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7rG0Tjl9mHuKkHFOa8FSHTEKsIoH+8ln2rdZyA2p+KU=;
 b=5jqC0a/INlzcFBok0RYnMYbsTB5Y6szDguOFEnIUOxtM2lU3moRv9qkrk99HYiV2xv
 1PovsgL1Oghmvqq9dXVe+aB+Mv/T0ZbMDFBZxUl0yBfAms2UG9ulf91dTMVdOPgj5mFS
 G/ICraYXQufwigk6JO3hn0jZBoQ8rPSBrFSzA8t+h8ky+V1gvFtnX+QeJV7unNNpZisF
 tWgLdWpPQaw8O0BUaP5bq3eDeFSEagtpAFS8zo9YuGHwklO/7UnbOMndidCPBXX8LIRC
 b7+65ZWCEw149fWG7x4OxtNK01E4y0GB1ptwaMlUmlxpvFs1/mMUBRw1L1CHvGn0CI08
 dN2Q==
X-Gm-Message-State: AOAM530QzEfIxwT8b2prs09+DyIxPE3vA0GutyN4ELBGwuZVm7NXR73j
 /TDZ8lM9c5WIfzSyB/4CI1rAIg==
X-Google-Smtp-Source: ABdhPJzl9Sbi7hk52W1Pr/fG1m9haDmAb2/UvNdEa1wBhB3tsEqRmgRBliiKFcLEJ4XuZ4P4O/g/BA==
X-Received: by 2002:a05:6402:3186:: with SMTP id
 di6mr35711218edb.225.1634486013495; 
 Sun, 17 Oct 2021 08:53:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm7792805ejo.36.2021.10.17.08.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 08:53:33 -0700 (PDT)
Message-ID: <e565a636-daf4-8342-31f8-3718757448fd@mind.be>
Date: Sun, 17 Oct 2021 17:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: joblacker@cfl.rr.com, buildroot@buildroot.org
References: <00bc01d7c2a1$0da32d80$28e98880$@cfl.rr.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <00bc01d7c2a1$0da32d80$28e98880$@cfl.rr.com>
Subject: Re: [Buildroot] Error performing Make with External Toolchain
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

CgpPbiAxNi8xMC8yMDIxIDE3OjE4LCBKb2huIHdyb3RlOgo+IF9UV0lNQzpfCj4gCj4gSeKAmXZl
IGJlZW4gdHJ5aW5nIHRvIGdldCBCVUlMRFJPT1QgdG8gc3VjY2Vzc2Z1bGx5IOKAnG1ha2XigJ0g
Zm9yIHNldmVyYWwgZGF5cyB0byBubyAKPiBhdmFpbC7CoCBJ4oCZbSB0cnlpbmcgdG8gdXNlIHRo
ZSBsYXRlc3QgY3Jvc3N0b29sLU5HIHRvb2xjaGFpbizCoCBzbyBJ4oCZdmUgc3BlY2lmaWVkCgog
IEl0J3MgYmVlbiBtYW55IHllYXJzIHNpbmNlIGFueW9uZSBoYXMgdHJpZWQgdG8gdXNlIGEgY3Jv
c3N0b29sLU5HIHRvb2xjaGFpbiwgCnNvIFlNTVYuCgoKPiBhbiBleHRlcm5hbCB0b29sY2hhaW4u
wqAgSeKAmXZlIHNlbGVjdGVkIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBCVUlMRFJPT1QgYW5kIHRo
ZSAKPiBsYXRlc3Qga2VybmVsIGhlYWRlcnMuwqAgSeKAmXZlIHNlbGVjdGVkIGdsaWJjL2VnbGli
YyBhbmQgc3VwcG9ydCBmb3IgU1NQLCBzdHJvbmcgU1NQCj4gCj4gYW5kIEMrKyBzdXBwb3J0LsKg
IFRoZSBmaXJzdCBhdHRlbXB0IEkgaGFkIHRoZSBvcHRpb24gZm9yIHVsaWJjIHNlbGVjdGVkIGFs
b25nIAo+IHdpdGggUlBDIGFuZCByYW4gaW50byBhbiBlcnJvciwgc28gSSB1bnNlbGVjdGVkIFJQ
QyBhbmQgY2hhbmdlZCB0byBnbGliYy9lZ2xpYmMgYW5kCj4gCj4gaGVyZeKAmXMgbXkg4oCcbWFr
ZeKAnSBvdXRwdXQ6CgogIFdoZW4geW91IGNoYW5nZSBhbnkgb2YgdGhlIHRvb2xjaGFpbiBvcHRp
b25zLCB5b3UgbmVlZCB0byBkbyBhIGNsZWFuIGJ1aWxkIAooaS5lLiAibWFrZSBjbGVhbjsgbWFr
ZSIpLgoKCj4gCj4gID4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+
Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pgo+IAo+IGpiQGpiLVZpcnR1YWxCb3gtZGV2On4vR2l0SHViL2J1
aWxkcm9vdCQgbWFrZQo+IAo+IC91c3IvYmluL21ha2UgLWoxIE89L2hvbWUvamIvR2l0SHViL2J1
aWxkcm9vdC9vdXRwdXQgSE9TVENDPSIvdXNyL2Jpbi9nY2MiIAo+IEhPU1RDWFg9Ii91c3IvYmlu
L2crKyIgc3luY2NvbmZpZwo+IAo+ICA+Pj4gdG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbcKgIENv
bmZpZ3VyaW5nCj4gCj4gID4+PiB0b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9twqAgQnVpbGRpbmcK
PiAKPiAvdXNyL2Jpbi9nY2MgLU8yIC1JL2hvbWUvamIvR2l0SHViL2J1aWxkcm9vdC9vdXRwdXQv
aG9zdC9pbmNsdWRlIAo+IC1EQlJfQ1BVPSciY29ydGV4LWE1MyInIC1EQlJfQUJJPSciYWFwY3Mt
bGludXgiJyAtREJSX0ZQVT0nIm5lb24tdmZwdjQiJyAKPiAtREJSX0ZMT0FUX0FCST0nImhhcmQi
JyAtREJSX01PREU9JyJhcm0iJyAtREJSX0NST1NTX1BBVEhfU1VGRklYPSciIicgCj4gLURCUl9D
Uk9TU19QQVRIX0FCUz0nIi9ob21lL2piL3dvcmtzcGFjZS90b29sY2hhaW5zL2FybXY4LXJwaTMt
bGludXgtZ251ZWFiaWhmL2JpbiInIAo+IC1EQlJfU1lTUk9PVD0nImFybS1idWlsZHJvb3QtbGlu
dXgtZ251ZWFiaWhmL3N5c3Jvb3QiJyAKPiAtREJSX0FERElUSU9OQUxfQ0ZMQUdTPSciLWZzdGFj
ay1wcm90ZWN0b3Itc3Ryb25nIiwnIC1EQlIyX1BJQ19QSUUgCj4gLURCUjJfUkVMUk9fRlVMTCAt
cyAtV2wsLS1oYXNoLXN0eWxlPWJvdGggdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLmMgLW8g
Cj4gL2hvbWUvamIvR2l0SHViL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvdG9vbGNoYWluLWV4dGVy
bmFsLWN1c3RvbS90b29sY2hhaW4td3JhcHBlcgo+IAo+ICA+Pj4gdG9vbGNoYWluLWV4dGVybmFs
LWN1c3RvbcKgIEluc3RhbGxpbmcgdG8gc3RhZ2luZyBkaXJlY3RvcnkKPiAKPiAvdXNyL2Jpbi9p
bnN0YWxsIC1EIC1tIDA3NTUgCj4gL2hvbWUvamIvR2l0SHViL2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvdG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbS90b29sY2hhaW4td3JhcHBlciAKPiAvaG9tZS9q
Yi9HaXRIdWIvYnVpbGRyb290L291dHB1dC9ob3N0L2Jpbi90b29sY2hhaW4td3JhcHBlcgo+IAo+
IGxuOiBmYWlsZWQgdG8gY3JlYXRlIHN5bWJvbGljIGxpbmsgCj4gJy9ob21lL2piL0dpdEh1Yi9i
dWlsZHJvb3Qvb3V0cHV0L2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9v
dC91c3IvbGliJzogCj4gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+IG1ha2VbMV06ICoq
KiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazozMDk6IAo+IC9ob21lL2piL0dpdEh1Yi9idWlsZHJv
b3Qvb3V0cHV0L2J1aWxkL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vLnN0YW1wX3N0YWdpbmdf
aW5zdGFsbGVkXSAKPiBFcnJvciAxCj4gCj4gbWFrZTogKioqIFtNYWtlZmlsZTo4NDogX2FsbF0g
RXJyb3IgMgo+IAo+IDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PAo+IAo+IEkgY2hlY2tlZCBmb3IgdGhlIHByZXNlbmNlIG9mIHRo
ZSDigKZzeXNyb290L3Vzci9saWIgZGlyZWN0b3J5IG5vdGVkIGluIHRoZSBlcnJvciAKPiBhbmQg
aXQgZG9lcyBub3QgZXhpc3QsIGFsbCBJIGhhdmUgaXMgYSDigJxsaWLigJ0gZGlyZWN0b3J5LsKg
IElmIEkgdHJ5IHRvIGlzc3VlIGEgbHMgCj4gbGliIEkgZ2V0IGFuIGVycm9yOgo+IAo+IOKAnGxz
OiBjYW5ub3QgYWNjZXNzIOKAmGxpYuKAmTogVG9vIG1hbnkgbGV2ZWxzIG9mIHN5bWJvbGljIGxp
bmtz4oCdCgogIFRoaXMgZGlyZWN0b3J5IGlzIGNyZWF0ZWQgYnkgdGhlICJza2VsZXRvbi1pbml0
LWNvbW1vbiIgcGFja2FnZSwgYW5kIEFGQUlDUyAKbm90IGNoYW5nZWQgYnkgYW55dGhpbmcgYWZ0
ZXIgdGhhdCAoYWx0aG91Z2gsIHRvIGJlIGhvbmVzdCwgdGhlIGxvZ2ljIG9mIHRoZSAKZXh0ZXJu
YWwgdG9vbGNoYWluIGluc3RhbGxhdGlvbiBpcyBzb21ldGltZXMgYSBiaXQgaGFyZCB0byBmb2xs
b3cpLgoKICBJcyBpdCBwb3NzaWJsZSB0aGF0IHlvdSBoYXZlIGEgY3VzdG9tIHNrZWxldG9uIHRo
YXQgZG9lcyBzb21ldGhpbmcgd2VpcmQ/CgogIENhbiB5b3UgZG8gImxzIC1sIC4uLi9zeXNyb290
IiA/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IE5vdCBiZWluZyBmYW1pbGlhciB3aXRoIHRo
ZSBCVUlMRFJPT1QgcHJvY2VzcywgSeKAmW0gYXQgYSBsb3NzIHJlZ2FyZGluZyB3aGF0IHRvIAo+
IGRvIGFuZCBuZWVkIGhlbHAuCj4gCj4gVGhhbmsgeW91Lgo+IAo+IEpvaG4gQmxhY2tlcgo+IAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
