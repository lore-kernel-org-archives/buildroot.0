Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E3C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85AFB60D94;
	Wed,  8 May 2024 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H_u2pq7DwRv; Wed,  8 May 2024 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1716F60D96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1716F60D96;
	Wed,  8 May 2024 16:33:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 300C71BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C96B400E0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3qfK5O-ivik for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:33:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C366A400DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C366A400DB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C366A400DB
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:33:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62EC760002;
 Wed,  8 May 2024 16:33:27 +0000 (UTC)
Date: Wed, 8 May 2024 18:33:26 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240508183326.687109bf@windsurf>
In-Reply-To: <20240508081952.98506-1-fontaine.fabrice@gmail.com>
References: <20240508081952.98506-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715186007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJEvNePaEjnhVKJ+xEgu31XE6WrFLAcjo8cvMx9/02w=;
 b=kBP53Yu40HT5AsMRSePk1IhHMJqQotRc5s12GXu1+Z8G23peIMnXg0MVhfDRigBR304pS8
 FgWUc3MVywBFbb6yi8eE9Vo3x7kl/+YC1kO05RONwSsc/E0n8dO1Iy3icJufOXkFZ9w70P
 pKszYl/kD1tg4UOdlu6Zt5vksyFTJD6muqTL8bNPhYX+mxVxL3jKP42FGkTNrFIjkLxwjO
 DSZ+Dh7xFpougW982yEIDEPU7aTweyWYgPdHlYSqJc+VgJSOKxi69i1+DwKs62u/Ar5mj5
 RAj9T9SrTyk7uU9V/W84PmlFWrVl8Ml8I/BszmhyC4JiQBpcdJUzwUYEO5BBJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kBP53Yu4
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: fix host build
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 10:19:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cmake options were renamed by
> https://github.com/Kistler-Group/sdbus-cpp/commit/0074c79e7fd7983dda3c2a4e4ac7febe67751a28
> resulting in the following host build failure since bump to version
> 2.0.0 in commit 0f5bb364c629dd7fc91f4295f872e46d89c0feef:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp: In member function 'virtual sdbus::PendingAsyncCall sdbus::internal::Proxy::callMethodAsync(const sdbus::MethodCall&, sdbus::async_reply_handler, uint64_t)':
> /home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:125:91: sorry, unimplemented: non-trivial designated initializers not supported
>                                                                        , .floating = false });
>                                                                                            ^
> /home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:133:60: error: class template argument deduction failed:
>      auto asyncCallInfoWeakPtr = std::weak_ptr{asyncCallInfo};
>                                                             ^
> 
> Fixes: 0f5bb364c629dd7fc91f4295f872e46d89c0feef
>  - http://autobuild.buildroot.org/results/66668261d05203575658a243e02e78cf77018d8c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

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
