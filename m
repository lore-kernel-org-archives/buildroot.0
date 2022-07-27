Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553D7C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B163827BA;
	Wed, 27 Jul 2022 15:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B163827BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOwtcoykYMwf; Wed, 27 Jul 2022 15:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB2D827B5;
	Wed, 27 Jul 2022 15:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB2D827B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE5831BF41A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52B9415CB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B52B9415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4Us1jbEd5J7 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:46:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7F4415C6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D7F4415C6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:46:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 768E2B00716;
 Wed, 27 Jul 2022 17:46:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 17:46:08 +0200
Date: Wed, 27 Jul 2022 17:46:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Evgeni Dobrev <evgeni@studio-punkt.com>
Message-ID: <20220727154608.GC1134587@scaer>
References: <20220124104116.12902-1-evgeni@studio-punkt.com>
 <20220124104116.12902-2-evgeni@studio-punkt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124104116.12902-2-evgeni@studio-punkt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658936770;
 bh=9AHQ0vM4zuOov0H6maYXQFIZ0kBmRfqiK1fdswM6VK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ax90EZIiJJvyp/p/j7SWzLRz+E23hrqyzJMHNCpBvzTP46dU2pC1tYZr4CPhG1iae
 KG/fhZ8LfgBwlS6n001Lm4YgsWVxG6rCIChybUyNVXt0O+y+/CAzXnYKf3SWgJMS7n
 n4SEw/q3OQBXcKkeKbtXgriHGgcF8ZaFB30xDet9oezZjnDhjiiglviHA5LZUXvr5c
 ygU9b3P9iMLzEeCmAjaw67VqVvQtdfxyX2seEwb7NZJBQe7OOwDzatQw1svDZ8hnrR
 GiD17ocA50nnCSxGLW4C4FU4EQPJgSR7NvsNUKVzqcJFVHebQNDxg+PVMFtfcfRlrE
 xNgmaXrCPdi5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ax90EZIi
Subject: Re: [Buildroot] [PATCH 1/1] fs: fix /tmp and /run clean-up in POSIX
 shells
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

Evgeni, All,

Sorry for the late feedback...

On 2022-01-24 11:41 +0100, Evgeni Dobrev via buildroot spake thusly:
> In POSIX sh, ^ in place of ! in glob bracket expressions
> is undefined.
> 
> Signed-off-by: Evgeni Dobrev <evgeni@studio-punkt.com>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 45beb5ae7b..64a94d9ad8 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  
>  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> -	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
> +	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[!.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[!.]*" >> $$(FAKEROOT_SCRIPT)

Turns out we already applied a similar change, that uses find instead,
as you suggested later in the thread:
    38c4f6b807e9 (fs/common.mk: use find instead of shell glob patterns)

Thanks!

Regards,
Yann E. MORIN.

>  	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
