Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D9CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E7B960783;
	Mon,  5 Oct 2026 22:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7MGK6psH51X; Mon,  5 Oct 2026 22:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8D25660788
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791240051;
	b=ryCbV/3wUWBv/0CgB93L3xXejRt3qEFRvefDoTpYq4IFdkkH2vErhqeRA4ONG4jo/9Cx
	 5gj+HGJCXeKI7okYv38TGdJGGWLKpntp5TjRUobYOuCglb8XqXJgf3PMLxmE2PBggZJ//
	 gNL7Ng8s/8dFIG0uAYGwviS9nqyEdEj/3gizb5lGQ7oHw85bwcu99fAVVorSJMI9IokBv
	 2WsJ61XlkogRRroK/hUqZSf9ypJrrZr3TacW+EIW4Kpmcpx6R/HGj6gWzIEhe4KPE8uXi
	 FUMWPm2I5S2zwpsKzdirR76zzeEoOmIthmqUlcs4EzKV/1eNN8AT9tJEU/q8Y0Iqlcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791240051;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=v3seZZMMx5L2nP2obvfCt78Row3cRh/VyAmFWmECslg=;
	b=VT9zk17H/w3ZVLSHkqKvxVHvpsZiZUCExW1JfS24IKv7gHa1pII32/tkaU743Uf+BXZP
	 ch6wfZ15fXHyyQkQOMggji83egxfEy8iI97JEj60VIG78CMi2yS7ZdoGpJDGNo30KOgRw
	 +RSuRTRG/S9lDsz9dwS1la7Ld8UmyTOs+atUN+rAAWbkicMDmBR+uSrCXSqRRzo7gx9Ex
	 izGFyFJsMzwZd2TQJV1m2p8MOMEk+XTDq+NgNtI+1aUkRNb71XgY7L7ulE6pMkw73wd3I
	 LjGWJoKo2GlwF386FXWwG1Jd80sbrY7ZH8B19souYGb82wWABS+g6asdUoRyYpJm0Tw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791240051;
	bh=v3seZZMMx5L2nP2obvfCt78Row3cRh/VyAmFWmECslg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jNvSwhI9Anqc2egOekaxsclbmHwjK9Y/pzTKCyFVetryQsGenEzsaGIBLaxj4NmHe
	 HuZzOVA8IxK3fo4IIPVVr4y1ejVbRsxd6GMMzbCBC14o6gNc278y3EFAafPMjknOlM
	 8RBkFarSsNSoLJ1WLX3LpljLhU7kXXbEt5tNOJA9/0blsBvUw9yK6tVQKBN5mUgjEi
	 Eb8VEDGXotk0at98SqmfSUcWTPjhoFW8LlDrHdlTucv7TI0BC/4aBjd68fxoo0JVJ8
	 vEHiC95jaJL2QU1eHp78OnoI/lqtSJafjMoYs4lXFJ4I9moX9pzzE356lSmcEGa8MS
	 W/Yo8UulkB/YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D25660788;
	Mon,  5 Oct 2026 22:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE12335
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1FC400AA
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgsRpFhFH3AI for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:38:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3A9E940042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239910;
 b=RK3r/zF9JqRkH2Q5cejDXoEle2D28f1jR+QsNDnjX4YuMFPHeyELgO+k79IZTdzNTjoZ
 OuloBZLY0rZ3asXse/60XLmNu156F6LOAS3LuUtigiODAWIj46l+mJAKorsDBd/otNUg0
 YkipQVC25qwChtpZm1yOFwRm6tQhCp2n5qJ1c7sMkS4Cv4UtW7CzQDt4tYmi5n9uoYPFz
 5rlUwUOR1HBJ/Bf5okUQprYmQEzQhpbaqOMmQQufles66gAFoRgDmuYXGeYzFFSVGeOkT
 /tEIQDoBx0l29KcMDA6CcjsY2W+sLn6HXRrEkPm8tkUrFhTF3pkoG9PRlmhwBdGcrFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239910;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=N54lcxQLCEnEaEd5+l3YJVhsEjX7sGwVdpMHjwHODJI=;
 b=fQuGB2i4yOCU7soyvmTBLYYw7XrX96hgpOt/oQg+pCtbWPbnbcB9b9LJF6GNvNj5SK7T
 8pdXk8cGGu7KMIlxgJ6smv8ynuI10CG8Rp1Nb46f0JWnf9NdjTxJ1XrpkUWICoi7YqihC
 2gp9zMY08uAju5h30XXHxDwI9u45QkRllME1ENPa8MxZctd8cpy4LcitgF9IlmmL4su2e
 wMMgJDjSMpi3NQaB2+lU6/aHayLwDarNOIUMiH84LmT78v4ORbdDUZAnDgyDmnkSZrKyg
 33SinxPR8b7XryILmfsSvR+5SIJq+y1GnFJhhwGw5IDXz1f3qQZ0ZTHdcfS8DNGSptQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=G84hWtVk; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=G84hWtVk
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A9E940042
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:29 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 006d021491bc7-6dfd65cc5ebso842798eaf.0
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 15:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791239909; x=1791844709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N54lcxQLCEnEaEd5+l3YJVhsEjX7sGwVdpMHjwHODJI=;
 b=G84hWtVkf99WI+oDDfe4cgScmJL3k3HSl74SnE3fOnuQrDm7fahp3mXBzXxALid/HD
 PyRieI3ErJrZwQexVPk0WKdbrwVeB6EBQyH2n/d6cN48g83JkU3Xt4kQ7A/U0WAMNsL4
 UJE4Hi/TTtONSSFzCv8iFDtTC2qfADQPFIbbdDHkpnfeE0y1gGsCANPNKIQrmSLc+2aa
 XG/fsfLLWFKZVbsnwbdnGAKn8how7L07ypasxBK9QDt9/g94V9qiLChL6L2CcR2+7I8a
 10vb+/U958HOAy30KQna4ZU0r8B7OjsheCOV0Bc1qYkwVNMswkftUyXexxfk7j0TIn0x
 54Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791239909; x=1791844709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N54lcxQLCEnEaEd5+l3YJVhsEjX7sGwVdpMHjwHODJI=;
 b=nxhDyH4dhVfJZGloarWv0Cbz0pf3YVPT0g6ihQ2lQIdxpbTsMtXL/wHev7ckaPxytv
 IyXPQLrXlaiB0UjkfazQ8LLdwPBrl9jSfb6bbx9KO69lPDQoR7bMcg1XiLuRljj+6h+Z
 9FqPH6ybORrc7wOBhcb2Nl0e3nF/zr80ZlZ2epL7r07i+1a3nCsYcx9cowdXjFmZhrhD
 z2N8Khpqnxou1cDpAo3C6zh/vr0LIRr751fquZLE9nfDTV9ktI1bzAZBz77jl6A8tOJK
 4uojcGT1GwdnAk/KIO2y8AmPZADaNtE9igc4KY+IgUJIKiQEE8no6zlkJ6oInme9HBzi
 7GmA==
X-Gm-Message-State: AFuF++lJC3/E6M6BnWwsGVPHgokjJRBYF9lSX0LrJr4CGxVHhJZcpyLZ
 5ncuEWbytsZ0xtw+Qqq/pWPNGw5hASYwVI+noMfyD6FuvRa2EyL8GSMsMMxqzg==
X-Gm-Gg: AYBFou2KOxt/1Z62KPunUwZzZGW/x20SN5lP5QZ9fV/QUPI5yvo46a4loG2rfQAAbkZ
 +tjy7iZ0gAlyBhZSVanTPI/jZh2jMeA8RQFFZvGiEvz4nv1p9s/1YruXs50b3SCmZdHMbxOXacP
 ZNhN9rGCZbuPQh9x073iYZuWanPJdN2WjS7dIKxtuUA1Zt2OESB8RvJx9z9/EaWoOzrptnpXY/w
 9V4r+LHjoAlOox+StnENFNlNZZu8Hna0z/MIjjQ0qQFMtV/bZK+f6kVu8RCSJT8DIh6J+n+RfPQ
 pTREWA0cOgs/j533AFl3TTagoAplXxizLs8BuhA3N4/mwfCc/AMB9ug0y+iF+/mT2mSZAHYJbNS
 J34d10/BsbcXZVK3RsByzxaAtocAlTgUE+XwU4Usn0+arUhD/7HVxb6OWjKqfZce0VjoSN9apDT
 wOmlXgP/axLf4ue6VQPR9wGIlb2NZLAPJgU1DDAYhPYq424tY9vhShHsxZuGyOWjob7uhQ7hmf4
 0lsvrwNKjxJMu45rlEmmj3BL/SHYbnGudfiBmvFRcY0XwbTkBmcRdmnuS76mco6/zTQPrZeECma
 wVcRWoBz+/9egEYP8wNsWF1mEW4jSSt0JiomIG4YdMQ78IRu36gJMwRujsqQpemQ351+wvlJqh1
 48m0tNnUZfZpriBJOxcrkyhTIvloLgMRC6kK/nmkV7A==
X-Received: by 2002:a4a:edc8:0:b0:6d9:e2f3:9b4d with SMTP id
 006d021491bc7-6df3574975emr8331984eaf.73.1791239908797; 
 Mon, 05 Oct 2026 15:38:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-828201c6f0dsm720704a34.12.2026.10.05.15.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 15:38:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 16:38:10 -0600
Message-ID: <20261005223811.2094796-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005223811.2094796-1-james.hilliard1@gmail.com>
References: <20261005223811.2094796-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/python-numpy: bump to version 2.5.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Xukai Wang <kingxukai@zohomail.com>, Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the meson setup type for both host and target builds. Let
meson-python invoke the vendored Meson and install the generated wheels.
Use the none value to disable BLAS and LAPACK when unavailable.

Raise the GCC requirement to version 10 and propagate the target and
host compiler requirements to dependent packages.

Use the standalone Dragon4 license file and add the bundled 0BSD and
CC0-1.0 licenses to match the upstream licensing metadata:
https://github.com/numpy/numpy/commit/0f39fd27ff149b25f74fc58d589c92b4fd881226

Install numpy.pc in the standard pkg-config directory for host and
staging builds. Keep its prefix relative so dependent packages can find
NumPy through pkg-config after per-package copying or SDK relocation.

Drop the obsolete npymath.ini staging fixup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gnuradio/Config.in             |  8 +--
 package/kismet/Config.in               |  6 +--
 package/opencv4/Config.in              |  6 +--
 package/piglit/Config.in               | 10 ++--
 package/python-gymnasium/Config.in     |  6 +--
 package/python-matplotlib/Config.in    | 10 ++--
 package/python-ml-dtypes/Config.in     |  8 +--
 package/python-numpy/Config.in         |  6 +--
 package/python-numpy/python-numpy.hash |  8 +--
 package/python-numpy/python-numpy.mk   | 70 ++++++++++++--------------
 package/python-scipy/Config.in         | 10 ++--
 package/python-zlmdb/Config.in         |  6 +--
 package/uhd/Config.in                  | 10 ++--
 13 files changed, 80 insertions(+), 84 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 0e8dc66dc4..cc0d4bed19 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -79,8 +79,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_10 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -88,10 +88,10 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+comment "python support needs a glibc or musl toolchain w/ gcc >= 10, host gcc >= 10"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_HOST_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_SOAPY
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 65c17baeaf..3f6982cc41 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_KISMET_PYTHON_TOOLS
 	bool "Install python tools"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
@@ -52,12 +52,12 @@ comment "python tools needs python3"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
-comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 8"
+comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 10"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_KISMET_SERVER
 	bool "Install server"
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 10b2c54b70..3e3f2597c8 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -174,16 +174,16 @@ config BR2_PACKAGE_OPENCV4_LIB_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
-comment "python support needs a glibc or musl toolchain w/ gcc >= 9"
+comment "python support needs a glibc or musl toolchain w/ gcc >= 10"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 ||\
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 ||\
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV4_LIB_SHAPE
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 48b7641909..a3dbd49efd 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -8,8 +8,8 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
 	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_10 # host-python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
@@ -34,8 +34,8 @@ config BR2_PACKAGE_PIGLIT
 
 	  https://piglit.freedesktop.org
 
-comment "piglit needs a glibc or musl toolchain w/ C++, gcc >= 9, host gcc >= 9"
+comment "piglit needs a glibc or musl toolchain w/ C++, gcc >= 10, host gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
-		!BR2_HOST_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		!BR2_HOST_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
index 3fc9df5a1c..155d73c3a5 100644
--- a/package/python-gymnasium/Config.in
+++ b/package/python-gymnasium/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_GYMNASIUM
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9  # host-python-numpy
 	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
 	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
@@ -15,8 +15,8 @@ config BR2_PACKAGE_PYTHON_GYMNASIUM
 
 	  https://gymnasium.farama.org
 
-comment "python-gymnasium needs a glibc or musl toolchain w/ C++, gcc >= 9"
+comment "python-gymnasium needs a glibc or musl toolchain w/ C++, gcc >= 10"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 13894004aa..0e9e14ddbe 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_10 # host-python-numpy
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
@@ -42,7 +42,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 
 endif
 
-comment "python-matplotlib needs a glibc or musl toolchain w/ C++, gcc >= 9, host gcc >= 9"
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++, gcc >= 10, host gcc >= 10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index a8b351d2e3..c5bd70fb2c 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_10 # host-python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	help
 	  ml_dtypes is a stand-alone implementation of several NumPy
@@ -12,8 +12,8 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 
 	  https://github.com/jax-ml/ml_dtypes
 
-comment "python-ml-dtypes needs a glibc or musl toolchain w/ C++, gcc >= 9"
+comment "python-ml-dtypes needs a glibc or musl toolchain w/ C++, gcc >= 10"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index f8c71274cd..51e22b015d 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	depends on BR2_INSTALL_LIBSTDCPP
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
@@ -36,8 +36,8 @@ config BR2_PACKAGE_PYTHON_NUMPY
 
 	  http://www.numpy.org/
 
-comment "python-numpy needs a glibc or musl toolchain w/ C++, gcc >= 9"
+comment "python-numpy needs a glibc or musl toolchain w/ C++, gcc >= 10"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 6dca37294a..5b60e82ecc 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,9 +1,11 @@
 # md5, sha256 from https://pypi.org/pypi/numpy/json
-md5  828b6c6df0b6f89b5cf799314d4ee2b6  numpy-2.4.0.tar.gz
-sha256  6e504f7b16118198f138ef31ba24d985b124c2c469fe8467007cf30fd992f934  numpy-2.4.0.tar.gz
+md5  76f5b588f47e6d62fb066b69787b7796  numpy-2.5.3.tar.gz
+sha256  df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6a6c17489a67563  numpy-2.5.3.tar.gz
 # License files, locally calculated
 sha256  1be1df33863f97a7bc1c4d67980bd6c69c9a6fef0a5ee76e6ad6cb91e56e8491  LICENSE.txt
 sha256  743b0f4a0087fe3607167113fffab6f2ca069c8da321763697ab5d0d8411634a  numpy/_build_utils/tempita/LICENSE.txt
-sha256  e09cfef237f1c47fec6c11926e23ed2222404d1e4357b5d65e65a2daf9d83949  numpy/_core/src/multiarray/dragon4.c
+sha256  f7b14309e5f54e5022b26448eefd419988ada2aec01d3c1162d84a0ea8f21f2c  numpy/_core/src/multiarray/dragon4_LICENSE.txt
+sha256  3f2c1ffa76383a55ae0aac01c9737cd70050dff63e1f026694fbe9d662573c98  numpy/_core/src/common/pythoncapi-compat/COPYING
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/_core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
+sha256  268b0ca06759d31ea3ca68dd35f20e877916e927b1c2a835e4592a3c4354b1f9  numpy/random/src/splitmix64/LICENSE.md
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 6b052569fe..ad0d108860 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,41 +4,37 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 2.4.0
+PYTHON_NUMPY_VERSION = 2.5.3
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
-PYTHON_NUMPY_SITE = https://files.pythonhosted.org/packages/a4/7a/6a3d14e205d292b738db449d0de649b373a59edb0d0b4493821d0a3e8718
-PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
+PYTHON_NUMPY_SITE = https://files.pythonhosted.org/packages/13/01/11703282db468b85f6f7b8c7f22d058de5970d5c7e60a3a8aaa313c3de36
+PYTHON_NUMPY_SETUP_TYPE = meson
+PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib, 0BSD, CC0-1.0
 PYTHON_NUMPY_LICENSE_FILES = \
 	LICENSE.txt \
 	numpy/_build_utils/tempita/LICENSE.txt \
-	numpy/_core/src/multiarray/dragon4.c \
+	numpy/_core/src/multiarray/dragon4_LICENSE.txt \
+	numpy/_core/src/common/pythoncapi-compat/COPYING \
 	numpy/_core/include/numpy/libdivide/LICENSE.txt \
-	numpy/linalg/lapack_lite/LICENSE.txt
+	numpy/linalg/lapack_lite/LICENSE.txt \
+	numpy/random/src/splitmix64/LICENSE.md
 PYTHON_NUMPY_CPE_ID_VENDOR = numpy
 PYTHON_NUMPY_CPE_ID_PRODUCT = numpy
 
-PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
-HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython host-python-meson-python
-
-PYTHON_NUMPY_CONF_ENV += \
-	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
-	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"
-
-PYTHON_NUMPY_NINJA_ENV += \
-	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"
+PYTHON_NUMPY_DEPENDENCIES = host-python-cython
+HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
 PYTHON_NUMPY_CONF_OPTS += -Dlapack=lapack
 else
-PYTHON_NUMPY_CONF_OPTS += -Dlapack=""
+PYTHON_NUMPY_CONF_OPTS += -Dlapack=none
 endif
 
 ifeq ($(BR2_PACKAGE_OPENBLAS),y)
 PYTHON_NUMPY_DEPENDENCIES += openblas
 PYTHON_NUMPY_CONF_OPTS += -Dblas=openblas
 else
-PYTHON_NUMPY_CONF_OPTS += -Dblas=""
+PYTHON_NUMPY_CONF_OPTS += -Dblas=none
 endif
 
 # Generated by running this test program under QEMU:
@@ -86,33 +82,31 @@ endif
 PYTHON_NUMPY_MESON_EXTRA_PROPERTIES = \
 	longdouble_format='$(PYTHON_NUMPY_LONGDOUBLE_FORMAT)'
 
-HOST_PYTHON_NUMPY_SETUP_TYPE = setuptools
-
-HOST_PYTHON_NUMPY_CONF_ENV += \
-	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-
-HOST_PYTHON_NUMPY_NINJA_ENV += \
-	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-
 # Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
 # in-tree code.
-HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
-
-# Fixup the npymath.ini prefix path with actual target staging area where
-# numpy core was built. Without this, target builds using numpy distutils
-# extensions like python-scipy, python-numba cannot find -lnpymath since
-# it uses host libraries (like libnpymath.a).
-# So, the numpy distutils extension packages would explicitly link this
-# config path for their package environment.
-define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
-	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
-		$(PYTHON3_PATH)/site-packages/numpy/_core/lib/npy-pkg-config/npymath.ini
-endef
-PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
+HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas=none -Dlapack=none
 
 # Some package may include few headers from NumPy, so let's install it
 # in the staging area.
 PYTHON_NUMPY_INSTALL_STAGING = YES
 
-$(eval $(meson-package))
+define PYTHON_NUMPY_INSTALL_PKGCONFIG
+	$(INSTALL) -D -m 0644 \
+		$(1)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/_core/lib/pkgconfig/numpy.pc \
+		$(1)/lib/pkgconfig/numpy.pc
+	$(SED) 's:^prefix=.*:prefix=$${pcfiledir}/../python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/_core:' \
+		$(1)/lib/pkgconfig/numpy.pc
+endef
+
+define PYTHON_NUMPY_INSTALL_STAGING_PKGCONFIG
+	$(call PYTHON_NUMPY_INSTALL_PKGCONFIG,$(STAGING_DIR)/usr)
+endef
+PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_INSTALL_STAGING_PKGCONFIG
+
+define HOST_PYTHON_NUMPY_INSTALL_PKGCONFIG
+	$(call PYTHON_NUMPY_INSTALL_PKGCONFIG,$(HOST_DIR))
+endef
+HOST_PYTHON_NUMPY_POST_INSTALL_HOOKS += HOST_PYTHON_NUMPY_INSTALL_PKGCONFIG
+
+$(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index aa7eefd44d..691a63dc2c 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # openblas
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_10 # host-python-numpy
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
@@ -21,11 +21,11 @@ config BR2_PACKAGE_PYTHON_SCIPY
 
 	  https://www.scipy.org/scipylib/
 
-comment "python-scipy needs glibc or musl toolchain w/ fortran, c++, gcc >= 9, host gcc >= 9"
+comment "python-scipy needs glibc or musl toolchain w/ fortran, c++, gcc >= 10, host gcc >= 10"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 884cfff182..c3e01b825c 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cbor2
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
@@ -20,9 +20,9 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 
 	  https://github.com/crossbario/zlmdb
 
-comment "python-zlmdb needs a glibc or musl toolchain w/ C++, gcc >= 9"
+comment "python-zlmdb needs a glibc or musl toolchain w/ C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 58bf91c1df..4cee21f413 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -86,11 +86,11 @@ config BR2_PACKAGE_UHD_OCTOCLOCK
 	help
 	  enable OctoClock support
 
-comment "uhd python API needs python3 and a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+comment "uhd python API needs python3 and a glibc or musl toolchain w/ gcc >= 10, host gcc >= 10"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+	depends on !BR2_HOST_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL) # python-numpy
 
 config BR2_PACKAGE_UHD_PYTHON
@@ -98,8 +98,8 @@ config BR2_PACKAGE_UHD_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
-	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_10 # host-python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	select BR2_PACKAGE_PYTHON_REQUESTS
 	help
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
