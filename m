Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47D7C5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A876103F;
	Tue,  3 Jun 2025 06:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDBkbJcnCw_a; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36DC60FF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36DC60FF7;
	Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CFE7DA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E692341143
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLnSyOYQgeZ3 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24B6441132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24B6441132
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24B6441132
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 07B421C1413; Tue,  3 Jun 2025 08:22:01 +0200 (CEST)
Message-ID: <8019f871-1502-4762-bb8d-cf4c463dcbea@rnout.be>
Date: Sat, 31 May 2025 19:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20250426210411.1120310-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250426210411.1120310-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931722; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ypPj994f6VjOZf0f5m802pnHxEqqEs6nqxZtR3d6HNg=;
 b=cNMtpCZoHYxJza3iGkUcGCaQQOyQOYuyU9HyPGCFmQrxYJnuIZgg+LfAVfLoD25tt3tGyh
 IUcU/kni+ehrjiyi6o4AhnbhEyYUX+pEja5iM8h5OJlrgmNYlx/U7GAJUnUUNWQQWvxOgD
 S1fV4kjCvYEZxMV9fUARTlPskDekUTF3FO98AopHja8NqQidb23K+FQen/GmWXwr8EIAS8
 C1y4NVsb0DDpkCFGbECLANnqc2H0KrT9FEpp5RzbQNwwYquaUyQ8Tew+wvCjVEmYBdDTtd
 cDqZKgK6SJ4DPe+tRD0Wrl0vnW7lGQ7jPI4RJa2kh3p7buQLbY6zav3ZFrf6pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cNMtpCZo
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/cve.py: remove unused
 each_product()
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNi8wNC8yMDI1IDIzOjA0LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IFRoZSBsYXN0IHVzYWdlIG9mIGVhY2hfcHJvZHVjdCgpIHdhcyByZW1vdmVkIGluIGNv
bW1pdAo+IDUyYWUwOTIwNDY2OTZmMDk5Mzk3ZDNiMGE4MjA2MjYyZTgyMDNmNDAgKCJzdXBwb3J0
L3NjcmlwdHMvY3ZlLnB5OiB1c2UKPiB0aGUgSlNPTiBkYXRhIGluIDEuMSBzY2hlbWEiKS4KPiAK
PiBTaW5jZSBpdCdzIG5vdyB1bnVzZWQsIHJlbW92ZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
YXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8g
MjAyNS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgc3VwcG9y
dC9zY3JpcHRzL2N2ZS5weSB8IDYgLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weSBiL3N1cHBvcnQv
c2NyaXB0cy9jdmUucHkKPiBpbmRleCA1YWY2ZTBjNDNmLi4xOGZkYThlMWExIDEwMDc1NQo+IC0t
LSBhL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5
Cj4gQEAgLTExMSwxMiArMTExLDYgQEAgY2xhc3MgQ1ZFOgo+ICAgICAgICAgICAgICAgICAgICAg
ICB3aXRoIG9wZW4ob3MucGF0aC5qb2luKGRpcnBhdGgsIGZpbGVuYW1lKSwgInJiIikgYXMgZjoK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHlpZWxkIGNscyhqc29uLmxvYWQoZikpCj4gICAK
PiAtICAgIGRlZiBlYWNoX3Byb2R1Y3Qoc2VsZik6Cj4gLSAgICAgICAgIiIiSXRlcmF0ZSBvdmVy
IGVhY2ggcHJvZHVjdCBzZWN0aW9uIG9mIHRoaXMgY3ZlIiIiCj4gLSAgICAgICAgZm9yIHZlbmRv
ciBpbiBzZWxmLm52ZF9jdmVbJ2N2ZSddWydhZmZlY3RzJ11bJ3ZlbmRvciddWyd2ZW5kb3JfZGF0
YSddOgo+IC0gICAgICAgICAgICBmb3IgcHJvZHVjdCBpbiB2ZW5kb3JbJ3Byb2R1Y3QnXVsncHJv
ZHVjdF9kYXRhJ106Cj4gLSAgICAgICAgICAgICAgICB5aWVsZCBwcm9kdWN0Cj4gLQo+ICAgICAg
IGRlZiBwYXJzZV9ub2RlKHNlbGYsIG5vZGUpOgo+ICAgICAgICAgICAiIiIKPiAgICAgICAgICAg
UGFyc2UgdGhlIG5vZGUgaW5zaWRlIHRoZSBjb25maWd1cmF0aW9ucyBzZWN0aW9uIHRvIGV4dHJh
Y3QgdGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
