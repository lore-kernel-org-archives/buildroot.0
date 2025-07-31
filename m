Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A70C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 16:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F85784660;
	Thu, 31 Jul 2025 16:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ONloEOzh-Ap; Thu, 31 Jul 2025 16:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CCCC84666
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCCC84666;
	Thu, 31 Jul 2025 16:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26DC713D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1869342899
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DR-Q8lCdvKV1 for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 16:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 800374287B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 800374287B
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 800374287B
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 16:57:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae36dc91dc7so189783666b.2
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 09:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753981033; x=1754585833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L0qippqk1wytl35X+zs9ANwmtwi9C8efNr2pLLQoSrQ=;
 b=ROebVhSNtGHGI49EA+3vgFB30CE51UTvgEnWg3ZMuaRvA7BnIRtJB9NtcBhhxqyS4Z
 f8jBRhJpW8SejoDKkz9g8drvFKigxFFd8sVch1BmU4gXlRLS3DBVTiVuNNsGwrU1Ox7K
 rkZ0BC3e3lRtiRg7wOyGxIIaM1H3KrMg1oLoUY/UI0YnwDPxEsQofVATfAS8+IUE/p7h
 7MPOZrIbJJ6WhEvmSONm2HT/tVrIsfEXov/AvOq7lk85v6YRRr9a/SLl3WARWvb/GNuU
 XJ7VW8VTOEDDWW2TBpmH/pJKJek3urub2AJufMQxxF0Shhe9Q0i+CCYAnntNT2patfqb
 5MoA==
X-Gm-Message-State: AOJu0YwAXkzyin6ym2HxfY4FLZflwuycWFi3to9bat7V/eU8noyAFrrU
 N+J6WOI8Ckf7nwZ7iiAJMAOETXdEMW3hFNyv1buV4pzZ4X/7ofgRRjJoo59pvqUnZsFIZ5Q/ZxH
 oeXPqNeE=
X-Gm-Gg: ASbGncu8qwEE8nGzfPMbmr8amsDEpxf1pRZ1WE/mQa3JEHkoZRkmMP0tC0/aN5ypCCh
 HAX4twn4EvuqRudwH8zZIi03FFnrsqcMmEfLoDq0YTQ7mO4wf0UIF6gLyrMVDhfpsg3oqBvArmG
 fO/+3d3WfYllKkOmyrRe2mzh4mYWRtYZ/xUdWGaE475QvPXs/IO7Zx3YmYGyuhGgEYHrQGFSuYJ
 O3S5k/5YNRTyAL6e1VOB5u5LjeK2CTggZYfqzVO8SIOxqhVdxQ8MkpjW3nHhfVT/2K8IEiJ80VF
 eY5TwciSKCRJVvDs3USDtfi8IiccmnN5tauxjs2mvfctevqma/IKIJJih2xedi7TzWza16UPdw/
 GG09GIckbDY96qxhkQZC6zTPYnULFO5dt41NYlcW9aamDQ8s=
X-Google-Smtp-Source: AGHT+IGnZcXmYuelhiAp1r4Vj9YiHGWajn+vnwXMYfVnmi8e1OaY0dRbRuyL0IWnOU34diLzzfcpHA==
X-Received: by 2002:a17:907:96a3:b0:aec:65de:5258 with SMTP id
 a640c23a62f3a-af8fd691e69mr954464866b.3.1753981032597; 
 Thu, 31 Jul 2025 09:57:12 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0765f0sm137425966b.28.2025.07.31.09.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 09:57:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 31 Jul 2025 18:57:00 +0200
Message-Id: <20250731165700.1426768-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753981033; x=1754585833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L0qippqk1wytl35X+zs9ANwmtwi9C8efNr2pLLQoSrQ=;
 b=dTCoeOYpeK27kv9Kkp2eSTSl6gOjPF7Hpnmwf5Sls+TiEFUdLWXSx624+ClLRBNXT8
 Nq0+NqA1RjnulCeV0UI1wrjdUVfO7DCMUnvUq9BfJTjnzJW5CHY+v4LGU4dVMwr8D/VY
 MoBE70VgaNi8zHXeTvcfjm2i2LIGjKOUkH/U7s5PdbsuhM/9RfB+0ICNyIlWcdBZUPfZ
 ulDIa8MUpF388ApQnNXV7p7+qhOpCfhbE9sZlN2EabuD1iA7Jit4cDrHWRGTHRTSs5lr
 AzUKI96cvj9Xn0ABDT8FdeTfDDOUbmJS/k/xjRaklF0QZvVTnqlmf6YHu1LArfIU7RGd
 yW/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dTCoeOYp
Subject: [Buildroot] [PATCH 1/1] package/janet: fix build w/ musl
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

Since the commit [1] the janet package started failing on the
autobuilder when using musl libc:

```
[50/56] Compiling C object libjanet.so.1.35.2.p/meson-generated_.._janet.c.o
FAILED: libjanet.so.1.35.2.p/meson-generated_.._janet.c.o
/workdir/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -Ilibjanet.so.1.35.2.p -I. -I.. -I../src/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c99 -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g3 -fPIC -pthread -fvisibility=hidden -MD -MQ libjanet.so.1.35.2.p/meson-generated_.._janet.c.o -MF libjanet.so.1.35.2.p/meson-generated_.._janet.c.o.d -o libjanet.so.1.35.2.p/meson-generated_.._janet.c.o -c janet.c
src/core/util.c: In function 'janet_strerror':
src/core/util.c:977:12: error: returning 'int' from a function with return type 'const char *' makes pointer from integer without a cast [-Wint-conversion]
[51/56] Compiling C object janet-native.p/meson-generated_.._janet.c.o
```

The commit [2] introduced the issue in v1.35.0, the `strerror` function
has different definition on glibc compared to musl. This issue has been
addressed in commit [3]. This patch add the upstream commit [3].

[1] 31212c4c58 package/janet: bump to version 1.35.2
[2] https://github.com/janet-lang/janet/commit/8334504f4e5aa253502a45db3eeb4db265490b4e
[3] https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568

Fixes: https://autobuild.buildroot.org/results/ff1/ff1d6063c1a79d17cfa9910cca824e704a4a0c67/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...heck-for-glibc-instead-of-gnu-source.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/janet/0001-check-for-glibc-instead-of-gnu-source.patch

diff --git a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
new file mode 100644
index 0000000000..5ee021e658
--- /dev/null
+++ b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
@@ -0,0 +1,26 @@
+From a5d6b2283834422a9fa9e79b5c7ad9b932b52568 Mon Sep 17 00:00:00 2001
+From: Calvin Rose <calsrose@gmail.com>
+Date: Fri, 21 Jun 2024 17:17:22 -0500
+Subject: [PATCH] Check for __GLIBC__ instead of _GNU_SOURCE
+
+musl doesn't obey this behavior.
+
+Upstream: https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/core/util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/util.c b/src/core/util.c
+index 4bb37abc5..6cb5676e0 100644
+--- a/src/core/util.c
++++ b/src/core/util.c
+@@ -972,7 +972,7 @@ const char *janet_strerror(int e) {
+ #ifdef JANET_WINDOWS
+     /* Microsoft strerror seems sane here and is thread safe by default */
+     return strerror(e);
+-#elif defined(_GNU_SOURCE)
++#elif defined(__GLIBC__)
+     /* See https://linux.die.net/man/3/strerror_r */
+     return strerror_r(e, janet_vm.strerror_buf, sizeof(janet_vm.strerror_buf));
+ #else
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
