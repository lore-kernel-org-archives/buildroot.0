Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BABC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42E140642;
	Sun,  6 Sep 2026 09:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUnxMfMUKUIJ; Sun,  6 Sep 2026 09:58:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CDB4140634
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788688685;
	b=ME9qqoq8nxTRd5+M6P3EWJSZzrGsiBO3EPr/LFxHYCI4fKPJMJ0Nnb95QQk8QkQwR7p5
	 Vr7j0KPc5hd9TbweTvZ2EKYxD8MzrZAkasvttMGPVoyWfv5IhYNINAyjlpqlZBl5dOeRX
	 UMr01f0DcRj2hx/A2Zs8nYyq0gjgehHcSaCawMU5g5rMirS2QG4SBZOXCM2HDOHBQizTK
	 ZTQwM830V3p2Ra1Yqbyx078WGNLWVue1lJNbia6Jo0JjMOjEqUYm2e/L7PSrpfVP2GuAP
	 m6NjGv7Q6F8S+vpWzhUfsvSMXQjz9zLKzAdENl19US6RTAt2zMWUCHZsj40BIlk0ILQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788688685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dArZf8eccAjgbGrJLH5scmZkCLor/mrgmK7UXY7fEMQ=;
	b=AFjoPc7xXp6Uzu1cjhX7KzFMeEqhcVihQ2udBLdkie8j4xDCAQT3Dl6Ebw/LSyatyXPa
	 TBkYcDxIF67VqCYN0dsolM32Ko184bGbbtSaU+yS/XxaWtsTKWeSY70rGi9DRWSkqrRYp
	 8bFfTaQJZ4Hyq+MnfR5P6hEdXtimqf1fJ5gc2dCkp4fVrGoCtogclqQYECGx4nMlotw8U
	 MXguBwXNHMEFq6xGZQUpBa1/qTRyPHiOwqpiiMjeVr4kvhwnyvGVCOBDOCpctQR0mqJ3a
	 IjwoRSBHp5QZTcCBQkJ0p9Ur1UDk8YU9FAdW04vWhZINtP5FIdBiNwT8m2zbI5cRSDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788688685;
	bh=dArZf8eccAjgbGrJLH5scmZkCLor/mrgmK7UXY7fEMQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l0rSTejHp34XduDWt0mcIkAf3SHuI9bIAwMcL/roVABLQulod0DJ8C6DhX1SF7KQf
	 N4VvohCwIUkcX2J5GRudDkDjbtmoCp5UZ8iub9n7zngoBFw8s4pVc+YN3DsRRwXps3
	 vzOtah6558CbARWB1SDClCYFulmLLB0YBARSDInnU+hag5dU+p1JcFX4tBAjw55LtT
	 4UVfQvOLUdVnWj81Ldq++lAi4EM3efLDhaNsoDKjD5UfFJHFOLA1jj+EOhpLpgRAiE
	 gOhZqMHKcRfaiIBEk/jms2bymvUr3nuMGj4w5+zNk1W46xNB1ATq3NQZglgcYyQxAm
	 08GFUqpi4WvXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB4140634;
	Sun,  6 Sep 2026 09:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C94E118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7297940634
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8cT8KEUP3_y for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:58:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 52F1E40633
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788688683;
 b=sju7GONV1JOCcgiHbPVNxKK93jIv7fFb0TO+fR16CC3q1pybpi5DeSbCwHwZu+c1o6w+
 bZnua6MX/8Y5HBfqalmTdaTtuHM2KujYOLpPshLVK8u6RQioSAswA8dWldaeIkda/xP5b
 24RJCpsb7wEeQW/79esTCioP4qv9j7cbgbt/EQUT1/v96bPJtoUSvIfU/eW6TeviF25Qk
 //KHi2PuhBTGpXjlUMhhKpKIuPU8Iw1ryVbY4K4PoqBCs9x5iSZ4sl8PKJ6da4EZRQ0Dl
 69x9gWpRyBIT+j0tYCe2IhcLb8mDLPpij7GZRQvR/Jh5xs9E9rZE6VX9fxKI+niwHqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788688683;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nNPnXgRCCog5kCxAb77qsO/S1AZlr5gubLJgpmKGgB8=;
 b=KFCTFrVjUNfUy+/gEafFG2J45EKH3CnB8R3LuyBG0vIh3GKt+EIhxh9Mppua7hXL1if7
 Bd8Pe5fM+P+h0jBP+zgDmmtEce7TVntdn9F6uqzaTI+N0bkrHhxQ+wP9cOryt1MkIGWdK
 4Ew9dNXpyo1yhy/sSjREUYg0qMkV4tYOzgxcAUTGm4oRZD9cB9E9L2rDoS05LKSJutzEk
 GqF6bMNeGXg8CJn47pptENOV1aIvQ0g7UcTzYLjQeQcUkPXllMcM93KN2bTF/zOJPsdTX
 tFc6AXlpAY6t0EU7gGDrkl5GC1DCWCUk0eh3kl/AA1Z+neyy6lzF523aFV5tC/eQMLQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F1E40633
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:58:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D25E59531B; Sun,  6 Sep 2026 09:57:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 11:56:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98258e3064a589812eee634dcdd44015f86b295d
X-Git-Newrev: edb18cf3f2df3d55aa216e0b1a6706539354cc76
X-Patchwork-Hint: ignore
Message-Id: <20260906095701.D25E59531B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: update
 package url
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/edb18cf3f2df3d55aa216e0b1a6706539354cc76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The old url redirects here.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-charset-normalizer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-charset-normalizer/Config.in b/package/python-charset-normalizer/Config.in
index 63e04a7a33..3b01357167 100644
--- a/package/python-charset-normalizer/Config.in
+++ b/package/python-charset-normalizer/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER
 	  The Real First Universal Charset Detector. Open, modern and
 	  actively maintained alternative to Chardet.
 
-	  https://github.com/ousret/charset_normalizer
+	  https://github.com/jawah/charset_normalizer
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
