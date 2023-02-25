Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE4CC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65FAF40B15;
	Sat, 25 Feb 2023 09:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FAF40B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No-ospLF4jgk; Sat, 25 Feb 2023 09:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6466640BC4;
	Sat, 25 Feb 2023 09:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6466640BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF5671BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3464960B5D
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3464960B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bu4aAYa9RYxs for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B826E60B45
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B826E60B45
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:40:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E0A820005;
 Sat, 25 Feb 2023 09:40:02 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:40:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104001.7df24464@windsurf>
In-Reply-To: <20230224114320.2152346-1-fontaine.fabrice@gmail.com>
References: <20230224114320.2152346-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oN2MKAUjWhQZQA8BZp8H4TPzA3oZtxBTYZiynscG+Xk=;
 b=pRN8uyva88jWaayVzaeeQNlkpwG0f86HRxGquk3jD2ZQWEvdMqXtxFyz41hvQyiHlTdu5g
 VZBellymfUqnkkXABcJPNG87KgT25nft4gCYBxOZkGsIqOV4HHqY/uBBSFKEsBvt5H2VQ/
 VtW3Nti25E1lyKwGcmxcLZJS8PK5H1lo5wjuspeL+B+miMdDkWQqd77ed6lJlXFAbQDtoG
 ZkioHf1v1yAZW/jUJkiF14ZWmZHFL7hTpL8103ahH/Z/kC5+yurereD5zXLbZC5fZgZsOY
 JtMMyCThxjepqffx/qX2i3GceS7/mznteuK3GwSWxuFVTnj+VTBiLUFIQz01lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pRN8uyva
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix build with libressl
 >= 3.5.0
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Feb 2023 12:43:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with libressl >= 3.5.0 raised since bump
> to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> tls.c:113:17: error: static declaration of 'OPENSSL_cleanup' follows non-static declaration
>   113 | static void     OPENSSL_cleanup(void)
>       |                 ^~~~~~~~~~~~~~~
> In file included from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/bio.h:69,
>                  from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/evp.h:67,
>                  from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/hmac.h:67,
>                  from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:150,
>                  from ../../../include/zbxcomms.h:65,
>                  from tls.c:20:
> /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/crypto.h:565:6: note: previous declaration of 'OPENSSL_cleanup' with type 'void(void)'
>   565 | void OPENSSL_cleanup(void);
>       |      ^~~~~~~~~~~~~~~
> In file included from tls.c:20:
> tls.c: In function 'zbx_log_ciphersuites':
> ../../../include/zbxcomms.h:222:75: error: invalid use of incomplete typedef 'SSL_CTX' {aka 'struct ssl_ctx_st'}
>   222 | #       define SSL_CTX_get_ciphers(ciphers)                     ((ciphers)->cipher_list)
>       |                                                                           ^~
> tls.c:1415:31: note: in expansion of macro 'SSL_CTX_get_ciphers'
>  1415 |                 cipher_list = SSL_CTX_get_ciphers(ciphers);
>       |                               ^~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-fix-build-with-libressl-3.5.0.patch  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch

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
