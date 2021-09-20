Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6207C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:22:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5189A610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5189A610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2062E82437;
	Mon, 20 Sep 2021 19:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cL7b9aBSkn0; Mon, 20 Sep 2021 19:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2BE38275C;
	Mon, 20 Sep 2021 19:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD3C1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DA39401B6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qDLsKro8M0B for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96DED4012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:26 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c22so65188914edn.12
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qt+Dbx2HH6LWK9MAg/7ej/LmuROqnrYAMWJtFh7QEGc=;
 b=fgBwh7vW4S+hmB76Z6EuDM4ETNaEsTJovW7PyTAg3Ndd4UUPNFUImsPbN7OpiQ75M0
 cPiaHnq5k3NTujLfckiYINQeV6cGrZWFEJAliRBogf3sZnPiz5eXyJDHwMRGLLUCA1ii
 Vq7knlYm/MVTL2e9rv96n8fE3cCkh8J8hgNNxvPSaIqbKLrmLLov8WOcDn3NAaDJ9xLz
 IgPKAiW0V2uvRTUBJru4jWFbVTguTa9f9nhsdjNScxnNcBdqcPu4vZbVbTnrlKy1HKP/
 V3KkWfSpdCx2YdtDEUf3Alb9GoymhL6bvtPATzKhhhO8z2Nmfl8TRwS+7YWWGg3MhUkA
 HcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qt+Dbx2HH6LWK9MAg/7ej/LmuROqnrYAMWJtFh7QEGc=;
 b=oGPA1DH07O41kuTFmOl9z5dPXfqrWSNAY7leRxWrvR24a1KQfddehsfJIARH4emXR/
 RRdpXh9Ev/I4aHv8vqGGBiqS26IB5BCyRJNCLcQNF5p4ebUypbWekg95praHFZHWo6Ds
 BYPJt7/CAGO8eot9yNZuRpzeBqzoa1DkKxRQrtcT82YPVCWH3HA8Kfw676Bmt1fLUZgZ
 6/8ohKerFrQ2hvMgYb9jlt1ykdm33GxVu50GTk2VHjBG9uqllZZQB7BuWi0FJ+MS6lO3
 qx/VTS+RZtFcQ4h9gCmNUjqF3jj5B0d/juTTcQp32OM1FBDDRA6CaYW29nS0dCy59U8L
 fICg==
X-Gm-Message-State: AOAM530i4xaey/qUiVDT+q4peWEwKcW71y7ADY4OqUUXqpGrEb/4c9JO
 qT0OrPFJiyaHuIELCWkGl7m1R9m3W8diKw==
X-Google-Smtp-Source: ABdhPJyzyuSjl5Ubb3s2xLRumtfvQpvbjrPqxkSSeHdvCvXHoulzrxbU+x94nxhc9lTYBZH/PEo3tw==
X-Received: by 2002:a17:906:7147:: with SMTP id
 z7mr29825606ejj.94.1632165744665; 
 Mon, 20 Sep 2021 12:22:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f4sm1441706ejf.61.2021.09.20.12.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:24 -0700 (PDT)
Message-ID: <6748d0d1-8cb2-0e6e-b699-6f11da334ab1@mind.be>
Date: Mon, 20 Sep 2021 21:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210909055758.1120236-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210909055758.1120236-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: bump version to
 2.20210908
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Antoine Tenart <atenart@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 09/09/2021 07:57, Fabrice Fontaine wrote:
> - Drop upstreamed patches
> - Update indentation in hash file (two spaces)
> - Fix the following build failure with wireshark raised since commit
>    975ab2fa88a0c94b362499ea8ad99222f335fb45 thanks to
>    https://github.com/SELinuxProject/refpolicy/commit/d5c571c85567fe191fcc64dfb99b36788f806ceb:
> 
>   Compiling targeted policy.31
>   env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
>   policy/modules/apps/wireshark.te:96:ERROR 'unknown type xdg_downloads_t' at token ';' on line 645315:
>   #line 96
> 	allow wireshark_t xdg_downloads_t:dir { getattr search open };
>   checkpolicy:  error(s) encountered while parsing configuration
>   make[1]: *** [Rules.monolithic:79: policy.31] Error 1
> 
> https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20210908
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dfbc667e0c17072ddab89a03244f572d5234da50
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ervices-minidlna.te-make-xdg-optiona.patch | 52 -------------------
>   ...rvices-samba.te-make-crack-optional.patch} |  1 +
>   ...-services-cvs.te-make-inetd-optional.patch | 37 -------------
>   ...ervices-ifplugd.te-make-netutils-opt.patch | 48 -----------------
>   ...es-services-ftp-te-make-ssh-optional.patch | 44 ----------------
>   package/refpolicy/refpolicy.hash              |  4 +-
>   package/refpolicy/refpolicy.mk                |  4 +-
>   7 files changed, 5 insertions(+), 185 deletions(-)
>   delete mode 100644 package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
>   rename package/refpolicy/{0005-policy-modules-services-samba.te-make-crack-optional.patch => 0001-policy-modules-services-samba.te-make-crack-optional.patch} (97%)
>   delete mode 100644 package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
>   delete mode 100644 package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
>   delete mode 100644 package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
> 
> diff --git a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch b/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
> deleted file mode 100644
> index c4e98ad141..0000000000
> --- a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 65c87bdfb1c895934582988f03f1c9c452c1426b Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 25 Jul 2021 17:59:15 +0200
> -Subject: [PATCH] policy/modules/services/minidlna.te: make xdg optional
> -
> -Make xdg optional to avoid the following build failure:
> -
> - Compiling targeted policy.28
> - env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-1/output-1/host/lib:/home/buildroot/autobuild/instance-1/output-1/host/usr/lib" /home/buildroot/autobuild/instance-1/output-1/host/usr/bin/checkpolicy -c 28 -U deny -S -O -E policy.conf -o policy.28
> - policy/modules/services/minidlna.te:85:ERROR 'unknown type xdg_music_t' at token ';' on line 146109:
> - #line 85
> -	allow minidlna_t xdg_music_t:dir { getattr search open };
> - checkpolicy:  error(s) encountered while parsing configuration
> - Rules.monolithic:78: recipe for target 'policy.28' failed
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa/build-end.log
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/396]
> ----
> - policy/modules/services/minidlna.te | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/policy/modules/services/minidlna.te b/policy/modules/services/minidlna.te
> -index b980d2707..4d87e8ee7 100644
> ---- a/policy/modules/services/minidlna.te
> -+++ b/policy/modules/services/minidlna.te
> -@@ -82,10 +82,6 @@ logging_search_logs(minidlna_t)
> - miscfiles_read_localization(minidlna_t)
> - miscfiles_read_public_files(minidlna_t)
> -
> --xdg_read_music(minidlna_t)
> --xdg_read_pictures(minidlna_t)
> --xdg_read_videos(minidlna_t)
> --
> - tunable_policy(`minidlna_read_generic_user_content',`
> - 	userdom_list_user_tmp(minidlna_t)
> - 	userdom_read_user_home_content_files(minidlna_t)
> -@@ -101,3 +97,9 @@ tunable_policy(`minidlna_read_generic_user_content',`
> - 	userdom_dontaudit_read_user_home_content_files(minidlna_t)
> - 	userdom_dontaudit_read_user_tmp_files(minidlna_t)
> - ')
> -+
> -+optional_policy(`
> -+	xdg_read_music(minidlna_t)
> -+	xdg_read_pictures(minidlna_t)
> -+	xdg_read_videos(minidlna_t)
> -+')
> ---
> -2.30.2
> -
> diff --git a/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
> similarity index 97%
> rename from package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
> rename to package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
> index f5cc356aeb..2dae5d4a76 100644
> --- a/package/refpolicy/0005-policy-modules-services-samba.te-make-crack-optional.patch
> +++ b/package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
> @@ -16,6 +16,7 @@ Fixes:
>    - http://autobuild.buildroot.org/results/ab7098948d1920e42fa587e07f0513f23ba7fc74
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/407]
>   ---
>    policy/modules/services/samba.te | 32 ++++++++++++++++++--------------
>    1 file changed, 18 insertions(+), 14 deletions(-)
> diff --git a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch b/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
> deleted file mode 100644
> index 298f99c474..0000000000
> --- a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 21b0a5bc50e15e9af7edb3edad9fac0bf03f7028 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 30 Jul 2021 23:11:38 +0200
> -Subject: [PATCH] policy/modules/services/cvs.te: make inetd optional
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: not sent yet]
> ----
> - policy/modules/services/cvs.te | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/policy/modules/services/cvs.te b/policy/modules/services/cvs.te
> -index f2f60556c..61589228f 100644
> ---- a/policy/modules/services/cvs.te
> -+++ b/policy/modules/services/cvs.te
> -@@ -15,7 +15,6 @@ gen_tunable(allow_cvs_read_shadow, false)
> -
> - type cvs_t;
> - type cvs_exec_t;
> --inetd_tcp_service_domain(cvs_t, cvs_exec_t)
> - init_daemon_domain(cvs_t, cvs_exec_t)
> - application_executable_file(cvs_exec_t)
> -
> -@@ -98,6 +97,10 @@ tunable_policy(`allow_cvs_read_shadow',`
> - 	auth_tunable_read_shadow(cvs_t)
> - ')
> -
> -+optional_policy(`
> -+	inetd_tcp_service_domain(cvs_t, cvs_exec_t)
> -+')
> -+
> - optional_policy(`
> - 	kerberos_read_config(cvs_t)
> - 	kerberos_read_keytab(cvs_t)
> ---
> -2.30.2
> -
> diff --git a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch b/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
> deleted file mode 100644
> index b43354ed2b..0000000000
> --- a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 6dcfb6715de75677165221ee5bd8d4db6e4a01a7 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 31 Jul 2021 10:58:42 +0200
> -Subject: [PATCH] policy/modules/services/ifplugd.te: make netutils
> - optional
> -
> -Make netutils optional to avoid the following build failure:
> -
> - Compiling targeted policy.30
> - env LD_LIBRARY_PATH="/tmp/instance-3/output-1/host/lib:/tmp/instance-3/output-1/host/usr/lib" /tmp/instance-3/output-1/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
> - policy/modules/services/ifplugd.te:62:ERROR 'type netutils_exec_t is not within scope' at token ';' on line 73694:
> - #line 62
> - 	allow ifplugd_t netutils_exec_t:file { getattr open map read execute ioctl };
> - checkpolicy:  error(s) encountered while parsing configuration
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: not sent yet]
> ----
> - policy/modules/services/ifplugd.te | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/policy/modules/services/ifplugd.te b/policy/modules/services/ifplugd.te
> -index f49b147f7..550eecca4 100644
> ---- a/policy/modules/services/ifplugd.te
> -+++ b/policy/modules/services/ifplugd.te
> -@@ -59,8 +59,6 @@ logging_send_syslog_msg(ifplugd_t)
> -
> - miscfiles_read_localization(ifplugd_t)
> -
> --netutils_domtrans(ifplugd_t)
> --
> - sysnet_domtrans_ifconfig(ifplugd_t)
> - sysnet_domtrans_dhcpc(ifplugd_t)
> - sysnet_delete_dhcpc_runtime_files(ifplugd_t)
> -@@ -70,3 +68,7 @@ sysnet_signal_dhcpc(ifplugd_t)
> - optional_policy(`
> - 	consoletype_exec(ifplugd_t)
> - ')
> -+
> -+optional_policy(`
> -+	netutils_domtrans(ifplugd_t)
> -+')
> ---
> -2.30.2
> -
> diff --git a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch b/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
> deleted file mode 100644
> index 9269c7aff8..0000000000
> --- a/package/refpolicy/0004-policy-modules-services-ftp-te-make-ssh-optional.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From f26d4bc1b2a7b781c67891cb3bf4579c6582d630 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 30 Jul 2021 22:40:20 +0200
> -Subject: [PATCH] policy/modules/services/ftp.te: make ssh optional
> -
> -Make ssh optional to avoid the following build failure:
> -
> - Compiling targeted policy.30
> - env LD_LIBRARY_PATH="/home/fabrice/buildroot/output/host/lib:/home/fabrice/buildroot/output/host/usr/lib" /home/fabrice/buildroot/output/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
> - policy/modules/services/ftp.te:484:ERROR 'type ssh_home_t is not within scope' at token ';' on line 92051:
> - 	allow sftpd_t ssh_home_t:dir { open read getattr lock search ioctl add_name remove_name write };
> - #line 484
> - checkpolicy:  error(s) encountered while parsing configuration
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - policy/modules/services/ftp.te | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/policy/modules/services/ftp.te b/policy/modules/services/ftp.te
> -index 0d84da71cf..5686b22581 100644
> ---- a/policy/modules/services/ftp.te
> -+++ b/policy/modules/services/ftp.te
> -@@ -481,10 +481,6 @@ tunable_policy(`sftpd_full_access',`
> - 	files_manage_non_auth_files(sftpd_t)
> - ')
> -
> --tunable_policy(`sftpd_write_ssh_home',`
> --	ssh_manage_home_files(sftpd_t)
> --')
> --
> - tunable_policy(`use_samba_home_dirs',`
> - 	fs_list_cifs(sftpd_t)
> - 	fs_read_cifs_files(sftpd_t)
> -@@ -496,3 +492,9 @@ tunable_policy(`use_nfs_home_dirs',`
> - 	fs_read_nfs_files(sftpd_t)
> - 	fs_read_nfs_symlinks(ftpd_t)
> - ')
> -+
> -+optional_policy(`
> -+	tunable_policy(`sftpd_write_ssh_home',`
> -+		ssh_manage_home_files(sftpd_t)
> -+	')
> -+')
> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> index 6c33a4d974..b8f6f023eb 100644
> --- a/package/refpolicy/refpolicy.hash
> +++ b/package/refpolicy/refpolicy.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/SELinuxProject/refpolicy/releases
> -sha256 48cbf2c63ff9003bef05e03c8d3cdddb4e8f63fef2a072ae51c987301f0b874d  refpolicy-2.20210203.tar.bz2
> +sha256  4d3140d9fbb91322f5de36d73959464ce1d8946dcd149e36fcaf60e92444e902  refpolicy-2.20210908.tar.bz2
>   
>   # Locally computed
> -sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
> +sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index a42483dba2..eb345d0f98 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -22,9 +22,9 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
>   REFPOLICY_SITE_METHOD = git
>   BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
>   else
> -REFPOLICY_VERSION = 2.20210203
> +REFPOLICY_VERSION = 2.20210908
>   REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
> -REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20210203
> +REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
>   endif
>   
>   # Cannot use multiple threads to build the reference policy
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
