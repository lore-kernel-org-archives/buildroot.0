Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67863C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 22:53:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1679E610C8
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 22:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1679E610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBD4E40111;
	Tue, 31 Aug 2021 22:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DiK06GYD1-8a; Tue, 31 Aug 2021 22:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 459084021C;
	Tue, 31 Aug 2021 22:53:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57AC21BF5E6
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 22:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54962817F5
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 22:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8w72ChaE2Xwu for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 22:53:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D92F8102D
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 22:53:28 +0000 (UTC)
Received: from smtpclient.apple ([89.164.10.189])
 by Aruba Outgoing Smtp  with ESMTPA
 id LCd9mOyV5LTzHLCdAmZ10w; Wed, 01 Sep 2021 00:53:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630450406; bh=JnIGdC7kwZ4KY2zrfT28d56pZ+m892Hg75Bc/ktim2c=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=PcKqXfhqM1X2hgjP++AGFTtj7ofdYuWQQ/XGfDQU8sYO6wtf6SAmUBVCqX0pKsuS0
 rXK4d9jMBCWQcx+o1x5fNHjhINWqjl1a7ipYqZjdsv42I8K8dy2awK9CoRGqH9MnHo
 ziYc4A0ahXRGLmZ1/pROpS/0tQEX4RnlCaM0hj7CZM5XslmbBr7KY6RATYwDH0SgqD
 4BL4FmfUQTVfJ761DswHgd+Y6HU9HSb4tYpD43nOpuJUxbHaWt6pl+PcXvDgzqXRsT
 jIcXixfjmPVltyfyi5izYb1O2VEuOTGyTYRfwAgh5SlVtVsmvZOcLhIN79EeureKKD
 +t/LJgmH4X3/w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 1 Sep 2021 00:53:22 +0200
Message-Id: <71986D1E-72FB-45C9-B7E8-9A1B34479E5E@benettiengineering.com>
References: <bcc8e6e7-7d05-a5a9-1f69-e6d758d7fdd3@benettiengineering.com>
In-Reply-To: <bcc8e6e7-7d05-a5a9-1f69-e6d758d7fdd3@benettiengineering.com>
To: David Corbeil <david.corbeil@dynonavionics.com>, buildroot@busybox.net
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfJJBqD/8bGdVwmxhalh55mttKZIBCM/2Pv/Pll81/nIwgRif294yqnsHsFeTnQxv1b3osLxQDjM4GiFaHsefKmWzo6dMYVFoBUCrnbmLcOXvJ2atVaUd
 fhP3ujECRJArpvhBqSYaVfGg7+POLB421GUBLFireSW0oWsq0tOO4yx9DB2AWqc5ec0djXyQcrY4NF0dJFP6qc2R4qdax0iyAAZ7uxiE5pgjdWOGTLw+ZN1n
 HtT+JPxsvaikh8FQ+qaCnA==
Subject: Re: [Buildroot] Buildroot + Rpi4 + Accelerated OpenGL + X11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgRGF2aWQsCgo+IElsIGdpb3JubyAxIHNldCAyMDIxLCBhbGxlIG9yZSAwMDozNiwgR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhhIHNjcml0
dG86Cj4gCj4g77u/SGkgRGF2aWQsCj4gCj4+IE9uIDkvMS8yMSAxMjowNSBBTSwgRGF2aWQgQ29y
YmVpbCB3cm90ZToKPj4gSGksCj4+IFVzaW5nIEJ1aWxkcm9vdCwgSeKAmW0gdHJ5aW5nIHRvIGJ1
aWxkIGFuIE9TIHRoYXQgY2FuIHJ1biBteSBPcGVuR0wgKG5vdCBFUykgYXBwIHdpdGggYWNjZWxl
cmF0ZWQgM0QgZ3JhcGhpY3MuIEkgYWxzbyB3YW50IGl0IHRvIHVzZSBYMTEgYXMgYSBkaXNwbGF5
IHNlcnZlci4gU28gZmFyIEkgaGF2ZW7igJl0IHRyaWVkIG15IGFwcCBkaXJlY3RseSBvbiBteSBi
dWlsdCBPUyBiZWNhdXNlIGl0IGhhcyBtYW55IGRlcGVuZGVuY2llcyBidXQgSeKAmW0gdXNpbmcg
Z2xtYXJrMiwga21zY3ViZSBhbmQgZ2x4Z2VhciB0byBkZWJ1ZyBhbmQgdHJ5IG91dCBkaWZmZXJl
bnQgQnVpbGRyb290IGNvbmZpZ3VyYXRpb25zLgo+PiBJIHRyaWVkIHRoZSAvdmM0LWttcy12M2Qt
cGk0LyBhbmQgL3ZjNC1rbXMtdjNkLyBvdmVybGF5cyBpbiB0aGUgY29uZmlnLnR4dCwgYnV0IEni
gJl2ZSBoYWQgYmV0dGVyIHJlc3VsdHMgdXNpbmcgdGhlIGZvcm1lci4KPj4gU28gZmFyIEkgd2Fz
IGFibGUgdG8gZ2V0IGdsbWFyazIgdG8gcnVuIGJ1dCBpdCB3YXMgdXNpbmcgYSBzb2Z0d2FyZSBP
cGVuR0wgcmVuZGVyZXIgKHN3cmFzdCkuIEFsdGhvdWdoIHBlcmZvcm1hbmNlIGlzIGFieXNtYWwg
c28gdGhhdOKAmXMgYSBubyBnby4KPj4gSSBoYXZlIDQgZmxhdm9ycyBvZiBnbG1hcmsyIGluIG15
IE9TLCBnbG1hcmsyLCBnbG1hcmsyLWVzMiwgZ2xtYXJrLWVzMi1kcm0gYW5kIGdsbWFyazItZHJt
LiBUaGUgb25seSBvbmVzIHRoYXQgcnVuIGFyZSBnbG1hcmsyLWRybSBhbmQgZ2xtYXJrMi1lczIt
ZHJtLiBUaGV5IHJ1biByZWFsbHkgd2VsbCBhdCA2MGZwcy4ga21zY3ViZSBydW5zIHJlYWxseSB3
ZWxsIGFzIHdlbGwuCj4+IFRoZSBwcm9ibGVtIGNvbWVzIHdoZW4gSSB0cnkgdG8gcnVuIGdseGdl
YXJzIGFuZCBnbHhpbmZvIHdoZW4gWDExIGlzIHJ1bm5pbmcuIEkgZ2V0IHRoZSBmb2xsb3dpbmcg
ZXJyb3JzOgo+PiAgKgo+PiAgICBHbHhnZWFycwo+PiAgICAgICAgRXJyb3I6IENvdWxkbuKAmXQg
Z2V0IGFuIFJHQiwgRG91YmxlZC1idWZmZXJlZHZpc3VhbAo+PiAgKgo+PiAgICBHbHhpbmZvOgo+
PiAgICAgICAgbmFtZSBvZiBkaXNwbGF5OiA6MAo+PiAgICAgICAgRXJyb3I6IGNvdWxkbuKAmXQg
ZmluZCBSR0IgR0xYIHZpc3VhbCBvciBmYmNvbmZpZyA+ICAgKgo+PiAgICBHbG1hcmsyOgo+PiAg
ICAgICAgRXJyb3I6IEdMWCB2ZXJzaW9uID49IDEuMyBpcyByZXF1aXJlZAo+PiAgICAgICAgRXJy
b3I6IEVycm9yOiBDb3VsZG7igJl0IGdldCBHTCB2aXN1YWwgY29uZmlnCj4+ICAgICAgICBFcnJv
cjogbWFpbjogQ291bGQgbm90IGluaXRpYWxpemUgY2FudmFzCj4+IEnigJlkIGxpa2UgdG8gZ2V0
IHRoZSByZWd1bGFyIGdsbWFyazIgdG8gcnVuIHNpbmNlLCBmcm9tIG15IHVuZGVyc3RhbmRpbmcs
IGl0IHVzZXMgcmVndWxhciBPcGVuR0w/Cj4gCj4gSXQgZGVwZW5kcyBvbiB5b3VyIE9wZW5HTCBp
bXBsZW1lbnRhdGlvbiwgYW5kIGhlcmUgeW91IGhhdmUgYW4gRVMgaW1wbGVtZW50YXRpb24sIHNv
IGl0J3Mgb25seSBhIHN1YnNldCwgYnV0IGNvbnNpZGVyaW5nIHlvdXIgZGVmY29uZmlnIGJlbG93
IFggdHJpZXMgdG8gdXNlIHRoZSBFUyBvbmUgYnV0IGRvZXNuJ3Qgc3VjY2VlZCBiZWNhdXNlIG9m
IGZidHVyYm8gZG9lc24ndCBzdXBwb3J0IHlvdXIgYnJvYWRjb20gZ3B1Lgo+IAo+PiBJ4oCZbSBw
cmV0dHkgY29udmluY2VkIG15IGVuZCBnb2FsIGlzIHBvc3NpYmxlIGJlY2F1c2UgSSB3YXMgYWJs
ZSB0byBnZXQgbXkgYXBwIHRvIHJ1biBmbGF3bGVzc2x5IGluIFJhc3BiZXJyeSBQaSBPUyB1c2lu
ZyByZWd1bGFyIE9wZW5HTC4gSnVzdCBuZWVkIHRvIGZpbmQgYWxsIHRoZSBuZWNlc3NhcnkgcGFj
a2FnZXMgYW5kIGNvbmZpZ3VyZSB0aGUgT1MgY29ycmVjdGx5LiBFYXN5IHRvIHNheSwgZWFzeSB0
byBkbyByaWdodD8KPiAKPiBJdCBpcyBwb3NzaWJsZQo+IAo+PiBJIGxpbmtlZCBteSBkZWZjb25m
aWcsIHRoZSB4b3JnIGNvbmZpZ3VyYXRpb24gZmlsZSBhbmQgeG9yZyBsb2cgZmlsZS4KPj4gYnVp
ZGxyb290IFJwaTRfMzJfZGVmY29uZmlnX2V1ZGV2OiBodHRwczovL3Bhc3RlYmluLmNvbS94Zko5
V2JkUSA8aHR0cHM6Ly9wYXN0ZWJpbi5jb20veGZKOVdiZFE+Cj4+IHhvcmcuY29uZjogaHR0cHM6
Ly9wYXN0ZWJpbi5jb20vdmV3RHdtdEQgPGh0dHBzOi8vcGFzdGViaW4uY29tL3Zld0R3bXREPgo+
PiB4b3JnIGxvZzogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vMHlEWEdEcjcgPGh0dHBzOi8vcGFzdGVi
aW4uY29tLzB5RFhHRHI3Pgo+PiBNYXliZSB0aGUgeG9yZyBjb25maWd1cmF0aW9uIGZpbGUgbmVl
ZHMgdG8gYmUgbW9kaWZpZWQ/IEJ1dCBob3c/IEFjY29yZGluZyB0byB0aGlzIDxodHRwczovL2dp
dGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvaXNzdWVzLzQ1MjY+LCBJIHNob3VsZCBub3QgYmUg
dXNpbmcgZmJ0dXJibyBidXQgSSBkb27igJl0IGtub3cgd2hhdCB0byByZXBsYWNlIGl0IHdpdGgu
Cj4gCj4gWWVzLCB5b3UgbmVlZCB0byB1c2UgZ2xhbW9yIGFzIEkgcmVjYWxsLCBzbyB5b3UgbmVl
ZCB0byBlbmFibGUgaXQgaW4gQnVpbGRyb290IGFuZCAnbWFrZSBjbGVhbjsgbWFrZScuCgpQYXJk
b24sIGdsYW1vciBzaG91bGQgYWxyZWFkeSBiZWVuIGJ1aWx0LgpQbGVhc2UgY2hlY2sgaXQuIFlv
dSBzaG91bGQgbm90IG5lZWQgdG8gcmVidWlsZCBCdWlsZHJvb3QuCgpHaXVsaW8KCj4gCj4gVHJ5
IHRvIHRha2UgYSBsb29rIGhlcmUgZm9yIHhvcmcuY29uZiBleGFtcGxlOgo+IGh0dHBzOi8vd3d3
Lm1pbmR3ZXJrcy5uZXQvMjAxNC8wOS92aWRlb2NvcmVpdi1nbGFtb3Itb24teW91ci1yYXNwYmVy
cnktcGkvCj4gCj4gVGhhdCB3YXkgeW91IHRlbGwgWDExIHRvIHVzZSBnbGFtb3IgYW5kIGZvcmNl
IEdhbGxpdW0odGhlIEJyb2FkY29tIG1lc2EgZHJpdmVyKS4gQnV0IHlvdSBuZWVkIHRvIGRvIHNv
bWUgYXR0ZW1wdCwgSSBkb24ndCBrbm93IGlmIGl0IHdpbGwgd29yayBhcyBpdCBpcy4KPiAKPiBT
b21lIHRpbWUgcGFzc2VkIHNpbmNlIEkndmUgaGFkIG15IGhhbmRzIG9uIFgxMSBvbiBhIFJvY2tj
aGlwLiBCdXQgZ2xhbW9yIHNob3VsZCBiZSB0aGUgd2F5Lgo+IAo+IEkgZGlkbid0IGNoZWNrIGV2
ZXJ5dGhpbmcgSSd2ZSB3cml0dGVuIGFib3ZlLCBzbyB0YWtlIGl0IHdpdGggYSBncmFpbiBvZiBz
YWx0Lgo+IAo+IEJlc3QgcmVnYXJkcwo+IC0tIAo+IEdpdWxpbyBCZW5ldHRpCj4gQmVuZXR0aSBF
bmdpbmVlcmluZyBzYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6
Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
