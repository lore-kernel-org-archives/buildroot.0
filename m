Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67C5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F0EC60714;
	Sat,  3 Oct 2026 13:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5u0TdiQi_Yz; Sat,  3 Oct 2026 13:57:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B4BFE60F69
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035856;
	b=OSoxpvnmFjRzIm3XYrGjPjb8Jd6KkonOLlS5ZpiV7MqN/JFiur2w7WoA+u5K/dUF7fFn
	 /4zSZoDCvvHk2A/AKKb5oHE8wktVxzPU7yB77NPp//bVs5Wx3vnHvWI2jjbZU5fDWiX6A
	 SF6qUpBl7fijGkcdF6c/FyrfVLfC13d70GBpJB0gKAliqdTVH8IDYvbF7G9cau1koDCj+
	 0K9qNcpzcbtZyY0RJrPoTGnqxLfdvtEc2hM58m1eU0aZ8fiilwWtDdMEEjSBF3zM3eTqQ
	 1EgzNndtzJjozRbxDMKSsvN2MYI/ZnGJDGbcQMPwgo866nplHRQT26Y/cjrATSXQ/Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bP9tV08JC7leP4Jfh44HPVZke0NW2ZSQM6q/6RGIseg=;
	b=huCvZXCVp56kooTh4nWtKQFEDgCIhtFOG1Nrnznw0c+4fGjYWNuE1+XykRk/1Aaxdpi/
	 bf81CPZhN1OBkENAYGrNkGx9kx/JDCe/q+zvp0xg50zNU3TRPYODWxaIS9LNGnDobTCcc
	 Bw1uVJRrYuD9XzT97B1H0kplaf79k8AfR89OckrbeM3IIi87BGNt2I0EeR+gSzPFVcxjP
	 kqUW+4nhZ/U/kXeA2EnpawF9ueoHN+N/ie81Qjzl824POWEu+VSD3m3+Zp1kufv07jJm/
	 ThMtweghFoV9WnJGJm8fviyUIJv9qj7srBdPdMh4jFSzKqfdF15x6Q5sqCmqu+nxFyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035856;
	bh=bP9tV08JC7leP4Jfh44HPVZke0NW2ZSQM6q/6RGIseg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jCrRiAV7j9f5Bh+7zBsPCtolTIY5kxOTqyyDtO/Ij1vWh+o2YCZ3Pw8Q6GKWaE1Yz
	 iTJFTEe/MuD6AhyUavC+CFLR9XY7B2maxPVpiEUDdrbNxP9s6FlhRRtX+Ep7jpquww
	 PJeKgt6j9mq80Ghn/QWh4zW9aIRQHIjaVR4kBr6sOdAkuspvBU5JUPWlfR7LyYQgfm
	 ftuvfrxeMmrbMxkO03STgnu3f0gF3gbML0i8Ue9jV6MqoQdz2GivNyUyAZkNmiY+t2
	 3nAojv7sdmJ9egwTJy0pmYGJ23QLfBRG9rQx7KdHaEb3uRLlvk0oh7/6OFKj7WBKg6
	 5JPGbWTrvu8sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4BFE60F69;
	Sat,  3 Oct 2026 13:57:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 133754B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D252F414FC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THuOLzRgELlY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 76C05414F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=VvaRerP8fuT5/voeDXv6i8cHWhIb7E7Db6pp7g1gusbntZATi2DcmW3YU6xkMpse+/LK
 HCM2aR9H/7HRcHJF1UnkrQ742gMDQws+KmscnHVT74cyDjtO5KPjrC1PcM8DTzvXU74IS
 N0lsi5SzmRv14rCekceFTUEeuaIM/pu4FqCxxjVrk0j1fC1XZ/YnFlTgmLqlpU1LkwWAj
 dVs4qGmvuQYquwhHnGk1M9ZVPjT6sDYsOCNgSWPl7GxgbAIPJaE7KufRLIEcU2LmDT7mX
 F8oOHLXEULe+6DBiAV1k5yc5RTGPB6/xZsDSIPFg+w1023vOOrxgAVoJ6Iy8TPqMyTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vct9AasYVW1tydw8Zv4bUFkf1cjCSuM9B/PLtBrYIP0=;
 b=DnocPhkbYjHqqqa56GfK/FQCoHGNyMO51ilIoz1yyefYE3q2uPIHbHRfAtq5ED1kZ4rl
 Z58frXgo5gyXgPspWi/PJVHmanplH8FqW++UCZQpFLuNb4zhWhITrGWOTmaBgoC+rK6UU
 c+CbynrKFNAdMBaG/tA+NuUWFo88wFGvDreGcKun6xEgVey9MGrSQOZvXcFiPLlclYxsw
 xR3q0pbTPxASGqMJY96zJ5KS0RJjSna7DWbshxdb35g/huhRDt5Rp+WYfUO40h3wLpwpt
 VRnqq/fvbi1z/c8SGkLtxzOrBmNp54IS4qevlzveCQSB0BKCMQaM46bXj/lwpnTDOOw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C05414F5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C176588762; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cddc0d6ed9f6c53bf74379419932ff64d42cafe
X-Git-Newrev: c1fb56c12502e66637c3e174a8f85b9296bf12b2
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.C176588762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump to version
 0.54.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1fb56c12502e66637c3e174a8f85b9296bf12b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index cab65882a9..13232df00a 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  4179c72dbfcf49d1e6ce8e42e0195683  uvicorn-0.46.0.tar.gz
-sha256  fb9da0926999cc6cb22dc7cd71a94a632f078e6ae47ff683c5c420750fb7413d  uvicorn-0.46.0.tar.gz
+md5  97795d0d027e3574fa8419fb4da5e11d  uvicorn-0.54.0.tar.gz
+sha256  a2e33cbfaa0306f8e6b0c13e0cb89d7d7a2da3e62b90c66e18c33d9807b28620  uvicorn-0.54.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 66bbcd7253..8f9da07e28 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.46.0
+PYTHON_UVICORN_VERSION = 0.54.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/1f/93/041fca8274050e40e6791f267d82e0e2e27dd165627bd640d3e0e378d877
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/da/34/30e9280707135d2cfc589dfff3cb796bd07a3aeb1a3e415ba09dd89d7bb4
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
