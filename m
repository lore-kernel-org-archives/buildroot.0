Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A262C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0560360C18;
	Thu, 30 Dec 2021 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3IQMBscvJ_m; Thu, 30 Dec 2021 20:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 600AD60BCB;
	Thu, 30 Dec 2021 20:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 958CF1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 818D8405C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sao_w07ASjFD for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:47:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 137FE40385
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:47:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6AFAC20009;
 Thu, 30 Dec 2021 20:47:10 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:47:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214709.6e77b534@windsurf>
In-Reply-To: <dac8f92abae72426b9b1c19f1a3ee5e173d101e3.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <dac8f92abae72426b9b1c19f1a3ee5e173d101e3.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 16/16 v2] Makefile: introduce show-vars,
 a json-formatted equivalent to printvars
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Nov 2021 14:28:27 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The current printvars output suffers from a serious design flaw:
> variables are not delimited, which makes it impossible to reliably
> retrieve the value of variables; only variables that are known to
> not contain a \n can be relatively safely extracted.
> 
> However, in some cases, it is important to be able to retrieve the
> multi-line value of a variable, notably the CMDS or the hooks. One
> such use-case (to follow in an unscheduled future) would be to hash
> the variables that make up a package "configuration", and cache or
> extract the files for that package to speed up the build.
> 
> Modeled after printvars and show-info, we introduce show-vars (what a
> lack of imagination here) that outputs a json dictionary which keys are
> the variable names, and for each variable, provides the raw and expanded
> values.
> 
> Unlike printvars, we do not provide a way to get either the raw or
> expanded value; both are systematically printed; a user will get just
> the one is needs. Additionally, strings in JSON are quoted, so there is
> no need to provide a way to quote variables; that would not make sense.
> 
> Note: for printvars, we require that the user provides an explicit
> pattern to filter variables on. This is historical (see fd5bd12379dc,
> Makefile: printvars: don't print anything when VARS is not set). The
> underlying reasoning was that printvars is too "raw", and variables are
> not well delimited, so printvars was mostly used to extract a few values
> here and there, from scripts, or to quickly inspect a specific package's
> variables during debugging.
> 
> But show-vars, although technically plain-text, being JSON, is not very
> human-readable, and is mostly aimed at tools that will parse it with a
> real JSON parser, and which will want to have a complete view of a lot
> of variables at once. As such, and contrary to printvars, it makes sense
> to report on all variables by default, unless the user explicitly
> requested a subset.
> 
> As a final note: a lot of our variables only make sense in the context
> of an actual make target. For example, a variable of package foo, that
> contains $(@D)/bar, would expand to .../build/FOO-VERSION/bar. This is
> because our CMDS and hooks are expanded as the recipe of a stamp file
> that lies in the package build directory.
> 
> But for show-info, this falls flat on its face: it is not the stamp file
> of a package, so there is no package directory, and show-info itself has
> not directory part, so $(@D) expands to '.' (dot).
> 
> Additionally, some variables may contain calls to $(shell) (e.g. to call
> pkg-config), and this also does not work with show-info.
> 
> These two issues make it impossible to emit the correct expanded value
> of variables. To be noted: printvars has the exact same limitations for
> the exact same reasons.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Makefile | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Applied to master, thanks.

However, there are two things that are missing:

 (1) Update to the Buildroot manual

 (2) At least one test case in supporting/testing/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
