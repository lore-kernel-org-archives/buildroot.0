Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071C5CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D325402D0;
	Sun, 15 Oct 2023 20:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D325402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwCSJJ8ocYKo; Sun, 15 Oct 2023 20:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E689414BF;
	Sun, 15 Oct 2023 20:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E689414BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8621B1BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3A341774
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3A341774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 453b-_8AWCjr for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:02:38 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1026A4175D
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1026A4175D
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53db3811d8fso7862213a12.1
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400156; x=1698004956;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKA/DvYxuq7VvgVOsOTTVSz4siCbVkTAQV2Kzvh52LE=;
 b=uicTPisZjDujMsgqkd25DYNX9vzW3j6kHb6mhoEGyFfNDoty/7SXL2MdHKlT7VBViQ
 UAQo8/Regv6RysYNpoPFHzAHCmZT8MMYvGrTvjGOC7Rl5dKFcTKGGugdVkf+Ip41Ggts
 QDtbl/F+298DzYYzYt1eQBhWX/FupPwYlPJrhkdvsJheISKfWct6XyoOUVwTReOMiAgq
 vECrYQ7o5zgh3GSoh8CDRFAd/cHNya3ZxUmYx5ec0zEMJFTydkFCnHigWiYiggpl07EM
 Ry0XtE2oegvZtR9XMz+PzzStAjevbLSEIzMZdiGonhjGmDmjJT7kLywsdpYddFvKe4vT
 8WnA==
X-Gm-Message-State: AOJu0Yys874ULW5AMRYHHMMa/d7yZm3jaRYzzUKJ9tdcv6RIyAuwo/Yi
 0Bo4LiWKXrAalnj0kiV+8zPzAQ==
X-Google-Smtp-Source: AGHT+IGjDPZW7Fq5+q3YNi2IwGNt2DQLv3p4dTVrzHmM67E927GE51Rkl6ehNnlacMHX38OMS+Kwgw==
X-Received: by 2002:a50:f69c:0:b0:534:2e37:dfd4 with SMTP id
 d28-20020a50f69c000000b005342e37dfd4mr5168451edn.1.1697400156083; 
 Sun, 15 Oct 2023 13:02:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a056402184600b005333922efb0sm14320311edy.78.2023.10.15.13.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:02:35 -0700 (PDT)
Message-ID: <8d6b9863-e522-7b0a-c831-976ba9be5ec2@mind.be>
Date: Sun, 15 Oct 2023 22:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20231015194800.1894656-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20231015194800.1894656-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697400156; x=1698004956; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bKA/DvYxuq7VvgVOsOTTVSz4siCbVkTAQV2Kzvh52LE=;
 b=eZ4rDRYv3eJjHjqT++F3w3Yw0ZpiepVB9AkhwY3J7+6Fdv6+k9WPLKqxQ1Sf8/sLC3
 Vr1fKkWj4pqMCqdZcqYqkQTsFVrd6ca2Pc0WQsZws1GZRgPM3BNcsCp6Va2TM4GMDD8e
 sqW/9MyM6LxXepiBHOpTEuRLQAl2AZQAASgIZ41vlezArGC1zbUmdjCZcg83etqRTZKr
 dxtmpEV5whps8eYrRDgY5mHXClIgr0P8U6ACp9LcTxVTwpVN/D0u666RJF3E/K/vM2kq
 jW1d9hpFf9mg8tEUGDqwiiMAm7LESzhp/KuWdgrPhQN6jNQ3EqdG+xlYc9rGT6c+3Pxv
 6TWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eZ4rDRYv
Subject: Re: [Buildroot] [PATCH v2] package/libnvme: bump to version 1.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 21:48, Giulio Benetti wrote:
> Add 2 local patches, one to avoid build failure due to different libc
> ioctl() prototype and one to avoid link conflict due to test unit enabled
> by default.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> * fix build failure due to ioctl() and test unit
> ---
>   ...01-test-handle-POSIX-ioctl-prototype.patch | 70 +++++++++++++++++++
>   ...eson-make-building-tests-conditional.patch | 46 ++++++++++++
>   package/libnvme/libnvme.hash                  |  2 +-
>   package/libnvme/libnvme.mk                    |  5 +-
>   4 files changed, 121 insertions(+), 2 deletions(-)
>   create mode 100644 package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
>   create mode 100644 package/libnvme/0002-meson-make-building-tests-conditional.patch
> 
> diff --git a/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch b/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
> new file mode 100644
> index 0000000000..175cdcd7dd
> --- /dev/null
> +++ b/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
> @@ -0,0 +1,70 @@
> +From ca47ba3119365eafac0ab25a86cab9d9a1b29bd4 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sat, 30 Sep 2023 06:38:53 +0100
> +Subject: [PATCH] test: handle POSIX ioctl prototype
> +
> +glibc has the following prototype for ioctl: int ioctl(int fd, unsigned long request, ...)
> +POSIX (inc. musl) has the following for ioctl: int ioctl(int fd, int request, ...)
> +
> +Check which prototype is used in <sys/ioctl.h> to avoid a conflict and conditionally
> +define the right one for the system.
> +
> +Upstream: https://github.com/linux-nvme/libnvme/commit/ca47ba3119365eafac0ab25a86cab9d9a1b29bd4
> +
> +Bug: https://bugs.gentoo.org/914921
> +Signed-off-by: Sam James <sam@gentoo.org>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + meson.build       | 10 ++++++++++
> + test/ioctl/mock.c |  6 +++++-
> + 2 files changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 6fcf1da..2c979cc 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -230,6 +230,16 @@ conf.set(
> +     ),
> +     description: 'Is network address and service translation available'
> + )
> ++conf.set(
> ++    'HAVE_GLIBC_IOCTL',
> ++    cc.compiles(
> ++        '''#include <sys/ioctl.h>
> ++        int ioctl(int fd, unsigned long request, ...);
> ++        ''',
> ++        name: 'ioctl has glibc-style prototype'
> ++    ),
> ++    description: 'Is ioctl the glibc interface (rather than POSIX)'
> ++)
> +
> + if cc.has_function_attribute('fallthrough')
> +   conf.set('fallthrough', '__attribute__((__fallthrough__))')
> +diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
> +index e917244..5d2ac94 100644
> +--- a/test/ioctl/mock.c
> ++++ b/test/ioctl/mock.c
> +@@ -114,7 +114,11 @@ void end_mock_cmds(void)
> + 	} \
> + })
> +
> ++#ifdef HAVE_GLIBC_IOCTL
> + int ioctl(int fd, unsigned long request, ...)
> ++#else
> ++int ioctl(int fd, int request, ...)
> ++#endif
> + {
> + 	struct mock_cmds *mock_cmds;
> + 	bool result64;
> +@@ -141,7 +145,7 @@ int ioctl(int fd, unsigned long request, ...)
> + 		result64 = true;
> + 		break;
> + 	default:
> +-		fail("unexpected %s %lu", __func__, request);
> ++		fail("unexpected %s %lu", __func__, (unsigned long) request);
> + 	}
> + 	check(mock_cmds->remaining_cmds,
> + 	      "unexpected %s command", mock_cmds->name);
> +--
> +2.34.1
> +
> diff --git a/package/libnvme/0002-meson-make-building-tests-conditional.patch b/package/libnvme/0002-meson-make-building-tests-conditional.patch
> new file mode 100644
> index 0000000000..0b6d3681ca
> --- /dev/null
> +++ b/package/libnvme/0002-meson-make-building-tests-conditional.patch
> @@ -0,0 +1,46 @@
> +From ff742e792725c316ba6de0800188bf36751bd1d1 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sat, 30 Sep 2023 06:43:39 +0100
> +Subject: [PATCH] meson: make building tests conditional
> +
> +Just like we do for docs.
> +
> +Upstream: https://github.com/linux-nvme/libnvme/commit/ff742e792725c316ba6de0800188bf36751bd1d1
> +
> +Signed-off-by: Sam James <sam@gentoo.org>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + meson.build       | 4 +++-
> + meson_options.txt | 1 +
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 2c979cc..a9263b5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -273,7 +273,9 @@ subdir('internal')
> + subdir('ccan')
> + subdir('src')
> + subdir('libnvme')
> +-subdir('test')
> ++if get_option('tests')
> ++    subdir('test')
> ++endif
> + subdir('examples')
> + subdir('doc')
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +index a1ed79f..251ae11 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -6,6 +6,7 @@ option('rstdir', type : 'string', value : '', description : 'directory for ReST
> +
> + option('docs', type : 'combo', choices : ['false', 'html', 'man', 'rst', 'all'], description : 'install documentation')
> + option('docs-build', type : 'boolean', value : false,  description : 'build documentation')
> ++option('tests', type : 'boolean', value : true, description : 'build tests')
> +
> + option('python', type : 'feature', value: 'auto', description : 'Generate libnvme python bindings')
> + option('openssl', type : 'feature', value: 'auto', description : 'OpenSSL support')
> +--
> +2.34.1
> +
> diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
> index b869ae295a..b9e0281189 100644
> --- a/package/libnvme/libnvme.hash
> +++ b/package/libnvme/libnvme.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated sha256 checksums
> -sha256  f73ba1edde059b2d5e7c1048ad4f895e6047bff241c94b34a7aff5894779d086  libnvme-1.5.tar.gz
> +sha256  0dd8ba8b655abe78c09833edb66632aa6bee82aebf117dd252ded968deaaeec7  libnvme-1.6.tar.gz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
> index 71885e198c..38394b9931 100644
> --- a/package/libnvme/libnvme.mk
> +++ b/package/libnvme/libnvme.mk
> @@ -4,12 +4,15 @@
>   #
>   ################################################################################
>   
> -LIBNVME_VERSION = 1.5
> +LIBNVME_VERSION = 1.6
>   LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
>   LIBNVME_LICENSE = LGPL-2.1
>   LIBNVME_LICENSE_FILES = COPYING
>   LIBNVME_INSTALL_STAGING = YES
>   
> +LIBNVME_CONF_OPTS += \
> +	-Dtests=false
> +
>   ifeq ($(BR2_PACKAGE_PYTHON3),y)
>   LIBNVME_DEPENDENCIES += python3
>   LIBNVME_CONF_OPTS += -Dpython=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
