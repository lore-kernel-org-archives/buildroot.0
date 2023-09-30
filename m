Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF6E728E1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB2C42120;
	Sat, 30 Sep 2023 19:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FB2C42120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BY5wiZEwzVm; Sat, 30 Sep 2023 19:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EEA41695;
	Sat, 30 Sep 2023 19:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0EEA41695
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE13D1BF37C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1EA941695
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1EA941695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBFZXhmjbxCQ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:16:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6174741690
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6174741690
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E21340005
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:16:55 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qmfSR-00FkxI-6L
 for buildroot@buildroot.org; Sat, 30 Sep 2023 21:16:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <ZRhF_WeyOgEfAz6K@nx64de-df6d00>
Date: Sat, 30 Sep 2023 21:16:55 +0200
In-Reply-To: <ZRhF_WeyOgEfAz6K@nx64de-df6d00> (Grzegorz Szymaszek's message of
 "Sat, 30 Sep 2023 17:59:57 +0200")
Message-ID: <874jjb8o9k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/stm32mp157: remove hardcoded device
 tree names from post-image.sh
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Grzegorz" == Grzegorz Szymaszek <gszymaszek@short.pl> writes:

 > The post-image.sh script is used in several STM32MP157-based board
 > configs. It had hardcoded device tree file names for the supported
 > boards which were used for matching the expected TF-A binary name.
 > Replace this mechanism with a pair of grep and sed that build the TF-A
 > binary name from the device tree file name. For example, if
 > BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES contained
 > DTB_FILE_NAME=stm32mp157c-dk2.dtb, the appropriate TF-A file would be
 > named tf-a-stm32mp157c-dk2.stm32.

 > Since the Bash Here Strings are removed with this change, I took the
 > opportunity to remove the only other non-POSIX command, "local", and
 > then I was able to change the shebang to plain /bin/sh, with -eu for
 > simpler error handling.

 > Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
 > ---
 >  .../common/stm32mp157/post-image.sh           | 23 ++++++++-----------
 >  1 file changed, 10 insertions(+), 13 deletions(-)

 > diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
 > index 363c3127cf..fe3becae86 100755
 > --- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
 > +++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
 > @@ -1,4 +1,4 @@
 > -#!/usr/bin/env bash
 > +#!/bin/sh -eu
 
 >  #
 >  # atf_image extracts the ATF binary image from DTB_FILE_NAME that appears in
 > @@ -8,22 +8,19 @@
 >  #
 >  atf_image()
 >  {
 > -	local ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
 > -
 > -	if grep -Eq "DTB_FILE_NAME=stm32mp157c-dk2.dtb" <<< ${ATF_VARIABLES}; then
 > -		echo "tf-a-stm32mp157c-dk2.stm32"
 > -	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-dk1.dtb" <<< ${ATF_VARIABLES}; then
 > -                echo "tf-a-stm32mp157a-dk1.stm32"
 > -	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-avenger96.dtb" <<< ${ATF_VARIABLES}; then
 > -                echo "tf-a-stm32mp157a-avenger96.stm32"
 > -	fi
 > +	ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
 > +	# make sure DTB_FILE_NAME is set
 > +	printf '%s\n' "${ATF_VARIABLES}" | grep -Eq 'DTB_FILE_NAME=[0-9A-Za-z_\-]*'
 > +	# extract the value
 > +	DTB_FILE_NAME="$(printf '%s\n' "${ATF_VARIABLES}" | sed 's/.*DTB_FILE_NAME=\([a-zA-Z0-9_\-]*\)\.dtb.*/\1/')"
 > +	echo "tf-a-${DTB_FILE_NAME}.stm32"
 >  }
 
 >  main()
 >  {
 > -	local ATFBIN="$(atf_image)"
 > -	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 > -	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 > +	ATFBIN="$(atf_image)"
 > +	GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 > +	GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

It looks like GENIMAGE_TMP is not used anywhere. Committed with that
removed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
