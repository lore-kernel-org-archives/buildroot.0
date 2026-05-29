Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B05CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA27B843A9;
	Fri, 29 May 2026 10:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o-AvAlstFLm; Fri, 29 May 2026 10:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E58842D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780051443;
	bh=vMeC8M54/AnL+WzQ5xf/GYjcTbMb/HtcLo40IqWA8Hs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPErDSz5amXwHL8ATIji1C+/9NM8qPBwvXCv6+ncPNeQncfwlk6JyhE1LLfywt6wS
	 4UYXT9d1h6WmJkqbwVc4R2iyLYKJkwWx+JNUCtzuUkI5Exr16z/8mABJcW3rOwm8/0
	 XyAh0QxCvPqDXM3FEU46fXTZ1e7TCuyRKMfYFVPU0O06IilP2Ny2+un1gTiRiOdLD6
	 LuGpCTlAOOpJPNRf+AHNz8KeML8Vho2TZSpRy8qlV0SkGf41mJruR+J+WbMOltYRiM
	 +Gg+8GfMbIdnc2ftl0j7JMxNyf7NnymDkpBE7u6g+pnp5s83xEVeEooCbH4UiJLo1k
	 tzo7HWHupOb1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E58842D6;
	Fri, 29 May 2026 10:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D69288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3F6D61461
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6SQLAvl6xiA for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CE21613F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE21613F7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CE21613F7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:44:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1672320037; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 10:43:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSugz-00000001fxg-1aSc;
 Fri, 29 May 2026 12:43:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: <buildroot@buildroot.org>,  Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260512105602.83368-2-kanak.shilledar@axis.com> (Kanak
 Shilledar's message of "Tue, 12 May 2026 12:56:01 +0200")
References: <20260512105602.83368-1-kanak.shilledar@axis.com>
 <20260512105602.83368-2-kanak.shilledar@axis.com>
Date: Fri, 29 May 2026 12:43:53 +0200
Message-ID: <87tsrqijh2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kgd1S6nQm1fmnDEx+HkRXJA7zOg6Kiw9MyPge6yGEc4U+WshG5XPqmFLI3mfjaHIA0RLhIYRrN0gLQ/aZuhoTeSrrQjHMwZTKbZF7Dn+s/zisXXITChG51Dw+DfbXXD+vSM3p4DHUXNEBaDFFoCHXQ6zgFox6hxRS50nEpwHptJY/vbwKdBmbc0I3P6df7UpAk/Y09gErwUYRUrpg4p9V85E1DW7G/N2Tq6oQNHQ87TK4ae2fbyxr/rZhCsnpZjx7vKKJMXs5128aXrW5dA/X3x2JkxVJpSZgDap0Ez6vCN/71XE2I5mYWRJqjuX5XC3HUyjOh0pBbBVBbI9exuG6w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=JFxb3gou1rjJkmdi0rT6ySwdYQQZ4nxrFjqscmC1uTY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=kgd1S6nQ
Subject: Re: [Buildroot] [RESEND v3 1/1] support: kconfig: Fix compiler
 warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkthbmFrIiA9PSBLYW5hayBTaGlsbGVkYXIgPGthbmFrLnNoaWxsZWRhckBheGlzLmNv
bT4gd3JpdGVzOgoKID4gQWRkIGEgbmV3IHBhdGNoIHRvIGZpeCB0aGUgY29tcGlsZXIgd2Fybmlu
ZyBnaXZlbiBvbiBVYnVudHUgMjQuMDQuNCBpbgogPiBgdXRpbC5jYCB3YXJuaW5nIG9mIGAtV2Zv
cm1hdC1vdmVyZmxvdz1gLgoKID4gYGBgCiA+IC4vdXRpbC5jOiBJbiBmdW5jdGlvbiDigJhmaWxl
X3dyaXRlX2RlcOKAmToKID4gLi91dGlsLmM6ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVj
dGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0ZXMgaW50bwogPiBhIHJlZ2lvbiBvZiBzaXplIGJl
dHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9XQogPiAgICA4NiB8ICAgICAgICAg
c3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7CiA+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+CiA+IC4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNwcmludGbigJkgb3V0
cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpCiA+IGludG8gYSBkZXN0aW5hdGlv
biBvZiBzaXplIDQwOTcKID4gICAgODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwgIiVzJXMiLCBk
aXIsIG5hbWUpOwogPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KID4gYGBgCgogPiBVcGRhdGUgYGJ1ZjJgIHRvIGBQQVRIX01BWCsyMGAgc2ltaWxhciB0
byBgYnVmYCwgdGh1cyBnaXZpbmcgZW5vdWdoCiA+IGhlYWRyb29tIGZvciB0aGUgZmlsZW5hbWUg
c3VmZml4LgoKID4gLS0KID4gQ2hhbmdlcyBpbiB2MzoKID4gKiBVcGRhdGVkIHRoZSBjb21taXQg
bWVzc2FnZQogPiAqIEdlbmVyYXRlZCB0aGUgcGF0Y2ggdXNpbmcgYGdpdCBmb3JtYXQtcGF0Y2hg
LCBhbmQgYWRkZWQgdG8gdGhlCiA+ICAgYHNlcmllc2AuCgogPiAtLQogPiBDaGFuZ2VzIGluIHYy
OgogPiAqIENoYW5nZWQgZnJvbSBkaXJlY3QgZmlsZSBmaXggdG8gcGF0Y2ggYmFzZWQgZml4LgoK
R2l2ZW4gdGhhdCB0aGUgaXNzdWUgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IDMyNDYxMmQ2OGUw
OWQwZGI0IHdoaWNoCmRpZCBOT1QgYWRkIGEgcGF0Y2ggSSBoYXZlIGluc3RlYWQgYXBwbGllZDoK
Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NjA1MDcxMjM1MzQuMzE4NzYzLTEtdGhvbWFzQGRldm9vZ2R0LmNvbS8KCkFuZCBtYXJrZWQgdGhp
cyBwYXRjaCBhcyBzdXBlcnNlZWRlZC4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
