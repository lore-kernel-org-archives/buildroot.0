Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC120C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83EE94099B;
	Mon,  3 Jun 2024 18:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CeJmJzTja7c; Mon,  3 Jun 2024 18:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7247740C09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7247740C09;
	Mon,  3 Jun 2024 18:55:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50E5D1BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4924F82129
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DorlK96Nvqjp for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B3B582126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3B582126
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B3B582126
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 18:55:49 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-df481bf6680so4569143276.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 11:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717440948; x=1718045748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSwpwIykUmN8KGZoL5gOgsS9pq0sRdsWePnNAJjwegM=;
 b=D6g8HW1e5xMBBSLurq1hyLt1B7V+w176pnqWy1etBhS7deZdusalkFweTYOoXtpwDq
 ukI8DVwk5M23DeJdSlkOClt1F8IsE1x0xffQWDledrdtKXI5SYZ4mg/s+uQw8iTt5D5s
 cskJk2juIEfGna6iB3jj3r67pvE+KHuHILimuUic22Lz0tw9zbl3R6M34EfYhY5bVe7F
 SyG0WJLt6jwZ45NFM81XJqZqCXwpIyAc66nW4XeO0xm/OLafMydSKln0NXzLWtxN6r9+
 aCxs9g+f8Wqh4dklmGt2dNY0GirCsvSZu3AZMpXXmGjfL0Rks7ZGKwwmzyBqW7PnxPo8
 aaAg==
X-Gm-Message-State: AOJu0YyEW98RVv4scyJOZSrBcJZvVxdYWul/kELbrcW/jfTiF36CEcG0
 F1zB4O7ivC9SXfqwB6IPC0VRONhydtww5kLhkBWlXa8Zo5t1YuwzpU9giUd7/lnvqsrKxPO3L3/
 hh0t2rVa8pWILI6RclzY2XLWeh5M=
X-Google-Smtp-Source: AGHT+IElkK/b+ENIv6Nj9vBiyeepKwgICxycWvThw+NA4kGYf8hnPHIsXjO2EKmBVzNyRJ6WZp1dMNDmsNPI+6vuUjo=
X-Received: by 2002:a25:c794:0:b0:df4:d827:41c5 with SMTP id
 3f1490d57ef6-dfa73dbb79amr10123124276.52.1717440947938; Mon, 03 Jun 2024
 11:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
 <Zlzg8I5r7cd8yTz5@landeda>
 <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
 <Zl2uhKujEDzv2Gur@landeda>
 <CADvTj4qyfvGUCbfMj=uWSxcJkBH7LBs-hcdv4Z3_Ax6FtYTnNg@mail.gmail.com>
 <Zl4Ov3hQoTGFl6e8@landeda>
In-Reply-To: <Zl4Ov3hQoTGFl6e8@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Jun 2024 12:55:36 -0600
Message-ID: <CADvTj4phNuDpoCNFju9PwcwGMYKaur9KanirPeYbwC-fLjx=6A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717440948; x=1718045748; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSwpwIykUmN8KGZoL5gOgsS9pq0sRdsWePnNAJjwegM=;
 b=DaZxdQLSLEzwYiKTNz57eH/7UzpJmVGRmaUjDgdaCTmujTcNfv9eGokTzsUoeFF5I3
 TSu0dhQoHiTL6MFwiBtyFjhiUXDBR4HEi0H3HKigtlL07strx+RTiVD+D0JL7L8TyU6C
 0L/PSXDv8yz5heTuuPjSWhsiXkmCsHgnEtHONpTYccEz/uQMQQhEHpPM5uC6Q5WZLh4B
 lzuEp8bruNAFkM19i4U96fkjZdJsSEgNFksBC9QIIFfVC+REQ4eoxWNQPVos71EY05Qs
 v8R2nBPLkE0vLrcRVtazbMCpTUl/dbXwVwbI0P/kDaa7FbNjjBbjwcIJZz8tSoUEhr2z
 /M0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DaZxdQLS
Subject: Re: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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

T24gTW9uLCBKdW4gMywgMjAyNCBhdCAxMjo0M+KAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA2LTAz
IDExOjQ4IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBNb24sIEp1
biAzLCAyMDI0IGF0IDU6NTLigK9BTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJl
ZS5mcj4gd3JvdGU6Cj4gPiA+IEhtbW0uLi4gSW5kZWVkLCB0aGlzIHdvdWxkIGNhdXNlIHF1aXRl
IHNvbWUgZ3JpZWYgaWYgd2Ugd291bGQgY2hhbmdlIHRoZQo+ID4gPiBDYXJnby5sb2NrLi4uCj4g
PiA+IEhvd2V2ZXIsIEkgZG9uJ3Qgc2VlIGFuIGVhc3kgc29sdXRpb24gdG8gdGhpcyBpc3N1ZS4u
LiA6LS8KPiA+ID4gV2VsbCwgSSBkbyBoYXZlIGFuIGlkZWEsIGFuZCBpdCB3b3VsZCBkZWZpbml0
ZWx5IHdvcmssIGJ1dCBpdCB3b3VsZCBiZQo+ID4gPiAqZXhjZXNzaXZlbHkqIHVnbHkuLi4gSSds
bCB0cnkgdG8gaW1wbGVtZW50IGl0LCBidXQgYXMgYW4gYWRkaXRpb25hbAo+ID4gPiBjaGFuZ2Ug
b24tdG9wIG9mIHRoZSBleGlzdGluZyBzZXJpZXMsIGJlY2F1c2UgSSBhbSBub3Qgc3VyZSBpdCB3
b3VsZCBicgo+ID4gPiBtZWFuaW5nZnVsIGluIHRoZSBlbmQuLi4gTGV0J3Mgc2VlLi4uCj4gPiBQ
cm9iYWJseSBpdCB3b3VsZCBiZSBnb29kIGVub3VnaCB0byBzYXkgdGFrZSB0aGUgZmlyc3QgNyBj
aGFyYWN0ZXJzIG9mIHRoZQo+ID4gc2hhMjU2IGhhc2goc2FtZSBsZW5ndGggYXMgYSBnaXQgc2hv
cnRoYXNoKSBvZiB0aGUgQ2FyZ28ubG9jayBmaWxlIGFuZAo+ID4gaW5jb3Jwb3JhdGUgdGhhdCBp
bnRvIHRoZSBhcmNoaXZlIGZpbGVuYW1lIGFwcGVuZGVkIHRvIHRoZSBwYWNrYWdlIHZlcnNpb24u
Cj4KPiBUaGUgcHJvYmxlbSB3aXRoIHNob3J0IGhhc2hlcywgaXMgdGhhdCB0aGV5IGFyZSBtdWNo
IGxlc3MgdW5pcXVlIHRoYW4KPiBmdWxsIGhhc2hlcy4gV2UndmUgZXhjbHVkZWQgdXNpbmcgc2hv
cnQgaGFzaGVzIHdoZXJldmVyIHdlIGhhZCB0aGUKPiBjaG9pY2UgKHNlZSBmb3IgZXhhbXBsZSB0
aGUgcmVjZW50IGdpdCBleHBvcnQtc3Vic3QgYXR0cmlidXRlLCB3aGVyZSB3ZQo+IHJlcGxhY2Ug
dGhlIHNob3J0LWhhc2ggcGxhY2Vob2xkZXIgd2l0aCB0aGUgZnVsbC1sZW5ndGggaGFzaCkuIFNv
IEkKPiB3b3VsZCByZWZyYWluIGZyb20gdXNpbmcgYSBzaG9ydC1oYXNoIGFueXdoZXJlIGVsc2Ug
YXMgd2VsbC4KCldlbGwgdGhlIHNob3J0IGhhc2ggd291bGQgb25seSBuZWVkIHRvIGJlIHVuaXF1
ZSBwZXIgcGFja2FnZSB2ZXJzaW9uIHNvCkkgdGhpbmsgaXQgd291bGQgd29yayBmaW5lIGluIHRo
aXMgY2FzZS4KCj4KPiBUaGVyZSBpcyBhIHNpbXBsZXIgc29sdXRpb24sIHRob3VnaCwgd2hpY2gg
aXMgdG8gcmVseSBvbiB0aGUgLm1rIHRvIHNldAo+IHRoZSB2ZXJzaW9uIGFuZCBiZSBkb25lIHdp
dGggaXQ6Cj4KPiAgMS4gaXQgaXMgdmVyeSBzZWxkb20gdGhhdCBhIGNhcmdvIHBhY2thZ2UgaXMg
bm90IGxvY2tlZCwgc28gd2UgZG9uJ3QKPiAgICAgbmVlZCBhbnl0aGluZyB0b28gY29tcGxleDsK
PiAgMi4gZm9yIHVubG9ja2VkIHBhY2thZ2VzLCB3ZSdsbCB2ZXJ5IHNlbGRvbSB1cGRhdGUgb3Vy
IENhcmdvLmxvY2ssIHNvCj4gICAgIHdlIGRvbid0IG5lZWQgYW55dGhpbmcgdG9vIGZhbmN5Owo+
ICAzLiBpZiBvbmUgZm9yZ2V0cyB0byB1cGRhdGUgdGhlIHZlcnNpb24gd2hlbiB1cGRhdGluZyBD
YXJnby5sb2NrLAo+ICAgICB0aGVyZSB3aWxsIGJlIGEgaGFzaCBtaXNtYXRjaCBvbiBkb3dubG9h
ZCBhbnl3YXksIHNvIHdlJ2xsIG5vdGljZS4KCk9rLCBidXQgaG93IHdvdWxkIHdlIGhhbmRsZSBh
IGNhc2Ugd2hlcmUgd2UgbmVlZCB0byB1cGRhdGUgdGhlCkNhcmdvLmxvY2sgYnV0IGFyZSB1bmFi
bGUgdG8gdXBkYXRlIHRoZSB2ZXJzaW9uKGkuZS4gaWYgdGhlIHBhY2thZ2UgZG9lcwpub3QgaGF2
ZSBhIG5ld2VyIHZlcnNpb24pLgoKQXJlIHlvdSB0aGlua2luZyBvZiBzb21ldGhpbmcgbGlrZSBz
ZXR0aW5nIHRoZSBDYXJnby5sb2NrIHZlcnNpb24gaW4gdGhlIC5tawphbmQgaW5jb3Jwb3JhdGlu
ZyB0aGF0IGluIHRoZSBhcmNoaXZlIHNvbWVob3c/Cgo+Cj4gU28gdGhhdCdzIHdoYXQgSSd2ZSBn
b25lIHdpdGguIEl0IHJlcXVpcmVzIGEgZmV3IHRyaWNrcyBhbmQgdHdlYWtzIGhlcmUKPiBhbmQg
dGhlcmUsIGJ1dCB0aGlzIGlzIGFscmVhZHkgd29ya2luZyBzaW5jZSBhIGZldyBob3VycyBhZ28s
IGJ1dCBJIGdvdAo+IGRpc3RyYWN0ZWQgYW5kIGRpZCBub3QgaGF2ZSB0aW1lIHRvIGZpbmlzaCB0
aGUgd29yayAoYW5kIHRoZSBjb21taXQKPiBsb2dzKTsgbWF5YmUgbGF0ZXIgdG9uaWdodCwgb3Ig
dG9tb3Jyb3cuLi4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4gLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
