Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73591C53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 13:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1529C608A9;
	Tue, 28 Jul 2026 13:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdELvU6OhETY; Tue, 28 Jul 2026 13:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FAB608A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247192;
	bh=vacrMwiyho6tCT7MGkb8/5Q32KQkU7vwNnM0QMqlo/U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=riStykumwTvDA8Fkz4TsRM9CnzAo751iI+aqyh3vRf7KTp5ch4nwRxW9+wQhIHOCB
	 Y8RPh9Rt4i8szfJYS/4V4LVAhtJqGEhUOzT/YhBzR3AtXG0f9BFIE9ByD6NI3pQjMX
	 N+B0wqu00xqwUNIlnKJuB2SU3Dm1rCNmCIlbnqHmFx/1W8mrP7FjlZvRL/BNtVdf7Q
	 D4Kmu9bal8mLtNr3bVRnu3oGEAV5pZH6btB++vD8O+WL7OuE4j8aqyvzMRG6KVsKiw
	 gvINPccFg3cv5E3yEX5rVqcbZvpJI43jF5ftlUD9Qhs/bMpwWpJ9smpfv4PMf/ZXH0
	 y0N5XjDm/9qvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FAB608A1;
	Tue, 28 Jul 2026 13:59:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1B712E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8B68125E
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lvmcrr8P9r2f for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 13:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5B0781259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B0781259
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5B0781259
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:59:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 657177841; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 13:59:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1woiLT-00000000Ho5-14tD;
 Tue, 28 Jul 2026 15:59:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260727154523.3265562-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Mon, 27 Jul 2026 17:45:23 +0200")
References: <20260727154523.3265562-1-fiona.klute@gmx.de>
Date: Tue, 28 Jul 2026 15:59:47 +0200
Message-ID: <87fr13qkoc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DdgyCY/bV2O/BKD0AACtxCDw9rvHMd4c05vNZa0pgqIMJAir9HooyMK1waBiE0Pd9N3/5KqKH4C5GAY9GO7FXC/crpPN488RQTwkaO2Izto3ZW5ewo5whCctbOG4jj9E7B6E/ajTc89CvNwgFWsN9HX2jq9a8Et/s5lvXFhGsf7BVNC6IQheKLMl8m8tzwJkIa4OJC074Pt/pbpptc0JCtnh+82iOtHoM8KxOyNbzGc26POD3WtTmOSa3ibl/Re1sxxRbyFHxpVz+mhg3KpecW3K1CRk4rZoXOYqm7ocBWQPzgFc2EjgCIF/MJ4WmZBZWtEwbau2rb0qN1a3NP5jMA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=0jbtwRl02EN5meBLK3BEwZ0G96SlUWePDFGpTXWjqzU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=DdgyCY/b
Subject: Re: [Buildroot] [PATCH 1/1] package/p11-kit: explicitly enable or
 disable systemd units
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

Pj4+Pj4gIkZpb25hIiA9PSBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVp
bGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRnJvbTogIkZpb25hIEtsdXRlIChPdGhlcm1vIEdtYkgp
IiA8ZmlvbmEua2x1dGVAZ214LmRlPgogPiBUaGUgLS13aXRoLXN5c3RlbWQgb3B0aW9uIGNvbnRy
b2xzIG9ubHkgaWYgc3lzdGVtZCB1bml0cyBhcmUKID4gaW5zdGFsbGVkLCBzbyB0aGVyZSBpcyBu
byBidWlsZCB0aW1lIGRlcGVuZGVuY3kuIERpc2FibGUgc3lzdGVtZAogPiB1bmNvbmRpdGlvbmFs
bHkgZm9yIHRoZSBob3N0IHBhY2thZ2UgYmVjYXVzZSBCdWlsZHJvb3QgY2Fubm90IGFuZAogPiBz
aG91bGQgbm90IGluc3RhbGwgc3lzdGVtZCB1bml0cyBvbiB0aGUgaG9zdC4KCiA+IEZpeGVzIGhv
c3QtcDExLWtpdCBpbnN0YWxsIGVycm9yOgoKID4gaW5zdGFsbDogcmVndWzDpHJlIERhdGVpICcv
dXNyL2xpYi9zeXN0ZW1kL3VzZXIvcDExLWtpdC1zZXJ2ZXIuc29ja2V0JwogPiBrYW5uIG5pY2h0
IGFuZ2VsZWd0IHdlcmRlbjogS2VpbmUgQmVyZWNodGlndW5nCiA+IGluc3RhbGw6IHJlZ3Vsw6Ry
ZSBEYXRlaSAnL3Vzci9saWIvc3lzdGVtZC91c2VyL3AxMS1raXQtc2VydmVyLnNlcnZpY2UnCiA+
IGthbm4gbmljaHQgYW5nZWxlZ3Qgd2VyZGVuOiBLZWluZSBCZXJlY2h0aWd1bmcKCiA+IFNpZ25l
ZC1vZmYtYnk6IEZpb25hIEtsdXRlIChPdGhlcm1vIEdtYkgpIDxmaW9uYS5rbHV0ZUBnbXguZGU+
CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
