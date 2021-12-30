Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3973C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73447405C6;
	Thu, 30 Dec 2021 20:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aG37PiSovx6q; Thu, 30 Dec 2021 20:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FA0B405C5;
	Thu, 30 Dec 2021 20:44:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE54A1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC37960C18
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvAO22gk1fqM for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B39B3606ED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:43:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DA26B240005;
 Thu, 30 Dec 2021 20:43:40 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:43:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211230214340.140ebaed@windsurf>
In-Reply-To: <1ca8d1fd844e7e9ba59daa8270badda9fa93842c.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <1ca8d1fd844e7e9ba59daa8270badda9fa93842c.1636810092.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 11/16 v2] package/pkg-utils: introduce
 helper to properly json-escape a string
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

On Sat, 13 Nov 2021 14:28:22 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> In quite a few places, we need to generate string that are proper JSON
> values or keys.
> 
> However, JSON is very strict on what constitute a string, and most JSON
> parsers (like jq or python3's json module) are very picky when parsing a
> string; any deviation from the spec is immediately sanctioned by a hard
> error (jq aborts, python3's json module raise an exception).
> 
> Introduce a macro that properly prepares a Makefile value into a valid
> JSON string:
> 
>   - backslash '\' must be escaped;
> 
>   - double-quotes need to be escaped of course, as they are the string
>     delimiter in JSON;
> 
>   - anything in the range [0x00..0x1F] must be escaped; in practice, we
>     only ever need to escape \n, \t, and ESC (we could add more in the
>     future if need be);
> 
>   - finally, we also escape the space, \x20, so that we can call
>     $(strip) on a JSON blurb (like we do for example do build a
>     comma-separated list, or when we sanitise the JSON) without losing
>     multiple spaces where they make sense.
> 
> It would have been nice if we had been able to split the macro on
> multiple lines, but spaces creep in from everywhere in that case, and
> getting rid of them is getting quite nasty... We could introduce
> intermediate macros, but meh...
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-utils.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
