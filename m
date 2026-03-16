Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AAFF53D79
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC89E80E75;
	Mon, 16 Mar 2026 17:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uiytO0XVszr; Mon, 16 Mar 2026 17:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E289822AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773680593;
	bh=sbaR5IBCgZ5cdbz72qNH16ti3SYu0Lb5RLvOPNq3zRw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGDFG4CQTvfCm7LjEgiH1W7Znb/g97GBjMfy7oGMBQXvjb+JFkLOjat8DrbJKjibw
	 rz/DW2hlzifqNDUihNH+9cSGXw6zfuyPjE+lUPTFuGoEVj3U/pZeUaCp0Db93La3OC
	 Ur/mCgd6OwJHid2JE74fEKjv2LyHweeNzkOw5AuMNqD7vqFmzUJKLqvAiEsurjmkq8
	 0aZn2zyZ+zf/lq5dqWL/vKdSuwj/KSARynszFEjx52MBOJ+EDeCvaLwhxEo7vzVo0m
	 Xi9nuHuxy9i73jkmKlnzHoCz/e7RuSRWUpFSrFLpFSIolic0hn99738Kg3rzMG86OY
	 eoJ0tEGrAqAWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E289822AF;
	Mon, 16 Mar 2026 17:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E79ECD3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5965822AF
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woBcCWeXJwQK for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 17:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE39582297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE39582297
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE39582297
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 17:03:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72FE1477;
 Mon, 16 Mar 2026 10:03:03 -0700 (PDT)
Received: from debian (unknown [10.57.12.160])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43B053F73B;
 Mon, 16 Mar 2026 10:03:09 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 16 Mar 2026 18:02:46 +0100
Message-ID: <20260316170246.2414661-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316170246.2414661-1-vincent.stehle@arm.com>
References: <20260316170246.2414661-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 2/2] configs/iot-gate-imx8_ebbr: bump u-boot to
 fix the build
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

UHl0aG9uIHNldHVwdG9vbHMgaGFzIHJlbW92ZWQgdGhlIG9ic29sZXRlIHBrZ19yZXNvdXJjZXMg
cHl0aG9uIG1vZHVsZSBpbgp2ODIuMC4wLiBUaGlzIG1vZHVsZSBpcyB1c2VkIGJ5IHRoZSBiaW5t
YW4gY29tbWFuZCBpbiBVLUJvb3QgdW50aWwKdjIwMjUuMTAuClNpbmNlIHRoZSBweXRob24tc2V0
dXB0b29scyBwYWNrYWdlIGhhcyBiZWVuIHVwZGF0ZWQgdG8gdjgyLjAuMCBpbgpCdWlsZHJvb3Qs
IHRoZSBpb3QtZ2F0ZS1pbXg4X2ViYnJfZGVmY29uZmlnICh1c2luZyBVLUJvb3QgdjIwMjUuMDcg
YW5kCmJpbm1hbikgZmFpbHMgdG8gYnVpbGQgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yIFsxXToK
CiAgTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxlIG5hbWVkICdwa2dfcmVzb3VyY2VzJwoK
VXBkYXRlIHRoZSBkZWZjb25maWcgdG8gdXNlIGEgbW9yZSByZWNlbnQgVS1Cb290IHYyMDI2LjAx
LCB0byBmaXggdGhlCmJ1aWxkLgoKTGluazogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8xMzQ3NjkyMjIzNyBbMV0KRml4ZXM6IDUxMzY1ZmYwNjM3OSAo
InBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHM6IGJ1bXAgdG8gdmVyc2lvbiA4Mi4wLjAiKQpTaWdu
ZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBK
YW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KQ2M6IEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQogY29uZmlncy9pb3QtZ2F0ZS1pbXg4X2ViYnJfZGVmY29u
ZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvY29uZmlncy9pb3QtZ2F0ZS1pbXg4X2ViYnJfZGVmY29uZmlnIGIvY29u
Zmlncy9pb3QtZ2F0ZS1pbXg4X2ViYnJfZGVmY29uZmlnCmluZGV4IGZmNjQ2ZThhZGMuLjQ2MDQ5
NDMwMmEgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvaW90LWdhdGUtaW14OF9lYmJyX2RlZmNvbmZpZwor
KysgYi9jb25maWdzL2lvdC1nYXRlLWlteDhfZWJicl9kZWZjb25maWcKQEAgLTQ0LDcgKzQ0LDcg
QEAgQlIyX1RBUkdFVF9PUFRFRV9PU19BRERJVElPTkFMX1ZBUklBQkxFUz0iQ0ZHX1RFRV9DT1JF
X0xPR19MRVZFTD0yIENGR19URUVfVEFfTE8KIEJSMl9UQVJHRVRfVUJPT1Q9eQogQlIyX1RBUkdF
VF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CiBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9W
RVJTSU9OPXkKLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjUuMDci
CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI2LjAxIgogQlIyX1RB
UkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImlteDhtbS1jbC1pb3QtZ2F0ZS1vcHRlZSIKIEJS
Ml9UQVJHRVRfVUJPT1RfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9jb21wdWxhYi9pb3Qt
Z2F0ZS1pbXg4LWViYnIvdS1ib290LmZyYWdtZW50IgogQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19E
VEM9eQotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
