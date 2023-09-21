Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F33AE7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 273A583C8E;
	Thu, 21 Sep 2023 18:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273A583C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exg04NSwVNEL; Thu, 21 Sep 2023 18:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4881383C8D;
	Thu, 21 Sep 2023 18:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4881383C8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 731731BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C7B740580
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C7B740580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMU4uvUeDfn0 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:51:45 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB62E40235
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB62E40235
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9ad810be221so160231566b.2
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 11:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322303; x=1695927103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvnBZdbI4oQ2lYSHBjltN4hz3GNs6h6NJ3iSQcVbrsg=;
 b=Zp2gCp0mGSY/KeoBH3daO+lVWjYjln8LBN/CmZ2v2KkglKsLuL4cMxPe5O0kVVCwVG
 PDjbEH1Bg0jsvRiKOMYzJT9R7Da8gB1y96y7xkfIdPKfwEN+whDhPq8UyzlQqk8puxYu
 lJH5jnspwrA84YGDkT8lJcn8wR0laRR+TMdWaWDhZdQLesgdg8anIrG/Sqmo4WxkZhTP
 aaLXBWa6mDEXBHmSeeNM2KalGDFKdgQBEaFTp9m4zTsKLs7OZOVt1IKYTO2YJI4jHzKU
 hvBJZOqgVVfCmVNQuQMF2RJo3ngVrrYCqfbPCnsVjJnafEL+EZfwNSRTMemtQ2G8CElR
 WiPQ==
X-Gm-Message-State: AOJu0YxzoAGI/CzE30T4F81ywSB2wysq12d7utus0K8xx8JarStyCI+C
 /tE5sjpsug5nt25YzEeY5motkQ==
X-Google-Smtp-Source: AGHT+IFRSMuZJAUcdI4AGrVqs/dEJ2OiYNALozYmJ1btI1e9vuObef+TC06qoBnvxe5uVfrQc9GE6Q==
X-Received: by 2002:a17:906:cc5c:b0:9ad:a4bd:dc67 with SMTP id
 mm28-20020a170906cc5c00b009ada4bddc67mr5899909ejb.50.1695322303067; 
 Thu, 21 Sep 2023 11:51:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 sd6-20020a170906ce2600b00997e99a662bsm1428752ejb.20.2023.09.21.11.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:51:42 -0700 (PDT)
Message-ID: <337d9023-7587-ef8f-3e61-f7bd16f333ff@mind.be>
Date: Thu, 21 Sep 2023 20:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230918194519.68987-1-ju.o@free.fr>
In-Reply-To: <20230918194519.68987-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695322303; x=1695927103; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qvnBZdbI4oQ2lYSHBjltN4hz3GNs6h6NJ3iSQcVbrsg=;
 b=ReUXLQLbxcIn9Y4M8JBaKd/c0vrqtUkUPsnU3yykL+Z5NnJZimDxoL5CnwLmC9ODDE
 kSeaslA56dvngOwmnVWnyG1bCC5XLe74vHp2caKamucwwFHQTvswxVPdK6y7KvojODkm
 HGPpg/KWLqUFfLZM56APRmnSSWfWxcyNUFmTpSxyMPoE3ZhiQJSAbMStLALCp+jmSe9Q
 fpu2kna7EOU9I77Aow7uyRuNLjxI8VWHoMt+MCTDu5j1ilCaebpiYFVslV5B93tbJrT2
 Ik8TsPJerZLWiVy+Ki5T8Up/A+3QEwa7pQuqXmkVDR2+dKWbasfy6GjiqBvomiMheqGp
 bGBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ReUXLQLb
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: fix package patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/09/2023 21:45, Julien Olivain wrote:
> The commit 4e365d1768 "package/tcl: bump to version 8.6.13" did NOT
> refreshed the package patch, because the patch was still applying
> correctly and the package was working as expected.
> 
> It was refreshed in the previous bump, in commit 9cf314745a
> "package/tcl: bump to version 8.6.12".

  I've added here that this commit was part of 2022.02, to make it easier for 
Peter to know that it should be backported.

  It was my original mistake to commit that incorrect change, so I've committed 
the fix as well :-)

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Looking closer at the patch content, the -/+ lines are exactly the
> same. So this patch does not change anything. Since the file was kept
> and the commit log mention a patch refresh, the intent was more
> likely to carry over the old patch (which was declaring all libc
> functions as "unbroken".
> 
> This commit actually refreshes this patch. It was regenerated with
> git format-patch. Since the patch is renamed due to git format-patch,
> the .checkpackageignore is updated accordingly.
> 
> Note:
> This ancient patch will be removed soon, as an upstream commit [1],
> not yet in a release, cleaned up and removed those old parts.
> 
> [1] https://github.com/tcltk/tcl/commit/04d66a25716cb7738dad3170cca4d0a4683db08a
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 96130dc with commands:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_tcl
>      ...
>      OK
> 
>      utils/test-pkg -a -p tcl
>      ...
>      45 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   .checkpackageignore                              |  2 +-
>   ... 0001-Disable-tcl-compatibility-layers.patch} | 16 +++++++++++++---
>   2 files changed, 14 insertions(+), 4 deletions(-)
>   rename package/tcl/{0001-dont-build-compat.patch => 0001-Disable-tcl-compatibility-layers.patch} (61%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 73a00d610c..699b067cca 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1390,7 +1390,7 @@ package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch Upstr
>   package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch Upstream
>   package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch Upstream
>   package/tcf-agent/S55tcf-agent Shellcheck Variables
> -package/tcl/0001-dont-build-compat.patch Upstream
> +package/tcl/0001-Disable-tcl-compatibility-layers.patch Upstream
>   package/tesseract-ocr/0001-Check-if-platform-supports-feenableexcept.patch Upstream
>   package/tesseract-ocr/0002-configure.ac-fix-build-on-aarch64_be.patch Upstream
>   package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch Upstream
> diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
> similarity index 61%
> rename from package/tcl/0001-dont-build-compat.patch
> rename to package/tcl/0001-Disable-tcl-compatibility-layers.patch
> index 7a7d959cd2..b7b776ad5d 100644
> --- a/package/tcl/0001-dont-build-compat.patch
> +++ b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
> @@ -1,4 +1,6 @@
> +From c829552921f0c7c8e522f911135ee100742b441b Mon Sep 17 00:00:00 2001
>   From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
> +Date: Tue, 8 Apr 2014 15:54:04 -0500
>   Subject: [PATCH] Disable tcl compatibility layers
>   
>   Turn off building compatibility layers for old/broken versions of
> @@ -9,17 +11,25 @@ to not have broken behavior.
>   Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
>   [Fabrice: Update for 8.6.12]
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Julien: Update for 8.6.13]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
>   ---
> + unix/tcl.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/unix/tcl.m4 b/unix/tcl.m4
> +index ca94abd4ad..42eb58d384 100644
>   --- a/unix/tcl.m4
>   +++ b/unix/tcl.m4
> -@@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
> +@@ -2646,7 +2646,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
>    #include <stdlib.h>
>    #include <string.h>
>    int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
>   -		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
> -+		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
> -	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
> ++		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=ok]))
> + 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
>    	    tcl_ok=1
>    	else
> +--
> +2.41.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
