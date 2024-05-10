Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5DBC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46BA94040A;
	Fri, 10 May 2024 20:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfeKAi5eHsIz; Fri, 10 May 2024 20:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520BE40529
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520BE40529;
	Fri, 10 May 2024 20:52:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E50231BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC52384666
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjC5-fWofL4G for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:52:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A96E684660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A96E684660
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A96E684660
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:52:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D396F1C0003;
 Fri, 10 May 2024 20:52:13 +0000 (UTC)
Date: Fri, 10 May 2024 22:52:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240510225213.3eded763@windsurf>
In-Reply-To: <20240310163150.4373-1-fontaine.fabrice@gmail.com>
References: <20240310163150.4373-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEI2B4AwTYKpN5jgwi73Ehh4BE5GjoSypnCMTjcFvMQ=;
 b=p58icsmSgqZ1wS37SDaSj1q42DMyxWrwngE9DAxR+1DIGX2s28OF/J7zcnn/q+SKe9Glw4
 8qjqpXtzrH6TfWoUQQt9zrcIChqddySQIC5BLnAqWqPM0UfrUo9l7NTDhO7I80QptX1nBu
 jERw/Xnc9ux65qB/Q0WEbLeK88mvDcgpXg0y/DJWU2mu+DrirM+p0v9c96aKSScc+RE8TF
 XN95KwxqgVC4e0Y5rBh7pP902BCz3fOmpBJy0QS7yHYHQ2xEeUfiPK2NLGlH0c5O0CiQQS
 K/vBWGGp7ccjwx9iOpT3XNlBuRJBxy2HjXsVSNueDXZZhEYyY9XiqE3Be18Log==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p58icsmS
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: disable -Werror
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Mar 2024 17:31:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable -Werror to fix the following build failure raised at least since
> bump to version 3.9.0 in commit e76d9868c940f2d19968077b97e79c49376aa464
> and
> https://github.com/zhaojh329/libuhttpd/commit/81db1fa371bc80f40c1bfe60010e7d64bdf30b46:
> 
> /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c: In function '__serve_file':
> /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:322:50: error: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type '__off_t' {aka 'long int'} [-Werror=format=]
>   322 |         conn->send_header(conn, "Content-Range", "bytes */%" PRIu64, st->st_size);
>       |                                                  ^~~~~~~~~~~         ~~~~~~~~~~~
>       |                                                                        |
>       |                                                                        __off_t {aka long int}
> In file included from /home/autobuild/autobuild/instance-8/output-1/build/libuhttpd-3.14.1/src/file.c:36:
> /home/autobuild/autobuild/instance-8/output-1/per-package/libuhttpd/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/inttypes.h:91:41: note: format string is defined here
>    91 | # define PRIu64         __PRI64_PREFIX "u"
> cc1: all warnings being treated as errors
> 
> Fixes: e76d9868c940f2d19968077b97e79c49376aa464
>  - http://autobuild.buildroot.org/results/46349a1409f9cff027b462456078284459e75511
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...akeLists.txt-add-BUILD_WERROR-option.patch | 30 +++++++++++++++++++
>  package/libuhttpd/libuhttpd.mk                |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 package/libuhttpd/0003-CMakeLists.txt-add-BUILD_WERROR-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
