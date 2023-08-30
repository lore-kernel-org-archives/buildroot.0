Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A22BC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28121605EC;
	Wed, 30 Aug 2023 19:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28121605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dhm2YW6aUtyJ; Wed, 30 Aug 2023 19:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58ACA605A7;
	Wed, 30 Aug 2023 19:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58ACA605A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9B31BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6581081A6A
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6581081A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pD5uKYtAzLO for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:43:27 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF89181E98
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF89181E98
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5256d74dab9so4102a12.1
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693424605; x=1694029405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mbs+0c1WrUukPWCZ/GkZimS589FhYXU8SDHOr6t0yhs=;
 b=MJycBFC1NRRF3NoK7bXfh+67Xytrr5rkTkwqSEse0JLnrW7yp3POTxOhHOIGrXD2La
 jMD6jIOMk20eNokXl1WIMvsEjQ/Hhw5XMTCf44qNqvC0ksi/41o5RYrzu8XZCjcQgp69
 K81WYOEhq5Jb0ofRdqqHBRcSUticOXkz2gpYmO6/pRd7DCyDZwFjXV2HjrBXr538tlH6
 2osxjY8oxySZCDDuyEI0M45foTbEiupbPgIZLXkknaqCiM+T8W9dExgSDqYpDdmagpLU
 eFEzoNZ1LU4+Wd2s50yDGe51d4neIr+GibDkfDaIViJmqrN+QCQ8kEKWNywPTRIQIvFx
 450w==
X-Gm-Message-State: AOJu0YxlA4Uzl06QznAjNnr0evf6cLmUnWAAMe2a10B0xviA8QysjHQv
 S94/Xt1tMq2U+XQA4fprLAYzFUOQQJZCdLgxztM=
X-Google-Smtp-Source: AGHT+IGpEV5g5rwjfo954bNGiR6KrzZB8b7Du4GFsRDQ5NfMChqfVAfOMEG3svS0kee7wkNVz9ovKw==
X-Received: by 2002:a05:6402:1482:b0:523:38eb:395f with SMTP id
 e2-20020a056402148200b0052338eb395fmr2544189edv.2.1693424604813; 
 Wed, 30 Aug 2023 12:43:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 cq26-20020a056402221a00b0052bdfc9b8dbsm1374050edb.92.2023.08.30.12.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:43:24 -0700 (PDT)
Message-ID: <c9c04ca0-fe70-1e90-cbbb-989354b27bd3@mind.be>
Date: Wed, 30 Aug 2023 21:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230829120933.335227-1-yann.morin.1998@free.fr>
In-Reply-To: <20230829120933.335227-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693424605; x=1694029405; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mbs+0c1WrUukPWCZ/GkZimS589FhYXU8SDHOr6t0yhs=;
 b=bdC211xkNGntAUV+XP4i4i82TsZ7lKa7yii3MhnaycnXcNhAlbucT9l+z4GpF3NjOB
 g/6CuJw0nDAqBzheRgar5uQN4il+hFQUiY5IMoMQcrHVYAmeP6nBJKmxEDjh8tuvBmxP
 ciE4nsHkyP7b93U2Nb2tbcNOLNwbS/232Z8ekWPC3XG1vJMvxjioyI3ryMkKgRiv5xEc
 krpK7cPWlskjlYGYFmkTaoSMjhY9flZC7vwsauBzCD7D+2nKTUjP8CNo4L+fJkWSj6NM
 e6FV7GzdBR5HxEKYpedNcP9lmDTVYAEsOLjYHZD7uIuWQcM94U/vOl+5fuBKxPM83H1d
 mXkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bdC211xk
Subject: Re: [Buildroot] [PATCH] package/pcm-tools: fix github-download
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
Cc: Woody Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/08/2023 14:09, Yann E. MORIN wrote:
> The pcm-tools package contains a version.h with git attributes:
> 
>      $ cat version.h
>      #define PCM_VERSION " ($Format:%ci ID=%h$)"
> 
>      $ man 5 gitattributes
>         Creating an archive
>           export-subst
>             If the attribute export-subst is set for a file then Git
>             will expand several placeholders when adding this file to
>             an archive. The expansion depends on the availability of
>             a commit ID, i.e., if git-archive(1) has been given a tree
>             instead of a commit or a tag then no replacement will be
>             done. The placeholders are the same as those for the option
>             --pretty=format: of git-log(1), except that they need to be
>             wrapped like this: $Format:PLACEHOLDERS$ in the file. E.g.
>             the string $Format:%H$ will be replaced by the commit hash.
> 
> So, the archive generated by github has changed since we updated
> pcm-tools in 2021-12-08 with commit d1d93d488c76 (package/pcm-tools:
> bump to version 202110). The downlad was still OK in 2022-01-04 [0]
> but has been failing at least since 202-08-25 [1].
> 
> Since the archive is generated on the github side, there is not much we
> can do to fix this up.
> 
> We switch over to using git to do the download, and we generate the
> archive localy, which we know is reproducible.
> 
> We fix the version.h so that it contains the same string as the backup
> tarball we host on s.b.o.
> 
> There are three other files in pcm-tools that have git attributes, to
> exclude them from the generated archive, all pertaining to CI/CD stuff:
>      .cirrus.yml export-ignore
>      .gitlab-ci.yml export-ignore
>      .travis.yml export-ignore
> 
> We don't remove them, because they have no impact on the build, and they
> are anyway already present in the archive by the time we could act on it
> anyway...
> 
> [0] http://autobuild.buildroot.org/results/127/1276a3d49c8848039f034e7f03632df365097e94/
> [1] http://autobuild.buildroot.org/results/8bb/8bbf9c36af332bbf5e7c1abcbb594a0b231ef97e/
> 
> Reported-by: Woody Douglass <wdouglass@carnegierobotics.com>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   package/pcm-tools/pcm-tools.hash |  2 +-
>   package/pcm-tools/pcm-tools.mk   | 16 ++++++++++++++--
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
> index 1853dcebb5..cfa3faeff7 100644
> --- a/package/pcm-tools/pcm-tools.hash
> +++ b/package/pcm-tools/pcm-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  aa48ab1473720aeb7837b67bfc612100f484748720a8b8034daff00419709057  pcm-tools-202110.tar.gz
> +sha256  29416f83d1de95594d225f63af34f8f074ee4822010ce2e05b1fabc66933472a  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br1.tar.gz
>   sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
> diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
> index d676df57f9..c530492696 100644
> --- a/package/pcm-tools/pcm-tools.mk
> +++ b/package/pcm-tools/pcm-tools.mk
> @@ -4,8 +4,12 @@
>   #
>   ################################################################################
>   
> -PCM_TOOLS_VERSION = 202110
> -PCM_TOOLS_SITE = $(call github,opcm,pcm,$(PCM_TOOLS_VERSION))
> +# Don't use the github helper, as pcm-tools uses git attributes that are
> +# replaced when gnerating the archive.
> +# 93fc9193a70e2f1f054be554c48f4a4791be5032 is the hash of the 202110 tag.
> +PCM_TOOLS_VERSION = 93fc9193a70e2f1f054be554c48f4a4791be5032

  We did not, in fact, need to change to a hash, because the filename anyway 
changes due to the -br1 suffix. Keeping an actual version has the advantage that 
it's still possible to do version comparisons for CVE and release-monitoring.

  On the other hand, you never know if upstream changes the tag. And this 
package anyway doesn't have a valid CPE.

  Therefore, applied to master as is, thanks.

  Regards,
  Arnout

> +PCM_TOOLS_SITE = https://github.com/opcm/pcm
> +PCM_TOOLS_SITE_METHOD = git
>   PCM_TOOLS_LICENSE = BSD-3-Clause
>   PCM_TOOLS_LICENSE_FILES = LICENSE
>   
> @@ -13,6 +17,14 @@ PCM_TOOLS_EXE_FILES = \
>   	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
>   	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
>   
> +# version.h contains git attributes; replace them with the previously-known
> +# value.
> +define PCM_TOOLS_FIXUP_VERSION_H
> +	$(SED) 's/\$$Format:%ci ID=%h\$$/2021-10-25 16:07:54 +0200 ID=93fc9193/' \
> +		$(@D)/version.h
> +endef
> +PCM_TOOLS_POST_EXTRACT_HOOKS += PCM_TOOLS_FIXUP_VERSION_H
> +
>   define PCM_TOOLS_BUILD_CMDS
>   	touch $(@D)/daemon-binaries
>   	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
