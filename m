Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F2C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7A56079A;
	Tue, 18 Aug 2026 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5AMwr7yig7z; Tue, 18 Aug 2026 18:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F276078D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787077269;
	bh=PW3HQl7ya4UhkclPoeQVS8Y6W/3jCXQpKwXxFN20krA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NvMMk9gplvd/RsxAjdaNUffRp6oe1H1kMNSKOuHwsCGoK+jjxkVCa/0lke4pO9FH/
	 Zi0HnS+A0URpqGB74MGJ2I3bCuh+BxyqaM7OGIk5D+LOUw0+NNFzj3TwDYkhQgzKfO
	 t/NZyJEs4unh7mNpYDdqCWmLmtgIMav3TUO5gNG7k/fJvxEOmJwR51ljrO00oZY2Vo
	 TSPdHn4MSwM5UzvKCKryD0N9wCGVF8Xdaz1lJt6I4AqXXMypVnBBYJUEy0gr8kOAmo
	 asYxZ+FgX5IjQUREPkz993lDnXBHjqqo92ZYiWksa84uQBcRwBoP75frbb29Ot07zf
	 D4V8YN1B1355g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F276078D;
	Tue, 18 Aug 2026 18:21:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEC582FD
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 18:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFEFE6078D
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PAjMNvJpYi2 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9994560706
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9994560706
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9994560706
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787077265; bh=lTuge1GyLRoKSJTzbSHaOyY04Da8oaQvDbqKJdJ1yLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7wTN36XK6tLIHdvds6EUCS5vsFAY7libBwcggpAu9Sd5XJXR8yeo3SEdOxtsV0u/
 tpXrPg9mt6llGbfsJO67Yv+LvA4j7CxeAS/2SMtM9qw1oZFozhVUN8PILV+HzB4we8
 Bi0htGOg/D2/29akpA/K6LnIUkckR0cIfoOxE4H5ZoIQTpqQqrA/GS+85Q6DsocYeD
 f8oqkD/hRVm3VRMXsUvPWEJN4orH8Iyd6VBAZYVGKtwheLbQd3mBRIwPgpkAn71Ioc
 vgHVwXwwpANyTCGqUAkE1PrGBscrmukvdbQuufOapYTHParvBzcBXfcApF29jaARx3
 QxYumH2itsw9A==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 85FD131E0AF6; Tue, 18 Aug 2026 20:21:05 +0200 (CEST)
Date: Tue, 18 Aug 2026 20:21:05 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aoSikbmgH9HZsX5Z@waldemar-brodkorb.de>
References: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de> <aoQIk-X_afYgeQQN@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoQIk-X_afYgeQQN@windsurf>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable FENV support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, Aug 16, 2026 at 11:24:40AM +0200, Waldemar Brodkorb wrote:
> > Enable FENV support unconditionally when a hard-float toolchain is in use.
> > Useful for packages as quickjs and chawan.
> > Adds 24kb to the C library on aarch64.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> I am not 100% sure, but this seems to have broken the build of gcc
> 14.4.0 on x86 32-bit:
> 
>   https://autobuild.buildroot.net/?reason=host-gcc-final-14.4.0&libc=uclibc
> 
> Even though we've had gcc 14.4.0 for a while, this only started
> happening on August 16, first bad commit being 9ac19958, which is
> shortly after this fenv support in uClibc was enabled.
> 
> And the build failure clearly connects to fenv:
> 
> In file included from ../../../libquadmath/math/x2y2m1q.c:19:
> ../../../libquadmath/quadmath-imp.h:310:8: error: redefinition of 'struct rm_ctx'
>   310 | struct rm_ctx
>       |        ^~~~~~
> In file included from ../../../libquadmath/quadmath-imp.h:32:
> /home/autobuild/autobuild/instance-16/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/include/fenv.h:137:8: note: originally defined here
>   137 | struct rm_ctx
>       |        ^~~~~~
> 
> Could you have a look into this?

Yes, you are right. I always had libquadmath disabled in my
toolchains while testing. Fix sent to the BR mailinglist right now.

https://lists.buildroot.org/pipermail/buildroot/2026-August/807736.html

Thomas, are there any plans to update the Bootlin toolchains?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
