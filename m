Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F55C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:16:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD4361248
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DD4361248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B95C8101A;
	Tue,  9 Nov 2021 22:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QiZLuHc4bZM; Tue,  9 Nov 2021 22:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F989814B7;
	Tue,  9 Nov 2021 22:16:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD691BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF5E260766
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28wBlJPT6TnC for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82E586075D
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:16:47 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ee33so2350155edb.8
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MwlWFBCg4+o8V/qcnH89WoLu+afHCoOqRCX+ZMUmS8k=;
 b=grSOZhrPXxrdKHZlj85FLE4Sx7pZ/bq18G7irFBlDLadBlPqcMSJK6NJu6yAfaukpT
 3zI787tqcbi9UqUMrYRseJiwRvax+y989amqDo8kfooQ+jkZZHvjjPCPhrN1dAHEsAEk
 KJxenJZzI+6wWACkRYT0HyQvIGaq/m4HbDMGEja+Ac2a7fqeU0OZW/A8rR1kW9/Rk8sD
 nagvV92wALvJL/TUOlhkdUjxkPXasLanIZBRwb/TwnycJ0D66a9FGAMsLj/EJK1M9wKC
 nWkRuJ9WYxTLNU2mRHOD87c3JmwU87vA9uzuRKRqjA+0sz3mhIfToACWoqfgp/WSSdiV
 3+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MwlWFBCg4+o8V/qcnH89WoLu+afHCoOqRCX+ZMUmS8k=;
 b=Uyk0txrxam+d8xF9iSZznEP9AiZNh1jMqw5JUnWQ5kNG4kyaKm/b/LJpsQJjiwm6Pz
 vJ8b+63G4yA3aArK7f/65rspPoVzjV+XT/CbcSvE2n3BKdrUZiutD4MUCb+yMCDXyZyZ
 6hd195cGq9r0WwygnKqDh/ARfRdkMPBwt0qjewIacEEPas7+Z9FZPX7PTTzNdSqYComQ
 K92FYzJtOdfSLPge2+fw6GnGwvrNR6nYkOAsNhqr9MnkrEuypX/T8zssaWGY0sR/fbj5
 1FtVu4inm3MQJSqGag8dQMOU7XEF08BYsJGpFdwwn2cVhcwDW/iD0pSX4JGO0TqPXH9Y
 w2oA==
X-Gm-Message-State: AOAM530ac9/X7NPU0QRhZJOPME89t1VLc8VhR8/G4XE5DG2goAXRUcL3
 KhuRgO1CYtV7jRbp4FQbMBpYblfyFGb33w==
X-Google-Smtp-Source: ABdhPJzF5vcj0BRZIkqYsklxNMTWPqfnHIa1s7fy0dTrfFvbM8hkmTrs0pJtXVfaMZaUnZTVSFttNw==
X-Received: by 2002:aa7:ca0a:: with SMTP id y10mr15313022eds.148.1636496205742; 
 Tue, 09 Nov 2021 14:16:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ds17sm5652163ejc.45.2021.11.09.14.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:16:45 -0800 (PST)
Message-ID: <1f024089-4dff-0a78-ae7b-1b27895c511e@mind.be>
Date: Tue, 9 Nov 2021 23:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf
 >= 2.70
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
Cc: =?UTF-8?Q?Adrien_Gallou=c3=abt?= <adrien@gallouet.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2021 21:12, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> checking for glob.h... no
> configure: error: glob.h not found.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...gure.ac-fix-build-with-autoconf-2.70.patch | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> 
> diff --git a/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> new file mode 100644
> index 0000000000..b412a55ead
> --- /dev/null
> +++ b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> @@ -0,0 +1,43 @@
> +From aa5bc6d2e59c5257d777a45ee4a0e0a784c44244 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 5 Nov 2021 20:58:41 +0100
> +Subject: [PATCH] configure.ac: fix build with autoconf >= 2.70
> +
> +On some embedded toolchains, glob.h detection fails because -g is
> +wrongly added (even when CFLAGS is overwritten):
> +
> +configure:5881: checking for glob.h
> +configure:5904: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.fb729d13'
> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.fb729d13'
> +
> +This build failure is raised since autoconf 2.70 and
> +https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=76754e04fce5f6a7701bec57b057020585df2ae3
> +because ac_test_CFLAGS is now set to ${CFLAGS+y} instead of
> +${CFLAGS+set}
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to bird-users@network.cz]

  Why not create an MR? You can log in to their gitlab with a github account 
(funny that you can't log in with a gitlab.com account...)

> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 64181d29..b4b3fcfb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -114,7 +114,7 @@ AC_SEARCH_LIBS([clock_gettime], [rt posix4],
> + AC_CANONICAL_HOST
> +
> + # Store this value because ac_test_CFLAGS is overwritten by AC_PROG_CC
> +-if test "$ac_test_CFLAGS" != set ; then
> ++if ! test $ac_test_CFLAGS ; then

  Wouldn't it be more future-safe to put quotes around $ac_test_CFLAGS?

  Regards,
  Arnout

> +   bird_cflags_default=yes
> + fi
> +
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
