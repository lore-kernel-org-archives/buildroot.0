Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40A1CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24644198D;
	Sat, 21 Sep 2024 18:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKeX30CdGqsq; Sat, 21 Sep 2024 18:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB5B41E62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BB5B41E62;
	Sat, 21 Sep 2024 18:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27CA21BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D97D160650
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWq0nxlNNS6q for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19E1A6065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E1A6065A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E1A6065A
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1B8EC5FF95;
 Sat, 21 Sep 2024 20:48:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 20:48:29 +0200
Date: Sat, 21 Sep 2024 20:48:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zu8U_TnXzwoHxKjb@landeda>
References: <20240920155955.4074868-1-peter@korsgaard.com>
 <20240920155955.4074868-5-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920155955.4074868-5-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726944512;
 bh=Bf7J93rS40IT4JUB1NyC9D57ig3G3KXlAKCo7v3KFj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FJoZXHmTedFrdaFerjxASyJcQdOWP/oInpj2rPQewKKaBCj29Hr+pK/UFsLmIV9tC
 S9zN9MdO6ij+NB707vAtYg96WBiJFbbxe6ogEAxYU8cHLwIqE/rZnv8GO3EXZnRXds
 /pfDEX4TU+9wldWeJ8QaiYcIvIAWpPONSZdYmbtyY5TlLrdI1y7zUD0g3sVWL047hl
 JV8DUu8MpSCdf9sUSL7VKgff5UaBW8bcgujXEYRBilPn7ZEXrietPemiIq4eOBhNRU
 bmB8UXePdfB8VW68YSE0ccNW1UylrRQ44c8hkKrjfWG322I+kZOFdK07DIfL41W04y
 ENmzd5Tq4MHqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FJoZXHmT
Subject: Re: [Buildroot] [PATCH 5/6] utils/scanpypi: fix typos
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

On 2024-09-20 17:59 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  utils/scanpypi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 5a58550145..ad7f8befa2 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -292,7 +292,7 @@ class BuildrootPackage():
>  
>      def extract_package(self, tmp_path):
>          """
> -        Extract the package contents into a directrory
> +        Extract the package contents into a directory

s/contents/content/

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  
>          Keyword arguments:
>          tmp_path -- directory where you want the package to be extracted
> @@ -440,7 +440,7 @@ class BuildrootPackage():
>  
>      def __create_mk_download_info(self):
>          """
> -        Create the lines refering to the download information of the
> +        Create the lines referring to the download information of the
>          <package_name>.mk file
>          """
>          lines = []
> @@ -471,7 +471,7 @@ class BuildrootPackage():
>  
>      def __create_mk_setup(self):
>          """
> -        Create the line refering to the setup method of the package of the
> +        Create the line referring to the setup method of the package of the
>          <package_name>.mk file
>  
>          There are two things you can use to make an installer
> @@ -556,7 +556,7 @@ class BuildrootPackage():
>  
>      def __create_mk_license(self):
>          """
> -        Create the lines referring to the package's license informations of the
> +        Create the lines referring to the package's license information of the
>          <package_name>.mk file
>  
>          The license's files are found by searching the package (case insensitive)
> @@ -755,7 +755,7 @@ def main():
>                  continue
>              if package.metadata_name.lower() == 'setuptools':
>                  # setuptools imports itself, that does not work very well
> -                # with the monkey path at the begining
> +                # with the monkey path at the beginning
>                  print('Error: setuptools cannot be built using scanPyPI')
>                  continue
>  
> @@ -827,7 +827,7 @@ def main():
>              print("NOTE: Remember to also make an update to the DEVELOPERS file")
>              print("      and include an entry for the pkg in packages/Config.in")
>              print()
> -            # printing an empty line for visual confort
> +            # printing an empty line for visual comfort
>      finally:
>          shutil.rmtree(tmp_path)
>  
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
