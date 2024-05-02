Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A918C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B16401CD;
	Thu,  2 May 2024 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF9FyFBb6ESS; Thu,  2 May 2024 16:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9308B401E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9308B401E8;
	Thu,  2 May 2024 16:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7F01BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 088AD82F4A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXEHmh2OwmLG for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E18BE82F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18BE82F49
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E18BE82F49
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:33:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C72702000C;
 Thu,  2 May 2024 16:33:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2ZNE-00ArgG-1X;
 Thu, 02 May 2024 18:33:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240306091930.32801-1-fontaine.fabrice@gmail.com>
 <f6066d44-0140-4a38-a2d3-cf09ace197e0@mind.be>
Date: Thu, 02 May 2024 18:33:32 +0200
In-Reply-To: <f6066d44-0140-4a38-a2d3-cf09ace197e0@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 7 Apr 2024 18:08:14
 +0200")
Message-ID: <8734r05g2r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dmraid: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 06/03/2024 10:19, Fabrice Fontaine wrote:
 >> dmraid is a very old package from 2010 with an awkward configure script
 >> which doesn't honor CFLAGS:
 >> ac_cv_env_CFLAGS_set=set
 >> ac_cv_env_CFLAGS_value='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 '
 >> [...]
 >> ## ----------------- ##
 >> ## Output variables. ##
 >> ## ----------------- ##
 >> AWK='gawk'
 >> CC='/home/autobuild/autobuild/instance-3/output-1/host/bin/sh4a-buildroot-linux-musl-gcc'
 >> CFLAGS='-O2'
 >> resulting in the following build failure with musl >= 1.2.4 and
 >> https://github.com/bminor/musl/commit/25e6fee27f4a293728dd15b659170e7b9c7db9bc
 >> because _LARGEFILE64_SOURCE is not set:
 >> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/12.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld:
 >> misc/file.o: in function `rw_file':
 >> file.c:(.text+0x150): undefined reference to `lseek64'
 >> To fix this issue, pass TARGET_CONFIGURE_OPTS through
 >> DMRAID_MAKE_OPTS
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/5c7c82959ce92db908d3ca20e2c1137509c2f981
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
