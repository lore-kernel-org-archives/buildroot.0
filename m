Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAF7C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F691411F6;
	Thu, 24 Sep 2026 18:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lrle7C6jjsc6; Thu, 24 Sep 2026 18:59:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 10E5140EFD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276393;
	b=r2Utlp3gd03lupZk6GxAQSCdy7AZWMlZ3ioh5eirem7c2wREfzXOpo90JHGnzd9pmmGn
	 K+4RdghMMDMthQ6rWwJK+tOHNjTPVsP5uCkCBtB95d3lJbPecK9R0Ev3fT9JW2wiSg+BI
	 iR6ItDGvAniW8H1ggSipc592ifuA1YUmYVZWWAJAJooWvqDyxl9AoKGpCUb1yMJMDMA9x
	 14eamRsnGxiN9VfyzxYpCDzru/cqhYrmnIfyJBiKZmP5S/tTbKjg6qCkO37DzMLpwcn25
	 BTl1+EETVVxAqDgh3fdzYLpFgQ3NjTe5UO2KizAY2UxAQHayNa30vcmccQo9etc7BeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=W0hmWn6XMc5AT4HUNBPjYCDWoMbO3oHeqA7yWfdsJzw=;
	b=JuaJMEEH7B9rj+pWwZTZ10vvxz9BBPOzQ6b/SHPvN+O6+MpNTR0u/fc2N1RlRjteYIIG
	 Z1Z+5ZeB5J3i8IfY1U6BjQ7miH2ORttmhfI0HkTard01cbX3+o4KalWkSTzUrpFSKpqPS
	 un1tbiFpxpzrSbjG2knTMVaM6u1PwmQnek9CRFfHIcXfpRkXIWuaPbf6xraQXUBv2v9iF
	 Ghvw7OnolOY7KPz0yhX4xN5NSN8sy0asidC0dG0y/jtAboT6BLoBDgEIKokk9ShvTNIef
	 FPOKZ3ZbTD+aQv34Sl3rdt/LaGh2mb33L7MmqcA+oJVtSjAbKLAEyUlsTvi0cifxhRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276393;
	bh=W0hmWn6XMc5AT4HUNBPjYCDWoMbO3oHeqA7yWfdsJzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VI4WoEfD0O9jvx+3K+zP7YGrXeG6VRINLMy/Nw0L7feiSkDCAfZozJ8ODIaDGlp3O
	 uESaV9teEDfXE8OpX10OywwIRG9hSI+0J+tIflARz18GuvVbxYumWMF+IrsM9iSatk
	 5CMaIAXzi7tyVuq90OA8l6MbkLyLp6Xu1d6oaGIP/r/Tt9AGNuQGFVES5eNjE5Fgi1
	 tPgyUJ5v+dbdL8Gbt1FN3kni7ul0BVqHUH4L3/g1X0WHVC1lkICeJ8CKO8EcywYpBU
	 qTKkktaDcXiJRMUfrz26AM0W42ka+OiimT0If/liht5QI6dJgR9FHbyjmplwECPMWY
	 5b6YcZsx/+vPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10E5140EFD;
	Thu, 24 Sep 2026 18:59:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02AC63B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7A3F81218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLgwUbY_Pldu for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A6CD881247
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=teqOUeNmt4LwCbeH7K2njVpwrl/mjqn99gh2EYmkxbzFritYQNKbeU7SN6FgEMLlQtyA
 advcIjZF2L94ZP0drjpt9e76w0zQX11EjBT3QfQ6j4K2XtVs8OLtodjkO3T1vZAVucIr7
 kXgMoW/xRcfi4niqMEi1bZJrhDTHhaNrT4C8yv2IQ1qNYh7Lvf8tnYR19T7CgOpKV5nVP
 FMMCqlXSkXNN5NA6gPnkUsNgKM3ddrPKyJvX4wnTAyvElbWN8anHP7ek5TNj9vrCRqy5N
 BnYBieqCmb1KIND/jhP0eW9nHZ5vQWtK43NA6yREsGpF23JYg5dK3S7ygE75c27Pg0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/1d1ttb/7QFo9Jp38zqU67vbYyVHq823EGA4FRNwPEY=;
 b=h3k4/fHwIv1POUhVfwk3+2Kxix1YL/MFNqIR3IJ9v/uaop+62qav93dsm5zAaAAGE75D
 OffnFkW++3lrC1WvOVyXk44JsDbNXfvQZMJp77hftZXiINrCaog63caZjtw30Hjd4noI/
 l7FCXwA27pXrdtXnB8IKeZwUDEa+ri8t3MxNRz7xp2EjomoxjJAkIsLoDt0I3y/W5CTB4
 qJWOvRoZoL6WT2nP1nhKDBmJwK4SBwduY4Azm8Sc2waumIcE6vvVK72asMOvq/DqfPsuz
 1tRCnZYPAVO1A+pXhnPw9IKGjaXTrLmK1Ryz/Ol+FA0mN8A+e3WWlQ7gGCt5Y6aKs+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6CD881247
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A92D98323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1caa3a3c2288603e8c968be03ab31998e5b6878c
X-Git-Newrev: 08e14ffaa8d0eebf7c3b92d24235a0437bb21288
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.4A92D98323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tensorflow-lite:
 propagate libabseil-cpp dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6503197578235475229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6503197578235475229==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08e14ffaa8d0eebf7c3b92d24235a0437bb21288
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_TENSORFLOW_LITE selects BR2_PACKAGE_LIBABSEIL_CPP without
propagating its depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS,
which this commit fixes.

Note that this doesn't create any functional change: tensorflow-lite
is anyway limited to ARM, ARM64, x86 32-bit and x86 64-bit, all of
which are supported by libabseil-cpp.

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f5a2b355311dc877b18613856af3b26f401c2c89)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tensorflow-lite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 99d219622d..baaf5b6d86 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	default y if BR2_i386
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 
 config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"

--===============6503197578235475229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6503197578235475229==--
