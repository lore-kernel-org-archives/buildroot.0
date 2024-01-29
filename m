Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73581C47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 20:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0360E40025;
	Mon, 29 Jan 2024 20:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0360E40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kt3VEdAWe3rq; Mon, 29 Jan 2024 20:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE106404DB;
	Mon, 29 Jan 2024 20:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE106404DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D52A61BF36D
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAD0560773
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD0560773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id al9thGMm6ROm for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 20:40:58 +0000 (UTC)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0872160655
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 20:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0872160655
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-59a181a46b6so1412052eaf.0
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 12:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706560857; x=1707165657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQKi4SPR+FqcVcUxBTCUGp2iDT1hS/pdbfgBUWQNeV0=;
 b=BetiQB6lb/0eQxoZkT5vQer2cmofae7zSZu3K1BRNPcDEd+3mITeqwY2jS3w8FjyYD
 5fFc/zoZRV/Wqn/6EqRz58Shug+u8CuveJ41xAV1mQcEpUm/bmkate4G+gASM8fbzkMw
 yUoo22Wv+Ll4IsCKO8N1om4a8t/Mx+GLvE0JQjcEQN0DC4nsvZUtjAHl//C7mATEEcUP
 NaNwUg0cc24nUw8YjqrRijUSxjcXpiRwTQU4juLF21iRYbdDVbuYgjgjVxjVWXbkNVZE
 ku9Y+kPwi16If6UZE59sBsxxQ+xU0zNAlrp+4tvI/9oXv9GlTGyDQU8EPihgGQx+xXLL
 K3mA==
X-Gm-Message-State: AOJu0Yzkpfqa/HpL/AOIsQ/AMH0DE0+i7S6ZleFwLCy5zPXvbG7S3UcE
 gOTcL30yNq1BMN5uPWlJYvUGGn1ZZ5gUN7poZ3WfeuzYTC4ppXVdg6FDw3aVSKgN0p6LF/fcfYh
 p
X-Google-Smtp-Source: AGHT+IHdU4v7gDHZKbL5zIzZXIk3UeeUmBOJNk05KmK03ZhGPXqY9DhahVySemxajyww4m3BsrEKrQ==
X-Received: by 2002:a05:6358:7f08:b0:178:841b:7703 with SMTP id
 p8-20020a0563587f0800b00178841b7703mr708080rwn.36.1706560856581; 
 Mon, 29 Jan 2024 12:40:56 -0800 (PST)
Received: from boron.threespeedlogic.com (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 y13-20020aa7804d000000b006de39de76adsm1174084pfm.139.2024.01.29.12.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 12:40:56 -0800 (PST)
From: gsmecher@threespeedlogic.com
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 12:40:32 -0800
Message-Id: <20240129204032.1980414-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZbgJAacXmCx1x_kT@landeda>
References: <ZbgJAacXmCx1x_kT@landeda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1706560857;
 x=1707165657; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQKi4SPR+FqcVcUxBTCUGp2iDT1hS/pdbfgBUWQNeV0=;
 b=BsN9Z+Gl0tekWr9f9LaSAC5aYlgkAuZAfYRZnBST2I7DJl/M53nAQ7cfxEdXwDZWfp
 +OLA3PD7HgJ8YsglfqD0C+rBahJU9GCwHlNKAwtSDu6fPO1B7foqBTZpGYag7u1CvMAP
 /cy5dMapG7kPk/gUr4VQm5k5d6VtgX8nf6WJccSjdD8ldu0o8OGwVbAqi2Kt2eVYLU27
 z7YfN20Sa4J5IGVZfZ8Yj1M/ko4HlKnwqd4JyJWDHYPJExBa1U8330yWsSAgz+BfP523
 lXofCJCIogNg8HqQR4yjJYwAGfIuEUNKRCRcJocI48+t4cuRd8oD345XgSbiUv5z9Vaa
 JUyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BsN9Z+Gl
Subject: [Buildroot] [PATCH] host-python-numpy: correct implied
 host-lapack/host-blas dependency.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Graeme Smecher <gsmecher@threespeedlogic.com>

Before this patch, host-python-numpy attempted (and failed) to detect
OpenBLAS as follows:

    buildroot$ make
    >>> host-python-numpy 1.25.0 Configuring
    [...]
    Run-time dependency openblas found: NO (tried pkgconfig and cmake)
    WARNING: CMake Toolchain: Failed to determine CMake compilers state
    Run-time dependency openblas found: YES 0.3.21
    Dependency openblas found: YES 0.3.21 (cached)
    Program _build_utils/process_src_template.py found: YES (/path/to/buildroot/output/host/bin/python3 /path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/process_src_template.py)
    Program _build_utils/tempita.py found: YES (/path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/tempita.py)

    output/build/host-python-numpy-1.25.0/numpy/meson.build:201:44: ERROR: Could not get cmake variable and no default provided for <CMakeDependency OpenBLAS: True None>
    [...]

Two obvious ways to correct this:

- Add some kind of host-lapack / host-openblas dependency to
  host-python-numpy, or
- Tell host-python-numpy not to look for (or rely on) external code.

Because the host numpy environment shouldn't be doing any numerical
heavy lifting, we opt for the latter here.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 package/python-numpy/python-numpy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index b52e0da17d..cc5dfc9224 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -36,6 +36,10 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
+# Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
+# in-tree code.
+HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
+
 # Fixup the npymath.ini prefix path with actual target staging area where
 # numpy core was built. Without this, target builds using numpy distutils
 # extensions like python-scipy, python-numba cannot find -lnpymath since
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
