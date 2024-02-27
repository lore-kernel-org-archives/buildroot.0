Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB3C54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 21:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 748CC4148B;
	Tue, 27 Feb 2024 21:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlnUpmSSFhDB; Tue, 27 Feb 2024 21:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A644152A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A644152A;
	Tue, 27 Feb 2024 21:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 173171BF3DC
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 113208220E
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 21:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJadA4UQGszP for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 21:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D962982206
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D962982206
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D962982206
 for <buildroot@uclibc.org>; Tue, 27 Feb 2024 21:39:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 631FD2005A4;
 Tue, 27 Feb 2024 22:39:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42978])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 Feb 2024 22:39:14 +0100
MIME-Version: 1.0
Date: Tue, 27 Feb 2024 22:39:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <d9e46b02-e299-46b7-9fd9-bbe43ecd9afe@smile.fr>
References: <20240211214935.1603160-1-ju.o__4871.99223586998$1707688208$gmane$org@free.fr>
 <pan$8ffb8$216c5e07$61fb4f0$f3d6d79f@ID-313208.user.individual.net>
 <d9e46b02-e299-46b7-9fd9-bbe43ecd9afe@smile.fr>
User-Agent: Webmail Free/1.6.5
Message-ID: <67dfa900e0a60574bc4cb3137d8b7c82@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709069956;
 bh=tkPrUkbVhk9J4bzADOkOJyzsXhBhEevjgQ1gDBXmasQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MgIhc4Wa/3Yjm/hklP71gqDDohVxRGl2uUCxBY+EPaDn76SGEHnIIKND0MBqqHNso
 PBvRkR1FGCSuQ5LFQZ1hZN9/7stKd8fLo74QeTnJ87jajjiZBdmxLAgB2sEkJUr77K
 eSgmvMqNqVzTfN54LSZQnZd0GVXH6QgtzDwdmpFSqz+Q3h4yz5qQi76rEi9WQGYC3f
 RmZQ5XyYLbUOoixKU9r4cbSaC4zVrDE+qNIjdGgUmZPNo0J5SXcq0YrCZZBEjVSmfV
 xTv8xIRuGo+AfYAWLeH4mveB+6ZsnLCRHZET5GxMnUGFxxppw0IXU5R3XHvZLZewP/
 nj4CtA58L3A9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MgIhc4Wa
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.17
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksIFJvbWFpbiwgQmVybmQsCgpPbiAyNy8wMi8yMDI0IDEzOjU4LCBSb21haW4gTmFvdXIgd3Jv
dGU6Cj4gSGVsbG8gSnVsaWVuLCBCZXJuZCwgQWxsLAo+IAo+IExlIDE5LzAyLzIwMjQgw6AgMjE6
MDQsIEJlcm5kIEt1aGxzIGEgw6ljcml0wqA6Cj4+IEFtIFN1biwgMTEgRmViIDIwMjQgMjI6NDk6
MzUgKzAxMDAgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoKPj4gCj4+PiBGb3IgY29tbWl0IGxvZ3Ms
IHNlZToKPj4+IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3AvZ251LWVmaS9jb2RlL2NpLzMuMC4x
Ny9sb2cvCj4+IAo+PiBIaSBKdWxpZW4sCj4+IAo+PiB0aGlzIGJ1bXAgYnJlYWtzIGJ1aWxkaW5n
IHN5c2xpbnV4IChub3QgeWV0IGNhdWdodCBieSB0aGUgCj4+IGF1dG9idWlsZGVycyk6Cj4+IGh0
dHBzOi8vYnVncy5nZW50b28ub3JnLzkyMTU5Nwo+IAo+IE5vdCBieSBhdXRvYnVpbGRlcnMgYnV0
IGJ5IHRoZSBnaXRsYWItY2k6Cj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vam9icy82MjU2ODgwOTM3Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vam9icy82MjU2ODgwOTQ5Cj4gCj4gVGhlIGlzc3VlIHdhcyBpbnRy
b2R1Y2VkIGluIGdudS1lZmkgMy4wLjE2IFsxXSB0aGF0IHNlZW1zIAo+IHdyb25nL2luY29tcGxl
dGUgaWYgd2UKPiBjb21wYXJlIHdpdGggaW50dHlwZXMuaCBoZWFkZXIgZnJvbSBnbGliYyBbMl0u
Cj4gCj4gSnVsaWVuLCBjYW4geW91IGhhdmUgYSBsb29rPwo+IFRoYW5rcyEKClRoYW5rcyBmb3Ig
cG9pbnRpbmcgdGhhdCBvdXQuIEkgcHJvcG9zZWQgdGhlIGZvbGxvd2luZyBwYXRjaCB0byBmaXgg
dGhlIAppc3N1ZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI0MDIyNzIxMzUxNy4yNDE4MzctMS1qdS5vQGZyZWUuZnIvCgpCZXN0IHJlZ2Fy
ZHMsCgpKdWxpZW4uCgo+IFsxXQo+IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3AvZ251LWVmaS9j
b2RlL2NpLzE4OTIwMGQwYjBmNmZmZjQ3M2QzMDI4ODBkOTU2OWY0NWQ0ZDhjNGQKPiBbMl0KPiBo
dHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1ibG9iO2Y9c3RkbGliL2lu
dHR5cGVzLmg7aD1jZmRhMTQ2YWE5Yjk1NmRjOWY0NjJiZDY1ZmI4MjhlNTkyOWJjOTBiO2hiPUhF
QUQjbDI5Cj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+PiAKPj4gUmVnYXJkcywg
QmVybmQKPj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
