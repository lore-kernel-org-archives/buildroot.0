Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD1CAC5B0
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 06:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C9083716;
	Tue,  7 Oct 2025 06:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NnAND6j_dRy; Tue,  7 Oct 2025 06:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADEB78382D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADEB78382D;
	Tue,  7 Oct 2025 06:35:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B67226
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 06:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E32B841913
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 06:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wStiPWJNxxoi for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 06:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6228A41784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6228A41784
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6228A41784
 for <buildroot@uclibc.org>; Tue,  7 Oct 2025 06:35:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1v61Hx-0008x0-0S
 for buildroot@uclibc.org; Tue, 07 Oct 2025 08:35:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 07 Oct 2025 08:34:03 +0200
Message-ID: <pan$d032e$b4c1c5e8$51757159$7a37b176@ID-313208.user.individual.net>
References: <20251005180108.607235-1-bernd@kuhls.net>
 <123144d001a2c85418ec7f0c25ac45ea__32414.81567254$1759788128$gmane$org@free.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Tue, 07 Oct 2025 00:01:41 +0200 schrieb Julien Olivain via buildroot:

> This new version introduces build failures in test-pkg. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2084355487

Hi Julien,

the build error is caused by this upstream commit
https://github.com/php/php-src/commit/
ea4e8d513cdd87c8ac28cd1ae06f7e814c83ae28

which changes the detection of copy_file_range.

Both failing toolchains are uclibc-based but other uclibc defconfigs work 
so I am unsure how to fix the problem.

The php configure check for copy_file_range with the bootlin-x86-64-uclibc 
defconfig fails with

conftest.c:201:9: error: implicit declaration of function 
'copy_file_range' [-Wimplicit-function-declaration]
  201 |   (void)copy_file_range(-1, 0, -1, 0, 0, 0);

and produces a successful build while br-arm-full-nothread has only a 
warning, and assumes that copy_file_range is present, most likely due to 
older gcc being used:

conftest.c:191:9: warning: implicit declaration of function 
'copy_file_range' [-Wimplicit-function-declaration]
  191 |   (void)copy_file_range(-1, 0, -1, 0, 0, 0);

Is it save to assume that I can add php_cv_func_copy_file_range=no to 
_CONF_ENV whenever uclibc is used?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
