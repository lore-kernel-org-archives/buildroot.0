Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00EDC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB74813F2;
	Mon, 25 Mar 2024 07:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmkFsTJG2hZD; Mon, 25 Mar 2024 07:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900F58197D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900F58197D;
	Mon, 25 Mar 2024 07:32:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B821C1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A22B840686
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wjyaQE6ajoF for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E85740684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E85740684
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E85740684
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:32:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20008C0003;
 Mon, 25 Mar 2024 07:32:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roeol-008Qk5-1K;
 Mon, 25 Mar 2024 08:32:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317131446.535633-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 08:32:27 +0100
In-Reply-To: <20240317131446.535633-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 14:14:46 +0100")
Message-ID: <87a5mmhilw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/spice: fix libressl build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump of libressl to version
 > 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

 > red-stream.cpp: In function 'RedStreamSslStatus red_stream_ssl_accept(RedStream*)':
 > red-stream.cpp:526:22: error: invalid use of incomplete type 'SSL' {aka 'struct ssl_st'}
 >   526 |     stream->priv->ssl->s3->flags |= SSL3_FLAGS_NO_RENEGOTIATE_CIPHERS;
 >       |                      ^~
 > In file included from /home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/openssl/err.h:120,
 >                  from red-stream.cpp:33:
 > /home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/openssl/ossl_typ.h:173:16: note: forward declaration of 'SSL' {aka 'struct ssl_st'}
 >   173 | typedef struct ssl_st SSL;
 >       |                ^~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/273eadf9e49af55e0932a8293ca65762fb43114f
 >  - http://autobuild.buildroot.org/results/97601f321efc532de0c2ea6aa618ce11fad9e851

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
