Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A6FCA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B15606C0;
	Tue,  6 Oct 2026 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS9TqjeGSj2Y; Tue,  6 Oct 2026 16:29:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C0FBF6080E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304189;
	b=Q6dQPMZk1lvzs1ppNdFHUoMID63dw8QNmqBeculMq8XhOEuU3jhB/SUA0vkUw3Y3NVvH
	 ZHtWYEPkbC/TrYUftZNhHDVD9o3IYDB+v854d7rSvMh6C2AZ0zrV0DPZBqeE/o4tf7VvJ
	 5GYHPbag9etDcM1HMp+1NKeimiG63XpCXz3Q3NjS9o6yfurQBzNFn1eyDRaK43jqbuzJw
	 X004812z4GdALejEepPpqHBcxMj+Tt20sk8NCwNyHMZlfKUruVDCcxpz9WSwXbzWaADAB
	 S+DPoPXpluy3HNJnVaWKtlYkemqkQjvD2+B//j5fatigq6X41Ty0J8rxOu8FKUNZqHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t3yDO63WICk1xs+koeFtKEei9c1Z40dJ99od9Uifjj8=;
	b=mSB7WR+Aa5FhhuswfZPr9oq/QBf5SaIFgvLWpd01OqZaFzkFBmBHPYQg8tM3cCGpsnbK
	 L0eQYZlG5cZGoQSPQECg5zVpMvp8Bbr2Zx0/njAzl1mrcZAGEXfvXixNH+ifOigoBQ7Jv
	 UoD55Z7vtkjsg0EvwucFNmf3xmy4Ju2UQh/iJX5+ekmGUGR64JXKViJOoBxm3IbrRTi7p
	 9QpQC/LiiQnVmlxEK5sLuSobOVKrh0OO713sW2jM7PNysAiyUTEHqpC8wLswBrHBgEtY+
	 KgrpI60wmscd1qkRUc+qd6/+fa6C6PnZsb/WSUtGqw2QCUDshgYuq4d8oLr4xxCe3yQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304189;
	bh=t3yDO63WICk1xs+koeFtKEei9c1Z40dJ99od9Uifjj8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nW8p8hArE61Zm0qEPs3yWTFcR2WExF7ubTKlMbYCOosSiAce22PaYPqJCQiIVx7zb
	 W6LyB8UBIa0qsDOdpNW0wdczdTC8uh03B4TU5j9aPaC74Ry3lLIFuyGIvjncqMnQjO
	 bkVu+8alyRhfidPnoiNV2voe1U6S1pcoqfBt3CyYy2+CV5s0rS09fYbj3un2NYNAlB
	 t2QiuDmNM4dkjpqSt0UCxAfLAVlItToxXLyuM1xEYetR7V9lZ9WsfH+JSiAhjuGfB2
	 iNOY0Hjm1M+EiHMbJL64BwmGn5hzumC2FEDGHT2uxzmutPUqqXLW3bN6oWhGOYf5sl
	 qmHWFmelk5u0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0FBF6080E;
	Tue,  6 Oct 2026 16:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1439D317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE2C6403F8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F70KnHdA5HX for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8066D403D3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303822;
 b=Yw97ZXSZDI92ds7Wn+fW1XByKf41LPf6WdYnwSNF+WeIGMrh7pEU0bPUQ+r0xqlkxJ4p
 vkypJN9NP49/TLRLfNQu6r0MhmitqVeri+wuPiXxUK49pZxc1XadndeWVQqywCl5fcWm1
 PNEbefiJW1ZP44M+HzugSQXG9jNQIMZa8zu6lQGz8yNHdQG49W5L4JAhLwPjjBPXio1IK
 HNhAEtZyeMoLSo1sen27K5OoJvyBWR0XfMJ1HIwNK7ltEgrn1vC5SGQBFytO448H/wW+N
 RcC/+4Cipn1Pg6begjqzSDcEOzHDjxlnsV2NDgoNGmnS4RgOwGhzKLDfs9oo38HE69w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303822;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iK0j/K+K5NkVMN7uODGqGzaLq/rJ1hIdh9J3vFZHAa8=;
 b=d9NxvKrMmKc1iNB6b8Xo/mlqnTliVIXDBShMFSzZRPwxmdCnNOr5L/33TmGJWNbzIK2Y
 IiVAhCz/60Lph4OB5frtMVBURWlV+UdQfJSwVylW4tfhdQUjhUJG8QYW+Da6TXhWfI4c+
 N6urrPVrPbL+/FVeTLubl49iIzLCRo5TDgNkgGf0bSgOL2JNNnxDqznhmR1VK1j2QqTiB
 KHTGqwTsz9+h3philguptWjHagKZFapcmmLChhiunjkzuiZHYhBCnZBwkQMdAREZiAdLF
 T1xh8zWOWtg+pe+qKP53WuLFDp+/e6LQtt8uNPszhA1uY9IiT9izzLmXyYJpgND1iAg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EoV3JWL1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EoV3JWL1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8066D403D3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303702;
 bh=iK0j/K+K5NkVMN7uODGqGzaLq/rJ1hIdh9J3vFZHAa8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=EoV3JWL16grtdfeBXZy+gkymCimFGXYzX/c1SdHikYEXh70qXc9rx1p5pAI0iet9H
 sDtQNDJ8uB5eFeE2e/MT81e7pB+LoYlJAjQcwbOw60tPiqZIMhfoLNZw9XvJcJNv+v
 OrA8mXfjM3PXzt9KOJC43RDOUKhChWjbtnbxO6sUKmwoOoqVj6edAv3bPhB+aXkEoS
 F6uc8mOJucZWqTi71Ews/de5LNTpCZHEgF8qHCNweaXPffJ0b+UTftYW7zOaxls2dE
 UvKgqealUqAlwnFBlgfnXxN2t5cYFePCIwNe+1B6/GqltinfxfOpIhWvZ8aa8RdS9P
 monlCah3dQ8ng==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 m1auiL1+YNp4DfdlepbH9Nz2p7hayVNBMrE5BoXtmtf6HW1rMtZ1RjYQblpmZu6pYUp0w3ve1HG
 JloaBeDJZTk8JWdl7UZz1UOPrwRx2rfrbqikfwoX+qH4Z21pJnTYu1VxCmLFa1JTIk5xTGv+3uE
 BGQMZvhbtmfSlkkaXTPP6ztdt2B9KPGTF5E06a5KQWp+iutRr/8hgYX/8GEgSxW8x5y0kllvOzB
 ONU0yT8s6+WbfpUhySYkGQTT8OVUvMq4kK4VHGVOLYM75a+WEPAJi2Q/NmO4Z0tgconQPjMnidC
 P2Wm7pAFa6rRfURVFSeu+osiLiOay8JEldscN+aCTlH1gH7lfYkq+o81+pmU9QDHvGtvRdqfUiH
 loFnUuG/ftNrGSEjzRkcF30SrPCxZDeR5opRljVp+cQpzpJha0UO/hJKOQLV1ok8nZbmaPoHrdl
 J4MlyvGuJqMwNsAitRxm0V5ICn2KbbJyH/XQSXzY5+xT74c70AhZPnFAgst5bczANmKtrfUd0Hy
 bmNZ1M68El+SkDyEH3GBf3/ko3Vsw+vkDyv4/ukQeJkbkYseUNw
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA432A4C496C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uo-000000000ir-2X2M
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:42 +0200
Message-ID: <20261006162106.3439373-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v8 61/84] package/ncurses: install wide-char
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
