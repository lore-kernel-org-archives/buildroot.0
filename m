Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651C4D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A85B40F12;
	Wed,  7 Jan 2026 17:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTjL1j-GIDJr; Wed,  7 Jan 2026 17:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E3040EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808290;
	bh=N3Wjv+6a/7oTcxDNRlcgZ1wL8gDNE6CZ52n0NrUJg4k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZKMuvv7KcROD+i7ktvpL/NE2fJcvFsuyJN+6QJbzowl3/56WOouU1zohpVUMtz/GU
	 rjGU6E9CYH9mBVytOFo1VwEIN42qmJeIzplsOlj11hzBQXi0r8l3nV6TCTDsFc5nxL
	 Iiy4rapRrekVMF003Xmt9WeP2VaAT3cKzQ07VW8AwJ/2DZuTVBC6YJqxxiMBmww6n0
	 CHO/3cZbp6pzOmUbc0txhuxrWwiwIksF+1QMKfh5szOhNym/L0rIiqKSgLjs9smbv0
	 pxxnhvFIFSVbcPlpxcpW6hzVfhLiUXNmznjuWLfIovxHnggKztEjuOtZdqvCc91lpX
	 M/k5AhuYPWTGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9E3040EFD;
	Wed,  7 Jan 2026 17:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A664925B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D89A40F00
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDwGv5mDGbCq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CD0A40EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD0A40EFA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CD0A40EFA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C1C5B97A704; Wed,  7 Jan 2026 18:51:25 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:21 +0100
Message-ID: <20260107175123.227808-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-7-thomas.perale@mind.be>
References: <20251228185637.58072-7-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2C9fiOEov9yN7Db7cjPRKsiVllo+NcxktdOJgHvPCNY=;
 b=M4NVTdwmafBpCuRxxTCetCBVcRj8Nj/tHD8Eyf/PGblfMYFCLq5mEUjwsZhVwD9hokMSHE
 JF2jmqq42fqqdni4oa6DZDJZ9mZnx10b9qtjD9EyBONyofZoZXz0jotckFUkv2QxbYb4MB
 XF+avNpm77kqSEf1fm+7lt3mSpbID6o2As9HX+u1hz0BzeHh9ewqSv3zHARGQpm5MFpHnf
 lfXClM6VhanGP/m7Zi3X/3iv8sFt4Zr+dVwBnZYwJOvGnGB8BfxAhMA2ytRg+GXpMBZm1Y
 nVS9X83nWZQJHyetyJlLIHeIcLv3tkzGNzT4zqU21J0HUfnDOkZjSUWuPvqepA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=M4NVTdwm
Subject: Re: [Buildroot] [PATCH 07/10] package/jbig2dec: add CVE trailer in
 patch
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gU2luY2UgQnVpbGRyb290IGNvbW1pdCBbMV0gdGhlIHBhdGNoZXMgdGhh
dCBmaXhlcyBhIHNlY3VyaXR5Cj4gdnVsbmVyYWJpbGl0eSBuZWVkcyB0byByZWZlcmVuY2UgdGhl
IGZpeGVkIHZ1bG5lcmFiaWxpdHkuCj4gCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSByZWxldmFudCBp
bmZvcm1hdGlvbiB0byB0aGUgcGF0Y2ggaGVhZGVyLgo+IAo+IFsxXSAxMTY3ZDBmZjNkIGRvY3Mv
bWFudWFsOiBtZW50aW9uIENWRSB0cmFpbGVyCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
cmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLnggYW5kIDIw
MjUuMTEueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi4wMS1CdWctNzA1MDQxLWpiaWcyZGVjLUF2b2lk
LXVuaW5pdGlhbGl6ZWQtYWxsb2NhdG9yLWluLnBhdGNoIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2piaWcyZGVjLzAwMDEt
QnVnLTcwNTA0MS1qYmlnMmRlYy1Bdm9pZC11bmluaXRpYWxpemVkLWFsbG9jYXRvci1pbi5wYXRj
aCBiL3BhY2thZ2UvamJpZzJkZWMvMDAwMS1CdWctNzA1MDQxLWpiaWcyZGVjLUF2b2lkLXVuaW5p
dGlhbGl6ZWQtYWxsb2NhdG9yLWluLnBhdGNoCj4gaW5kZXggODMzMWQ1ZjJhNC4uZGQ5NmM0NWVi
ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2piaWcyZGVjLzAwMDEtQnVnLTcwNTA0MS1qYmlnMmRl
Yy1Bdm9pZC11bmluaXRpYWxpemVkLWFsbG9jYXRvci1pbi5wYXRjaAo+ICsrKyBiL3BhY2thZ2Uv
amJpZzJkZWMvMDAwMS1CdWctNzA1MDQxLWpiaWcyZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxs
b2NhdG9yLWluLnBhdGNoCj4gQEAgLTQsNiArNCw3IEBAIERhdGU6IFN1biwgNSBOb3YgMjAyMyAx
MjoyMTo1MiArMDEwMAo+ICBTdWJqZWN0OiBbUEFUQ0hdIEJ1ZyA3MDUwNDE6IGpiaWcyZGVjOiBB
dm9pZCB1bmluaXRpYWxpemVkIGFsbG9jYXRvciBpbgo+ICAgY29tbWFuZC1saW5lIHRvb2wuCj4g
IAo+ICtDVkU6IENWRS0yMDIzLTQ2MzYxCj4gIFVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
QXJ0aWZleFNvZnR3YXJlL2piaWcyZGVjL2NvbW1pdC9lZTUzYTdlNGJjNzgxOWQzMmU4YzBiMjA1
Nzg4NWJjYzk3NTg2YmYzCj4gIFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KPiAgLS0tCj4gLS0gCj4gMi41Mi4wCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
