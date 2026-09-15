Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302CBC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 03:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9761E605E9;
	Tue, 15 Sep 2026 03:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fj43uVlMfSxg; Tue, 15 Sep 2026 03:22:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8664D605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789442567;
	b=g7jufEc/a516Ilw/hKEJcPf+/FXkXCw178ymfkb+I90jaemA4feI7CQBBSRQ1tLZ9Ug9
	 JLsnW/Q9y9EB3B73K5dqHKOti6+vsrvPBgmhsnn7isKQfhkZR/yiK7F8JGSCGjdY1rcsi
	 WwTY+ARsYStvJyLzschuGlCfDDKm5G+65ZfBKuZWddV+gkp+hHp1ZGRh8wtnYkWUyXIDu
	 icpQ+MfjKdvgNheoYlYkr0biRpFqxTlQjnPtA5BOfUSFp87J3HdTHyijEC9972WBppNew
	 F55gqau75BJFNshVtRQphesjudSyp7MZv6WukP5mAsGmDHqEvixhe1w9fBPW7Ys+aiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789442567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PwQQIDEFwHtJENeIjL6b/R2oFNuQaYR1m4tz0mw9qMY=;
	b=AHPiVjgcDrZqj50sBWCM4v55x6QyjmVb23pEKuurd5Z0bu1EGrqbFUZ2Qsx2TVNH/gpL
	 K2CmFZo/46Fp0ShXsqvVLC7eMlXu4zKAAx38WO81kHTPYNKcy/b+o4vqYH4cKvSHdcGo5
	 qKBSQMFAXL8e58AL46yvjePVUNhZvRbqNR/bTreMHK99hIJ9/H59pJfoXRtnpFD14cE4K
	 wyAnf+ba6gpM7gFc/odPWiQ666ez2pdhJO7n+5d5AwKg5tSSV6BbfcqR/W0T42Nwcw7IF
	 NGhFbQDAUTIkDvTVygbAESSRGbybOPhXFDgs0rokoUYtuEV3JiZIecg30X73V85CgUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K+PWkYdg;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789442567;
	bh=PwQQIDEFwHtJENeIjL6b/R2oFNuQaYR1m4tz0mw9qMY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kPyNolelbIrM5HmNTxteGtUXu7LxPoCT3WG3bSZ2DjRKinRwlgfqC/+Wc5i5UXJ6b
	 b9nRqCQm66FAWmvaviwzu5v5fp10ok2oXMsRI1q1QJP/8G+GGbBPvvkD8ChKB00dvE
	 rpyhgwXT/GdnsYyP8eze+c4khSYYoTxuGafqXZCqarJU//dXlRXVnfC7ezu/n4qUJp
	 jL8PK9sQdSmvHDjQpIcM9LLXkaONRJWs0nTahLbzCoXjdsrUybzrOb/BgPoFEFBSN+
	 vs314HWJ2eQcf7eGT3ULGGV8msmf0iLVPhwmQVl8W3v6pheL7PHvq0433dRSDpOgRD
	 v+C8etdhgn7Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8664D605F3;
	Tue, 15 Sep 2026 03:22:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEF0B259
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 03:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4D2E605F3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 03:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_1UxaQTonzg for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 03:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 61872605E9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789442564;
 b=EY/BZwhdDItNg8VvDGCsAVNku6nT58Wn1N+r8vhzhPJxwHDONbiiG6s2Q9/YsUFP3b2Y
 o7t7AZYK0sFF5uM3mphzCV6LoZ/cKfWqNixhgUHXd+zxAAWvjft9yraJTub6kUQzWQavV
 yeOHCrRS5r2YtcE2Np7bJX3eI1E2q5Y+zcTZ6zvlk0iPYIjfTnJNYWlneabop+jellfKv
 YRI11Eh0qEu8YmwxbZ6MQ5p/wcSi/Mfv6j5oGubta+WEEtN3MGSalFEAcTJVVrkIjkO4+
 /cD7yWBc0HQxlGq0w0bSgWPouACD9LlEX2e+hmQaeNo37THKqvzsvyYEty2zycFDx0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789442564;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=KOAMIOSLQS/BKSB5AUxcmAcxa2dM2MwRlZjCWbtPj48=;
 b=KWhjip4vp132atUJTAnzXhEEjBjiWQm1odPEV9iLzIE9yMeS2B+R32XLU28Zimk5n8wX
 PrMY2FriiwCkb+mCgYUPeARDn/uK+h1Lg9/HmoGuL5exmZVGvMD/3e1l7BQZpgdwGyrks
 oRmPfqsgx5/crN4BVXdubIV72aVn5BnghEn+5pqhGEkEAbU+Q035FLLCuic2w5fJnuwMx
 ZyxtRF6nkjXMmopvugzxngnPyEx+6E1830LdpBZUqyh0XVsyv4nedNwbsk3OjlvnVch/f
 rI/jJ4h3f26jG55zGXaX+4LjpIAXRGqWLKQYp3RKoknRQr6MUTf+/2/EUrKBCpKd+SA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=K+PWkYdg; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=K+PWkYdg
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61872605E9
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 03:22:43 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843f22dc83so1888729f8f.1
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789442561; x=1790047361; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KOAMIOSLQS/BKSB5AUxcmAcxa2dM2MwRlZjCWbtPj48=;
 b=K+PWkYdgTqW6ZpdvDuZxzz6RQSltD5Pca6GBR2SU+PweEwdkxEQzClXspzw5GXzO2X
 vCUO2XGJg8cxCE2chIFEPf8cUlMWOCki+BGtuwp53hsxz0SJoUUZx5IfyUyScEBhC6Rw
 +ulmvQGa2uFyriWdyf6KFwrxSYfSlYnrcUfw38GtoehcVmocigfrHR0UOQppvOnwyDvq
 VVYDWK4YUqHFBW+nI4xH7cTSjn0nlgjyZjPpetwTgXjpqFNpoeU1743R4ALADukfx2rZ
 uiLVULEUAzcRkHH8A3zjDSNc620N3gAWrkwe7laPgvqINvk55d2HWWzo9HAOpj4cYs6h
 3slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789442561; x=1790047361;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KOAMIOSLQS/BKSB5AUxcmAcxa2dM2MwRlZjCWbtPj48=;
 b=Vz3KnAg/doFpBRj6gkSPA1/WvhICCF2oGwngxVrh2MJzb92AlTBCm62HWhAtdcd+cC
 x+Uih8S+Cp63je8R9PZ7U1VqgWdOlVhdqoSFT/LGOeuyXPA3DWLn280kxyKQZFOfjjZl
 9iQOlRKUr4VMlVdDBJNflmn9LPIK/M76DLVndVMmSYMwvRhbHHyY7VPOQ98CdOOhS10P
 um4MO3zjCkUqhZSn5USwatV8wQog3YJM67kdJTVXgPiCjlY6IJq7CGDFPmtIOF5eAFJQ
 lbMiGsSiUCIna5C8ETLspUTT7CW46T4uRhROClXJSO7nPfcw7Qqh8/tkGFHl6uEa6yIG
 240g==
X-Gm-Message-State: AFuF++lW5L466/FzFLk/UhGLfKwd/aV731ub39+neEIrn5WdnVaYhf9X
 zcGSmdArgye5XVldT3YyvnUjwsRcUVWqh7ZlW6oUejBrF+bmtHUE5DlqaulEmtmak9I=
X-Gm-Gg: AYBFou01plgc9M+Sp033RN9s/utIfuOC5rywBIM6JUMcSrcbkh3wUZ5QP0x8YVjSnLv
 JhPAcudlftXV9zWx7zITp/OI9k7IXhgDN1GDVC0K5sNc/qudjciWwMQFnsM+WaNjDdcN3slBYIH
 JrvuLdTVE8B97EmTbVtGRpKT67J37rpI83OYig3fGC5aHwjqAgamlqvy36XTbUvlZER1NRupihN
 ZOr7bVAMyOrsC7TxV8Pig9f+WhRwx15X27MU1CX1WsFj9AVzlZ0JXDiZnO5qeoKS8tsnM/GdFX6
 GphX1pjM6nZ+M2QE8BgXVc/2+UHW4Y3B1E9JsrKYkeccTC2w70HUB3uXPx4t33XG+w7GnILYDgc
 +Qp6FrLXg7Tst6jfRSGxMLBS0LGWc0c/GO7xWlz3L1wfYQNwjYbNIV2gTxb8BvBd/GYOabqQvRk
 8nYd7n+0CT0ijo8So9dL5W7QRzdcMmFYp7AsFpebm1gAlp1pa1wYvrcHS4Ot46dpiOM1mBpMa5m
 Q==
X-Received: by 2002:a05:6000:2281:b0:486:f980:2361 with SMTP id
 ffacd0b85a97d-48702b186d1mr6462876f8f.45.1789442561135; 
 Mon, 14 Sep 2026 20:22:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb33ee5csm31312571f8f.20.2026.09.14.20.22.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 20:22:40 -0700 (PDT)
Message-ID: <6aa8ba00.63ed6291.2b47ca.6de5@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 15 Sep 2026 03:22:40 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  4  |  0  |  6  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 26  | 45  |  0  | 71  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
 ibm-sw-tpm2-rev183-2026-08-26 | 3 
                   perl-5.42.3 | 3 
        edk2-edk2-stable202602 | 2 
             alsa-lib-1.2.16.1 | 1 
                   atop-2.13.0 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
              cryptsetup-2.8.8 | 1 
      docker-cli-buildx-0.25.0 | 1 
            dt-utils-2023.11.0 | 1 
              fftw-quad-3.3.10 | 1 
      freeradius-server-3.2.10 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
  gobject-introspection-1.86.0 | 1 
              host-rust-1.98.1 | 1 
                host-wine-11.0 | 1 
      libabseil-cpp-20260817.0 | 1 
                libglvnd-1.7.0 | 1 
              libopenssl-3.6.4 | 1 
                   linux-tools | 1 
              llama-cpp-b10702 | 1 
                opendoas-6.8.2 | 1 
                openntpd-6.8p1 | 1 
                  pdmenu-1.3.6 | 1 
                rdma-core-62.0 | 1 
                rocksdb-11.0.4 | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
                    sbctl-0.18 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.07 | 1 
             util-linux-2.41.5 | 1 
           virglrenderer-1.3.0 | 1 
            vorbis-tools-1.4.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/a11af6b9b80e2267a8019a1f4d02689c61891e0c |     
  riscv64    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/b628315a96c62939f72cec2bea579c0e7d8b6e90 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/f98e44c9a65e62a2f46ce20c924b6babbf62bccc |     
  aarch64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/61d73a94292006edfdd203b02184687de2ee349f |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/b3019435358c05bfbccaa8b1a9decfee9ba3e606 | ORPH
  riscv64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/73ad04edff7d3d8c53a78a211f185d9c95d66c52 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6f9dae8e9200e7098fe5aed9953c2dffccd1ca7b |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ca0fcc2561ed5bc8bc96800566739606a7a1acf2 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/a52486b4290006d3e412a90f83ebd57932f879c2 | ORPH
    i586     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/fc25d61d9ad4cdcc223b87929526855eea79fc1b |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/3998fd390f608822aa6907a2e52cc49531dd53d0 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/4eefff31d6d92b15fb403164498e8d72a4704c1f | ORPH
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/edf75652211d29543c6038b8b6415502c606ecdc |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/b1a212a09a0a61a754a0c5d33cd94bf29d25f28a |     
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/57f97d6b3502ddca3d5001653ebc2f643ecce41f |     
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/75c4a8f7be7403a8f5366fbe4a926e00262d8681 |     
  mips64el   | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/55b7ccef53ca5e0373db171858205f758ecbe0f8 |     
    i686     |    libabseil-cpp-20260817.0    | NOK | https://autobuild.buildroot.org/results/7eaa703f74ebe3fb827c34bb8dc7aacdc6cf890b |     
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/901388167334034a0046913833430f661356ed2f | ORPH
  riscv64    |        libopenssl-3.6.4        | NOK | https://autobuild.buildroot.org/results/7a96bfc12b5feb4a801cc7bcc21dbb3b5f20db8d | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/575b787730c7f14a81cfe1626e7bbf2e5e9b0f60 | ORPH
  aarch64    |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/8866e4ceb5f8814c5ba449bd5152e37fa28f9fbc |     
    i586     |         opendoas-6.8.2         | NOK | https://autobuild.buildroot.org/results/c68d0f17bacbd1858faec3ef44e7cf8afc839008 |     
    i586     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/bf3894035f4dd3d6f991b27d33794d0f5d4b8787 | ORPH
  mips64el   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/28726028d576f6aa3692b295ad3746f27aecdd03 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/a6f02d52fe4e3380783c5af087512a69c9c8d5bd |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/6e7d0ff420d67d020fccd58eea3ab9ae28c75c5e |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9664a311fbb67e6410b149bebd7c32f63ce01030 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/7b56ab0754fd261df86a0b81c214058afe552e3a |     
    i686     |         rocksdb-11.0.4         | NOK | https://autobuild.buildroot.org/results/b8e4973080cc750d066bfe2d95fb6fc46b15ae2f |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/7808946c1bd186fbabb80d33e30a8d552733243f |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b431ad53b20564a7cc0f16940ffee6e1ebc39f0e | ORPH
   x86_64    |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/d0149c46ddab4ecd5ca488993265d29b0330f34b |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/bd903e0a50d957fec03d0b521d51baa72020b73e | ORPH
    i586     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2a8cb70e167f12115721a97f00a22fda18012e9c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/887b9c0985f09a5ea3f0ba132f0ac3e7bc48a9df |     
   mips64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/ac6fa026f67d848ebbf04b7025c71ba2cfb91d5c | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ca81e8a209b003ab58c1d793ea46e59d2b98004a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/de18d4cf620857357a25193704be171b0954d3b4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a3c164f4e8d4768c82f80b5eaedfed9afe9e63f4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3caa6fef7db55965246eb92b14ac9db03cd6fce2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/575a97b48425832e3202c366ac9be21f7bab6ece |     
  riscv32    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/4e6e7b21f0a17f5f6d910a023cb81f998e3b1db4 |     
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/5ffdb0e1dfea1010ea5422d3055671d15ee2dc5b |     
  mips64el   |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/4d9cd1790b4b0e403d14c2562417b343c25eca70 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              host-rust-1.97.1 | 1 
rtl8822cs-55971663534233fd8... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/16b6cc3e1de7bbea99bb554b09c59e2aeebbd627 |     
    i686     | rtl8822cs-55971663534233fd8... | NOK | https://autobuild.buildroot.org/results/57b9681e4adef229ade141806f8a7022b5fe537c |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 
            python-iwlib-1.7.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/b6adc2579c81160c63d5f1aafa73a00b8162a3e3 |     
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/633f237d67e12d83737ce958cbc119fbbf118596 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 gerbera-2.4.1 | 1 
                   iotools-1.8 | 1 
            minizip-zlib-1.3.1 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/15d80693410730ca9d1f3cade3b21fc72031a015 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/75a75c1e3c4bba4ddc5541df7c53e84164389ca7 |     
powerpc64le  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/5830e314c9764848f08d349435278a89a8a089d9 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ebe8caf216a05994a008ecf5b5fa2ea6507a665f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
