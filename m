Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963F4C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5D760B35;
	Mon,  3 Jun 2024 19:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smuUtrrFFS4v; Mon,  3 Jun 2024 19:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7A560B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B7A560B38;
	Mon,  3 Jun 2024 19:45:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96C891BF275
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8276D40984
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 19:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1hqCCfa9JwM for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 19:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C01C408C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C01C408C0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C01C408C0
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 19:45:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE11F13F861;
 Mon,  3 Jun 2024 21:45:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 21:45:50 +0200
Date: Mon, 3 Jun 2024 21:45:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zl4dbrMut2XTOzF2@landeda>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
 <Zlzg8I5r7cd8yTz5@landeda>
 <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
 <Zl2uhKujEDzv2Gur@landeda>
 <CADvTj4qyfvGUCbfMj=uWSxcJkBH7LBs-hcdv4Z3_Ax6FtYTnNg@mail.gmail.com>
 <Zl4Ov3hQoTGFl6e8@landeda>
 <CADvTj4phNuDpoCNFju9PwcwGMYKaur9KanirPeYbwC-fLjx=6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4phNuDpoCNFju9PwcwGMYKaur9KanirPeYbwC-fLjx=6A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717443952;
 bh=yZknEIkSBTOEvaWv41gHXPuMzQRB0RXla9+SYvmqFcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uDc8NqqBjKqZs9eRxIT8Peq1dAUSH3ZXNYGyyztSHgsxH8he9W8/ua8gw0EOzR//O
 FAypuMjJ6EHah4o/9v2e1oxKSFAYWoyCXDmIJrIgU5TSDpsftOUpOavlMGK4tdlE/T
 rtSUaKNCGl0fuh6cMTSUq+DNiwOiGH4SJdKU0WdeVmGjfzg3Ik/Hq+HfInkN1msExw
 RI+znDMmWpujeviephGI20xyDGJEXuy9TrFsuJ6ADrtXPNVvSsAFd8V+KIFTaugJnL
 y7MzBljT8r5vj6tRHGaB4qVlapjsjNeu/mqMRpwIAAuPhmSSN/dqfhziVNIYckvjH4
 2STNIxVwAHe+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uDc8NqqB
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

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMDMgMTI6NTUgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIEp1biAzLCAyMDI0IGF0IDEyOjQz4oCvUE0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgpbLS1TTklQLS1dCj4gPiBUaGUg
cHJvYmxlbSB3aXRoIHNob3J0IGhhc2hlcywgaXMgdGhhdCB0aGV5IGFyZSBtdWNoIGxlc3MgdW5p
cXVlIHRoYW4KPiA+IGZ1bGwgaGFzaGVzLiBbLS1TTklQLS1dCj4gV2VsbCB0aGUgc2hvcnQgaGFz
aCB3b3VsZCBvbmx5IG5lZWQgdG8gYmUgdW5pcXVlIHBlciBwYWNrYWdlIHZlcnNpb24gc28KPiBJ
IHRoaW5rIGl0IHdvdWxkIHdvcmsgZmluZSBpbiB0aGlzIGNhc2UuCgoiQWxsIHdpbGwgYmUgZmlu
ZSIgSSBzaG91dGVkIGF0IGhpbSBhcyBoZSB3YXMgZmFsbGluZyBkb3duIHRoZSBsYXZhCmxha2Uu
Li4gOy0pCgpZZXMsIHlvdSBhcmUgcmlnaHQsIHRoYXQgaXQgc2hvdWxkIG5vdCBjYXVzZSBhbnkg
aXNzdWUgaW4gcHJhY3RpY2UuCkhvd2V2ZXIsIGdldHRpbmcgdGhlIGhhc2ggKHNob3J0IG9yIGZ1
bGwpIG1lYW5zIHNwYXduaW5nIGEgc3ViLXNoZWxsOwppdCBpcyBub3QgdmVyeSBncmVhdC4uLiBF
c3BlY2lhbGx5IGNvbXBhcmVkIHRvIHRoZSBzaW1wbGVyIHNvbHV0aW9uLApiZWxvdy4uLgoKPiA+
IFRoZXJlIGlzIGEgc2ltcGxlciBzb2x1dGlvbiwgdGhvdWdoLCB3aGljaCBpcyB0byByZWx5IG9u
IHRoZSAubWsgdG8gc2V0Cj4gPiB0aGUgdmVyc2lvbiBhbmQgYmUgZG9uZSB3aXRoIGl0Ogo+ID4K
PiA+ICAxLiBpdCBpcyB2ZXJ5IHNlbGRvbSB0aGF0IGEgY2FyZ28gcGFja2FnZSBpcyBub3QgbG9j
a2VkLCBzbyB3ZSBkb24ndAo+ID4gICAgIG5lZWQgYW55dGhpbmcgdG9vIGNvbXBsZXg7Cj4gPiAg
Mi4gZm9yIHVubG9ja2VkIHBhY2thZ2VzLCB3ZSdsbCB2ZXJ5IHNlbGRvbSB1cGRhdGUgb3VyIENh
cmdvLmxvY2ssIHNvCj4gPiAgICAgd2UgZG9uJ3QgbmVlZCBhbnl0aGluZyB0b28gZmFuY3k7Cj4g
PiAgMy4gaWYgb25lIGZvcmdldHMgdG8gdXBkYXRlIHRoZSB2ZXJzaW9uIHdoZW4gdXBkYXRpbmcg
Q2FyZ28ubG9jaywKPiA+ICAgICB0aGVyZSB3aWxsIGJlIGEgaGFzaCBtaXNtYXRjaCBvbiBkb3du
bG9hZCBhbnl3YXksIHNvIHdlJ2xsIG5vdGljZS4KPiAKPiBPaywgYnV0IGhvdyB3b3VsZCB3ZSBo
YW5kbGUgYSBjYXNlIHdoZXJlIHdlIG5lZWQgdG8gdXBkYXRlIHRoZQo+IENhcmdvLmxvY2sgYnV0
IGFyZSB1bmFibGUgdG8gdXBkYXRlIHRoZSB2ZXJzaW9uKGkuZS4gaWYgdGhlIHBhY2thZ2UgZG9l
cwo+IG5vdCBoYXZlIGEgbmV3ZXIgdmVyc2lvbikuCgpJIHdhcyBub3Qgc3BlYWtpbmcgYWJvdXQg
dGhlIHZlcnNpb24gb2YgdGhlIHBhY2thZ2UsIGJ1dCB0aGF0IG9mIHRoZQphcmNoaXZlLCBsaWtl
IHdlIGhhdmUgLWdpdDQsIC1jYXJnbzIsIGV0Yy4uLgoKPiBBcmUgeW91IHRoaW5raW5nIG9mIHNv
bWV0aGluZyBsaWtlIHNldHRpbmcgdGhlIENhcmdvLmxvY2sgdmVyc2lvbiBpbiB0aGUgLm1rCj4g
YW5kIGluY29ycG9yYXRpbmcgdGhhdCBpbiB0aGUgYXJjaGl2ZSBzb21laG93PwoKWWVzLCBleGFj
dGx5IHRoYXQ6IEZPT19DQVJHT19MT0NLX1ZFUlNJT04gPSBOCgpBbmQgdGhlbiB0aGUgaW5mcmEg
Y2FuIGFwcGVuZCBhIC1sb2NrTiBzdWZmaXggd2hlbiBpdCBjb25zdHJ1Y3RzIHRoZQphcmNoaXZl
IGZpbGVuYW1lLgoKRGFtbiwgeW91IGdvdCBtZSB0byByZXZlYWwgbXkgY3VubmluZyBwbGFuIGlu
IGFkdmFuY2UhIDstKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8g
fCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
