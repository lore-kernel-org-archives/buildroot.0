Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF16140498;
	Sat, 12 Mar 2022 16:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-APAP85nI5o; Sat, 12 Mar 2022 16:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CACF403E9;
	Sat, 12 Mar 2022 16:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB401BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 281798239A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZWpyoYnuI9y for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:19:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D4B381D5A
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:19:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9481:d19c:460:d0b4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 98CF419F5A3;
 Sat, 12 Mar 2022 17:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647101954;
 bh=D4lFF+V3LrXl6pwEqV/qExBcDRrWqqjqAIlcbxmUPHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9iBGB9BjXMO6maNv/w6a5LQzaDB1PW0pBHyTQAqfpj2w9ZJyDBSGoeO5g+DD9HaK
 UUqbvt0smcn0URshWXbtdL+KvzJ8o8xso8aTMK9Ibd6k+DtTedaRanMaGNrZdHQzrP
 DWRXp66lsLlZrUMIgMNzCrxGNtydloD58sk4yS9RUUelB+8JP+D7C2Wrr5RnSoQa6p
 h3zDntgE0LyO6LJHTP2CTkMVEreZnnyrhXLRFP+dqmsaaFelby4rf8R8HzVF3faN0Q
 zJCo7Ohr1yHHM7ye79PuGUbrTDyWUxTfXBtA9hYQTg9KWxfs6ZVZj437NHZxVOIK0r
 Td8XqZkqBbb/g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 17:19:12 +0100
Date: Sat, 12 Mar 2022 17:19:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Mathieu Mirmont <mat@parad0x.org>
Message-ID: <20220312161912.GF283544@scaer>
References: <20220310101826.GA2353@parad0x.org>
 <20220310120256.GA11974@parad0x.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220310120256.GA11974@parad0x.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] fs/common.mk: fix the globing pattern
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

Mathieu, All,

On 2022-03-10 13:02 +0100, Mathieu Mirmont via buildroot spake thusly:
> The FAKEROOT script uses [^x] wildcard patterns which, while supported
> by many shells and interpreted like a regex, are undefined according
> to POSIX.
> 
> The dash shell (/bin/sh) on Debian testing switched to a different
> fnmatch/glob implementation that does not support [^x]. Instead it
> treats [^x] as either "^" or "x", and as a result buildroot fails to
> build on this distro:
> 
> rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/run/..'
> rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/tmp/..'
> 
> The correct form should be [!x] rather than [^x].
> 
> Signed-off-by: Mathieu Mirmont <mat@parad0x.org>
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

I think I preferred your find-based solution, because, as far as I
understand, this is still broken, as it won't match files named, for
example "..foo"

The find-based solution, though, should work for everything and does not
risk any issue with badly interpreted blobs in varios shells and various
shell versions.

Regards,
Yann E. MORIN.

>  	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> -- 
> 2.35.1
> Changes v1 -> v2:
>   - Fix the regex rather than use find|xargs (suggested by Edgar Bonet & David Laight)
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
