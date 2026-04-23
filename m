Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F331BFDEE46
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B968076C;
	Thu, 23 Apr 2026 19:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4YpNV6nf9Jc; Thu, 23 Apr 2026 19:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B14FE80790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776971451;
	bh=9zC53AMlLPb3AJWHm71cInQ1MqIP634q//aAKalZlqg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OPQUODDwd6EjUzgDd63OzavRktzbvTVYxwxtKz95/U2kYIz30cZ1uo/pWvWs9Bbpu
	 ettWZP0aM8oU7R+Of7+/Zf3+GQc2GtiqhXzm1YAMskKE7WMn9sk3OeKddelpS1l84C
	 QXmHn17/lLNkoynrlw7fh94D8tEVbXG4vLTsUVdUG8URH5LnSmMx8eY+9Yoy/xTz9t
	 niANihI7jbNJu3f89IBrpLaO56Cy9L5lD6ZG0eerputxOnpms5B9g6ttfMele9whCv
	 4nd/tZlCu2pGievEN8PBcJbRIEJeIkJ3PFdE9viBqhmY/EXUgt0YXHoDiEgCPfpqHo
	 VTAhPbLne2kPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B14FE80790;
	Thu, 23 Apr 2026 19:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9FD524D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBB878076C
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9kbIxKyNOag for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C867E80E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C867E80E9C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C867E80E9C
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:10:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8531A13F8B9;
 Thu, 23 Apr 2026 21:10:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 21:10:41 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 21:10:41 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Oli Vogt
 <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260422215427.186961-1-buildroot@bubu1.eu>
References: <20260422215427.186961-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <6d47a2885ab05603e4f4a597670664bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776971447;
 bh=rcz8RyCPmsKWnc/73+9YFN9IrVtLbCuw6Lf0vwJFAW0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jr2YrnQfIey1tKQ+vl4EA4MHNJRLfAiuNvtU62bGMFrpZbZ8SuWNwo+YOlpjrxfsq
 WUfMrgjLtxiaXRJ/79oZkjhVBBAGnVIjhomXXM/xtuU2REl2ZKz5NXLEDVi80bRwlS
 3FJioS8LuIHTDxFRmbG/eqm4tRfySWNgHL4m544LQ7+ty72IZA+MsohZhEinsQ7QFl
 LR1EpjmO3H42l6lwXxIyVlF/IaVvCp4s4ZRgtXIAN/ZC96SFfEigraHch8wmchpU0g
 ZO30K0pLrrPFJsQOonfJO0HSgc0O89+ZuwrysUS16PC4/kgDSYA+UqpuMeWxuO/mDP
 qxnX8bitP/58Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jr2YrnQf
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjIvMDQvMjAyNiAyMzo1NCwgTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gRGphbmdvIDYuMC40IGZpeGVzIG9uZSBzZWN1cml0eSBpc3N1ZSB3aXRoIHNldmVyaXR5IOKA
nG1vZGVyYXRl4oCdLCBmb3VyCj4gc2VjdXJpdHkgaXNzdWVzIHdpdGggc2V2ZXJpdHkg4oCcbG93
4oCdLCBhbmQgc2V2ZXJhbCBidWdzIGluIDYuMC4zLgo+IAo+IFNlY3VyaXR5IGlzc3VlczoKPiAq
IENWRS0yMDI2LTM5MDI6IEFTR0kgaGVhZGVyIHNwb29maW5nIHZpYSB1bmRlcnNjb3JlL2h5cGhl
biBjb25mbGF0aW9uCj4gICAgIEFTR0lSZXF1ZXN0IG5vcm1hbGl6ZXMgaGVhZGVyIG5hbWVzIGZv
bGxvd2luZyBXU0dJIGNvbnZlbnRpb25zLCAKPiBtYXBwaW5nCj4gICAgIGh5cGhlbnMgdG8gdW5k
ZXJzY29yZXMuIEFzIGEgcmVzdWx0LCBldmVuIGluIGNvbmZpZ3VyYXRpb25zIHdoZXJlCj4gICAg
IHJldmVyc2UgcHJveGllcyBjYXJlZnVsbHkgc3RyaXAgc2VjdXJpdHktc2Vuc2l0aXZlIGhlYWRl
cnMgbmFtZWQgCj4gd2l0aAo+ICAgICBoeXBoZW5zLCBzdWNoIGEgaGVhZGVyIGNvdWxkIGJlIHNw
b29mZWQgYnkgc3VwcGx5aW5nIGEgaGVhZGVyIG5hbWVkIAo+IHdpdGgKPiAgICAgdW5kZXJzY29y
ZXMuCj4gCj4gICAgIFVuZGVyIFdTR0ksIGl0IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUg
c2VydmVyIG9yIHByb3h5IHRvIAo+IGF2b2lkCj4gICAgIGFtYmlndW91cyBtYXBwaW5ncy4gKERq
YW5nb+KAmXMgcnVuc2VydmVyIHdhcyBwYXRjaGVkIGluIENWRSAKPiAyMDE1LTAyMTkuKQo+ICAg
ICBCdXQgdW5kZXIgQVNHSSwgdGhlcmUgaXMgbm90IHRoZSBzYW1lIHVuaWZvcm0gZXhwZWN0YXRp
b24sIGV2ZW4gaWYgCj4gbWFueQo+ICAgICBwcm94aWVzIHByb3RlY3QgYWdhaW5zdCB0aGlzIHVu
ZGVyIGRlZmF1bHQgY29uZmlndXJhdGlvbiAoaW5jbHVkaW5nCj4gICAgIG5naW54IHZpYSB1bmRl
cnNjb3Jlc19pbl9oZWFkZXJzIG9mZjspLgo+IAo+ICAgICBIZWFkZXJzIGNvbnRhaW5pbmcgdW5k
ZXJzY29yZXMgYXJlIG5vdyBpZ25vcmVkIGJ5IEFTR0lSZXF1ZXN0LCAKPiBtYXRjaGluZwo+ICAg
ICB0aGUgYmVoYXZpb3Igb2YgRGFwaG5lLCB0aGUgcmVmZXJlbmNlIHNlcnZlciBmb3IgQVNHSS4K
PiAKPiAgICAgVGhpcyBpc3N1ZSBoYXMgc2V2ZXJpdHkg4oCcbG934oCdIGFjY29yZGluZyB0byB0
aGUgRGphbmdvIHNlY3VyaXR5IAo+IHBvbGljeS4KPiAKPiAqIENWRS0yMDI2LTQyNzc6IFByaXZp
bGVnZSBhYnVzZSBpbiBHZW5lcmljSW5saW5lTW9kZWxBZG1pbsK2Cj4gCj4gICAgIEFkZCBwZXJt
aXNzaW9ucyBvbiBpbmxpbmUgbW9kZWwgaW5zdGFuY2VzIHdlcmUgbm90IHZhbGlkYXRlZCBvbgo+
ICAgICBzdWJtaXNzaW9uIG9mIGZvcmdlZCBQT1NUIGRhdGEgaW4gR2VuZXJpY0lubGluZU1vZGVs
QWRtaW4uCj4gCj4gICAgIFRoaXMgaXNzdWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRp
bmcgdG8gdGhlIERqYW5nbyBzZWN1cml0eSAKPiBwb2xpY3kuCj4gCj4gKiBDVkUtMjAyNi00Mjky
OiBQcml2aWxlZ2UgYWJ1c2UgaW4gTW9kZWxBZG1pbi5saXN0X2VkaXRhYmxlwrYKPiAKPiAgICAg
QWRtaW4gY2hhbmdlbGlzdCBmb3JtcyB1c2luZyBsaXN0X2VkaXRhYmxlIGluY29ycmVjdGx5IGFs
bG93ZWQgbmV3Cj4gICAgIGluc3RhbmNlcyB0byBiZSBjcmVhdGVkIHZpYSBmb3JnZWQgUE9TVCBk
YXRhLgo+IAo+ICAgICBUaGlzIGlzc3VlIGhhcyBzZXZlcml0eSDigJxsb3figJ0gYWNjb3JkaW5n
IHRvIHRoZSBEamFuZ28gc2VjdXJpdHkgCj4gcG9saWN5Lgo+IAo+ICogQ1ZFLTIwMjYtMzMwMzM6
IFBvdGVudGlhbCBkZW5pYWwtb2Ytc2VydmljZSB2dWxuZXJhYmlsaXR5IGluCj4gICAgIE11bHRp
UGFydFBhcnNlciB2aWEgYmFzZTY0LWVuY29kZWQgZmlsZSB1cGxvYWTCtgo+IAo+ICAgICBXaGVu
IHVzaW5nIGRqYW5nby5odHRwLm11bHRpcGFydHBhcnNlci5NdWx0aVBhcnRQYXJzZXIsIG11bHRp
cGFydAo+ICAgICB1cGxvYWRzIHdpdGggQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogYmFzZTY0
IHRoYXQgaW5jbHVkZSAKPiBleGNlc3NpdmUKPiAgICAgd2hpdGVzcGFjZSBtYXkgdHJpZ2dlciBy
ZXBlYXRlZCBtZW1vcnkgY29weWluZywgcG90ZW50aWFsbHkgCj4gZGVncmFkaW5nCj4gICAgIHBl
cmZvcm1hbmNlLgo+IAo+ICAgICBUaGlzIGlzc3VlIGhhcyBzZXZlcml0eSDigJxtb2RlcmF0ZeKA
nSBhY2NvcmRpbmcgdG8gdGhlIERqYW5nbyBzZWN1cml0eSAKPiBwb2xpY3kuCj4gCj4gKiBDVkUt
MjAyNi0zMzAzNDogUG90ZW50aWFsIGRlbmlhbC1vZi1zZXJ2aWNlIHZ1bG5lcmFiaWxpdHkgaW4K
PiAgICAgQVNHSSByZXF1ZXN0cyB2aWEgbWVtb3J5IHVwbG9hZCBsaW1pdCBieXBhc3PCtgo+IAo+
ICAgICBBU0dJIHJlcXVlc3RzIHdpdGggYSBtaXNzaW5nIG9yIHVuZGVyc3RhdGVkIENvbnRlbnQt
TGVuZ3RoIGhlYWRlciAKPiBjb3VsZAo+ICAgICBieXBhc3MgdGhlIERBVEFfVVBMT0FEX01BWF9N
RU1PUllfU0laRSBsaW1pdCB3aGVuIHJlYWRpbmcKPiAgICAgSHR0cFJlcXVlc3QuYm9keSwgcG90
ZW50aWFsbHkgbG9hZGluZyBhbiB1bmJvdW5kZWQgcmVxdWVzdCBib2R5IAo+IGludG8KPiAgICAg
bWVtb3J5IGFuZCBjYXVzaW5nIHNlcnZpY2UgZGVncmFkYXRpb24uCj4gCj4gICAgIFRoaXMgaXNz
dWUgaGFzIHNldmVyaXR5IOKAnGxvd+KAnSBhY2NvcmRpbmcgdG8gdGhlIERqYW5nbyBzZWN1cml0
eSAKPiBwb2xpY3kuCj4gCj4gQnVnZml4ZXM6Cj4gKiBGaXhlZCBhIHJlZ3Jlc3Npb24gaW4gRGph
bmdvIDYuMCB3aGVyZSBhbG9naW4oKSBhbmQgYWxvZ291dCgpIGRpZCBub3QKPiAgIHJlc3BlY3Rp
dmVseSBzZXQgb3IgY2xlYXIgcmVxdWVzdC51c2VyIGlmIGl0IGhhZCBhbHJlYWR5IGJlZW4KPiAg
IG1hdGVyaWFsaXplZCAoZS5nLiwgYnkgc3luYyBtaWRkbGV3YXJlKSAoIzM3MDE3KS4KPiAqIEZp
eGVkIGEgcmVncmVzc2lvbiBpbiBEamFuZ28gNi4wIGluIGFkbWluIGZvcm1zIHdoZXJlCj4gICBS
ZWxhdGVkRmllbGRXaWRnZXRXcmFwcGVyIGluY29ycmVjdGx5IHdyYXBwZWQgYWxsIHdpZGdldHMg
aW4gYQo+ICAgPGZpZWxkc2V0PiAoIzM2OTQ5KS4KPiAqIEZpeGVkIGEgYnVnIGluIERqYW5nbyA2
LjAgd2hlcmUgdGhlIGZpZWxkcy5FMzQ4IHN5c3RlbSBjaGVjayBkaWQgbm90Cj4gICBkZXRlY3Qg
bmFtZSBjbGFzaGVzIGJldHdlZW4gbW9kZWwgbWFuYWdlcnMgYW5kIHJlbGF0ZWRfbmFtZXMgZm9y
Cj4gICBub24tc2VsZi1yZWZlcmVudGlhbCByZWxhdGlvbnNoaXBzICgjMzY5NzMpLgo+IAo+IFJl
bGVhc2UgTm90ZXM6Cj4gaHR0cHM6Ly9kb2NzLmRqYW5nb3Byb2plY3QuY29tL2VuLzYuMC9yZWxl
YXNlcy82LjAuNC8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9v
dEBidWJ1MS5ldT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
