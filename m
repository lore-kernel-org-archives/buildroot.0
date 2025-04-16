Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E156C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F10560A55;
	Wed, 16 Apr 2025 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjfRjKhGhgDR; Wed, 16 Apr 2025 21:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC20060E82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC20060E82;
	Wed, 16 Apr 2025 21:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD63511B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE78360BE4
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ghwrE7YYzze for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F7E56059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F7E56059F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F7E56059F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:20:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAAC71C00DD; Wed, 16 Apr 2025 23:20:30 +0200 (CEST)
Message-ID: <97f26ff9-0e34-46fe-a4dc-953f1afb0705@rnout.be>
Date: Wed, 16 Apr 2025 23:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250328192656.2035235-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20250328192656.2035235-1-yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5RVg8+7VAXBm8DBBL4LF31zPDdlfCaH7kP7KApEmEHk=;
 b=ohUUmWqDuIh0rVQ+brEWAesRIFbrvVy6PF4adRzGTNPa56ys4uftKwj7qbFEkzhG/KW/ky
 SbxFB5NKar3f4FyDP9/8lMo2CaVeBghUSyeW8oIYcrg+Ek6SGLnRtz7+5Mmws/2XX+eS8X
 4qVLZk10n+h5+FnTG3zL9cyAXC4bS3cCvblzTp36k2YILsh7F0zqvQWHzRHKjRIZTElIZv
 NKKShDudEWp/kCGoO9T3iEfmWlojOX8YhMIrjG2TEpSJVlI2j9c/sRaKff9nbIywQ07mD1
 DlqAv12cfBRqlxH4VOl5jZgt3YEqf9uczi7pRf3fzumne0Tx1BPwfeKvS4J+Zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libcap: do not attempt to run
 ldconfig
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

Ck9uIDI4LzAzLzIwMjUgMjA6MjYsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gVGhlIGxpYmNhcCBN
YWtlZmlsZSBpcyBoYW5kLWNvZGVkIChpLmUuIG5vdCBhdXRvdG9vbHMpLCBhbmQgaGFyZC1jb2Rl
cwo+IGNhbGxzIHRvIC9zYmluL2xkY29uZmlnLCB1bmxlc3MgaXQgaXMgaW5zdGFsbGVkIG91dC1v
Zi10cmVlLiBGb3IgdGFyZ2V0Cj4gcGFja2FnZXMsIHRoaXMgaXMgZG9uZSwgYnV0IGZvciBob3N0
IHBhY2thZ2UgdGhpcyBpcyBub3QgZG9uZSwgYXMgd2UKPiBkbyBzZXQgUFJFRklYIGluc3RlYWQs
IHdoaWNoIGNhdXNlcyBsaWJjcGEncyBNYWtlZmlsZSB0byBjYWxsIGxkY29uZmlnCj4gYW5kIGVt
aXRzIGEgc3B1cmlvdXMgd2FybmluZyAodHdpY2UpOgo+Cj4gICAgICBpbnN0YWxsIC1tIDA3NTUg
bGliY2FwLnNvLjIuNzMgL2hvbWUveW1vcmluL2Rldi9idWlsZHJvb3QvTy9tYXN0ZXIvcGVyLXBh
Y2thZ2UvaG9zdC1saWJjYXAvaG9zdC9saWIvbGliY2FwLnNvLjIuNzMKPiAgICAgIGxuIC1zZiBs
aWJjYXAuc28uMi43MyAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9wZXItcGFj
a2FnZS9ob3N0LWxpYmNhcC9ob3N0L2xpYi9saWJjYXAuc28uMgo+ICAgICAgbG4gLXNmIGxpYmNh
cC5zby4yIC9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vbWFzdGVyL3Blci1wYWNrYWdlL2hv
c3QtbGliY2FwL2hvc3QvbGliL2xpYmNhcC5zbwo+ICAgICAgL3NiaW4vbGRjb25maWcKPiAgICAg
IC9zYmluL2xkY29uZmlnOiBDYW4ndCBjcmVhdGUgdGVtcG9yYXJ5IGNhY2hlIGZpbGUgL2V0Yy9s
ZC5zby5jYWNoZX46IFBlcm1pc3Npb24gZGVuaWVkCj4gICAgICBtYWtlWzRdOiBbTWFrZWZpbGU6
MjAwOiBpbnN0YWxsLXNoYXJlZC1jYXBdIEVycm9yIDEgKGlnbm9yZWQpCj4KPiBUaGlzIGlzIGp1
c3QgYSB3YXJuaW5nLCBidXQgaXQgaXMgaW5jb3JyZWN0IHN0aWxsLgo+Cj4gRmFrZSBhbiBvdXQt
b2YtdHJlZSBpbnN0YWxsIHdpdGggYSBub24tZW1weSBERVNURElSIHRoYXQgaXMganVzdCAnLycs
Cj4gYW5kIHRodXMgZG9lcyBpbiBmYWN0IG5vdCBpbnN0YWxsIG91dC1vZi10cmVlLiBUaGlzIGlz
IGVub3VnaCB0bwo+IGFjdHVhbGx5IHNpbGVuY2UgdGhlIHdhcm5pbmcuIEFkZCBhIGxpdHRsZSBj
b21tZW50IHRvIGV4cGxhaW4gdGhhdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMu
bmV0Pgo+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PgoKIMKgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91
dAoKPiAtLS0KPiAgIHBhY2thZ2UvbGliY2FwL2xpYmNhcC5tayB8IDUgKysrKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmNhcC9saWJjYXAubWsgYi9wYWNrYWdlL2xpYmNhcC9saWJjYXAubWsKPiBp
bmRleCA1YTZlZDViNDk0Li4yNWIzYTQ2YzQ0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliY2Fw
L2xpYmNhcC5tawo+ICsrKyBiL3BhY2thZ2UvbGliY2FwL2xpYmNhcC5tawo+IEBAIC02NCw4ICs2
NCwxMSBAQCBkZWZpbmUgSE9TVF9MSUJDQVBfQlVJTERfQ01EUwo+ICAgCQkkKEhPU1RfTElCQ0FQ
X01BS0VfRkxBR1MpCj4gICBlbmRlZgo+ICAgCj4gKyMgU2V0IERFU1RESVIgdG8gYSBub24tZW1w
dHkgcGF0aCwgc28gdGhhdCBsaWJjYXAncyBNYWtlZmlsZQo+ICsjIGRvZXMgbm90IHRyaWdnZXIg
Y2FsbHMgdG8gbGRjb25maWcKPiAgIGRlZmluZSBIT1NUX0xJQkNBUF9JTlNUQUxMX0NNRFMKPiAt
CSQoSE9TVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSAkKEhPU1RfTElCQ0FQX01BS0VfRkxB
R1MpIGluc3RhbGwKPiArCSQoSE9TVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSAkKEhPU1Rf
TElCQ0FQX01BS0VfRkxBR1MpIFwKPiArCQlERVNURElSPS8gaW5zdGFsbAo+ICAgZW5kZWYKPiAg
IAo+ICAgJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
