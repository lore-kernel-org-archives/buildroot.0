Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16625C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6255061244
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6255061244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6FA82796;
	Sun, 19 Sep 2021 12:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWQ7Z4Shutg7; Sun, 19 Sep 2021 12:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60493827A1;
	Sun, 19 Sep 2021 12:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17DA81BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06528827A1
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTvDo793x-BC for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C157A82796
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:05:03 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h17so49333506edj.6
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1hOR9l6uwzMORa6OGcENQeGg2aPGfc/ULXrjEwlYKiY=;
 b=e2LVaAvkPa0ej6ufj4DoaZIbIkt15HT46mKTIx2nG8ukaBWWxOpTSSdxugcXZxvWIH
 uvUyKY4bJIEknVMAErpQKmUO5mnq1TKSgl5NUe7tbQEs/kEN8O3fq16zgrIMowIJU9RB
 nPgv9pmW4DthrwP7LnMGAQKZFMawOr0eWL7r1mF5B98Vh+2ACxqU6la/qwuQQlnopgJH
 MAFepUGamp2NHdNMM+ZQZ/zjeGSI78LFQ+ojgR9HTaNMex5piAwErXxeLdVOZYNv84Dk
 87/7euNygBP2qN5N13LqgowUV/RMBEtzkeEdxAt+aJe+avvQMeHsXdPFy8Rr8JBd6822
 5tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1hOR9l6uwzMORa6OGcENQeGg2aPGfc/ULXrjEwlYKiY=;
 b=DDMT8W/gmeUe7EBy/NH4kLn9SptmUR5pB/NwX25f3kYNQd/1eQYgu3b5WN6DoPMllC
 fpvA7WgZU6KSjA4ZJ0bePDzfxH1ARaEYzwEwqaP6qoLZap+p/JVxUq+YjVfvB62bqo3Z
 whLHjc6k11erdbkp81VsJriecIN6MwpIqPifSVyBQBU3HTTIEiVdKenWP2LjxfJ1ZsoQ
 U14cRDtc3A7kw8MhH8LwPtjDu1qqe23gXgMIkk8po3VHb9JQMe1xTX5bvhMZxVlRwH3B
 p7I/2F0GdnFLZ6lF7LL2FY0MP5Pf7P1jsYsI6njN98T2M2RIwNsMEKxI7PpTuam+sLBC
 TjGQ==
X-Gm-Message-State: AOAM5301R2yOw9FYVTp0a9m06blyTgzhNGTaB/xzDVxgtUnx4xwAmVXI
 8n2I7nLzD3liq9m1VLS9+UKLWQ==
X-Google-Smtp-Source: ABdhPJwGRcSNnXLxy3UG9thCyeXCQE980nZ+OwINOiV0JVBZ5yho4Ba0jiATCxBKsSqk9lTZUVBOuw==
X-Received: by 2002:a17:906:3fc8:: with SMTP id
 k8mr21849619ejj.217.1632053101947; 
 Sun, 19 Sep 2021 05:05:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e22sm5793555edu.35.2021.09.19.05.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:05:01 -0700 (PDT)
Message-ID: <c509e9f4-d4f9-652b-a5b8-9eff722569d3@mind.be>
Date: Sun, 19 Sep 2021 14:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210906163937.2521-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210906163937.2521-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libgpgme: fix build with glibc >= 2.34
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 06/09/2021 18:39, Fabrice Fontaine wrote:
> Fix the following build failure with glibc >= 2.34:
> 
> posix-io.c: In function '_gpgme_io_spawn':
> posix-io.c:577:23: error: void value not ignored as it ought to be
>    577 |             while ((i = closefrom (fd)) && errno == EINTR)
>        |                       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b11094ddd35263071b7dd453a6590c5b684026ff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Use upstream commit
> 
>   ...ore-Support-closefrom-also-for-glibc.patch | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
> 
> diff --git a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
> new file mode 100644
> index 0000000000..b8db949cef
> --- /dev/null
> +++ b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
> @@ -0,0 +1,36 @@
> +From 4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e Mon Sep 17 00:00:00 2001
> +From: Jiri Kucera <sanczes@gmail.com>
> +Date: Sun, 25 Jul 2021 11:35:54 +0200
> +Subject: [PATCH] core: Support closefrom also for glibc.
> +
> +* src/posix-io.c (_gpgme_io_spawn): Use glibc's closefrom.
> +--
> +
> +Since 2.34, glibc introduces closefrom (the implementation
> +follows *BSD standard).
> +
> +Signed-off-by: Werner Koch <wk@gnupg.org>
> +
> +[Retrieved from:
> +https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/posix-io.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/posix-io.c b/src/posix-io.c
> +index e712ef28..2a3a81fc 100644
> +--- a/src/posix-io.c
> ++++ b/src/posix-io.c
> +@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
> +               if (fd_list[i].fd > fd)
> +                 fd = fd_list[i].fd;
> +             fd++;
> +-#if defined(__sun) || defined(__FreeBSD__)
> ++#if defined(__sun) || defined(__FreeBSD__) || defined(__GLIBC__)
> +             closefrom (fd);
> +             max_fds = fd;
> + #else /*!__sun */
> +--
> +2.11.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
