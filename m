Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D2C5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 12:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D26C80626;
	Mon, 10 Aug 2026 12:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0M1w1AzKGtb; Mon, 10 Aug 2026 12:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9113980DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786364720;
	bh=0I0qR+GXFfCerApQSO8YJmd8CHcsbCRa1lYEjhRWxuk=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P4r+bFVdNbvSWFxXXJM+m3I4VvHTKalnrhf07Dn+vIDnligZcueN+z9fiTze+Dahi
	 FBy9V6eODAaPwACiWouKYqG6FuGAFilGfBKLq3FpdHmeyUuywQTYYIx+W2vUbQH/Qg
	 iG6NQ1uI7LVdLQCctkSHR5eM6Ee54GnEd2BdmU9weFkSn1W/kC38uLpHaLnCDN0Zh8
	 6CKLJ+yGoG1+vcVznHnjankV7jK6Mzb/ZsgSTpWWEO+5Heed8x3clofljMPyz0P3ZQ
	 +hscQGaU1vAijrH0YfLpYN9k2s+/1lejS8nZkJ+gLk5PtmFj4D7NkaRlWqP9dgyi5B
	 db8dnfTXBuB9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9113980DC4;
	Mon, 10 Aug 2026 12:25:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0165F10E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBCA8405BA
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yjZlD92P_Tw for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 12:25:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2830405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2830405DC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2830405DC
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 12:25:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A995E1A1537;
 Mon, 10 Aug 2026 12:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FFC36033B;
 Mon, 10 Aug 2026 12:25:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2538F11C4A497; 
 Mon, 10 Aug 2026 14:25:09 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 14:25:09 +0200
Message-Id: <DKL9FUAMHEBJ.2DHVLMRHLWOGZ@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <buildroot@buildroot.org>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Thomas Perale" <thomas.perale@mind.be>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <anWV0uzil1jp4BNN@windsurf>
 <20260807115533.97671-1-thomas.perale@mind.be>
In-Reply-To: <20260807115533.97671-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786364711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XsxU9uh2v3LmgVDf0ix+8TwYSFV63W1CyHS49o8d9zo=;
 b=ZISgOk9ohUxVRclbVK84i3KAywY1H/lj22TWUz1BnqGAuxMFqBKKqL5ewbVHF5RXAGBcZf
 bJKchYH0BC9+6Ag/j4O8YWrrwvDvpV7HvzXPJzfX81oJeCjH+XSGpzTMax5B8NwEJb1Jz0
 6aiHDc3O/7JjrYRlbDgFdB7dtIwTGoY39p5nR1KE2E4bYt+Gfblw+vaSoBOGAxj/S0+LGC
 hUr9Q338fxFAOS/oxZmNBf6T7Q4qsujL1QW98wyC8zDdluCPT6xwkB9gP5vgJEILKoDN4J
 rzkXri5ZGc19qyQnxj1P5RJU9J6ZDxcbnYFfAiv+1excXz1birt2CAZ0g8kMng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZISgOk9o
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIEF1ZyA3LCAyMDI2IGF0IDE6NTUgUE0gQ0VTVCwgVGhvbWFzIFBlcmFsZSB3cm90ZToK
PiBIaSBUaG9tYXMsIEFsZXhpcywKPgo+PiBJIGFtIG5vdCBzdXBlciBjbGVhciBvbiB3aGF0IHNh
c3MgZXhhY3RseSBkb2VzL2lzLiBCdXQgc29tZSB0aW1lIGFnbywKPj4gd2UgZHJvcHBlZCBhbGwg
SlMgbGlicmFyaWVzIGZyb20gQnVpbGRyb290Ogo+PiAKPj4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9idWlsZHJvb3QvMjAyNTA4MjkxMDMzNDAuMTU4ODczLTEtdGhvbWFzLnBlcmFsZUBtaW5k
LmJlLwo+PiAKPj4gQnV0IHNhc3MgZG9lc24ndCBzZWVtIHRvIGJlIG9uZSBvZiB0aG9zZSBzdGF0
aWMgSlMgbGlicmFyaWVzIEkgZ3Vlc3MKPj4gYmVjYXVzZSBpdCBpbnN0YWxscyBzb21lIGV4ZWN1
dGFibGUgaG9zdCB0b29sPwo+Cj4gSWYgSSByZW1lbWJlciBjb3JyZWN0bHkgbm9kZS1zYXNzIGlz
IGJ1aWxkIHVzaW5nIG5vZGUtZ3lwIHNvIEkgY2FuIG1ha2Ugc2Vuc2UKPiB0byBoYXZlIGl0IGlu
IEJ1aWxkcm9vdCBiZWNhdXNlIHRoZSBub2RlLXNhc3MgdmVyc2lvbiBpcyBjbG9zZWx5IHJlbGF0
ZWQgdG8gdGhlCj4gbm9kZSB2ZXJzaW9uIHByZXNlbnQgaW4gQnVpbGRyb290LgoKSnVzdCB0byBt
YWtlIHN1cmUgd2UgYXJlIHRhbGtpbmcgYWJvdXQgdGhlIHNhbWUgdGhpbmcsIHRoaXMgcGFja2Fn
ZSBpcwpub3QgaW50cm9kdWNpbmcgbm9kZS1zYXNzIChbMV0pLCB3aGljaCBpcyBkZXByZWNhdGVk
LCBidXQgc2FzcyAoWzJdKQoKPiBUaGUgcXVlc3Rpb24gaXMgaG93IGRvIHlvdSBwbGFuIHRvIHVz
ZSAnbm9kZS1zYXNzJyBvbmNlIHlvdSBoYXZlIHRoZSBleGVjdXRhYmxlLgo+IENvcnJlY3QgbWUg
aWYgSSdtIHdyb25nIGJ1dCBJIGd1ZXNzIHRoZSBnb2FsIGhlcmUgaXMgdG8gdXNlIGl0IGluIGFu
b3RoZXIKPiBCdWlsZHJvb3QgcGFja2FnZSB0aGF0IHJlcHJlc2VudCBhICJ3ZWJhcHAiIGFuZCB5
b3UgcnVuICdub2RlLXNhc3MnCj4gaW4gdGhlIGJ1aWxkIHN0ZXAgb2YgdGhhdCBwYWNrYWdlIGFu
ZCB0aGVuIHBsYWNlIHRoZSBnZW5lcmF0ZSBjc3MgaW4gdGhlCj4gY29ycmVjdCBsb2NhdGlvbiA/
CgpDb3JyZWN0LiBUbyBiZSBleGFjdCwgc2FzcyBpcyBub3QgY3VycmVudGx5IGNhbGxlZCBkaXJl
Y3RseSBieSB0aGUKY3VzdG9tIGJ1aWxkcm9vdCBwYWNrYWdlIGZvciAid2ViYXBwIi4gIndlYmFw
cCIgaXMgYSBwaHAgcHJvamVjdCwgdXNpbmcKY29tcG9zZXIgdG8gaW5zdGFsbCBhbmQgcnVuICJt
aW5pLWFzc2V0IiAoWzNdKSB3aGljaCBpcyBhIGJ1bmRsZXIKZGVwZW5kaW5nIG9uIHVnbGlmeSBh
bmQgc2FzcyBiaW5hcmllcyBiZWluZyBwcmVzZW50IG9uIGhvc3QuCgo+IFRoZSBjb3JyZWN0IHdh
eSBoYW5kbGUgdGhpcyAoYW5kIG1pbmlmaWNhdGlvbikgd291bGQgcHJvYmFibHkgYmUgdG8gdXNl
IGEKPiBkZWRpY2F0ZWQgSmF2YVNjcmlwdCBidW5kbGVyIGFuZCBjb25maWd1cmUgaXQgdG8gdXNl
IG5vZGUtc2FzcyBhbmQgc2V0dXAKPiBtaW5pZmljYXRpb24uIFRoaXMgd291bGQgcHJvYmFibHkg
eWllbGQgc21hbGxlciBidW5kbGVzIGFuZCBoZWxwIGhhbmRsZQo+IHZlcnNpb25pbmcgY29ycmVj
dGx5IGZvciB5b3VyIHdlYmFwcC4KPiBUaGlzIHdhcyBhbHNvIHRoZSB0aGlua2luZyBpbiBkcm9w
cGluZyB0aGUgSlMgbGlicmFyaWVzIGZyb20gQnVpbGRyb290Lgo+Cj4gSWYgeW91IGhhdmUgYSBg
cGFja2FnZS5qc29uYCBmb3IgdGhlIHdlYmFwcCB3aXRoIHRoZSBub2RlLXNhc3MgZGVwZW5kZW5j
eS4gQ2FuCj4geW91IGBucG0gaW5zdGFsbGAgdGhlIHdlYmFwcCBkZXBlbmRlbmNpZXMgdXNpbmcg
dGhlIGJ1aWxkcm9vdCAnbnBtJwo+IGhvc3QtcGFja2FnZSB3aXRob3V0IGVycm9ycyA/IElmIHRo
YXQncyB0aGUgY2FzZSBJIHdvdWxkIHNheSB0aGF0IGl0IGlzCj4gcHJvYmFibHkgYSBiZXR0ZXIg
c29sdXRpb24uCgpTbyBpbiB0aGlzIGNhc2UgSSd2ZSBnb3Qgbm8gcGFja2FnZS5qc29uLCBJIG9u
bHkgaGF2ZSBhIGNvbXBvc2VyLmpzb24KcmVxdWlyaW5nIG1pbmlfYXNzZXQsIGFuZCBtaW5pX2Fz
c2V0IGRvZXMgbm90IGF1dG9tYXRpY2FsbHkgcHVsbCB0aG9zZQpkZXBlbmRlbmNpZXMuIE1pbmkt
YXNzZXQgaXMgY29uZmlndXJlZCB0aHJvdWdoIGEgLmluaSBmaWxlLCBpbiB3aGljaCB3ZQpjYW4g
dXNlIGRpZmZlcmVudCAiZmlsdGVycyIgKGVnOiBTYXNzKSwgYW5kIGVhY2ggZmlsdGVyIGhhcyBk
aWZmZXJlbnQKcmVxdWlyZW1lbnRzLCBidXQgaXQgaXMgdXAgdG8gdGhlIHVzZXIgdG8gYnJpbmcg
dGhvc2UgZGVwZW5kZW5jaWVzIG9uCmhvc3QuIE9uZSB0aGluZyB0aGF0IEkgY2FuIGNoZWNrIGhv
d2V2ZXIsIGNsb3NlIHRvIHlvdXIgc3VnZ2VzdGlvbiwgaXMKd2hldGhlciB0aGVyZSBpcyBhIGRp
ZmZlcmVudCBDU1MgImZpbHRlciIgdGhhdCBjb3VsZCBiZSBicm91Z2h0CmF1dG9tYXRpY2FsbHkg
YnkgY29tcG9zZXIgYW5kIHRoYXQgZ2VuZXJhdGVzIHNvbWV0aGluZyBjbG9zZSB0byB3aGF0CiJ3
ZWJhcHAiIGlzIGN1cnJlbnRseSBvdXRwdXR0aW5nLgoKQWxleGlzCgo+Cj4gQmVzdCByZWdhcmRz
LAo+IFBFUkFMRSBUaG9tYXMKClsxXSBodHRwczovL3d3dy5ucG1qcy5jb20vcGFja2FnZS9ub2Rl
LXNhc3MKWzJdIGh0dHBzOi8vd3d3Lm5wbWpzLmNvbS9wYWNrYWdlL3Nhc3MKWzNdIGh0dHBzOi8v
Z2l0aHViLmNvbS9tYXJrc3RvcnkvbWluaS1hc3NldAoKCgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
