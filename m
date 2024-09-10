Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DAAEDE9B4
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 463B940078;
	Tue, 10 Sep 2024 20:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwNg9G-gLXT3; Tue, 10 Sep 2024 20:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D32A3406A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32A3406A3;
	Tue, 10 Sep 2024 20:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA1A61BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7CC0608C2
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C48FUoT_B91 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59472608C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59472608C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59472608C0
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:33:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D928D5FFA3;
 Tue, 10 Sep 2024 22:33:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Sep 2024 22:33:06 +0200
Date: Tue, 10 Sep 2024 22:33:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZuCtAriDdKLsoPtZ@landeda>
References: <20240910070823.4158894-1-peter@korsgaard.com>
 <20240910070823.4158894-9-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910070823.4158894-9-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726000389;
 bh=BeFpou74gycWEPijnsXpVucfJJ/WBH8vG1WSJXbQWg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ojszR/TKpxAn7pDS6NlFS+cCZq8NnliYZPPh2yLZjN/Kf+8+ChbxBkmEVs2ZViJEp
 dNcce+lzN1nysmn8vb9y1/4W4kHzwcSBHs+Yeb26yMd3UVnn0fhiql77xB9RbbsBeY
 4j698hCX9iFrhBJ5Sp98HZB2Z1BcOUYkshXbHLb+m8qTLYZt0B36w1Hs8O7Gll4bTZ
 cKOrpYJHbmFeaxeO4WukvzpgGF9tXSyU8OW1X4Q+jf/TQvUWu27foTvjuIVdHMNRav
 PBRLlevfbbarUrUJ9hno4Fz0aVrxhxYlsNZeoW5iYxBJurU4sZTz44d7bE5BVT8sXt
 eIkUfUeNaAX1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ojszR/TK
Subject: Re: [Buildroot] [PATCH 08/42] docs/website/copyright.txt: fix
 oboard typo
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

Peter, All,

On 2024-09-10 09:07 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I also fixed the commit title: s/oboard/aboard/ ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/website/copyright.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/website/copyright.txt b/docs/website/copyright.txt
> index 3fe19bab8b..4d19bbf828 100644
> --- a/docs/website/copyright.txt
> +++ b/docs/website/copyright.txt
> @@ -18,7 +18,7 @@ GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR
>  INABILITY TO USE THIS WEBSITE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR
>  LOSS OF HAIR, LOSS OF LIFE, LOSS OF MEMORY, LOSS OF YOUR CARKEYS, MISPLACEMENT
>  OF YOUR PAYCHECK, OR COMMANDER DATA BEING RENDERED UNABLE TO ASSIST THE
> -STARFLEET OFFICERS ABORD THE STARSHIP ENTERPRISE TO RECALIBRATE THE MAIN
> +STARFLEET OFFICERS ABOARD THE STARSHIP ENTERPRISE TO RECALIBRATE THE MAIN
>  DEFLECTOR ARRAY, LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE
>  WEBSITE TO OPERATE WITH YOUR WEBBROWSER), EVEN IF SUCH HOLDER OR OTHER PARTY
>  HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
> -- 
> 2.39.2
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
