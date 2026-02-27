Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43006FD7F93
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C935460BC1;
	Fri, 27 Feb 2026 19:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8moov0miww5; Fri, 27 Feb 2026 19:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA65A60BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772220421;
	bh=iIMGCSxy108hIcCMAuUyl9pPxK6xGBhCIf+HDq30fLM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdkLOAl0/mLjVRb1UKEaPVVZgNl7CkGNbw2IY5SM3yfeDweOvAWRHcJqSI1eEIri9
	 vJ+LF153O/DQ1WuIGhMeUi1QaJZYeghICoXj8dWC75HVV3l08d/DS9RHDVoY4dJgOO
	 unSnpTj5f9+/k1N0y0/JgD3JvKFsubESjoldYhwMAVA47S1KuscIDaH/5BQNBt+UMq
	 hcnP4c67/rPH+G0+fA0vHk2M5v0rH1Hp/pWmpt02v9RS6m0h1TqHU0LJtm1OEUZlJN
	 RVcZ2DE72eZpLRJ6UtYVgPHl33P+fvAqAdYiUptfsbvoEU5JYS8TpgkUS7UddKBGEX
	 7dF5pZxYNpS/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA65A60BB1;
	Fri, 27 Feb 2026 19:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEBA1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0105F80E4D
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLTwnAjRoGnQ for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C463E80E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C463E80E5C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C463E80E5C
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:26:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -75904299; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Feb 2026 19:26:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vw3UC-00000008IeK-11y3;
 Fri, 27 Feb 2026 20:26:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260227183214.1610624-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 27 Feb 2026 19:32:14 +0100")
References: <20260227183214.1610624-1-bernd@kuhls.net>
Date: Fri, 27 Feb 2026 20:26:52 +0100
Message-ID: <87qzq6oumb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=sS1kwCOzHCtQrgmgI+RhcEb72XKu3977L/Z/96M9XW9/0Y/oMIwZd8JrnxGqb1VyasyeZ9ZBXWq1/Rgmzg8NEWWsI71HKI8lMtOLtR9NC5pfEv1d02IrquS1+IcQFAacuwcc4FUCfRoBLGuBcRTDKQUSoyQSBunCqKSKyG/MKHcDBqRVXa0qg+gfbg2jJwFd1o4tal0MZBl3o9uvqixwUS7kahkvbpQJ4tUDGL6GlggQIXNxoUjj53PoqfijzT5ENPXM+oBRw43UV6qhhC7hRdA9/q9jLqelLtzzwGEtE5Ht3auymlwMriVRwue1UafzsAHC1NR5cmuLiCMKBT7UGw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=vnAQAf8iOjujd5PDor3meAvGnYZQ1KSiZKce2kWhehw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=sS1kwCOz
Subject: Re: [Buildroot] [PATCH 1/1] package/wlroots: fix build with
 libinput 1.31
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

Pj4+Pj4gIkJlcm5kIiA9PSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cml0ZXM6Cgog
PiBCdWlsZHJvb3QgY29tbWl0IDA0MzNjOGQwMmFmODAzZGU5MGI0MWM0MmJiNDFiYmM5ZjJkNDM2
ZmYgYnVtcGVkCiA+IGxpYmlucHV0IHRvIHZlcnNpb24gMS4zMS4wIHdoaWNoIGNhdXNlcyBhIGJ1
aWxkIGVycm9yIHdpdGggd2xyb290OgoKID4gLi4vYmFja2VuZC9saWJpbnB1dC9zd2l0Y2guYzog
SW4gZnVuY3Rpb24g4oCYaGFuZGxlX3N3aXRjaF90b2dnbGXigJk6CiA+IC4uL2JhY2tlbmQvbGli
aW5wdXQvc3dpdGNoLmM6MzI6OTogZXJyb3I6IGVudW1lcmF0aW9uIHZhbHVlCiA+ICDigJhMSUJJ
TlBVVF9TV0lUQ0hfS0VZUEFEX1NMSURF4oCZIG5vdCBoYW5kbGVkIGluIHN3aXRjaCBbLVdlcnJv
cj1zd2l0Y2hdCiA+ICAgIDMyIHwgICAgICAgICBzd2l0Y2ggKGxpYmlucHV0X2V2ZW50X3N3aXRj
aF9nZXRfc3dpdGNoKHNldmVudCkpIHsKCiA+IFRoZSBidWlsZCBlcnJvciB3YXMgbm90IHlldCBk
ZXRlY3RlZCBieSB0aGUgYXV0b2J1aWxkZXJzIGJ1dCBjYW4gYmUKID4gcmVwcm9kdWNlZCB1c2lu
ZyB0aGlzIGRlZmNvbmZpZzoKCiA+IEJSMl94ODZfNjQ9eQogPiBCUjJfVE9PTENIQUlOX0VYVEVS
TkFMPXkKID4gQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXkKID4gQlIyX1JPT1RGU19ERVZJ
Q0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CiA+IEJSMl9QQUNLQUdFX01FU0EzRD15CiA+IEJS
Ml9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9TT0ZUUElQRT15CiA+IEJSMl9QQUNLQUdF
X01FU0EzRF9PUEVOR0xfR0xYPXkKID4gQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0w9eQog
PiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VTPXkKID4gQlIyX1BBQ0tBR0VfWE9SRzc9eQog
PiBCUjJfUEFDS0FHRV9XTFJPT1RTPXkKCiA+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
