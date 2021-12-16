Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98C9A417F8;
	Thu, 16 Dec 2021 20:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UaqrR-B-FJFy; Thu, 16 Dec 2021 20:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2E2417F9;
	Thu, 16 Dec 2021 20:15:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE641BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D00483F61
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YNtlCQN1oDe for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01A9D83F64
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:15:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y12so90239146eda.12
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eFICjWxjSAZnW1zP28cA0hyD3TvnGY45M6453Wmny+4=;
 b=LcxTKNRanCCKCiDbfFyliYl9Os9bK9hiRY5yrguZHLQ8XlB1yQFNRxKC9EERQOMeal
 rGRlIFGnR5y12+j0TZGiO+/PZ97BZ4S1fgrHNCFZ6nbXcqurkjZfNpIR3WZwhggxQTDF
 t2E9FWgLZ388uwLSurWH3IRiXPYv3yiAXmpRhp6R5qwFBvsvnP48B1SZZV+TK0CLKXcN
 mG6KUnM8uXzMIrswh4QCmW1UQ3+bvLd9mBswOvn2taY7/YfaaCKYISMATx631z3B4FGH
 D1WtHtXugxzSIFawWAq3fDSaKyheWZEwWDC9dXcSZAPFSAuRFd+YPt787uRiZN8rbTAp
 xBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eFICjWxjSAZnW1zP28cA0hyD3TvnGY45M6453Wmny+4=;
 b=AYUQ8v4G0OvKK77JKZmZqzDrKiS06BYnNCLnl3XDRmXJE7VtJYtwrna4u3/m+O5WCX
 PxXytt1xmyWkgrCZ3uWHDe36TBIcw5gnHgtYyIiiGGPLyLBHcHcMDTJbgf2B0aXoIg+C
 3RWDSQMk8d94cD+T+cg7lkLA+Nxl3pMcPQdC7yB/bPFUl91Mz+s79TDmTNzi/eB+eR5n
 aROCJYV/y4P78fuK0FKD4nskKUIbbpHccDE5y1AnK8FwAcb7d8NnP375zsydgczQ6Vcl
 erXoVC7MlwpUyApc6OjiopvSHq5QZTn8sUw14LLNkBIeqkCA5NyIOjSYiOTGZ+258A4V
 K3zQ==
X-Gm-Message-State: AOAM530bArf9RF6pM8eT3Kxaxayl8GzneoXEPt1eoL4DSZtLdJ/YD3wo
 ZWTMC4UJvZztzpkpKTh5rrxlgQ==
X-Google-Smtp-Source: ABdhPJwsmFo6id8j2rdezIZhCKvcVqi0HaJLMlD70mI8McIj93Xq5LS/CO7tOTQU4oxRU0gZroXhtQ==
X-Received: by 2002:a17:906:6a18:: with SMTP id
 qw24mr17033576ejc.118.1639685747198; 
 Thu, 16 Dec 2021 12:15:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb42sm2138363ejc.49.2021.12.16.12.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:15:46 -0800 (PST)
Message-ID: <4b66e48f-1cd2-88e5-fc63-67bf6878f57e@mind.be>
Date: Thu, 16 Dec 2021 21:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216184943.580682-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216184943.580682-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libqmi: fix build with help2man
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 19:49, Fabrice Fontaine wrote:
> Fix the following build failure raised with help2man since bump to
> version 1.30.0 in commit 50c5495f81d3418a0f63fc642dc6beb41cd316e0:
> 
> FAILED: docs/man/qmicli.1
> /usr/bin/help2man --output=docs/man/qmicli.1 '--name=Control QMI devices' '--help-option="--help-all"' /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
> help2man: can't get `"--help-all"' info from /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
> Try `--no-discard-stderr' if option outputs to stderr
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/15818b6de7378cd75c59b1d6dc732ed9a20c092a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...add-an-option-to-not-build-man-pages.patch | 65 +++++++++++++++++++
>   package/libqmi/libqmi.mk                      |  1 +
>   2 files changed, 66 insertions(+)
>   create mode 100644 package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
> 
> diff --git a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
> new file mode 100644
> index 0000000000..d9053de537
> --- /dev/null
> +++ b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
> @@ -0,0 +1,65 @@
> +From 295b75e9c8dc895e281e36b1e8121d09fd556af0 Mon Sep 17 00:00:00 2001
> +From: Aleksander Morgado <aleksander@aleksander.es>
> +Date: Wed, 3 Nov 2021 10:57:51 +0100
> +Subject: [PATCH] build: add an option to not build man pages
> +
> +When cross-compiling, the compiled binaries cannot be run on the build
> +machine, unless one defines a helper (e.g. qemu) in the meson
> +configuration, which is most of the time undesirable.
> +
> +If help2man is installed on the build machine, then the build would fail
> +because of this, so add an option to disable generating the man pages.
> +
> +With later versions of meson, it will be possible to automatically
> +detect this condition.
> +
> +Based on the same fix done in libmbim by Nicolas Cavallari, see
> +https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40
> +
> +Fixes https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/issues/75
> +
> +[Retrieved (and backported) from:
> +https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/295b75e9c8dc895e281e36b1e8121d09fd556af0]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build       | 8 +++++++-
> + meson_options.txt | 1 +
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index e88b43a1..c7312146 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -223,8 +223,8 @@ if enable_gtk_doc
> +   subdir('docs/reference/libqmi-glib')
> + endif
> +
> +-help2man = find_program('help2man', required: false)
> +-if help2man.found()
> ++enable_man = get_option('man')
> ++if enable_man
> +   subdir('docs/man')
> + endif
> +
> +@@ -237,6 +242,7 @@ summary({
> + output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
> + output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
> + output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
> ++output += '    man pages:             ' + enable_man.to_string() + '\n\n'
> + output += '  System paths\n'
> + output += '    prefix:                ' + qmi_prefix + '\n'
> + output += '    udev base directory:   ' + qmi_username + '\n\n'
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 4d4f913d..bee5daac 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -16,5 +16,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
> +
> + option('introspection', type: 'boolean', value: 'auto', description: 'build introspection support')
> + option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
> ++option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
> +
> + option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
> +--
> +GitLab
> +
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index cd2c2719f9..a4839f1efb 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -12,6 +12,7 @@ LIBQMI_CPE_ID_VENDOR = libqmi_project
>   LIBQMI_INSTALL_STAGING = YES
>   
>   LIBQMI_DEPENDENCIES = libglib2
> +LIBQMI_CONF_OPTS = -Dman=false
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>   LIBQMI_DEPENDENCIES += gobject-introspection
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
