Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E707D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 753A8841A4;
	Tue, 13 Jan 2026 19:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIyFQI3H_GG0; Tue, 13 Jan 2026 19:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A01C88419E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333563;
	bh=zpVP6CekWS/eQSPdRn3NH1Z7t+9zrJix6YgxgsPkq18=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gzz3V1OVE6tJb1sOA2yr1D4iqhCZyh4gsw89lG9SQOgmElE2SD/8WN/T4IShSRltt
	 by+zVP+o8O30kYIiTW5wk4mxejUdDZMnkxr3Zri1UPvSD8GRvXy111UMKCqgbV+vJ6
	 dNGZDy3vRKYiYPviK3yKs5rYmYggjApm8S9bBfxkEc+MWiUfR9+aQw16CkjMdS2Km6
	 M/ZeLfqCmzNxmnooAHAztd/RpUJNH7QuQ/y3c7eWo7AdS6lP5dkPv3If9QlxT2Iikl
	 GiyHzcF1QJFDRS2oHA47xPVTnLKTMIcoKZmRoqS5KwMIdRI+s8waJfJuqd52deKvlU
	 TmRCM/3X28uDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A01C88419E;
	Tue, 13 Jan 2026 19:46:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F21A231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C868418E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zily8P1NkDBx for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27CFB8419C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27CFB8419C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27CFB8419C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E893B97A885; Tue, 13 Jan 2026 20:45:58 +0100 (CET)
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:55 +0100
Message-ID: <20260113194556.98127-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251117-gitignore-brmake-log-v1-1-a77ec4bb1db2@bootlin.com>
References: <20251117-gitignore-brmake-log-v1-1-a77ec4bb1db2@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=S8ps+Jk7+fpV4UV9APtZk515mCdfRk/GXAv70Ql5h0c=;
 b=eVIYSMOn3hF2euZmnKzXlxwn10Be6dtci3V3P+OYjpvZ5BxRzjWbjuN8Epv2jok4XfRH04
 2I9yYn3ayK/utGRG+/V5FS6/ueDf5Uxv31btmy/q0x8x+sYYJDlRL/iBSrSrKh6iJgok0+
 fbKmnunQF5ALeoAn1+GJXxsITz21MKF7gaU3/UHUg+YNm4W8Rdpbt8pCLWCQreWWyGLQNK
 zU1FY6tZoLWlhE8Z/+LGX/9Cf8ZeWk/awjT1HQ+ernhww0RWlLFn1/X24ycgcm0IdwMQW0
 7s8gcaQuO0HgNwuRKVwh06cBvJG+RqOiYjcOLAc9FFItWZhiMwaIFPjTE8DLjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eVIYSMOn
Subject: Re: [Buildroot] [PATCH] gitignore: ignore utils/brmake log output
 named `br.log`
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

SW4gcmVwbHkgb2Y6Cj4gVGhlIGB1dGlscy9icm1ha2VgIHRvb2wgcnVucyBgbWFrZSBhbGxgIHdp
dGggbG9ncyBwdXQgaW50byBgYnIubG9nYC4KPiBUaGF0IGZpbGUgaXMgdGhlcmVmb3JlIHRoZSBy
ZXN1bHQgb2YgYSBidWlsZCBhbmQgY29tbWl0dGluZyBpdCBuZXZlcgo+IG1ha2VzIHNlbnNlLCBu
ZWl0aGVyIHVwc3RyZWFtIG5vciBvbiBhbnkgb3RoZXIgcmVtb3RlL2JyYW5jaC4KPiAKPiAgICAg
4p+pIGdpdCBzdGF0dXMgLS1zaG9ydAo+ICAgICDin6kgbWFrZSBiZWFnbGVib25lX2RlZmNvbmZp
Zwo+ICAgICDin6kgLi91dGlscy9icm1ha2UKPiAgICAg4p+pIGdpdCBzdGF0dXMgLS1zaG9ydAo+
ICAgICA/PyBici5sb2cKPiAKPiBBZGQgYSBuZXcgYC9ici5sb2dgIGVudHJ5IGluIHRoZSByb290
IGAuZ2l0aWdub3JlYCBmaWxlLgo+IEFwcGVuZCB0byB0aGUgZW5kIGJlY2F1c2Ugbm8gb3JkZXJp
bmcgbG9naWMgd2FzIGZvdW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhl
by5sZWJydW5AYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCBhbmQgMjAyNS4xMS54
LiBUaGFua3MKCj4gLS0tCj4gIC5naXRpZ25vcmUgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhLy5naXRpZ25vcmUgYi8uZ2l0aWdub3JlCj4g
aW5kZXggZWM1NzY4ZDA1My4uZmIyMGIwM2RhZiAxMDA2NDQKPiAtLS0gYS8uZ2l0aWdub3JlCj4g
KysrIGIvLmdpdGlnbm9yZQo+IEBAIC0xMywzICsxMyw0IEBACj4gICoucmVqCj4gICp+Cj4gICou
cHljCj4gKy9ici5sb2cKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogOGNjZWUyYmUyMjE3NzJmNmQ0
NTZmZDg1MmIyMzdhZGI3ZjViYmU1MQo+IGNoYW5nZS1pZDogMjAyNTExMTctZ2l0aWdub3JlLWJy
bWFrZS1sb2ctZDRiZjYxNjU3NGFhCj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tIAo+IFRow6lvIExl
YnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
