Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBF6CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DC8605F1;
	Sun, 11 Oct 2026 13:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TybgsG5C3XQY; Sun, 11 Oct 2026 13:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E95C86060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724269;
	b=rxF0cKS/+Hkw8Hxb6FlIzWL1/vAPDmN7fQbVSVqYaMnvlZpqz6FfBDigkAh1kPJTYNh3
	 NlM38GWhWe9Z8xxB7DoY/+HB+C+4e1ALFDqCY+eYV8CeI0iStyFxDLpuJRSB8/MSkGeR1
	 z4e7LSAeOiKOsz3ZtcB+yso8sH0qHrstdSHbxzwzuDdCUs0kAu1nl5juv6EBh2yIHeOi0
	 K9QVO8cI8F0+XRgbXWwDOPSTaCE8knBdzbmz543UnDBxf6WKSqCKDAvY2/8+s6h+Oyx5z
	 elIiTcJwm6YWVKNdqso/+Y/9d+nY+LzakV4H2VF/2CLaTeuCki57IGTDbute69EkQ1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t3yDO63WICk1xs+koeFtKEei9c1Z40dJ99od9Uifjj8=;
	b=EMvW7SrDPtT54Hc3Ab2DSv4+rv5J63EsHX8NZf5oZDT6fC+KXnsCLrnqLCNdTAvnuozq
	 rCku2a7kAri7BSoFhPEEDRW6XURjIlX6NhttPMZQ+8ZD4I97hAbQhfYv8Vy/gUq+Oqrko
	 jhs7p+dkxMxJwRltzW/yEa0wQemBPEr6qqxN0riLHZqjrqS7DLu7WtFJyGSbk9Z4ZrBT8
	 gCMXeHwkLRGHv/1tvTL1BuscUX0cWY7dka7EosErRPt/x8mRfGSbDpmuSH2YWDQIWWixS
	 wxwrEtCL6/hC3cuyTrV+Q1AlsdXf8yl/ENy5iLx34HsJvDuFvnm+yN34DDSL467DT6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=WCGnF0Id;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724269;
	bh=t3yDO63WICk1xs+koeFtKEei9c1Z40dJ99od9Uifjj8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCm0ezx4ckGzYyRK1kZwTK1GBdj4AOjVrSbYh2YMHwwawrDu8FvrbZeBxyo3gTxY/
	 Rkg/Lg3UG4BDKSn2EY2m+G/rOmsAIWTZVxQfAdFGymeU49PRnt7eqhmhQey5tpDMnz
	 hhGkxKdjbGqegEY186wlMWMyZT6iJf3cZffZijRno8IAtJka5HgagEcLXTfdNX7mlS
	 Ky1gc8C6yv5TP/YaNa8WSGk27gtIYmhFr6qqe5FrByxq1mOr5jwn62TPb1jiDvyV7S
	 uR4Lofn/WUGDZSnbsieMMVRdE8WqrT+a5As3x2ar7VVHbMTTBjf2OW9ZzrCADP1Eux
	 qep7rm1vRVeEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E95C86060E;
	Sun, 11 Oct 2026 13:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E0D175
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5364F6060E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vte5gdgIVQx4 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FFD6605F1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724266;
 b=SyL5e7WLN/U3xmynOzyHyS93FN2S83Tfmb5k/e3kCOTGbvhIVQfH2yu2UzYPnyvbQPrD
 Xxw/rkyPZyaKxSsDfHRC6i+7xJWAxdys/noNujo2OrFlCmhXpryuqj1FOID+RKv+SWjZj
 RLTM0S4D6ZemGKaQa3V1XLc3EdIVW1FwXn8cPaHZ4RSby/SheqBgOFpPv5u/c4fTZA3TY
 PxhsXtjiXUHp7IixnjLuPp/kMY+qj0RWVwCucnm0dS0/L2on150tyuSCltcSzmRfv33I1
 pe+tQV2rVw/euC/MoEBq990uJFro8n9GCnrhJo2lQNqApkFXImOeuc6aERxezSdKWkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724266;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iK0j/K+K5NkVMN7uODGqGzaLq/rJ1hIdh9J3vFZHAa8=;
 b=PAI5vXB3qCjdx5xduRaR+CMdxJSwg9Co+nAcNPEceCm6SpWS+midcHoWMrclCEmbAB6W
 nnLSI5cHBFqCniXaa/w9dDwtRyskUb8HSI/XswhGuUxJJ51BkW3vElA+1iIOn30LssamY
 wQWi+dz0NwVEOcF6ujm5SWP2g2RfEI7ughSzelP5T/rb+FNNSjXwsYKgRpECrEXHBfhLT
 onw8zyCl0Poq8tNmVvkelYhMu0ZCAZ0xv6sK37Fkk8aQR7qIMMw7W6OBGUQPYzf+PYsjF
 +tSOU0V5OT+/Qf4gFtcU50anr/IlDruFNS9NYyggu4aYJNf6C1Te0DUGNafIgdtPUlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WCGnF0Id; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WCGnF0Id
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FFD6605F1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723685;
 bh=iK0j/K+K5NkVMN7uODGqGzaLq/rJ1hIdh9J3vFZHAa8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WCGnF0Id+3lcXjdRlrmrU0riYOYtiJQ0WTvkQnMF0em7wmwFy53FjBbK443vHyy7G
 49Dq4PxXYryiKYoJwEEtUl9N36eivo804MXJPz1L9ncFdrncr9uWQwnsExIhMu+pH0
 mYVW2/WJkghV2Kr5hyp5hOJKhPhGxaFVpihPEc3KbL7dreQ/RievH8r7T+6yj+vjOw
 +OAw9n2qzsX2piMK/fRa0iwt/VeQBQ6hyMKMnbu8Zvvfrb6RDPvNtdcu/soFCSHtXj
 R7js5lvu0OF5eg/49sl81CTgcDwLO98hVx6TfvYZhuZUHOx8iWnKi3wkWlB0BO6lhI
 t4UNUcs5s5Evw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 UXaKSCjr0OcIR2rxr3OSclEqXpfIuKl522p1OHdL5jXFToGRExm5FF6yrdqjycq6CFzw/NZJz79
 Ratj8b7SnWD4CJy1qxjG2GBJWP2CuLlaPJ1+YGD9/nnSFXOb9ve/rxKPx9GvfguxhUxbBjp3YId
 U++4F+r6hTEtgIGwdOw05wL9ilVEzxaAEjg5o8T9jAXyAYp9MbJ1bMEk6WcHOijZGelaOOklf7N
 bH99yvX6p/YpBrfFZ/c3ahogzPoTTWdH7KhtgtAIkEd8vPjyCMb9HnU//7oX3ZpLXxvnHq5cYlf
 vc9fdA9TzBpe8fkFLMHfgFBcuDbzRlKnt/mIIREKk7BZD9L6n8cttPIu/HKP05sBwNSbz3RiQ8I
 SDZsPutelBTjZFXSzgIjAIeYW6CmoukJGnSV08nvhOccKnqEJJjDE4iJnKAoUmO6NfjPnJ784b2
 xAIHNEI6gxI//d3ibyFUb6Uq5/GNzutwht1WqX6f9C1xxUOgd1I4JWrGJAHc8mA/7eB1jQqifwb
 QSm8p+Ww5iygSMBR+0Iz/fU66wejiF3tg+HtyV228Hx9r4aVYM2
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 166F6A4C58B4
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAp-000000007Fz-0np7
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:55 +0200
Message-ID: <20261011130058.3443432-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v9 50/52] package/ncurses: install wide-char
 headers in usr/include/ncursesw/
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

UHl0aG9uIDMuMTUgY2hhbmdlZCBpdHMgbmN1cnNlcyB3aWRlLS9ub24td2lkZS1jaGFyIGRldGVj
dGlvbiBhbmQgbm93CnJlbGllcyBvbiBkZXRlY3RpbmcgdGhlIGNvcnJlY3QgaGVhZGVyczoKaHR0
cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC8zODNjN2JkMzhhNWYwOTIzZGI0
OGY2N2ZkYTlkODUyZDE4OTkyMWU2CgpCdWlsZHJvb3QgdG9vbGNoYWluIHg4Ni02NC1jb3JlLWk3
LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDI2LjA4LTEKY29udGFpbnMgdGhlIG5vbi13aWRlLWNo
YXIgdmVyc2lvbiBvZiBzeXNyb290L3Vzci9pbmNsdWRlL2N1cnNlcy5oCndoaWNoIG92ZXJ3cml0
ZXMgdGhlIHdpZGUtY2hhciB2ZXJzaW9uIHByb3ZpZGVkIGJ5IHRoZSBuY3Vyc2VzIHBhY2thZ2UK
ZHVyaW5nIHRoZSBjb25maWd1cmUvcnN5bmMgc3RhZ2Ugb2YgdGhlIHB5dGhvbjMgcGFja2FnZSBp
biB0aGUgY2FzZSBvZgpCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eS4gVGhlIHRvb2xjaGFp
biBwYWNrYWdlIGlzIHNvcnRlZCBhbHBoYS0KYmV0aWNhbGx5IGFmdGVyIHRoZSBuY3Vyc2VzIHBh
Y2thZ2UuCgpUbyBwcm92aWRlIGNvcnJlY3QgaGVhZGVycyBmb3IgdGhlIHB5dGhvbjMgcGFja2Fn
ZSBhbmQgdG8gbm90IGludGVyZmVyZQp3aXRoIG90aGVyIGJ1aWxkcm9vdCBwYWNrYWdlcyB3ZSBh
ZGRpdGlvbmFsbHkgaW5zdGFsbCBvbmx5IHRoZSB3Y2hhci0KZW5hYmxlZCBoZWFkZXJzIGluIHVz
ci9pbmNsdWRlL25jdXJzZXN3LyB3aGljaCBpcyB0ZXN0ZWQgYnkgcHl0aG9uMwpjb25maWd1cmUg
YmVmb3JlIHVzci9pbmNsdWRlLzoKaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2Js
b2IvdjMuMTUuMHJjMy9jb25maWd1cmUuYWMjTDcxNDkKCkNvbmZpZ3VyZSBsb2cgc25pcHBldCBv
ZiBweXRob24zIHdpdGhvdXQgdGhpcyBwYXRjaDoKCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy4uLiB5
ZXMKY2hlY2tpbmcgZm9yIHBhbmVsdy4uLiB5ZXMKY2hlY2tpbmcgZm9yIG5jdXJzZXN3L2N1cnNl
cy5oLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy9uY3Vyc2VzLmguLi4gbm8KY2hlY2tpbmcg
Zm9yIG5jdXJzZXN3L3BhbmVsLmguLi4gbm8KY2hlY2tpbmcgZm9yIG5jdXJzZXMvY3Vyc2VzLmgu
Li4gbm8KY2hlY2tpbmcgZm9yIG5jdXJzZXMvbmN1cnNlcy5oLi4uIG5vCmNoZWNraW5nIGZvciBu
Y3Vyc2VzL3BhbmVsLmguLi4gbm8KY2hlY2tpbmcgZm9yIGN1cnNlcy5oLi4uIHllcwpjaGVja2lu
ZyBmb3IgbmN1cnNlcy5oLi4uIHllcwpjaGVja2luZyBmb3IgcGFuZWwuaC4uLiB5ZXMKY2hlY2tp
bmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyBpbml0c2NyLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tp
bmcgZm9yIGxpYnJhcnkgY29udGFpbmluZyB1cGRhdGVfcGFuZWxzLi4uIG5vbmUgcmVxdWlyZWQK
Y2hlY2tpbmcgd2hldGhlciBjdXJzZXMgc3VwcG9ydHMgd2lkZSBjaGFyYWN0ZXJzLi4uIG5vCmNo
ZWNraW5nIGZvciB0ZXJtLmguLi4geWVzCgpjb25maWcubG9nIGNvbnRhaW5zOgpjb25maWd1cmU6
Mjk4NjE6IGNoZWNraW5nIHdoZXRoZXIgY3Vyc2VzIHN1cHBvcnRzIHdpZGUgY2hhcmFjdGVycwpb
Li4uXQpjb25mdGVzdC5jOjUzNTo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24gJ3NldGNjaGFyJzsKIGRpZCB5b3UgbWVhbiAnZ2V0Y2hhcic/IFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQogIDUzNSB8ICAgICAgICAgc2V0Y2NoYXIoJndjdmFsLCBMIngi
LCBBX05PUk1BTCwgMCwgTlVMTCk7CgpDb25maWd1cmUgbG9nIHNuaXBwZXQgb2YgcHl0aG9uMyB3
aXRoIHRoaXMgcGF0Y2g6CgpjaGVja2luZyBmb3IgbmN1cnNlc3cuLi4geWVzCmNoZWNraW5nIGZv
ciBwYW5lbHcuLi4geWVzCmNoZWNraW5nIGZvciBuY3Vyc2Vzdy9jdXJzZXMuaC4uLiB5ZXMKY2hl
Y2tpbmcgZm9yIG5jdXJzZXN3L25jdXJzZXMuaC4uLiBubwpjaGVja2luZyBmb3IgbmN1cnNlc3cv
cGFuZWwuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIG5jdXJzZXMvY3Vyc2VzLmguLi4gbm8KY2hlY2tp
bmcgZm9yIG5jdXJzZXMvbmN1cnNlcy5oLi4uIG5vCmNoZWNraW5nIGZvciBuY3Vyc2VzL3BhbmVs
LmguLi4gbm8KY2hlY2tpbmcgZm9yIGN1cnNlcy5oLi4uIHllcwpjaGVja2luZyBmb3IgbmN1cnNl
cy5oLi4uIHllcwpjaGVja2luZyBmb3IgcGFuZWwuaC4uLiB5ZXMKY2hlY2tpbmcgZm9yIGxpYnJh
cnkgY29udGFpbmluZyBpbml0c2NyLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tpbmcgZm9yIGxpYnJh
cnkgY29udGFpbmluZyB1cGRhdGVfcGFuZWxzLi4uIG5vbmUgcmVxdWlyZWQKY2hlY2tpbmcgd2hl
dGhlciBjdXJzZXMgc3VwcG9ydHMgd2lkZSBjaGFyYWN0ZXJzLi4uIHllcwpjaGVja2luZyBmb3Ig
dGVybS5oLi4uIHllcwoKVGhlIHJlbGV2YW50IGxpbmUgaXMgJ2NoZWNraW5nIHdoZXRoZXIgY3Vy
c2VzIHN1cHBvcnRzIHdpZGUgY2hhcmFjdGVycycKd2hpY2ggbmVlZHMgdG8gaGF2ZSAneWVzJyBh
cyByZXN1bHQgd2hlbiBuY3Vyc2VzIGlzIGNvbmZpZ3VyZWQgd2l0aApCUjJfUEFDS0FHRV9OQ1VS
U0VTX1dDSEFSPXksIG90aGVyd2lzZSB0aGUgcHl0aG9uMyBidWlsZCBpcyBicm9rZW46CgouL01v
ZHVsZXMvX2N1cnNlc21vZHVsZS5jOiBJbiBmdW5jdGlvbiDigJhfY3Vyc2VzX3dpbmRvd19hZGRj
aF9pbXBs4oCZOgouL01vZHVsZXMvX2N1cnNlc21vZHVsZS5jOjEwMDk6MTU6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZgogZnVuY3Rpb24g4oCYc2V0Y2NoYXLigJk7IGRpZCB5b3UgbWVh
biDigJhnZXRjaGFy4oCZPwogWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCi4vTW9k
dWxlcy9fY3Vyc2VzbW9kdWxlLmM6MTAxNToxOTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mCiBmdW5jdGlvbiDigJhtdndhZGRfd2No4oCZOyBkaWQgeW91IG1lYW4g4oCYbXZ3YWRkY2ji
gJk/CiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLi9Nb2R1bGVzL19jdXJzZXNt
b2R1bGUuYzoxMDE5OjE5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gbwpmIGZ1bmN0aW9u
IOKAmHdhZGRfd2No4oCZOyBkaWQgeW91IG1lYW4g4oCYd2FkZGNo4oCZPwogWy1XaW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dCgpUaGlzIHBhdGNoIHNob3VsZCBhbHNvIGZpeCBzaW1pbGFy
IHByb2JsZW1zOgpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDI0LVNlcHRlbWJlci83NjMxNzkuaHRtbApodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
cGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LUphbnVhcnkvNzcwMjE1Lmh0bWwKClRoZSBzcGVjaWZp
YyBwcm9ibGVtIHcuci50LiB0byBwZXItcGFja2FnZSBkaXJlY3RvcmllcyB3YXMgYWxzbwpkaXNj
dXNzZWQ6Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIw
MjEtQXVndXN0LzY4NDExOS5odG1sCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRA
a3VobHMubmV0PgotLS0KIHBhY2thZ2UvbmN1cnNlcy9uY3Vyc2VzLm1rIHwgNyArKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uY3Vy
c2VzL25jdXJzZXMubWsgYi9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawppbmRleCA1ZTIwNzc1
MDBhLi5hOWIyZjA4OWE0IDEwMDY0NAotLS0gYS9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawor
KysgYi9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawpAQCAtODUsNiArODUsMTIgQEAgTkNVUlNF
U19DT05GX09QVFMgKz0gLS1lbmFibGUtd2lkZWMKIE5DVVJTRVNfTElCX1NVRkZJWCA9IHcKIE5D
VVJTRVNfTElCUyA9IG5jdXJzZXMgbWVudSBwYW5lbCBmb3JtCiAKK2RlZmluZSBOQ1VSU0VTX0NP
UFlfV0NIQVJfSEVBREVSUworCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UxKSAtQyAkKEBEKSBc
CisJCUlOQ0xVREVESVI9JChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvbmN1cnNlc3cgXAorCQlp
bnN0YWxsLmluY2x1ZGVzCitlbmRlZgorCiBkZWZpbmUgTkNVUlNFU19MSU5LX0xJQlNfU1RBVElD
CiAJJChmb3JlYWNoIGxpYiwkKE5DVVJTRVNfTElCUzolPWxpYiUpLCBcCiAJCWxuIC1zZiAkKGxp
YikkKE5DVVJTRVNfTElCX1NVRkZJWCkuYSAkKFNUQUdJTkdfRElSKS91c3IvbGliLyQobGliKS5h
CkBAIC0xMTYsNiArMTIyLDcgQEAgTkNVUlNFU19MSU5LX1NUQUdJTkdfUEMgPSAkKGNhbGwgTkNV
UlNFU19MSU5LX1BDKQogCiBOQ1VSU0VTX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1leHQtY29sb3Jz
CiAKK05DVVJTRVNfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0gTkNVUlNFU19DT1BZX1dD
SEFSX0hFQURFUlMKIE5DVVJTRVNfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0gTkNVUlNF
U19MSU5LX1NUQUdJTkdfTElCUwogTkNVUlNFU19QT1NUX0lOU1RBTExfU1RBR0lOR19IT09LUyAr
PSBOQ1VSU0VTX0xJTktfU1RBR0lOR19QQwogZWxzZQotLSAKMi40Ny4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
