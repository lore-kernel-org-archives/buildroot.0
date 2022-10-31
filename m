Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EB0FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D07A4045C;
	Mon, 31 Oct 2022 22:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D07A4045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCm5KIGwx9jE; Mon, 31 Oct 2022 22:08:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74821402FE;
	Mon, 31 Oct 2022 22:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74821402FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56B411BF2B6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3766A40129
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3766A40129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Pg1dDkOQPbh for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D5840027
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4D5840027
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:08:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id a13so19454838edj.0
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HysmsvCnWaLUlKoQHhhgX9bZXJT9Ojoxzr9Gd0icwdk=;
 b=jHhY0UDKxdstPpngvVDDGhaZnpd5bbE3MwdptTlgVNi0m8VzkQhBKmfe1XMFPBKp+s
 cMJK9ZlCke8YjRF4f68r/K0x0yEb8VyjUU+JO/8TycBFOJMmzRlQNeWYVSRsKiO3H9IA
 ZuBM9qKmpLzSYYGvVpKZG83V6Is4s+ktM+4g58lscRkvZ5eJc153/Z5M+ysU8O5wssaM
 LP84hEB8W1dun1znUyTdY3WTzdAZBpEakBheE+yrMw4VTLC9gymmiL0PXLKTx+clTvwX
 mKIc9dzfYc3JvGXZhfUNkp5Wg8QjncSORJJ70lFLQkFEcGyxYZ//z5tQ2tn60AB5QQj7
 WrLA==
X-Gm-Message-State: ACrzQf3zvf5Io35C9plNVw6pKtRX6B835bItIw2hGUV8xqwhtgLxTcEk
 zQvo4ZxVVrUTnI/LGLavz8QD7Bcd3Q1yybYi
X-Google-Smtp-Source: AMsMyM7iCgM8a4iQsiARuooiHAcW9EeGUmHfbi7fR+vQpl1/V8hRaeTcn5d8619zYzDFJKPjSXCgaw==
X-Received: by 2002:a05:6402:2793:b0:462:39d7:3bbc with SMTP id
 b19-20020a056402279300b0046239d73bbcmr15847228ede.47.1667254096834; 
 Mon, 31 Oct 2022 15:08:16 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 kw13-20020a170907770d00b00734bfab4d59sm3481229ejc.170.2022.10.31.15.08.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 15:08:16 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 21so19426494edv.3
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:08:16 -0700 (PDT)
X-Received: by 2002:aa7:dc10:0:b0:440:b446:c0cc with SMTP id
 b16-20020aa7dc10000000b00440b446c0ccmr15667656edu.34.1667254095942; Mon, 31
 Oct 2022 15:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220904191010.200822-1-christian@paral.in>
 <20221031230227.222d7ad1@windsurf>
In-Reply-To: <20221031230227.222d7ad1@windsurf>
Date: Mon, 31 Oct 2022 15:08:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2obmhk2WH2O5oxELnYX3k+ab1pP-zS-AJfpRmQcx_SxiQ@mail.gmail.com>
Message-ID: <CA+h8R2obmhk2WH2O5oxELnYX3k+ab1pP-zS-AJfpRmQcx_SxiQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HysmsvCnWaLUlKoQHhhgX9bZXJT9Ojoxzr9Gd0icwdk=;
 b=hTeyf8MaNh/MXW2XzhPmMG5JOUqjA04NPdVNSb2NsG3bJjp0Z9bb/wu/6xcQ6ELzKe
 HrkP5xQFueSOHaBX56GjykAh7aLGwm+7rZs0d6r7ii1lNQyPVoubocLF8Rku6hiirxV2
 Gx38zXnJNcME8rvUF8imU7s+oQar2eJXLDoP2o1RLrMcMR8N3Eio1UqWkeFyJBeuqnfv
 40QYvj5ofaBFyiDYvK2pknP46+nxg7I192Ey1+KPhfLo5SaKE5JzO/8+IWCvBhi0lmt6
 l09kDPE0j0juf/LS6fFNfeHK9mR/MUmj0BbRN426EAMWmjHfdnmytl3s5K7Y0/xtQEt+
 g/Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=hTeyf8Ma
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, Oct 31, 2022 at 3:02 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> It looks like this commit has broken our docker compose test case
> (support/testing/tests/package/test_docker_compose.py). Indeed, this
> test expects to be able to run a command called "docker-compose", which
> no longer exists, so the test fails with:
>
> # docker-compose up -d
> -sh: docker-compose: not found
> # echo $?
> 127

The change is to run "docker compose" instead of "docker-compose"

diff --git a/support/testing/tests/package/test_docker_compose.py
b/support/testing/tests/package/test_docker_compose.py
index 1ce132c242..10ceee3167 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -40,7 +40,7 @@ class TestDockerCompose(infra.basetest.BRTest):

     def docker_compose_test(self):
         # will download container if not available, which may take some time
-        self.assertRunOk('docker-compose up -d', 120)
+        self.assertRunOk('docker compose up -d', 120)
         # container may take some time to start
         self.assertRunOk('while ! docker inspect root_busybox_1 2>&1
>/dev/null; do sleep 1; done', 120)
         self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120


> Also, could you send a patch adding yourself in the DEVELOPERS file for
> this test case, since you're often looking after Docker related topics
> in Buildroot?

I can send a patch for that too, are you able to check real quick if
that change above fixes the issue?

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
