Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D61BCA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF0B60D87;
	Thu,  1 Oct 2026 14:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id msQmYu0QjuAg; Thu,  1 Oct 2026 14:23:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 100B960DD5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864603;
	b=Nm8/30XnVc32yWtwVjhW/OMoJytDY5mSJILeTfuSe4xlxkxT2yXj25iPO40r1ExgG+j7
	 BxwmdgeDerRzOlYfoKjpxKOzkP1U+hRENyj5NVmhbjVB1pLZ4QIKFQR/NoAKK/bo+jdR+
	 tvidpTsKFloD0NaDNnZkME9/xQAjLRrPLszRlPICnISweo0o52QauwWb0mm5pfiUVRq4b
	 6z6PGaBIBsQsvjQMf/h/lNU70MNOVwvy52MCuEym0tY2DIb6HFp/x98NGwCiI/qmPmlCe
	 rVCVWOmWPYRPPtOM+mOdwA0idxwPaOtbOTBJKXc1swCTNRlIyEdbdHyr8e865HtfXkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=OIJa8Y+d4qyThzWNpHsXFELBm12NjSPpr/2c7XSr6Ys=;
	b=L8yBkQ3IJcXm0mzWpSoQFSV+8Ah0pMHm8EIx4ImPkno8D7BCvK7xqDTboQmhHtJHEvM6
	 0qndrXVLgtdLx0vJasPti+CJ8Yi8CNS852aBTK0JCNqfVEAhvjwwu76248W0+OHfov/GW
	 R+QxNfQOWBxPZRkO9VS8OjFuv3xeD1HCTkGrX0CzUjrcL4ofW0TPUdVMoVRDPO2rgf/YI
	 LTVwckFgB4m0Renc09UliV96lcOzQDoLLqfMqz46iV+w3e0IoYVQMYi6zQytWfHsahq6r
	 DG7vIC2ayVlBwJX47y5gs9BLfUMrq6wXrVNe780qjj/OithoUMBK9A2vwfvwtOe6H/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864603;
	bh=OIJa8Y+d4qyThzWNpHsXFELBm12NjSPpr/2c7XSr6Ys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TTVEQvSWCgUayoTS25MBQe5/HVJbGhd5Wx+2kfcZ7R/6/Bnzvi9Eo4oiryl7XpgRc
	 sjb7+G/26auoTk3gULOm0KiSzUNsXTXXvXbFUpf5TFEIosVceTOKLQ15QlpaAix5M6
	 dObiOo2jwl446Gl6tXiO8XoBKU+L6A/LHuAKhAaK8Kgwq0esqjybFiZw/z48D+wTb8
	 cd54P+GN5RhFn7YjgljzlZ8NgfAk3xpXeeruYsB9ED7+HTpKAP7P8KH7yweliIge8f
	 KL6r64/aBqf+XJcQ1QEK1z0Q19AFYQk56NgMtOQ9uUBtcoqQHVow8w4Yv8uxjvqx+M
	 ijvfMuUfOIojg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100B960DD5;
	Thu,  1 Oct 2026 14:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4920116C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5205A80E57
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRSQQxZ4R4np for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B81D680DD8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864562;
 b=pK1NyJre7eBCQ1AaDqP+SwLnGznU/IGqyFEIIW15gsVB+gnTYqAuZ9wre/dxdlrSKqTj
 hXRxRI7sugeE54N5SMA0mEGwO2+QGeWjvrZaEAADpKY5piGyTKHcvBj1v3LB2uX8IsiNQ
 LMry901bz6C1PHtTdfJBFQJm3yJ4MWFYPnDlGRFLbE7+9wwQasl9SeZeLJ3E+CgyKpaKV
 5uVQsnOyn9cabFcIQtzFCE1hbBlrSwAa1zqIR0M8oQYstXC1ILNplEHrfBe9D262iBnHA
 1StjMQccIDkGM7Bv9PCr6H3t7VXNeUgb2cAw96uyS8OVQsT8LtD5mGvflL0X0jdFcTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864562;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xTlVkx1RNs6Zq0RV/QV5YmupYtcqveAOhT8vSpXIv8A=;
 b=E8R3Ti5q9ktfl1nNrdfnpFdaKdDsa+z+vjwFSdxJPe0EsBsmGxI/Ft5b+jIAXMyXTmQ6
 XsVYBdNhFPRBFMnz85GCcE6ODK7avaf7muF6akPd79GpC3SHap5u3xL9Hye8yHhl0SE8r
 q2ivIcn1C1Pv8byxLpni9fqpIoD/a22FLB0Seyq6+GZvqZY3xMWLXto2Y2acuwhzBW2/s
 hjxNYkRln1rG1XBp2+g69+Nf1Knsz5Kt6+gtWMp67g0WryCb0hz79TrIth8e2GAtRNNAW
 DaJ+UMVdnJKeCFmlJXlXiYT260xSWM1pOGElQF/eur2NCJ4T5OGLu+qbSaJxVe+mc7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B81D680DD8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B8199843D; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 14:45:33 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2e52ae72a2d7ca0e40c3b85570de0a51bfb4c37c
X-Git-Newrev: f5ab048daed6e7d17f33ec9417ecda7f725501a3
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.0B8199843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/skopeo: bump
 version to 1.24.0
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
Content-Type: multipart/mixed; boundary="===============1198524674551649456=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1198524674551649456==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5ab048daed6e7d17f33ec9417ecda7f725501a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/podman-container-tools/skopeo/releases/tag/v1.24.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit be60575e606cbadfcca99e819141d1ea8c501a17)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index abd68d13f7..8a9fb22133 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de96bfc2bb523c852af675ffdadd934484812ce190aa8620e1d5fd6c51442e25  skopeo-1.23.0-go2.tar.gz
+sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index c2fe201c7c..354998b175 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.23.0
+SKOPEO_VERSION = 1.24.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0

--===============1198524674551649456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1198524674551649456==--
