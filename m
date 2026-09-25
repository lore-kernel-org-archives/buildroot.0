Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9429BC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9F760DE1;
	Fri, 25 Sep 2026 14:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y20wz4yiN0yT; Fri, 25 Sep 2026 14:44:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 60F08606BB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347484;
	b=NoW6ndFen9FuhP60/p8UItHX2dGbEVuYfe86d+bkISDfBV3W6haNsZZ/dm++ji9AVWXs
	 TvVPToxycAtomgCngfw1zPG/GmAsWcjO0j7wfOmgrMnMhVtkjDF/JNiSws9PA9kHxcrr9
	 cwGuFzqoEP80pOY9Ny5viZ8p9jmn/JrQKKFBFxQVBfeVvQ20Et9Vu98VnA7yFtdFhWXvK
	 3nIBByOmQy9mCyhAZEEwTNQIod23CQMaWzN0KW3Ni/1OFG2CXv/ME4DZfzrvVhyXs6RTH
	 2kmZb1HKNPTQOlVdvZ2ToHbzm92CDSbhKK2c6hX0ECXpVprup1AqtJKBUP0GrGGCAUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QAoqaY4VpVz4yOuV8FBhFIMT1jGdFnwazjaWdpW+p9M=;
	b=hdaixpudG6Le4NhVpoVMcaBbZ4qsupVn39J4+G3+4yU1LiBj+GxGIgNvoiNtFJeiPaIa
	 L6a1Vle9shdNd+78bAVQY1PPShJO+ddxcgAbnhBJEh5q52qNMvVfOD6z0KR6lYEM66J6u
	 gYvOB4fdYHeQq9fyRCflN6+3HFciANV9cxrsH+g+vLtNEXGAgw+JjoO9f2ONcNnWxCJhJ
	 1GrFO8u2r7IUJFpqnr+ExiOUw9P67yQbWmU883B5CtbmlnvrVelx5oiWsS5OHYyl0fK/R
	 abnXK5ic6+1OJphmHAV53r40uXw9B0Vy1MIdXTcP11HdszVD/hLJIBN3hOM4hi/3qWw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347484;
	bh=QAoqaY4VpVz4yOuV8FBhFIMT1jGdFnwazjaWdpW+p9M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kbjAAjyFLttzzf9CuwXxI3EFjkEMV+wg0+DZx5kqFv/d/ILIxdDUByg9ieauErsnw
	 zl4PfS+RPtHYdSXQ4+TBh2eIEfuiUx++c3V1NVU1CITX8bw+kkAwObVTHAk+xrWPER
	 BJ4oT1fmOob2FT0V3fojgGeV1gw/8tRC9X0yHrj/6oZ5QQriJ52DQr02KWoH96utlp
	 QJE0+hdjSOEbedV0xqIMD563n1TQXQGS2oGEiPz7Bg6bFnQ4BvsysQkIS2UwmZI2fv
	 WKtDtbIfDxlh599DOM8wWwSRp9KBj5ecu3tmpsRF+MiKmK/PUpNymqtSkJv03X4KMa
	 7FhBr4fQjo+TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F08606BB;
	Fri, 25 Sep 2026 14:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B38E2334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9979781336
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m96SoURmaZ1E for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7F6B781327
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347481;
 b=nwbOnynNxB0vI6UFRpgg77vvubusKphnVGEMFMCaflcdrRg3TlGWdZlem/NNoAu4/wxm
 zDUl377vfcfodZsEQx3QgE0W5Qbak78VVcIW+TDkPIOOYSpS/cziqDyZNN6+vg1gsT8vb
 5Ebd8xPj9P6wLqFP5FKhwz3Xli+Dg3lvFiuG13OiXQHYPlzg+7RuzFsYi2zZsQ1ynHF8/
 EFxnV2LE9Q8xqJaGLgPdqsOgvkiCXBPKZgk+deW5NUckqydUfHHENR9nkoMA9aqEVLmpO
 R3b8g6SoeRC+LfAhjc/GK3HB+bxEZ9WVRTjD1evKasGrmmhrqu60EDqvODVHvfqhYIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347481;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zdIolq3DFYaFGv7BbnGLNMqv7IymX4jo+mDx4xeEXe0=;
 b=O3isknuArICzyXHFQYebGr3Rogzbb5bqDGm8CV5Q2Y9CNHzpmRmnioT9DS7GX/dnN5xp
 yG3ua2d+F2oWGRnnGChpYnzcKtEq8dBKT2QLOkObav30yb21XaCyb+lpV9cNYGC6DN3FH
 bHxLi4vHPOks+wORQ1FNnECYdGChBr0smlJI4jloue5wQV98DmMzrTEKrLcyHr9fxhm9W
 ERiF+Lys3x/4zmfk8Q4iiMVd0aRr/xgTERKGfV13eojfBLGZLTKHD3CEibgYVfN9txLQl
 GinRV9CHbkrQTRxKKzjawQQwMgBQcfZYOHy4lBb+VWZ9Lss1WhOlR9IwxCadzVGZwTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a3Efo0ya; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F6B781327
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:41 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so6881975e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347479; x=1790952279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zdIolq3DFYaFGv7BbnGLNMqv7IymX4jo+mDx4xeEXe0=;
 b=KnNpXTkSx0ybx2ec/HhK0HckdbVH4sL6q2p6hDECGZl2jyxrEDOZBXeb5oHmE4w7vW
 f4L6p70vBstJ8NbfGLwMd3BIqFouDT8VU1m50L/a5NsQyGBSwR7JcfWrEaEMehPMN0hr
 6MzX8cl0vfmIBEt4cfcWLh6xFzlGwzFYhXXPPAbvVrfgaNoUF08DdDkNyoOVjsFD+555
 qGpTUqszFoS6IrlPcwoknOH3iPvFefD7yb6AgRY6tUUYgIUJk0rq01aIZ8I8otji4lf1
 Q9zHW3P6w0VghWWKVCoiieF8AQkr4IkfJeaa1MVqMe+9neFliaOxejJXAaleZrqdBfPp
 D/9A==
X-Gm-Message-State: AFuF++laCMsJXosZ8+znvk73Nl08HCiKKAuK70H1YT+WJLcyWXg2RyE0
 2BT+isbsny4YWJ/O2icRZpHQso0A8dHJbbx7pmKP25TA8rwJXdS35g1FnBbw6ZqWLEHXTaiQIXH
 /9VOmLoIJQg==
X-Gm-Gg: AYBFou2emAivOxq+8MvkdDhEjN9vmWqjOX467rSLaIfobdRLjx3Pc3WYhlwSSYc48tq
 7N6Wjl5+nz+5ChmYbLGVFu01E6rk1ryMWSec+afxdE8GDieSQ+EqaDVPbWHpdHpwMxYanrO4+di
 Q7Er1G0Hj24X/X75V8jUuWV6/oYjx6Yc66/Q+cFO9tgAbff+0wjdxxnbPkR00hxwRn4oHtRy2N3
 FJi8TzYT7TvcG0FGNLxBjqP/hzIDSrTaiDnNLmBwivdui97yg5NvAMKteJaxCP9aPKRLkA+b+p2
 41iLa4CNCOblwuSScNhKpRL6ItipWWGaS1tMrPQtuGVInfuVmUl+sfSXMFnKGcjFUIW0LxdVDth
 YjuaBXsMLQKA6hT+U4exEMTeFfZGEbMMEe+R8kEka16o3256zse62PVM5duoGP0l6jQGWRpwZR+
 H38xwADgO05z6bsKx30u33foMJK7LQjag2NgRlKWsfvfrp7+C5jsuFYtPQNVFiHWR4uZVWnyFPF
 tu1C9xy7z9GCGXCYmA02DPU0mG/7BEeDDG/Ra5qOw==
X-Received: by 2002:a05:600c:4f0c:b0:49e:8418:389d with SMTP id
 5b1f17b1804b1-49fe66c6160mr119109725e9.9.1790347479636; 
 Fri, 25 Sep 2026 07:44:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff0f1f2e3sm105577465e9.0.2026.09.25.07.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:39 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:36 +0200
Message-ID: <20260925144438.4096497-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914092612.1283030-1-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/qemu: host-qemu does not support
 AVX512 CPUs
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
> Building gobject-introspection for an x86 CPU variant with AVX512 fails
> when g-ir-scanner runs the freshly built target binaries under
> qemu-user:
> 
>   qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> 
> The Qemu TCG engine implements AVX, AVX2, F16C, FMA3 and VAES since Qemu
> 7.2, but it does not implement the AVX512 instruction set at all [0].
> Therefore no -cpu value passed through
> BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS can make such binaries run, and
> user-mode emulation is simply not possible for these CPU variants.
> 
> Mark those CPUs as unsupported by host-qemu, the same way it is already
> done for x86_steamroller and x86_core_avx2. This relies on the existing
> BR2_X86_CPU_HAS_AVX512 symbol, so all AVX512 capable variants are
> covered, and it disables gobject-introspection and nodejs, which are the
> two packages needing host-qemu in user mode.
> 
> [0] https://gitlab.com/qemu-project/qemu/-/issues/2878
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/qemu/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index c7dd5876e5..e5379e7224 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -23,6 +23,10 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_xtensa
>  	default y if BR2_x86_64
>  	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
> +	# The Qemu TCG engine does not implement the AVX512
> +	# instruction set, so binaries built for such CPUs cannot be
> +	# emulated.
> +	depends on !BR2_X86_CPU_HAS_AVX512
>  	depends on !BR2_powerpc_620 && !BR2_powerpc_630
>  
>  config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
