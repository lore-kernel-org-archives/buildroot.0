Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1406AE7BD81
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31ED60B44;
	Mon, 16 Feb 2026 09:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0Thakj3Z8cX; Mon, 16 Feb 2026 09:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1484C60840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771235807;
	bh=IJiJlgVq+nBMEEtnmO6s0KqKBHseg7HrIYHWP62vmo4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jnHE/W6WNvkg1p7Pi6+ldRG6r88d3uCUk/InhRPOtQsMl/32q9JJb9pDYGsFij5b0
	 hYNvBGJNiTa4TRqZzjODb0Cf6T79shlazxwYhk9GdD+7AVQEK02TJzZaNL037SFfxj
	 KxDyn4SmmLQW2xK7uDudGTK0YjeNSS49XTAJIu/JdyAcuoHtZBfARdLga4Vdr8s0qp
	 hAth+6sU2jD1G/bCUZzv29fESVL12qCc5HMZZYw24Ah9GQIdF5vYcIxuVvMazt+9Xi
	 8U0z2FbiITfg9pexOY8qXA7rO9v60IfQCjae2J4UBqJSGQy80ryHhP64ZuEMl1HS9K
	 jCyKDdfUFOhdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1484C60840;
	Mon, 16 Feb 2026 09:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 210D81EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1200E40940
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFPtN6wWayCV for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 058D3408BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 058D3408BA
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 058D3408BA
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:56:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9692B4E40E64
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:56:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69F16606CF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:56:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 825CE10369036; Mon, 16 Feb 2026 10:56:41 +0100 (CET)
Date: Mon, 16 Feb 2026 10:56:40 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aZLpW6VY-EmXGyn-@windsurf>
References: <20260216-openscap_cpp-v1-1-3372149da5b0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216-openscap_cpp-v1-1-3372149da5b0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771235802; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k+jmB9oYMBydlv8tR9L84X4jve3ULXMPGuttSk5BZFI=;
 b=Hi44gUNn05a/Py5G/0rEwLKBU7Iq7StVegFV0Y/1YSLiNwD2GJE95qko2dMtJqYZJlUvav
 4S/E+7n5JxXPNqlxzZovW/B4y3+Q4dmiNxrqPpsaf4MhwGyEZ625UsucOCK91m0lrkT70X
 GuzCNC4QlPwX1buebsFqDRw/TCz+5QLYR93aAYLfSH8Y+oikCAcPEWkuSkLVfCvheXf+sr
 NPMFqqC2lQ0015S+fqasU/UOAefgRCvG47FVzpKqwX1MaONwrdRx9Ehx8LCFOxpkk7ArRF
 7KNXUsGcP+iPEdWWhSRRGFBMtFOg5OpkTo/Jb3sUzbaOrl/0bYPnj5bQ9O3O9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Hi44gUNn
Subject: Re: [Buildroot] [PATCH] package/openscap: set dependency on C++
 support
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

Hello Alexis,

Thanks for the fix!

On Mon, Feb 16, 2026 at 10:40:42AM +0100, Alexis Lothor=E9 wrote:
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

From a quick look, it doesn't seem like openscap contains C++ code. So
instead the right fix is most likely to change CMakeLists.txt to check
for the C compiler only.

To do that, in CMakeLists.txt, change:

project(blabla)

to

project(blabla C)

Best regards,

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
