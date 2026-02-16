Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8928BE81A40
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4221560D68;
	Mon, 16 Feb 2026 16:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCE1yRfSRIoj; Mon, 16 Feb 2026 16:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB4A60D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771259387;
	bh=KqGhdsGFQYS/SQlri4UNFwkZamqeRvZKR4RkHxsLBZw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fU14+yJ5fguz2uIWOSl+IPTC5CAcox/5wIRV5ohyZAYwnpEJC/CMm2BfCvPIGWO/p
	 Hb8qSqHm5f7Nv39mXHYTNok0MigciRnD2bH1wQgo/BlcmsNWUW063uOx1X/v9uMD61
	 fWbFU3JArFJPEZ29/1GO7HZdyfCUhEvd4lfrHSCdw2ndAXc4tVIpgbf4KKMC/bm5ps
	 7kEm0Eoaf3+TKrLMoYK44PNQNcWS4DfXXngQaTp+Dhfxy+Ts0/IDMHckHaQiyGSvl2
	 AOHt6rjVtsd74hxuKULdhww5xH6NluIrbvQXxJ++rIz0EOshEvMsCK/RQEZ0YYtEqu
	 uO0+a68WTxSkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB4A60D6D;
	Mon, 16 Feb 2026 16:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1329B35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014A640C6F
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82aGX1pT5zNc for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 16:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B92240CB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B92240CB1
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B92240CB1
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:29:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8FAE81A0FEC
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:29:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C499606CF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 16:29:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98FF7103690D7; Mon, 16 Feb 2026 17:29:41 +0100 (CET)
Date: Mon, 16 Feb 2026 17:29:41 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aZNF0ReJoNKF9Teo@windsurf>
References: <20260216-openscap_cpp-v2-1-a61c7bb50837@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216-openscap_cpp-v2-1-a61c7bb50837@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771259381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PVtfmzCNtGd8KnPlcwnCuMfth0p+4ogIuXH3yVaAcMU=;
 b=Z7RMPvHrFjfqpTjyTiRduCy/YJ71omyUPL7YC+pVjLVubs7kR64Sc973F+vX/8bHHNENDA
 Xfvrs2vCE6/RvGS1U6ffFD3Rf/NFLXmSYmMXURMdO2PX9RUgPMELSHK99fDKnGBTUoAL1d
 vro/hEaowtlt+ixC9LNIu4FzkeSl0y+aNYIEai01idJgwPT2AFh137H9qvwWE/1X1uRk3L
 9tU/ezPivawq5HvN40LcnJQbEz7RRXligg7PdtWidPcx1lN8Gwqn0rxBSltYnZ0TGuMcQB
 nx1fGJVSO7uhxelTo4nCWmyVsUGaQj/yY/UJ1geQuLuybWfLGdjsMs4JGInnzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Z7RMPvHr
Subject: Re: [Buildroot] [PATCH v2] package/openscap: add patch to enforce
 project as C project
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 16, 2026 at 05:13:05PM +0100, Alexis Lothor=E9 wrote:
> When the toolchain involved in openscap build does not support C++, the
> configure step fails with the following error:
> =

>   -- Detecting CXX compiler ABI info
>   -- Detecting CXX compiler ABI info - failed
>   -- Check for working CXX compiler: /bin/false
>   -- Check for working CXX compiler: /bin/false - broken
>   CMake Error at /usr/share/cmake/Modules/CMakeTestCXXCompiler.cmake:73 (=
message):
>     The C++ compiler
> =

>       "/bin/false"
> =

>     is not able to compile a simple test program.
> =

>     It fails with the following output:
> =

>       Change Dir: '/home/autobuild/autobuild/instance-6/output-1/build/op=
enscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCompile-tUydqI'
> =

>       Run Build Command(s): /usr/bin/cmake -E env VERBOSE=3D1 /usr/bin/ma=
ke -f Makefile cmTC_1834b/fast
>       make[1]: Entering directory '/home/autobuild/autobuild/instance-6/o=
utput-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCo=
mpile-tUydqI'
>       /usr/bin/make  -f CMakeFiles/cmTC_1834b.dir/build.make CMakeFiles/c=
mTC_1834b.dir/build
>       make[2]: Entering directory '/home/autobuild/autobuild/instance-6/o=
utput-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCo=
mpile-tUydqI'
>       Building CXX object CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o=
 /bin/false    -o CMakeFiles/cmTC_1834b.dir/testCXXCompiler.cxx.o -c /home/=
autobuild/autobuild/instance-6/output-1/build/openscap-1.3.12/buildroot-bui=
ld/CMakeFiles/CMakeScratch/TryCompile-tUydqI/testCXXCompiler.cxx
>       make[2]: *** [CMakeFiles/cmTC_1834b.dir/build.make:81: CMakeFiles/c=
mTC_1834b.dir/testCXXCompiler.cxx.o] Error 1
>       make[2]: Leaving directory '/home/autobuild/autobuild/instance-6/ou=
tput-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCom=
pile-tUydqI'
>       make[1]: *** [Makefile:134: cmTC_1834b/fast] Error 2
>       make[1]: Leaving directory '/home/autobuild/autobuild/instance-6/ou=
tput-1/build/openscap-1.3.12/buildroot-build/CMakeFiles/CMakeScratch/TryCom=
pile-tUydqI'
> =

>     CMake will not be able to correctly generate this project.
>   Call Stack (most recent call first):
>     CMakeLists.txt:11 (project)
> =

>   -- Configuring incomplete, errors occurred!
>   make: *** [package/pkg-generic.mk:263: /home/autobuild/autobuild/instan=
ce-6/output-1/build/openscap-1.3.12/.stamp_configured] Error 1
>   make: Leaving directory '/home/autobuild/autobuild/instance-6/buildroot'
> =

> The openscap project does not contain any C++ file, and so does not need
> a C++ capable compiler. Bring the to-be-integrated-upstream patch
> enforcing C language in CMakeLists.txt to prevent this build failure.
> =

> Fixes: https://autobuild.buildroot.org/results/1fe550ffa79f0a083a450ae03f=
e067a8ab7336be
> Fixes: https://autobuild.buildroot.org/results/e9d52b52658544916022050c78=
dcb137ca6c97e0
> Fixes: https://autobuild.buildroot.org/results/4a9c21763aaddb217ee5f8bb89=
47faad9767baa3
> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Thanks for this new iteration!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
