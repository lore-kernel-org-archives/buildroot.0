Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B478ACC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB0E40A21;
	Fri, 16 Oct 2026 15:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjB2nQ8_5siC; Fri, 16 Oct 2026 15:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE0EE40A2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162991;
	b=kRudgBePKf773BDftfRb0c2ZOKjoa0L/0k5Vrj+P5okRkyic+GrRWVlcX3JRJWwT2biL
	 ZcM8bKsVidzB4wiL3eLfBZo+lRFqXZyRWEQ56Jynkw+n+OvRbXHBgzizCa/pcYk4MfTVq
	 vu2H6FZy4z3TmlNj7lmJAF/+0iVKBan2M1piuMr60OxmVhMPg7JKjxoK6vELM51P/z+St
	 G9HyrXwfHS27nlGTOlHN0pvizkU49XGgtEEjnvTt5a+IsDpKv8LqX6UTpPGd2wGgSgtCr
	 3IZfwzmJ4hZMHHrHgVFqlojV3QSdmLxQrYFnjwQrAApHN+v/FoWxK+IeQIw0UsYj7Ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pEeXVy9GG1qMO/OrSlAe5cgjWtoTDprpoE2H6PRJrHE=;
	b=CErsTjGfCorU6ilPukHwx4KoxMcY+FLc2b6kippIVe9hA9UR2BEJAha6le7eikj50+vQ
	 6vLbo6BHKy7c9inaoktP4CVL3hiAIQhRQffgg6xnLbGmsm1Uewyz/BQiWDRyR1ifYyhz7
	 cu+VvbAAypX/8r9jH8f5RWEY7QescSj7qOTzs+tIwQXsQZgc3dGmzQRqZojbOowwt0sPO
	 LZaSn6CE7dLRyEjD53Qz0vvwcfaSsCAqNZw0UvTgmiQUiYm9sA8OdG1+H/mDF73+Ny1pY
	 VPItnb1bdzgWGEDQEvvl1Gjo406WCcIc3XkElW02pxHommXp36XkgcjRtjb9RgPSMvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162991;
	bh=pEeXVy9GG1qMO/OrSlAe5cgjWtoTDprpoE2H6PRJrHE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LUovBl9dDlZ8rEoB1bSZrcDK876HJLY4O8Ha9UOzC8+JuGdVebFoagEt+W5En/yWK
	 VvkepL5+P/4fulMJ2wWpqVENQeR2lvC7GY5a6SrpNA3P0xPx/9foJXb3aEwfLRpxu3
	 HL18n58nhBC2L4wXe68NvFiBpWf8P7kWV9ar7Swf02SG/DEhkrzXpeUF8UaMPuwJhq
	 EMo/XJv98/lV12clLwCYphxb3AGq/6r4j0Jpvdl/PskpEP/k2D9xwttW7W+OY3BTaP
	 WGaC1Lb8OPW1xj78hhaxDII5FSRlSd63d7KauafYVu1XB46bUroDWxdR911240vNOR
	 syISJHR4cnOKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE0EE40A2C;
	Fri, 16 Oct 2026 15:03:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C42A07AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63CD815C1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoIigs3CiIlr for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D245B8156E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162988;
 b=cF7m/GR1mlYIyF+fVfoBWB5Q63WAvplNBgqNOhJF8zEGAVKS4q1LLp6IlG8ypglzHf+C
 TLPcOpIK8JAudHI8vRWRsY7dFrjiH0NWPTtvX+0jDBn0PwbL7Ts/NI2y+ixTUQRIKqyU3
 hx6J3Bh0g3yTnRQXycPxz9MJ+uTxboe369MQa/OS4RGO5bPUXoEnCCo6zksgTRZ3Sm1Zl
 3lU4qF/tWwHJpnfqKSP6AOhr4vTpotQIXWXXv7MnW7QmuinMWmdjUm1ZZfHSp9j6g0q3Z
 bvG96UuK0Xe/gDavCjUymhDElpfpRCtx6QSqa1tz88n3R2B2iY007W8tycGuVZUq17Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162988;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ISOmwyCtMmfMCN/j4LJFjxAc6Kn669P1syUffn47os4=;
 b=l7skXN7agg+VSu+iubsqvj9k41K5HbhFY5oUIVH3Cs0eP7CoZdC7QmsDbApSvQDq/a9O
 5kdiPvhJOy93G8Wm6GQJ6/MRpMpxAnTdy2zI+soW8zlbXI9GLe2WOtj1HGKONCMa5oEqu
 vt+HcyfEoZokRhKH4xE7WxRdh5bA/8DDWMoTVh46h5O0b1k39YmBkkZbgrUAJBcVZ0VGv
 SSeQvdntRNBfmdHMSiJ5Lmq6mL3duK/6ZLK16OFG79Ot6NhIi782fQfqsC8cU16+0N1v+
 mWM8diUr2z31iiS1RXFxJMgR0wz25vXBt+oP0UtotJA0+Mzj99/fBkBU9NGBG6Fuwfg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NtNQo5q4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D245B8156E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so3913519f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162986; x=1792767786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ISOmwyCtMmfMCN/j4LJFjxAc6Kn669P1syUffn47os4=;
 b=BYhJ/M3DX/st/jg3oQoX7xZBwEMcTJ1KJM25adJyKGcgCqD/kit4kXAhCIrJihhV0p
 RN1NZwcw9n4p+ZdUnnlbvBhZJurzbd3w4AT+EeHNT7mvtxqXkK6xOSdzsV6iIkTI4Y5q
 R3bgZabeciq4u1Lrpue4i5AnekWp2C3uM2CnCtJim6o8Vg/PWqoASibBoXBv7BI+abvU
 CJYi1d7FcfE3tA0WaUJaCOPso8d0MDKz9z4pwOyI+ZnsrsB9w5pq4cpEB3Hk2afBpmkf
 cUSGPTTo8vDvBbQ3sq6+peaYff5uFO6uNJxgoOrK4mVxTGAOT+KBEdF7Y/pZWmaKH4Tb
 +bFQ==
X-Gm-Message-State: AFq9FYLfqHWvJb6Wz4T2Se7Jg836/yyeL7gtLALHjE1IHhcFZyNQclJ4
 B6N1kEezLJZJcop0OnNAylCugXqkUOtLZqr36hQA0UsF1SOlgAI+jfQuKv/aFK6tJOasWE5LgWq
 v8BQ6Xeo=
X-Gm-Gg: AYBFou257hkgn+WwbUnWkDh6WMT9bv3n32WS78Ttr1SCCHyi0mnLUZoB/hUENv8O/cI
 zpnyDbf6Xwp/JDY8A7A5n0cEtpREXSqyIQpZj9nvZnyHmKnkJXke7OSJnYYGDdVQRbhhEXaBiZ9
 jWSjAyI3EybRHFhNGsDacWEK/X0yLiC652xVH4tazcW16+dlD4D1U/UW8RtNMBZGg1Ob6HXAIn2
 5e0GqCwFIIjNrJ4ZNE5SrLm8S1yVueb65cjFnEuu5x/fphy51cAZaYSn2Bgpw+xHBrpw6gPaCZM
 9RKXLCbQ12imQXuI8aWpNtraU4T2nXiiaJt8eRGcLRmv8hZfBPNxsqS9j7dz0mEb6R7W3IyXBo/
 fa783TwTqs5dlZje1hd5WFi1Fg43vHpkWgiRB0rj+7prBFjib10HOJF9mwIgWV58/SDp5TTQxoT
 5GZdwuf0X5BL/NlJsBmiCX+9aYvjMPy+y7uscEpEMd17QO9a9rGWHlbO2UHsSHkq83Q6IamuI/q
 x5qvfg7aPJ4OoGr228fPeC+UqEvSShCcEgbw1HoOA==
X-Received: by 2002:a05:6000:310c:b0:48d:ef7d:4b4c with SMTP id
 ffacd0b85a97d-48def7d4ea2mr15527688f8f.44.1792162985300; 
 Fri, 16 Oct 2026 08:03:05 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4d4dddsm5693729f8f.22.2026.10.16.08.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:03 -0700 (PDT)
To: buildroot@buildroot.org,
	Neal Frager <neal.frager@amd.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:00 +0200
Message-ID: <20261016150302.60849-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902040121.1583600-1-neal.frager@amd.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gcc: add microblaze frame
 unwinding fix to v15 and v16
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add microblaze signal-frame unwinding fix back port to gcc 15.3.0 and 16.2.0.
> 
> Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2026.08.x. Thanks

> ---
> V1->V2:
> - Added upstream link and sob message to patches
> ---
>  ...Linux-signal-frame-unwinding-support.patch | 196 ++++++++++++++++++
>  ...Linux-signal-frame-unwinding-support.patch | 196 ++++++++++++++++++
>  2 files changed, 392 insertions(+)
>  create mode 100644 package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch
>  create mode 100644 package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
> 
> diff --git a/package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch
> new file mode 100644
> index 0000000000..f7618d6727
> --- /dev/null
> +++ b/package/gcc/15.3.0/0004-microblaze-add-Linux-signal-frame-unwinding-support.patch
> @@ -0,0 +1,196 @@
> +From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
> +From: Ramin Moussavi <lordrasmus@gmail.com>
> +Date: Wed, 3 Jun 2026 00:00:00 +0200
> +Subject: [PATCH] microblaze: add Linux signal frame unwinding support
> +
> +libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
> +DWARF unwinder cannot step through signal frames at all.  Anything that
> +unwinds out of a signal handler -- most prominently NPTL asynchronous
> +pthread cancellation (SIGCANCEL) -- either stops early with
> +_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
> +misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
> +
> +Add the standard fallback: recognize the two-instruction trampoline the
> +kernel writes into struct rt_sigframe on the stack
> +
> +	addik r12, r0, __NR_rt_sigreturn
> +	brki  r14, 0x8
> +
> +and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
> +is anchored relative to the trampoline (its last member) rather than to
> +the CFA, so the layout of the frame head does not matter.
> +
> +The interrupted PC is recorded in DWARF column 36, one past the hard
> +registers, because column 15 must keep the interrupted r15 (unrelated to
> +the resume address of a signal frame).  Declaring it as
> +DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
> +column; without that _Unwind_GetGR reads a zero size and aborts.
> +
> +Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
> +git, running its NPTL test suite under qemu-system-microblazeel -M
> +petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
> +9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
> +hanging in the unwinder; with it all 17 pass and the rest of the suite
> +is unchanged.  The implementation follows the mips/aarch64
> +linux-unwind.h pattern.
> +
> +gcc/ChangeLog:
> +
> +	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
> +	Define.
> +
> +libgcc/ChangeLog:
> +
> +	* config.host (microblaze*-linux*): Set md_unwind_header.
> +	* config/microblaze/linux-unwind.h: New file.
> +
> +Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
> +
> +Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +---
> + gcc/config/microblaze/microblaze.h      |   8 ++
> + libgcc/config.host                      |   1 +
> + libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
> + 3 files changed, 111 insertions(+)
> + create mode 100644 libgcc/config/microblaze/linux-unwind.h
> +
> +diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
> +index 2b5bd52040f7f..fc8c4b8717545 100644
> +--- a/gcc/config/microblaze/microblaze.h
> ++++ b/gcc/config/microblaze/microblaze.h
> +@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
> + #define DWARF_FRAME_RETURN_COLUMN \
> + 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
> + 
> ++/* Signal frames (config/microblaze/linux-unwind.h) record the
> ++   interrupted PC in DWARF column 36, one past the hard registers,
> ++   because column 15 must keep the interrupted r15.  Declaring it as
> ++   the alternate return column makes init_dwarf_reg_size_table size
> ++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
> ++   frame, such as during pthread cancellation.  */
> ++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
> ++
> + /* Initial state of return address on entry to func = R15.
> +    Actually, the RA is at R15+8, but gcc doesn't know how
> +    to generate this.
> +diff --git a/libgcc/config.host b/libgcc/config.host
> +index 046156fa5e786..a685d5da7a107 100644
> +--- a/libgcc/config.host
> ++++ b/libgcc/config.host
> +@@ -1050,6 +1050,7 @@ mcore-*-elf)
> + 	;;
> + microblaze*-linux*)
> + 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
> ++	md_unwind_header=microblaze/linux-unwind.h
> + 	;;
> + microblaze*-*-elf)
> + 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
> +diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
> +new file mode 100644
> +index 0000000000000..b54704a065198
> +--- /dev/null
> ++++ b/libgcc/config/microblaze/linux-unwind.h
> +@@ -0,0 +1,102 @@
> ++/* DWARF2 EH unwinding support for MicroBlaze Linux.
> ++   Copyright (C) 2026 Free Software Foundation, Inc.
> ++
> ++   This file is part of GCC.
> ++
> ++   GCC is free software; you can redistribute it and/or modify
> ++   it under the terms of the GNU General Public License as published by
> ++   the Free Software Foundation; either version 3, or (at your option)
> ++   any later version.
> ++
> ++   GCC is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++   GNU General Public License for more details.
> ++
> ++   Under Section 7 of GPL version 3, you are granted additional
> ++   permissions described in the GCC Runtime Library Exception, version
> ++   3.1, as published by the Free Software Foundation.
> ++
> ++   You should have received a copy of the GNU General Public License and
> ++   a copy of the GCC Runtime Library Exception along with this program;
> ++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifndef inhibit_libc
> ++
> ++/* Do code reading to identify a signal frame, and set the frame state
> ++   data appropriately.  See unwind-dw2.c for the structs.  */
> ++
> ++#include <signal.h>
> ++#include <sys/ucontext.h>
> ++#include <asm/unistd.h>
> ++
> ++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
> ++
> ++static _Unwind_Reason_Code
> ++microblaze_fallback_frame_state (struct _Unwind_Context *context,
> ++				 _Unwind_FrameState *fs)
> ++{
> ++  const unsigned int *pc = (const unsigned int *) context->ra;
> ++  struct sigcontext *sc;
> ++  _Unwind_Ptr new_cfa;
> ++  int i;
> ++
> ++  /* The outermost frame of a thread may leave a null or near-null
> ++     return address; do not dereference it looking for the
> ++     trampoline.  */
> ++  if ((unsigned long) pc < 4096)
> ++    return _URC_END_OF_STACK;
> ++
> ++  /* The kernel writes the signal trampoline onto the stack
> ++     (struct rt_sigframe.tramp):
> ++
> ++	addik r12, r0, __NR_rt_sigreturn
> ++	brki  r14, 0x8
> ++
> ++     and sets the saved r15 to the trampoline address minus 8 (the
> ++     handler returns with "rtsd r15, 8"), so the unwound return
> ++     address points 8 bytes before the trampoline.  */
> ++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
> ++    ;
> ++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
> ++    pc += 2;
> ++  else
> ++    return _URC_END_OF_STACK;
> ++
> ++  /* The trampoline is the last member of the kernel's rt_sigframe and
> ++     the ucontext sits directly in front of it.  Anchor there rather
> ++     than at the CFA so the layout of the frame head does not matter
> ++     (the kernel may insert an ABI argument-home gap at the front).
> ++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
> ++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
> ++
> ++  sc = (struct sigcontext *) &uc->uc_mcontext;
> ++
> ++  new_cfa = sc->regs.r1;
> ++  fs->regs.cfa_how = CFA_REG_OFFSET;
> ++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
> ++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
> ++
> ++  /* pt_regs holds r0..r31 consecutively.  */
> ++  for (i = 0; i < 32; i++)
> ++    {
> ++      fs->regs.how[i] = REG_SAVED_OFFSET;
> ++      fs->regs.reg[i].loc.offset
> ++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
> ++    }
> ++
> ++  /* The interrupted PC goes into the alternate return column
> ++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
> ++     gcc/config/microblaze/microblaze.h), one past the hard registers;
> ++     column 15 above keeps the interrupted r15.  */
> ++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
> ++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
> ++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
> ++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
> ++  fs->signal_frame = 1;
> ++
> ++  return _URC_NO_REASON;
> ++}
> ++
> ++#endif
> diff --git a/package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
> new file mode 100644
> index 0000000000..f7618d6727
> --- /dev/null
> +++ b/package/gcc/16.2.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
> @@ -0,0 +1,196 @@
> +From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
> +From: Ramin Moussavi <lordrasmus@gmail.com>
> +Date: Wed, 3 Jun 2026 00:00:00 +0200
> +Subject: [PATCH] microblaze: add Linux signal frame unwinding support
> +
> +libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
> +DWARF unwinder cannot step through signal frames at all.  Anything that
> +unwinds out of a signal handler -- most prominently NPTL asynchronous
> +pthread cancellation (SIGCANCEL) -- either stops early with
> +_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
> +misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
> +
> +Add the standard fallback: recognize the two-instruction trampoline the
> +kernel writes into struct rt_sigframe on the stack
> +
> +	addik r12, r0, __NR_rt_sigreturn
> +	brki  r14, 0x8
> +
> +and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
> +is anchored relative to the trampoline (its last member) rather than to
> +the CFA, so the layout of the frame head does not matter.
> +
> +The interrupted PC is recorded in DWARF column 36, one past the hard
> +registers, because column 15 must keep the interrupted r15 (unrelated to
> +the resume address of a signal frame).  Declaring it as
> +DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
> +column; without that _Unwind_GetGR reads a zero size and aborts.
> +
> +Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
> +git, running its NPTL test suite under qemu-system-microblazeel -M
> +petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
> +9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
> +hanging in the unwinder; with it all 17 pass and the rest of the suite
> +is unchanged.  The implementation follows the mips/aarch64
> +linux-unwind.h pattern.
> +
> +gcc/ChangeLog:
> +
> +	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
> +	Define.
> +
> +libgcc/ChangeLog:
> +
> +	* config.host (microblaze*-linux*): Set md_unwind_header.
> +	* config/microblaze/linux-unwind.h: New file.
> +
> +Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
> +
> +Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
> +Signed-off-by: Neal Frager <neal.frager@amd.com>
> +---
> + gcc/config/microblaze/microblaze.h      |   8 ++
> + libgcc/config.host                      |   1 +
> + libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
> + 3 files changed, 111 insertions(+)
> + create mode 100644 libgcc/config/microblaze/linux-unwind.h
> +
> +diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
> +index 2b5bd52040f7f..fc8c4b8717545 100644
> +--- a/gcc/config/microblaze/microblaze.h
> ++++ b/gcc/config/microblaze/microblaze.h
> +@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
> + #define DWARF_FRAME_RETURN_COLUMN \
> + 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
> + 
> ++/* Signal frames (config/microblaze/linux-unwind.h) record the
> ++   interrupted PC in DWARF column 36, one past the hard registers,
> ++   because column 15 must keep the interrupted r15.  Declaring it as
> ++   the alternate return column makes init_dwarf_reg_size_table size
> ++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
> ++   frame, such as during pthread cancellation.  */
> ++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
> ++
> + /* Initial state of return address on entry to func = R15.
> +    Actually, the RA is at R15+8, but gcc doesn't know how
> +    to generate this.
> +diff --git a/libgcc/config.host b/libgcc/config.host
> +index 046156fa5e786..a685d5da7a107 100644
> +--- a/libgcc/config.host
> ++++ b/libgcc/config.host
> +@@ -1050,6 +1050,7 @@ mcore-*-elf)
> + 	;;
> + microblaze*-linux*)
> + 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
> ++	md_unwind_header=microblaze/linux-unwind.h
> + 	;;
> + microblaze*-*-elf)
> + 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
> +diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
> +new file mode 100644
> +index 0000000000000..b54704a065198
> +--- /dev/null
> ++++ b/libgcc/config/microblaze/linux-unwind.h
> +@@ -0,0 +1,102 @@
> ++/* DWARF2 EH unwinding support for MicroBlaze Linux.
> ++   Copyright (C) 2026 Free Software Foundation, Inc.
> ++
> ++   This file is part of GCC.
> ++
> ++   GCC is free software; you can redistribute it and/or modify
> ++   it under the terms of the GNU General Public License as published by
> ++   the Free Software Foundation; either version 3, or (at your option)
> ++   any later version.
> ++
> ++   GCC is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++   GNU General Public License for more details.
> ++
> ++   Under Section 7 of GPL version 3, you are granted additional
> ++   permissions described in the GCC Runtime Library Exception, version
> ++   3.1, as published by the Free Software Foundation.
> ++
> ++   You should have received a copy of the GNU General Public License and
> ++   a copy of the GCC Runtime Library Exception along with this program;
> ++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++#ifndef inhibit_libc
> ++
> ++/* Do code reading to identify a signal frame, and set the frame state
> ++   data appropriately.  See unwind-dw2.c for the structs.  */
> ++
> ++#include <signal.h>
> ++#include <sys/ucontext.h>
> ++#include <asm/unistd.h>
> ++
> ++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
> ++
> ++static _Unwind_Reason_Code
> ++microblaze_fallback_frame_state (struct _Unwind_Context *context,
> ++				 _Unwind_FrameState *fs)
> ++{
> ++  const unsigned int *pc = (const unsigned int *) context->ra;
> ++  struct sigcontext *sc;
> ++  _Unwind_Ptr new_cfa;
> ++  int i;
> ++
> ++  /* The outermost frame of a thread may leave a null or near-null
> ++     return address; do not dereference it looking for the
> ++     trampoline.  */
> ++  if ((unsigned long) pc < 4096)
> ++    return _URC_END_OF_STACK;
> ++
> ++  /* The kernel writes the signal trampoline onto the stack
> ++     (struct rt_sigframe.tramp):
> ++
> ++	addik r12, r0, __NR_rt_sigreturn
> ++	brki  r14, 0x8
> ++
> ++     and sets the saved r15 to the trampoline address minus 8 (the
> ++     handler returns with "rtsd r15, 8"), so the unwound return
> ++     address points 8 bytes before the trampoline.  */
> ++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
> ++    ;
> ++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
> ++    pc += 2;
> ++  else
> ++    return _URC_END_OF_STACK;
> ++
> ++  /* The trampoline is the last member of the kernel's rt_sigframe and
> ++     the ucontext sits directly in front of it.  Anchor there rather
> ++     than at the CFA so the layout of the frame head does not matter
> ++     (the kernel may insert an ABI argument-home gap at the front).
> ++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
> ++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
> ++
> ++  sc = (struct sigcontext *) &uc->uc_mcontext;
> ++
> ++  new_cfa = sc->regs.r1;
> ++  fs->regs.cfa_how = CFA_REG_OFFSET;
> ++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
> ++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
> ++
> ++  /* pt_regs holds r0..r31 consecutively.  */
> ++  for (i = 0; i < 32; i++)
> ++    {
> ++      fs->regs.how[i] = REG_SAVED_OFFSET;
> ++      fs->regs.reg[i].loc.offset
> ++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
> ++    }
> ++
> ++  /* The interrupted PC goes into the alternate return column
> ++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
> ++     gcc/config/microblaze/microblaze.h), one past the hard registers;
> ++     column 15 above keeps the interrupted r15.  */
> ++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
> ++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
> ++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
> ++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
> ++  fs->signal_frame = 1;
> ++
> ++  return _URC_NO_REASON;
> ++}
> ++
> ++#endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
