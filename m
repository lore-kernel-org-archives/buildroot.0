Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0668C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB206069B;
	Sat,  8 Jun 2024 13:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhTUfdTH0ji3; Sat,  8 Jun 2024 13:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A14606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A14606B1;
	Sat,  8 Jun 2024 13:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81E551BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE2F606B1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8j8LEGAQqf5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C30FC6069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C30FC6069B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C30FC6069B
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:59:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C997FF803;
 Sat,  8 Jun 2024 13:59:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFwb9-001pgM-27;
 Sat, 08 Jun 2024 15:59:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240523155557.1299103-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jun 2024 15:59:11 +0200
In-Reply-To: <20240523155557.1299103-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 May 2024 17:55:57 +0200")
Message-ID: <87zfrv1qog.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-cffi: fix or1k build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following or1k build failure raised since bump to version 0.2.2
 > in commit 079d992b271240fc1776a2855299955043774280:

 > In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
 >                  from ../src/lua.hh:23,
 >                  from ../src/parser.hh:4,
 >                  from ../src/ffilib.cc:7:
 > ../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
 > ../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
 >  1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
 >       |                            ^~~~~~~~~~~~~

 > Fixes: 079d992b271240fc1776a2855299955043774280
 >  - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
