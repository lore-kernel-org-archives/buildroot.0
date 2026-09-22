Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96AC98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810A94070B;
	Tue, 22 Sep 2026 09:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S24VoWX-cuxs; Tue, 22 Sep 2026 09:02:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8DCCB40793
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790067757;
	b=cqN525vTU+RWBMCgADC8jNXX+ko/to+Xw4DfUs0RiimqF19CzgQG1UphLs8rYbHgP9Lr
	 b+BDjJff/SHRPofVfv59+069SamYKGKO8Egd/UJL5j4qiRFtpHkSIaSsnD9Ba0Rs1lpil
	 Jn6TfHohCDZ47wZ6q1qhRP1t9QVDvOkM+o6ZcuFgI3SatvIqgU36l+bsUjF8jCesj8gdJ
	 OF/VXfEPp3FwiTyEn3LEKgXMWBVqoVpGaNMhnfm0AkxV2klQLbez7XTutnPrAwpBYxm/A
	 URFTLXeoi1Y2C+rwiv3yHtNaUX3umV+l5aGFS93lFZdqKyfa04rxTRtkjXe0QOfhk7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790067757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ejYuOSzkrY54jPgSr2yGel3Qr8zbeDb0U2kL5yTDLTQ=;
	b=ciaeuIzKEZrxvql+7tJ1NcXec+AmoryL2uRsiRnMXHQ27ABlu9jC/7OvBh1DZVmFtKEI
	 fiym8ohWSQUxmrditD8ph6WO/CP8lKG8xYdNOqHcROWWk7rCrEBXE+AhYUaUru8jVEHeW
	 w9zaVbud5cFHFTFSdmiSP1iADXHHzZIyaWnuSJzsdlnXaiHA+l5Q8QyfjXuwgLqo/PYlJ
	 I4AicSRn3ps9eZe2uq07yS3oWr2Qpo6Xk7v9Hs3gOLjpFHU6GEURsfcxK3xGFU2MPS0Sv
	 ew1ji/H/rwf+CRr0iHu1T7rYWzUV8qoPQxCZmpAxFf+AYk86gWAbU7dAHmRelv273gg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790067757;
	bh=ejYuOSzkrY54jPgSr2yGel3Qr8zbeDb0U2kL5yTDLTQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iPM5LRvs18iPEJ8D1PJmdm4+eFkfqqfJsHa46UpQ5dZb7cTq+OREXYQIPrrSBETLg
	 VuJwuCC3vP2PtfyLsMGfgiVCW1syd894OxcYQIrOenqC0MQhz4iN2GU3AGp5Rg3Fff
	 p1F1vi7sRFid7fJjO/eBonsUJAdjgNwtfBsZimHVzePCYyCFGu3ETM4YLyk5awPlMO
	 pa85DqBFiSaiyQG4uglOhF2+KtVjfzXBMHW5oMLI9mQCn62L+rlKTFAercwI3BPHah
	 mVN7fO+9H8fXCJyRVherFeoll2TRPhAHbRg7J7JiApK77A6ZyzKjWDJami7CXNWgYF
	 Qj7W+1DVOLDPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DCCB40793;
	Tue, 22 Sep 2026 09:02:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4F0352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDBE14070B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLNX-OlyBjos for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:02:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 96A0540705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790067753;
 b=eNfEag6vUYAR8LG4sEGVJkcvyYwvoBgeJ5RZY/ylM06wLv2seWgEyYBttC1zaz1OhCzx
 5HN8LQnJAjGGyj48+t+FzQ9IA+hDIxZutQKMq37OePqsC3auKWcFad2mFnFab1EpyRw94
 U3VpccWazJ34zdZh8dPLc5i4vpsWjSmOE8XDwRNnTsquSB3NDAynWLIsK/WzuOBVyO6bt
 J4T45vaiWQnYvjy2F7CmzUsavWCZUSUy7inyEPaXtwdY94p3VOQy2m9v/9f7nC0FT3a46
 pkiTgdpghX+jOuDaopeFdpW0mfpwRudpoGrGzJe9kFC1+hBDuoQ9PsqL2Y2oEyJTgzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790067753;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vje4gq2QLs3RsjHQe4DMBqZ23GhI7imDT6p2C9JhuFs=;
 b=BFtHWRrUeEuZ4FwgUXXP+iGbKkJncqhkM8O2BjVxDprAeAmP5RLr28aC0b4ghii5zeua
 +UmjdB0mGHhud1Y9CFhkjgMtqOBGB8kwdZ8iqiFYy3VuZT0LWVyTYXXFHCavg7WjRYDL2
 0Qg8IuS4Q2sDWykUQi33VqIjYu9utnplzXKonYEb+KqWCbEKdmE2+VofeR2F6AvWAosfj
 w/3qq0bx6WSxuURalZb58wfnXJhajPKDEnbL3uAMGJ5cBR8n8Jhxvv5bgUJJQWm4EZCdS
 jP5/nhPjMrpPKt3reXTf6ZigTIjUiTCfYkGcJxA2QGpa/iV64bnDnNrqyVCejs2KOVg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96A0540705
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 635FA956D4; Tue, 22 Sep 2026 09:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 10:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45f1c387e0b7a9e9e89280261e91803339950822
X-Git-Newrev: a489e7c212b1e8b6d5ccc23bfa0b9c8e1a4621f4
X-Patchwork-Hint: ignore
Message-Id: <20260922090124.635FA956D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: use new upstream location
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a489e7c212b1e8b6d5ccc23bfa0b9c8e1a4621f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upstream location has changed (with a forward from the old one, so
we did not notice earlier) [0] [1], with 1.23.0 the first release being
made from the new location, which was accounted for in 96aac440dd79
(package/skopeo: bump version to 1.23.0) as it required the change of
the gomod, but where the new location was missed.

Eventually switch to the new location now.

[0] https://github.com/podman-container-tools/skopeo/pull/2854
[1] https://github.com/podman-container-tools/go.podman.io/pull/6

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/skopeo/skopeo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 5a22658611..5d23cbf451 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SKOPEO_VERSION = 1.24.1
-SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
+SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
