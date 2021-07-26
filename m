Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B11C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:59:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A34260560
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A34260560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4CD40455;
	Mon, 26 Jul 2021 05:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaynnyELVK40; Mon, 26 Jul 2021 05:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35454046E;
	Mon, 26 Jul 2021 05:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61FF31BF20B
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EF138364F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4CsrqRiKCPX for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 05:59:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp47.i.mail.ru (smtp47.i.mail.ru [94.100.177.107])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9823482EF0
 for <buildroot@busybox.net>; Mon, 26 Jul 2021 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=yibyo+pSdKf+GESpTZ4FPhUWNPmS8Bi7Ghf0zcsy6dU=; 
 t=1627279144;x=1627884544; 
 b=WokppaODHspE9so35QtuVqgcci9qMqkarHodG6dtdl8Sr+IdbwYeTu5ZXk92H75r0z+j+nVFUbtFfwvsMcvShbUb02BvMIaXhm7y91913M+z+Qsgyy2u5pvS4NDvqiOTiZ/BSOlOFrtCK9nqlP2fkFo4ZFTSY1b0/TuV1IKCgos=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m7tdl-0000CG-R7
 for buildroot@busybox.net; Mon, 26 Jul 2021 08:59:02 +0300
To: buildroot@busybox.net
References: <20210705125139.1516789-1-fido_max@inbox.ru>
Message-ID: <69d738b2-7d49-7924-fb30-f7dbe274efa4@inbox.ru>
Date: Mon, 26 Jul 2021 09:01:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210705125139.1516789-1-fido_max@inbox.ru>
Content-Language: en-US
Authentication-Results: smtp47.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C3038391AAE5FBFA76FBCFDED1455B43CD182A05F53808504040889B5705B3131F4FA567C8343AC3925746BDFF9D6DD4B80FEF4817C15B2D74
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D51E5C74E5FE13C7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CD86AAD37E7767A88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D855EDF567A4F5066579481E7470EEF4756F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE775D5B3C4A8F9BEC69FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC622796FC5AF9ECA63AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379D2E655098E02646D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F616AD31D0D18CD5C57739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A57476D702897F795B699B3E5D2A38264DCE9DCF16798026D9D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C75F910DBB8BE898E6BB2EDCACEC537C5D378FCC03346D3B78BD350A077A533E001FB40871FEB7061D7E09C32AA3244C2BCD3B36F342EC676214B973BBE62EE8F94338140B71B8EE3EB3F6AD6EA9203E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojBHzp66hWLW1qCIB8g5DsuA==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24F0483A401690A8E918F8CDFBBD4CFA564EAB46A6D34EF626EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH v2] package/gcc: fix libsanitizer in gcc
 11.1, 10.3 for linux 5.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

05.07.2021 15:51, Maxim Kochetkov via buildroot wrote:
> Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161
> 
> But gcc's libsanitizer uses <linux/cyclades.h> header.
> This issue is fixed by:
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8
> 
> Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be deleted.
> So we need to add this patch for 10.3 and 11.1 to fix build with linux kernel 5.13.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Fixes: 
http://autobuild.buildroot.net/results/bdc3e63bc1e3be2f2043585f8b92d5b5bfa34704/
Fixes: 
http://autobuild.buildroot.net/results/006e1342a584de209dbe4fcaeda2349232ccc3af/
Fixes: 
http://autobuild.buildroot.net/results/e7dc2f937b4942270c52ec6aab4a74b49b132820/
Fixes: 
http://autobuild.buildroot.net/results/cfcf33553dfc7a80c78b9923c08e6ae779046b81/
Fixes: 
http://autobuild.buildroot.net/results/6e138dca6430d91849170bdfddd63af77dc88e8f/
Fixes: 
http://autobuild.buildroot.net/results/ca273c10690fd39e16cd1b6501882e74e9ddf6b4/
> ---
>   ...er-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>   ...er-Remove-cyclades-from-libsanitizer.patch | 123 ++++++++++++++++++
>   2 files changed, 246 insertions(+)
>   create mode 100644 package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
>   create mode 100644 package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> 
> diff --git a/package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> new file mode 100644
> index 0000000000..da979a309f
> --- /dev/null
> +++ b/package/gcc/10.3.0/0004-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> @@ -0,0 +1,123 @@
> +From a7e72b282177fbaa6a852324641c871313d326da Mon Sep 17 00:00:00 2001
> +From: Tamar Christina <tamar.christina@arm.com>
> +Date: Fri, 21 May 2021 10:30:59 +0100
> +Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
> +
> +The Linux kernel has removed the interface to cyclades from
> +the latest kernel headers[1] due to them being orphaned for the
> +past 13 years.
> +
> +libsanitizer uses this header when compiling against glibc, but
> +glibcs itself doesn't seem to have any references to cyclades.
> +
> +Further more it seems that the driver is broken in the kernel and
> +the firmware doesn't seem to be available anymore.
> +
> +As such since this is breaking the build of libsanitizer (and so the
> +GCC bootstrap[2]) I propose to remove this.
> +
> +[1] https://lkml.org/lkml/2021/3/2/153
> +[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
> +
> +libsanitizer/ChangeLog:
> +
> +	PR sanitizer/100379
> +	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
> +	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
> +	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
> +	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> +
> +(cherry picked from commit 745dae5923aba02982563481d75a21595df22ff8)
> +---
> + .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
> + .../sanitizer_platform_limits_posix.cpp               | 11 -----------
> + .../sanitizer_platform_limits_posix.h                 | 10 ----------
> + 3 files changed, 30 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +index 490a04b2181..42e43a04441 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
> +-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
> +-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
> +-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
> +-  _(CYGETTHRESH, WRITE, sizeof(int));
> +-  _(CYGETTIMEOUT, WRITE, sizeof(int));
> +-  _(CYSETDEFTHRESH, NONE, 0);
> +-  _(CYSETDEFTIMEOUT, NONE, 0);
> +-  _(CYSETTHRESH, NONE, 0);
> +-  _(CYSETTIMEOUT, NONE, 0);
> +   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
> +   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
> +   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +index aa845df4dde..badf6a401cc 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +@@ -130,7 +130,6 @@ typedef struct user_fpregs elf_fpregset_t;
> + # include <sys/procfs.h>
> + #endif
> + #include <sys/user.h>
> +-#include <linux/cyclades.h>
> + #include <linux/if_eql.h>
> + #include <linux/if_plip.h>
> + #include <linux/lp.h>
> +@@ -443,7 +442,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
> +-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
> + #if EV_VERSION > (0x010000)
> +   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
> + #else
> +@@ -809,15 +807,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> + #endif // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
> +-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
> +-  unsigned IOCTL_CYGETMON = CYGETMON;
> +-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
> +-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
> +-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
> +-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
> +-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
> +-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
> +   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
> +   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
> +   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +index d82fd5e4005..dc6423bc297 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +@@ -974,7 +974,6 @@ extern unsigned struct_vt_mode_sz;
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> + extern unsigned struct_ax25_parms_struct_sz;
> +-extern unsigned struct_cyclades_monitor_sz;
> + extern unsigned struct_input_keymap_entry_sz;
> + extern unsigned struct_ipx_config_data_sz;
> + extern unsigned struct_kbdiacrs_sz;
> +@@ -1319,15 +1318,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
> + #endif  // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-extern unsigned IOCTL_CYGETDEFTHRESH;
> +-extern unsigned IOCTL_CYGETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYGETMON;
> +-extern unsigned IOCTL_CYGETTHRESH;
> +-extern unsigned IOCTL_CYGETTIMEOUT;
> +-extern unsigned IOCTL_CYSETDEFTHRESH;
> +-extern unsigned IOCTL_CYSETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYSETTHRESH;
> +-extern unsigned IOCTL_CYSETTIMEOUT;
> + extern unsigned IOCTL_EQL_EMANCIPATE;
> + extern unsigned IOCTL_EQL_ENSLAVE;
> + extern unsigned IOCTL_EQL_GETMASTRCFG;
> +--
> +2.31.1
> +
> diff --git a/package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch b/package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> new file mode 100644
> index 0000000000..78208d7348
> --- /dev/null
> +++ b/package/gcc/11.1.0/0001-libsanitizer-Remove-cyclades-from-libsanitizer.patch
> @@ -0,0 +1,123 @@
> +From 2bf34b9f4e446bf9be7f04458058dd5319fb396e Mon Sep 17 00:00:00 2001
> +From: Tamar Christina <tamar.christina@arm.com>
> +Date: Fri, 21 May 2021 10:30:59 +0100
> +Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
> +
> +The Linux kernel has removed the interface to cyclades from
> +the latest kernel headers[1] due to them being orphaned for the
> +past 13 years.
> +
> +libsanitizer uses this header when compiling against glibc, but
> +glibcs itself doesn't seem to have any references to cyclades.
> +
> +Further more it seems that the driver is broken in the kernel and
> +the firmware doesn't seem to be available anymore.
> +
> +As such since this is breaking the build of libsanitizer (and so the
> +GCC bootstrap[2]) I propose to remove this.
> +
> +[1] https://lkml.org/lkml/2021/3/2/153
> +[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
> +
> +libsanitizer/ChangeLog:
> +
> +	PR sanitizer/100379
> +	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
> +	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
> +	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
> +	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
> +
> +(cherry picked from commit 745dae5923aba02982563481d75a21595df22ff8)
> +---
> + .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
> + .../sanitizer_platform_limits_posix.cpp               | 11 -----------
> + .../sanitizer_platform_limits_posix.h                 | 10 ----------
> + 3 files changed, 30 deletions(-)
> +
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +index 490a04b2181..42e43a04441 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> ++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
> +@@ -366,15 +366,6 @@ static void ioctl_table_fill() {
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
> +-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
> +-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
> +-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
> +-  _(CYGETTHRESH, WRITE, sizeof(int));
> +-  _(CYGETTIMEOUT, WRITE, sizeof(int));
> +-  _(CYSETDEFTHRESH, NONE, 0);
> +-  _(CYSETDEFTIMEOUT, NONE, 0);
> +-  _(CYSETTHRESH, NONE, 0);
> +-  _(CYSETTIMEOUT, NONE, 0);
> +   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
> +   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
> +   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +index 1427cec48c4..025e575b5bc 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
> +@@ -131,7 +131,6 @@ typedef struct user_fpregs elf_fpregset_t;
> + # include <sys/procfs.h>
> + #endif
> + #include <sys/user.h>
> +-#include <linux/cyclades.h>
> + #include <linux/if_eql.h>
> + #include <linux/if_plip.h>
> + #include <linux/lp.h>
> +@@ -449,7 +448,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
> +-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
> + #if EV_VERSION > (0x010000)
> +   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
> + #else
> +@@ -815,15 +813,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
> + #endif // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
> +-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
> +-  unsigned IOCTL_CYGETMON = CYGETMON;
> +-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
> +-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
> +-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
> +-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
> +-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
> +-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
> +   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
> +   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
> +   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
> +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +index 0812039b038..83861105a50 100644
> +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> +@@ -981,7 +981,6 @@ extern unsigned struct_vt_mode_sz;
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> + extern unsigned struct_ax25_parms_struct_sz;
> +-extern unsigned struct_cyclades_monitor_sz;
> + extern unsigned struct_input_keymap_entry_sz;
> + extern unsigned struct_ipx_config_data_sz;
> + extern unsigned struct_kbdiacrs_sz;
> +@@ -1326,15 +1325,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
> + #endif  // SANITIZER_LINUX
> +
> + #if SANITIZER_LINUX && !SANITIZER_ANDROID
> +-extern unsigned IOCTL_CYGETDEFTHRESH;
> +-extern unsigned IOCTL_CYGETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYGETMON;
> +-extern unsigned IOCTL_CYGETTHRESH;
> +-extern unsigned IOCTL_CYGETTIMEOUT;
> +-extern unsigned IOCTL_CYSETDEFTHRESH;
> +-extern unsigned IOCTL_CYSETDEFTIMEOUT;
> +-extern unsigned IOCTL_CYSETTHRESH;
> +-extern unsigned IOCTL_CYSETTIMEOUT;
> + extern unsigned IOCTL_EQL_EMANCIPATE;
> + extern unsigned IOCTL_EQL_ENSLAVE;
> + extern unsigned IOCTL_EQL_GETMASTRCFG;
> +--
> +2.31.1
> +
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
