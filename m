Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A6EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 22:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB196F8FC;
	Thu,  9 Dec 2021 22:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rr8nd6ZdrHq; Thu,  9 Dec 2021 22:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61ED16F8ED;
	Thu,  9 Dec 2021 22:05:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6063A1BF350
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 478B66F8ED
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLyVh-0AALgo for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 22:05:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 054AF6F8C4
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639087534;
 bh=CNSuKsXre4/NGV27wY0S2wVc3lOiQskEqNPZhg8nOls=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kWu/Oifs4p8UGUehG6ZmrjftkLhgtJxYeMdCgeXiur00rt4nmafTw34rL6xIr6X8i
 G9itpx8KFJmyBnItopQKybtGDp0OuoVheTJKWYcjcZTB2sbQxOGNVebpw2CTqeHv8U
 AzLm/UEg6F7P1gqlYIsQweoQBLgX0MuUlIf0ZQcE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1monh80WRU-00B62G; Thu, 09
 Dec 2021 23:05:34 +0100
Date: Thu, 9 Dec 2021 23:05:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20211209230533.013e9e83@gmx.net>
In-Reply-To: <20211209215231.471017-1-angelo@amarulasolutions.com>
References: <20211209215231.471017-1-angelo@amarulasolutions.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:s1nK4Jg36t/nSSLIWzEpwrwxpkw+uNacd1u71jgKa8wrbNI2bKP
 ReOdr8ULxi/sXOSwphbKmql3mJyR1q/EoekBycPU9YJ/HhD8qvP8xkL4/LMDRqtUdbACd4u
 q18rI15hW+rzcBqN0Uudxqsp9hL6vNNDPm/9NHwT+VOtXMqy195yqyB9LAxOu4ymN79sHAK
 jEmVe5x5O+UZg0Niz6r4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2rN3Wp6Ih6o=:n3ojZz3KIrFLfgSTscHRTP
 cz20BYxPqrLQwQgU/DNkAxyV91FYDaC0CCkagfl9VgLW9vPgh++cH1Hg5ETxBpRGDn8j2Tmew
 /PcBkR5/WVuFhYQihxTew9e5hxI++iGbG/12m7U+eIL1GY2xasIbunsgQk8A1jza35A+lHi5V
 sKn9embx72id2P9yJLj/b7QFJnRLRei3ZB4F644hRfNAcDNLmWfEMpjVYLP0L3jjS2fD0r3Ga
 0ZobHIbwf9D4oxs2cbYFCPaYHXNmrWsB1zsZN2V0VRlUgspYvHifh/NkQVTV5e/qkMV5EiUEo
 /j/HcbcWmQ7+IAfcQIf8fzv7DGs7TWmkaCPqAFthw1nfxo/1PXpZXGD+RNkSkRHotmhdO55N+
 KDNNH2swuHA3rduhcN8bTIHdDKmRcsiMq/CKLj27KjOnjmyybkCNUGid3eJIrLWEEkiFqjF12
 Fnn0Wifkj+HJrkk0rC+t3Dh+oUwfubrY2naecQVa5gu8oEpsE47Gwm59ChRxe+bvUC10VOntg
 SvdTnGX5UJJEgiUrZDsWgKdBsTUz+PANS/puzHNFMabI+n6k17XIhYSWkEZerbn7+gdwDsAp2
 2thZ4Bxbln1cAfGQSMn5bnX7KW6fsDkex26AkGiTg/Fe169+9mtlNf8RPBH3gdbeQH1U6HZYk
 CMxQ98M0OsGNv9b1opoJ2z3qPNrb4R+1fhivgWwq22kzCY1KMOxVVubQhbRV7uUOD5ren8TaY
 +6eDXdM/SNJy3DM2ymXDbP3x5DdGdr/MkGSiaG2Uurq/jGrbDn7v6sDV6SmhlnmotL76rAu40
 MjagDKRJEBThsaV8ckq5KvWbMUoKlDlVdGXT913BlFij3u9CGeggu0dZCRHii54kRT8mQgiat
 cYAY8GacCNpqRx97JV81pOv4hnKqndXkIxLOIfwlEprExZSLFYwwYmjm/BRyyPhJTClwliRyS
 EYaVvFgaHVeoRikgKEJjp5F3sgUdWF0cPhuOYWlIpG23KUw98sDXpGEHTqAqioBO05upWAdtE
 BWtzntUWxYgoIsD8CTCz7z7+8bw/okrvGKCDg9215mVSsbleCUrjkqgA2vZVQXdEIyTbTJQvJ
 kGYkSsDJbEKZIQ=
Subject: Re: [Buildroot] [PATCH] package/grep: bump to version 3.7
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

Hello Angelo,

On Thu,  9 Dec 2021 22:52:31 +0100, Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/grep/grep.hash | 2 +-
>  package/grep/grep.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/grep/grep.hash b/package/grep/grep.hash
> index 9dfe2f2c23..4759e3a9b0 100644
> --- a/package/grep/grep.hash
> +++ b/package/grep/grep.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature
>  # http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz.sig

Missed to fix the comment...., did you check the signature?

Regards,
Peter


>  # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e  grep-3.6.tar.xz
> +sha256  5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c  grep-3.7.tar.xz
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
> index 27d204d4ce..233f5fe633 100644
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GREP_VERSION = 3.6
> +GREP_VERSION = 3.7
>  GREP_SITE = $(BR2_GNU_MIRROR)/grep
>  GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
>  GREP_LICENSE = GPL-3.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
