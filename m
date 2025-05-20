Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CECC54E65
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 23:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BC380AED;
	Tue, 20 May 2025 23:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLHj-PnTAO6b; Tue, 20 May 2025 23:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3233480AB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3233480AB0;
	Tue, 20 May 2025 23:40:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BEE1BF
 for <buildroot@buildroot.org>; Tue, 20 May 2025 23:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F4C6400FB
 for <buildroot@buildroot.org>; Tue, 20 May 2025 23:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLrtRGT02H0G for <buildroot@buildroot.org>;
 Tue, 20 May 2025 23:40:43 +0000 (UTC)
X-Greylist: delayed 7218 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 20 May 2025 23:40:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EA45400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EA45400F9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.107;
 helo=smtp-outgoing-1903.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net
 [160.92.124.107])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EA45400F9
 for <buildroot@buildroot.org>; Tue, 20 May 2025 23:40:41 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b27JL6xp3zPjd8","contextId":
 "7c38ca5d-2f8f-4bf0-9532-ce1cd7a2af99"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0117.laposte.net (SMTP Server) with ESMTP id 4b27JL6xp3zPjd8;
 Tue, 20 May 2025 23:40:18 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b27JL6McvzPjct","contextId":
 "26254621-375b-4461-a377-f667035d3a8b"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0117.laposte.net (SMTP Server) with ESMTPSA id 4b27JL6McvzPjct;
 Tue, 20 May 2025 23:40:18 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id EFA6166FCA62; Tue, 20 May 2025 23:40:27 +0200 (CEST)
Date: Tue, 20 May 2025 23:40:27 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aCz2yzLU7y0HenIB@romuald.bergerie>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250520174435.1385934-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250520174435.1385934-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1747784439;
 bh=EMiKoG6Wii2bUQYMW/sb7bthL6TfrLrYOVg/iNlpPSo=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:Content-Transfer-Encoding;
 b=EdRMMUwZTrJ5LEWlmOEe47q3/Yg6Vfd/5rHQUrRc2OZPgqEFtVBVaOPtaXnXgQ3fOUxgfXY5HANKuEyBSU8XkZQK4L5jd9gYuSKBwPhojcvPus/BPPxCVue7uXgrF1I6z2vzdRtRPl5xQqpyFAYLts1MaKSo6uoeCy6CJLDYdtpO9IOa8FVQIN5gBlHojuIdo/nknUhlg23oUQ/4s31fRz91GTapOg1DBPLaMtzOzD33agkYGVjmL6ck05M537oQl0JF0TYUlMpClBMKWzVHI56doA6mxpb/VTqZyDJovpXziSSktg8s8UrfK/iEBBjf1VZtor4uOc2nk4/w96yCpw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=EdRMMUwZ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_xen: fix runtime
 test
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 20, 2025 at 07:44:35PM +0200, Julien Olivain wrote:
(..)
> Since this commit [3], the test_xen runtime test is failing
> while attempting to set the date. This is because it is invoked before
> the test script executes this "stty raw" command.
(..)
> this commit simply moves this "stty raw" invocation
> from the runtime test script to a custom /etc/profile.d/stty-raw.sh
> file on target rootfs overlay, to do this call just at the login.
> =

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/10000011350

Hi Julien,

Thanks for catching and repairing this!

Your patch does indeed fix the Xen test for me, on gitlab and locally.

  Tested-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>

Best regards,
Vincent.

> =

> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/055f82ebbd07b582c=
992eed30ef5191f18873ba4
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/cd0ffd598cf94b9d1=
5c489f2429602825a18753c
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f15776=
37bfef0ece78dd519b25d19
> =

> Cc: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/10090263362
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
