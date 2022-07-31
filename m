Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A3DC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 14:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21D061054;
	Sun, 31 Jul 2022 14:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E21D061054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYqu5G0IlaAT; Sun, 31 Jul 2022 14:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0AF60F3F;
	Sun, 31 Jul 2022 14:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF0AF60F3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C88111BF2CB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3B6B40275
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 14:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3B6B40275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkQGNHs9LqAY for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 14:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC97740194
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC97740194
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 14:34:27 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id q46so3622432uaq.0
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=K59c9b39E1YjTehraWn8D/X5F9EvVY2EqDr8cLLFfzo=;
 b=B/xPzH55zNJ4gqfsxllGF+/mgRGdMSUxsyGWranK2U5dxBgKJ2LrnjvfYboYUrotAU
 mnxY1MO5Sie5TjNF6Zki5tWfwLZRSZ54GsPBuMwyi3zs3sWSE4vmLxevpfM8nQQGeQAb
 D31IyDB3PqErsAdQDU7kRui3vN6cOzmfsTEcdw/nJNDNIOYWA+YYapIoXkgGI1ak3k5n
 88WCX6QCfJkhr/DHEuOHAcnHld6CYKLghzsUcwSTuLdt/Wr0/XdAPwMchD0OwzUbHfAG
 2Ci1IiYCjN29qd0yrd0oH1RzUKIyNH7WeKs01veSIgJR679d2nwonYm7NMpLPr6HHtFA
 IQIw==
X-Gm-Message-State: ACgBeo1lfnHpyQk8rrwdlLIwl5bkja2gTFj6EMBihhrZH19c4keB3m0W
 UHFkGq1+7jHAWzkq/gPqYFdCibl1jzk=
X-Google-Smtp-Source: AA6agR6a8VtxId2EyPVcLT8EhLCia0v2hRYXeOtnp2gN+Po74z8EsxP7xxd1vUTnkk+ibDZSw9kQUg==
X-Received: by 2002:a05:6130:1097:b0:383:770c:d494 with SMTP id
 cd23-20020a056130109700b00383770cd494mr4739099uab.101.1659278066636; 
 Sun, 31 Jul 2022 07:34:26 -0700 (PDT)
Received: from gmail.com ([191.187.223.18]) by smtp.gmail.com with ESMTPSA id
 m37-20020ab013a8000000b0038342b58f6csm4418052uae.17.2022.07.31.07.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 07:34:25 -0700 (PDT)
Date: Sun, 31 Jul 2022 11:34:24 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: romain.naour@smile.fr
Message-ID: <62e692f0d91cc_bff73a78-1a3@xultri.mail>
References: <9abfda1c-d67b-7102-a78e-e17a06da90d5@smile.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_62e692ef4048e_bff73a78-251";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc;
 bh=K59c9b39E1YjTehraWn8D/X5F9EvVY2EqDr8cLLFfzo=;
 b=ObVGKZ2egiJ3LWgpAHjWz1VCy4j96SkndPnuTOePPp+v1V51oj38QPCEsJRLo9Q2lu
 hTIcYbYvMAax+A9bNQCaB7rZB7WSbRrwsmROSwoyMtCjqNu5QOc6bo6ds47VfuY+3/Fr
 lPCkl1wLz/hO4pSvfGs1lQm/h8b/gG1VTvNfF3Gwc7ro0vhqddELOx6yjQaX1edYszV3
 MRsduISZh44/umAxCRA3GkdFJKRh0mRhCujL0Em9nnmYS5pS9BEcQrYMHJsmeJLO+uZY
 x6MAdYM24o/O5fUKTuRxhtTCyf/Ind8uiZmyZmMMAptfC80hzkKWLvDqy33NnyHO9Q5t
 S2EA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ObVGKZ2e
Subject: Re: [Buildroot] [PATCH 07/16] Makefile: run check-* inside docker
 image
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_62e692ef4048e_bff73a78-251
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Wed, Jul 27, 2022 at 10:16 AM, Romain Naour wrote:

[snip]
>> +check_inside_docker := $(shell if [ "`groups`" = 'br-user' ]; then echo y; else echo n; fi)
>> +
>> +# List of target that need to run inside docker image to ensure reproducible results
>> +inside_docker_targets := check-package check-flake8
>> +
>> +ifeq ($(check_inside_docker),n)
>> +$(inside_docker_targets):
>> +	$(Q)utils/docker-run $(MAKE) V=$(V) $@
> 
> While I understand the reproducibility issue, I'm not sure I really wand my make
> check-package command starting starting a docker container.

I really prefer a 'good default' with reproducible results.
Advanced users can always call check-package directly.

But perhaps some developer can hit some corporate policies when developing
patches inside the company:
- can't run docker at all
- can't download docker images from the internet
For that poor souls, I will withdraw this patch and resend. :)

Well... we could instead change de manual to say:

299 ---------------------
300 $ utils/docker-run make check-package
301 ---------------------

> 
> I guess Buildroot user (or CI build machine) can do the same if they want.

CI builds already run inside the same docker image, so no change there.

I was trying to accomplish with this series, among other things, a way to
ensure the same results locally when compared to CI builds.

One interesting reproducibility issue that is already taken into account by this
series, even outside the docker image:
patch 14
file utils/check-package
line 98

I developed outside the docker image and when I run on CI build the python files
were being not tested and ignored by check-package.
See the reason:

$ utils/docker-run python3 -c \
  "import magic;" \
  "print(magic.from_file('utils/brmake', mime=True));" \
  "print(magic.from_file('utils/check-package', mime=True))"; 
text/x-shellscript
text/x-script.python

$ python3 -c \
  "import magic;" \
  "print(magic.from_file('utils/brmake', mime=True));" \
  "print(magic.from_file('utils/check-package', mime=True))"; 
text/x-shellscript
text/x-python

But as I say above, I will withdraw this patch and resend the series.


Regards,
Ricardo
----==_mimepart_62e692ef4048e_bff73a78-251
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_62e692ef4048e_bff73a78-251--
