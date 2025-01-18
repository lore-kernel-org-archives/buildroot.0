Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AA9C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5255F60680;
	Sat, 18 Jan 2025 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tco9OSXCerK4; Sat, 18 Jan 2025 21:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F29606E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F29606E0;
	Sat, 18 Jan 2025 21:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0463B89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 919BC81007
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFX1jlhynpp7 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9392183F64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9392183F64
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9392183F64
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:00:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EFE8F13F88D;
 Sat, 18 Jan 2025 22:00:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54588])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 22:00:04 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 22:00:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <4668d7a62590995bc5d3ac5f6f3de278aaec5b6c.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
 <4668d7a62590995bc5d3ac5f6f3de278aaec5b6c.1734938835.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dde1d4df5c6f6a8f8a3fe127a85bf18f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737234006;
 bh=FFuU5SsDILHcFnIWoiAOkfN5BLPo3cAtCfQcVlps8Sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Md3VLE380+XbxWKhyF6oC3LXhv1SshV1E4z1612a0mmoKAxp89IeGwl1emiXu403N
 3BDysjErW97ks/poeVvgEPBHQq2uJIhXIWR2cdCiBDVwsBRfAXRUEXNcPn8Y3JMZNC
 lnECvYPJSe8qILXph3dkxGOO4VrZWNorskP+QTDAb1BjImioz9zS2deXngPk2Nyu0s
 R96ARbTo8QPMNQWj3vBfGIERccvCVQhaVwuiuaCghQYO9QmUZsmwbzh+dcuCy4yQm3
 QNY+vo5MdpWK5vQBmroCUwgI93IcImC9IHyKwH6VY/GXKSvMFIBKLj2wu08X9jYiMb
 X2q7CYazGy2Ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Md3VLE38
Subject: Re: [Buildroot] [PATCH 3/5] utils/get-developers: read patch from
 stdin when it's not a tty
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

Hi Yann,

On 23/12/2024 08:27, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> It is very common that get-developers be used with its stdin a pipe 
> from
> git-show:
>     git show |./utils-get-developers -
> 
> In this case, the '-' is superfluous: we can very easily deduce that 
> the
> user wants to read stdin as the patch.
> 
> So, if no other action was requested, and stdin is not a tty, use it as
> the source of the patch, and thus '-' is then no longer required.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> 
> ---
> Changes v2 -> v2:
>   - fix typoes in commit log
> ---
>  utils/get-developers | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/get-developers b/utils/get-developers
> index 8e5796beaf..b45e617bff 100755
> --- a/utils/get-developers
> +++ b/utils/get-developers
> @@ -42,7 +42,9 @@ def __main__():
>      if action > 1:
>          parser.error("Cannot do more than one action")
>      if action == 0:
> -        parser.error("No action specified")
> +        if sys.stdin.isatty():
> +            parser.error("No action specified")
> +        args.patches.append(sys.stdin)

This patch introduces runtime test failures. See for example:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671800

When running the test on a tty, the test succeed. For example:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.utils.test_get_developers
     ...
     OK

But when running the test _without_ a tty, the test fails.
This is the case in the Gitlab CI.
For example:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.utils.test_get_developers < /dev/null
     ...
     FAILED (failures=1)

Maybe the runtime test needs to adjust depending stdin is a tty
or not.

Could you have a look please?

> 
>      devs = getdeveloperlib.parse_developers(args.filename)
>      if devs is None:
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
