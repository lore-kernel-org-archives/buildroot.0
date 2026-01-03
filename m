Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7CCFC617F
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 14:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3FD60AD3;
	Sat,  3 Jan 2026 14:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjx3D0GjUpeo; Sat,  3 Jan 2026 14:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6585560ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767451067;
	bh=CDhtC0N2nOEwAsiZz7jFAblboqCmSOx9OtCnT/BTMgI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LLhZOlSC2dPa6PmjNsS8ASz1fcerKLdLSktHdPEfBPgJCYWEoONGS7RC11ATn1cIN
	 veSI4pKO8EoULOjqIUsgMJQ3ETbI6A8HCITKLwgBu909pkoks9FVvTybBJuQ4F1Etg
	 FhTSM0f0ZiUmPcEXZRvUHDrjsWi6AwSV5YRWs7B3zXC3km2nEF9+c568J9dJJzc61i
	 UAWd07+RBCnhSfV+61jS9EF1qMGBvOCGvAopKGIf/LB8y5mLz7M7oHxjNnOU7TVRHZ
	 GCkR5iG//B2E+VXNptC1MoovgM4cv00+F2jtJN3QcOBrp/MAlgD/jb6yQQX7ljzGfJ
	 pdi6az361CjqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6585560ACD;
	Sat,  3 Jan 2026 14:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29282249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22BF360ACD
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sboEfHbq213N for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 14:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA07E60AA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA07E60AA6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA07E60AA6
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:37:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B52294E41F2C
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 14:37:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 757DB6072B;
 Sat,  3 Jan 2026 14:37:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1038E113B023E; Sat,  3 Jan 2026 15:37:38 +0100 (CET)
Date: Sat, 3 Jan 2026 15:37:36 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260103153736.5f32717b@windsurf>
In-Reply-To: <20260102172639.1908616-1-bernd@kuhls.net>
References: <20260102172639.1908616-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767451060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=go+Rp+AmHIJ53hg05+wsIIohTL6wUvBmurPzr+/f6SA=;
 b=yEJwBX47vjkaSE3WubhXYG8MxiQ9ekr1n/shWs3FnbqpfkvTJ8IchmfOdl8Mms2CEPKbNg
 oixEUvXLCJRAVqvKtfUVXPH8Z4/0R7kXr5++4/lOT5DbjwBEnKb+3gGmn1D+5lxocqVwV4
 c67xFE/JWJizmTadOsBosqZp7rEim8bi6vsWI49M4CImCELBt0p+k/2daWggtF9kc7klQw
 QGCkt553eFdUwo5NJxtSHuXfjp1WhpkInbLcqf05qa5jkoOEHlITSXpltrrIuIcBWnfSMv
 HVjU/Icd0izrLc6szSegq5ibMS0m2ZrrsKE2rNjQkienBSTa3f7iX6rfd+v1og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yEJwBX47
Subject: Re: [Buildroot] [PATCH 1/1] package/xerces: fix build with recent
 versions of ICU
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Fri,  2 Jan 2026 18:26:39 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
> bumped package/icu to version 77-1, the build of xerces with ICU
> support enabled fails:
> 
> In file included from /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/uset.h:38,
>                  from /home/bernd/buildroot/output/build/xerces-3.3.0/src/xercesc/util/regx/RangeToken.cpp:40:
> /home/bernd/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/usr/include/unicode/char16ptr.h:271:55:
>  error: 'is_same_v' is not a member of 'std'; did you mean 'is_same'?
> 
> Indeed, ICU now requires C++17. Instead of using a patch from Gentoo[1]
> we use a backported upstream commit, limited to CMakeLists.txt, to raise
> the c++ version.
> 
> The build error was not recorded yet by the autobuilders but can be
> reproduced with this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XERCES=y
> BR2_PACKAGE_ICU=y
> 
> [1] https://bugs.gentoo.org/931105
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for the patch!

Does this mean that xerces now needs some
BR2_TOOLCHAIN_GCC_AT_LEAST_xyz dependency to make sure we have a C++
compiler that supports C++17 ?

Or maybe ICU needs this? Right now it only depends on gcc >= 4.9, with
a comment saying "C++11". Is gcc 4.9 really sufficient?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
