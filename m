Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0EDC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB11417CF;
	Fri,  2 May 2025 10:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1SDVuRbRNDZ; Fri,  2 May 2025 10:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D651941740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D651941740;
	Fri,  2 May 2025 10:31:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D45F3EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8E240BFE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edY9C-bzRakz for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:31:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7FCE40B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FCE40B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7FCE40B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:31:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 966081C1113; Fri,  2 May 2025 12:31:20 +0200 (CEST)
Message-ID: <37678225-e8c3-4aa0-a6f3-4b9378295421@rnout.be>
Date: Fri, 2 May 2025 12:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=epMo5W0t4s5j57s4cVDzM53x2/ZR5oSs0dZTNN5No5c=;
 b=GF1AgMhpQygGwT0neDa0hZqCZgRHGccwxYKuUYWoRvNfcrFYp1YHn4j64uNGKFvdcopmJ5
 FmLPRBeYFSfrKkE6DFmKnsLQwki21rTjsGzddbzuplylSFDT+uXhJnOaoY2RUVAJC10B1f
 jfbdmwSVpKC0ZIsjygYEYOtXinG+jo9fbNLbSbFOdFrgiehAqhC8nhTOgyHNl2tPUzoc02
 19DLfTa9nDYGELirezp6YjIMNp/dX3bQ8zFyZdsjwvJSeXagY1nWSj5M6CzCoQCaQu60Lw
 hmqgTsR+STCdtJXpHq7OCLoVljeK/TaX+NIz2tREnNjxCi5Xbmo+k5p6zCFdcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GF1AgMhp
Subject: Re: [Buildroot] [PATCH 1/6] board/raspberrypi/readme.txt: add note
 for bootcode.bin
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

CgpPbiAxNS8wNC8yMDI1IDE3OjMxLCBHYcOrbCBQT1JUQVkgd3JvdGU6Cj4gVGhlIHNlY29uZC1z
dGFnZSBib290bG9hZGVyIGlzIGNvbnRhaW5lZCBpbiB0aGUgb25ib2FyZCBFRVBST01bMV0gc2lu
Y2UKPiB0aGUgUmFzcGJlcnJ5IFBpIDQgKGkuZS4gZm9yIHBpNCwgcGk0MDAsIGNtNCwgY200cyBh
bmQgcGk1KS4KPiAKPiBUaGVyZWZvcmUsIHRoZSBmaWxlIGJvb3Rjb2RlLmJpblsyXSBpcyBuZWVk
ZWQgZm9yIHRoZSBmb3JtZXIgUmFzcGJlcnJ5Cj4gUGkgb25seSAoaS5lLiBwaTEsIHBpMiwgcGkz
LCBwaTAsIHBpMHcgYW5kIHBpemVybzJ3KS4KPiAKPiBUaGlzIGFkZHMgYSBub3RlIHByZWNpc2lu
ZyB0aGUgZmlsZSBib290Y29kZS5iaW4gaXMgcHJlc2VudCBmb3IgdGhlCj4gZm9ybWVyIHZlcnNp
b25zIG9mIHRoZSBSYXNwYmVycnkgUGkuCj4gCj4gWzFdOiBodHRwczovL3d3dy5yYXNwYmVycnlw
aS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvcmFzcGJlcnJ5LXBpLmh0bWwjcmFzcGJlcnJ5
LXBpLWJvb3QtZWVwcm9tCj4gWzJdOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9jdW1l
bnRhdGlvbi9jb21wdXRlcnMvY29uZmlndXJhdGlvbi5odG1sI2Jvb3Rjb2RlLWJpbgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgoK
ICBBcHBsaWVkIGFsbCA2IHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91
dAoKPiAtLS0KPiAgIGJvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgfCAxMCArKysrKysrLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IGIvYm9hcmQvcmFzcGJl
cnJ5cGkvcmVhZG1lLnR4dAo+IGluZGV4IDY0ZjBlMmEyNmYuLjVmNmIxYzNlN2QgMTAwNjQ0Cj4g
LS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAo+ICsrKyBiL2JvYXJkL3Jhc3BiZXJy
eXBpL3JlYWRtZS50eHQKPiBAQCAtMTEyLDE0ICsxMTIsMTQgQEAgQWZ0ZXIgYnVpbGRpbmcsIHlv
dSBzaG91bGQgb2J0YWluIHRoaXMgdHJlZToKPiAgICAgICArLS0gYm9vdC52ZmF0Cj4gICAgICAg
Ky0tIHJvb3Rmcy5leHQ0Cj4gICAgICAgKy0tIHJwaS1maXJtd2FyZS8KPiAtICAgIHwgICArLS0g
Ym9vdGNvZGUuYmluCj4gKyAgICB8ICAgKy0tIGJvb3Rjb2RlLmJpbiAgICAgICAgICAgIFsyXQo+
ICAgICAgIHwgICArLS0gY21kbGluZS50eHQKPiAgICAgICB8ICAgKy0tIGNvbmZpZy50eHQKPiAg
ICAgICB8ICAgKy0tIGZpeHVwLmRhdCAgICAgICAgICAgICAgIFsxXQo+ICAgICAgIHwgICArLS0g
Zml4dXA0LmRhdCAgICAgICAgICAgICAgWzFdCj4gICAgICAgfCAgICstLSBzdGFydC5lbGYgICAg
ICAgICAgICAgICBbMV0KPiAgICAgICB8ICAgKy0tIHN0YXJ0NC5lbGYgICAgICAgICAgICAgIFsx
XQo+IC0gICAgfCAgIGAtLSBvdmVybGF5cy8gICAgICAgICAgICAgICBbMl0KPiArICAgIHwgICBg
LS0gb3ZlcmxheXMvICAgICAgICAgICAgICAgWzNdCj4gICAgICAgKy0tIHNkY2FyZC5pbWcKPiAg
ICAgICArLS0gSW1hZ2UgICAgICAgICAgICAgICAgICAgICAgIFsxXQo+ICAgICAgIGAtLSB6SW1h
Z2UgICAgICAgICAgICAgICAgICAgICAgWzFdCj4gQEAgLTEyNyw3ICsxMjcsMTEgQEAgQWZ0ZXIg
YnVpbGRpbmcsIHlvdSBzaG91bGQgb2J0YWluIHRoaXMgdHJlZToKPiAgIFsxXSBOb3QgYWxsIG9m
IHRoZW0gd2lsbCBiZSBwcmVzZW50LCBkZXBlbmRpbmcgb24gdGhlIFJhc3BiZXJyeVBpCj4gICAg
ICAgbW9kZWwgeW91IGFyZSB1c2luZy4KPiAgIAo+IC1bMl0gT25seSBmb3IgdGhlIFJhc3BiZXJy
eSBQaSAzLzQgTW9kZWxzIChvdmVybGF5IG1pbml1YXJ0LWJ0IGlzIG5lZWRlZAo+ICtbMl0gT25s
eSBmb3IgdGhlIFJhc3BiZXJyeSBQaSAxLCAyLCAzLCBaZXJvLCBaZXJvIFcgYW5kIFplcm8gMiBX
LiBUaGUgUmFzcGJlcnJ5Cj4gKyAgICBQaSA0LCA0MDAsIDUgYW5kIHRoZSBDb21wdXRlIE1vZHVs
ZSA0LCA0cyBhbmQgNSBsb2FkIHRoZSBzZWNvbmQgc3RhZ2UKPiArICAgIGJvb3Rsb2FkZXIgZnJv
bSBhIFNQSSBmbGFzaCBFRVBST00uCj4gKwo+ICtbM10gT25seSBmb3IgdGhlIFJhc3BiZXJyeSBQ
aSAzLzQgTW9kZWxzIChvdmVybGF5IG1pbml1YXJ0LWJ0IGlzIG5lZWRlZAo+ICAgICAgIHRvIGVu
YWJsZSB0aGUgUlBpMyBzZXJpYWwgY29uc29sZSBvdGhlcndpc2Ugb2NjdXBpZWQgYnkgdGhlIGJs
dWV0b290aAo+ICAgICAgIGNoaXApLiBBbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBkaXNhYmxlIHRo
ZSBzZXJpYWwgY29uc29sZSBpbiBjbWRsaW5lLnR4dAo+ICAgICAgIGFuZCAvZXRjL2luaXR0YWIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
