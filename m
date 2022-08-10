Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E045C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98FBF409EA;
	Wed, 10 Aug 2022 21:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98FBF409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ncr4irNsK3Q5; Wed, 10 Aug 2022 21:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC759408F1;
	Wed, 10 Aug 2022 21:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC759408F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2B31BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5FAA81317
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5FAA81317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnR4bH-KZasi for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F098812E2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F098812E2
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:22:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88FA3240004;
 Wed, 10 Aug 2022 21:22:03 +0000 (UTC)
Date: Wed, 10 Aug 2022 23:22:02 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220810232202.7615c1fc@windsurf>
In-Reply-To: <20220809211837.2549340-1-fontaine.fabrice@gmail.com>
References: <20220809211837.2549340-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660166523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9e8S2Iwy58MBWgMLMIWo5S2Kb9DU2TSzYIqNFDrJEIA=;
 b=C5PcmuL9E0rrX2YKdgvhpE8Lk+nWG4g8tOuRhtgRiAQBAXfUjGkXm2Fco97Gp5fx6VI01M
 qYjVeN+XQ4iZHJRpxPA2xGsgaRWRVkGFygrqGdeykGCozmLxDTvGUcZsXicGY0Tvn395zc
 tQYmIA2NTjgqIYNkfvjTvHXQjgZ7l6fBxu0b3/BDAExLs7ikCeBvqSnhblwpzZd5F3BPgu
 ofE5BmkkK8boxyjevkv4wJeu+Ck2tQMb475rgc7xy5i6zd6QSsFha41SbtYXoW/x2Mx7mR
 yP1SFmibRIIbGSs0MwFocdU2hm34CZCW8wzLwANUAuaSgtAMZ6bFobvrT4sAzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C5PcmuL9
Subject: Re: [Buildroot] [PATCH 1/1] package/glog: fix build without threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Aug 2022 23:18:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without threads raised since bump to
> version 0.6.0 in commit 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d and
> https://github.com/google/glog/commit/4a4331f2f2de4c35ce72badf0bdc604c04eebb26:
> 
> CMake Error at /home/giuliobenetti/autobuild/run/instance-1/output-1/build/glog-0.6.0/CMakeFiles/CMakeTmp/CMakeLists.txt:18 (add_executable):
>   Target "cmTC_ed950" links to target "Threads::Threads" but the target was
>   not found.  Perhaps a find_package() call is missing for an IMPORTED
>   target, or an ALIAS target is missing?
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bf0846a51da69169286c7af38089d204d3d242d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../glog/0001-added-emscripten-support.patch  | 290 ++++++++++++++++++
>  1 file changed, 290 insertions(+)
>  create mode 100644 package/glog/0001-added-emscripten-support.patch

Do you have an explanation of the link between building without threads
and the addition of emscripten support? The link seems not obvious, at
least to me :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
