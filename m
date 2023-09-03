Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E5C71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689C881E2A;
	Sun,  3 Sep 2023 16:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689C881E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtB7-QWukAOe; Sun,  3 Sep 2023 16:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A789881E12;
	Sun,  3 Sep 2023 16:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A789881E12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0372E1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD1260899
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD1260899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axnrhKhJthbD for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:11:27 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DECD160881
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DECD160881
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bca66e6c44so689495a34.0
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693757486; x=1694362286;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VaWmmJJFM5+GJAfZjQHywWZj6qIMV01lmjbd1GUfBok=;
 b=Cu7VVQuZ2Ks0pDqW+ebAxTOLEMDMFm10JH4X36IpQGl6/l9edRzmp9Gjn+D8sSMFV4
 BgvYw6ieZiD6t7po1u7UD5OiCJskKD60uCveyrmMKovWA+HbixV7SCubZsl4NS4WZN/C
 tNE6SIg+2MKmomXzBhw6vVZDN5kDDux3r6xkwtiWKvi8i5gvKA8O+tYNSF1oE3QHsvVc
 sHnOYY7keaQ3wfwqjHQuOMSe/87kVGjbEuRPgHqnLxFLHvkjby0AtKsXpAqXWQt696EE
 g31iUAB3P8d+QHeefpL7Z2av+7aFwWP9eIOAGlG1vVhDbGfszNFghflg5Vr9uJYXodig
 6TTA==
X-Gm-Message-State: AOJu0YwRepJBKpIfuRhyLZZiD1W0sxXvPwT7ZBcVyf+VavHbayMJLxOY
 Jm7d+RR1be1CfJFIrYE9wYy4xWdL8Nw=
X-Google-Smtp-Source: AGHT+IGe1BsAggPqfmDlcEXmg88o22smSabVih8nFh9QXdJpVBvSpYzeF9OgG7DVnF8qqvgUZmYwSA==
X-Received: by 2002:a9d:6397:0:b0:6b7:4a86:f038 with SMTP id
 w23-20020a9d6397000000b006b74a86f038mr8779215otk.15.1693757485606; 
 Sun, 03 Sep 2023 09:11:25 -0700 (PDT)
Received: from gmail.com ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a9d66d9000000b006b89596bc61sm3792584otm.61.2023.09.03.09.11.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Sep 2023 09:11:24 -0700 (PDT)
Date: Sun, 03 Sep 2023 13:11:23 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: james.d.knight@live.com
Message-ID: <64f4b02b4985c_809f62afed050d0f819062@xultri.mail>
References: <SN4P221MB0682AE13FB1ACA5A755024F1A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_64f4b029a0ac1_809f62afed050d0f818940";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693757486; x=1694362286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VaWmmJJFM5+GJAfZjQHywWZj6qIMV01lmjbd1GUfBok=;
 b=IhZTk0dgKnSTiQ8cPbN5p4JrXOQNvYK5hzxF5UThKS98uKZ2SaVWRj/r1F8Bswd0yK
 Xl3u/rzztcegGoJp9sRKYQvxxqRFjDPTNpTh/PNnLrUxnqCXOxOKCyKl3ctNO0F23KG3
 52vveMfLqfHiLtRU1sS/oBMbRm4JtAxpA8Limhx1k/e6rsVMPFcNAtRBQ8F8bDfQzLZt
 xkq1UcOkfkAKS7F1+xhkkABo1/79PzzS6qBR1f8lqu3k893XdsEVqrx7VMBGetXxoTva
 VFbkkcu1o6Z0q02srpUU8tkzvcxJ4LgwAJTJVfda51ZyVkxmDMjOdkyDuU4gJ004E9Kd
 JewA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IhZTk0dg
Subject: Re: [Buildroot] [PATCH 2/4] utils/check-package: support a
 file-state instance for library types
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
Cc: ricardo.martincoski@datacom.com.br, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_64f4b029a0ac1_809f62afed050d0f818940
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Sorry the long delay.

On Sat, Apr 29, 2023 at 03:12 PM, James Knight wrote:

> from: James Knight <james.d.knight@live.com>
> date: Sat, Apr 29 02:12 PM -04:00 2023
> to: buildroot@buildroot.org
> cc: James Knight <james.d.knight@live.com>, Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> subject: [Buildroot] [PATCH 2/4] utils/check-package: support a file-state instance for library types
> 
> The following adds support to the checkpackage library to have a
> file-specific state instance that can be changed across multiple
> `check_line` calls. This allows a given library type to provide hints
> across different lines (if needed).

This is a great idea.

> 
> This is in preparation for a future commit to provide support for
> linter suppression that is configured in the files being processed.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  utils/check-package                 |  8 ++++++++
>  utils/checkpackagelib/base.py       |  2 +-
>  utils/checkpackagelib/lib.py        | 10 +++++-----
>  utils/checkpackagelib/lib_config.py | 10 +++++-----
>  utils/checkpackagelib/lib_hash.py   |  6 +++---
>  utils/checkpackagelib/lib_mk.py     | 22 +++++++++++-----------
>  utils/checkpackagelib/lib_patch.py  |  6 +++---
>  utils/checkpackagelib/lib_sysv.py   |  4 ++--
>  utils/checkpackagelib/test_util.py  |  4 ++--
>  9 files changed, 40 insertions(+), 32 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index db3a00b524bc2c2aa663d3621c94fb11a6db7cb3..890420fe6992d49ad7d50f311007689e35ab7681 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -220,6 +220,12 @@ def check_file_using_lib(fname):
>          print("{}: would run: {}".format(fname, functions_to_run))
>          return nwarnings, nlines
>  
> +    # Check if there is a state tracker we can create for this library type,
> +    # and then forward to each `check_line` invoked
> +    fstate = None
> +    if hasattr(lib, 'State') and inspect.isclass(lib.State):
> +        fstate = lib.State()
> +
>      objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
>  
>      for name, cf in objects:
> @@ -231,6 +237,8 @@ def check_file_using_lib(fname):
>      lastline = ""
>      with open(fname, "r", errors="surrogateescape") as f:
>          for lineno, text in enumerate(f):
> +            if fstate:
> +                fstate.process(text)
>              nlines += 1
>              for name, cf in objects:
>                  if cf.disable.search(lastline):

This line of code (that is already there) made me wonder if we can
factor-out this code to the base class and add the new implementation
there.
The advantages of this alternative are:
 - avoid adding code to the main check-package script that currently is
   not covered by unit tests
 - avoid the need to change all users of the base class

I will send shortly a patch with this factor-out.

Regards,
Ricardo
----==_mimepart_64f4b029a0ac1_809f62afed050d0f818940
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_64f4b029a0ac1_809f62afed050d0f818940--
