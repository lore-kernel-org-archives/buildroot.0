Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B406ACD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE4D406D2;
	Sun,  7 Apr 2024 13:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BS-6pk9HMo4B; Sun,  7 Apr 2024 13:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F282C406A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F282C406A6;
	Sun,  7 Apr 2024 13:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE4781BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB8EF405E3
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGdyQUmbwwxo for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50EF7405C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50EF7405C3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50EF7405C3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:44:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0943A13F89A;
 Sun,  7 Apr 2024 15:44:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 15:44:53 +0200
Date: Sun, 7 Apr 2024 15:44:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZhKjVe67N7BIRmy9@landeda>
References: <20240407093409.1273632-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407093409.1273632-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712497496;
 bh=VH1c8holj/lX0x3suubVvsn9LWsvwN5V13oQbIEoO3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UqwyGbnwHhuwBjJ/XdfYE+zaXsmX2zGWVceErEcyuUow6sLjR68S0W/aCXDyM5GvF
 aUTLHr1TShNC5/IlCWMrJDGiX2+vmeQpjOWW5w1gi03YGiwFY51Xe+7iF42eXkJbPA
 dQSs/1RoDom0/Xr98LHqWUR0UTXGDXRxc4EHQnVuBDXTIhx/I/nlk3NUVHRoc5ZS66
 HuUXmhFY+ZhxWSN0vX8xque2P+WwPlWsAFdubitD2yPw2W2LQJZR1cQq8VZu2F0wpb
 mHJ0DROHJ2kXuGJXhdAE4qAeRBnXrkxtdBxGr5kgmMmwL7MOLWPbtNf8cPMQnb0FNh
 T0sas8S8pjigA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UqwyGbnw
Subject: Re: [Buildroot] [PATCH] package/gdb: bump 14.x series from 14.1 to
 14.2
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

Thomas, All,

On 2024-04-07 11:34 +0200, Thomas Petazzoni via buildroot spake thusly:
> According to https://www.sourceware.org/gdb/:
> 
>  This is a minor corrective release over GDB 14.1, fixing the following issues:
> 
>     PR symtab/31112 (DLL export forwarding is broken)
>     PR c++/31128 (gdb crashes when trying to print a global variable stub without a running inferior)
>     PR tdep/31254 ([gdb/tdep, arm] FAIL: gdb.threads/staticthreads.exp: up 10)
>     PR gdb/31256 (Crash with basic 'list .')
>     PR python/31366 (Frame.static_link() segfaults)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/Config.in.host | 2 +-
>  package/gdb/gdb.hash       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 891e45948e..53706cd3ee 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -67,5 +67,5 @@ config BR2_GDB_VERSION
>  	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
>  	# When making 14.x the default, or 14.x becomes the oldest version,
>  	# be sure to update the target variant to properly select mpfr.
> -	default "14.1"     if BR2_GDB_VERSION_14
> +	default "14.2"     if BR2_GDB_VERSION_14
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index c62da28cbf..144f6da296 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -3,7 +3,7 @@ sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb748
>  sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
>  sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
>  sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
> -sha512  575e198105076fc4a88f68591aa114ab9c1196e84386a3f7b9b58fe5f30cdeed33f6a5f957b68f08c47284ec922bb60c964627e238471419673fd913575ce427  gdb-14.1.tar.xz
> +sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
>  
>  # Locally calculated (fetched from Github)
>  sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
> -- 
> 2.44.0
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
