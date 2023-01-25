Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9026C27C76
	for <buildroot@archiver.kernel.org>; Wed, 25 Jan 2023 15:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BB3B41963;
	Wed, 25 Jan 2023 15:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB3B41963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ecz31dO2lFII; Wed, 25 Jan 2023 15:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032E64195B;
	Wed, 25 Jan 2023 15:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032E64195B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD531BF592
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 15:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5FF9408E9
 for <buildroot@lists.busybox.net>; Wed, 25 Jan 2023 15:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5FF9408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8SML9cUDEY5 for <buildroot@lists.busybox.net>;
 Wed, 25 Jan 2023 15:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1280400A4
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1280400A4
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 15:37:09 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so268482277b3.8
 for <buildroot@buildroot.org>; Wed, 25 Jan 2023 07:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dxxsaXC0CLpVzJhUmivYlgmX/GvRyHVLayZcIRQcQbA=;
 b=J4eV/ZhoSsEg4t4qqdE/bOmz21Ord5eTpLDuWD7/llc1/t/DI3Sa/gExOQ73ix49fC
 /LgAqtlQhgwxqXes58yEp43F2HVnhXqnfxBy+o+g/WMfNX6PZIOaeB+RIT/4NNcFaKwJ
 hMnAhjH1f7krCk/y8e+8gGcV0nTpfPxsj4omMF58tIoceA6aku+2BjdNFasBCjd9vn2W
 5BxJ7+EqDq3N272mA+WAnFfX6BNMjyxP5vesEhGwVBkzl2R4wGoJOnV3aAV2kebAMV9B
 PszM9hgYdOekH4zYvcef9ItsglWnQaT1b0wgE+eJEfq1JagL5xCDATSvs2pqebQv2tOg
 cpzg==
X-Gm-Message-State: AFqh2krKENvvKJLkg60MzvotpUVa5Vf6lJhAAxXElOGZTzGA+VMeGgb6
 /QlZTr/Frdl4SOIpb44WSA+TLHXureb9nH4z9R133g==
X-Google-Smtp-Source: AMrXdXuOs/Xp8LJBfyt4pyv1u236DKzLiwgXRoJu37L/AKfalkTGos7Pd0MI7kmg5fh4IQTWo/bNOfpFGCzt9cAvbho=
X-Received: by 2002:a0d:f186:0:b0:3b5:1538:c19 with SMTP id
 a128-20020a0df186000000b003b515380c19mr4653353ywf.210.1674661027783; Wed, 25
 Jan 2023 07:37:07 -0800 (PST)
MIME-Version: 1.0
References: <CANtE+cKcemOj_DTSOZ_TzuThSrXBwah38WJYM-AVH1nGTJikDw@mail.gmail.com>
 <20230121151815.GD558596@scaer>
In-Reply-To: <20230121151815.GD558596@scaer>
Date: Wed, 25 Jan 2023 21:06:56 +0530
Message-ID: <CANtE+c+-9WfkPOnQ-SzNokO46cZv0PZ3Awory61kSRuMPBPNLw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="000000000000ae788505f31867f6"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cradlewise-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dxxsaXC0CLpVzJhUmivYlgmX/GvRyHVLayZcIRQcQbA=;
 b=Oh59b7/I+V15uaO8YlZYYR+cViEVNyAON2XoqHXFC97bFXAsqQykzfvNIuklGD2WXH
 KfHzoaVa8osOTaOItvZ4J/s7wGAkAwOPQELPmsaAjqGsJtfdJAjYdYOIWft72I06BH1Z
 e/WRNgohGhnPySKMLRuNeHuNRv2G8g+13tizlA0DLUSuVk9oIDm7Mw4Ysy+WKYSAo7ZD
 Wlw7ts4DPBlUPlzYYYOx1PxbNlEulD1wCq2k+cwS289OMMcsKoo3Jv1XdFeHk3k92N9w
 YUDkiSRClxqCtknalnbLhpxdV2rGiMipCpzWks2/A7FsqPBBXjiSMwU719x7mQ8iOOmz
 8ScQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=cradlewise-com.20210112.gappssmtp.com
 header.i=@cradlewise-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Oh59b7/I
Subject: Re: [Buildroot] Not able to build python-numpy 1.23.5 on buildroot
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
From: Prasad Sankaran via buildroot <buildroot@buildroot.org>
Reply-To: Prasad Sankaran <prasad@cradlewise.com>
Cc: Archit Taneja <archit@cradlewise.com>, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000ae788505f31867f6
Content-Type: multipart/alternative; boundary="000000000000ae788205f31867f4"

--000000000000ae788205f31867f4
Content-Type: text/plain; charset="UTF-8"

Hello Yann,

Sorry for the late reply. I have attached the defconfig which we use.
Ideally the AVX optimized SVML source files should be excluded for the
aarch64 target. But it is not happening.
Wondering if you could figure out how it works at your end.

This is the command generated by buildroot for linking numpy.
/home/prasad/work/buildroot/tfbuild/main/host/bin/aarch64-buildroot-linux-gnu-gcc
-shared -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/argfunc.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_unary_fp.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_arithm_fp.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_arithmetic.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_minmax.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_trigonometric.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_umath_fp.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_exponent_log.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_hyperbolic.dispatch.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_modulo.dispatch.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/abstractdtypes.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/alloc.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/arrayobject.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/arraytypes.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/array_coercion.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/array_method.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/array_assign_scalar.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/array_assign_array.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/arrayfunction_override.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/buffer.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/calculation.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/compiled_base.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/common.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/common_dtype.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/convert.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/convert_datatype.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/conversion_utils.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/ctors.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/datetime.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/datetime_strings.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/datetime_busday.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/datetime_busdaycal.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/descriptor.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dlpack.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dtypemeta.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dragon4.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dtype_transfer.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/einsum.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/einsum_sumprod.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/experimental_public_dtype_api.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/flagsobject.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/getset.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/hashdescr.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/item_selection.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/iterators.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/legacy_dtype_implementation.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/lowlevel_strided_loops.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/mapping.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/methods.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/multiarraymodule.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/nditer_templ.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/nditer_api.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/nditer_constr.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/nditer_pywrap.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/number.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/refcount.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/sequence.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/shape.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/scalarapi.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/scalartypes.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/strfuncs.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/temp_elide.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/typeinfo.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/usertypes.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/vdot.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/conversions.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/field_types.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/growth.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/readtext.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/rows.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/stream_pyobject.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/str_to_int.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/umathmodule.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/reduction.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/matmul.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/dispatching.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/legacy_array_method.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/wrapping_array_method.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/ufunc_object.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/extobj.o
build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/scalarmath.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/ufunc_type_resolution.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/override.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/_scaled_float_dtype.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/array_assign.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/mem_overlap.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/npy_argparse.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/npy_hashtable.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/npy_longdouble.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/ucsnarrow.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/ufunc_override.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/numpyos.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/npy_cpu_features.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/cblasfuncs.o
build/temp.linux-x86_64-3.8/numpy/core/src/common/python_xerbla.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/quicksort.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/mergesort.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/timsort.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/heapsort.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/radixsort.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/selection.o
build/temp.linux-x86_64-3.8/numpy/core/src/npysort/binsearch.o
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/tokenize.o
build/temp.linux-x86_64-3.8/numpy/core/src/umath/clip.o
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_acosh_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_acosh_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_asin_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_asin_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_asinh_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_asinh_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_atan2_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_atan2_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_atan_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_atan_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_atanh_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_atanh_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_cbrt_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_cbrt_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_cos_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_cos_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_cosh_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_cosh_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_exp2_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_exp2_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_exp_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_exp_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_expm1_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_expm1_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log10_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log10_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log1p_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log1p_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log2_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log2_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_log_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_pow_
d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_pow_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_sin_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_sin_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_sinh_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_sinh_s_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_tan_d_la.s
numpy/core/src/umath/svml/linux/avx512/svml_z0_tan_s_la.s
-L/home/prasad/work/buildroot/tfbuild/main/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib
-L/home/prasad/work/buildroot/tfbuild/main/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Lbuild/temp.linux-x86_64-3.8 -lnpymath -lopenblas -lopenblas -lm -o
build/lib.linux-x86_64-3.8/numpy/core/_
multiarray_umath.cpython-38-aarch64-linux-gnu.so


On Sat, Jan 21, 2023 at 8:48 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Prasad, All,
>
> On 2023-01-21 20:12 +0530, Prasad Sankaran via buildroot spake thusly:
> > The following errors are reported while generating numpy/core/_ [1]
> multiarray_umath.cpython-38-aarch64-linux-gnu.so using
> > aarch64-buildroot-linux-gnu-gcc.
> > Is there a way to avoid including AVX512 .s files from the compilation?
> >
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:19: Error:
> unknown mnemonic   pushq' -- pushq %rbp'
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:21: Error:
> unknown mnemonic   movq' -- movq %rsp,%rbp'
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:24: Error:
> unknown mnemonic   andq' -- andq $-64,%rsp'
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:25: Error:
> unknown mnemonic   subq' -- subq $192,%rsp'
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:26: Error:
> unknown mnemonic   vmovups' -- vmovups
> > __svml_dacos_data_internal(%rip),%zmm7'
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:27: Error:
> unknown mnemonic   vmovups' -- vmovups
> > 64+__svml_dacos_data_internal(%rip),%zmm8'
> > numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:30: Error:
> unknown mnemonic   vmovups' -- vmovups
> > 128+__svml_dacos_data_internal(%rip),%zmm11'
>
> I was not able to reproduce such an error here, with the following
> defconfig and master as of commit f090116066:
>
>     BR2_aarch64=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>     BR2_PER_PACKAGE_DIRECTORIES=y
>     BR2_PACKAGE_PYTHON3=y
>     BR2_PACKAGE_PYTHON_NUMPY=y
>
> Can you share a _minimal_ defconfig that exhibits the issue?
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--000000000000ae788205f31867f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Yann,</div><div><br></div><div>Sorry for the la=
te reply. I have attached the defconfig which we use. <br></div><div>Ideall=
y the AVX optimized SVML source files should be excluded for the aarch64 ta=
rget. But it is not happening. <br></div><div>Wondering if you could figure=
 out how it works at your end.</div><div><br></div><div>This is the command=
 generated by buildroot for linking numpy.<br></div><div>/home/prasad/work/=
buildroot/tfbuild/main/host/bin/aarch64-buildroot-linux-gnu-gcc -shared -D_=
LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Os -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 build/temp.linu=
x-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/argfunc.d=
ispatch.o build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core=
/src/umath/loops_unary_fp.dispatch.o build/temp.linux-x86_64-3.8/build/src.=
linux-x86_64-3.8/numpy/core/src/umath/loops_arithm_fp.dispatch.o build/temp=
.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_ari=
thmetic.dispatch.o build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/n=
umpy/core/src/umath/loops_minmax.dispatch.o build/temp.linux-x86_64-3.8/bui=
ld/src.linux-x86_64-3.8/numpy/core/src/umath/loops_trigonometric.dispatch.o=
 build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umat=
h/loops_umath_fp.dispatch.o build/temp.linux-x86_64-3.8/build/src.linux-x86=
_64-3.8/numpy/core/src/umath/loops_exponent_log.dispatch.o build/temp.linux=
-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops_hyperboli=
c.dispatch.o build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/c=
ore/src/umath/loops_modulo.dispatch.o build/temp.linux-x86_64-3.8/numpy/cor=
e/src/multiarray/abstractdtypes.o build/temp.linux-x86_64-3.8/numpy/core/sr=
c/multiarray/alloc.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/=
arrayobject.o build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/=
core/src/multiarray/arraytypes.o build/temp.linux-x86_64-3.8/numpy/core/src=
/multiarray/array_coercion.o build/temp.linux-x86_64-3.8/numpy/core/src/mul=
tiarray/array_method.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarra=
y/array_assign_scalar.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarr=
ay/array_assign_array.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarr=
ay/arrayfunction_override.o build/temp.linux-x86_64-3.8/numpy/core/src/mult=
iarray/buffer.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/calcu=
lation.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/compiled_bas=
e.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/common.o build/te=
mp.linux-x86_64-3.8/numpy/core/src/multiarray/common_dtype.o build/temp.lin=
ux-x86_64-3.8/numpy/core/src/multiarray/convert.o build/temp.linux-x86_64-3=
.8/numpy/core/src/multiarray/convert_datatype.o build/temp.linux-x86_64-3.8=
/numpy/core/src/multiarray/conversion_utils.o build/temp.linux-x86_64-3.8/n=
umpy/core/src/multiarray/ctors.o build/temp.linux-x86_64-3.8/numpy/core/src=
/multiarray/datetime.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarra=
y/datetime_strings.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/=
datetime_busday.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dat=
etime_busdaycal.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/des=
criptor.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dlpack.o bu=
ild/temp.linux-x86_64-3.8/numpy/core/src/multiarray/dtypemeta.o build/temp.=
linux-x86_64-3.8/numpy/core/src/multiarray/dragon4.o build/temp.linux-x86_6=
4-3.8/numpy/core/src/multiarray/dtype_transfer.o build/temp.linux-x86_64-3.=
8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/einsum.o build/temp.=
linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/einsu=
m_sumprod.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/experimen=
tal_public_dtype_api.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarra=
y/flagsobject.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/getse=
t.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/hashdescr.o build=
/temp.linux-x86_64-3.8/numpy/core/src/multiarray/item_selection.o build/tem=
p.linux-x86_64-3.8/numpy/core/src/multiarray/iterators.o build/temp.linux-x=
86_64-3.8/numpy/core/src/multiarray/legacy_dtype_implementation.o build/tem=
p.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiarray/low=
level_strided_loops.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray=
/mapping.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/methods.o =
build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/multiarraymodule.o bu=
ild/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/multiar=
ray/nditer_templ.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/nd=
iter_api.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/nditer_con=
str.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/nditer_pywrap.o=
 build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/number.o build/temp.=
linux-x86_64-3.8/numpy/core/src/multiarray/refcount.o build/temp.linux-x86_=
64-3.8/numpy/core/src/multiarray/sequence.o build/temp.linux-x86_64-3.8/num=
py/core/src/multiarray/shape.o build/temp.linux-x86_64-3.8/numpy/core/src/m=
ultiarray/scalarapi.o build/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.=
8/numpy/core/src/multiarray/scalartypes.o build/temp.linux-x86_64-3.8/numpy=
/core/src/multiarray/strfuncs.o build/temp.linux-x86_64-3.8/numpy/core/src/=
multiarray/temp_elide.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarr=
ay/typeinfo.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/usertyp=
es.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/vdot.o build/tem=
p.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/conversions.o buil=
d/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/field_types.o=
 build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/growth.o=
 build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/readtext=
.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/rows.o=
 build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading/stream_p=
yobject.o build/temp.linux-x86_64-3.8/numpy/core/src/multiarray/textreading=
/str_to_int.o build/temp.linux-x86_64-3.8/numpy/core/src/umath/umathmodule.=
o build/temp.linux-x86_64-3.8/numpy/core/src/umath/reduction.o build/temp.l=
inux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/loops.o bui=
ld/temp.linux-x86_64-3.8/build/src.linux-x86_64-3.8/numpy/core/src/umath/ma=
tmul.o build/temp.linux-x86_64-3.8/numpy/core/src/umath/dispatching.o build=
/temp.linux-x86_64-3.8/numpy/core/src/umath/legacy_array_method.o build/tem=
p.linux-x86_64-3.8/numpy/core/src/umath/wrapping_array_method.o build/temp.=
linux-x86_64-3.8/numpy/core/src/umath/ufunc_object.o build/temp.linux-x86_6=
4-3.8/numpy/core/src/umath/extobj.o build/temp.linux-x86_64-3.8/build/src.l=
inux-x86_64-3.8/numpy/core/src/umath/scalarmath.o build/temp.linux-x86_64-3=
.8/numpy/core/src/umath/ufunc_type_resolution.o build/temp.linux-x86_64-3.8=
/numpy/core/src/umath/override.o build/temp.linux-x86_64-3.8/numpy/core/src=
/umath/_scaled_float_dtype.o build/temp.linux-x86_64-3.8/numpy/core/src/com=
mon/array_assign.o build/temp.linux-x86_64-3.8/numpy/core/src/common/mem_ov=
erlap.o build/temp.linux-x86_64-3.8/numpy/core/src/common/npy_argparse.o bu=
ild/temp.linux-x86_64-3.8/numpy/core/src/common/npy_hashtable.o build/temp.=
linux-x86_64-3.8/numpy/core/src/common/npy_longdouble.o build/temp.linux-x8=
6_64-3.8/numpy/core/src/common/ucsnarrow.o build/temp.linux-x86_64-3.8/nump=
y/core/src/common/ufunc_override.o build/temp.linux-x86_64-3.8/numpy/core/s=
rc/common/numpyos.o build/temp.linux-x86_64-3.8/numpy/core/src/common/npy_c=
pu_features.o build/temp.linux-x86_64-3.8/numpy/core/src/common/cblasfuncs.=
o build/temp.linux-x86_64-3.8/numpy/core/src/common/python_xerbla.o build/t=
emp.linux-x86_64-3.8/numpy/core/src/npysort/quicksort.o build/temp.linux-x8=
6_64-3.8/numpy/core/src/npysort/mergesort.o build/temp.linux-x86_64-3.8/num=
py/core/src/npysort/timsort.o build/temp.linux-x86_64-3.8/numpy/core/src/np=
ysort/heapsort.o build/temp.linux-x86_64-3.8/numpy/core/src/npysort/radixso=
rt.o build/temp.linux-x86_64-3.8/numpy/core/src/npysort/selection.o build/t=
emp.linux-x86_64-3.8/numpy/core/src/npysort/binsearch.o build/temp.linux-x8=
6_64-3.8/numpy/core/src/multiarray/textreading/tokenize.o build/temp.linux-=
x86_64-3.8/numpy/core/src/umath/clip.o numpy/core/src/umath/svml/linux/avx5=
12/svml_z0_acos_d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_=
s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_acosh_d_la.s numpy/co=
re/src/umath/svml/linux/avx512/svml_z0_acosh_s_la.s numpy/core/src/umath/sv=
ml/linux/avx512/svml_z0_asin_d_la.s numpy/core/src/umath/svml/linux/avx512/=
svml_z0_asin_s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_asinh_d_=
la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_asinh_s_la.s numpy/core=
/src/umath/svml/linux/avx512/svml_z0_atan2_d_la.s numpy/core/src/umath/svml=
/linux/avx512/svml_z0_atan2_s_la.s numpy/core/src/umath/svml/linux/avx512/s=
vml_z0_atan_d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_atan_s_la=
.s numpy/core/src/umath/svml/linux/avx512/svml_z0_atanh_d_la.s numpy/core/s=
rc/umath/svml/linux/avx512/svml_z0_atanh_s_la.s numpy/core/src/umath/svml/l=
inux/avx512/svml_z0_cbrt_d_la.s numpy/core/src/umath/svml/linux/avx512/svml=
_z0_cbrt_s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_cos_d_la.s n=
umpy/core/src/umath/svml/linux/avx512/svml_z0_cos_s_la.s numpy/core/src/uma=
th/svml/linux/avx512/svml_z0_cosh_d_la.s numpy/core/src/umath/svml/linux/av=
x512/svml_z0_cosh_s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_exp=
2_d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_exp2_s_la.s numpy/c=
ore/src/umath/svml/linux/avx512/svml_z0_exp_d_la.s numpy/core/src/umath/svm=
l/linux/avx512/svml_z0_exp_s_la.s numpy/core/src/umath/svml/linux/avx512/sv=
ml_z0_expm1_d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_expm1_s_l=
a.s numpy/core/src/umath/svml/linux/avx512/svml_z0_log10_d_la.s numpy/core/=
src/umath/svml/linux/avx512/svml_z0_log10_s_la.s numpy/core/src/umath/svml/=
linux/avx512/svml_z0_log1p_d_la.s numpy/core/src/umath/svml/linux/avx512/sv=
ml_z0_log1p_s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_log2_d_la=
.s numpy/core/src/umath/svml/linux/avx512/svml_z0_log2_s_la.s numpy/core/sr=
c/umath/svml/linux/avx512/svml_z0_log_d_la.s numpy/core/src/umath/svml/linu=
x/avx512/svml_z0_log_s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_=
pow_<br>d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_pow_s_la.s nu=
mpy/core/src/umath/svml/linux/avx512/svml_z0_sin_d_la.s numpy/core/src/umat=
h/svml/linux/avx512/svml_z0_sin_s_la.s numpy/core/src/umath/svml/linux/avx5=
12/svml_z0_sinh_d_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_sinh_=
s_la.s numpy/core/src/umath/svml/linux/avx512/svml_z0_tan_d_la.s numpy/core=
/src/umath/svml/linux/avx512/svml_z0_tan_s_la.s -L/home/prasad/work/buildro=
ot/tfbuild/main/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib -L/home/pr=
asad/work/buildroot/tfbuild/main/host/aarch64-buildroot-linux-gnu/sysroot/u=
sr/lib -Lbuild/temp.linux-x86_64-3.8 -lnpymath -lopenblas -lopenblas -lm -o=
 build/lib.linux-x86_64-3.8/numpy/core/_<a href=3D"http://multiarray_umath.=
cpython-38-aarch64-linux-gnu.so">multiarray_umath.cpython-38-aarch64-linux-=
gnu.so</a></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, Jan 21, 2023 at 8:48 PM Yann E. MORI=
N &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pra=
sad, All,<br>
<br>
On 2023-01-21 20:12 +0530, Prasad Sankaran via buildroot spake thusly:<br>
&gt; The following errors are reported while generating numpy/core/_ [1]<a =
href=3D"http://multiarray_umath.cpython-38-aarch64-linux-gnu.so" rel=3D"nor=
eferrer" target=3D"_blank">multiarray_umath.cpython-38-aarch64-linux-gnu.so=
</a> using<br>
&gt; aarch64-buildroot-linux-gnu-gcc.<br>
&gt; Is there a way to avoid including AVX512 .s files from the compilation=
?<br>
&gt; <br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:19: Error: =
unknown mnemonic =C2=A0 pushq&#39; -- pushq %rbp&#39;<br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:21: Error: =
unknown mnemonic =C2=A0 movq&#39; -- movq %rsp,%rbp&#39;<br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:24: Error: =
unknown mnemonic =C2=A0 andq&#39; -- andq $-64,%rsp&#39;<br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:25: Error: =
unknown mnemonic =C2=A0 subq&#39; -- subq $192,%rsp&#39;<br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:26: Error: =
unknown mnemonic =C2=A0 vmovups&#39; -- vmovups<br>
&gt; __svml_dacos_data_internal(%rip),%zmm7&#39;<br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:27: Error: =
unknown mnemonic =C2=A0 vmovups&#39; -- vmovups<br>
&gt; 64+__svml_dacos_data_internal(%rip),%zmm8&#39;<br>
&gt; numpy/core/src/umath/svml/linux/avx512/svml_z0_acos_d_la.s:30: Error: =
unknown mnemonic =C2=A0 vmovups&#39; -- vmovups<br>
&gt; 128+__svml_dacos_data_internal(%rip),%zmm11&#39;<br>
<br>
I was not able to reproduce such an error here, with the following<br>
defconfig and master as of commit f090116066:<br>
<br>
=C2=A0 =C2=A0 BR2_aarch64=3Dy<br>
=C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
=C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
=C2=A0 =C2=A0 BR2_PER_PACKAGE_DIRECTORIES=3Dy<br>
=C2=A0 =C2=A0 BR2_PACKAGE_PYTHON3=3Dy<br>
=C2=A0 =C2=A0 BR2_PACKAGE_PYTHON_NUMPY=3Dy<br>
<br>
Can you share a _minimal_ defconfig that exhibits the issue?<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000ae788205f31867f4--

--000000000000ae788505f31867f6
Content-Type: application/octet-stream; name=sample_defconfig
Content-Disposition: attachment; filename=sample_defconfig
Content-Transfer-Encoding: base64
Content-ID: <f_ldbtwdis0>
X-Attachment-Id: f_ldbtwdis0

QlIyX2FhcmNoNjQ9eQpCUjJfY29ydGV4X2E3Ml9hNTM9eQojIEJSMl9DT01QSUxFUl9QQVJBTk9J
RF9VTlNBRkVfUEFUSCBpcyBub3Qgc2V0CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0dMSUJDPXkK
QlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV80XzQ9eQpCUjJfR0NDX1ZFUlNJ
T05fN19YPXkKQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKQlIyX1RPT0xDSEFJTl9CVUlM
RFJPT1RfRk9SVFJBTj15CkJSMl9JTklUX1NZU1RFTUQ9eQpCUjJfU1lTVEVNX0JJTl9TSF9CQVNI
PXkKQlIyX0xJTlVYX0tFUk5FTD15CkJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQpCUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0icm9ja2NoaXAvcm9jazk2MC1tb2RlbC1hYi1s
aW51eCIKQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQpCUjJfUEFDS0FHRV9B
TFNBX1VUSUxTPXkKQlIyX1BBQ0tBR0VfQUxTQV9VVElMU19BTUlYRVI9eQpCUjJfUEFDS0FHRV9B
TFNBX1VUSUxTX0FQTEFZPXkKQlIyX1BBQ0tBR0VfR1NUUkVBTUVSMT15CkJSMl9QQUNLQUdFX0dT
VDFfUFlUSE9OPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX0FEREVSPXkK
QlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX0FVRElPVEVTVFNSQz15CkJSMl9Q
QUNLQUdFX0dTVDFfUExVR0lOU19CQVNFX1BMVUdJTl9DT01QT1NJVE9SPXkKQlIyX1BBQ0tBR0Vf
R1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX0VOQ09ESU5HPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVH
SU5TX0JBU0VfUExVR0lOX1ZJREVPQ09OVkVSVD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19C
QVNFX1BMVUdJTl9HSU89eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVHSU5fT1ZF
UkxBWUNPTVBPU0lUSU9OPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX1JB
V1BBUlNFPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX1NVQlBBUlNFPXkK
QlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX1RDUD15CkJSMl9QQUNLQUdFX0dT
VDFfUExVR0lOU19CQVNFX1BMVUdJTl9WSURFT1RFU1RTUkM9eQpCUjJfUEFDS0FHRV9HU1QxX1BM
VUdJTlNfQkFTRV9QTFVHSU5fVklERU9SQVRFPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
U0VfUExVR0lOX0FMU0E9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVHSU5fT0dH
PXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExVR0lOX09QVVM9eQpCUjJfUEFDS0FH
RV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVHSU5fUEFOR089eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfQkFTRV9QTFVHSU5fVEhFT1JBPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0VfUExV
R0lOX1ZPUkJJUz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19DV19BV0JfQUVCPXkKQlIyX1BB
Q0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfSlBFRz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19H
T09EX1BORz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX0JaMj15CkJSMl9QQUNLQUdF
X0dTVDFfUExVR0lOU19HT09EX1pMSUI9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9Q
TFVHSU5fQVBFVEFHPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfUExVR0lOX0FVRElP
Rlg9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fQVVESU9QQVJTRVJTPXkK
QlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfUExVR0lOX0FVUEFSU0U9eQpCUjJfUEFDS0FH
RV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fQVVUT0RFVEVDVD15CkJSMl9QQUNLQUdFX0dTVDFf
UExVR0lOU19HT09EX1BMVUdJTl9ERUJVR1VUSUxTPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5T
X0dPT0RfUExVR0lOX0RFSU5URVJMQUNFPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0Rf
UExVR0lOX0RUTUY9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fRUZGRUNU
Vj15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9FUVVBTElaRVI9eQpCUjJf
UEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fRkxWPXkKQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0dPT0RfUExVR0lOX0ZMWD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BM
VUdJTl9HT09NPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfUExVR0lOX0dPT00ySzE9
eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fSUNZREVNVVg9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fSUQzREVNVVg9eQpCUjJfUEFDS0FHRV9HU1Qx
X1BMVUdJTlNfR09PRF9QTFVHSU5fSU1BR0VGUkVFWkU9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfR09PRF9QTFVHSU5fSU5URVJMRUFWRT15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09E
X1BMVUdJTl9MQVc9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fTEVWRUw9
eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fTUFUUk9TS0E9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fTU9OT1NDT1BFPXkKQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX0dPT0RfUExVR0lOX01VTFRJRklMRT15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19HT09EX1BMVUdJTl9NVUxUSVBBUlQ9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9Q
TFVHSU5fUkVQTEFZR0FJTj15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9S
VFNQPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfUExVR0lOX1NIQVBFV0lQRT15CkJS
Ml9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9TTVBURT15CkJSMl9QQUNLQUdFX0dT
VDFfUExVR0lOU19HT09EX1BMVUdJTl9TUEVDVFJVTT15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19HT09EX1BMVUdJTl9WSURFT0JPWD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BM
VUdJTl9WSURFT0NST1A9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fVklE
RU9GSUxURVI9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fVklERU9NSVhF
Uj15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9XQVZFTkM9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fWTRNPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVH
SU5TX0dPT0RfUExVR0lOX0xBTUU9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVH
SU5fTVBHMTIzPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfUExVR0lOX09TUz15CkJS
Ml9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9PU1M0PXkKQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX0dPT0RfUExVR0lOX1NIT1VUMj15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19H
T09EX1BMVUdJTl9WNEwyPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0RfUExVR0lOX1Y0
TDJfUFJPQkU9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fQ0FJUk89eQpC
UjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fRkxBQz15CkJSMl9QQUNLQUdFX0dT
VDFfUExVR0lOU19HT09EX1BMVUdJTl9HREtQSVhCVUY9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfR09PRF9QTFVHSU5fSkFDSz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJ
Tl9TT1VQSFRUUFNSQz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9TUEVF
WD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19HT09EX1BMVUdJTl9UQUdMSUI9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVHSU5fVFdPTEFNRT15CkJSMl9QQUNLQUdFX0dTVDFf
UExVR0lOU19HT09EX1BMVUdJTl9WUFg9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9Q
TFVHSU5fV0FWUEFDSz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQUQ9eQpCUjJfUEFDS0FH
RV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9BQ0NVUklQPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVH
SU5TX0JBRF9QTFVHSU5fQURQQ01ERUM9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BM
VUdJTl9BRFBDTUVOQz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0FJRkY9
eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9BU0ZNVVg9eQpCUjJfUEFDS0FH
RV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9BVURJT0ZYQkFEPXkKQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0JBRF9QTFVHSU5fQVVESU9MQVRFTkNZPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5T
X0JBRF9QTFVHSU5fQVVESU9NSVhNQVRSSVg9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFE
X1BMVUdJTl9BVURJT1ZJU1VBTElaRVJTPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9Q
TFVHSU5fQVVUT0NPTlZFUlQ9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9C
QVlFUj15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0NBTUVSQUJJTjI9eQpC
UjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9DT0xPUkVGRkVDVFM9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9ERUJVR1VUSUxTPXkKQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX0JBRF9QTFVHSU5fRFZCU1VCT1ZFUkxBWT15CkJSMl9QQUNLQUdFX0dTVDFfUExV
R0lOU19CQURfUExVR0lOX0RWRFNQVT15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExV
R0lOX0ZBQ0VPVkVSTEFZPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fRkVT
VElWQUw9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9GSUVMREFOQUxZU0lT
PXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fRlJFRVZFUkI9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9GUkVJMFI9eQpCUjJfUEFDS0FHRV9HU1QxX1BM
VUdJTlNfQkFEX1BMVUdJTl9HQVVESUVGRkVDVFM9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNf
QkFEX1BMVUdJTl9HRU9NRVRSSUNUUkFOU0ZPUk09eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNf
QkFEX1BMVUdJTl9HRFA9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9JRDNU
QUc9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9JTlRFUj15CkJSMl9QQUNL
QUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0lOVEVSTEFDRT15CkJSMl9QQUNLQUdFX0dTVDFf
UExVR0lOU19CQURfUExVR0lOX0lWRlBBUlNFPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
RF9QTFVHSU5fSVZUQz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0pQMktE
RUNJTUFUT1I9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9KUEVHRk9STUFU
PXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTElCUkZCPXkKQlIyX1BBQ0tB
R0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTUlEST15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19CQURfUExVR0lOX01QRUdERU1VWD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExV
R0lOX01QRUdUU0RFTVVYPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTVBF
R1RTTVVYPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTVBFR1BTTVVYPXkK
QlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTVhGPXkKQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX0JBRF9QTFVHSU5fTkVUU0lNPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
RF9QTFVHSU5fT05WSUY9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9QQ0FQ
UEFSU0U9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9QTk09eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9QUk9YWT15CkJSMl9QQUNLQUdFX0dTVDFfUExV
R0lOU19CQURfUExVR0lOX1JBV1BBUlNFPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9Q
TFVHSU5fUkVNT1ZFU0lMRU5DRT15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lO
X1JUTVA9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9TRFA9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9TRUdNRU5UQ0xJUD15CkJSMl9QQUNLQUdFX0dT
VDFfUExVR0lOU19CQURfUExVR0lOX1NJUkVOPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
RF9QTFVHSU5fU01PT1RIPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fU1BF
RUQ9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9TVUJFTkM9eQpCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9USU1FQ09ERT15CkJSMl9QQUNLQUdFX0dTVDFf
UExVR0lOU19CQURfUExVR0lOX1ZJREVPRklMVEVSUz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lO
U19CQURfUExVR0lOX1ZJREVPRlJBTUVfQVVESU9MRVZFTD15CkJSMl9QQUNLQUdFX0dTVDFfUExV
R0lOU19CQURfUExVR0lOX1ZJREVPUEFSU0VSUz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19C
QURfUExVR0lOX1ZJREVPU0lHTkFMPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVH
SU5fVk1OQz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX1k0TT15CkJSMl9Q
QUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX1lBRElGPXkKQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0JBRF9QTFVHSU5fQVNTUkVOREVSPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JB
RF9QTFVHSU5fQkxVRVo9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9CWjI9
eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9DVVJMPXkKQlIyX1BBQ0tBR0Vf
R1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fREFTSD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19C
QURfUExVR0lOX0RFQ0tMSU5LPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5f
RFZCPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fRkFBRD15CkJSMl9QQUNL
QUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0ZCREVWPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVH
SU5TX0JBRF9QTFVHSU5fRkRLX0FBQz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExV
R0lOX0hMUz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0tNUz15CkJSMl9Q
QUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX0xJQk1NUz15CkJSMl9QQUNLQUdFX0dTVDFf
UExVR0lOU19CQURfUExVR0lOX0RUTFM9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BM
VUdJTl9UVE1MPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fTVBFRzJFTkM9
eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9NVVNFUEFDSz15CkJSMl9QQUNL
QUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX05FT049eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJ
TlNfQkFEX1BMVUdJTl9PUEVOSlBFRz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExV
R0lOX09QVVM9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9SU1ZHPXkKQlIy
X1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fU0JDPXkKQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0JBRF9QTFVHSU5fU0hNPXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVH
SU5fU05ERklMRT15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX1NSVFA9eQpC
UjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9WT0FBQ0VOQz15CkJSMl9QQUNLQUdF
X0dTVDFfUExVR0lOU19CQURfUExVR0lOX1dFQlA9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNf
QkFEX1BMVUdJTl9XRUJSVEM9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFEX1BMVUdJTl9Y
MjY1PXkKQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9aQkFSPXkKQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX1VHTFk9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfVUdMWV9QTFVHSU5fQVNG
REVNVVg9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfVUdMWV9QTFVHSU5fRFZETFBDTURFQz15
CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19VR0xZX1BMVUdJTl9EVkRTVUI9eQpCUjJfUEFDS0FH
RV9HU1QxX1BMVUdJTlNfVUdMWV9QTFVHSU5fWElOR01VWD15CkJSMl9QQUNLQUdFX0dTVDFfUExV
R0lOU19VR0xZX1BMVUdJTl9SRUFMTUVESUE9eQpCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfVUdM
WV9QTFVHSU5fRFZEUkVBRD15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19VR0xZX1BMVUdJTl9N
UEVHMkRFQz15CkJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19VR0xZX1BMVUdJTl9YMjY0PXkKQlIy
X1BBQ0tBR0VfR1NUMV9JTlRFUlBJUEU9eQpCUjJfUEFDS0FHRV9HU1QxX0xJQkFWPXkKQlIyX1BB
Q0tBR0VfR1NUMV9SVFNQX1NFUlZFUj15CkJSMl9QQUNLQUdFX0dTVFJFQU1FUjFfUk9DS0NISVA9
eQpCUjJfUEFDS0FHRV9HU1RSRUFNRVIxX1JPQ0tDSElQX0VYVFJBPXkKQlIyX1BBQ0tBR0VfVkxD
PXkKQlIyX1BBQ0tBR0VfTFNPRj15CkJSMl9QQUNLQUdFX1NUUkVTU19ORz15CkJSMl9QQUNLQUdF
X0ZMRVg9eQpCUjJfUEFDS0FHRV9MSUJUT09MPXkKQlIyX1BBQ0tBR0VfRTJGU1BST0dTPXkKQlIy
X1BBQ0tBR0VfWE9SRzc9eQpCUjJfUEFDS0FHRV9HUFRGRElTSz15CkJSMl9QQUNLQUdFX0dQVEZE
SVNLX0dESVNLPXkKQlIyX1BBQ0tBR0VfR1BURkRJU0tfU0dESVNLPXkKQlIyX1BBQ0tBR0VfUEFS
VEVEPXkKQlIyX1BBQ0tBR0VfVUJPT1RfVE9PTFM9eQpCUjJfUEFDS0FHRV9MVUE9eQpCUjJfUEFD
S0FHRV9PUEVOSkRLPXkKQlIyX1BBQ0tBR0VfUFlUSE9OMz15CkJSMl9QQUNLQUdFX1BZVEhPTjNf
UFlfUFlDPXkKQlIyX1BBQ0tBR0VfUFlUSE9OM19CWklQMj15CkJSMl9QQUNLQUdFX1BZVEhPTjNf
Q09ERUNTQ0pLPXkKQlIyX1BBQ0tBR0VfUFlUSE9OM19ERUNJTUFMPXkKQlIyX1BBQ0tBR0VfUFlU
SE9OM19PU1NBVURJT0RFVj15CkJSMl9QQUNLQUdFX1BZVEhPTjNfUkVBRExJTkU9eQpCUjJfUEFD
S0FHRV9QWVRIT04zX1NRTElURT15CkJSMl9QQUNLQUdFX1BZVEhPTjNfWFo9eQpCUjJfUEFDS0FH
RV9QWVRIT05fQUJTTF9QWT15CkJSMl9QQUNLQUdFX1BZVEhPTl9BTFNBQVVESU89eQpCUjJfUEFD
S0FHRV9QWVRIT05fQVJQUkVRPXkKQlIyX1BBQ0tBR0VfUFlUSE9OX0FTVFVOUEFSU0U9eQpCUjJf
UEFDS0FHRV9QWVRIT05fQVdTSU9UUFlUSE9OU0RLPXkKQlIyX1BBQ0tBR0VfUFlUSE9OX0JPVE8z
PXkKQlIyX1BBQ0tBR0VfUFlUSE9OX0NIQVJERVQ9eQpCUjJfUEFDS0FHRV9QWVRIT05fQ0hBUlNF
VC1OT1JNQUxJWkVSPXkKQlIyX1BBQ0tBR0VfUFlUSE9OX0VWREVWPXkKQlIyX1BBQ0tBR0VfUFlU
SE9OX0ZMQVRCVUZGRVJTPXkKQlIyX1BBQ0tBR0VfUFlUSE9OX0ZJUkU9eQpCUjJfUEFDS0FHRV9Q
WVRIT05fR0FTVD15CkJSMl9QQUNLQUdFX1BZVEhPTl9MSUJST1NBPXkKQlIyX1BBQ0tBR0VfUFlU
SE9OX01BVFBMT1RMSUI9eQpCUjJfUEFDS0FHRV9QWVRIT05fTkVUQUREUj15CkJSMl9QQUNLQUdF
X1BZVEhPTl9ORVRJRkFDRVM9eQpCUjJfUEFDS0FHRV9QWVRIT05fTkVUV09SS01BTkFHRVI9eQpC
UjJfUEFDS0FHRV9QWVRIT05fT1BUX0VJTlNVTT15CkJSMl9QQUNLQUdFX1BZVEhPTl9QQUNLQUdJ
Tkc9eQpCUjJfUEFDS0FHRV9QWVRIT05fUElQPXkKQlIyX1BBQ0tBR0VfUFlUSE9OX1BSQ1RMPXkK
QlIyX1BBQ0tBR0VfUFlUSE9OX1BTVVRJTD15CkJSMl9QQUNLQUdFX1BZVEhPTl9QWUdBTUU9eQpC
UjJfUEFDS0FHRV9QWVRIT05fUFlUWj15CkJSMl9QQUNLQUdFX1BZVEhPTl9QWVVERVY9eQpCUjJf
UEFDS0FHRV9QWVRIT05fUFlXQVZFTEVUUz15CkJSMl9QQUNLQUdFX1BZVEhPTl9SRVFVRVNUUz15
CkJSMl9QQUNLQUdFX1BZVEhPTl9TRVRQUk9DVElUTEU9eQpCUjJfUEFDS0FHRV9QWVRIT05fU01C
VVNfQ0ZGST15CkJSMl9QQUNLQUdFX1BZVEhPTl9TT1VORERFVklDRT15CkJSMl9QQUNLQUdFX1BZ
VEhPTl9TUFA9eQpCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VYVEVOU0lPTlM9eQpCUjJfUEFD
S0FHRV9QWVRIT05fVjRMMj15CkJSMl9QQUNLQUdFX1BZVEhPTl9WTEM9eQpCUjJfUEFDS0FHRV9Q
WVRIT05fV0FUQ0hET0c9eQpCUjJfUEFDS0FHRV9QWVRIT05fV0VCU09DS0VUUz15CkJSMl9QQUNL
QUdFX1BZVEhPTl9XSEVFTD15CkJSMl9QQUNLQUdFX1BZVEhPTl9XUkFQVD15CkJSMl9QQUNLQUdF
X0xBRFNQQV9TREs9eQpCUjJfUEFDS0FHRV9MSUJBUkNISVZFPXkKQlIyX1BBQ0tBR0VfQ0FfQ0VS
VElGSUNBVEVTPXkKQlIyX1BBQ0tBR0VfTElCQ09ORklHPXkKQlIyX1BBQ0tBR0VfT1BFTkNWMz15
CkJSMl9QQUNLQUdFX09QRU5DVjNfTElCX0lNR0NPREVDUz15CkJSMl9QQUNLQUdFX09QRU5DVjNf
TElCX1BIT1RPPXkKQlIyX1BBQ0tBR0VfT1BFTkNWM19MSUJfUFlUSE9OPXkKQlIyX1BBQ0tBR0Vf
T1BFTkNWM19MSUJfVklERU89eQpCUjJfUEFDS0FHRV9PUEVOQ1YzX1dJVEhfSlBFRz15CkJSMl9Q
QUNLQUdFX09QRU5DVjNfV0lUSF9QTkc9eQpCUjJfUEFDS0FHRV9MSUJJSU89eQpCUjJfUEFDS0FH
RV9MSUJJSU9fQklORElOR1NfUFlUSE9OPXkKQlIyX1BBQ0tBR0VfTElCSU5QVVQ9eQpCUjJfUEFD
S0FHRV9MSUJWNExfVVRJTFM9eQpCUjJfUEFDS0FHRV9NUFA9eQpCUjJfUEFDS0FHRV9NUFBfQUxM
T0NBVE9SX0RSTT15CkJSMl9QQUNLQUdFX0NVUkw9eQpCUjJfUEFDS0FHRV9MSUJORVQ9eQpCUjJf
UEFDS0FHRV9MSUJSU1lOQz15CkJSMl9QQUNLQUdFX1pFUk9NUT15CkJSMl9QQUNLQUdFX0xJQlNF
TElOVVg9eQpCUjJfUEFDS0FHRV9DUkRBPXkKQlIyX1BBQ0tBR0VfREhDUD15CkJSMl9QQUNLQUdF
X0RIQ1BfQ0xJRU5UPXkKQlIyX1BBQ0tBR0VfREhDUENEPXkKQlIyX1BBQ0tBR0VfSUZUT1A9eQpC
UjJfUEFDS0FHRV9JRlVQRE9XTj15CkJSMl9QQUNLQUdFX0lQRVJGMz15CkJSMl9QQUNLQUdFX0lQ
Uk9VVEUyPXkKQlIyX1BBQ0tBR0VfSVBUQUJMRVM9eQpCUjJfUEFDS0FHRV9JVz15CkJSMl9QQUNL
QUdFX05FVFdPUktfTUFOQUdFUj15CkJSMl9QQUNLQUdFX05FVFdPUktfTUFOQUdFUl9UVUk9eQpC
UjJfUEFDS0FHRV9ORVRXT1JLX01BTkFHRVJfUFBQRD15CkJSMl9QQUNLQUdFX05NQVA9eQpCUjJf
UEFDS0FHRV9PUEVOUkVTT0xWPXkKQlIyX1BBQ0tBR0VfT1BFTlNTSD15CkJSMl9QQUNLQUdFX1JT
WU5DPXkKQlIyX1BBQ0tBR0VfU1BPVElGWT15CkJSMl9QQUNLQUdFX1RDUERVTVA9eQpCUjJfUEFD
S0FHRV9UUkFDRVJPVVRFPXkKQlIyX1BBQ0tBR0VfVlNGVFBEPXkKQlIyX1BBQ0tBR0VfV0dFVD15
CkJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UPXkKQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRf
Q0xJPXkKQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfV1BBX0NMSUVOVF9TTz15CkJSMl9QQUNL
QUdFX1dQQV9TVVBQTElDQU5UX1BBU1NQSFJBU0U9eQpCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FO
VF9EQlVTX05FVz15CkJSMl9QQUNLQUdFX0JBU0hfQ09NUExFVElPTj15CkJSMl9QQUNLQUdFX0dO
VVBHPXkKQlIyX1BBQ0tBR0VfTE9HUk9UQVRFPXkKQlIyX1BBQ0tBR0VfU0NSRUVOPXkKQlIyX1BB
Q0tBR0VfU1VETz15CkJSMl9QQUNLQUdFX0NPUkVVVElMUz15CkJSMl9QQUNLQUdFX0ZMVUVOVF9C
SVQ9eQpCUjJfUEFDS0FHRV9IVE9QPXkKQlIyX1BBQ0tBR0VfSU9UT1A9eQpCUjJfUEFDS0FHRV9J
UlFCQUxBTkNFPXkKQlIyX1BBQ0tBR0VfS0VZVVRJTFM9eQpCUjJfUEFDS0FHRV9OQ0RVPXkKQlIy
X1BBQ0tBR0VfU1lTVEVNRF9SRktJTEw9eQpCUjJfUEFDS0FHRV9UQVI9eQpCUjJfUEFDS0FHRV9V
VElMX0xJTlVYX1JGS0lMTD15CkJSMl9QQUNLQUdFX1ZJTT15CkJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfUExBVEZPUk09InJrMzM5OSIKQlIyX1BBQ0tBR0VfSE9TVF9SS0JJTj15Cgo=
--000000000000ae788505f31867f6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000ae788505f31867f6--


