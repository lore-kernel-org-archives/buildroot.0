Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B15C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB42580F4B;
	Fri,  4 Jul 2025 06:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwJJ0RyvAD8u; Fri,  4 Jul 2025 06:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7EE80EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA7EE80EBF;
	Fri,  4 Jul 2025 06:47:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 881877AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E29E80DA1
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVeWqNPMMpmt for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65E0780CF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E0780CF2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65E0780CF2
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so326608f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611665; x=1752216465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xffNXZgvMaVXTmQC4BPCZtDoDESRYQwC/S6Ngv9RA9M=;
 b=a7XQd9rk/eVTPlFDGWfbDoUPfXH/jGhqOSHKOaxTzwJnUddn+/4CS7+aaLo0uyHsfg
 PqzMeFP0xHvKXLL5GEO2dde1gBQ/pAsrMuUzHBY6NfpM07Hzih9V1AlRCalTTNjjhnX2
 625HKzyv7X9eR/gYnb3Z06qSc2xKb3qdcP70Zap8R6IRviWaYDq7xKSD93JxixmNQJGk
 fwF06ukwdr4aP9KFO2Fcnngj/T2yEjn9yqQzRBbCOUWzngfvG9dVtx6CH3Tv6pPFL3BY
 RIspTlw1o59IJoAWGZjwNQfzQ3lCOdVHBqv3gD/ASJ6szidxfz0N2kv/VS4rzBceTIpR
 avzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuOCupUGGTKZDf2BjxU12O7/NvGVHklgfPqrQ1SUkcokpJma87qB4/Aktxx6UDAvYxSRwW5CXKh5A=@buildroot.org
X-Gm-Message-State: AOJu0Yxjq6duPSRIGYsdo870lXSMTm3iuAuWLEl4X+PeSV+C7QP8O77R
 pzuUXd0O+QtxAp3WJOwBkHOPk+cKO/O2GGOyBZUJ8eOAqK1koPcKUy9tkdyfc5DM994=
X-Gm-Gg: ASbGnctGj3oUyZ/F/N+NES8T0DEKT8vMmH3MNCeLLOuPNOiPqc3Aed3NuOesKLedBL6
 ov4lJRzixybR+Jw7ewHfxtB+teuaVdXv11hY2Fh/Uhwi4aa/NwUicem4i8Eh5gN74wJMaVN2OIc
 usgyJNpVeHpfKIqSQWWuN3zGRFWKyip52YN1LJBavw9H76mzcAQJU7qFDdxLHHH3E1I0vFtN684
 hNjG6+1h+KVwBs9f2PpPIkICmGjId56pwRdixGvMyKAIZq56Q/SYcDRScSR+C7xJaP/nvGPYcyV
 pzku8y+IY5YYnQTU4/7IGR5O/mWEXaYn10AF7QimhxcVdGb6u2B9t5EglS4frowOBW29MLSOdEh
 2kJeZJZUY8w==
X-Google-Smtp-Source: AGHT+IF7K0tN5ArCsKITuwzGK8VUXtmL0UFoKikEgJ/iaV8ScdZnTqJtMGBhuIcuP07GVYAKbkNKKw==
X-Received: by 2002:a05:6000:4802:b0:3a4:f7e7:3630 with SMTP id
 ffacd0b85a97d-3b495cb0162mr1250570f8f.15.1751611665447; 
 Thu, 03 Jul 2025 23:47:45 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a67csm1641598f8f.79.2025.07.03.23.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:44 +0200
Message-ID: <20250704064744.4064975-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250621122724.957110-1-bernd@kuhls.net>
References: <20250621122724.957110-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611665; x=1752216465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xffNXZgvMaVXTmQC4BPCZtDoDESRYQwC/S6Ngv9RA9M=;
 b=Ns1AqZ26Wt4DfPfgFj48bivKPlpBxAq8YQPsNZvLA7UQIP1JgfEA7D6oMHpfdPpDS7
 di4urUMC8g6VHRXC7Aj05niCucQ8oq+JTuSzjmxDex7bQAYp2+4UzTsGSn+nVqaMsTam
 mrhyMH8qwxGASf85yTdGkH0aKKUEizrenbRb16N6fs8R5beV5lGOug1A5N3V6D8+oaJT
 PaLkgzftzeL4AK9tDlVO6UhGvyzuVUeY1rHbtls9ojgiq+Yy6gv71pgSsm0Ztzr9q9yw
 q99sHqeSpsReevrQvmUs4qS243In6C3wb2yEdGNEjJHHd4ixeCHIscf3wt0Gst+dtYj1
 /LPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ns1AqZ26
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: remove stale patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit 8f69974c20fbc7dc642be62a0ef3fb2941f5bb35 switched the
> buildsystem of mpv from waf to meson but forgot to remove a patch which
> fixed a waf-related build error.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  .checkpackageignore                          |  1 -
>  package/mpv/0001-fix-powerpc64-altivec.patch | 32 --------------------
>  2 files changed, 33 deletions(-)
>  delete mode 100644 package/mpv/0001-fix-powerpc64-altivec.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0534465eb3..cb3d3bc33b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -814,7 +814,6 @@ package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch l
>  package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
>  package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
> -package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
>  package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
>  package/mrouted/S41mrouted NotExecutable
>  package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
> diff --git a/package/mpv/0001-fix-powerpc64-altivec.patch b/package/mpv/0001-fix-powerpc64-altivec.patch
> deleted file mode 100644
> index 45983fec8f..0000000000
> --- a/package/mpv/0001-fix-powerpc64-altivec.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Subject: [PATCH] Work around bool type redefinition by altivec
> -
> -On powerpc64le, the SDL header may include altivec.h and this
> -(combined with -std=c99) will cause a compile failure due to bool
> -being redefined as a vector type.
> -
> -Adjust the compiler flags to add -std=gnu99 (which is compatible with
> -altivec) when using gcc. The generic flag '-std=c99' is left in place for other
> -compilers (in the gcc case it is overridden by the (later) gnu flag).
> -
> -Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ----
> - waftools/detections/compiler.py | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
> -index 5bbba87..50836a2 100644
> ---- a/waftools/detections/compiler.py
> -+++ b/waftools/detections/compiler.py
> -@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
> -                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
> -                        "-Wno-pointer-sign",
> -                        # GCC bug 66425
> --                       "-Wno-unused-result"]
> -+                       "-Wno-unused-result",
> -+                       "-std=gnu99"]
> - 
> - def __add_clang_flags__(ctx):
> -     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
> --- 
> -2.10.0.297.gf6727b0
> -
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
