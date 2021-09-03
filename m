Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0E5C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4393B610C8
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 18:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4393B610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1DA2407FE;
	Fri,  3 Sep 2021 18:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMH9o9wyu14v; Fri,  3 Sep 2021 18:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2FC24027A;
	Fri,  3 Sep 2021 18:53:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFA3D1BF321
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF36380C59
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 18:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMoYUw_wFwMM for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 18:53:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD62480C3B
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 18:53:54 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id h9so16915ejs.4
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RdbSJPC8e4BeH2CvPbBs4OhyPKlCefyIxmHmQDJVYCw=;
 b=Q29JHqnYcYBrg0OLER7kg1Do+c59yk377qu61zz5S/u3BUd3G49DodtuPgiL6Gsi9f
 1vRqKrUm7VsR0Jg8ppneIC/Hcz1KqeDr3VJ3ZuoDWMR+Ky5S3hWPUzVccH37Ow6FEns9
 huN+elOFIart4xZGA3wTrzF1rwZYwXt/jIO9Dne98OFaUv2rIqDSJNr2FQUVOF0jkG4u
 A1Fcm8Q2KhA7sMrlK6l03yqsdsWcQRxzdKQgikIxT4wTSoTEb+LROomTd5py1tGWtiTd
 9YVkaQYre+aRNJ1N6JyTJ9wkaOl7FKe+SGs9iaUOagOWm0ej5fe17yeL7E0nwBLlV3JV
 qkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RdbSJPC8e4BeH2CvPbBs4OhyPKlCefyIxmHmQDJVYCw=;
 b=skQBj6p0hiRoWizKfeRwxmz+B4ZxC77NWlzqDGYHVtzAvoW7cD/w3g8ewTkamEEFZP
 lGHie7oqlp3RfyhtFSt+jjw5ES7aG34n56EiGzdSohL8KFNqq6HKImQwfMTdn6badGzX
 3qd+D+moNBNWvhCyfzi7taisHabAuwWkUOpEMUYuzj18Ft06OX2VtmOdIeAdyXSmFQ3R
 MY9ssTWJL0/iSjS7kgkxcXM0j3naAzBJv+2wqvV/9tHtKAthQRULZLeJZUwiRRkPeZxU
 HCGSJ5wYHI+aApk92mDZr+xr/psIKhwuTt/onGfEdjpKuK6YwkPKp2ygsaM5yL7zJbPh
 7MQg==
X-Gm-Message-State: AOAM530Lf0B43IOFy98kdGX8tkGmOtq6DfL5P4bpBGklo9pZJ9jupEuI
 o59Sz1eQfKT8Oh38zX6Td0Il0HUK1UHvnw==
X-Google-Smtp-Source: ABdhPJylv5ol0YPXxGsuvwsNQ/hWyKxwU9w/V0QVnq3DVSknDfDjxiO20mlvQZqALvVS1eh1Jiex8g==
X-Received: by 2002:a17:906:3054:: with SMTP id
 d20mr348668ejd.294.1630695233042; 
 Fri, 03 Sep 2021 11:53:53 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m12sm12730ejd.21.2021.09.03.11.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:53:52 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210902164242.2274095-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <40b64d4f-542d-d003-fa67-637edb4d28b7@mind.be>
Date: Fri, 3 Sep 2021 20:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902164242.2274095-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstreamer1-mm: fix
 build with libglib 2.68
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 18:42, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of libglib2 to version
> 2.68.1 in commit c72524fb1b1c6b7dd1b1f511eea0fdf5a39dd3a0:
> 
> ../gstreamer/gstreamermm/register.h: In function 'GType Gst::register_mm_type(const gchar*)':
> /home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0/glib/gatomic.h:117:19: error: argument 2 of '__atomic_load' must not be a pointer to a 'volatile' type
>   117 |     __atomic_load (gapg_temp_atomic, &gapg_temp_newval, __ATOMIC_SEQ_CST); \
>       |     ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1c75cdcc183642fd4c15d56825848b83f2ad11a5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../0001-Fix-build-against-glib-2-68.patch    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
> 
> diff --git a/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch b/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
> new file mode 100644
> index 0000000000..3ffdbb9cbf
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
> @@ -0,0 +1,44 @@
> +From 0c0b5f8cef3b1f0a06f56c34340e210e0f23d1b0 Mon Sep 17 00:00:00 2001
> +From: Dominique Leuenberger <dimstar@opensuse.org>
> +Date: Tue, 13 Jul 2021 10:32:30 +0000
> +Subject: [PATCH] Fix build against glib 2.68
> +
> +volatile has been misused in the past
> +
> +[Retrieved from:
> +https://gitlab.gnome.org/GNOME/gstreamermm/-/merge_requests/4]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + gstreamer/gstreamermm/register.h                    | 2 +-
> + tests/integration/test-integration-seekonstartup.cc | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gstreamer/gstreamermm/register.h b/gstreamer/gstreamermm/register.h
> +index db66d172..a7ab3a63 100644
> +--- a/gstreamer/gstreamermm/register.h
> ++++ b/gstreamer/gstreamermm/register.h
> +@@ -110,7 +110,7 @@ register_mm_type(const gchar * type_name)
> +     /* The typedef for GType may be gulong or gsize, depending on the
> +      * system and whether the compiler is c++ or not. The g_once_init_*
> +      * functions always take a gsize * though ... */
> +-    static volatile gsize gonce_data = 0;
> ++    static gsize gonce_data = 0;
> +     if (g_once_init_enter (&gonce_data)) {
> +         GTypeInfo info;
> + 
> +diff --git a/tests/integration/test-integration-seekonstartup.cc b/tests/integration/test-integration-seekonstartup.cc
> +index 247ac499..cd43a125 100644
> +--- a/tests/integration/test-integration-seekonstartup.cc
> ++++ b/tests/integration/test-integration-seekonstartup.cc
> +@@ -18,7 +18,7 @@ RefPtr<Glib::MainLoop> mainloop;
> + RefPtr<Bus> bus;
> + RefPtr<Pipeline> pipeline;
> + RefPtr<Pad> sink_pad;
> +-static volatile gint counter;
> ++static gint counter;
> + bool prerolled = false;
> + gboolean was_check = 0;
> + 
> +-- 
> +GitLab
> +
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
