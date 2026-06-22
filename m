Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EB9CDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 12:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6196F7C4;
	Mon, 22 Jun 2026 12:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2R6hw4l9u6xN; Mon, 22 Jun 2026 12:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D756F7AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782133194;
	bh=uzykWJO5UQW9F/e/+Uk3Pymq2uUarPHJON/B2GeEb/0=;
	h=Date:To:References:Cc:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbk/aFP0t+bqM4C9mW8KGORKUbU+I8MsiMnMqqL36Ikq3DVBQgVUvW/6+oA3Kc88R
	 cPeg1hhG/cFoQiB+l70K+gGwNuGt/T1dikoSTTPT1R48opCjimk4TSSTXixq2HeePG
	 4seqfY+n83XwMo97TyaS28344VD70Bx9rD715M94oUHa1L4GCm8BrAXCXz9OR00tnF
	 DnUJVJhpfGezfq0F/JxF3AxZ+mxs2bI5Vd1BncbIlqPITGqZiGaPfguq/O+FRyyFou
	 xFTi+9jTh2yHH/VQHr0VLUyfpLEtN6rlK8Mju1bo/ggql5T0yYQmlkwtlD9DLfM0SJ
	 2QPo0w+NYVL9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D756F7AB;
	Mon, 22 Jun 2026 12:59:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6346A367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 12:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 490F240480
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 12:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOh9t1q8BC9C for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 12:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A515403CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A515403CB
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A515403CB
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 12:59:48 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id beFdwsH5TtpTfbeFdwMcFp; Mon, 22 Jun 2026 14:59:45 +0200
Message-ID: <d32d3a57-45d6-4ac8-8e56-c01f2bf876d8@benettiengineering.com>
Date: Mon, 22 Jun 2026 14:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260618075411.969878-1-giulio.benetti@benettiengineering.com>
 <20260619-boundless-irritable-6a3e1b897359@internal.home.lespocky.de>
Content-Language: en-US
Cc: Alexander Dahl <alex@netz39.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260619-boundless-irritable-6a3e1b897359@internal.home.lespocky.de>
X-CMAE-Envelope: MS4xfJwDi+ot1ldUY5++Ixs4a/gaqHlt9vldDLdSkxSqI5bqfVmx58zEFAnyg6Uhg9WlpO22cPXG5aC9+nRPTjoWFuYVNQNgKBEUQty3xxQqt4AY7XqwX/cG
 /VDTZD2DxRhfgUWNSGPYVuihThkjBoa7Be2mRJTWFYlPhFfcArxlpIRDY+1DwHcKxl2LRefs5xiAl93Rk+BLp7/ikSjUBkZ1n8U7mjhJ63Xc6E9A/wZsx2IY
 7JwzsrVQ9V8CLUSeNfD9Aw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1782133185; bh=ngQV3ejWwCFmQJH6TevE4wyGMcz/9gtx3Ye4LTjCiA0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WzROkkTzRvoIET1i7u9cYUTqRMgac9IR/470ytt/+e2CQtfl6L0dH2n5dpWyTsKjw
 QfUdwHtlyl0u9V3OIPEN3Ee+f/Hwxy/HJ22xKuxQRalEjnLDStp+GlUQrzbcWUb4hi
 ZNpCpj0vw9sBswk0q0fxO0AXgYrNzspUOo/2wWV6cM56aUl/+ua6p882y/K5stZwQT
 JzIFbcUnJh8zv6UI3yKr8I4a314JVYuKFSehLAxfLYC3Axj+PlVAjd/IS4puBi4JOs
 Zf/jS4GxB4Bk3pV2Ojr/egBgCSNK+cwjiGm9NTE/eofI2IggBlZBxd5aFcBEZSH1wX
 6yw805PGlob2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WzROkkTz
Subject: Re: [Buildroot] [PATCH] package/util-linux: security bump to 2.41.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Thanks Alex,

On 19/06/2026 09:27, Alexander Dahl wrote:
> Hello Giulio,
> 
> Am Thu, Jun 18, 2026 at 09:54:11AM +0200 schrieb Giulio Benetti:
>> Security fixes:
>>
>>   CVE-2026-53613 - mount(8) TOCTOU race on target path.
>>     The SUID mount does not pin the mount target directory, allowing a
>>     race between path resolution and the actual mount syscall.  A local
>>     attacker can swap an ancestor directory component between these
>>     steps to redirect a mount to an arbitrary location.
>>     Reported-by: Xinyao Hu
>>
>>   CVE-2026-53612 - mount(8) TOCTOU race on post-mount owner/mode change.
>>     The X-mount.owner, X-mount.group, and X-mount.mode options use
>>     path-based lchown()/chmod() after mounting.  An attacker can swap
>>     the target between mount and the ownership/mode change to gain
>>     control of arbitrary files.
>>     Reported-by: Xinyao Hu
>>
>>   CVE-2026-53614 - mount(8) SUID bypass via LIBMOUNT_FORCE_MOUNT2.
>>     The environment variable LIBMOUNT_FORCE_MOUNT2 is not filtered
>>     via safe_getenv() in SUID context.  A local attacker can force
>>     the legacy mount(2) code path, which uses a two-step bind+remount
>>     or propagation sequence with a window where security flags (nosuid,
>>     noexec, ...) are not yet applied.
>>     Reported-by: Xinyao Hu
>>
>> Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.5-ReleaseNotes
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/util-linux/util-linux.hash | 2 +-
>>   package/util-linux/util-linux.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> The release announcement said this:
> 
>   |  Note for v2.41 downstream maintainers: the same loopdev follow-up
>   |  fix for CVE-2026-27456 is available on the stable/v2.41 branch
>   |  (commit 2dacaf3ee) but did not make it into the v2.41.5 tarball.
>   |  Please cherry-pick it into your builds.
> 
> Sounds like there's an additional patch which should be added?


I'm sending a patch for this.

Best regards
Giulio

> Greets
> Alex
> 
>>
>> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
>> index 5a5656212c..b6393d6ec0 100644
>> --- a/package/util-linux/util-linux.hash
>> +++ b/package/util-linux/util-linux.hash
>> @@ -1,5 +1,5 @@
>>   # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
>> -sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
>> +sha256  f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728  util-linux-2.41.5.tar.xz
>>   # License files, locally calculated
>>   sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
>>   sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
>> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
>> index fcce9a7dc8..20bdcc5c3f 100644
>> --- a/package/util-linux/util-linux.mk
>> +++ b/package/util-linux/util-linux.mk
>> @@ -8,7 +8,7 @@
>>   # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>>   
>>   UTIL_LINUX_VERSION_MAJOR = 2.41
>> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
>> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
>>   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>>   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>>   
>> -- 
>> 2.47.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
