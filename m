Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF040C5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 10:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B64832EA;
	Tue,  3 Jun 2025 10:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYN0qVhsqmLR; Tue,  3 Jun 2025 10:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F03483547
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F03483547;
	Tue,  3 Jun 2025 10:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 584631F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 10:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E59740A95
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 10:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXPISKvh7lky for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 10:11:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 309E1404FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309E1404FE
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 309E1404FE
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 10:11:56 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id C51C2E00461; Tue,  3 Jun 2025 12:11:53 +0200 (CEST)
Date: Tue, 3 Jun 2025 12:11:53 +0200
From: Florian Larysch <fl@n621.de>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20250603101153.ijsprhtqilx45pya@n621.de>
References: <20250404182407.45244-1-christian@aperture.us>
 <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
 <20250531165014.2npnkjv763aecffp@n621.de>
 <CA+h8R2ryQT9aV7HF7qsrYwFC=dWFnY1rU0vXOSAZ=1Z5MDsb4Q@mail.gmail.com>
 <20250601115246.3yq77vy4diatl2lx@n621.de>
 <f3ce8e9f-d3f0-4b45-87ed-61b8d207f56d@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3ce8e9f-d3f0-4b45-87ed-61b8d207f56d@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748945513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJq4eiF9YKJY4mHrG+9VaOS29Mls6EzJe9byXUYkQ88=;
 b=z0BLwLNGm2amjtEXj4cQbT3u4A/DY5JWnEm3YQw93btEM4mLuXfxIk/azNyKo7voIP1syq
 WRg69xPW/a/uMJ9vq/9rtJ4Gga0l24zCyXtVQUK++dWYdzFbn9JSE+UMBlYwHA6571WHjn
 kee5NOPuj1qXKXy5GdavuP5diZPr/4U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=z0BLwLNG
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-cmake.mk: force config
 version >=3.5
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

Hi Arnout,

On Mon, Jun 02, 2025 at 10:17:09AM +0200, Arnout Vandecappelle wrote:
>  That is indeed a good idea. Do you have a patch already cooked up for that?
> I.e. something that checks a maximum CMake version in
> support/dependencies/check-host-cmake.sh ?

Honestly I just put an "exit 1" at the top of that script, but something
like

diff -u support/dependencies/check-host-cmake.sh support/dependencies/check-host-cmake.sh
--- support/dependencies/check-host-cmake.sh
+++ support/dependencies/check-host-cmake.sh
@@ -32,6 +32,10 @@ for candidate; do
     major="${version%.*}"
     minor="${version#*.}"
 
+    if [ ${major} -ge 4 ]; then
+        continue
+    fi
+
     if [ ${major} -gt ${major_min} ]; then
         echo "${cmake}"
         exit

Seems to work just fine too.

I think in the long run it's still better to actually fix the underlying
issues but in the short run it might be a nicer work-around than forcing
the minimum version to 3.5 - albeit at the cost of slightly increasing
the build time.

The downside of both are that they inhibit autobuild failures that would
otherwise showcase these issues, but there are less roundabout ways of
doing that anyway. I wrote a quick script yesterday to walk all
CMakeLists of (most of) the package versions included in Buildroot to
get a rough idea[1]. It's a bit noisy but there's still a lot of
packages that are affected by this.

Florian

[1] https://n621.de/fud/cmake-versions.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
