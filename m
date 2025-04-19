Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812BBC369CB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 481DD605BE;
	Sat, 19 Apr 2025 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzGIZw5gbf5B; Sat, 19 Apr 2025 14:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76EA1606BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EA1606BA;
	Sat, 19 Apr 2025 14:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13AE322F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 052B26072B
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyvzkpEcBkym for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF620605BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF620605BE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF620605BE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:10:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD46E4399C;
 Sat, 19 Apr 2025 14:10:11 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:10:10 +0200
To: Jan =?UTF-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: buildroot@buildroot.org
Message-ID: <20250419161010.0af0ad27@windsurf>
In-Reply-To: <20250414120653.3962766-1-sairon@sairon.cz>
References: <20250414120653.3962766-1-sairon@sairon.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshgrihhrohhnsehsrghirhhonhdrtgiipdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745071811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBkwiZZoEqUaDbuFAu2kwHAnoyUXAj62hv7ZYdGolB0=;
 b=a7qBYKrevinYjcfH694zebM9nv5kngnUpcR42GQ09jP0lMlemuk8XDCWVPvDSQFyknu73G
 CWMSxvSsFIUpIFxU6poCNiNWikHCHGZNpGIOpaoTMHp0+FxiDlEkv0c4fIYGKdrsleG6Nh
 +yKtXH0Wm7v+TNROpUC8nHhvEvnCFIaB7rFnyXfKl8R3HXD2Sbyj4ZNtxQVBhNf42eGzw8
 N3LZ5FMHDV15JxdbGMPJqHf7gjdLH5Eh6U/TVaxDn4Shx7h/o1ODVXHCKaq623XQNgLqeH
 CKS+UhOKaZSCysid983Id0995qhaDxRPIUnMUWvIAfaHj14WMaUraItiN9mtvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a7qBYKre
Subject: Re: [Buildroot] [PATCH] package/iptables: backport fix for
 interface comparisons in `-C` commands
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxNCBBcHIgMjAyNSAxNDowNjo1MiArMDIwMApKYW4gxIxlcm3DoWsgPHNhaXJvbkBz
YWlyb24uY3o+IHdyb3RlOgoKPiBTaW5jZSBpcHRhYmxlcyB2MS44LjExLCBgaXB0YWJsZXMgLUNg
IGNvbW1hbmRzIHJldHVybiB1bmV4cGVjdGVkIHplcm8gc3RhdHVzCj4gZXZlbiBmb3IgY2FzZXMg
d2hlbiB0aGUgcnVsZXMgZG9uJ3QgZXhpc3QuIFRoaXMgYnJlYWtzIGUuZy4gc3RhbmRhcmQgRG9j
a2VyCj4gb3BlcmF0aW9uLCB3aGVyZSBjaGVja2luZyBmb3IgZXhpc3RpbmcgcnVsZXMgaXMgdXNl
ZCBleHRlbnNpdmVseSB3aGVuIGNyZWF0aW5nCj4gbmV0d29ya3MuCj4gCj4gVGhlIHBhdGNoIGZp
eGluZyB0aGUgYmVoYXZpb3IgaXMgYXZhaWxhYmxlIHVwc3RyZWFtIC0gYXBwbHkgaXQgdG8gdjEu
OC4xMQo+IGJlZm9yZSBhIG5ld2VyIHZlcnNpb24gaXMgYXZhaWxhYmxlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KPiAtLS0KPiAgLi4uLWludGVy
ZmFjZS1jb21wYXJpc29ucy1pbi1DLWNvbW1hbmRzLnBhdGNoIHwgMTc1ICsrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTc1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvaXB0YWJsZXMvMDAwMS1uZnQtZml4LWludGVyZmFjZS1jb21wYXJpc29u
cy1pbi1DLWNvbW1hbmRzLnBhdGNoCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
