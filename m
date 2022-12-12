Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08DBC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34294401D3;
	Mon, 12 Dec 2022 15:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34294401D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ps3wXf_bVR9S; Mon, 12 Dec 2022 15:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C384404ED;
	Mon, 12 Dec 2022 15:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C384404ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E44BD1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BBF960D94
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BBF960D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49qe5FhgTE9x for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:37:59 +0000 (UTC)
X-Greylist: delayed 00:05:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F163A60D5B
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F163A60D5B
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:37:58 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:37:46 +0000
To: buildroot@buildroot.org
Message-ID: <20221212153705.1807269-1-fhunleth@troodon-software.com>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail3; t=1670859471; x=1671118671;
 bh=l062rbeK0Lu/zWnX92D4x08qlk2qSSluKCP9vRWaqog=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=RwaUs+yBPWOfSFuhMQjxXXhutxshJBXWPRtskosreTGJL9ART1J+tqqOccK5AkBQm
 B8dnF+IXjroWvuptEHHSJjLHgI+ervMiOLqJWNnpcyJTPZAy6TIYkVgP+BcWKyZn1B
 WoxTEbAMlTF0QOUk8QvF7idScrDn4I4LzVM6H4pUZ+MbNft1MjAyboxO51RcAmR05D
 ABMCGwJO7MazxLsSDlWvL/A0nN8CSpXqvaWctdzYrIOC5xZynfpbf2VQAMyZH6O1Ej
 gtR0jLmlXyG7oZqd7f5FfYPz5iTwvNder4qBjQX+ilTwpDrK34Yi2xbtTHar2IJl9q
 Qv/1crpYZV4JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=RwaUs+yB
Subject: [Buildroot] [PATCH 1/1] toolchain-external: refine support library
 search to lib directory
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBmaXhlcyBhbiBpc3N1ZSB3aGVyZSBnY2Mgc3VwcG9ydCBsaWJyYXJpZXMgbGlrZSBsaWJz
dGRjKysuc28gYW5kCmxpYmF0b21pYy5zbyB3ZXJlIG5vdCBjb3BpZWQgdG8gdGhlIHRhcmdldCBm
b3IgYSBDcm9zc3Rvb2wtTkcgUklTQy1WCmdsaWJjIHRvb2xjaGFpbi4KClRoZSBDcm9zc3Rvb2wt
TkcncyB0b29sY2hhaW4ncyBzeXNyb290IGxvb2tzIGxpa2UgdGhpcyAodHJpbW1lZCk6CgpzeXNy
b290CuKUnOKUgOKUgCBsaWIK4pSCwqDCoCDilJzilIDilIAgbGQtbGludXgtcmlzY3Y2NC1scDY0
ZC5zby4xCuKUgsKgwqAg4pSc4pSA4pSAIGxpYmF0b21pYy5hCuKUgsKgwqAg4pSc4pSA4pSAIGxp
YmF0b21pYy5zbyAtPiBsaWJhdG9taWMuc28uMS4yLjAK4pSCwqDCoCDilJzilIDilIAgbGliYXRv
bWljLnNvLjEgLT4gbGliYXRvbWljLnNvLjEuMi4wCuKUgsKgwqAg4pSc4pSA4pSAIGxpYmF0b21p
Yy5zby4xLjIuMArilILCoMKgIOKUnOKUgOKUgCBsaWJnY2Nfcy5zbwrilILCoMKgIOKUnOKUgOKU
gCBsaWJnY2Nfcy5zby4xCuKUgsKgwqAg4pSc4pSA4pSAIGxpYnN0ZGMrKy5hCuKUgsKgwqAg4pSc
4pSA4pSAIGxpYnN0ZGMrKy5zbyAtPiBsaWJzdGRjKysuc28uNi4wLjI5CuKUgsKgwqAg4pSc4pSA
4pSAIGxpYnN0ZGMrKy5zby42IC0+IGxpYnN0ZGMrKy5zby42LjAuMjkK4pSCwqDCoCDilJzilIDi
lIAgbGlic3RkYysrLnNvLjYuMC4yOQrilILCoMKgIOKUlOKUgOKUgCBsaWJzdXBjKysuYQrilJzi
lIDilIAgbGliNjQK4pSCwqDCoCDilJTilIDilIAgbHA2NGQK4pSCwqDCoCAgICAg4pSc4pSA4pSA
IGxpYmFubC5zby4xCuKUgsKgwqAgICAgIOKUnOKUgOKUgCBsaWJjLnNvLjYK4pSCwqDCoCAgICAg
4pSc4pSA4pSAIGxpYmRsLnNvLjIK4pSCwqDCoCAgICAg4pSc4pSA4pSAIGxpYm0uc28uNgrilILC
oMKgICAgICDilJzilIDilIAgbGlibnNsLnNvLjEK4pSCwqDCoCAgICAg4pSc4pSA4pSAIGxpYnB0
aHJlYWQuc28uMArilILCoMKgICAgICDilJzilIDilIAgbGlicmVzb2x2LnNvLjIK4pSCwqDCoCAg
ICAg4pSc4pSA4pSAIGxpYnJ0LnNvLjEK4pSCwqDCoCAgICAg4pSc4pSA4pSAIGxpYnRocmVhZF9k
Yi5zby4xCuKUgsKgwqAgICAgIOKUlOKUgOKUgCBsaWJ1dGlsLnNvLjEKCldpdGhvdXQgdGhpcyBw
YXRjaCwgb25seSB0aGUgZmlsZXMgaW4gYGxpYjY0L2xwNjRkYCBhcmUgY29waWVkIHRvIHRoZQp0
YXJnZXQgc2luY2UgdGhpcyBpcyB0aGUgJEFSQ0hfTElCX0RJUi4gJFNVUFBPUlRfTElCX0RJUiBp
cyBlbXB0eSBzaW5jZQpsaWJzdGRjKysuYSBpcyBpbiB0aGUgc3lzcm9vdC4gSXQncyBqdXN0IG5v
dCB1bmRlciAkQVJDSF9MSUJfRElSLgoKQmFzZWQgb24gdGhlIGNvbW1lbnRzLCBpdCBsb29rcyBs
aWtlICRTVVBQT1JUX0xJQl9ESVIgd2FzIGludGVuZGVkIGZvcgp0aGUgY2FzZSB3aGVuIHRoZSBz
dXBwb3J0IGxpYnJhcmllcyB3ZXJlIHNvbWV3aGVyZSBjb21wbGV0ZWx5IG91dHNpZGUgb2YKdGhl
IHN5c3Jvb3QuIEFueXdoZXJlIG91dHNpZGUgb2YgJEFSQ0hfTElCX0RJUiB3b3VsZCBzZWVtIHRv
IGhhdmUgdGhlCnNhbWUgZWZmZWN0IG9mIGJlaW5nIG1pc3NlZCBieSB0aGUgY29weSwgdGhvdWdo
LgoKU2VlIHRoZSBmb2xsb3dpbmcgbGluayBmb3IgdGhlIFJJU0MtViBDcm9zc3Rvb2wtTkcgY29u
ZmlndXJhdGlvbjoKaHR0cHM6Ly9naXRodWIuY29tL2Nyb3NzdG9vbC1uZy9jcm9zc3Rvb2wtbmcv
YmxvYi83ZjgwNDQ3YzVmNjZmNTg4ZTU3ZWIzZGEwODdiMjdlYjJiMGM4ZWVjL3NhbXBsZXMvcmlz
Y3Y2NC11bmtub3duLWxpbnV4LWdudS9jcm9zc3Rvb2wuY29uZmlnCgpTaWduZWQtb2ZmLWJ5OiBG
cmFuayBIdW5sZXRoIDxmaHVubGV0aEB0cm9vZG9uLXNvZnR3YXJlLmNvbT4KLS0tCiB0b29sY2hh
aW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsg
Yi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsK
aW5kZXggMjk5YjYwMDhhYS4uNDA3MGNmZGMxZiAxMDA2NDQKLS0tIGEvdG9vbGNoYWluL3Rvb2xj
aGFpbi1leHRlcm5hbC9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rCisrKyBiL3Rvb2xjaGFpbi90
b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawpAQCAtNDM1LDcgKzQz
NSw3IEBAIGRlZmluZSBUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9TWVNST09UX0xJQlMKIAlB
UkNIX1NZU1JPT1RfRElSPSIkKGNhbGwgdG9vbGNoYWluX2ZpbmRfc3lzcm9vdCwkKFRPT0xDSEFJ
Tl9FWFRFUk5BTF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZMQUdTKSkiIDsgXAogCUFSQ0hf
TElCX0RJUj0iJChjYWxsIHRvb2xjaGFpbl9maW5kX2xpYmRpciwkKFRPT0xDSEFJTl9FWFRFUk5B
TF9DQykgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0ZMQUdTKSkiIDsgXAogCVNVUFBPUlRfTElCX0RJ
Uj0iIiA7IFwKLQlpZiB0ZXN0IGBmaW5kICQke0FSQ0hfU1lTUk9PVF9ESVJ9IC1uYW1lICdsaWJz
dGRjKysuYScgfCB3YyAtbGAgLWVxIDAgOyB0aGVuIFwKKwlpZiB0ZXN0IGBmaW5kICQke0FSQ0hf
TElCX0RJUn0gLW5hbWUgJ2xpYnN0ZGMrKy5hJyB8IHdjIC1sYCAtZXEgMCA7IHRoZW4gXAogCQlM
SUJTVERDUFBfQV9MT0NBVElPTj0kJChMQU5HPUMgJChUT09MQ0hBSU5fRVhURVJOQUxfQ0MpICQo
VE9PTENIQUlOX0VYVEVSTkFMX0NGTEFHUykgLXByaW50LWZpbGUtbmFtZT1saWJzdGRjKysuYSkg
OyBcCiAJCWlmIFsgLWUgIiQke0xJQlNURENQUF9BX0xPQ0FUSU9OfSIgXTsgdGhlbiBcCiAJCQlT
VVBQT1JUX0xJQl9ESVI9YHJlYWRsaW5rIC1mICQke0xJQlNURENQUF9BX0xPQ0FUSU9OfSB8IHNl
ZCAtciAtZSAnczpsaWJzdGRjXCtcK1wuYTo6J2AgOyBcCi0tCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
