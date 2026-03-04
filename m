Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E9AEB7EA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B6A5812BC;
	Wed,  4 Mar 2026 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FCBoD-wBCRu; Wed,  4 Mar 2026 08:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A7A28104F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772612573;
	bh=KJ1TpN/zyNuDLJknx3NthMeGpGsH9mPcy93cm3l1E9s=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KiBVRgyoYWmqz/r7IEqdNs5xyznwFUxLALGXPxPRrBTqtpXpo3VLGIQCJt9f7tiC2
	 oI+kwW9lWMlEriW25YbE322Sse3CY6OBGOJoPwpg77qTVUEFBS19toRtREzwdJrCz/
	 e0RKZZJNq/pxJ+3/ETwbD23seRFKasgYvRkBQFhq5l8i422eypF06OSgAN7FA8cm+b
	 +DoCBo9InMf6wC7uy6lOO8lyL3JZGz0PrjkFoE5fJqNWtr7GGj6xMy5WZl2QnNLIDZ
	 XchVsY0W98BpxRNuTvespusJk875+ABUfra7K8NJZi5vjOQREqGanEUWL9sxybW6fe
	 WrZjWtIwv6RjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A7A28104F;
	Wed,  4 Mar 2026 08:22:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D68231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E58EE6071E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aj5zXDrhsjvJ for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 08:22:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2C5D60689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C5D60689
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2C5D60689
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A89EE4E42535
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F62D5FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 08:22:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB6C71036960A; Wed,  4 Mar 2026 09:22:45 +0100 (CET)
Date: Wed, 04 Mar 2026 09:22:38 +0100
Message-Id: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMszUVXiRCrqQbCxJEIxLsnL
 d/i/wyMkZBhbDJEfIjp9hVd28B6On+goK0aetkbqaQWd0DPqwvWh3TZdEZ0GwutdqcX1GowBmo
 bIu70/t9pLuUD8AQ0tmcAAAA=
X-Change-ID: 20260304-openscap_nptl_threads-43fa4be43566
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772612565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=zufcLVyQvcP5BWcIRz3t0egXUMevwqScP2vQzCdTjZE=;
 b=y50YKj0QtkrMOPY2ruqQ/HcVawwraWQOcEntWZ8K4TAPXqgn6kO/XJZvF+1NNAEGlzkPw7
 6lfUiqBoidQx1B7Wek4aPtl9cMjCpBmhdPdYMuWN+60SSztfkofQon3ke7o+arpKPez9me
 vho9XHf0Y22VFa3iLJIxrX9/IlfwYK1tp6sG2ILU9mfiQM2354BR8kz2hFak9CIS96dMG3
 PGuVpr/m6YxsP9fLZPYRBFo93LULXRtffFkYMO7jmrbjr2mraT6JwuRkdQc4g9USW26FDQ
 sX46tCfeHHQZFnI+DC5mSsiTREbIAF33Qk9bmjeID27zN6EEKV9U5VrsaZd07A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=y50YKj0Q
Subject: [Buildroot] [PATCH 0/2] package/openscap: fix build failure for
 openscap
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

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gZml4IHlldCBhbm90aGVyIGJ1aWxkIGZh
aWx1cmUgZGV0ZWN0ZWQgYnkgdGhlCmF1dG9idWlsZGVyIGZvciB0aGUgcmVjZW50bHkgbWVyZ2Vk
IG9wZW5zY2FwIHBhY2thZ2UuCi0gZmlyc3QgY29tbWl0IGZpeGVzIGFuIHVucmVsYXRlZCBpc3N1
ZSBhYm91dCB3cm9uZyBjb21tZW50IG1hbmFnZW1lbnQKICB3aGVuIG1pc3NpbmcgZGVwZW5kZW5j
aWVzCi0gc2Vjb25kIGNvbW1pdCBmaXhlcyB0aGUgYnVpbGQgZmFpbHVyZSByYWlzZWQgYnkgWzFd
CgpBbGV4aXMKClsxXSBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMmQ5
NDc1YjdjZDJkNDEzYzk5ZDYyMzNlYmIyMTNiYzkzMmYxZTM5OC8KClNpZ25lZC1vZmYtYnk6IEFs
ZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpBbGV4aXMgTG90
aG9yw6kgKDIpOgogICAgICBwYWNrYWdlL29wZW5zY2FwOiBmaXggZGVwZW5kZW5jaWVzIGRvYwog
ICAgICBwYWNrYWdlL29wZW5zY2FwOiBhZGQgZGVwZW5kZW5jeSBvbiBOUFRMIHRocmVhZHMKCiBw
YWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiB8IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogMzQ2ZDY2Njdm
ZWJkYmVjOWEzYzU3ZTQ3MDA5YWIyMWUxMjFiNWIxZApjaGFuZ2UtaWQ6IDIwMjYwMzA0LW9wZW5z
Y2FwX25wdGxfdGhyZWFkcy00M2ZhNGJlNDM1NjYKCkJlc3QgcmVnYXJkcywKLS0gCkFsZXhpcyBM
b3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
