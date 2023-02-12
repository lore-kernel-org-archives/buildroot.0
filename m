Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9631AC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 08:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35F22817AB;
	Sun, 12 Feb 2023 08:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35F22817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uojatjY_b6si; Sun, 12 Feb 2023 08:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82D08817A8;
	Sun, 12 Feb 2023 08:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D08817A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABDA21BF4E2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8633240256
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8633240256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqzQbZ25SE2N for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 08:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 218CD403BF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 218CD403BF
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:40:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DDCDAC0004;
 Sun, 12 Feb 2023 08:39:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pR7tt-001vV1-E5; Sun, 12 Feb 2023 09:39:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230210223143.1060114-1-yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2023 09:39:57 +0100
In-Reply-To: <20230210223143.1060114-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 10 Feb 2023 23:31:42 +0100")
Message-ID: <87wn4nb7ky.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/download: catch post-process
 errors
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when the post-process helper fails while downloading from
 > upstream, there is no fallback to the backup mirror.

 > In case the post-process helper fails, we mut consider that to be a
 > download failure, so we must bail out as if the download backend itself
 > did fail, but we fail to do so.

 > Duplicate the logic we have for the download helper: if the post-process
 > helper fails, remove the downloaded stuff, and continue on to the next
 > URI, which will ultimately hit the backup mirror (if one has been
 > configured).

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed after adding a fixes:
http://autobuild.buildroot.net/results/12a/12a63ae177fe3ed0c9a1ef2fa01870f334f36b0f/,
thanks!

> ---
 >  support/download/dl-wrapper | 12 +++++++++---
 >  1 file changed, 9 insertions(+), 3 deletions(-)

 > diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
 > index 09a6ac1f1a..1e8d6058f6 100755
 > --- a/support/download/dl-wrapper
 > +++ b/support/download/dl-wrapper
 > @@ -138,9 +138,15 @@ main() {
 >          fi
 
 >          if [ -n "${post_process}" ] ; then
 > -            "${OLDPWD}/support/download/${post_process}-post-process" \
 > -                -o "${tmpf}" \
 > -                -n "${raw_base_name}"
 > +            if ! "${OLDPWD}/support/download/${post_process}-post-process" \
 > +                    -o "${tmpf}" \
 > +                    -n "${raw_base_name}"
 > +            then
 > +                # cd back to keep path coherence
 > +                cd "${OLDPWD}"
 > +                rm -rf "${tmpd}"
 > +                continue
 > +            fi
 >          fi
 
 >          # cd back to free the temp-dir, so we can remove it later
 > -- 

 > 2.25.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
