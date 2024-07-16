Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A07C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E819D40C20;
	Tue, 16 Jul 2024 21:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC7vryr_e7Xg; Tue, 16 Jul 2024 21:29:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7BEE40C21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7BEE40C21;
	Tue, 16 Jul 2024 21:29:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB2041BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D91B6606F1
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFeU1lAKlZdf for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A1C36066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1C36066E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A1C36066E
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:28:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DCDEC0004;
 Tue, 16 Jul 2024 21:28:54 +0000 (UTC)
Date: Tue, 16 Jul 2024 23:28:53 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20240716232853.4e27524c@windsurf>
In-Reply-To: <20240716145802.554307-1-vfazio@gmail.com>
References: <20240716145802.554307-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721165334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNwTNbfj1Z9/YWDHSSBAse6lvA8DYIv/Rdhcpv17owQ=;
 b=Zc+pLKpmPBiIDAHgqPYMaoPFkOBrGRmSgkd8t9LvVPelFWk2FPmbh1BBsvOv4pGbj7eXuV
 tx/0ul7Vu6rZjGa3zEkPg8/F/ExBbbO4UyMRWubrqcMaWwQQiDHMVrj9vHSkuvXiy/OaDO
 dlWmzq99QRVLrV9l/1g7fsEPTFCbQ3TsFp3O2/VC5cOWUsezT7xKhR/kLWLPF1WX6W1uIN
 6KTatUu0ViIw4hkV1DfQui1Vnrh6bAaRof0zS0/n6q2xceUkth+3HP2JhWtTH8k5m4xH56
 DRDz+xgJAKb89m4FhOAXU3w4aua2fndJLISis3EwxayxfX+1mim0W2aSA9Eulg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zc+pLKpm
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: use depth first search
 for directory removal
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNiBKdWwgMjAyNCAwOTo1ODowMiAtMDUwMApWaW5jZW50IEZhemlvIDx2ZmF6aW9A
Z21haWwuY29tPiB3cm90ZToKCj4gUHJldmlvdXNseSwgUHl0aG9uIGJ1aWxkcyBjb3VsZCBpbnRl
cm1pdHRlbnRseSBmYWlsIHdoZW4gcmVtb3ZpbmcgZmlsZXMKPiBpZiBgZmluZGAgcmVtb3ZlZCBh
IGRpcmVjdG9yeSBiZWZvcmUgc2VhcmNoaW5nIHdpdGhpbiBpdCBbMF0uCj4gCj4gQW4gYXJiaXRy
YXJ5IGV4YW1wbGU6Cj4gCj4gICAvdG1wL3RtcC5oOUtNVXNlNXpPICQgZmluZCAuIC10eXBlIGQg
LW5hbWUgX19weWNhY2hlX18gLWV4ZWMgcm0gLXJ2ZiB7fSBcOyA7IGVjaG8gLWUgIlJFVFVSTiBD
T0RFOiAkPyIKPiAgIHJlbW92ZWQgZGlyZWN0b3J5ICcuL2EvYi9jL2QvZS9fX3B5Y2FjaGVfXycK
PiAgIGZpbmQ6IOKAmC4vYS9iL2MvZC9lL19fcHljYWNoZV9f4oCZOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5Cj4gICByZW1vdmVkIGRpcmVjdG9yeSAnLi9hL2IvYy9kL2UvZi9fX3B5Y2FjaGVf
XycKPiAgIGZpbmQ6IOKAmC4vYS9iL2MvZC9lL2YvX19weWNhY2hlX1/igJk6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkKPiAgIHJlbW92ZWQgZGlyZWN0b3J5ICcuL2EvYi9jL2QvZS9mL2cvX19w
eWNhY2hlX18nCj4gICBSRVRVUk4gQ09ERTogMQo+IAo+IE5vdywgcGFzcyB0aGUgYC1kZXB0aGAg
YXJndW1lbnQgdG8gYGZpbmRgIHNvIGEgZGVwdGgtZmlyc3Qgc2VhcmNoIGlzCj4gcGVyZm9ybWVk
IHRvIGF2b2lkIHRyeWluZyB0byBzZWFyY2ggd2l0aGluIGFuIGFscmVhZHkgZGVsZXRlZCBmb2xk
ZXIuCj4gCj4gRml4ZXM6IDU0ZDQ4YzhjYWQ0ZSAoInBhY2thZ2UvcHl0aG9uMzogbWlzY2VsbGFu
ZW91cyBmaXh1cHMiKQo+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy9iYTFkNDIxM2FlOTkxMmQ1MzQxMmRlZDZkOGUyNTdiNjdhNGY3YzBlLwo+IFNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0BnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uv
cHl0aG9uMy9weXRob24zLm1rIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
