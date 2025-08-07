Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA489C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 14:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F87684DDD;
	Thu,  7 Aug 2025 14:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LExMU1YMHIY8; Thu,  7 Aug 2025 14:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C749384DDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C749384DDE;
	Thu,  7 Aug 2025 14:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84DC5233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B2C584DDD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gT2l5QnRLFMy for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 14:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63A1984DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A1984DE1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63A1984DE1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 14:02:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 592065680; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 07 Aug 2025 14:02:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uk1Cl-002qId-0I;
 Thu, 07 Aug 2025 16:02:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>
Cc: buildroot@buildroot.org
References: <20250805111656.3567465-1-peter@korsgaard.com>
 <CAEktqctbZSBYVdWqCYdev5eFDzPy_dX5qA9b95_ow-ODy2EsSw@mail.gmail.com>
Date: Thu, 07 Aug 2025 16:02:51 +0200
In-Reply-To: <CAEktqctbZSBYVdWqCYdev5eFDzPy_dX5qA9b95_ow-ODy2EsSw@mail.gmail.com>
 (=?utf-8?Q?=22B=C3=B6rge_Str=C3=BCmpfel=22's?= message of "Thu, 7 Aug 2025
 15:02:05 +0200")
Message-ID: <87ikizgrg4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=OK+1KC71baZZhg9E+P2HgPkEIR7j5DrgyH9E2ve2mwZgbCPksprysDTgTcjRwgA2yuMd0zDYRQgDzTQlxJYRFK3tfycQZmYv9YJIDEvLWnZIwSBheIFD6Tg0TLG5aDHUoUQnqbAm5dUlWgU6IDiu8P2OiI/I+ZQ//XvQQdnXTKxzxifLEP7PBS7cOSWXtlh6SX7fvnsPYYoq7y4muWLovFOJFmDPTGdGmZPqGgplcQ6AZ/flzXzWX1nnDG+tlSFDCIlB/DkLkMM0l7YVxroKASqay1iNO30KPSSEwIjMOlDUjpsSbYxf/AQMHlsfilRrD+njDQZpEGTdlczsWcmDkQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=WkT0TWGQu7+PiT4W9MLKE2l9z8TRrl9ZUrKd138Nmxk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=OK+1KC71
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: bump version to 2.2.2
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

Pj4+Pj4gIkLDtnJnZSIgPT0gQsO2cmdlIFN0csO8bXBmZWwgPGJvZXJnZS5zdHJ1ZW1wZmVsQGdt
YWlsLmNvbT4gd3JpdGVzOgoKID4gT24gVHVlLCBBdWcgNSwgMjAyNSBhdCAxOjE34oCvUE0gUGV0
ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKID4+IAogPj4gQnVnZml4
IHJlbGVhc2UuIEZyb20gTkVXUzoKID4+IAogPj4gLSBkb24ndCBpbXBsaWNpdGx5IHVucXVvdGUg
dW5uYW1lZCBsaW5lcyBpbiBncGlvaW5mbwogPj4gLSByZW1vdmUgdXNlbGVzcyB2YXJpYWJsZSBp
biByZWNvbmZpZ3VyZSBleGFtcGxlCiA+PiAtIGRvbid0IGxldCBzdHJ1Y3QgbGluZV9jb25maWcg
YmFsbG9vbiBvdXQgb2YgY29udHJvbCBhbmQgdHJpZ2dlciBhbiBPT00KID4+IC0gZHJvcCBweXRo
b24zLWNvbmZpZyBjaGVjayBmcm9tIGNvbmZpZ3VyZS5hYwogPj4gCiA+PiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGlicy9saWJncGlvZC9saWJncGlvZC5naXQvY29tbWl0Lz9pZD03
NTlkODMxYWE4ODQ2YTVkMDA3Y2FjMjUwZjc4ZDc0YTUxNGUxZWM5CiA+PiAKID4+IFNpZ25lZC1v
ZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KID4gQWNrZWQtYnk6
IEJvZXJnZSBTdHJ1ZW1wZmVsIDxib2VyZ2Uuc3RydWVtcGZlbEBnbWFpbC5jb20+CgpDb21taXR0
ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
