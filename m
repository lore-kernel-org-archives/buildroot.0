Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17D6CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466CE407DA;
	Sun, 18 Oct 2026 09:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rW1BDcig8jnG; Sun, 18 Oct 2026 09:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 76CA740632
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792315757;
	b=ELfUv5CduVP9zEp5E0gU9qRVIkzl952RYWSdjmrjY5m7BunXtDXZ+lqKxwhnXhtUREDo
	 UdSDEWCRb6p2UaVM/8Xdgcoc+h7y1rmnJoqu3mdDkYeDvf/n8Gf6i8pJ2Tti4VoeFRZ3j
	 Vb5Pr6RIwjy0US9mv3VOjC1D2QhW164VPad9z8/90nOdiwh00C2Ka6JeXfTN4ZrW2yWnP
	 T4Hw0r6RG+sJdPg/CodxPVCPnXcv6m/83/I5bz+xH07X1m1fE6assKZMmHyajsPqoWDOX
	 vdO1mJgRStvu9z5BEQgC7ZibwBpkNRuBCLU07ni0Tv3qMaWjMmzBycwYMGBD4phORsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792315757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f0I6za/Z/uLTLM0Y9G5YRAH0nf8Ioh45/oCdro6C8Z8=;
	b=VvANSY/+u27+kG1MIIp8WXYtJQM35EprZyiaLCMDGaliwXjM66f9DDFbwbaaCjfZi4Qi
	 QJ9J12BZyGiRyWyULXbF1vfO9eg3f6mxpg7eT563qptBz9Z7NLjTRwh3A+eF6j92eV/tU
	 61C9elmRAoG1Su+xLdiO97PMhVMD13btQjUMtx0UPuxBVXQ8m1ijdnSFckgLafTY0tyVB
	 CfWlPhX3hNJGptesDKpT0CrRz/UQ0HYUu8rsrVHoznHOEnhpGVL+L03EfyJCbwTIp+5+m
	 KNnmWoEXv+O3J94wLLfxwzeJHdJRCP5eaoKpoDUHxpOKoN60lsz3qaSF+Aqy7S6UZRQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792315757;
	bh=f0I6za/Z/uLTLM0Y9G5YRAH0nf8Ioh45/oCdro6C8Z8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FpyltGahiL8SbIsuN2J/dLowVQnj1fu+eueh+5W+l+ifS1moJgpZraeMoOdzqra7L
	 LTL7pg7p/WohFv/mif5GlaSo4ssfYoh9IXl2YmWpBx75ONTYcCiadHWEyMYrNqUIeC
	 hlxzLV/2fVjIoYe5bzrmspTtqqVFeYyDx6oQCFocHVoT064F9QiB/LyYI4Bc9WJ5dx
	 AGr/D1E5bhBy+sIWqiA6e4nmtGdOUUafHxzyyE0nGksi2PIy6S5JkOjjwNJth5it+q
	 3HFFIB0FV9de34/sS3WG1RL9j9iu9CjtmsltLPyIzzzOcoH/Kg6e1DXzkN7GiPVWKh
	 ktfZgmACAAKIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76CA740632;
	Sun, 18 Oct 2026 09:29:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B032769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D566606A7
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXY9bZPoCZbY for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:29:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6549560687
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792315755;
 b=WlenmxON5k8TujkzkKU7Lnc7F2np1exAo6mPqHj8IQOawZHGv4GrkQcAXHfkRK5nvLs3
 jzaFEY32jp22s3hFbXW7gIPgsGTyI4Dilm73ocODrPNkyZxbyHbI4wVmMNZXwpOTEGcrK
 jxVqCYRSUJr7yXgzOrDh33n9eJlatr2Xu9WBTIxHOkIv1I5mRUeTP+oJ0pGMwGWtZNBZf
 mMQ2ZiwrIm1J5Vrckl1Jb7UWUPLrqxRsvFRh+6lo4NDivenICnsCb+Wg9c6Sot1KyBgRe
 +Zzli0TVPWCZFi2bMqu7lK1JYxd8Q83Wq51NPV9M+le3NR8vLhEK0QvwmKl+Ewhsh3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792315755;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=JWdzPjru/+7pwQk3BQ1PfRRdXJCEITTlUZOy1RHRk6Y=;
 b=gHVfJvpxHvtHimpyAGjWVKB8SP6hfMvf3yFWU9Bcg7hwrQ8uUlNlzegdkanN8FCMjkit
 hGGDPxd9V0tx+t/MHK+UYvBrdTSNmlrNRE0HvFpKDDy3NWATOwRxfXNduHrPJOgB0t1xD
 7uNNzOmNy3+Pn6nC7V0FKL25xKy0qAERCPPGcp9ckEdoMQoQgSSza5UDLCReWrPt5euj/
 R8tbprJGtdOSDDyofb3mdsy4MRZf7DGmJm1Trsi7LLMXOYtF6GcKyvy+N3Pd4+kttTesl
 tQ2D2nUVzX+nuNSKVI6Yk8h0cip+CkNou2KN8PaMGYeh+aZdOfyuTL6XMyH/Zu78JIg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6549560687
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792315750; bh=sHiU+Ey+rrxXjcr0WY/EWQOV/GR/C7GKhyNqflPC/+I=;
 h=Date:From:To:Subject:From;
 b=YrnrGJ3P/0JGCIaW6hZk71iuW20cHjsRK4RH9d8CVDGErEPGQufdaPRmOcVtABmuA
 91YWrvCxT2zc9GhB32uLT1ODFbVASwjRAUB1HHmG0G+0zT01BHIxzN6P+2MtdQ4DVr
 3NHlDaDAwaGvu/6w2JAHPTWSHT1LZIu1pL1TOG2Qv70sLBPL0YYLn3ad9qGSj30I5L
 /GkIwVFzfdT67rtnhkM5e54cooMBhbIoHq4lw7+0Y3h5dMT2dklfATkWHKuaFbI2kk
 9Ha33fiPUi8v3CXzpuDtcCYa7hPSpbgqCJ4JPeTIFGVCKJlaLUspIYQoMBLoBKY+fr
 +0p0PTLc5/qaQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C04D631E0634; Sun, 18 Oct 2026 11:29:07 +0200 (CEST)
Date: Sun, 18 Oct 2026 11:29:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <atSRYnTOayKlrbjq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/erlang: enable uClibc support
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

uClibc support was disabled in commit:
fb72418160417e9e872f626c356f898bff49cf48.
This problem is solved in 1.0.59. So in internal
Buildroot toolchains and external Bootlin toolchains.

The change can be backported to stable branches.

Tested with aarch64 and external uClibc Bootlin toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/erlang/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 724f91123b..d3fe0dbec1 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -15,11 +15,11 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-comment "erlang needs a glibc or musl toolchain w/ dynamic library, threads, wchar"
+comment "erlang needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_UCLIBC
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
@@ -27,7 +27,6 @@ config BR2_PACKAGE_ERLANG
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
