Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D36E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 12:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8987140C6F;
	Sun,  1 Oct 2023 12:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8987140C6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ij8Y0a7lMz_u; Sun,  1 Oct 2023 12:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E21A340A06;
	Sun,  1 Oct 2023 12:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21A340A06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5611BF298
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9EFC8207C
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9EFC8207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWyKmflsqF5Z for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 12:56:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88C7A82070
 for <buildroot@busybox.net>; Sun,  1 Oct 2023 12:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C7A82070
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF28360002
 for <buildroot@busybox.net>; Sun,  1 Oct 2023 12:56:19 +0000 (UTC)
Message-ID: <1bc18a02-9cf3-0cd1-cf8a-e716ceb78b9a@korsgaard.com>
Date: Sun, 1 Oct 2023 14:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: buildroot@busybox.net
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-11-herve.codina@bootlin.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20210817083930.3718711-11-herve.codina@bootlin.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 10/16] Makefile: breaks hardlinks in
 global {TARGET, HOST}_DIR on per-package build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/08/2021 10.39, Herve Codina wrote:

Hi,

Sorry, very old patch.


> Without this patch, a make <pkg>_rebuild detects overwrites. Indeed, in
> target_finalize steps some modifications are done on installed files (ie
> strip or TARGET_FINALIZE_HOOKS for instance).
> 
> In order to avoid these modifications seen from per-package {TARGET,HOST}_DIR
> and so been analyzed as some overwrites, global {TARGET,HOST}_DIR is built
> using a full copy of the involved per-package files instead of hardlinks.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 to v2:
>   - Added 'Reviewed-by: Yann E. MORIN'

We have similar issues if you have a post-build script making changes 
with sed or similar, so committed to master after fixing it up (the 
logic was in the mean time moved to package/pkg-utils.mk), thanks.


> 
> Changes v2 to v2:
> None
> 
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 32fad004fe..ccf2020565 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -734,7 +734,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>   define per-package-rsync-delta
>   	$(Q)mkdir -p $(3)
>   	$(foreach pkg,$(1),\
> -		$(Q)rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(strip $(2))/ \
> +		$(Q)rsync -a \
>   			--filter='merge $($(call UPPERCASE,$(pkg))_DIR)/$(strip $(4))' \
>   			$(PER_PACKAGE_DIR)/$(pkg)/$(strip $(2))/ \
>   			$(3)$(sep))

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
