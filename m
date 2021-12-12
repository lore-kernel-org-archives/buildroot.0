Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC48AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2059840010;
	Sun, 12 Dec 2021 21:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZO-lpdL1T4J7; Sun, 12 Dec 2021 21:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33959400D2;
	Sun, 12 Dec 2021 21:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 528611BF300
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 21:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B8660ECB
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 21:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54_aNYNzUzXx for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 21:42:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C280760EB7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 21:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639345352;
 bh=T6gi5qV5HeBGE0VzNoMCXojceG3s+SwSd94U4f+WhkM=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
 b=PdXbp2nMlnCVXJQqUsuMNwns0UM7/sOVWNW7XmgoLt+BPx1zCW972Y3Kxdo64KqV3
 +LwJXETtFed0tcaK6zRaz9vV+Hyra8h8BpBllPgo7s1oXtulv8KyFYJGPRk1GvSd8Z
 j0dEpbkFZ8vJFuuj/NNMIe6/aZzvhDKre7tL1iAI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.54]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1n62K7221v-00UZqU for
 <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:42:32 +0100
Date: Sun, 12 Dec 2021 22:42:31 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20211212224231.2e492467@gmx.net>
In-Reply-To: <20211212175624.670897-1-fontaine.fabrice@gmail.com>
References: <20211212175624.670897-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:rvrY2CyX6mJDfod/aadBsUuA/zdWrftHC2BIim4hVG4FiWlx0FP
 4+rq2+WSUsahpAAXOfAOMXm0nLHXbbyLxktZnilwunlacKNVPRNMWEdJhpG61z+h1PSBETk
 q7PTiypvbzUYw6rxFZLFLvCBCIZWiIvfy8QsHXxoz/P6hdBvHPdOfyP5+xwEgdDM77hNXzd
 XjP53ZUpn597ACvQGrZ6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZDmC1gkYdck=:MbyaeORrFdDyGNe90x5L8x
 tKWpJyJzPmMhRP+bu+iLFwVEpRTrLaDi/YE2TxfE3GlO8sHIQjI/R4d6PjXlZx4AtZvY0USPT
 i54PryYrHeabcn+t2wVBXUybulXTMKCKiPOMOQCM4QqE67ZsltBZEDIBnAKjJLUgvcIRQR29E
 d0iCw2I/icQgyIVF+6QoDPQP03OT/BabxQAGKbdWvxODCrHnHFnHOnZBZj9VXqkUe3SrXU0WW
 NAkfpq7pvRpEonrWtOozy0n9NishyJ2rsKvHGJsb8cwtq1JoYoGKQKgPXAEh3xfdJ/o3vzn2S
 Wr0VEGWx0kSgA/nKoqTK98YQK3295HCNyEEQZ6cHZLrRmOY24tCOjjelu15WpNRlU+ECklVO+
 l/dEy99DR0DDRGMKRL4N1EUykxrMz+qVTXjZnJBIb99IoWPTnL/pWLZiwN8TRqsescrgecQLE
 C+EATC9WG0Akv6wRu5iEzhZHs/+0hg01WsBEihX7Dny06IutvQF1UNI9wP3MPvxXU/CBYh/qX
 /uqDFw+BiomoLRPC4Wpn6QsH0Py5EBtjwGJVb/pQRLiaVZOWRVfEOkv11h0MwMbaStK7huKaZ
 6GXcoZvGPdeKcm8hJ0iAdCWhr7lSy0hZqKbVyfSmZflUY+EtmjqMjXkQHKHp5xwLpmPq1EIBW
 +glM0IbwhwDettBbsRdWYekwz39AFOLsYU0DWn7BL2wlfTzyPSwPb+LGcf+Yf0OIv7AJ73I2o
 lONtUgO9TCHYGKvmOjilNUTgdCu/hJPZd1ILUG+AkpiVOXWOJmecVoBkHbU7tjUua1qlYWeZr
 woCdzOYhZsRrzW2B2qtgeK84n863BnaQoHGy3qUXOJeSI9JAVbmh3z3XXUKUIdRwy1RwYTjTx
 M0VLRZMD0fI7xdBUwTJwHHCSMpDDEKEB5UaAkCBKCvXf8/Qyl5Q5of0Bx4Fhr9HryCVixXKxy
 jmbYgAIkHA4/eTT+3+wejzbBvwB56jOe9y2Nt8m/iVZ2LDWa5YfI7E1V7I3EHVjgYKYT1LYnY
 Ih2HuvCQ2XrPvXz5Pe0j4BnMbBuuFEbcavdfIqJvmJDa6j/cWht5xpPVeNT1FEVBNq1wkPPLB
 aDND6IIwNSvyGk=
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf: update sha256 hash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 12 Dec 2021 18:56:24 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit ca39eb212e32ca209cb3d6011847f9c94641fa73 forgot to update sha256
> hash
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/iperf/iperf.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
> index bd5643af95..924d10b3e0 100644
> --- a/package/iperf/iperf.hash
> +++ b/package/iperf/iperf.hash
> @@ -2,5 +2,5 @@
>  sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
>
>  # Locally computed:
> -sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
> +sha256  56ec1312d24bd2c78790e67c96c0a991c82e71bc4c0b0d37171bd89c9fd6ef3e  iperf-2.1.5.tar.gz
>  sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING

My fault ;-)

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
