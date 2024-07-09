Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB756C3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 608BA40ECD;
	Tue,  9 Jul 2024 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T83mdWUoRA2A; Tue,  9 Jul 2024 20:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CD540EDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3CD540EDF;
	Tue,  9 Jul 2024 20:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10D811BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 098F281E90
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5htpC-azSkS for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D6C681E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D6C681E76
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D6C681E76
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:28:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE77960006;
 Tue,  9 Jul 2024 20:28:34 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:28:34 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20240709222834.25c0009a@windsurf>
In-Reply-To: <20240419213216.518041-2-angelo.compagnucci@gmail.com>
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
 <20240419213216.518041-2-angelo.compagnucci@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720556915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G76xqy6+11ZcWFehQrnc7y009Ks4JcrltyZcMk3qqJQ=;
 b=HQMLAy1OaQxrs3ghGvGrraPEzY3ywN2vPz8V1um6kFWJopvhGAU0WcA2cW3E1NFiGhSTWZ
 CmpLo22l7a7YmVo8ieKdkPrnTuoktAS4exfdLkLpbHnYyWhXvQ43agsa3Ag3OwEB8BDumf
 v0nLr/eR2rFMTIUXry6TjouoywgsuM1Z19XpXJYueVQkavgcCKjOBU7KwJEa6K8YFb7Yq+
 f91LUmzmEjEq3xy1rDyPqDyBDEYKQbfkukFmHBB8FUDJedFZo0vqh/oopm6ATJbe0Mmo6t
 OvLRtggspTt+aBosSAicO5bATrpS7LE0rOv0czKEz71IV0We6Kk9Qigph3WSSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HQMLAy1O
Subject: Re: [Buildroot] [PATCH 1/2] package/fail2ban: fix data_files
 installation path
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5nZWxvLAoKT24gRnJpLCAxOSBBcHIgMjAyNCAyMzozMjoxNSArMDIwMApBbmdlbG8g
Q29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFpbC5jb20+IHdyb3RlOgoKCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZmFpbDJiYW4vMDAwMS1zZXR1cC5weS1maXgtZGF0YS1yZWxhdGl2
ZS1wYXRocy5wYXRjaCBiL3BhY2thZ2UvZmFpbDJiYW4vMDAwMS1zZXR1cC5weS1maXgtZGF0YS1y
ZWxhdGl2ZS1wYXRocy5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uZTFiNWJjNDkwYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2ZhaWwyYmFu
LzAwMDEtc2V0dXAucHktZml4LWRhdGEtcmVsYXRpdmUtcGF0aHMucGF0Y2gKPiBAQCAtMCwwICsx
LDczIEBACj4gK0Zyb20gN2I3ZmEzYzAyZDQ1NzVjMDkzNjIzMzZiYzMxMDgzNWMzNzg1OWYxYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQW5nZWxvIENvbXBhZ251Y2NpIDxhbmdl
bG8uY29tcGFnbnVjY2lAZ21haWwuY29tPgo+ICtEYXRlOiBGcmksIDE5IEFwciAyMDI0IDIyOjQ3
OjIwICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gc2V0dXAucHk6IGZpeCBkYXRhIHJlbGF0aXZl
IHBhdGhzCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsg
Y2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtB
cyBwZXIgZGlzdHV0aWxzIGRvY3VtZW50YXRpb246Cj4gKwo+ICtUaGUgZGlyZWN0b3J5IHNob3Vs
ZCBiZSBhIHJlbGF0aXZlIHBhdGguIEl0IGlzIGludGVycHJldGVkIHJlbGF0aXZlIHRvIHRoZQo+
ICtpbnN0YWxsYXRpb24gcHJlZml4IChQeXRob27igJlzIHN5cy5wcmVmaXggZm9yIHN5c3RlbSBp
bnN0YWxsYXRpb25zOwo+ICtzaXRlLlVTRVJfQkFTRSBmb3IgdXNlciBpbnN0YWxsYXRpb25zKS4g
RGlzdHV0aWxzIGFsbG93cyBkaXJlY3RvcnkgdG8gYmUgYW4KPiArYWJzb2x1dGUgaW5zdGFsbGF0
aW9uIHBhdGgsIGJ1dCB0aGlzIGlzIGRpc2NvdXJhZ2VkIHNpbmNlIGl0IGlzIGluY29tcGF0aWJs
ZQo+ICt3aXRoIHRoZSB3aGVlbCBwYWNrYWdpbmcgZm9ybWF0IFsxXS4KPiArCj4gK1doZW4gcGFj
a2FnaW5nIHRvIGEgYmRpc3Rfd2hlZWwgaW5kZWVkLCB0aGUgZmlsZXMgaW4gdGhlICJkYXRhX2Zp
bGVzIiBkaWN0aW9uYXJ5Cj4gK2FyZSBub3QgcGlja2VkIGF0IGFsbCBhcyBkYXRhIGZpbGVzIGlm
IHRoZXkgaGF2ZSBhbiBhYnNvbHV0ZSBwYXRoLAo+ICtidXQgdGhleSBhcmUgaW5zdGVhZCBhZGRl
ZCB0byB0aGUgd2hlZWwgYXMgcHl0aG9uIGZpbGVzLgo+ICtUaGlzIGhhcyB0aGUgZWZmZWN0IG9m
IGluc3RhbGxpbmcgdGhlbSBhcyBwYXJ0IG9mIHB5dGhvbiBmaWxlcyBpbiB0aGUKPiArc2l0ZS1w
YWNrYWdlcyBmb2xkZXIgd2hlbiB0aGUgd2hlZWwgaXMgaW5zdGFsbGVkLgo+ICsKPiArVGhpcyBw
YXRjaCBjYW5ub3QgYmUgc2VudCB1cHN0cmVhbSBiZWNhdXNlIGl0IGJyZWFrcyB0aGUgbGVnYWN5
IHdheSBvZgo+ICtpbnN0YWxsaW5nIHRoZSBwYWNrYWdlIHdpdGggKnB5dGhvbiBzZXR1cC5weSBp
bnN0YWxsKiBhbmQgaXQgaXMgbmVlZGVkIG9ubHkgdG8KPiArY29tcGx5IHdpdGggdGhlIHBlcDUx
NyBidWlsZHJvb3QgY29tcGF0aWJpbGl0eSBsYXllci4KPiArCj4gK1sxXSBodHRwczovL2RvY3Mu
cHl0aG9uLm9yZy8zLjEwL2Rpc3R1dGlscy9zZXR1cHNjcmlwdC5odG1sI2luc3RhbGxpbmctYWRk
aXRpb25hbC1maWxlcwo+ICtTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vs
by5jb21wYWdudWNjaUBnbWFpbC5jb20+CgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKCkhvd2V2ZXIs
IHRoaXMgcGF0Y2ggaGFzIG5vIFVwc3RyZWFtOiB0YWcsIGNhdXNpbmcgYSBjaGVjay1wYWNrYWdl
Cndhcm5pbmcgd2hlbiBiZWluZyBhcHBsaWVkOgoKV0FSTklORzogcGFja2FnZS9mYWlsMmJhbi8w
MDAxLXNldHVwLnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoOjA6IG1pc3NpbmcgVXBz
dHJlYW0gaW4gdGhlIGhlYWRlciAoaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19hZGRp
dGlvbmFsX3BhdGNoX2RvY3VtZW50YXRpb24pCgpXaGF0IGlzIHRoZSB1cHN0cmVhbSBzdGF0dXMg
b2YgdGhpcyBwYXRjaD8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
