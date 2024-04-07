Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB9CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EB440825;
	Sun,  7 Apr 2024 15:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DZ7dAqPVqDh; Sun,  7 Apr 2024 15:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CCB4083C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CCB4083C;
	Sun,  7 Apr 2024 15:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8519F1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 720EC401AD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgUMUSae5jAg for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31D364018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31D364018F
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31D364018F
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:44:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-345bbd8b10eso37756f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712504685; x=1713109485;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTinp1QZMrm7VTTAKHccwyWXpIrqFHxXspFSL+atRVU=;
 b=uvBlEJWriYgWv5M73reb/7PfI4rvIN+7n8bGBcz8OUg+8gkOuov9+4hMbI0wJV/HUa
 2gvUHWYAA7YnMLj3JtZ7dbRh1WiTFL5rAj28hTgO4mMGBJaHbTshxpCP8t2NlDHSXBlU
 VwEyeYe3k3js8sIenPZtTHpt4Y9RuIjSrE47YQXN79a+OphK6OjRMRHqJ2f32Cwxvh/J
 6dC9A1nTpsgqFFkSqaMFcclDeUaNm+QKpPz2iwaIXH5k1RSAwCPOFG+yfSXXLSfgBgWg
 NOUuwFjrRpXC8a2xZIfwpGqZ3Jmgpd9stUJ2ZF0v4J0SNg7z2NXCa86cTZbgSzWCNhzn
 7ang==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUAHqcbiRl4LqrLj8OMj7Mwg7i/rRZr5nFKkmICL4ZpTFehrLC3HFg+FihPNeJtulM50qy8MzMuEo/EfBC+s76c5zQUgSGjw==
X-Gm-Message-State: AOJu0Yz4iUlVf9jarCqCHOApwq27k8HK926BVd87SUmb2I+KVdU8W1bt
 y1RYBk7XiUXH+lVXxeRBR60jCvPfV4sHUtFSX1dhtK1VpP0co8sA7yHAFkNgLc0=
X-Google-Smtp-Source: AGHT+IEUU+j+3vqMzDaWk7rDAZ6WJDFbpiFzQWhgUQoQswo98zdZ72I94mJWu302kGRnz0CChdMJDA==
X-Received: by 2002:adf:f202:0:b0:343:b686:89a0 with SMTP id
 p2-20020adff202000000b00343b68689a0mr4714913wro.13.1712504684862; 
 Sun, 07 Apr 2024 08:44:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b003455e5d2569sm3223635wrr.0.2024.04.07.08.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 08:44:44 -0700 (PDT)
Message-ID: <3b2522a2-a2ea-42c0-b7ab-f8e33eca5b6d@mind.be>
Date: Sun, 7 Apr 2024 17:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240303173851.788985-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240303173851.788985-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712504685; x=1713109485; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WTinp1QZMrm7VTTAKHccwyWXpIrqFHxXspFSL+atRVU=;
 b=LK1xAYc5NwqE/VcRPziuZzfoKD/vcoNcuioAW1zRxwxEQMQWtAU6wKta0xjc4vFH7p
 ZooHtfCaKmlG4hMRX0wbNAAURqrRKqGAqxjPwZ9DBL7YlIA1vTW1A6SFWOUEflpzZity
 WaCb2dFU5PvRC+Qq4uZHy8bPkl+jP6Bzlx68ySTBiEdqID53j2FkWrqI6SzPRqg4/pmf
 22dmy6NAEEuSzjhU6rjYaPvEN6kNs7hrTRx0MNYEWzZW5JyqD2hMyWmfP70OOytyuqV9
 DuPm5WpBYgpnld+DlVT0+bRfiZqnREhORuqVaFA7lGA4oHPl06Z92XU2TSDBBGdjIApQ
 v79w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LK1xAYc5
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libtracefs: fix musl build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/03/2024 18:38, Fabrice Fontaine wrote:
> Fix the following musl build failure raised since the addition of the
> package in commit b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is
> found:
> 
> ../utest/tracefs-utest.c: In function 'test_uprobes_instance':
> ../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
>   2492 |         char self[PATH_MAX] = { 0 };
>        |                   ^~~~~~~~
> 
> Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
>   - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Fix build instead of disabling utest
> 
>   ...ATH_MAX-if-it-is-not-already-defined.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
> 
> diff --git a/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
> new file mode 100644
> index 0000000000..121fee5adf
> --- /dev/null
> +++ b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
> @@ -0,0 +1,40 @@
> +From ba750812f68f0f3314494558496c23f934f8faff Mon Sep 17 00:00:00 2001
> +From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> +Date: Thu, 22 Feb 2024 11:02:46 -0500
> +Subject: libtracefs utest: Add PATH_MAX if it is not already defined
> +
> +In some setups PATH_MAX may not be defined (it is usually defined in
> +linux/limits.h), but we just use PATH_MAX as something to hold the paths
> +to the tracing files. In that case, just define it to 1024 if it's not
> +already defined.
> +
> +Link: https://lore.kernel.org/linux-trace-devel/20240222-utest-fixes-v2-1-7b8ee8dca0b7@gmail.com/
> +
> +Fixes: 845f16976929 ("libtracefs: Add unit tests")
> +Reported-by: Miko Larsson <mikoxyzzz@gmail.com>
> +Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> +
> +Upstream: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=ba750812f68f0f3314494558496c23f934f8faff
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + utest/tracefs-utest.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/utest/tracefs-utest.c b/utest/tracefs-utest.c
> +index 963fac7..07ecd32 100644
> +--- a/utest/tracefs-utest.c
> ++++ b/utest/tracefs-utest.c
> +@@ -26,6 +26,10 @@
> +
> + #define gettid() syscall(__NR_gettid)
> +
> ++#ifndef PATH_MAX
> ++#define PATH_MAX 1024
> ++#endif
> ++
> + #define TRACEFS_SUITE		"tracefs library"
> + #define TEST_INSTANCE_NAME	"cunit_test_iter"
> + #define TEST_TRACE_DIR		"/tmp/trace_utest.XXXXXX"
> +--
> +cgit 1.2.3-korg
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
