Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F35C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1087405AE;
	Sat, 13 Jan 2024 13:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1087405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6Ies3PCSJKv; Sat, 13 Jan 2024 13:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4075540580;
	Sat, 13 Jan 2024 13:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4075540580
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8D4E1BF3BB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 952AB831D5
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 952AB831D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82BOzpvImyPK for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:27:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 649C1811F9
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 649C1811F9
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3F4260002;
 Sat, 13 Jan 2024 13:27:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOe2Q-00Cyu3-1O;
 Sat, 13 Jan 2024 14:27:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240108211420.360412-1-fontaine.fabrice@gmail.com>
Date: Sat, 13 Jan 2024 14:27:02 +0100
In-Reply-To: <20240108211420.360412-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 8 Jan 2024 22:14:20 +0100")
Message-ID: <87a5p9uzx5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3,1/1] package/liquid-dsp: fix x86 builds
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > HAVE_{MMX,SSE2,...} are not defined if ax_cv_have_{i}_cpu_ext is not set
 > resulting in the following build failure raised since bump to version
 > 1.5.0 in commit c2aaa0fbe2fdf6e599c68169aa7b2e55237190c7 and
 > https://github.com/jgaeddert/liquid-dsp/commit/02c4e8b99b11d9f1615b8840f243b08a85b86563:

 > src/dotprod/src/dotprod_cccf.sse.c: In function 'dotprod_cccf_execute_sse':
 > src/dotprod/src/dotprod_cccf.sse.c:258:5: error: unknown type name '__m128'; did you mean '__int128'?
 >   258 |     __m128 v;   // input vector
 >       |     ^~~~~~
 >       |     __int128

 > or

 > src/dotprod/src/dotprod_cccf.mmx.c: In function 'dotprod_cccf_execute_mmx':
 > src/dotprod/src/dotprod_cccf.mmx.c:262:5: error: unknown type name '__m128'; did you mean '__int128'?
 >   262 |     __m128 v;   // input vector
 >       |     ^~~~~~
 >       |     __int128

 > While at it, add AVX2 support

 > Fixes:
 >  - http://autobuild.buildroot.org/results/738ce9d3dc74ec165391f21256c955e5524f1632
 >  - http://autobuild.buildroot.org/results/a2d150c724ab6787aeabaf31f65116f802e8584e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3 (after review of Yann E. Morin):
 >  - Keep current list format

 > Changes v1 -> v2:
 >  - Keep old options (mmx, etc.) as they seem to be still used somewhere
 >    in the code

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
