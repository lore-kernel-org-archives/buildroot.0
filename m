Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFAAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:27:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2174160EE9
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2174160EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E199D40482;
	Wed, 13 Oct 2021 18:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRlwftZu61QK; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE0004052A;
	Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1485A1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03AC160C2F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQcBxgU_A4Hn for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C730860BA7
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:31 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r18so13780290edv.12
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yIe8W7oPwMh/u4Y7XCkQHmdyTJyUBENBuvVwnOJnZCE=;
 b=FnaBRONIhGmK9jYOoDqXr1EtQUWAP2vlrFEPnXTr1E0kfb5o4xrqDkIFLVSELABmvR
 r28mB5XyksFmiHu95qmSWOcbaXOawL0C7CoIIeSuvXyYRDpYaUVmAXqXisjs0wByJiMT
 aBiTvUWg12ATEu3rVrhgKKKKBS/xClNQdEsI4KNOdOS/2aiYfTL5gEAzCwnYGCBK8bkC
 MYfdyq8dthGTpKwu1FFMCD8COfecJKSW6GE5WeI+vPsNrNEvlJdaMS6zBV0GR5GUAZ03
 i4qZZavIy0IDuXMupSkKZU+weHmp2ATXp/1FEuWazrd0A9kqnrAwEFamzNTJkG31kaSV
 cmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yIe8W7oPwMh/u4Y7XCkQHmdyTJyUBENBuvVwnOJnZCE=;
 b=n7M3pY8xcupwNe6IAtIXrkTEbAUTx6tTO4Qcb5/JCxchcz94YZGCV9ri9lu26OnmJt
 ZLlg25tYlNv0JBoJ8ntLpH6/XL7G9BwoOg0w75wI/XQUWqa4AIGbFlarMnJC1afk23XF
 IFtha4ef1M/A84YTRkLyP6Q2M4nuX/0slKwaLd3d6klZp5W0K9e6t4zfqx7rJW7B9Jt+
 bKZ4RHGtIaAYfxG8lBwQr2V4OjgynTh7LctQGiVLZNrbxd3MPFkRn9JCuXVEVblVlbkD
 UH9kS5fNtcwJdHVijJKGRUvv2pa0MwLzajisgNVaLGAbhFDWdCpyKKGlItFcytXVNkbO
 9rNw==
X-Gm-Message-State: AOAM532HjNe+6qrgbjfn5LsMNYnckDkxbOhODL3/xsioCtsIpMn3tT3O
 POXwBY3QHDzGd9mFbz/lk3LFHw4eIxwC6Ocp
X-Google-Smtp-Source: ABdhPJwk6XjX6k5pNDE7qpkosojA8ZqblkVz7SlNAirT7n1aQEmxKBV3rIrNuYyIj5DcqmYq6ZgJhA==
X-Received: by 2002:a17:906:d8d5:: with SMTP id
 re21mr1050220ejb.110.1634149650111; 
 Wed, 13 Oct 2021 11:27:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p25sm282826edt.23.2021.10.13.11.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:27:29 -0700 (PDT)
Message-ID: <23fa74bd-db5e-9617-e9b3-64a930b6ab85@mind.be>
Date: Wed, 13 Oct 2021 20:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006155950.2318134-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006155950.2318134-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: fix build with
 autoconf >= 2.70
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 17:59, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
> http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:
> 
>>>> openocd 0.11.0 Autoreconfiguring
> autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ac-fix-autoreconf-with-autoconf-2.70.patch | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
> 
> diff --git a/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
> new file mode 100644
> index 0000000000..ecb716b6fa
> --- /dev/null
> +++ b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
> @@ -0,0 +1,32 @@
> +From 3106d16bbc45de52bc0a8b638a84aa9d7c9abc46 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 6 Oct 2021 17:43:16 +0200
> +Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
> +
> +Fix the following build failure raised with openocd and autoconf >= 2.70
> +due to
> +http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:
> +
> +>>> openocd 0.11.0 Autoreconfiguring
> +autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/msteveb/jimtcl/pull/209]
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/jimtcl/configure.ac b/jimtcl/configure.ac
> +index b70b5d8..8c45114 100644
> +--- a/jimtcl/configure.ac
> ++++ b/jimtcl/configure.ac
> +@@ -1 +1,3 @@
> + # Dummy configure.ac to make automake happy
> ++AC_INIT([jimtcl], [0.80])
> ++AC_OUTPUT
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
