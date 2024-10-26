Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18E7D10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 10:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8736A805A5;
	Sat, 26 Oct 2024 10:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49St59NZhj5Q; Sat, 26 Oct 2024 10:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE498805AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE498805AB;
	Sat, 26 Oct 2024 10:21:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E84052318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C898A40965
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu6vsK7qHTCU for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 10:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A3E940936
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A3E940936
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A3E940936
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:21:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CC601BF203;
 Sat, 26 Oct 2024 10:20:59 +0000 (UTC)
Date: Sat, 26 Oct 2024 12:20:58 +0200
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241026122058.28eb8c58@windsurf>
In-Reply-To: <20241025145916.1084987-1-flavio.tapajos@newtesc.com.br>
References: <20241025145916.1084987-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729938060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDAquNnuVP2LQ7+wv0nZmZGq5rN+7Q344POLSpEQ6vE=;
 b=RkJnppq4fpgk3U4K3Are/uEYgi8kbWBdzjC3pSuElU/pSRLVJP5FuSlGgfeThlZo1BAZxy
 CQwdfA7T/O2sAloujbOLIUn6JtAPnkDVimihAvB+eYfRIlk8hiBdsCkUbBuJdts6yjP9JV
 I1J84ZWG0yhlGD3DBSxa6xm1XFj3eq8J1mqGpZADg3IO7IlvSxq9VXJMSgM/LTGzPErJyU
 GQh8FJEnN7s0qVVrIOcvYht2Wx8z2pVoCkC4ID5f8P2F0ZbKoXiOND2Vz+kD22qHd9Ia1c
 1WwIzpehtHjgZ/Ke4L7Vx+Xc9d469kTlh/JOah+SfTif//DZEY7mfQ8KdFBbOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RkJnppq4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump version
 to 2.0.36
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

T24gRnJpLCAyNSBPY3QgMjAyNCAxMTo1OToxNiAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0tLQo+ICBwYWNr
YWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2ggfCA0ICsrLS0KPiAg
cGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5tayAgIHwgNCArKy0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
