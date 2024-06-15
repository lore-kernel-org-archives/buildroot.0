Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FC4C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 08:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6421860717;
	Sat, 15 Jun 2024 08:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kP4sZtUuMVm; Sat, 15 Jun 2024 08:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27113606ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27113606ED;
	Sat, 15 Jun 2024 08:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 391841BF30B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 08:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25AD0405E2
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 08:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhvwqugCl_oO for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 08:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F2E64050D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2E64050D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F2E64050D
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 08:08:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D1F5F13F88F;
 Sat, 15 Jun 2024 10:08:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 10:08:13 +0200
Date: Sat, 15 Jun 2024 10:08:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zm1L7ZlBXIV2iowQ@landeda>
References: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718438900;
 bh=2SQeCBKgIlUBPzuNG0FP7Sv/WAFiIbMlWPdMsB4+b10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIn0rdcdjdDNvUpWwDXCnrjsiug6aleZ8m0rOCQBXv4K20wHmmTvJ41SEkVFN+5cH
 Ukp/uzp0O4ku+oAX4+ZS84+6GInrjO3+noJEZRe1uEUoVpqTz5MUKON7ELoDjFZ3xp
 LD2eCoNQFFVEUTFqKZj3UAE3JDIpE92+c3SH8lI/akWzdUuATho/092gBdHxfXypg0
 wR2LByJcNBVuscwE9TW9iIrwg5kta9kbnfqhKRetyVc6XmE9pW0t5o/T3FPWmiTEpE
 jthjoSgtabJXYCuuGtN8Z70cpSq1o39adTI1PKjI9YchoiXuVAMg5iB25haEeE9G7q
 kA57bzAuh0hkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZIn0rdcd
Subject: Re: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-05-14 10:58 +0200, Thomas Petazzoni via buildroot spake thusly:
> Our Bugzilla is so slow and unstable that it has become
> unusable. Let's switch to using the Gitlab issue tracker instead.

It would have been nice if you had suggested a plan to deal with the
existing issues.

We can extract the list of bugs from Bugzilla (as CSV):
    https://bugs.busybox.net/buglist.cgi?bug_status=__all__&limit=0&list_id=26023&product=buildroot&query_format=specific&ctype=csv&human=1

And then we can extract individual bugs (as XML):
    https://bugs.busybox.net/show_bug.cgi?ctype=xml&id=3

Gitlab can import from CSV:
    https://docs.gitlab.com/ee/user/project/issues/csv_import.html

However, the Gitlab import is ultra limited: it can only import issues
as a title, a description, a due date (optional), and a milestone
(optional).

There is no place for comments, attachments, status...

So, what do we do for the existing issues?

Regards,
Yann E. MORIN.

> There are still lots of references to the Bugzilla bug tracker in our
> News page at https://buildroot.org/news.html, but these are for older
> news.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/manual/contribute.adoc  | 2 +-
>  docs/manual/resources.adoc   | 2 +-
>  docs/website/contribute.html | 2 +-
>  docs/website/support.html    | 5 +++--
>  package/gcc/gcc.mk           | 2 +-
>  5 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index 6ff6c15314..c88035597e 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -25,7 +25,7 @@ for more information on obtaining a Buildroot git tree.
>  === Reproducing, analyzing and fixing bugs
>  
>  A first way of contributing is to have a look at the open bug reports in
> -the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot bug
> +the https://gitlab.com/buildroot.org/buildroot/-/issues[Buildroot bug
>  tracker]. As we strive to keep the bug count as small as possible, all
>  help in reproducing, analyzing and fixing reported bugs is more than
>  welcome. Don't hesitate to add a comment to bug reports reporting your
> diff --git a/docs/manual/resources.adoc b/docs/manual/resources.adoc
> index 68b7eb9062..4ef709c317 100644
> --- a/docs/manual/resources.adoc
> +++ b/docs/manual/resources.adoc
> @@ -40,7 +40,7 @@ better as it will reach more people, both developers and users.
>  Bug tracker::
>  +
>  Bugs in Buildroot can be reported via the mailing list or alternatively
> -via the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot
> +via the https://gitlab.com/buildroot.org/buildroot/-/issues[Buildroot
>  bugtracker]. Please refer to xref:reporting-bugs[] before creating a bug
>  report.
>  
> diff --git a/docs/website/contribute.html b/docs/website/contribute.html
> index aa1cf93f1b..95028ee788 100644
> --- a/docs/website/contribute.html
> +++ b/docs/website/contribute.html
> @@ -13,7 +13,7 @@
>  
>        <ul>
>  	<li>Reproducing, analyzing and fixing bugs from our
> -	  <a href="https://bugs.buildroot.org/">bug tracker</a></li>
> +	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a></li>
>  	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
>  	    autobuild failures</a></li>
>  	<li>Reviewing and testing patches sent by other developers. See the
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 28873c6d76..75551b770e 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -80,8 +80,9 @@
>  		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
>  		</div>
>  		<div class="col-sm-11">
> -		  <p>If you think you found a bug in Buildroot, you can use the
> -		    <a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
> +		  <p>If you think you found a bug in Buildroot, you
> +		  can use the
> +		    <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">Bug Tracker</a> to post your bugs and/or
>  		    participate to find solutions to existing problems.</p>
>  
>  		  <p>Note: patches are only accepted through the mailing list.</p>
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 672f9472a9..e4780353cb 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -83,7 +83,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  	--with-mpc=$(HOST_DIR) \
>  	--with-mpfr=$(HOST_DIR) \
>  	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
> -	--with-bugurl="http://bugs.buildroot.net/" \
> +	--with-bugurl="https://gitlab.com/buildroot.org/buildroot/-/issues" \
>  	--without-zstd
>  
>  ifeq ($(BR2_REPRODUCIBLE),y)
> -- 
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
