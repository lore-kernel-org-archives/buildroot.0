Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC5F53D78
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 17:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABCC28220B;
	Mon, 16 Mar 2026 17:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rjg6UVXz5iez; Mon, 16 Mar 2026 17:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C950821F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773680580;
	bh=EdrS1j7dMzW7G6odIK5d/QQShgas3VAEjN3W41qc4KE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XPIHvYUHlS91kx9fJSZU4ljC81Bb2LMTWcLQg339ZHCWUricXbtxX/R2I7tTjLuJ3
	 7hwlR6LPIXhl3aDGqYshXJgHPOnYnW1CFORS2/2RXTI8S1wG9/SRLOdXnyEP+ExfWE
	 oCWy9iFs2IpPh6gl+2tDvkyrs1HkVizuBhgcl0kFqxyaHS7MREAutsSgxqglPAeLx3
	 JTFoEt7hMTGrCKHm2If9CGDkaICntlgyfO+dQ2t3KyG3Mem2djB9YIhJ+AyKdnfl/N
	 fqvI3kmnm8yLFE2HRPaSiXwcH/YSYzNbH8qaZNv/ng/oDdwaLVqFGe7kxQ7z5UXGCJ
	 Rsu5lRfyhkAsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C950821F3;
	Mon, 16 Mar 2026 17:03:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB117D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B5F640AA5
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkdOG09C9bSx for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 17:02:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0966740A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0966740A97
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0966740A97
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:02:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 576021477;
 Mon, 16 Mar 2026 10:02:50 -0700 (PDT)
Received: from debian (unknown [10.57.12.160])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E0133F73B;
 Mon, 16 Mar 2026 10:02:55 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 16 Mar 2026 18:02:44 +0100
Message-ID: <20260316170246.2414661-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 0/2] Fixes for binman after python-setuptools
 update
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

SGksCgpIZXJlIGlzIGEgY291cGxlIG9mIHBhdGNoZXMgYWZ0ZXIgdGhlIHB5dGhvbi1zZXR1cHRv
b2xzIHVwZGF0ZS4KVGhlIGRlZmNvbmZpZyBoYXMgYmVlbiB0ZXN0ZWQgdG8gYm9vdCBmcm9tIGVN
TUMgb24gYW4gSU9ULUdBVEUtaU1YOCBib2FyZC4KCkJlc3QgcmVnYXJkcywKVmluY2VudC4KCgpW
aW5jZW50IFN0ZWhsw6kgKDIpOgogIHN1cHBvcnQvdGVzdGluZzogYnVtcCB0ZXN0X2F0ZiB1LWJv
b3QgdG8gZml4IHRoZSBidWlsZAogIGNvbmZpZ3MvaW90LWdhdGUtaW14OF9lYmJyOiBidW1wIHUt
Ym9vdCB0byBmaXggdGhlIGJ1aWxkCgogY29uZmlncy9pb3QtZ2F0ZS1pbXg4X2ViYnJfZGVmY29u
ZmlnICAgfCAyICstCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2F0Zi5weSB8IDMg
KystCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0t
IAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
