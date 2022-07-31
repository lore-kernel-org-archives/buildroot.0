Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8615FC19F2B
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 14:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75E761054;
	Sun, 31 Jul 2022 14:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D75E761054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GwYDYB_GFyO; Sun, 31 Jul 2022 14:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC4460F3F;
	Sun, 31 Jul 2022 14:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCC4460F3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFEC71BF2CB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D376282977
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D376282977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjQU7SOa5AX7 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 14:31:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F4A282974
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F4A282974
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 14:31:14 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id w129so4384794vkg.10
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=RibRFQvx/pWMECYVBHv+tPQpMwgt7FcOm2oiCDZAFB4=;
 b=HYXQFzDmhdmhuT06hvjJK3bWE8o9fCrggkOtfdDgJz+/Vo7JRJhU7ZvlJqQ9IQYCBF
 t5+9bbMCCqlgRiXN4QBS9JJJ0cJqZj1voPf/7wn6/aWsobvaCXxBBTZd/XjRQVCF6VnH
 MhTR23L7tZDFktavDd8/jV8303lBZt9a1FLBS3kH8WAVCxM8qYj/8NOsOtkBiyYxu4x+
 My4OiN7YFDK9nkbSqat/bY0sxgebg7vZUka9+VWU3lvsit/2pw6/Lj/2oYogPQg86SZy
 VOm8KT9olj+9kwYGORcU5VQCorPGoEtAL0q98r6IPc/Nuuic7dWgoOhrF8XVk3mJE+gU
 TACg==
X-Gm-Message-State: AJIora8JzQ+yjI7qoEJ4iyMiDJIH+8nYDYUZmrI5yqqHsG0W7U36xNKH
 JKM9T+J/aTwedcNjTSf36Pc=
X-Google-Smtp-Source: AGRyM1veu8VeBIfN477QF7mtGWF5rr9/l1MyPNL2sln4iGw/r0bVSHU/sly0a8zlKAjkv1Mlv58sHQ==
X-Received: by 2002:a1f:38c8:0:b0:376:353e:cb5c with SMTP id
 f191-20020a1f38c8000000b00376353ecb5cmr4512718vka.33.1659277872978; 
 Sun, 31 Jul 2022 07:31:12 -0700 (PDT)
Received: from gmail.com ([191.187.223.18]) by smtp.gmail.com with ESMTPSA id
 u10-20020a1f2e0a000000b00376b105115bsm4185741vku.48.2022.07.31.07.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 07:31:12 -0700 (PDT)
Date: Sun, 31 Jul 2022 11:31:10 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: romain.naour@smile.fr
Message-ID: <62e6922ed41f6_bff739ec-35d@xultri.mail>
References: <6430c454-08d4-cb3b-b766-c72ea7abb691@smile.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_62e6922d11d28_bff739ec-4b4";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc;
 bh=RibRFQvx/pWMECYVBHv+tPQpMwgt7FcOm2oiCDZAFB4=;
 b=Y274zq49L3RDCCrnGDhz7TsiQPaPp7DTGLgU+PqEjEcxZDJPcVE2gYFTfgwfHDzbki
 vNxs3FKsq/yChIe2qI7LD/Uhb1YxQbeTlsXKXaqM1sA0GSqgECzRUUI51SRl9IV3xp6a
 owsnkA2FDJSKW/VBP569GLFBbLBo24O+XJzPMkt25Ea8w6Vfl7ztfxUULVL4NrdpC3db
 ox1S8QwxxpGn8HVa/OxxnJtwaymIlkAPMlUULOIy9pf6KUN/0B72iegBn4nQvPZVypfA
 CVo6p/0lAAdrmq9EHo8DFHxoO5UHHxdEpEU1IQuJGK6rJGPrro0sWptar1gF7+5ztR53
 kSgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y274zq49
Subject: Re: [Buildroot] [PATCH 06/16] Makefile: make check-package assume a
 git tree
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_62e6922d11d28_bff739ec-4b4
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Romain,=0D
=0D
Thank you for your review on the series.=0D
I will respin. I just changed the series to Changes Requested.=0D
=0D
On Wed, Jul 27, 2022 at 09:54 AM, Romain Naour wrote:=0D
=0D
> Le 24/07/2022 =C3=A0 07:49, Ricardo Martincoski a =C3=A9crit=C2=A0:=0D
>> ... just like check-flake8 already does.=0D
>> =0D
>> When a new check_function is added to check-package, often there are=0D=

>> files in the tree that would generate warnings.=0D
>> =0D
>> An example is the Sob check_function for patch files:=0D
>> | $ ./utils/check-package --i Sob $(git ls-files) >/dev/null=0D
>> | 369301 lines processed=0D
>> | 46 warnings generated=0D
>> Currently these warnings are listed when calling check-package directl=
y,=0D
>> and also at the output of pkg-stats, but the check_function does not r=
un=0D
>> on 'make check-package' (that is used to catch regressions on GitLab C=
I=0D
>> 'check-package' job) until all warnings in the tree are fixed.=0D
>> This (theoretically) allows new .patch files be added without SoB,=0D
>> without the GitLab CI catching it.=0D
>> =0D
>> Since now check-package has an ignore file to list all warnings in the=
=0D
>> tree, that will eventually be fixed, there is no need to filter the=0D=

>> files passed to check-package.=0D
>> So test all files in the tree when 'make check-package' is called.=0D
>> It brings following advantages;=0D
>> - any new check_function added to check-package takes place immediatel=
y=0D
>>   for new files;=0D
>> - adding new check_functions is less traumatic to the developer doing=0D=

>>   this, since he/she does not need anymore to fix all warnings in the=0D=

>>   tree before the new check_function takes effect;=0D
>> - prevent regressions, e.g. ANY new .hash file must have 2 spaces;=0D
>> - as a side-effect, print a single statistics line as output of=0D
>>   'make ckeck-package'.=0D
>> =0D
>> But just enabling the check would generate many warnings when=0D
>> 'make check-package' is called, so update the ignore file by using:=0D=

>> $ ./utils/docker-run=0D
>> br-user@...$ ./utils/check-package --failed-only \=0D
>>                `git ls-tree -r --name-only HEAD` > .checkpackageignore=
=0D
> =0D
> I guess the ultimate goal of check-package is to make .checkpackageigno=
re empty,=0D
> so at some point this feature should not be useful :)=0D
=0D
I don't think we will reach the goal of 0 warnings.=0D
From time to time we can expect new coding style rules to be added to=0D
check-package.=0D
=0D
> =0D
> checkpackageignore is actually needed to convert smoothly the code base=
 to the=0D
> new coding style in order to not conflict too much with pending patches=
 in=0D
> patchwork.=0D
=0D
No. It is needed to decouple:=0D
- the style rules we want to enforce for new patches submitted to the lis=
t=0D
- from the fix for all files in the tree that does not follow yet the add=
ed rule=0D
=0D
For instance, this series enforces all new shell scripts to fix (or expli=
citly=0D
ignore) shellcheck warnings, but it does not change the hundreds of files=
 in=0D
the tree that do not follow that rule just because the rule was not in pl=
ace=0D
when they were added.=0D
=0D
$ grep Shellcheck .checkpackageignore | wc -l=0D
241=0D
=0D
> =0D
> But patchwork is currently "almost" empty (compared to normal) with les=
s than=0D
> 200 patches, so it may be the good opportunity to apply right now a big=
 patch=0D
> removing all HashSpaces and shellcheck warnings (Sob warning are bit mo=
re=0D
> complicated to handle though).=0D
=0D
shellcheck is not so trivial too.=0D
=0D
With this series applied any new patch applied that:=0D
 - adds a patch file without SoB=0D
 - adds a shell script that does not follow shellcheck=0D
will trigger the warning in the CI build.=0D
=0D
Someone could even come up with a git pre-commit hook to be used by maint=
ainers ;-)=0D
=0D
> =0D
> The issue with the big patch approach is that the patch must be applied=
 right=0D
> away. Similar to the big patch adding hashes for SourceForge-hosted pac=
kages [1].=0D
> =0D
> Otherwise we have to not forget to update checkpackageignore file when =
fixing a=0D
> warning in a package.=0D
=0D
For developers, even newcomers, that follow the manual 'make check-packag=
e'=0D
will warn about it.=0D
=0D
And for big patches, it can be updated mechanically using patch 5.=0D
=0D
I could also add a helper. When someone calls:=0D
make .checkpackageignore=0D
the file gets updated.=0D
=0D
=0D
Regards,=0D
Ricardo=

----==_mimepart_62e6922d11d28_bff739ec-4b4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_62e6922d11d28_bff739ec-4b4--
