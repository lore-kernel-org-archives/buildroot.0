Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ED5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 13:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E59498104F;
	Sat, 20 Nov 2021 13:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJS3c_mT54Xd; Sat, 20 Nov 2021 13:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BE4180E2F;
	Sat, 20 Nov 2021 13:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB9E1BF348
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 13:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79B81405DD
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 13:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5Nxcn9aioTG for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 13:44:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60862405BA
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 13:44:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o29so11014779wms.2
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 05:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3bLZSFHXu7QDj81vxdZZcFDHcAv75bf+Zn/MLhixRbM=;
 b=I1b9V7cMtM1d68AgeKrciMFR5gR8ZM1aLbjnCt6LiPKsf1YI3q3+NNS24squ3XFXdE
 tzc9acm7qCN8lXZ5CpKTLugTH9jMmHns7laWk0yMAs8VXpU2EdISSqFNXN2vXW6L4/54
 Q2kd+EaPHydsEOw0gLb1mDILJHPSAEhE2fCilFHXbYuRfBSFfLlWghaO3ZMELUw0Mr4d
 PhBTA4C+TQ1VQiZk5eSWgERa6jFXafZKWj9tfwPuTnG6eHy0U0SiZFk9uYJ31cYXH/nV
 Y9dsh7rsqtb0wI7TMJm8D9NilujP9KC33h+izH7PHJRw5/2iMULA+WtA4iUNDwuPTow/
 jb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3bLZSFHXu7QDj81vxdZZcFDHcAv75bf+Zn/MLhixRbM=;
 b=tc/82F55StRFE0Y6vzUK09Gq4O7Hg/p9oQFv6t1Hhdg4EhygZfSN1MQYJg6buwYax9
 dATOiX1zYPq2Hts89fndjFIFeUTZK2tHhnouL7E4aEDa8DwYpMUkvc5KYb0i5WpUetr3
 VmH+zdjv24M3whvCsHyw0T11KUAM/JZIXLqsQbKWLJoSxN40zZtyC/xuzILP5An8OPqt
 xHGfRSpQd5Cnr3goR0Fm9TtD6II5/0gi+IeNS2zFDARxDf3euVP6qTwrH2+nVe2RpnnS
 Xdt4Iuw7ueewN3uS+kSt2IMdUq1vXzYPNlDcmZc0w0F4pudHddNYEZ6MIIMJWcbsDa9j
 lR/Q==
X-Gm-Message-State: AOAM531P3LjUXl9K2L7fQmi9NjajF2f2pHpnz3yyUmJs8Sm41ZbnIrgd
 sHEXK0QqMZ5enAJlWBOPWbdt6GdeoJk=
X-Google-Smtp-Source: ABdhPJzrfbHwwaQjtsT1vgLeIXGvvdiwmcBkTqUG/b1HQyR45hAcGDoluqjAsZgyG/yeXKQFpYfBpA==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr10252982wmj.115.1637415860474; 
 Sat, 20 Nov 2021 05:44:20 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id g13sm3783294wrd.57.2021.11.20.05.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 05:44:19 -0800 (PST)
Message-ID: <ddafc6ef-d8e5-3750-6d3b-2a8267028f0a@gmail.com>
Date: Sat, 20 Nov 2021 14:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20211117213348.231529-1-romain.naour@gmail.com>
 <87ee7drf65.fsf@dell.be.48ers.dk>
 <9880ded2-bde8-8321-9a61-d281be2db2ff@gmail.com>
 <87a6i1r6va.fsf@dell.be.48ers.dk> <20211120085004.GS247986@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211120085004.GS247986@scaer>
Subject: Re: [Buildroot] [PATCH for-2021.08.x] support/docker: remove
 expired mozilla/DST_Root_CA_X3.crt
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsIFlhbm4sCgpMZSAyMC8xMS8yMDIxIMOgIDA5OjUwLCBZYW5uIEUuIE1PUklO
IGEgw6ljcml0wqA6Cj4gUGV0ZXIsIFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjEtMTEtMTggMTM6
MjIgKzAxMDAsIFBldGVyIEtvcnNnYWFyZCBzcGFrZSB0aHVzbHk6Cj4+Pj4+Pj4gIlJvbWFpbiIg
PT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3cml0ZXM6Cj4+ICA+PiA+
IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzY5NDA4Nzc2L2hvdy10by1mb3Jj
ZS1vbGRlci1kZWJpYW4tdG8tZm9yZ2V0LWFib3V0LWRzdC1yb290LWNhLXgzLWV4cGlyYXRpb24t
YW5kLXVzZS1pc3JnCj4+ICA+PiA+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQGdtYWlsLmNvbT4KPj4gID4+ID4gQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPgo+PiAgPj4gPiAtLS0KPj4gID4+ID4gQmFja3BvcnQgdGhpcyBwYXRjaCBm
b3IgMjAyMS4wOC54IGFuZCAyMDIxLjAyLnggdXNpbmcgYnVpbGRyb290L2Jhc2U6MjAyMDA4MTQu
MjIyOAo+PiAgPj4gCj4+ICA+PiBIb3cgZG9lcyB0aGlzIGFjdHVhbGx5IHdvcms/IFdobyBidWls
ZHMgdGhhdCBjb250YWluZXI/IERvIHdlIG5vdCBuZWVkCj4+ICA+PiBhIGNvcnJlc3BvbmRpbmcg
dXBkYXRlIG9mIC5naXRsYWItY2kueW1sIHRoZW4/Cj4+Cj4+ICA+IFdlbGwsIHVzdWFsbHkgaXQn
cyBBcm5vdXQgb3IgWWFubiB0aGF0IGJ1aWxkIGFuZCBwdXNoIGNvbnRhaW5lcnMgdG8gZG9ja2Vy
aHViLgo+PiAgPiBPbiBtYXN0ZXIgd2UgcmVjZW50bHkgc3dpdGNoZWQgdG8gZ2l0bGFiIHJlZ2lz
dHJ5LCBzbyBtYWludGFpbmVycyBhbmQgZGV2ZWxvcGVycwo+PiAgPiBvZiBCdWlsZHJvb3QgZ2l0
bGFiIHByb2plY3QgY2FuIHVwZGF0ZSBjb250YWluZXJzLgo+Pgo+PiAgPiBUaGUgLmdpdGxhYi1j
aS55bWwgaXMgY2hhbmdlZCBhcyBzb29uIGFzIHRoZSBjb250YWluZXIgaXMgcmVidWlsZCB1c2lu
ZyB0aGUKPj4gID4gdXBkYXRlZCBEb2NrZXJmaWxlIChhZnRlciB0aGUgY29tbWl0IG9mIERvY2tl
cmZpbGUgY2hhbmdlKS4KPj4KPj4gT2ssIHNvIGFsbCBtYW51YWxseS4KPj4KPj4gID4+IDIwMjEt
MTEtMTggMDk6MjA6MTAgKDE2LjUgTUIvcykgLSAnYWFyY2g2NC0tZ2xpYmMtLWJsZWVkaW5nLWVk
Z2UtMjAyMC4wOC0xLnRhci5iejInIHNhdmVkIFsxMjc0NTY1NjMvMTI3NDU2NTYzXQo+PiAgPj4g
Cj4+ICA+IEluZGVlZCBidXQgd2UgbWF5IGludHJvZHVjZSBzb21lICh1bmxpa2VseSkgcmVncmVz
c2lvbiBpbiB0aGUgdGVzdHN1aXRlLgo+Pgo+PiBJZiB0aGVyZSBhcmUgcmVncmVzc2lvbnMsIHRo
ZW4gaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhbmRsZSB0aGVtIGFzCj4+IHBlb3BsZSBtaWdodCBy
dW4gaW50byB0aGUgc2FtZSBpc3N1ZXMuIERlYmlhbiA5IGlzIG9sZCwgbm8gbWF0dGVyIGlmIHdl
Cj4+IGxvb2sgYXQgdGhlIDIwMTcgc25hcHNob3Qgb3IgdGhlIGxhc3QgYnVnZml4ICgyMDIwKSwg
c28gSSB0ZXN0aW5nCj4+IGFnYWluc3QgdGhhdCBtaWdodCBiZSB0aGUgYmVzdCBzb2x1dGlvbj8K
PiAKPiBJIHdhcyBub3Qgc3VyZSBTdHJldGNoIHdhcyBzdGlsbCBtYWludGFpbmVkIChJIGRpZCBu
b3QgZXZlbiBjaGVjayksIGJ1dAo+IG5vdyBJIHRlc3RlZCB0aGUgc3RyZXRjaC0yMDIxMTExNSBz
bmFwc2hvdCwgYW5kIGluZGVlZCB0aGUgY2VydGlmaWNhdGUKPiBpc3N1ZSBpcyBubyBsb25nZXIu
Cj4gCj4gVGhlIHJpc2sgb2YgcmVncmVzc2lvbmkgaWYgd2UgdXBkYXRlIGlzIHZlcnkgbG93LCBi
ZWNhdXNlIERlYmlhbiByZWFsbHkKPiBpcyBzdGFibGU7IGFmdGVyIDQgeWVhcnMgb2YgbWFpbnRl
bmFuY2UsIHRoZXJlIGlzIG5vdCBtYW55IHRoaW5ncyB0aGF0Cj4gbW92ZSBhbnltb3JlLgo+IAo+
IFNvIEkgYWdyZWUgdGhhdCB1cGRhdGluZyB0byB0aGUgbGF0ZXN0IHN0cmV0Y2ggaW1hZ2UgaXMg
YmV0dGVyIHRoYW4KPiBoYWNraW5nIG91ciB3YXlzIGJ5IHJlbW92aW5nIHNvbWUgY2VydGlmaWNh
dGUuCgpPSywgY2FuIHlvdSB1cGRhdGUgdGhlIGRvY2tlciBpbWFnZSA/CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
