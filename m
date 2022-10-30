Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A342ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C8B581286;
	Sun, 30 Oct 2022 22:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C8B581286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dl1EYfqOBGKh; Sun, 30 Oct 2022 22:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCF0812AC;
	Sun, 30 Oct 2022 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCF0812AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2DCD1BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1F160687
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E1F160687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quoD0Qv6pO60 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:20:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82D7A605A4
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82D7A605A4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:20:54 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id t62so531946oib.12
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CEWdzTp/PJqlnCh2eIueG+y0AowtN7eDnPfFiYSGIQY=;
 b=DQDCS1OdTwN3+nIhVtPLELVAP8HpP6fHRXFEpo3Dn3TOb43kpKGCginRVJqxoOt7AB
 PQ1QQJpz0ZAZ+R3ZsWd+wWLsvbLFy3zvYVRmfDUtpMWxYpMR1yOTyFY5tpCIQZmRy6+p
 8GdNr8mQOzgfQIcoW4BwAhoB5crGZ4tcCPZTudIYhSPwi1bgComh6Jy7JdGpKqO7OFZm
 TKUFpg8trQsWcbSeva3Im6cz9Pe6riVGnNFhlRK+uXTIt3oW4HS02jKH4379yfV4X9nn
 a00isIxtczCMiEs3UkSBWHpyzyVE8FknCfFAAy/SV/yys8RpOCXSP+qdlOXOOcAJp4jD
 ECgA==
X-Gm-Message-State: ACrzQf3HqQPIqTkixTMD1J6onL4AhURQsZqw8RKfylJGRk7JARNtihQK
 VwbA96mjSaMvWRW9lHNAy/c=
X-Google-Smtp-Source: AMsMyM633EFULW02brzTcsWyJI2KEL+Kc6xaJJlZ/GnHxvGxFgdWQc9La5+x3jwguugFtReIvbx5wQ==
X-Received: by 2002:a05:6808:f05:b0:354:b362:c5be with SMTP id
 m5-20020a0568080f0500b00354b362c5bemr5373949oiw.136.1667168453611; 
 Sun, 30 Oct 2022 15:20:53 -0700 (PDT)
Received: from gmail.com ([2804:14c:7980:988a:c978:dc5f:a55f:695])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05687040d300b00127ebb410a4sm2276582oal.11.2022.10.30.15.20.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Oct 2022 15:20:53 -0700 (PDT)
Date: Sun, 30 Oct 2022 19:20:51 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: oguz.ozhan@mind.be
Message-ID: <635ef8c3d5fea_3fcfb2ad9217830c8223a2@xultri.mail>
References: <20221021091531.2989489-3-oguz.ozhan@mind.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_635ef8c26397e_3fcfb2ad9217830c8222e4";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEWdzTp/PJqlnCh2eIueG+y0AowtN7eDnPfFiYSGIQY=;
 b=j4+GFsqnWe9m3c/0qAyMAX0higbj/JRjCsoLEObxrc4YLC3eiHakYqFGKYrFKvhbjv
 25jK++6rWsvrulb1NkDS+gq46YHgC1jZ3h84k+F0uWlRQwRxFCAMzhsfXTPr2CyPYJXp
 7D/TR9rF3RLZ93zhAHSAA4a/AULH1mx1F195+IRuQmhBAOwrPWyz6eEV9VwgXk0YQLy3
 GVJ6sIMQ0F4KKfOsGTIvuXbuMJ7s0yXUDlV/WIi3u7cRD8AdLKjS+TyL7BSrcle7+rTj
 huLI04ZejuesgIMmMV1NS86v36BugOjveZ+LSqf7ORVLATi6P3un+XBW7BhRltJ44Yyl
 2bFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j4+GFsqn
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: replace nose2 with
 pytest - CI
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_635ef8c26397e_3fcfb2ad9217830c8222e4
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

IMO, this change should be merged into patch 2.

On Fri, Oct 21, 2022 at 06:15 AM, Oguz Ozhan wrote:

> - From web page of nose2:
> (https://docs.nose2.io/en/latest/)
> nose2 vs pytest:
>   - pytest is an excellent test framework and we encourage users to consider it for new projects.
>   - It has a bigger team of maintainers and a larger community of users.
> 
> - pytest is more robust and has more ability compared to nose2
> 
> - Changes in this patch:
>   - the sed command was fine filtering the tests list with nose2 output but removing all operating on pytest output. With pytest no fine filtering is required to get the test names in correct format.
> 
> Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
> ---
>  support/scripts/generate-gitlab-ci-yml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index aa43aac019..bb4dcbbb22 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -31,7 +31,6 @@ gen_tests() {
>      defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
>  
>      runtimes=( $(./support/testing/run-tests -l 2>&1 \
> -                 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
>                   | LC_ALL=C sort)
>               )
>  
> @@ -80,7 +79,6 @@ gen_tests() {
>              ;;
>            (*-tests.*)

This regexp must be adapted, something like this:
          (*-support*)
            pattern="${CI_COMMIT_REF_NAME/--/::}"
            runtimes=( $(./support/testing/run-tests -l 2>&1 \
                         | LC_ALL=C sort \
                         | grep "^${pattern##*-}")

Notice that ':' is not accepted on git branches, so we cannot use this branch
name to run a single test on GitLab CI:
 git push gitlab \
 HEAD:foo-support/testing/tests/package/test_php_lua.py::TestPhpLuaLuajit
so I guess we could use a pattern substitution, for instance:
 git push gitlab \
 HEAD:foo-support/testing/tests/package/test_php_lua.py--TestPhpLuaLuajit
and document it in the manual.

The manual must also be updated.
 docs/manual/contribute.txt: $ git push gitlab HEAD:foo-tests.init.test_busybox
 docs/manual/contribute.txt: $ git push gitlab HEAD:foo-tests.init

Regards,
Ricardo
----==_mimepart_635ef8c26397e_3fcfb2ad9217830c8222e4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_635ef8c26397e_3fcfb2ad9217830c8222e4--
