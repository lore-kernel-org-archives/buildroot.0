Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A188C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 06:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E336D400FE;
	Fri, 12 Jul 2024 06:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z75gyh7MXBTH; Fri, 12 Jul 2024 06:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A44EA4045F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A44EA4045F;
	Fri, 12 Jul 2024 06:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82E311BF591
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 06:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F551417C2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 06:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4d33p-sRfhuO for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 06:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5C6540604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C6540604
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5C6540604
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:47:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB50D1BF203;
 Fri, 12 Jul 2024 06:47:43 +0000 (UTC)
Date: Fri, 12 Jul 2024 08:47:43 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20240712084743.0da3c657@windsurf>
In-Reply-To: <20240712053614.733789-1-br015@umbiko.net>
References: <20240712053614.733789-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720766864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88JZVzbLq1WIvbliv59Z7Qj8QE9JECCHQm8sp3ren/U=;
 b=fSNbi9BOr/4Ye18N39aaA95eKrejG4zNSNnFZDO4YXcsLjkocGMh/AAFaPQ7QZtWbP2l/O
 cxcVhyU/aMVDrdx1lkonZPyN5JhyIJCkQmJflcYbTLifqwv4JrtOWDHHYDYYBz8pcaWesv
 eESKS0W53cNVSOlG1FXjNql3GHerNIx9Af4PLx3+UZQTvKpwFgAW7iB90XgiAxfsdePZBs
 JJGSa9So0QZQyTAB8rIVG46a9oAyrlgy/uJhODdkFh64rLRuepes+R7Li7OdV3Kjr8ZHs+
 IPu2LQAAb6zjdMIh4hIhjvkFpWPgEUdxBlyq7UyTvEKBNjjdnwZmvPzmp/1fuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fSNbi9BO
Subject: Re: [Buildroot] [PATCH] package/mpd: fix build with fmt 11
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

SGVsbG8gQW5kcmVhcywKCk9uIEZyaSwgMTIgSnVsIDIwMjQgMDc6MzU6NTkgKzAyMDAKQW5kcmVh
cyBaaWVnbGVyIDxicjAxNUB1bWJpa28ubmV0PiB3cm90ZToKCj4gU2luY2UgY29tbWl0IDZiODZm
MDcgKHBhY2thZ2UvZm10OiBidW1wIHRvIHZlcnNpb24gMTEuMC4xKSwgbXBkIGZhaWxzIHRvIGJ1
aWxkOgo+IAo+IC9ob21lL2RhdGEvYnVpbGRyb290Lng4Nl82NC9ob3N0L3g4Nl82NC1idWlsZHJv
b3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2luY2x1ZGUvZm10L2Jhc2UuaDoxMzkyOjI5OiBl
cnJvcjogcGFzc2luZyDigJhjb25zdCBmbXQ6OnYxMTo6Zm9ybWF0dGVyPHN0ZDo6X19leGNlcHRp
b25fcHRyOjpleGNlcHRpb25fcHRyPuKAmSBhcyDigJh0aGlz4oCZIGFyZ3VtZW50IGRpc2NhcmRz
IHF1YWxpZmllcnMgWy1mcGVybWlzc2l2ZV0KPiAgMTM5MiB8ICAgICBjdHguYWR2YW5jZV90byhj
Zi5mb3JtYXQoKnN0YXRpY19jYXN0PHF1YWxpZmllZF90eXBlKj4oYXJnKSwgY3R4KSk7Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vc3JjL0xvZy5jeHg6
NToKPiAuLi9zcmMvbGliL2ZtdC9FeGNlcHRpb25Gb3JtYXR0ZXIuaHh4OjE1OjE0OiBub3RlOiAg
IGluIGNhbGwgdG8g4oCYYXV0byBmbXQ6OnYxMTo6Zm9ybWF0dGVyPHN0ZDo6X19leGNlcHRpb25f
cHRyOjpleGNlcHRpb25fcHRyPjo6Zm9ybWF0KHN0ZDo6X19leGNlcHRpb25fcHRyOjpleGNlcHRp
b25fcHRyLCBGb3JtYXRDb250ZXh0JikgW3dpdGggRm9ybWF0Q29udGV4dCA9IGZtdDo6djExOjpj
b250ZXh0XeKAmQo+ICAgIDE1IHwgICAgICAgICBhdXRvIGZvcm1hdChzdGQ6OmV4Y2VwdGlvbl9w
dHIgZSwgRm9ybWF0Q29udGV4dCAmY3R4KSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+
Cj4gCj4gQWRhcHQgYW4gdXBzdHJlYW0gY2hhbmdlIHRvIHJlc3RvcmUgbXBkIGNvbXBhdGliaWxp
dHkgd2l0aCBmbXQgMTEuICAKPiAKPiBGaXhlczogCj4gCWh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzczNTE0ZWE3NmE1OTYwZjU5YjRjNTBlMjA3NDU3MWIxMGU0NjgyZDQK
PiAJaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYTU4ZGRiZGZlMzViZDE5
MDIxZTY1ZGIwYjhiOGNjNGMxYzg4NGQ1MQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgWmll
Z2xlciA8YnIwMTVAdW1iaWtvLm5ldD4KPiAtLS0KPiAgLi4uZm10LXN1cHBvcnQtYnVpbGQtd2l0
aC1saWJmbXQtMTEuMC4wLnBhdGNoIHwgOTIgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9t
cGQvMDAwMi1saWItZm10LXN1cHBvcnQtYnVpbGQtd2l0aC1saWJmbXQtMTEuMC4wLnBhdGNoCgpU
aGFua3MgZm9yIHRoZSBmaXghIFlvdXIgcGF0Y2ggaGFkIHR3byBzbWFsbCBpc3N1ZXMgZGV0ZWN0
ZWQgYnkgIm1ha2UKY2hlY2stcGFja2FnZSI6CgpXQVJOSU5HOiBwYWNrYWdlL21wZC8wMDAyLWxp
Yi1mbXQtc3VwcG9ydC1idWlsZC13aXRoLWxpYmZtdC0xMS4wLjAucGF0Y2g6NDogZ2VuZXJhdGUg
eW91ciBwYXRjaGVzIHdpdGggJ2dpdCBmb3JtYXQtcGF0Y2ggLU4nCldBUk5JTkc6IHBhY2thZ2Uv
bXBkLzAwMDItbGliLWZtdC1zdXBwb3J0LWJ1aWxkLXdpdGgtbGliZm10LTExLjAuMC5wYXRjaDow
OiBtaXNzaW5nIFVwc3RyZWFtIGluIHRoZSBoZWFkZXIgKGh0dHBzOi8vbmlnaHRseS5idWlsZHJv
b3Qub3JnLyNfYWRkaXRpb25hbF9wYXRjaF9kb2N1bWVudGF0aW9uKQoKSSBmaXhlZCB0aG9zZSB0
d28gaXNzdWVzIGFuZCBhcHBsaWVkLiBUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
