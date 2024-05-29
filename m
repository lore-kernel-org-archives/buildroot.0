Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0029DC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 18:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEB760B5A;
	Wed, 29 May 2024 18:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCdcd8km4gub; Wed, 29 May 2024 18:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA6260B39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA6260B39;
	Wed, 29 May 2024 18:23:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 186D91D393B
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D30409AC
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bhjb8sTfHZRv for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 18:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 654674098F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654674098F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 654674098F
 for <buildroot@buildroot.org>; Wed, 29 May 2024 18:23:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.80.169]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1rxQ0b1AxC-00XaOV; Wed, 29
 May 2024 20:23:15 +0200
Date: Wed, 29 May 2024 20:22:55 +0200
Message-Id: <20240529-ztext-v2-0-82985032f169@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH9yV2YC/zXMQQ7CIBCF4as0sxYDpFh15T1MF3Q6tLOwNUAI2
 nB3sdHl//LybRDIMwW4Nht4Shx4XWroQwM422UiwWNt0FK3slWdeEfKURiLONjhpFBaqN+nJ8d
 5d+597ZlDXP1rZ5P6rn/h8hOSEkrY82hQo0Nnutv0yMeFIvSllA+LYfK2mAAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717006985; l=827;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=sTTAtCk6I+G0R7tSRUWC5gaFxhI2pCAnJxy5fk3ZNYc=;
 b=mBZkkC0W23qfbCe3A1U7IaoKtg3wMQaYXt5ZSwlXhhBxNac+TwFPGThyRaLHnKrIZPqISRTP9
 gGEM5QWFmmCCD9OQCVhrAX/SadS+00Dnat+jeUwdLUeDwhV2LFmOYlw
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:6DUNnYNReqzIxYFOBZD5Ca9OPtzMRk7wIy5Lyc7UlcSyx5AEEZe
 GQpX8UHJSPe9zD2aR5wExHD+QOJj/EP/7GaeVfR28c0vlWEg/sqmEgVzdvNSQbJsoiD59bI
 EMXYUka30T47t10QHvE0av6UzGDkkVSt1PULUoroEwrgUpkEnSXF7dv6dYevP4mv3tHkOMr
 9hjFSN9UoyBIRrD7cFQAg==
UI-OutboundReport: notjunk:1;M01:P0:hN+bp5oLngc=;EBz+EeSKf99cEkur8cM5KSzFMi2
 31rchj10XwcJnhwgBUcF92K+nuAl5DcXx++svxohM0YSQWLcUUOznlNn6YtLhsFI5+aYIMrxX
 /Nzkxdh//5MvRVAoNt40rnM/8hUiW+tG8DJw5DZ5IVK4lfRvDyUAfdulAjqSKPMexv4nBCt0j
 IBY2EeIVh4b2qk/P+Btrx4ARmy0urcguUS22K9JduonxTH+eizsX2f3Mnzd6svmOfFKj9c2aG
 oWUfnd4bGcHGauXTz25Bx83BRvDWvfSh9+ddlRHzcn9SqEPPvUGyXPsBiJYhtrflLskvrG0yT
 +Y8oLQYVGLb8Dqrv3bmqI0qsKbCy+/dQMHH+OuCxHzEaH41j7CM4bXMcPkRqSrt15+FgIYYfe
 i/x+jZ1oRgMy/ipwsieRL/zJm5CqnxFzkRynmEVPk7DMZvr9HARDOKGWlWWjaTDO3wcjmFxXg
 AthDX12WcKvKrslnk/H75ENXKsKJGf3PuGeDHnn+IpSVM+KRD7q8F6PJ/61Xaov2RV3sNaror
 cZlF9yZs09b+xG/xc2y4i/kLA5o887pPrTVjDpYmZiRfOdrCM1/0sUCsh9id9uXcFmfMQme17
 ZXInTS1nmtOtAmrOu1Yt0BLdPvGFTaBOLAYG/cLYFm7jgfbZ7K/nbFGjHIOxRSske01zDxn3o
 6KOgovaGcswtBqvM2XFQqP0eLwzlUdXl8koCrMsRqpeHc0Bw8IL/Rgx+MucSGTwD4F8P3H7xp
 nYACBJd/nbJvN/Cf61TB1WAjr0BQsgN2x5vNkg/krhepTf/OlzGTtU1YF3NZIJCuQtVb9daBm
 icyz1YUtrMopvCrCT/2tAofPXNBB/7MCcP+U0dub/tUvc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717006995; x=1717611795; i=j.neuschaefer@gmx.net;
 bh=wn7MEYeRGgPib2T3v5fhha4wfhjEm/moO1vdKACfrjE=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DK6F0DRtQ1+b7tgWGnuzIEWn+2y+OrYOeAcc63kGw5DcGRV0GF4bZf8AI68q9Rpf
 2b8sLPPnbMMwU+989JagLtEJt/kRzFYxoqk/I5Liiu1tvVZTN5K9JBAvqpLy9djaz
 AwBv6TAIyOR3R+jeKbGez8kvz2JTE/GSRq4wi2Fm121iDP+Xl6moifSQVl8Eqc7Zu
 KE+lzCuXDoLHEAO77WxQ4GzPwyHXs+6YqPd3uevvUaJ71u/nNiQtXjrKIiezcFNQL
 jeDSOYULq6jf8r8E62gw+Pi7FIPmM0NdB5XCsmmvOLIbSKJw3F+Nh1ufcC25w24DT
 yBA+/LaLeoW+EaHM7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=DK6F0DRt
Subject: [Buildroot] [PATCH v2 0/2] Add option to ban textrels
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkNoYW5nZXMgaW4gdjI6Ci0gU2xpZ2h0bHkgZGlmZmVyZW50IHdvcmRpbmcKLSBFbmFibGUgdGhl
IG9wdGlvbiBieSBkZWZhdWx0IG9uIG11c2wgdG9vbGNoYWlucwotIEFkZCBwYXRjaCB0byBmaXgg
YnVpbGQgb2YgbWljcm9weXRob24KCkxpbmsgdG8gdjE6Ci0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MDQxOS16dGV4dC12MS0xLWE4ZDVjMmNmY2Y1N0BnbXgubmV0CgotLS0KSi4gTmV1
c2Now6RmZXIgKDIpOgogICAgICBDb25maWcuaW46IGJhbiB0ZXh0cmVscyBvbiBtdXNsIHRvb2xj
aGFpbnMKICAgICAgbWljcm9weXRob246IEFkZCBwYXRjaCB0byBhdm9pZCB0ZXh0cmVsIG9uIGFy
bS90aHVtYgoKIENvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE0ICsrKwogcGFja2FnZS9NYWtlZmlsZS5pbiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDQgKwogLi4uLU1ha2Utbm9uLVRodW1iMi1sb25nLWp1bXAtd29ya2Fyb3Vu
ZC1vcHQucGF0Y2ggfCAxMzAgKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDE0OCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogZDUwNmUyMzJlNzM4OGU3MDYyMmEx
YzFiMmEzMDY5MzY3ZDdiMzA1YgpjaGFuZ2UtaWQ6IDIwMjQwNDE3LXp0ZXh0LTVhY2NiYWI2MWMw
YQoKQmVzdCByZWdhcmRzLAotLQpKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
