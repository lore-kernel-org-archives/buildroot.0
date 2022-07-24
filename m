Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA271C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 04:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44082405AB;
	Sun, 24 Jul 2022 04:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44082405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okPm7zVsEqsq; Sun, 24 Jul 2022 04:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3112F4033F;
	Sun, 24 Jul 2022 04:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3112F4033F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490DE1BF44A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 04:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B0B34242C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 04:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0B34242C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpGZNpVO1ayf for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 04:31:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FDA41887
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4FDA41887
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 04:31:13 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 g20-20020a9d6a14000000b0061c84e679f5so6296750otn.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2bTR9G/GJBehQAFc7xzUHz60raWLELkM7byRdWcfDYg=;
 b=Wo7lw+JtPrUi5f70zcYzCZzQLqQGyQ2okxJDhmrPhiRsE2l84+uqLopvz/bJB51GAI
 uIYLYQt8rzRe9q6dxrvlGGPV35DAld2mZFyBM1jyoIO066cLngI2zw+OuJ4tXMwf8NbY
 J8LTtsYGgSHmwLuDQ63rTI4azJbGPMpvzukaSM726UjXIxIiA0IOUUwZ7u1Yzf9+mnwJ
 Wv5yMmON9MwHnaP44KBGgc2CKjokgjkJjCAp2eogKAwZ/A0I3KLTHlYWjU7a8UySckzC
 oQWpcy4lQYKqVGvKutVnYlj/0zrUus1QFZddw3q5EqUe9aaAJKkNAWCZFrxrGvNQ7jld
 4ncg==
X-Gm-Message-State: AJIora/vzu6XXvFU1N7ljV95IJjE21EC5tzWYSo+4yCb4eFoapLPqOtQ
 0wISSpPHbCRIqRBYc60R+z0=
X-Google-Smtp-Source: AGRyM1u24rjuhMc6hcdgk9zyHgks0YsN59UlymnlDklE98npLIlMv61O6Mu+xEbZjAPg7FYdIanDNQ==
X-Received: by 2002:a05:6830:3499:b0:61c:b102:c615 with SMTP id
 c25-20020a056830349900b0061cb102c615mr2742518otu.223.1658637072794; 
 Sat, 23 Jul 2022 21:31:12 -0700 (PDT)
Received: from gmail.com ([191.187.223.18]) by smtp.gmail.com with ESMTPSA id
 s30-20020a056870611e00b0010d04a20030sm4147423oae.36.2022.07.23.21.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 21:31:11 -0700 (PDT)
Date: Sun, 24 Jul 2022 01:31:10 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: thomas.petazzoni@bootlin.com
Message-ID: <62dccb0e9f68e_2245ea9d8-3e4@xultri.mail>
References: <20220723165800.54811fe3@windsurf>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_62dccb0c5175b_2245ea9d8-43";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc;
 bh=2bTR9G/GJBehQAFc7xzUHz60raWLELkM7byRdWcfDYg=;
 b=B3Gsytsjuw3ILJHUBu52i2QZEpHJWW3W/hP5tRqhUDLzPEUaxTcJyN7A8fxLALXZAc
 WRNYsp+1IpA2LQ5ez4qXtknh+Im9wfV07gp2+UUuRhfAdnpXyjROLH1TAHfhfmVMpCTo
 onbfs8S0pi5yVlb3vEnj3Z6orW9IngO8HkYEeUqqEUps4zcyFpC6RjsLlSrUV+u50Zou
 iXp+jqa94ffdg6JcbLi/5KusEhjReDnJAIuPZ3eTvgJzS1iOKyjS34FQhwGjJhoXRbVI
 BlA8xU12ItAfgkSbH28lzADdfYV/1zF581qN3V31iurJ3Wmek24zxbvEAnpfDy97pebY
 eb7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B3Gsytsj
Subject: Re: [Buildroot] [master, next,
 lts] utils/get-developer: fix DEVELOPERS syntax check on GitLab CI
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


----==_mimepart_62dccb0c5175b_2245ea9d8-43
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Thomas,

On Sat, Jul 23, 2022 at 11:58 AM, Thomas Petazzoni wrote:

[snip]

> So instead, I've added a -v (v for validate) option in get-developers
> that simply does the validation step. I didn't introduce the extra
> complexity of making parse_developers() return the number of errors and
> warnings, since this was anyway not used anywhere. So I simply rely on

They were being used to bail out on errors and warnings.
+        if nerrors > 0:
+            sys.exit(2)
+        if nwarnings > 0:
+            sys.exit(3)

> parse_developers() returning None when there is a validation failure.

The minor issue I see on trusting only on current parse_developers() return is
that some cases do generate warnings but don't fall into this condition.

In the current master (95ea6664) we have:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2761693090
31 $ utils/get-developers -v
32 WARNING: 'configs/minnowboard_max-graphical_defconfig' doesn't match any file
34 Running after_script 00:03
36 Saving cache 00:03
38 Uploading artifacts for successful job 00:04
40 Job succeeded

We could catch that in at least two ways:
- adding the number of errors and warnings to parse_developers
- in the GitLab CI using grep in the stderr from get-developers

Regards,
Ricardo
----==_mimepart_62dccb0c5175b_2245ea9d8-43
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_62dccb0c5175b_2245ea9d8-43--
