Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE15C5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 18:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D762810E8;
	Thu, 30 Jul 2026 18:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwHhS9mzExk5; Thu, 30 Jul 2026 18:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A464811AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785434795;
	bh=Y381rfFSBQaxtXjS7QhRPG5O4lSOhAccja5jqu8547E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XRmMNf0v8+kEo/EphkzZ0s9XYhouKQCkTdRB3k7meBEabWqBQBmJ+Me8Yq5aCcJ7h
	 Unyw8LTIc8hk7F0NhJXqRKz79fkMwkXYkyyVjGAeKsj76ZFy/gt04or1lCfvn78nor
	 yWPYS85Tk+HwqrDDTULJ/CHom0VV0GWtbTR9Hpjx/zAiMfdPXOyd/KI8vOkZKl28g5
	 aCED4cCQ7WEkZ2hlu2ETnurRgmmABXmbaJAvk/j2v/I6DjlmY/eSoK5vVRR/Lg4wta
	 DgLMWpeKRdsW7tWTN2yAQ4QE7F/cSK6tpAyd25vjAVVtYTs5pX0SjGa1XNA2qTqgHs
	 sJO7v/OVX3Vcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A464811AB;
	Thu, 30 Jul 2026 18:06:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7EFD352
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADE68400C5
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yg9AFjTVpDsr for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 18:06:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=laszlo.ersek@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8E6640094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8E6640094
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8E6640094
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:06:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9E421650;
 Thu, 30 Jul 2026 11:06:27 -0700 (PDT)
Received: from e131404.arm.com (unknown [10.57.40.101])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CA173F66F;
 Thu, 30 Jul 2026 11:06:30 -0700 (PDT)
From: Laszlo Ersek <laszlo.ersek@arm.com>
To: laszlo.ersek@arm.com
Cc: Arnout Vandecappelle <arnout@mind.be>,
 Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
Date: Thu, 30 Jul 2026 20:06:24 +0200
Message-ID: <20260730180627.1224385-1-laszlo.ersek@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1785434791; bh=Pf2UqcEPM3fRNql6kZ7cgBtQFqQt20HeFgJcz7QpzyY=;
 h=From:To:Cc:Subject:Date:From;
 b=b6+JUUsH662WDSqigONcS+BVilcIGSypRlhCnS2wwkIC2BpMfw+93mxPKunviLLfo
 mPxut4XJgvh4gNGm0tA5u41eQk5PLiY4XltcDqjgqNZwzbz/oQ5WBds6YjV8Hf8doT
 MtmeC3Uzmz5wW7OqhMqb8n/CeCY/AlalFy04hZM8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=b6+JUUsH
Subject: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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

Q29tbWl0IDBiOWVmYzk5MWY4YSAowqtsaW51eDogdXNlIEJSMl9NQUtFwrssIDIwMjMtMDQtMTAp
IHJlcGxhY2VkICQoTUFLRSkKd2l0aCAkKEJSMl9NQUtFKSBpbiBhIG51bWJlciBvZiByZWNpcGVz
LiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgY2hpbGQgbWFrZQppcyB1bmFibGUgdG8gZGlzY292ZXIg
dGhlIGpvYiBzZXJ2ZXIsIGFuZCB3ZSBnZXQgYSB3YXJuaW5nIHN1Y2ggYXMKCj4gd2FybmluZzog
am9ic2VydmVyIHVuYXZhaWxhYmxlOiB1c2luZyAtajEuIEFkZCBgKycgdG8gcGFyZW50IG1ha2Ug
cnVsZS4KCmh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvbWFrZS9tYW51YWwvaHRtbF9ub2Rl
L0Vycm9yLU1lc3NhZ2VzLmh0bWwKaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtlL21h
bnVhbC9odG1sX25vZGUvTUFLRS1WYXJpYWJsZS5odG1sCgpJbmZvcm0gdGhlIHBhcmVudCBNYWtl
LCBieSBwcmVmaXhpbmcgdGhlIHJlY2lwZSB3aXRoICIrIiwgdGhhdCAkKEJSMl9NQUtFKQpjYW4g
ZGVhbCB3aXRoIHRoZSBqb2Igc2VydmVyLgoKQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4KQ2M6IE9sZWcgTHlvdmluIDxvdmxldmluQHNiZXJkZXZpY2VzLnJ1PgpDYzog
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKU2lnbmVkLW9mZi1ieTogTGFzemxvIEVyc2VrIDxsYXN6
bG8uZXJzZWtAYXJtLmNvbT4KLS0tCgpOb3RlczoKICAgIENvbW1pdCAwYjllZmM5OTFmOGEgcmVw
bGFjZXMgbXVsdGlwbGUgaW5zdGFuY2VzIG9mICQoTUFLRSkgd2l0aAogICAgJChCUjJfTUFLRSk7
IEknbSBvbmx5IHByZWZpeGluZyB0aGUgb25lIHJlY2lwZSB3aXRoICIrIiB0aGF0IHNlZW1zIHRv
CiAgICBjYXVzZSB0aGUgbW9zdCBub3RpY2VhYmxlIHNsb3dkb3duIGZvciBtZSAoYnkgbWlzc2lu
ZyBvdXQgb24gYSBwYXJhbGxlbAogICAga2VybmVsIGJ1aWxkKS4KCiBsaW51eC9saW51eC5tayB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKaW5kZXggZTc5MGRhZmY2
NjA4Li44MDU4MTA4MWE3ZWIgMTAwNjQ0Ci0tLSBhL2xpbnV4L2xpbnV4Lm1rCisrKyBiL2xpbnV4
L2xpbnV4Lm1rCkBAIC02OTYsNyArNjk2LDcgQEAgbGludXgtcmVidWlsZC13aXRoLWluaXRyYW1m
czogcm9vdGZzLWNwaW8KIGxpbnV4LXJlYnVpbGQtd2l0aC1pbml0cmFtZnM6CiAJQCQoY2FsbCBN
RVNTQUdFLCJSZWJ1aWxkaW5nIGtlcm5lbCB3aXRoIGluaXRyYW1mcyIpCiAJIyBCdWlsZCB0aGUg
a2VybmVsLgotCSQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01BS0UpICQoTElOVVhfTUFLRV9GTEFH
UykgLUMgJChMSU5VWF9ESVIpICQoTElOVVhfVEFSR0VUX05BTUUpCisJKyQoTElOVVhfTUFLRV9F
TlYpICQoQlIyX01BS0UpICQoTElOVVhfTUFLRV9GTEFHUykgLUMgJChMSU5VWF9ESVIpICQoTElO
VVhfVEFSR0VUX05BTUUpCiAJJChMSU5VWF9BUFBFTkRfRFRCKQogCSMgQ29weSB0aGUga2VybmVs
IGltYWdlKHMpIHRvIGl0cyh0aGVpcikgZmluYWwgZGVzdGluYXRpb24KIAkkKGNhbGwgTElOVVhf
SU5TVEFMTF9JTUFHRSwkKEJJTkFSSUVTX0RJUikpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
