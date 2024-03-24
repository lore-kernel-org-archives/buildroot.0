Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF6C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B301D404A9;
	Sun, 24 Mar 2024 15:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAZ4Jr-V9T9o; Sun, 24 Mar 2024 15:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5378D405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5378D405F0;
	Sun, 24 Mar 2024 15:09:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49EF51BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3659D606EA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLJMnHbqDxQ5 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:09:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29E0D605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29E0D605BB
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29E0D605BB
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:09:43 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d46c44dcc0so42937081fa.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292981; x=1711897781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5W9MyD7LptD6VcNq3rNsQPam0yEnJjMMoX8XVRTf8s=;
 b=GcjHcgKNXlkuKJ84j9bzAqSWEpMQPJwCh9e4cn3P0Q8ZtMLLyzklfzWNU9xIvE28hQ
 dvWW0DijObkNFb8gp4/pF33J4iL61jw4Fbtz8rChoIPv7dZf1EKShBxny3z71e/4T+T2
 ifUl9OIEFSRToz6ycdkzCorntx6Nafas0iKvFV2DrO3rakoW76RoyPKBla60kjbNByst
 b4YsoAXs54x4diY4fkVHKB1VLT0ER7Vbcx4MUQS8Tty8C59FOoDavfcgUBkXCdMKnR8b
 iGSV+ZZR+sZ2XcpnF6TBQ9omkPvBTwACV1cyXpGfWj5ArBq6p1nzW/+JmGmvFfji3Jku
 FRwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUznaGab0MdWIkwfxCzJxcc3JdPq7OtQknZFxVFrD1xd2goue8hvzTDSkTLcb9h+PzZFnG5/NnvxJlEz6LRLCV6aJzUJ+Np5g==
X-Gm-Message-State: AOJu0YwjsWYCX++iBzDqxWm//K308oZ9qxLxacJqINznu7SdmpuCupcF
 N6lX9ooWb6uGZB2nH1Fo2ikjXg9uYBIlhMpTMYOjGJfiGL8AvALvf1mZlI8m10g=
X-Google-Smtp-Source: AGHT+IEW70AgYkqeRIGvqlyl2hQ41Spp6KfMEHiEyjpe5lW2R7kDEJA4278s7QCNxAb/1Or6sK7d5Q==
X-Received: by 2002:a05:651c:386:b0:2d2:b840:1c78 with SMTP id
 e6-20020a05651c038600b002d2b8401c78mr2814972ljp.48.1711292980967; 
 Sun, 24 Mar 2024 08:09:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:09:40 -0700 (PDT)
Message-ID: <58c40ecb-db45-4bcf-93a8-e40d26314df0@mind.be>
Date: Sun, 24 Mar 2024 16:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20240324040902.1388507-1-nemaakhilesh@gmail.com>
In-Reply-To: <20240324040902.1388507-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292981; x=1711897781; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v5W9MyD7LptD6VcNq3rNsQPam0yEnJjMMoX8XVRTf8s=;
 b=cCgqvNk5+2RgoObzvy+xrWlU3iaJzjC5mF6x3HMbW6A+BtgxucRrNOsl7vtkGeKQZW
 o6ZbqMum+qF8gyoycyvWcyz7n2JHDZbYEwaAERo6s6cL2gcwB7VmxjPnoy9KAQUPieI3
 uf+8qUTFC4f1PbrZYHUGZIP9j741J2VarCbYbzEm/Hil57BZ2odTiLd+xPA5s30xqMDB
 I9daI3VjJBD8qSlsw+eByjmZpvPHIehOq5m4YX9qNzSl7cVpsI+z5+9O4SKGfIGabbm+
 CYo1eq/LsPp3boB3ON8yyi49w5vlNWQTsKPIu96GO/T8qvXohJ/wIqZckwTFq8UONxw8
 Pejg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cCgqvNk5
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.8.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 05:09, Akhilesh Nema wrote:
> Changelog - https://github.com/iproute2/iproute2/compare/v6.7.0...v6.8.0
> 
> Drop 0001-Revert-ss-prevent-Process-column-from-being-printed-.patch. See the upstream fix https://github.com/iproute2/iproute2/commit/87d804ca0854b09c07872e9fd6036bf5d3e0cc85.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> 
> $ cat iproute2.config
> BR2_PACKAGE_IPROUTE2=y
> 
> $ ./utils/test-pkg -k -c iproute2.config  -p iproute2
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: OK
>                               arm-aarch64 [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> $ utils/docker-run make check-package
> 398423 lines processed
> 0 warnings generated
> 
> $ ip -V
> ip utility, iproute2-6.8.0
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>   ...t-Process-column-from-being-printed-.patch | 45 -------------------
>   package/iproute2/iproute2.hash                |  2 +-
>   package/iproute2/iproute2.mk                  |  2 +-
>   3 files changed, 2 insertions(+), 47 deletions(-)
>   delete mode 100644 package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
> 
> diff --git a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
> deleted file mode 100644
> index 10fa472d64..0000000000
> --- a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From f22c49730c3691c25a1147081363eb35aa9d1048 Mon Sep 17 00:00:00 2001
> -From: Stephen Hemminger <stephen@networkplumber.org>
> -Date: Sat, 13 Jan 2024 08:51:55 -0800
> -Subject: [PATCH] Revert "ss: prevent "Process" column from being printed
> - unless requested"
> -
> -This reverts commit 1607bf531fd2f984438d227ea97312df80e7cf56.
> -
> -This commit is being reverted because it breaks output of tcp info.
> -The order of the columns enum is order sensistive.
> -
> -Bug: https://bugzilla.kernel.org/show_bug.cgi?id=218372
> -Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> -Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f22c49730c3691c25a1147081363eb35aa9d1048
> ----
> - misc/ss.c | 5 +----
> - 1 file changed, 1 insertion(+), 4 deletions(-)
> -
> -diff --git a/misc/ss.c b/misc/ss.c
> -index 09dc1f37..9438382b 100644
> ---- a/misc/ss.c
> -+++ b/misc/ss.c
> -@@ -100,8 +100,8 @@ enum col_id {
> - 	COL_SERV,
> - 	COL_RADDR,
> - 	COL_RSERV,
> --	COL_PROC,
> - 	COL_EXT,
> -+	COL_PROC,
> - 	COL_MAX
> - };
> -
> -@@ -5795,9 +5795,6 @@ int main(int argc, char *argv[])
> - 	if (ssfilter_parse(&current_filter.f, argc, argv, filter_fp))
> - 		usage();
> -
> --	if (!show_processes)
> --		columns[COL_PROC].disabled = 1;
> --
> - 	if (!(current_filter.dbs & (current_filter.dbs - 1)))
> - 		columns[COL_NETID].disabled = 1;
> -
> ---
> -2.43.0
> -
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index 0be058e64b..d57a93de7d 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>   # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d  iproute2-6.7.0.tar.xz
> +sha256  03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce  iproute2-6.8.0.tar.xz
>   sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 4adb4e3356..3db2ab925d 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPROUTE2_VERSION = 6.7.0
> +IPROUTE2_VERSION = 6.8.0
>   IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>   IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>   IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
