Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3CEC88E75
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 22:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E34B4053D;
	Mon, 14 Sep 2026 22:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m22Bxly0y0An; Mon, 14 Sep 2026 22:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0C5740547
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789426348;
	b=DPGAC+/j67GBslIVipBL9JVP8HLWUNeYhJOLrdIyDoRvb6cGjUJviXIRwLaG5rjxU+Re
	 Ph04Ol6xIU1o12lif99jOmYBFmp7IEJNb/fBcmqXvahKWUoCGQDKAj92mnjWeUU6kZhZz
	 zrQmJoKEauHA4xtBnu/Qg5iClIcGMfUUmzEJLonxElRCfIU+AqiQ56sf5PuvetVYKfYfn
	 WhHyY+wjsZV7Q1/KwHby8LP7Hg1BzRhpk7V6ioSeMJcdQx8o3g23KVHXmxf+D9YEelAMy
	 dyJf2Z4AbFHq0X2pQYOjQuiqeRHGXIVAPK0gs1M8kVPMxg/qGbG4Uix3YqwcLzYYGbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789426348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/o8rglb3PJ4T7w9Q/qw/fu7sBotfJrqWmQCT9+Sv/lQ=;
	b=DOOvcX7O4T95fuZw3IVs9SeF9+GdcuZzquWeprRXeoG1yME8MmLgHIe7Sbwd4F+qLHCP
	 7O3DiU5vhLKdTWtdm8/REo+7cA7OmCE6DE5DWx4FqqazF2RQZlFCRLJL9Ta1NThdSF9Bl
	 p7/WUT8xrwBv9cVgSR9n7rENAVG6jHlSxJAgSjQNisFIju3NawdlNgU2BPoal63ckwl4+
	 rzRBiqjhLEq9OxbZaRpwm8FlDfYFhH9CaodMJA5GDOW0gGhK71d5EK3SECCVV+yCLlKoU
	 jNKMJe651C8oEgjjzd8lYB21EGxMfoYI1/BkJ1HzEiDuRtWSggrPFssvPFRSFL5p2UA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789426348;
	bh=/o8rglb3PJ4T7w9Q/qw/fu7sBotfJrqWmQCT9+Sv/lQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkFE/FQkVeDnw3qwBvQteAnFH7Y3JB4SvRCayIBH9yMGeDH6DvwKz0AzqkcgUQdo7
	 cbYYiO73LYv9QkmW3tiSluUr1ilWjce4VmXfyHq42l+XGylX4esrRwFDmncQOfxctC
	 8S5vVVOsYJAAK5hT1f6/gORTOJHhvQHb4mWlRtbOxvYcrAU/A1DTQFVy0PXv+wPUkT
	 UVMgsDmMULbL7wG1YFr/pwNLa4NfQYudGi5GVnc5ACN43+m5kV+bnqU+qSyy3M+XrN
	 8yizdCpNDoyUj+IDzecyYy9ckG7ABOeF3FA1P67WFV42iK8WlUfyCa01L85oF47xjm
	 m+Tc7tmx6L9QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C5740547;
	Mon, 14 Sep 2026 22:52:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D92362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44AB860611
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbUldl-HpinI for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 22:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 419B7605F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789426346;
 b=MJW7P+S48d+3nA1ie9WMerUZhj19BAO8U8bFoQp4O/M03TiGNyujyBk6GKmyZoDjyb+q
 pNARkkdqH+pd+rBjCyTR2L2g8jSqttetfDanPraistvnAGLIkKe6r7qZBE5XsfkeyFAjH
 ZGzcjpWRgVVaQfL9BDxosBjIuDt8hwBv9Kqv4W0pkcA/HZ0d6zKJcmUmbBfiCyj7acQGf
 QfT8uRXHKU5pyllemMhXXTdFMndkNCSxNUwnjll69uLbxejNWA0Ei0OsOm/AgXs1X1FX7
 +fFbk8WsEBOwJLd1VtcEjgtb7fFz1wMRTAJtCHTbS7rHOLCTIz65dQXmdQuhxPZ5Xfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789426346;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=weIbZSv8qA33Nw8VDmhagx+ckQ6Q4srkiVBfJB8oEKw=;
 b=SQ/Tm6eO+e3lm5AxZhRWRSVbMkLHyULAmf/dEqG9uBwv6nMaL6EvEBqbRolmsYlOObIi
 Via/ffUOQ2f1+sSG2f7Y3Noz2+J8f5Ukhi37w13xS2vGho/Q0pq+pLc6UnE6xwxgSLxqw
 S58qz1saJKoCa88//kyxzShzno1a8DnE3b4BZLyHdSrlons4b0LaTSyhpldzorBYcp9xq
 UFj00LqWB1MAx571QOPVl/ZfkimyUyw039wuaYaOs2VMVW4zM4msZ4znavG6hQSA+a9QW
 n9eOl9tX1t7DCflk1f3q5BEpDkO0xgCuHRDRCYKzhKmeAFKwlhx2n8NRr5g5bBuwsMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SBrfOoQM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SBrfOoQM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 419B7605F7
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789426318;
 bh=weIbZSv8qA33Nw8VDmhagx+ckQ6Q4srkiVBfJB8oEKw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=SBrfOoQMUW0JY8e89nfU4bPyEjDVhF3r+2aT5CfN7S+vVuPsEr3QIXxmlvYMShj7T
 Vpl/BJpYkFlrLpx+LcPd8SBoVQMsP4F+oT/siWUEzlBNXOnmLvY/PUPdOsAy3bGN1U
 gUFdqJNUn8SrNvISpq5AoyIPH29j2IVrckEtHfMDXEfTj4HcYB9mVgeeqULmlpHYMI
 mLLonhnf4sVywizVlLUbUQ0ROmECyyTWgtYEzT5CoZRbMKYyjMGBRSMIJ5VJkGOuw7
 IPHH4ZPECTWrIcHlvVZEj0WVx/leGo4TuWAb0Gtk/7+bJGlDkCApa488tB9D5hs+Q9
 J2Z1+0xFN64Cg==
Received: from fli4l.lan.fli4l (p54a1b56e.dip0.t-ipconnect.de [84.161.181.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CC33A4C4288
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 00:51:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6FWo-000000002aS-08qd
 for buildroot@buildroot.org; Mon, 14 Sep 2026 22:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 00:51:57 +0200
Message-ID: <20260914225157.3786041-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914225157.3786041-1-bernd@kuhls.net>
References: <20260914225157.3786041-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
Subject: [Buildroot] [PATCH 3/3] package/intel-vpl-gpu-rt: bump version to
 26.3.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/7e319a3379342ce37f1a0e7b1ce1e7c704448ee7

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index bedf9f8af0..ed08ef3926 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  70782df455555dfd216507d727f67fcca191959b9c911e27ae23ecc8852664ce  intel-vpl-gpu-rt-26.3.3.tar.gz
+sha256  afd7c1cda2a5e9f96c21c333ef1b471d97e6325153d31f3ab468617afab0133e  intel-vpl-gpu-rt-26.3.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index f953cd20aa..56e77cda12 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.3
+INTEL_VPL_GPU_RT_VERSION = 26.3.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
