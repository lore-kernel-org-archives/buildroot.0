Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ECCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99A7B408E5;
	Mon, 25 Jul 2022 19:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99A7B408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOcCG0DH062U; Mon, 25 Jul 2022 19:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911C1402F5;
	Mon, 25 Jul 2022 19:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 911C1402F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0721BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 347F940936
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 347F940936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3xPjkUYbL2H for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:28:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A6540894
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89A6540894
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:28:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d8so17295936wrp.6
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cNtB+ifqUp9IL9DktUi/xqJZFyXe5jF01JImvFAZHeM=;
 b=qZY4xPEwI33npe/2LGoBAqumgIBnmiWxON3L6yDJfp+HvQGxvAUHFkW/96WiulGqsm
 bOa2RSWnAfKGrLVvj7sGtqe7GXkPL7DJ/TRx7D2sLi9JNfJsrqnpZfElt0Ap8bkggFrH
 aLp3Bfx44stmDEO3/FuK5+fVVs0AN87xId+5XR1IBa9Qbo76AlkGJd2UGNnivTyb0bqK
 xVLFFeGzAUxMFYtqPG1ZVY2DfVu9a/tLPcyO07sPZDbITRHPzd2fKyVthXG40Mqwf3QG
 XfqOqM1cClbAVovVRv+QLxoZ8UDoBNnszXmeSdIBZhKWnLp9+68i212CVQNxDtKvJabk
 x2cQ==
X-Gm-Message-State: AJIora8diiIce/EvZxEs9/1ezNLJ04zUMgjZPvZrjWnCqDVh8hVb9EAL
 ND5yoc82gwi8D2RUDZ6nmLp+GHHQkL6xTg==
X-Google-Smtp-Source: AGRyM1vDshzGh/qk9m78JCzyp90JC/NsgApMZbCIokHyt3D7jouWRv4C0hibyiMaHRPxYtedKTouWw==
X-Received: by 2002:a5d:5a8d:0:b0:21d:6d69:ca03 with SMTP id
 bp13-20020a5d5a8d000000b0021d6d69ca03mr8695825wrb.135.1658777329385; 
 Mon, 25 Jul 2022 12:28:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003a32251c3f9sm22417860wms.5.2022.07.25.12.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 12:28:48 -0700 (PDT)
Message-ID: <0484d5a9-a281-8cdf-d060-f566843dfbd0@mind.be>
Date: Mon, 25 Jul 2022 21:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cNtB+ifqUp9IL9DktUi/xqJZFyXe5jF01JImvFAZHeM=;
 b=ZzTghVsSa9TvhVHthL9EE2mma5BBLcOB6R3eaLbY1PXnIGOWrDT/tZPWLgFWl2n8Pv
 SMuOLdz6wnaLbWR9TSO/SeGtiNEpzaNKI9Bpuw7yP3can+ylVWsHgGda3+kIeDD+UrMM
 AIy5T3k0Pjg+r4D+DzbTqDslyLPl4Mnhj0WIMrDBxLweplGiFtrirS7DhVrMfwvfejCU
 kScNKdUThIswgCQAuz1wP+EtFmIf+hins20Xc5j0lXVKHguyTK5kO6M9o6C6ehY7cb/Y
 BT5OMIigF4wLRy9nRyweOPNqs+QpYjhKyVL8xf59F3w9aoSNMKIjReoDZyjM8fQoWGDk
 1Pjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZzTghVsS
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf
 >= 2.70
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
Cc: =?UTF-8?Q?Adrien_Gallou=c3=abt?= <adrien@gallouet.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2021 21:12, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> checking for glob.h... no
> configure: error: glob.h not found.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...gure.ac-fix-build-with-autoconf-2.70.patch | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
>   create mode 100644 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> 
> diff --git a/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> new file mode 100644
> index 0000000000..b412a55ead
> --- /dev/null
> +++ b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
> @@ -0,0 +1,43 @@
> +From aa5bc6d2e59c5257d777a45ee4a0e0a784c44244 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 5 Nov 2021 20:58:41 +0100
> +Subject: [PATCH] configure.ac: fix build with autoconf >= 2.70
> +
> +On some embedded toolchains, glob.h detection fails because -g is
> +wrongly added (even when CFLAGS is overwritten):
> +
> +configure:5881: checking for glob.h
> +configure:5904: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.fb729d13'
> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.fb729d13'

  Since this is involving functions that are generated by LTO, I think it's more 
likely that the issue is triggered by the -flto=4 rather than the -g.

  Also, I saw that it only occurs on GCC8, not on any of the other myriad GCC 
versions that we run in the autobuilders. So it's clearly a compiler bug.

  Regardless, this patch does fix it, so I applied to master, thanks. I largely 
rewrote the commit message (both of the patch and the buildroot commit) and I 
added the quotes that I suggested earlier. I've also added a comment in the .mk 
file to explain the AUTORECONF (just pointing to the patch since the earlier 
reason is no longer valid).

  Perhaps you could do another attempt to send the patch upstream?

  Regards,
  Arnout

> +
> +This build failure is raised since autoconf 2.70 and
> +https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=76754e04fce5f6a7701bec57b057020585df2ae3
> +because ac_test_CFLAGS is now set to ${CFLAGS+y} instead of
> +${CFLAGS+set}
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to bird-users@network.cz]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 64181d29..b4b3fcfb 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -114,7 +114,7 @@ AC_SEARCH_LIBS([clock_gettime], [rt posix4],
> + AC_CANONICAL_HOST
> +
> + # Store this value because ac_test_CFLAGS is overwritten by AC_PROG_CC
> +-if test "$ac_test_CFLAGS" != set ; then
> ++if ! test $ac_test_CFLAGS ; then
> +   bird_cflags_default=yes
> + fi
> +
> +--
> +2.33.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
