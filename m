Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86B6C3600D
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 08:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4DC81D4F;
	Wed, 26 Mar 2025 08:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80XVS22vHtbL; Wed, 26 Mar 2025 08:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AFD8126B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1AFD8126B;
	Wed, 26 Mar 2025 08:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5A11B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D007D41992
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ix1Bpq3y0Tpe for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 08:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41FD9419EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FD9419EF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41FD9419EF
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 08:01:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so3160825e9.0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 01:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742976065; x=1743580865;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aL5YvBnuVtq9pJn077zwOQzYD2a79Uv1VRIGD4285KU=;
 b=uPiVejb5BeJVYDoEzOvijAqBiUy3l7FXkX1k4zJkcjdibhz5HaLK7DUK3YQkGCfcbN
 vzJSKAjQAjyqfCvdKnaW+qEla4ZfX5TMtP2xazMN+2cuULCnqzRLx/pddA+kkZmT9lcm
 rGHYsN03qwHmelclWi08bMp6vM0hrZeYiiRoVUm39o7cKSE1U4P/RA/tQ0KOkNCBLZS1
 GlZjI+yO9gDL/BASbhVLHr/3NbJuZdjif34mKKxFrRGFZY83go2QzEmbELBakYLu1IG5
 25NHZ1tOo8YYxpZsM6W8lXHc1B/w4SpDPctrgFIxt8r7yKbjSc/BZYnuTDgUTc7gupMr
 yN7A==
X-Gm-Message-State: AOJu0YzuLOvfDrC/jQT2p+VBs9n4xa8CwljaP/2s/M2pcLjwPijwiTrM
 vPI5efCUM5Z5ZLzCOxQjjBStloKe9mJabge6yQ5EOsQIGYeKKJXYmzwjV+LN42o=
X-Gm-Gg: ASbGncuRBHTp3xIOjEdc8QDONOJJnIAnLWVb+7TqnajvxkZQDPugbHxibr2XZjyhJ6S
 KkRJ1xuwjLgXxYu5uXmvj1M+x5OokF6JmTG0k0AatMoipv1X9jM3AzH7sDzoupYswIHiocpr9Bk
 TeYBSapaZV+pxMO0696ulos944lELL1f1tIHD9Y2nqNuwJHAwxz9ZeYsdOTr3cxo0GvRAujNDYx
 NEaFZEVcb2oUilG510OgTWj8DCkNjMHQO8cg3l19kRdEVSZv0pOWDH33+mQitcB8V36YKKfijuP
 WWNm0TDR3X6bLhFPvh35FA8JkSKKQ6IxoG8gp6A0NM9hrvlLwEk/w5yH4nK541xGAunD2RJxHdL
 yW/4uAEC9ijXi0FRB8bhgmaOhcFvb5wCCpfmeFGT8h7/VA4bMyrz2m87umqf0DnNIoae7a+wjxs
 E=
X-Google-Smtp-Source: AGHT+IHatZ2CKgv/R5OG7TNQAdbH7CsUebBjj1+kM/oJthVxlDJTZyuvEqMp6nZCtm8nxEFNLneuNg==
X-Received: by 2002:a05:600c:350c:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-43d77547e9bmr23927985e9.3.1742976064760; 
 Wed, 26 Mar 2025 01:01:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac80e6814sm4444312f8f.56.2025.03.26.01.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:01:04 -0700 (PDT)
Message-ID: <3dcd408a-1a5a-4a65-8cdf-8677a9d08cbd@mind.be>
Date: Wed, 26 Mar 2025 09:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com>
 <43c0f8e3-4e9f-4bf8-a0dd-0f39824c03a1@mind.be> <Z-NtC3refUELEx5t@ghost>
Content-Language: en-GB
In-Reply-To: <Z-NtC3refUELEx5t@ghost>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742976065; x=1743580865; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aL5YvBnuVtq9pJn077zwOQzYD2a79Uv1VRIGD4285KU=;
 b=DljmPjLVhr4VgwUy7TI3Vl4UXI+xGBICoSEiOQ8ywNiHWeBZG6hjXKM7R6QIz6v0s4
 47Y7gDT1Cil3RCadjmiOV9N//BTp9HMwYKjQivc7nkZQjF67UCT7r3GF2ulPTuMNqLSr
 EzfYY1afSCHu4ZGJAyjti4G3yukmsTfKUZWXXw1aERd3pkrzEfxhxeFXnqccredpK3WE
 +QrNIkGM8HZr8nceaUq3tlpewDNPpabSOda/gSMNmgzbwCn6yWb2fvex+5DT/QLWwNdx
 9gb2ZRLMcQ9T+1r9zpx4RQ+L7bqYeOuf/I6DoDU2w9adwkZHknsYCwYRUOVWK3qJN1yi
 f4kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DljmPjLV
Subject: Re: [Buildroot] [PATCH] toolchain-external: Fix external toolchains
 when BR2_ROOTFS_MERGED_USR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/03/2025 03:57, Charlie Jenkins wrote:
> On Tue, Mar 25, 2025 at 10:47:12PM +0100, Arnout Vandecappelle wrote:
>>
>>
>> On 11/03/2025 03:48, Charlie Jenkins wrote:
>>> External toolchains like crosstool-ng place libraries at /lib.
>>> When BR2_ROOTFS_MERGED_USR is enabled, these libraries were not being
>>> copied into the target. This caused these toolchains to be unusable with
>>> this option.
>>>
>>> WHen BR2_ROOTFS_MERGED_USR is selected, copy the /lib and /lib64
>>> directories into /usr/lib and /usr/lib64 respectively.
>>
>>   This should already happen, because the lib -> usr/lib symlink should be
>> created in staging dir before the toolchain sysroot is copied.
>>
>>   But you reported in the other thread that the problem is actually with the
>> symlink:
>>
>>> $ ls -l ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
>>> lrwxrwxrwx 1 charlie rvs 6 Mar  9 22:58 ./output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../
>>
>>   So this looks liek the symlink creation is going wrong. That is done by the
>> following code:
>>
>> 	for link in $$(find $(STAGING_DIR) -type l); do \
>> 		target=$$(readlink $${link}) ; \
>> 		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
>> 			continue ; \
>> 		fi ; \
>> 		relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
>> 		echo "Fixing symlink $${link} from $${target} to
>> $${relpath}$${target$(SHARP_SIGN)/}" ; \
>> 		ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
>> 	done ; \
>> 	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
>> 	if [ "$${relpath}" != "" ]; then \
>> 		for i in $$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR}
>> $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} -type l -xtype l); do \
>> 			LINKTARGET=`readlink $$i` ; \
>> 			NEWLINKTARGET=$${LINKTARGET\#$$relpath} ; \
>> 			ln -sf $${NEWLINKTARGET} $$i ; \
>> 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>> 		done ; \
>> 	fi ; \
>>
>>   So I guess there is a symlink from usr/lib/libm.so to ../../lib/libm.so in
>> the ct-ng toolchain, and that this doesn't get handled correctly by the code
>> above. But honestly that code is not xxactly readable...
> 
> Are you suggesting that this is a problem with crosstool-ng and not with
> Buildroot?

  No not really. It's annoying that ct-ng doesn't use merged usr in its sysroot, 
but not wrong as such.

  What I'm suggesting is that Buildroot should already copy all the libraries, 
but it is just not creating symlinks correctly. And just rsyncing stuff 
willy-nilly is probably going to break other external toolchains.

> 
>>
>>>
>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>> ---
>>> I originally reported this issue here [1].
>>>
>>> [1] https://lore.kernel.org/buildroot/Z86AGdrKHaUqgLVt@ghost/T/#t
>>> ---
>>>    toolchain/helpers.mk | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>>> index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..b565da8a3a8f12567920f14dd3b6a18e548da6c7 100644
>>> --- a/toolchain/helpers.mk
>>> +++ b/toolchain/helpers.mk
>>> @@ -55,6 +55,9 @@ copy_toolchain_lib_root = \
>>>    # corresponding architecture variants), and we don't want to import
>>>    # them.
>>>    #
>>> +# Furthermore, when BR2_ROOTFS_MERGED_USR is enabled, the 'lib*' directories
>>> +# need to be copied over to usr/'lib*'.
>>> +#
>>>    # If ARCH_LIB_DIR is not a singular directory component, e.g.
>>>    # 'lib32/octeon2', then symbolic links in ARCH_LIB_DIR and
>>>    # usr/ARCH_LIB_DIR may be broken because Buildroot will flatten the
>>> @@ -109,6 +112,10 @@ copy_toolchain_sysroot = \
>>>    	ARCH_SUBDIR="$(strip $3)"; \
>>>    	ARCH_LIB_DIR="$(strip $4)" ; \
>>>    	SUPPORT_LIB_DIR="$(strip $5)" ; \
>>> +	if [ "$(BR2_ROOTFS_MERGED_USR)" == "y" ]; then \
>>> +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/lib $(STAGING_DIR)/usr/lib 1>&2 ; \
>>> +		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} 1>&2 ; \
>>
>>   It looks suspicious to me that you copy both lib and ARCH_LIB_DIR - only
>> one of them should be valid (or, usually, one is a symlink to the other).
>> Also, ARCH_LIB_DIR is already handled in the loop below (in a slightly
>> different way, because thanks to the trailing /, the lib -> usr/lib symlink
>> is preserved).
> 
> Without both, the symlinks are not preserved.

  Well, obviously symlinks are not preserved correctly, because the Buildroot 
logic takes the libraries from several places and puts all of them in usr/lib. 
So cross-directory symlinks are not correctly preserved. That's why there is 
additional code after the rsync loop that repairs symlinks.

  I'm not entirely sure how it is possible that these additional rsyncs preserve 
it. I suspect that the second one destroys the lib64->lib symlink and this 
somehow makes the libm.so symlink valid again.

> Getting rid of the
> ARCH_LIB_DIR statement here results in the symlink being garbage:
> 
> ./host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libm.so -> ../../

  I suspect that this garbage is created by the symlink-repairing code that I 
pointed out above. So the correct fix is to fix that symlink code, not to do 
additional rsyncs that duplicate the rsyncs that already exist.


  If you put the toolchain in some location where I can downoad it, I could give 
it a try (but don't count on it too much, my Buildroot contributions are 
unfortunately very unreliable).

  Regards,
  Arnout

> 
> - Charlie
> 
>>
>>   Regards,
>>   Arnout
>>
>>> +	fi ; \
>>>    	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
>>>    		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
>>>    			continue ; \
>>>
>>> ---
>>> base-commit: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
>>> change-id: 20250310-fix_external_toolchains-d1b8c4da0be8
>>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
