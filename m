Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47582CD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227898469C;
	Mon,  4 May 2026 14:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpSwAODQWyRm; Mon,  4 May 2026 14:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3424F84693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906100;
	bh=bJhtcsTGuxHwD2dXeDK690aWK4i7coEBKVZ3H/advWU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OvteSsLV8AtS56be13UrM6WIjWU0BnhVBTU3mHtcwS2JW+8pelMNBtqvpcgvXX5je
	 5Yz+ElYJb59d2G+HAVtEl2cwJAb3dqM++sy/+WrJf/Ji47OKe/WissAUe4+MqiCMG0
	 H2rgUtfzsMttnGJ5GP9sHhDYi1n5Qvji2L60rKsK+v6oz9ohsrVzT0RmL4Rd4zW2S0
	 K8CcshJmCL0no70TBqHqQA2L5clHZRIlRSNu/PAWGKgjE/i5C7Ec6pgNGpz/fTimyi
	 q7MgxuRxjixJNPlnVCZiyfMN8KJ1Kvt3lFEMS/WiEdq75q7V9O7Ynn9kjVBfQYEYoQ
	 BHfEkQ4miBL1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3424F84693;
	Mon,  4 May 2026 14:48:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D84925D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0333640B70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNfqmk7a1MZ9 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD7D84079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7D84079C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD7D84079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488ad135063so38309795e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906095; x=1778510895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r8MpZPJfwwaEPiLERVrOWoLJHvTeAeq2cWDsbYGdlNU=;
 b=XjmKqX+HjwqdqTEZcSvu+5UvlqWoB/FTrd23NjHysfesV61pitT0gbfN6Gm4qVVIGK
 qTFx074rD/azMzavHiEB90cRTXz/aNJ/yYTLpQ08OOYO+31oO5WejEVW30zafVJ7064h
 YCgH4nESjQ5JfI7gc2J+Ivnik3gNa3xZdDCBfiDOAcqnyVWUEHvkOWYhflnQXC8lL8Gy
 lfS6g2xAPIYPAZ//9JVoMW6xCR/NXkZACaYXiYZCSMYAyC5cikKMQFQfG2OKrnATWnfB
 ofUVnGrijnHVxAqjaqcZ9VKB77basth+JA6kQWu0y769+oOSawJbU1cP5UET+jyWpvzS
 VmcA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8EpA+iQbofo45BvnKQteEL7ptE1iUW+eSfDKJ46hFYH0iyWHyhRDLsioOs+IxvvW9iRBQlIVeOFFA=@buildroot.org
X-Gm-Message-State: AOJu0YxRE2jAxIh7lYEyLWkdFY0rZclclbn2I4GeLyDjPJ1kIrg+KOi2
 vxyBFClhlXojU//81E4nCNvBVgk/r+ZTwVtoaZ9EOQNA3iNwAIsZiVpQm2xFur3TYDU=
X-Gm-Gg: AeBDietHEar5ZmHDlzwPpRWVZCrtUIU+1gWOTYAC4ArY6+3jRlRJFhhPrUYH5a1wA0N
 yfd/BiUrRC2n1DX6YczCI/FgXlVWgXGzZfbKl0CCqdIEG6c8NONJXlzvSXadrfY4Ja3yXrxMXgT
 5RD0TQBJclOH9BRzx9d+ArvPZ97Orlp5ZiNBJk5nTVJ810vwO4lWHBTx1F519Fm2R4mV8cvZO2k
 iUl7tMgi7tvCWo0pFENxMzirW+vQtlc0bq9mrbz0gBwj6JSz4+fXg6qhEgB+XUpmJkwXI8tFW+T
 XS3LOuwhJnkexvOYUaWIWmQPx1JLuPnSyWxTc58YM9X0D3gLIVV9Sa0WD8EZFQsLhf88KjzyWZz
 UcQwLvo3JEf3RA1fOxYPG4LL/ScoLUWsi8IANFxXv4njA0GRVDS2HWt6nalzZxQSKUHk+vmCTny
 fDaP1R8W558tr2zD5lTm4ONPxj+g==
X-Received: by 2002:a05:600c:a30a:b0:48a:5821:5ffc with SMTP id
 5b1f17b1804b1-48a98871229mr116594135e9.2.1777906094581; 
 Mon, 04 May 2026 07:48:14 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822be902sm358303695e9.6.2026.05.04.07.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:14 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:13 +0200
Message-ID: <20260504144813.11252-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422215427.186961-1-buildroot@bubu1.eu>
References: <20260422215427.186961-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906095; x=1778510895; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8MpZPJfwwaEPiLERVrOWoLJHvTeAeq2cWDsbYGdlNU=;
 b=J/vHRWTznyZKU8OcBmkajLXilDgYuiZDNlkDaZsrN0Q4tFFqxKXxzRdbqdRp/qoS31
 F2BuWFej1fzXVdYPVN1NxmlZNFoCBYNzVM2abcxeMeIb9hZMjdeiQfCqNTYmGkIvameZ
 mnANs3hlzj2TnE+nGNfZjc3lR2J/4d83ZnSlUc0rwibQyZxOh/x874Uga6j0OrVa/2Tm
 r3Gv3Tdsgm7rXozJMIIZS6NR+IorGc97MGNyO23ux7h4Zl/niU8yv2WJFxbMUxitoKJy
 Yq2rtjgc67/hoSsDbQa7Zw1NnE1ibCOZ133vmsw6wx0YXMMttDDPOnoM0NHkEYG51oS+
 1cBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J/vHRWTz
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 6.0.4
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

SW4gcmVwbHkgb2Y6Cj4gRGphbmdvIDYuMC40IGZpeGVzIG9uZSBzZWN1cml0eSBpc3N1ZSB3aXRo
IHNldmVyaXR5IOKAnG1vZGVyYXRl4oCdLCBmb3VyCj4gc2VjdXJpdHkgaXNzdWVzIHdpdGggc2V2
ZXJpdHkg4oCcbG934oCdLCBhbmQgc2V2ZXJhbCBidWdzIGluIDYuMC4zLgo+IAo+IFNlY3VyaXR5
IGlzc3VlczoKPiAqIENWRS0yMDI2LTM5MDI6IEFTR0kgaGVhZGVyIHNwb29maW5nIHZpYSB1bmRl
cnNjb3JlL2h5cGhlbiBjb25mbGF0aW9uCj4gICAgIEFTR0lSZXF1ZXN0IG5vcm1hbGl6ZXMgaGVh
ZGVyIG5hbWVzIGZvbGxvd2luZyBXU0dJIGNvbnZlbnRpb25zLCBtYXBwaW5nCj4gICAgIGh5cGhl
bnMgdG8gdW5kZXJzY29yZXMuIEFzIGEgcmVzdWx0LCBldmVuIGluIGNvbmZpZ3VyYXRpb25zIHdo
ZXJlCj4gICAgIHJldmVyc2UgcHJveGllcyBjYXJlZnVsbHkgc3RyaXAgc2VjdXJpdHktc2Vuc2l0
aXZlIGhlYWRlcnMgbmFtZWQgd2l0aAo+ICAgICBoeXBoZW5zLCBzdWNoIGEgaGVhZGVyIGNvdWxk
IGJlIHNwb29mZWQgYnkgc3VwcGx5aW5nIGEgaGVhZGVyIG5hbWVkIHdpdGgKPiAgICAgdW5kZXJz
Y29yZXMuCj4gCj4gICAgIFVuZGVyIFdTR0ksIGl0IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0
aGUgc2VydmVyIG9yIHByb3h5IHRvIGF2b2lkCj4gICAgIGFtYmlndW91cyBtYXBwaW5ncy4gKERq
YW5nb+KAmXMgcnVuc2VydmVyIHdhcyBwYXRjaGVkIGluIENWRSAyMDE1LTAyMTkuKQo+ICAgICBC
dXQgdW5kZXIgQVNHSSwgdGhlcmUgaXMgbm90IHRoZSBzYW1lIHVuaWZvcm0gZXhwZWN0YXRpb24s
IGV2ZW4gaWYgbWFueQo+ICAgICBwcm94aWVzIHByb3RlY3QgYWdhaW5zdCB0aGlzIHVuZGVyIGRl
ZmF1bHQgY29uZmlndXJhdGlvbiAoaW5jbHVkaW5nCj4gICAgIG5naW54IHZpYSB1bmRlcnNjb3Jl
c19pbl9oZWFkZXJzIG9mZjspLgo+IAo+ICAgICBIZWFkZXJzIGNvbnRhaW5pbmcgdW5kZXJzY29y
ZXMgYXJlIG5vdyBpZ25vcmVkIGJ5IEFTR0lSZXF1ZXN0LCBtYXRjaGluZwo+ICAgICB0aGUgYmVo
YXZpb3Igb2YgRGFwaG5lLCB0aGUgcmVmZXJlbmNlIHNlcnZlciBmb3IgQVNHSS4KPiAKPiAgICAg
VGhpcyBpc3N1ZSBoYXMgc2V2ZXJpdHkg4oCcbG934oCdIGFjY29yZGluZyB0byB0aGUgRGphbmdv
IHNlY3VyaXR5IHBvbGljeS4KPiAKPiAqIENWRS0yMDI2LTQyNzc6IFByaXZpbGVnZSBhYnVzZSBp
biBHZW5lcmljSW5saW5lTW9kZWxBZG1pbsK2Cj4gCj4gICAgIEFkZCBwZXJtaXNzaW9ucyBvbiBp
bmxpbmUgbW9kZWwgaW5zdGFuY2VzIHdlcmUgbm90IHZhbGlkYXRlZCBvbgo+ICAgICBzdWJtaXNz
aW9uIG9mIGZvcmdlZCBQT1NUIGRhdGEgaW4gR2VuZXJpY0lubGluZU1vZGVsQWRtaW4uCj4gCj4g
ICAgIFRoaXMgaXNzdWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRpbmcgdG8gdGhlIERq
YW5nbyBzZWN1cml0eSBwb2xpY3kuCj4gCj4gKiBDVkUtMjAyNi00MjkyOiBQcml2aWxlZ2UgYWJ1
c2UgaW4gTW9kZWxBZG1pbi5saXN0X2VkaXRhYmxlwrYKPiAKPiAgICAgQWRtaW4gY2hhbmdlbGlz
dCBmb3JtcyB1c2luZyBsaXN0X2VkaXRhYmxlIGluY29ycmVjdGx5IGFsbG93ZWQgbmV3Cj4gICAg
IGluc3RhbmNlcyB0byBiZSBjcmVhdGVkIHZpYSBmb3JnZWQgUE9TVCBkYXRhLgo+IAo+ICAgICBU
aGlzIGlzc3VlIGhhcyBzZXZlcml0eSDigJxsb3figJ0gYWNjb3JkaW5nIHRvIHRoZSBEamFuZ28g
c2VjdXJpdHkgcG9saWN5Lgo+IAo+ICogQ1ZFLTIwMjYtMzMwMzM6IFBvdGVudGlhbCBkZW5pYWwt
b2Ytc2VydmljZSB2dWxuZXJhYmlsaXR5IGluCj4gICAgIE11bHRpUGFydFBhcnNlciB2aWEgYmFz
ZTY0LWVuY29kZWQgZmlsZSB1cGxvYWTCtgo+IAo+ICAgICBXaGVuIHVzaW5nIGRqYW5nby5odHRw
Lm11bHRpcGFydHBhcnNlci5NdWx0aVBhcnRQYXJzZXIsIG11bHRpcGFydAo+ICAgICB1cGxvYWRz
IHdpdGggQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogYmFzZTY0IHRoYXQgaW5jbHVkZSBleGNl
c3NpdmUKPiAgICAgd2hpdGVzcGFjZSBtYXkgdHJpZ2dlciByZXBlYXRlZCBtZW1vcnkgY29weWlu
ZywgcG90ZW50aWFsbHkgZGVncmFkaW5nCj4gICAgIHBlcmZvcm1hbmNlLgo+IAo+ICAgICBUaGlz
IGlzc3VlIGhhcyBzZXZlcml0eSDigJxtb2RlcmF0ZeKAnSBhY2NvcmRpbmcgdG8gdGhlIERqYW5n
byBzZWN1cml0eSBwb2xpY3kuCj4gCj4gKiBDVkUtMjAyNi0zMzAzNDogUG90ZW50aWFsIGRlbmlh
bC1vZi1zZXJ2aWNlIHZ1bG5lcmFiaWxpdHkgaW4KPiAgICAgQVNHSSByZXF1ZXN0cyB2aWEgbWVt
b3J5IHVwbG9hZCBsaW1pdCBieXBhc3PCtgo+IAo+ICAgICBBU0dJIHJlcXVlc3RzIHdpdGggYSBt
aXNzaW5nIG9yIHVuZGVyc3RhdGVkIENvbnRlbnQtTGVuZ3RoIGhlYWRlciBjb3VsZAo+ICAgICBi
eXBhc3MgdGhlIERBVEFfVVBMT0FEX01BWF9NRU1PUllfU0laRSBsaW1pdCB3aGVuIHJlYWRpbmcK
PiAgICAgSHR0cFJlcXVlc3QuYm9keSwgcG90ZW50aWFsbHkgbG9hZGluZyBhbiB1bmJvdW5kZWQg
cmVxdWVzdCBib2R5IGludG8KPiAgICAgbWVtb3J5IGFuZCBjYXVzaW5nIHNlcnZpY2UgZGVncmFk
YXRpb24uCj4gCj4gICAgIFRoaXMgaXNzdWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRp
bmcgdG8gdGhlIERqYW5nbyBzZWN1cml0eSBwb2xpY3kuCj4gCj4gQnVnZml4ZXM6Cj4gKiBGaXhl
ZCBhIHJlZ3Jlc3Npb24gaW4gRGphbmdvIDYuMCB3aGVyZSBhbG9naW4oKSBhbmQgYWxvZ291dCgp
IGRpZCBub3QKPiAgIHJlc3BlY3RpdmVseSBzZXQgb3IgY2xlYXIgcmVxdWVzdC51c2VyIGlmIGl0
IGhhZCBhbHJlYWR5IGJlZW4KPiAgIG1hdGVyaWFsaXplZCAoZS5nLiwgYnkgc3luYyBtaWRkbGV3
YXJlKSAoIzM3MDE3KS4KPiAqIEZpeGVkIGEgcmVncmVzc2lvbiBpbiBEamFuZ28gNi4wIGluIGFk
bWluIGZvcm1zIHdoZXJlCj4gICBSZWxhdGVkRmllbGRXaWRnZXRXcmFwcGVyIGluY29ycmVjdGx5
IHdyYXBwZWQgYWxsIHdpZGdldHMgaW4gYQo+ICAgPGZpZWxkc2V0PiAoIzM2OTQ5KS4KPiAqIEZp
eGVkIGEgYnVnIGluIERqYW5nbyA2LjAgd2hlcmUgdGhlIGZpZWxkcy5FMzQ4IHN5c3RlbSBjaGVj
ayBkaWQgbm90Cj4gICBkZXRlY3QgbmFtZSBjbGFzaGVzIGJldHdlZW4gbW9kZWwgbWFuYWdlcnMg
YW5kIHJlbGF0ZWRfbmFtZXMgZm9yCj4gICBub24tc2VsZi1yZWZlcmVudGlhbCByZWxhdGlvbnNo
aXBzICgjMzY5NzMpLgo+IAo+IFJlbGVhc2UgTm90ZXM6Cj4gaHR0cHM6Ly9kb2NzLmRqYW5nb3By
b2plY3QuY29tL2VuLzYuMC9yZWxlYXNlcy82LjAuNC8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJj
dXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KCkFwcGxpZWQgdG8gMjAyNi4wMi54LiBU
aGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2gg
fCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28ubWsgICB8IDQg
KystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28uaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2gKPiBpbmRleCBkY2E3
N2YwMmUyLi42YzMxN2NmNmUwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9w
eXRob24tZGphbmdvLmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRq
YW5nby5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczov
L3B5cGkub3JnL3B5cGkvZGphbmdvL2pzb24KPiAtbWQ1ICAwYmIzOTViNTE4ZTJmMmYxN2UxYTkz
NmRlYjdiYTc0YyAgZGphbmdvLTYuMC4zLnRhci5nego+IC1zaGEyNTYgIDkwYmU3NjVlZTc1NmFm
OGE2Y2JkNjY5M2U1NjQ1MjQwNGI1YWQxNTI5NGY0ZDVlNDBjMGE1NWEwZjQ4NzBmZTEgIGRqYW5n
by02LjAuMy50YXIuZ3oKPiArbWQ1ICA5ZDQyOWNiZWY4YzgzNTdhNDgwZDBiOTIwZGQ5YTk1NiAg
ZGphbmdvLTYuMC40LnRhci5nego+ICtzaGEyNTYgIDhjZmEyNTcyYjNmMjc2OGIyZTg0OTgzY2Yz
YzQ4MTE4NzdhMDFlZGI2NGU4MTc5ODZlYzVkNjA3NTFjMTEzYWMgIGRqYW5nby02LjAuNC50YXIu
Z3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgc2hhMjU2ICBiODQ2
NDE1ZDFiNTE0ZTljMWRmZjE0YTIyZGViOTA2ZDc5NGJjNTQ2Y2E2MTI5Zjk1MGExOGNkMDkxZTJh
NjY5ICBMSUNFTlNFCj4gIHNoYTI1NiAgYmUzMGRjMGUzZjcwMTBhZjZjNDUzZDIwNWZlYWVjZTFm
ODk0OTQ3ODliNmU5MmYwYzI1NWVmNTk3YTFlNjg2NCAgZGphbmdvL2NvbnRyaWIvZ2lzL21lYXN1
cmUucHkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28u
bWsgYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5tawo+IGluZGV4IDBjYzY4
MTI5ZWUuLjIwMWVlY2UxNjQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tZGphbmdvL3B5
dGhvbi1kamFuZ28ubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5n
by5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
IAo+IC1QWVRIT05fREpBTkdPX1ZFUlNJT04gPSA2LjAuMwo+ICtQWVRIT05fREpBTkdPX1ZFUlNJ
T04gPSA2LjAuNAo+ICBQWVRIT05fREpBTkdPX1NPVVJDRSA9IGRqYW5nby0kKFBZVEhPTl9ESkFO
R09fVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9ESkFOR09fU0lURSA9IGh0dHBzOi8vZmlsZXMu
cHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy84MC9lMS84OTQxMTVjNmJkNzBlMmM4YjY2YjBjNDBh
M2MzNjdkODNhNWE0OGMwMzRhNGQ5MDRkMzFiNjJmN2M1M2EKPiArUFlUSE9OX0RKQU5HT19TSVRF
ID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL3NvdXJjZS9kL2RqYW5n
bwo+ICBQWVRIT05fREpBTkdPX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UsIE1JVCAoanF1ZXJ5LCB1
dGlscy9hcmNoaXZlLnB5KSwgQlNELTItQ2xhdXNlIChpbmxpbmVzLmpzKSwgQ0MtQlktNC4wIChh
ZG1pbiBzdmcgZmlsZXMpCj4gIFBZVEhPTl9ESkFOR09fTElDRU5TRV9GSUxFUyA9IExJQ0VOU0Ug
XAo+ICAJZGphbmdvL2NvbnRyaWIvZ2lzL21lYXN1cmUucHkgXAo+IC0tIAo+IDIuNTMuMAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
