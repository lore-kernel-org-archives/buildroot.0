Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D09C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA9B6062E;
	Mon,  4 Mar 2024 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aA53Fv8pvH36; Mon,  4 Mar 2024 21:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C641B608C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C641B608C4;
	Mon,  4 Mar 2024 21:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 500511BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDBD81D3A
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKxVFABtdDL0 for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 207C781C11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 207C781C11
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 207C781C11
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:51:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0297840003;
 Mon,  4 Mar 2024 21:51:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhGDs-00GzT0-1N;
 Mon, 04 Mar 2024 22:51:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240304170723.3908730-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Mar 2024 22:51:48 +0100
In-Reply-To: <20240304170723.3908730-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2024 18:07:23 +0100")
Message-ID: <875xy11x8r.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: fix
 BR2_SHARED_STATIC_LIBS build
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

 > poco can't be built statically since commit
 > 073a89196a22f995c142cd11640d3cfb7cef691d. However, commit
 > add7c433d250e153d9e58fe7da3bd52171ba2652 enabled static (and shared)
 > build with BR2_SHARED_STATIC_LIBS resulting in the following build
 > failure since at least version 1.11.1:

 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-buildroot-linux-gnu/11.2.0/../../../../mips-buildroot-linux-gnu/bin/ld:
 > /home/buildroot/autobuild/instance-1/output-1/build/poco-1.11.1/lib/Linux/mips/libPocoXML.a(ParserEngine.o):
 > in function `Poco::XML::ParserEngine::handleStartElement(void*, char
 > const*, char const**)':
 > ParserEngine.cpp:(.text+0x2f8): undefined reference to `XML_GetSpecifiedAttributeCount'

 > Fixes: add7c433d250e153d9e58fe7da3bd52171ba2652
 >  - http://autobuild.buildroot.org/results/afc434a13d5e7a8affa4abb4058d7bebc81aca29
 >  - http://autobuild.buildroot.org/results/860b70a8c9c4a6a53247ac4bdb4fd0851b28c61a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
