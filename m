Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C89CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B25610A3
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B25610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A644D84AC2;
	Fri, 10 Sep 2021 21:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_rXi6-wZ86z; Fri, 10 Sep 2021 21:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E495684AC0;
	Fri, 10 Sep 2021 21:06:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7501C1BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63D1884AC0
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0opb5LcN-VG for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:06:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id B77A684AB6
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 21:06:54 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPA
 id OnjZmGvdOiqGsOnjZmcDhC; Fri, 10 Sep 2021 23:06:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631308013; bh=h31LlDEY1TTcyr7MXCInq9zztr89YUhb2qt1hkN+afo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=GoQ1n+mrtd+KO6x1/nf33SpWxeuQwPL8H+mQZSOaDUyhT8gt++j4wtjOnODtQ7/bN
 sHrYQdQm+YVgwpUOqXRBSJsdpUL7W4XHyvzKrUppiRzqDvBzetZ26yC5unWvqXosRc
 TTwWMZNuL72O+WOVE1fStZius1JEMvia7AsbTmoKcT7iJXTLVjistgfEt0cUY7Rprf
 EPkwqzWMnnjx/RDFb3SCpH97j+Ln2ypG4KfZXbquWMXjtEPHMrQl5vVr2R48LjtKUq
 UXTT8Nt/UwazEJWM0h+i4QuQ20CIKYctf0T7XlrCX1w972Ot8X7om+FhDcZOt4w+mA
 oKMBa8jhkCw5w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 10 Sep 2021 23:06:52 +0200
Message-Id: <48C5318C-7FDC-4B17-A701-405FE2957762@benettiengineering.com>
References: <87a6kk6t9z.fsf@dell.be.48ers.dk>
In-Reply-To: <87a6kk6t9z.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfDYq+DkwBdsHaY5SO3HbUyon7S3KFK0w2AgTxqALl+adAxniRPZptQNmWXNvRJoqV9jK7he8PVMtVIs5CCtTa5KDFUv5fcJUOx5jwSLDWjZhK0A86O2u
 bywWalxHZ3xtXrpUsrJrfFe3I8b41Ggnc6HDhmkDUg7mW0090aX4eKggSM+MKr8fYYodK0iek5uBHauEcyJ8+ABo/HfC7PqrE2sw0OldjH/ys/sApBUpAF1s
 JJO+CaqGspWNgJrbDcnoeiSFrYidFKq23uYok3wQsBU=
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.9.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Cj4gSWwgZ2lvcm5vIDEwIHNldCAyMDIxLCBhbGxlIG9yZSAyMzowMCwgUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7vwo+PiAKPj4+Pj4+ICJH
aXVsaW8iID09IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPiB3cml0ZXM6Cj4gCj4+IEhpIFBldGVyLCBGcmFuY29pcywKPj4+PiBJbCBnaW9ybm8g
MTAgc2V0IDIwMjEsIGFsbGUgb3JlIDEzOjI0LCBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNn
YWFyZC5jb20+IGhhIHNjcml0dG86Cj4+PiAKPj4+IO+7vwo+Pj4+IAo+Pj4+Pj4+PiAiRnJhbmNv
aXMiID09IEZyYW5jb2lzIFBlcnJhZCA8ZnBlcnJhZEBnbWFpbC5jb20+IHdyaXRlczoKPj4+IAo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHou
b3JnPgo+Pj4+IC0tLQo+Pj4+IHBhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enouaGFzaCB8IDIgKy0K
Pj4+PiBwYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lm1rICAgfCAyICstCj4+Pj4gMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+PiAKPj4+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoIGIvcGFja2FnZS9oYXJmYnV6ei9o
YXJmYnV6ei5oYXNoCj4+Pj4gaW5kZXggNzc0YjMxMDRhLi5hMTAxZjNlN2QgMTAwNjQ0Cj4+Pj4g
LS0tIGEvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoCj4+Pj4gKysrIGIvcGFja2FnZS9o
YXJmYnV6ei9oYXJmYnV6ei5oYXNoCj4+Pj4gQEAgLTEsMyArMSwzIEBACj4+Pj4gIyBMb2NhbGx5
IGNvbXB1dGVkCj4+Pj4gLXNoYTI1NiAgZDU4NDYxMzk1Y2UyOGI5ZGMwMzkwMzI1NDM3NGRkNzBj
MzhjOGMyOGM1MDQ2ZGIxMjNjMDhmN2FiOTQxN2JlNyAgaGFyZmJ1enotMi44LjIudGFyLnh6Cj4+
Pj4gK3NoYTI1NiAgM2UxYzJlMWQyYzY1ZDU2MzY0ZmQxNmQxYzQxYTA2YjJhMzU3OTU0OTZmNzhk
ZmZmNjM1YzJiNzQxNGI1NGM1YSAgaGFyZmJ1enotMi45LjAudGFyLnh6Cj4+Pj4gc2hhMjU2ICA0
MzQ1ZTE3MzVmOGJjNmQ4MTJmZWQ1MTgwY2FiYjVhNWU4OGE0MTA5ZDMzMjY1MmYyYTQ1YzEzY2Zh
NWVlNjkyICBDT1BZSU5HCj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1
enoubWsgYi9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lm1rCj4+Pj4gaW5kZXggYzdmNWRmZTlk
Li5jY2IwZDk0MGQgMTAwNjQ0Cj4+Pj4gLS0tIGEvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5t
awo+Pj4+ICsrKyBiL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsKPj4+PiBAQCAtNCw3ICs0
LDcgQEAKPj4+PiAjCj4+Pj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+IAo+Pj4+IC1IQVJG
QlVaWl9WRVJTSU9OID0gMi44LjIKPj4+PiArSEFSRkJVWlpfVkVSU0lPTiA9IDIuOS4wCj4+PiAK
Pj4+IERvZXNuJ3QgaGFyYnV6eiBmb2xsb3cgdGhlIGdub21lLXN0eWxlIG9kZCB2ZXJzaW9ucyBh
cmUgZGV2ZWxvcG1lbnQKPj4+IHZlcnNpb25zPyBJZiBzbywgZG8gd2Ugd2FudCB0byBoYXZlIDIu
OS54IGluIEJ1aWxkcm9vdD8KPiAKPj4gSXQgZG9lc27igJl0IHNlZW0gdG8gZm9sbG93IHRoYXQg
c2NoZW1lIGFueW1vcmUgc2luY2Ugc29tZSB0aW1lLgo+PiBJZiB3ZSBjaGVjayB3aGF0IFVidW50
dSB1c2VzIGluIGxhc3QgdmVyc2lvbnM6Cj4+IGh0dHBzOi8vcGtncy5vcmcvc2VhcmNoLz9xPUhh
cmZidXp6Cj4+IHRoZXnigJlyZSBlaXRoZXIgb2RkIGFuZCBldmVuLgo+PiBVYnVudHUgICAgICAg
ICAgSGFyZmJ1enoKPj4gMTguMDQoTFRTKSAgICAgMS43LjIKPj4gMjAuMDQoTFRTKSAgICAyLjYu
NAo+PiAyMS4wNCAgICAgICAgICAgICAgMi43LjQKPiAKPj4gU28gSSB0aGluayB3ZeKAmXJlIGZp
bmUgZm9sbG93aW5nIGV2ZXJ5IHJlbGVhc2UuCj4+IEFmdGVyIHRoaXMgcGF0Y2ggdGhlcmUgaXMg
bWluZSB3aXRoIHZlcnNpb24gMi45LjEKPiAKPiBBaGgsIG9rIC0gU29ycnkgdGhlbi4gSSdsbCBn
ZXQgdG8geW91ciAyLjkuMSBwYXRjaCB0aGlzIHdlZWtlbmQuCgpObyBwcm9ibGVtLCBZYW5uIGp1
c3QgYXBwbGllZCBpdCB0byBtYXN0ZXIuCkFsc28gSeKAmXZlIGNsZWFyZWQgdGhpcyB0byBteXNl
bGYgdG9vIHNpbmNlIEnigJl2ZSBhZGRlZCBteXNlbGYgdG8gREVWRUxPUEVSUwpmb3IgaGFyZmJ1
enogc2luY2UgaXQgd2FzIG9ycGhhbmVkIDotKQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiAt
LSAKPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMu
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
