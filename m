Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848D9E87834
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C2780B48;
	Tue,  3 Feb 2026 14:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVFhFsOWlWZ9; Tue,  3 Feb 2026 14:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73BDF80ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770129296;
	bh=rxcLV4eejZTlaNnS6AZTauQo7t7e1wlqzlJYIqbhPpI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZbqNvpU/CjFVH8WJ4y6qSDV7GgvJvIn5IbjNMegJCsA5CFg8gjtdrBBGpuU0cYBs5
	 7rl2oMxpHwVsY9+TMHCM0RwH7QjNMGx+G3LLj1wQCPtKF2xnXAHX1kqCaRJY0Wac51
	 hvhSdLQBpPJ1ZJIiCESkrsxuF3CDjtrsBCaTTquTUz79PVrsobg7GQNX2WkD9EP+tL
	 nWrwoN0baTJbMn7lmv8f9JhhFp6xGk2QY8L5O/F4kPukjhmUnGvuX1AT9YLeDCk0FA
	 tbedhqBl7sJ2yyk8Uetn3voNfBTzZ33/1diAj4Wi6WtzlXMtLYy/wGU6UCl0ouIuet
	 RYy+3QXmcHqFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BDF80ACF;
	Tue,  3 Feb 2026 14:34:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C57F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDEE880B3D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2zNGuJnCDgM for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 147BF80B37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 147BF80B37
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 147BF80B37
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:34:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so4524345f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 06:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770129292; x=1770734092;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1kUedbz3DG0hROjUi0iaaYzyYNglcjs86I6+GACbuO4=;
 b=o7I0tyb8vUkkqFs0/lTpEyTjpE5jI7ruKtpxMD37NrJcTahJWoVmBpo//4Lya3KHsJ
 Wl1v2cruKNh3mI5raakAbikSHUYEVQMSABo7cy+wfzp/ifdrqooX5v7+v0fXl4I+Ai1p
 o5T+aEV3YUnxdjouG5DdCr1a+e37iWP2icu/KTs6TROoQLx4IZWn3WMZluj3Q9cJIjKw
 EQuJJukHjlQuW1tBEJODUO3jR06ot/rUcSlnpap4TUKb7ggnypz/MtXYAmoWCzyBU4xh
 6q2W6/aYcsinYXxXp1f4Rq/kUBg4kVQ+Lda0ulLMqgkdvE61R6SvyOxxA9eiEY1qwKCY
 ruJA==
X-Gm-Message-State: AOJu0YyxwvoR6Xc+z/eD4Vo2Ke3qzRcQUhQ94PWspD6tVdxLQDB6DcK1
 hFTOap40emyMZ1gPy4yy5Z3rpblf1YEJAMZKOCoyplHu/0re537t7gwQg8DPkIZkpws=
X-Gm-Gg: AZuq6aKjmtJTIuf5VB6Au6HMHOGkLddmgdPuRYoFIF4kwY773mtEprllV6Hdrp5wHHd
 vnutOCNpMmk5Eje59H4zJ6+U8gNAM7AkIneCiS38DLvUREQALuD2EVReRHatc8VKfeLymWMcAFO
 z7zeMy6bO+znVzqu5mLdE/k4Bvd+myU97Wx8OwUigcaGhFjDrPD/4ViFm6ilAGEnDLO7FMk3cC7
 mGPiEnKq78+6lS5eyOKPLXeDCTtLnuO0Wp8l9ZXS4XlMERAIcN/Ycdt2M9RIp38m12wL82lxL0o
 KA10RnfbRg7//APHbCcHMsBii3ydl7nK5mQNYVq5EbsOQqb9pEECYzVNT0k8dWdFkPIp83mdqAH
 6EYdz/leBkeZ2RAruJiSFDL3btyWs3JAwQTgLT7FequnUKSv0MgjzXDDZFp6/P4kFmAyQ007b64
 blQ+DLLN6S2jmltRfGbvRsj9NxpqncJO9E4cUg5b3aKzTQGpDnEonaB2GB1056ehhYPXkhnN91E
 QuV
X-Received: by 2002:a05:6000:2004:b0:435:dba0:7c0b with SMTP id
 ffacd0b85a97d-435f3a6ab23mr22584756f8f.3.1770129291976; 
 Tue, 03 Feb 2026 06:34:51 -0800 (PST)
Received: from [10.5.90.75]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee057sm58511857f8f.15.2026.02.03.06.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:34:51 -0800 (PST)
Message-ID: <16118340-95c2-4f82-bc60-e35622707e80@smile.fr>
Date: Tue, 3 Feb 2026 15:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-6-elmehdi.younes@smile.fr>
 <aYH9Ids-J7BuJl0u@windsurf>
Content-Language: en-US
In-Reply-To: <aYH9Ids-J7BuJl0u@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770129292; x=1770734092; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1kUedbz3DG0hROjUi0iaaYzyYNglcjs86I6+GACbuO4=;
 b=JP7uFHATUV9uSn2TIVpMNGmcytGaTHYUWBtPjOeGnEL7aPcWLjUccbpDbsS9eG4q8T
 4ZCE9x7O7Mg2ScCIObpLJ4zso6PYjf1TTpc7uHq1XhIn90cCTKbZSivhG7gCCyt69WOv
 n5SnFTCpU+IwcOZg2rszyx2O5/gJk6oe14o/U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=JP7uFHAT
Subject: Re: [Buildroot] [RFC PATCH 5/5] linux: Add Rust support
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 2/3/26 15:08, Thomas Petazzoni wrote:
> On Fri, Aug 08, 2025 at 03:31:12PM +0200, El Mehdi YOUNES via buildroot wrote:
>
>> +ifeq ($(BR2_LINUX_KERNEL_RUST_SUPPORT),y)
>> +LINUX_DEPENDENCIES += host-rustc host-rust-bindgen
>> +LINUX_MAKE_FLAGS += \
>> +	RUSTC=$(HOST_DIR)/bin/rustc \
>> +	BINDGEN=$(HOST_DIR)/bin/bindgen \
>> +	RUST_LIB_SRC=$(HOST_DIR)/lib/rustlib/src/rust/library \
> You'll have to update this to $(HOST_DIR)/src/rust if that ends up
> working (see our comments on PATCH 2/5).
>
> Make sure to test this with both pre-compiled Rust compiler and
> compiled-from-source Rust compiler.
I will improve it on v2, Thanks a lot!
>
> And finally, we would like to have a test in support/testing/ to
> verify that this continues to work. You don't need a test that boots
> the kernel, but at least something that builds the kernel with Rust
> support. Of course if there's some HW-agnostic kernel feature in Rust
> that we can test in Qemu, it would be nice. Maybe binder? But I'm not
> sure how to use it under a pure Linux system. But don't spend too much
> time on this: a compile-time only test will be good enough.

Maybe we can add a runtime test using the rust_minimal sample.

https://github.com/torvalds/linux/blob/master/samples/rust/rust_minimal.rs

I have already tested it on Qemu, so I will try to add a runtime test 
using it.

I will add it to the v2.

>
> Thanks a lot!
>
> Thomas

Best regards,

El Mehdi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
