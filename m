Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC4BC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 16:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC69441B49;
	Thu, 29 Feb 2024 16:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chv2xSfVM0Dw; Thu, 29 Feb 2024 16:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B611F41B50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B611F41B50;
	Thu, 29 Feb 2024 16:28:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC651BF3D8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 280D04183C
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg9L0y_2Lv4K for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 16:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0161341836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0161341836
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0161341836
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 16:05:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 480D524000B;
 Thu, 29 Feb 2024 16:05:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiuI-004pVZ-2E;
 Thu, 29 Feb 2024 17:05:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240228224459.2383336-1-yann.morin.1998@free.fr>
Date: Thu, 29 Feb 2024 17:05:14 +0100
In-Reply-To: <20240228224459.2383336-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 28 Feb 2024 23:44:59 +0100")
Message-ID: <87il27dznp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: fix running on
 older python versions
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit f71d9f49e546 (support/scripts/pkg-stats: fix datetime deprecation
 > warning) forgot to consider that the datetime.UTC suggested by python
 > 3.12, was only introduced with python 3.11.

 > However, we are still generating the daily report on a python 3.8
 > version, which fails at runtime:
 >     AttributeError: module 'datetime' has no attribute 'UTC'

 > It turns out that datetime.UTC is just an alias for datetime.timezone.utc,
 > which seems to have existed since before python3...

 > Use datetime.timezone.utc instead of its alias.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

> ---
 >  support/scripts/pkg-stats | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
 > index 9a4a3ccad5..53898a36f2 100755
 > --- a/support/scripts/pkg-stats
 > +++ b/support/scripts/pkg-stats
 > @@ -1290,7 +1290,7 @@ def __main__():
 >          package_list = set([v["name"] for v in show_info_js.values() if 'name' in v])
 >      else:
 >          package_list = None
 > -    date = datetime.datetime.now(datetime.UTC)
 > +    date = datetime.datetime.now(datetime.timezone.utc)
 >      commit = subprocess.check_output(['git', '-C', brpath,
 >                                        'rev-parse',
 >                                        'HEAD']).splitlines()[0].decode()
 > -- 

 > 2.43.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
