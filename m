Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4323BC47DDB
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C2760758;
	Mon, 29 Jan 2024 19:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C2760758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEPgtSSycK0M; Mon, 29 Jan 2024 19:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32B260759;
	Mon, 29 Jan 2024 19:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32B260759
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 610191BF489
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 19:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4591D60759
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 19:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4591D60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5R809qWHTk0I for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 19:54:32 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1832360758
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 19:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1832360758
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-290a55f3feaso2328980a91.2
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 11:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706558071; x=1707162871;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EAKcVYnBC3NUb3qMRzGX1CHRg2QdWpkOY+Za2o55vRY=;
 b=kZn0Xo4GDAcDRkWqo+Gpfl3mNXy/wbMDi7ngX6QRrDnLRN4Yflc/XNV6nwRA+j/tIl
 QRvdNhhNSx4rzhhFUcddPXv0kIsnLAdyZA2GAyxN2JAmLhYMhWwkldlpFJhJFTqGVECA
 hfZ0qjboMEbE4Lxa/qM2q9T01o3sMs5l+xflX9HrW/YAD7PBJZyvRGeNdylOkAxwpfMg
 7DlJT16C+Q0QyIwv4JasP15/2HbZss0T1TECdbyh2to6hlAoMKzeHDK3MUJv9xXX4F1w
 BzJYIrJx2tG4AZRJ+9Gd5BPd9I3Uu35/IrM82tShznbzCWrWRGwnGYJsnGZR8lzEJ+xs
 58Uw==
X-Gm-Message-State: AOJu0YwlwNGnSHPUtGpWogNxck6WBBHsCtNgbqn9243cBltyNRsYkILa
 oZBMWXbqOE9ADgCgSc3VhAB7aVgYlqYugOeaico4uOz4y/6dBWncjmM++A4SDSAUiXmvK9/EFcl
 c
X-Google-Smtp-Source: AGHT+IGYYJg6mZfAARElL4SBnPEp9/MY2G3TFKU4yzmLK4IwwAuC6Hg7y6cDvbtP5ixHrVkU6/3QjA==
X-Received: by 2002:a17:90a:ec0e:b0:28c:8eaa:e5e3 with SMTP id
 l14-20020a17090aec0e00b0028c8eaae5e3mr4012761pjy.17.1706558071099; 
 Mon, 29 Jan 2024 11:54:31 -0800 (PST)
Received: from [192.168.0.172] (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 qa15-20020a17090b4fcf00b00295a091e5d6sm486476pjb.2.2024.01.29.11.54.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 11:54:30 -0800 (PST)
Message-ID: <f0bf5c75-199c-d23b-373a-f2728ecac99e@threespeedlogic.com>
Date: Mon, 29 Jan 2024 11:54:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: buildroot <buildroot@buildroot.org>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1706558071;
 x=1707162871; darn=buildroot.org; 
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAKcVYnBC3NUb3qMRzGX1CHRg2QdWpkOY+Za2o55vRY=;
 b=Xabm74WH6BkR4pYFixlvI+n0HQO/AUal7kHJ+z92zjWDngtgYx0bos7NqNtr2bHGzj
 1k0mnlmGNBj3eMAwQztcR0iqupopDs9d/iix/0qbma2ZXTP8/d1Khdj6or3mWknIHt5L
 oj6kAcf4DO4HUoHH8q3PTozRA8EhMsbMoHPTHqCSE7r1hCD8b82kwz/dTRvemAe5PJ7/
 6PckDPac/nWBRZeItoXaTaCYLfld0NMJKVv5NqDZXGOFi8sbP+ySY4SO5rnj3HvXZ5Ia
 fXUHdtZWE/EpT8Wkei/DOfmVRSxG5lSRFETwndeFAvlAnVhW414LGGZ1PurWlcpVFjWL
 TWxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Xabm74WH
Subject: [Buildroot] host-python-numpy - confused about host openblas
 dependency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Several packages depend on host-python-numpy:

	buildroot$ grep host-python-numpy -rl package/
	package/python-pythran/python-pythran.mk
	package/python-matplotlib/python-matplotlib.mk
	package/python-matplotlib/Config.in
	package/piglit/piglit.mk
	package/piglit/Config.in
	package/gnuradio/gnuradio.mk
	package/gnuradio/Config.in
	package/python-scipy/python-scipy.mk
	package/python-scipy/Config.in
	package/uhd/uhd.mk
	package/uhd/Config.in

However, this package appears to rely on a host-openblas dependency that's implied but never really spelled out.

My builds fail as follows:

	buldroot$ make
	>>> host-python-numpy 1.25.0 Configuring
	rm -rf /path/to/buildroot/output/build/host-python-numpy-1.25.0//build
	mkdir -p /path/to/buildroot/output/build/host-python-numpy-1.25.0//build
	GIT_DIR=. PATH="/path/to/buildroot/output/host/bin:/path/to/buildroot/output/host/sbin:/home/gsmecher/.local/bin:/home/gsmecher/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin" PKG_CONFIG="/path/to/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/path/to/buildroot/output/host/lib/pkgconfig:/path/to/buildroot/output/host/share/pkgconfig" AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm" CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib" CPPFLAGS="-I/path/to/buildroot/output/host/include" CFLAGS="-O2 -I/path/to/buildroot/output/host/include" CXXFLAGS="-O2 -I/path/to/buildroot/output/host/include" LDFLAGS="-L/path/to/buildroot/output/host/lib -Wl,-rpath,/path/to/buildroot/output/host/lib" INTLTOOL_PERL=/usr/bin/perl  PYTHONNOUSERSITE=y /path/to/buildroot/output/host/bin/me
 son setup --prefix=/path/to/buildroot/output/host --libdir=lib --sysconfdir=/path/to/buildroot/output/host/etc --localstatedir=/path/to/buildroot/output/host/var --default-library=shared --buildtype=release --wrap-mode=nodownload -Dstrip=true  /path/to/buildroot/output/build/host-python-numpy-1.25.0/ /path/to/buildroot/output/build/host-python-numpy-1.25.0//build
	The Meson build system
	Version: 1.1.1
	Source dir: /path/to/buildroot/output/build/host-python-numpy-1.25.0
	Build dir: /path/to/buildroot/output/build/host-python-numpy-1.25.0/build
	Build type: native build
	Project name: NumPy
	Project version: 1.24.0.dev0
	C compiler for the host machine: /usr/bin/gcc (gcc 12.2.0 "gcc (Debian 12.2.0-14) 12.2.0")
	C linker for the host machine: /usr/bin/gcc ld.bfd 2.40
	C++ compiler for the host machine: /usr/bin/g++ (gcc 12.2.0 "g++ (Debian 12.2.0-14) 12.2.0")
	C++ linker for the host machine: /usr/bin/g++ ld.bfd 2.40
	Cython compiler for the host machine: cython (cython 0.29.36)
	Host machine cpu family: x86_64
	Host machine cpu: x86_64
	Program python3 found: YES (/path/to/buildroot/output/host/bin/python3)
	Found pkg-config: /path/to/buildroot/output/host/bin/pkg-config (1.6.3)
	Has header "Python.h" with dependency python-3.11: YES
	Compiler for C supports arguments -fno-strict-aliasing: YES
	Library m found: YES
	Found CMake: /path/to/buildroot/output/host/bin/cmake (3.27.7)
	WARNING: CMake Toolchain: Failed to determine CMake compilers state
	WARNING: CMake Toolchain: Failed to determine CMake compilers state
	Run-time dependency openblas found: NO (tried pkgconfig and cmake)
	WARNING: CMake Toolchain: Failed to determine CMake compilers state
	Run-time dependency openblas found: YES 0.3.21
	Dependency openblas found: YES 0.3.21 (cached)
	Program _build_utils/process_src_template.py found: YES (/path/to/buildroot/output/host/bin/python3 /path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/process_src_template.py)
	Program _build_utils/tempita.py found: YES (/path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/tempita.py)

	output/build/host-python-numpy-1.25.0/numpy/meson.build:201:44: ERROR: Could not get cmake variable and no default provided for <CMakeDependency OpenBLAS: True None>

	A full log can be found at /path/to/buildroot/output/build/host-python-numpy-1.25.0/build/meson-logs/meson-log.txt
	make: *** [package/pkg-generic.mk:273: /path/to/buildroot/output/build/host-python-numpy-1.25.0/.stamp_configured] Error 1

Any suggestions? There are enough packages depending on host-numpy that I expect it's something unusual on my end. If I force the build to proceed using system pkg-config I can coax it into proceeding - but this is clearly a hack.

thanks,
Graeme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
