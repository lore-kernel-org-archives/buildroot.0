Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CE5C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87FDE4053C;
	Sun, 24 Mar 2024 15:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSA8Qw94XAue; Sun, 24 Mar 2024 15:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E1640557
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E1640557;
	Sun, 24 Mar 2024 15:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5407B1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 415F08196E
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDZTb87rDOcg for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F98981911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F98981911
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F98981911
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:20:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34175878e30so2513045f8f.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711293614; x=1711898414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DgPIeiBVCyT5ZlbDQxVd9kXGDFA4A/UB4QqC4esK22Y=;
 b=YzLsSSDQQqcZbVH05SKgIESOaWTXFHKPbA/kbYu4JsTHLYeCM8MGnCUDPl8oM9rD86
 Oh7UN+C6v2k/Fz1NWnmdRpWz2n/7PzumlRdMdjyjsD/hVny+EmEI12QfnSwebxbx2x/T
 +bgOynjaN4rC8/f1Ywp4Yd7Q1L13PsrtW/YRC5+AfoDkFQbv2pYaKZdRnYuAQRbmX+lI
 hBYmSaPBvPPffK9OJKTnmMxWjINiHqVIj+YQa+b3W5oDfCNidXGmz52pOW/LMD9urWK+
 D9ziJrJD/rkfOX2uKjxehmsbinezlNYwo3HwHmIVS1cxvJeoiPg2wDJzcGHelfpTDhxS
 2kQA==
X-Gm-Message-State: AOJu0Yw5iP7puMBdHCD+vIhmpEN00lapwhW3Hw1YZZb2p0HifvMi8mjV
 5tWo6dLZlXThSFXJy133iz9nGZKmqbuPpoemfJY7LY1UIxkhUdspDwdSVLREhxtL/y5NR4W0asH
 j
X-Google-Smtp-Source: AGHT+IFjnUgQbPRvg+ZOnMxxuii0QWK397xjsX4CU2h8DFCb1gUEj20pMOCduoerHDw07YCV9vKQnQ==
X-Received: by 2002:a05:6000:12:b0:33e:1ee1:ef92 with SMTP id
 h18-20020a056000001200b0033e1ee1ef92mr3705901wrx.67.1711293614077; 
 Sun, 24 Mar 2024 08:20:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a5d6891000000b0033d202abf01sm7036195wru.28.2024.03.24.08.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:20:13 -0700 (PDT)
Message-ID: <a50a06cd-040f-4d4c-be25-099b314d0f7d@mind.be>
Date: Sun, 24 Mar 2024 16:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Scott Fan <fancp2007@gmail.com>
References: <20240323160120.1276293-1-fancp2007@gmail.com>
 <8f04fa2e-4c65-4de6-8507-14dea3bb9649@mind.be>
 <CAFkzVZbQHeSGPZsLH3NgKTZJ2iciKmDYuNx7BfXKW3YjCy=4_A@mail.gmail.com>
In-Reply-To: <CAFkzVZbQHeSGPZsLH3NgKTZJ2iciKmDYuNx7BfXKW3YjCy=4_A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711293614; x=1711898414; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DgPIeiBVCyT5ZlbDQxVd9kXGDFA4A/UB4QqC4esK22Y=;
 b=crJqym4EZOCnmCureWN7ZJF3SznkvpmA1YNzu9okQVtqdDEjU8pcJPIvL6ytxBzmyw
 kMtAnR4e5Ac3AOu68x92/ld4bzolwOSzhJk0YUsq6T6yMc67emGeQWQl69uw/0G1XPF1
 zngDh/MWPkgIHI8MzhvgTJAb5vv4pV1gmiGTzh+SIONsiMcg7DkD+EFtq2Bf7XPzpmLt
 SXw342MzlkcCOBuBl6Dc2Ohc4PZuRpD9LW/K6rhE+IyBnIQyfSnjGdXNRGQNiJDpsqKF
 Q1hJgp2jJdAk6dTodVAupBC3UuYHNYmp9CmJ5a563dAzjK1mmDLLClN24BdIBrVUjktW
 eIaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=crJqym4E
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-generic: remove trailing
 slash in the package-specific PKGDIR variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBTY290dCwKCiAgUGxlYXNlIGRvbid0IHRvcC1wb3N0LCBidXQgcmVwbHkgaW5saW5lIGxp
a2UgSSBkbyBiZWxvdy4gTm90ZSB0aGF0IHRoaXMgCnJlcXVpcmVzIGNvbmZpZ3VyaW5nIHlvdXIg
bWFpbGVyIHRvIHF1b3RlIHJlcGxpZXMgcHJvcGVybHkuCgoKT24gMjQvMDMvMjAyNCAwNTo1Mywg
U2NvdHQgRmFuIHdyb3RlOgo+IEhpIEFybm91dCwKPiAKPiBJdCBpcyByZWFsbHkgTk9UIE1VU1Qs
IGJ1dCBTVUdHRVNUIHRvIGRvIGl0Lgo+IAo+IEkgc2F3IGEgbG90IG9mIGxpbmVzIGNvbnRhaW5p
bmcgZG91YmxlIHNsYXNoIHBhdGhzIGluIHRoZSBidWlsZCBsb2csCj4gdGhlbiBJIGZvdW5kCj4g
dGhlICQoMilfUEtHRElSIHZhcmlhYmxlIGFsd2F5cyBlbmRzIHdpdGggYSBzbGFzaCBjaGFyYWN0
ZXIsIGl0IGNhdXNlcwo+IGRvdWJsZSBzbGFzaCBpbiBwYXRocy4KPiAKPiBBbHRob3VnaCBpdCBo
YXMgbm8gc3Vic3RhbnRpYWwgYWR2ZXJzZSBjb25zZXF1ZW5jZXMsIHRoZSBkb3VibGUgc2xhc2gK
PiBpcyBjb21wbGV0ZWx5IHVubmVjZXNzYXJ5LgoKICBZZWFoLCBidXQgSSdtIGEgYml0IGhlc2l0
YW50IHRvIGFwcGx5IGFueXRoaW5nIHRoYXQgYWRkcyBjb21wbGV4aXR5IHRvIHRoZSAKY29kZSB3
aXRob3V0IGdvb2QgcmVhc29uLi4uCgo+IAo+IFNjb3R0IEZhbgo+IAo+IE9uIFN1biwgTWFyIDI0
LCAyMDI0IGF0IDQ6MjLigK9BTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+
IHdyb3RlOgo+Pgo+PiAgICBIaSBTY290dCwKPj4KPj4gT24gMjMvMDMvMjAyNCAxNzowMSwgU2Nv
dHQgRmFuIHdyb3RlOgo+Pj4gU2lnbmVkLW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21h
aWwuY29tPgo+Pj4gLS0tCj4+PiAgICBwYWNrYWdlL3BrZy1nZW5lcmljLm1rIHwgMiArLQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3BrZy1nZW5lcmlj
Lm1rCj4+PiBpbmRleCA1NzdhMTQ4YzFlLi5mOWNiODcyMmI4IDEwMDY0NAo+Pj4gLS0tIGEvcGFj
a2FnZS9wa2ctZ2VuZXJpYy5tawo+Pj4gKysrIGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+Pj4g
QEAgLTQ4OSw3ICs0ODksNyBAQCBQQUNLQUdFU19BTEwgKz0gJCgxKQo+Pj4gICAgJCgyKV9UWVBF
ICAgICAgICAgICAgICAgICAgICAgICA9ICAkKDQpCj4+PiAgICAkKDIpX05BTUUgICAgICAgICAg
ICAgICAgICAgPSAgJCgxKQo+Pj4gICAgJCgyKV9SQVdOQU1FICAgICAgICAgICAgICAgICAgICAg
ICAgPSAgJCQocGF0c3Vic3QgaG9zdC0lLCUsJCgxKSkKPj4+IC0kKDIpX1BLR0RJUiAgICAgICAg
ICAgICAgICAgID0gICQocGtnZGlyKQo+Pj4gKyQoMilfUEtHRElSICAgICAgICAgICAgICAgICAg
PSAgJCQocGF0c3Vic3QgJS8sJSwkKHBrZ2RpcikpCgogICQocGtnZGlyKSBpcyB1c2VkIGluIGEg
bnVtYmVyIG9mIG90aGVyIHBsYWNlcywgYW5kIHdlIGRvbid0IHdhbnQgdGhlIHRyYWlsaW5nIApz
bGFzaCBlaXRoZXIgaW4gYW55IG9mIHRoZW0uIFNvIEkgbW92ZWQgdGhpcyB0byB0aGUgZGVmaW5p
dGlvbiBvZiBwa2dkaXIgCmluc3RlYWQsIGFuZCBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
ICBSZWdhcmRzLAogIEFybm91dAoKPj4KPj4gICAgQ2FuIHlvdSBleHBsYWluIHdoeSB5b3Ugd2Fu
dCB0byBkbyB0aGlzPyBQZXJoYXBzIGl0IG1ha2VzIHRoZSBQS0dESVIgY29udGVudHMKPj4gYSBs
aXR0bGUgYml0IG1vcmUgInB1cmUiLCBidXQgaXMgdGhhdCByZWFsbHkgc28gdXNlZnVsPwo+Pgo+
PiAgICBSZWdhcmRzLAo+PiAgICBBcm5vdXQKPj4KPj4+Cj4+PiAgICAjIEtlZXAgdGhlIHBhY2th
Z2UgdmVyc2lvbiB0aGF0IG1heSBjb250YWluIGZvcndhcmQgc2xhc2hlcyBpbiB0aGUgX0RMX1ZF
UlNJT04KPj4+ICAgICMgdmFyaWFibGUsIHRoZW4gcmVwbGFjZSBhbGwgZm9yd2FyZCBzbGFzaGVz
ICgnLycpIGJ5IHVuZGVyc2NvcmVzICgnXycpIHRvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
