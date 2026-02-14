Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA5CEF584C
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 17:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1934C40B44;
	Sat, 14 Feb 2026 17:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2n3XJjTwEjF; Sat, 14 Feb 2026 17:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1287D40974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771088563;
	bh=xtEjqPp4VE36yl0AoQHcPyJUZPLQG95roHpl6L1NeQY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dd7oKIC70Ep0DKt6Ue8ACFrxcf13zSwzilV21M1+SnJH9B4FKgyHpp0pMSwJ5Lzli
	 qEMXr9UBW/xJo7GX41Qdc0CfuQ0SXdDkpivSYJMafn3/uS7PxBKTRyM0OgVYKhuMOq
	 sPNF18AnuVlifUzF89aqMXJ4JQNZ7AgqhWKBpvjMrDWOR+N+Jn52+s1uGkGvBhUaix
	 GNDcvyWrgmATvRgHsjm/lYZlFaedeElbyLt/Yg81+h35rXBTW0755307Gq/l6qgVVg
	 mGZtJRL4Lm2hnuBPqzjVsXKbku88nMUKEyllQ9u14gevPtI4ffhqsU+YXSOtRqGmPq
	 6l6MS1rJq5OaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1287D40974;
	Sat, 14 Feb 2026 17:02:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A996F270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 17:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A46181EA8
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 17:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRoxvdgqoIqk for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 17:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DC0D81E79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC0D81E79
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DC0D81E79
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 17:02:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 79283C1C39B;
 Sat, 14 Feb 2026 17:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 26A4F606CB;
 Sat, 14 Feb 2026 17:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0DF1C10368FEF; Sat, 14 Feb 2026 18:02:34 +0100 (CET)
Mime-Version: 1.0
Date: Sat, 14 Feb 2026 18:02:33 +0100
Message-Id: <DGEUHT8BHE5X.2TU0LU49G6PSC@bootlin.com>
To: "Marcus Hoffmann" <buildroot@bubu1.eu>, <buildroot@buildroot.org>,
 "Titouan Christophe" <titouan.christophe@mind.be>, "Thomas Perale"
 <thomas.perale@mind.be>
Cc: "buildroot" <buildroot-bounces@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210154501.05EB784212@busybox.osuosl.org>
 <7955cd2b-9c7d-44a8-964b-62d9f6305b3c@bubu1.eu>
In-Reply-To: <7955cd2b-9c7d-44a8-964b-62d9f6305b3c@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771088557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Gpy6Av3aHeXA9EJuFXpOhCaRntaU7b5Nk8K4eQCijUs=;
 b=md3Ypc5l8QkVgizM9C/JK5yB/rb5HsSD2/r9jSLyhooe/rW0QDAo/cqdrb5Q7n90qPHZ0v
 rMXw4PwaV1gdAHCWl4taL0FdcQUUqdikkYpLkcm+O0y+17cfegZuqwqA8MviXG1PxyL5n9
 sywV2Uii9T+Z+AkpLnN+sgZZ0LzL07+2ydh1kJ2FKpMAZ3ZeDupauU3e8TWLXM5Nq17PWs
 hek+UBFQtvVLKFtckjHZLDU0gGbn/MbSJ62oWBEuhfoicojRCsu9/90FyShaKxRXm1VKuC
 7VV6fesgMk20pgfPTcmiVPuvOgDxBf+zFB7uIjkN3JGnQD9LssuLKbLw1Sqxwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=md3Ypc5l
Subject: Re: [Buildroot] [git commit] package/m4: bump version to 1.4.21
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1IEZlYiAxMiwgMjAyNiBhdCAxMDo1OCBBTSBDRVQsIE1hcmN1cyBIb2ZmbWFubiB2aWEg
YnVpbGRyb290IHdyb3RlOgoKSGVsbG8sCgo+IEhpIFRpdG91YW4sIFRob21hcywKPgo+IE9uIDIv
MTAvMjYgMTU6NTksIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBjb21t
aXQ6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC84
NzVkNmFlZGJjNjM5NDg0ZTkyMDNjNWJjZGExYTU1ZWNiN2FkNGM5Cj4+IGJyYW5jaDogaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vdHJlZS9tYXN0ZXIKPj4gCj4+
IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvbTQtYW5ub3VuY2UvMjAyNi0wMi9t
c2cwMDAwMC5odG1sCj4KPiBXZSBwcm9iYWJseSBuZWVkIHRoaXMgaW4gdGhlIHN0YWJsZSBicmFu
Y2hlcyBiZWNhdXNlIGFzIG9mIHRvZGF5IAo+IGFyY2hsaW51eCBpcyBzaGlwcGluZyBnY2MgMTUg
YnVpbHQgYWdhaW5zdCBnbGliYyAyLjQzIGFuZCBtNCBmYWlscyB0byAKPiBjb21waWxlIGJlZm9y
ZSB2ZXJzaW9uIDEuNC4yMQo+Cj4gID4gWy4uLl0KCkkgY2FuIGNvbmZpcm0gdGhhdCBJIGZhaWwg
dG8gYnVpbGQgaG9zdC1tNCBvbiAyMDI1LjAyLnggZHVlIHRvIG15IGhvc3QKaGF2aW5nIGdjYzE1
IGFuZCBnbGliYyAyLjQzOgoKICBDQyAgICAgICBsaWJtNF9hLWMzMnRvbG93ZXIubwogIEluIGZp
bGUgaW5jbHVkZWQgZnJvbSAvdXNyL2luY2x1ZGUvZmVhdHVyZXMuaDo1NDAsCiAgICAgICAgICAg
ICAgICAgICBmcm9tIC91c3IvaW5jbHVkZS9iaXRzL2xpYmMtaGVhZGVyLXN0YXJ0Lmg6MzMsCiAg
ICAgICAgICAgICAgICAgICBmcm9tIC91c3IvaW5jbHVkZS9zdHJpbmcuaDoyNiwKICAgICAgICAg
ICAgICAgICAgIGZyb20gLi9zdHJpbmcuaDo0MSwKICAgICAgICAgICAgICAgICAgIGZyb20gYmFz
ZW5hbWUtbGdwbC5jOjI0OgogIC4vc3RyaW5nLmg6Nzc3OjIwOiBlcnJvcjogZXhwZWN0ZWQgaWRl
bnRpZmllciBvciAnKCcgYmVmb3JlICdfR2VuZXJpYycKICAgIDc3NyB8IF9HTF9FWFRFUk5fQyB2
b2lkICptZW1jaHIgKGNvbnN0IHZvaWQgKl9fcywgaW50IF9fYywgc2l6ZV90IF9fbikKICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICBefn5+fn4KICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vz
ci9pbmNsdWRlL2ZlYXR1cmVzLmg6NTQwLAogICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL2lu
Y2x1ZGUvZXJybm8uaDoyNSwKICAgICAgICAgICAgICAgICAgIGZyb20gb3BlbmF0LXByaXYuaDoy
MywKICAgICAgICAgICAgICAgICAgIGZyb20gb3BlbmF0LXByb2MuYzoyMjoKICAuL3N0ZGxpYi5o
OjgyNzoyMDogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgb3IgJygnIGJlZm9yZSAnX0dlbmVy
aWMnCiAgICA4MjcgfCBfR0xfRVhURVJOX0Mgdm9pZCAqYnNlYXJjaCAoY29uc3Qgdm9pZCAqX19r
ZXksCiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgogIEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSAvdXNyL2luY2x1ZGUvZmVhdHVyZXMuaDo1NDAsCiAgICAgICAgICAgICAgICAgICBm
cm9tIC4vd2NoYXIuaDo2OSwKICAgICAgICAgICAgICAgICAgIGZyb20gYnRvd2MuYzoyMToKICAu
L3N0cmluZy5oOjc3NzoyMDogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgb3IgJygnIGJlZm9y
ZSAnX0dlbmVyaWMnCiAgICA3NzcgfCBfR0xfRVhURVJOX0Mgdm9pZCAqbWVtY2hyIChjb25zdCB2
b2lkICpfX3MsIGludCBfX2MsIHNpemVfdCBfX24pCiAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+CiAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9mZWF0dXJlcy5o
OjU0MCwKICAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9pbmNsdWRlL3VjaGFyLmg6MjYsCiAg
Wy4uLl0KCkNoZXJyeS1waWNraW5nIE1hcmN1cycgcGF0Y2ggZnJvbSBtYXN0ZXIgYnJhbmNoLCBj
b21taXQgODc1ZDZhZWRiYzYzCigicGFja2FnZS9tNDogYnVtcCB2ZXJzaW9uIHRvIDEuNC4yMSIp
LCBhbGxvd3MgdG8gY29ycmVjdGx5IGJ1aWxkCmhvc3QtbTQgd2l0aCBob3N0IGdsaWJjIDIuNDMu
IFRoZSBwYXRjaCBhcHBsaWVzIHdpdGhvdXQgY29uZmxpY3Qgb24gdG9wCm9mIDIwMjUuMDIueC4K
CkFsZXhpcwoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
