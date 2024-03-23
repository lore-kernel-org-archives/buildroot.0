Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B265C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43C9E400D8;
	Sat, 23 Mar 2024 12:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBwuG0uF8eRb; Sat, 23 Mar 2024 12:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF08403FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF08403FF;
	Sat, 23 Mar 2024 12:55:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBDA1BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F3D416BF
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyRqkdEStR6A for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2FC8405D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2FC8405D4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2FC8405D4
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:55:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3424240003;
 Sat, 23 Mar 2024 12:55:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ro0tz-006suH-0j;
 Sat, 23 Mar 2024 13:55:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317131446.535633-1-fontaine.fabrice@gmail.com>
Date: Sat, 23 Mar 2024 13:55:11 +0100
In-Reply-To: <20240317131446.535633-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 14:14:46 +0100")
Message-ID: <87jzltyuog.fsf@48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
