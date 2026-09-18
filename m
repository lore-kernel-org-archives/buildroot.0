Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A3EC982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49CC760D8A;
	Fri, 18 Sep 2026 13:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxIFaxuMgrGF; Fri, 18 Sep 2026 13:06:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8A33F60D9E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736779;
	b=ZfBLkkJp/DNvLEVm9/Hh8mOF94aVfKpWSx2fh2i7C6mkR0JLA3vBVcT2AV+lyXS4qOz6
	 pQpE/XnSEZFcEnA7DRSzIO5DiEGkhXpjpFGdIGzT1nex36yB8Z7C/ecB41GAqyKcE6g+K
	 wUyRi/B3+bxQ5ksFkbxZVvQd4ptahsNefky9xvdbAPHaNJe4F/b9MonblmAcLH7DVCLKJ
	 tLprnJ+wFfq/UEqxSqUwKpDggp8afq2sjfZiYqkR/A0WjsImhphSLHuzhzE+CVi0FreS7
	 zNz6qkYu3iHhfMEF6T7vXHS9MOrcapUY1jyrLkGWbc2YTwNbcnX6hAsM+Ix38/mArtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i2vhto3ftmK8qeAyC4Hz9QwVuVLm6edAtSwbi0Eb6ss=;
	b=Q3BGCzmFeP7n4FeBeSt128Ma4pO9cuYF2uUwNgCOEkYDlQgJDjY0EvEkpDyP48VofDnk
	 /1kLPmDpc8htv1QN63F9fq6CT2OnNEfgeJiLKHfxeWMnvXawT6owa6FDs8Ap2EGcHsM87
	 zAK4DX1TRe/P3Wy3McSqTEymEBu0u0MsmMCphki4BL0ux9PGrEDIM8JcoGj9YDzw0VZJK
	 3soGLXHS6zmie1CiazSJUtakoSqSOecqjHhwToB1bhE0KzLQgrSzOASrlOkB5vMcPWpe4
	 qt6AJ+5HVwN2kdtnYfKUYbXr33uWQw7kkLhVswLy2fIpfN0cNrfeoaOFlJ89I6dBq7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736779;
	bh=i2vhto3ftmK8qeAyC4Hz9QwVuVLm6edAtSwbi0Eb6ss=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vmofifi0/b3E/0c5rnruhyCzEK5FPEx1tz8UEWauBrskZaZs6f8BI4IaJ3iFNi8BE
	 bAAY+ooXBjmcdLn12egKKNAthj9eHgaAbRnYFTwZ6z+fkuv81dqDn5lBc0WeHySdDa
	 vR0Q78iykefo9zWpYknbdw3tlOKCEXQ3GiqzD2hT7x1vqH8ElYsG9ZL3We6Bg3RFIY
	 9FBnKihyOlMx+21S+q5H4g3Y7//uF6qTeOwpj/tCzmEOJs0r73X4gLFglTDpKXzcWA
	 ipQwPSFOh28Sy6EYumOqztvkyjA/4mbiCqepsrHhdkEsIfvpTUDAyinpKxi50utTIv
	 z1mcAnX/b6vxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A33F60D9E;
	Fri, 18 Sep 2026 13:06:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB0B6A29
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB83060B7D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUUfa45pilSK for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC3C760D70
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=Wm1uN+/drjn3MThPpv2gAtO8tSJAKX0KdSFTGk8hCCahV1+SvgAbhOPM3+N5ihTLdReW
 XEj1e8kjBtIPn1XETyU70ftr3+EXv9tGiEaEGznPo375kq95LFnFeO3SwcKF+vuQWAOPk
 qcelOCWVz3KalKkdlMlbJ0MYpqcs1O5NpRaauuVhFITr9BiXTk4OWqXNU7gH9tlpWKvTY
 yKKKeP4ryiXu3yP6ptncHqkGjNuFWx4xA3CeeEcJCH+P3+w/uT/TW39pzEghCpRxEDsq6
 vsyFY1BUAOyKKFpKVa32WsfvLhvz8jCafAqYlPh1zzSsX/fR+NgtIeuKPyfA3Fh0PKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3vWpeLoi6P2Rnj6q8uqMDIEG+ySR7tku1NwOtOLVwAc=;
 b=NZ7tDV9bF9FDQaRBR+zc86FVs/nrKe9XXv/bpHcBRL0OKusMR++JtG8jxv97hQBzvJAQ
 DCd5D+oG6YYuqPLSCUw99MtTTSRK5/NrX4MHU129PyZuhOeOsg94suiXZCJtp4RkFk2on
 QO7y1k7RJ9dR1FqBSox1faaAFi8k5JOVo6F0PfDvwIcEvA08RX89eLYtRDgJSyZPRQ9xS
 y/Tvf3VFfZjoi5nU14dP5qU2o7XRpRI0lEUbx888naTYqGffQhktMwkr76fpTLQMcLUXE
 BEQfrV9AMABffVJyuOmT53tlrzFp0XvG/j92it9Pohwg+tcB3HYcR+xY95nWs0mSP4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC3C760D70
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 654C59718A; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a6af92fb3d461ce81e003addd582899aa6445214
X-Git-Newrev: 31843da84145730d9b2720a437122482011d576c
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.654C59718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-grpcio-reflection: add missing
 BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31843da84145730d9b2720a437122482011d576c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION selects
BR2_PACKAGE_PYTHON_PROTOBUF, but forgot to replicate "depends on
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS".

Fixes: 3217fedcb8c8006809c1a3d214c97597677a07fd ("package/python-grpcio-reflection: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 74dab034953e4546b63c9c280428e59fb144488b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-grpcio-reflection/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index a0ca35c286..1e35c82a9d 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
