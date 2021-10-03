Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B67CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:01:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D62619E7
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0D62619E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C7E414C6;
	Sun,  3 Oct 2021 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DN2-mI46cwGF; Sun,  3 Oct 2021 20:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB7F41574;
	Sun,  3 Oct 2021 20:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E27B1BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7865C60B3A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhHKiG3E6lpM for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:01:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B8D160745
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633291280;
 bh=7e+UTvqIz0TsrpQ002zzVN7e3uv13bXiUet/Sp/GxgE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MVNE1lUYnhMijpgcqLFZkfB/I/Xw39SE+ve9CmAarNbdKgaY4hdDz6EuTaZUyO8Gb
 /BkksiF/Zvjq9gYSkG042aTcHGIL/EVpZOhASIy5PEP7RoC8YfLrhQ7Ol6B3kcHidM
 J+hF5Wv5ww6/6QL1kltX9T+hPhr9NwiI4dtCtNkw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1nAuTQ2yeW-00mY7C; Sun, 03
 Oct 2021 22:01:20 +0200
Date: Sun, 3 Oct 2021 22:01:19 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Jianhui zhao <zhaojh329@gmail.com>
Message-ID: <20211003220119.37f6e642@gmx.net>
In-Reply-To: <CAGN0SiFsNW+JZ=bgy4t7Ef63w3YkGr6MEkpa4tzFJuV9JMGhiw@mail.gmail.com>
References: <CAGN0SiFsNW+JZ=bgy4t7Ef63w3YkGr6MEkpa4tzFJuV9JMGhiw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:fG0nXn1FTwX3sVSRPtjuXWoJRAeBqxbUhaUBd8hertDwiaCqvBR
 fzeHZbxFymtOQX2eeIyXPCyygGOWTzbGKZeFZztUoIb9ZozdOrRXO5zzwmsrjXmdzA5Km9C
 Sh0sgCyvKjJYCCjFLVIhAKvDc9bERx++VjUitZZs8h/Q6tI6yMxnBm5+YoDGvhVXsmDgJ5Q
 +6AoVM5tQBn2P1v022Klw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A5/r0/iuGyU=:IuTiFl+J+h38nJv7N4QugM
 Y1yzqLgZro5YJL7U/Llev1TVykbblt0DrMoByMLbGt7+cr6/EzLVpf5ndXzrlRtGW4JH4WZsU
 x368fiMWuCx/vj9yCEakOsWFoAL3IcEjTp66iYM+rOge9piprUJUswN3CiYxpuETFnJ4dI/ZR
 y28mmPcSEOQNPPlcv93Yh++cvxup8is+qZGCjg4uTP8i8veQwHmtx3dYo6mAmThSTkz6ubtKU
 hGHKaX7hZOoNN6ndVXTNQNz1TbmFFDaxYnfHcGk1GpsUYcpgET+dSJ+1TRdtc/V6DRqlMqeox
 T4IQLZ0R3lCO9uRS/gbPM2s3ibbaIe2Avnayj0m99dnQgGewgb/TwI/xI5BUqoaivXrmedu71
 sN3IofT7//odl1QSm4Plio1JcQJXlyis6puWG8+sa6gmQU+1cTYorF63OLBVqjEOtaNKCHVP7
 7crbxIxjsRLZq3DhbH/C9bo5uzl6jlhidXiKbqhB422mrJ54CElZ9ik0/Zv8+obcaNTQjLgcM
 FBa7IuOyVZujv0pVgNxcEptPBJEbTdaf8ik0HBqpbGdD3NIhbmgGRUNj0qLPl/6W+y83JMFdk
 kotY0D7lz/ZEblh6bZQrCU/PrDcp8OZn+wUOscXt/DSCD1/q37paOiPAlWp6PaZ8k29pVthXW
 eKWfIG4jut14sUHf/9v0xJ6WuT6fRdHpRtYKaQ+X99gfZOyBJ4Ibh+BUIUyVeffz6z/a+8QnD
 1FKBj96EqV46mVxA9ySLBsRGu9xwgolx2ohF4G3ryK1SE33DCKiMeLu3QDqcOW/vdBKDhwcBE
 wQAGqU4u6Aq5DZ6MB+U5L4m/plorm97PWF1C3xYJ6euJqfnP8i9FfEiR1NzPOLEICUtSNoFq4
 NzW/FALAx27Zp+qgDRGkGIzMcunphLHrizNL+matADN43eKc1m4PSWmWCxJmciEcF9cSS2sw6
 Wkx3U9YBJ5me96qP6PO1zew/Zv4r/VJYi6qbvjtmngM+gUvU6DfIy9/MTsiV129+4Qq2SPAhN
 ofkpWrG+5cIJ4omEo+U1wI2lfxQCX43t2IrfyT/hS6lvt2B/OCkGnOkhfyhzXH41g98vb5+sn
 mvnminb8SGFtt8=
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: bump version to 8.0.0
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jianhui,

On Fri, 1 Oct 2021 15:20:26 +0800, Jianhui zhao <zhaojh329@gmail.com> wrote:

> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  package/rtty/rtty.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
> index b2e9db2436..1b46aff47c 100644
> --- a/package/rtty/rtty.hash
> +++ b/package/rtty/rtty.hash
> @@ -1,2 +1,2 @@
> -sha256  9bc5d30dfa9bd664a62711b6229f47505b83adb364907f24e3a404aad52a4802
>  rtty-7.4.0.tar.gz
> +sha256  b9c555005b76c1ad0f5af891964375bbdf50ee22b9a9f53ddd48d2cdb4e53b49
>  rtty-8.0.0.tar.gz
>  sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55
>  LICENSE

Change to package/rtty/rtty.mk RTTY_VERSION missing?

Regards,
Peter

> --
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
