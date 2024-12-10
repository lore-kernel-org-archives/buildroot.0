Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1EDE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 21:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCCD403A1;
	Tue, 10 Dec 2024 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VoMy_MXXSDf; Tue, 10 Dec 2024 21:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6341040704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6341040704;
	Tue, 10 Dec 2024 21:07:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CE89ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B10A40694
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IgxB8_50Arb for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 21:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF48E406AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF48E406AD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF48E406AD
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:07:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EF09619F5A7;
 Tue, 10 Dec 2024 22:06:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55146])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Dec 2024 22:06:54 +0100
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 22:06:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
In-Reply-To: <20241210081440.1423417-1-neal.frager@amd.com>
References: <20241210081440.1423417-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dba6a47ebe4fa924c5ae8bba4b3cf7e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733864822;
 bh=h+PcIHmdEiTtUCT7A+hPqm5LeN3p3m3oVj0F5jlpSGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mAKuKb3b3jwBMgBOeBtAB6zWdd/mKq6swfXt1TjoCfTR1keGz3A7WUQFm7zUe8ll0
 xANjZZO077xO4HQi6rsTOhPJ1CAfk83L1itI96z8WAH/IHb1WVLFIn8WR3krPD1n1o
 3rTEyzppVWvolSucGO6pyQ6A8pc8KX48iDzWxjbf8WwhGY2zoD9jNMEJcs7+xX29nU
 X42BKeuIfBDZ3qOxt/aAfIFMDkY2xFRJ9mMJyXRTnYfJCug73RZAGB6W4AhtCauRkv
 FIFWXdHXP20V1jVRUVbhCupeyOoHi4Qz3jtZGBBNuDpGDhL67KM4mo5T0sh4WX8t0O
 3STaY2waMg23A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mAKuKb3b
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal/post-build.sh: link to
 board/zynqmp/post-build.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/12/2024 09:14, Neal Frager via buildroot wrote:
> The board/versal/post-build.sh and board/zynqmp/post-build.sh files are
> identical.  So this patch removes the board/versal/post-build.sh script 
> and
> replaces it with a link to the board/zynqmp/post-build.sh script.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.

> ---
>  board/versal/post-build.sh | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>  mode change 100755 => 120000 board/versal/post-build.sh
> 
> diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
> deleted file mode 100755
> index faa75a0de3..0000000000
> --- a/board/versal/post-build.sh
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#!/bin/sh
> -
> -# genimage will need to find the extlinux.conf
> -# in the binaries directory
> -
> -CONSOLE="$2"
> -ROOT="$3"
> -
> -mkdir -p "${BINARIES_DIR}"
> -cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> -	label linux
> -	  kernel /Image
> -	  devicetree /system.dtb
> -	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
> -	__HEADER_EOF
> diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
> new file mode 120000
> index 0000000000..0130ff23d2
> --- /dev/null
> +++ b/board/versal/post-build.sh
> @@ -0,0 +1 @@
> +../zynqmp/post-build.sh
> \ No newline at end of file
> --
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
