Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A713AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E27F408EA;
	Sun, 19 Jun 2022 15:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E27F408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFkt4u3D2yi2; Sun, 19 Jun 2022 15:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA6FD408E6;
	Sun, 19 Jun 2022 15:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6FD408E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A13601BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A4E681842
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4E681842
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4CDcHTdP9FI for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE5481819
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BE5481819
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:55:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o10so12024692edi.1
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6wXMUIxxMibzCjrCYdJps87ju+scDVSQ6jAC/A2ckxo=;
 b=0/ng6ptPI5M7JWa8lThz4Eyr6omWdpeP9SdFute23PnzBhdp87VSE62uO/0Zn6MtUV
 L6iWfRmH7/59hQtb69ezD28Mup6AmBrL3cu9loZ7avXHGMrYzmFsBnHVftGAXu0IeQom
 txazR/5oqUfmhfEXEqrn+ssJ61FVAvrx1UY1IgBp5hndfYmJJJlqAfCzJFUTiNzZjmYs
 rH3rwrG7GI2wMAQrqMLMpCcnv+B3KneNYT0OZsiMXUK8uKCJIWF1KZyXougebwwqqHkY
 q/Tmi8T8EizKHG7H2WnfPvGdckllOsd4KZiNwNAeaxrhdgBmpk68sLqobyKrCkVXhHqI
 U85A==
X-Gm-Message-State: AJIora/vTLc/EWcmPw2GUiJoaTBCkmM0PV5PRrkcx1ebj16Qpsg64ZnX
 99pVpe/CmDnHTikDaFNk2+gliDE/XKuudQ==
X-Google-Smtp-Source: AGRyM1tRXrdPCSDos2p80w189zgU/hHURgKyyjJr9s4uwjfhsjmbKvCYYbxlKWo54/5bH5j/KmI38A==
X-Received: by 2002:a05:6402:1f02:b0:435:4a90:ec8e with SMTP id
 b2-20020a0564021f0200b004354a90ec8emr19750790edb.131.1655654129585; 
 Sun, 19 Jun 2022 08:55:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906329500b006fe8a4ec62fsm4712657ejw.4.2022.06.19.08.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:55:29 -0700 (PDT)
Message-ID: <bf145aa4-0370-91a5-4583-0932e531091a@mind.be>
Date: Sun, 19 Jun 2022 17:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613201758.293344-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613201758.293344-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6wXMUIxxMibzCjrCYdJps87ju+scDVSQ6jAC/A2ckxo=;
 b=S1xR3HxJjuqa1FrBvFzRXM2E3gBqbOyMZBIwKw2gyE5XMN7Rk48S2lJ89TvfM00+fb
 KPeCalZFxY2IxP+DftAGjUxxqsSy0eQfveoGNce4UMuXlZDhE/C2hJDdFQZvSPCRBcaN
 PqlVRa4CssTuxpagsFFSRfPjS8LQyVb9Q9Er/p0xFLqYTHlTz13XSNN8EvOn6FGf6WXe
 aawTRtT5zQsBlpeWyh8LcImTa+8h9TguZuyzs1BVYnm13R6gqO3MmCfxtZm3qx+Yl1hd
 IpJa0lYQDSaHUp0AqupQ/Vlth8aQNkQoGNLN4JgGVtAeZhcUzGywVuJLycCDfJrbP/LI
 2AFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S1xR3HxJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libtalloc: fix build wihout SSP
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2022 22:17, Fabrice Fontaine wrote:
> Fix the following build failure without SSP raised since the addition of
> the package in commit f0d37e275a915539a581c4ac7fd066eddc41fc8c:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
> talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


  Applied to master, thanks.

  Since upstream seemed to risk not accepting the package, I added a comment 
that hopefully will tickle them (for real this time).

  Regards,
  Arnout

> ---
>   ...mba-add-disable-stack-protector-opti.patch | 116 ++++++++++++++++++
>   package/libtalloc/libtalloc.mk                |   1 +
>   2 files changed, 117 insertions(+)
>   create mode 100644 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
> 
> diff --git a/package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch b/package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
> new file mode 100644
> index 0000000000..839479a3fa
> --- /dev/null
> +++ b/package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
> @@ -0,0 +1,116 @@
> +From 5885ed8e6db7648e6842d9811aace7edc4e8aba7 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 20 Apr 2022 11:16:52 +0200
> +Subject: [PATCH] buildtools/wafsamba: add --disable-stack-protector option
> +
> +Allow the user to disable stack-protector through
> +--disable-stack-protector to avoid the following build failure with
> +libtalloc on embedded toolchains which don't support stack-protector:
> +
> +/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
> +talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
> +
> +This build failure is raised since
> +https://gitlab.com/ffontaine/samba/-/commit/38e97f8b52e85bdfcf2d74a4fb3c848fa46ba371
> +because stack-protector is enabled on libtalloc despite the fact that
> +libssp is not available:
> +
> +Checking if compiler accepts -fstack-protector-strong                                           : yes
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.com/samba-team/samba/-/merge_requests/2493]
> +---
> + buildtools/wafsamba/samba_autoconf.py | 49 ++++++++++++++-------------
> + buildtools/wafsamba/wscript           |  3 ++
> + 2 files changed, 28 insertions(+), 24 deletions(-)
> +
> +diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
> +index 78927d85193..23a995e1c34 100644
> +--- a/buildtools/wafsamba/samba_autoconf.py
> ++++ b/buildtools/wafsamba/samba_autoconf.py
> +@@ -703,9 +703,28 @@ def SAMBA_CONFIG_H(conf, path=None):
> +     if not IN_LAUNCH_DIR(conf):
> +         return
> +
> +-    # we need to build real code that can't be optimized away to test
> +-    stack_protect_list = ['-fstack-protector-strong', '-fstack-protector']
> +-    for stack_protect_flag in stack_protect_list:
> ++    if not Options.options.disable_stack_protector:
> ++        # we need to build real code that can't be optimized away to test
> ++        stack_protect_list = ['-fstack-protector-strong', '-fstack-protector']
> ++        for stack_protect_flag in stack_protect_list:
> ++            flag_supported = conf.check(fragment='''
> ++                                        #include <stdio.h>
> ++
> ++                                        int main(void)
> ++                                        {
> ++                                            char t[100000];
> ++                                            while (fgets(t, sizeof(t), stdin));
> ++                                            return 0;
> ++                                        }
> ++                                        ''',
> ++                                        execute=0,
> ++                                        cflags=[ '-Werror', '-Wp,-D_FORTIFY_SOURCE=2', stack_protect_flag],
> ++                                        mandatory=False,
> ++                                        msg='Checking if compiler accepts %s' % (stack_protect_flag))
> ++            if flag_supported:
> ++                conf.ADD_CFLAGS('%s' % (stack_protect_flag))
> ++                break
> ++
> +         flag_supported = conf.check(fragment='''
> +                                     #include <stdio.h>
> +
> +@@ -717,29 +736,11 @@ def SAMBA_CONFIG_H(conf, path=None):
> +                                     }
> +                                     ''',
> +                                     execute=0,
> +-                                    cflags=[ '-Werror', '-Wp,-D_FORTIFY_SOURCE=2', stack_protect_flag],
> ++                                    cflags=[ '-Werror', '-fstack-clash-protection'],
> +                                     mandatory=False,
> +-                                    msg='Checking if compiler accepts %s' % (stack_protect_flag))
> ++                                    msg='Checking if compiler accepts -fstack-clash-protection')
> +         if flag_supported:
> +-            conf.ADD_CFLAGS('%s' % (stack_protect_flag))
> +-            break
> +-
> +-    flag_supported = conf.check(fragment='''
> +-                                #include <stdio.h>
> +-
> +-                                int main(void)
> +-                                {
> +-                                    char t[100000];
> +-                                    while (fgets(t, sizeof(t), stdin));
> +-                                    return 0;
> +-                                }
> +-                                ''',
> +-                                execute=0,
> +-                                cflags=[ '-Werror', '-fstack-clash-protection'],
> +-                                mandatory=False,
> +-                                msg='Checking if compiler accepts -fstack-clash-protection')
> +-    if flag_supported:
> +-        conf.ADD_CFLAGS('-fstack-clash-protection')
> ++            conf.ADD_CFLAGS('-fstack-clash-protection')
> +
> +     if Options.options.debug:
> +         conf.ADD_CFLAGS('-g', testflags=True)
> +diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
> +index 8729b0829da..d75bb3b1c0c 100644
> +--- a/buildtools/wafsamba/wscript
> ++++ b/buildtools/wafsamba/wscript
> +@@ -165,6 +165,9 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
> +     gr.add_option('--disable-warnings-as-errors',
> +                    help=("Do not treat all warnings as errors (disable -Werror)"),
> +                    action="store_true", dest='disable_warnings_as_errors', default=False)
> ++    gr.add_option('--disable-stack-protector',
> ++                   help=("Disable stack-protector"),
> ++                   action="store_true", dest='disable_stack_protector', default=False)
> +     opt.add_option('--enable-coverage',
> +                    help=("enable options necessary for code coverage "
> +                          "reporting on selftest (default=no)"),
> +--
> +2.35.1
> +
> diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
> index 79bcf94947..8cba699ea1 100644
> --- a/package/libtalloc/libtalloc.mk
> +++ b/package/libtalloc/libtalloc.mk
> @@ -20,6 +20,7 @@ LIBTALLOC_INSTALL_STAGING = YES
>   # libtalloc since it's optional.
>   LIBTALLOC_CONF_OPTS += --cross-compile \
>   		--cross-answers=$(@D)/cache.txt \
> +		--disable-stack-protector \
>   		--hostcc=gcc \
>   		--with-libiconv=$(STAGING_DIR)/usr
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
