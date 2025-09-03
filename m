Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057F6CA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 23:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8911F84A9D;
	Wed,  3 Sep 2025 23:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiM3D5GPOu_9; Wed,  3 Sep 2025 23:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89BF784A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BF784A9E;
	Wed,  3 Sep 2025 23:28:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCBDB106
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 23:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDF6584A9D
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 23:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sx079_ltG7Jm for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 23:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 569D684A9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569D684A9B
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 569D684A9B
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 23:28:07 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7227bc08c97so10805337b3.1
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 16:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756942086; x=1757546886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qMfa0Po6AON5gKDR6IPWYqovOd/cI9bxk3AYRRhlrHs=;
 b=Lhpo+Wk6Wb3SWjtAK520HSj3/FbLyXJxDUY8BuMD6zQN3AcJySaRtMeY/gOBy0rljo
 joobz1vXVaO+kJJKMgnJX1lEdZTX32hUEJPR2djMeUITRUMgyrifhQ/SA5Nt+tePn+B/
 NjqY2PfE/Gxk3ThBDGAwKu3W9f2EyIy5LNNOa5RzHqq2a2sCcFK4lNRDFYuE3Iv4u2Dp
 Nk8ws4qO4SG3mX5Js3n4yLFZ5lMlfnlRBEkhdMc7pSX7y3DYNU/EDOQRQ3hg+ZdKFBjK
 yp6+ptNDJJBeKvGCfSMCzhPCgJm5C9iqGWoH88m+QWA2c849WJ6BLanDTErHaXKol7tG
 z4Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdwhG7kUf4v+EjG0001AUpx7Ifdb4c9MNvHpIfay+kpPn+APb9oRmbVsgexaq+F8FbRM09PrfSl6c=@buildroot.org
X-Gm-Message-State: AOJu0YzlxOmiHUhxUHljp4iyLVSX+rkY57c5JT9wZSRP5rjskoHURtmR
 zn1AuOh82rO/q8lXY8k+g2W1awRI92xfbOdkLu+jfTlPrjsG/CE1ujzxt0JyetbmvoieDc2cLY9
 3NrngcW06ZjYpmbgMChKmomz5hKi/MM4=
X-Gm-Gg: ASbGncvDUgn+aVgh12zmi02heBMhai/xYQyojJpvtYUZ9O4CAqihvJHbgUL+8jogNJp
 R4i/d+c1fqth3A6+XmyEaXHjvyGHC5nHrqKsl7Ekx3wf457gO3EIJnS2CwUr03UGL3CbRqtv6pz
 zJUBvlnmREnbSeQl3okHsozs8ohC49NVW9zMSUhsd7DkRlC4N4WuETdwuX7TPOVlrHQ5B8cfkL3
 8UZq0RCrC9QXZuUHPUrG24ES8od
X-Google-Smtp-Source: AGHT+IH7FznMSuqEQ2w53VR/rPJV67jGSBAu0+n6G5x02tRwmPlsb58/aw/SdRFJTb2blOuXAEnNZ3frBVjX7pavExM=
X-Received: by 2002:a05:690c:56c7:b0:723:98d5:7a62 with SMTP id
 00721157ae682-72398d580ebmr117553917b3.3.1756942086010; Wed, 03 Sep 2025
 16:28:06 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Sep 2025 08:57:54 +0930
X-Gm-Features: Ac12FXyBWvVQJdjUNlsar2kSzZYXaU1pqyCoAGwB_58XykOmtj1mldKZW998MQE
Message-ID: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
To: kvm-riscv@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1756942086; x=1757546886; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qMfa0Po6AON5gKDR6IPWYqovOd/cI9bxk3AYRRhlrHs=;
 b=mXExmJqChaZbZE9MWMJIwby/S4um6eqf9apL7o2pgSYaCLvZm/NkSwsp9t9Tuif4KN
 CRIBOfKTilYoj7g1Q2DXo+Xepy5Ry2h7qr5+fhYCTQanXjtx2+P00Hj5LPCVZZkgJPkp
 qM86xRFVpiPN7q2bwYmnbNil33HirOYCqVmwY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jms.id.au
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mXExmJqC
Subject: [Buildroot] [kvm-unit-tests] riscv build failure
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

I'm building kvm-unit-tests as part of buildroot and hitting a build
failure. It looks like there's a missing dependency on
riscv/sbi-asm.S, as building that manually fixes the issue. Triggering
buildroot again (several times) doesn't resolve the issue so it
doesn't look like a race condition.

I can't reproduce with a normal cross compile on my machine. Buildroot
uses make -C, in case that makes a difference.

The build steps look like this:

bzcat /localdev/jms/buildroot/dl/kvm-unit-tests/kvm-unit-tests-v2025-06-05.tar.bz2
| /localdev/jms/buildroot/output-riscv-rvv/host/bin/tar
--strip-components=1 -C
/localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
  -xf -
cd /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
&& ./configure --disable-werror --arch="riscv64" --processor=""
--endian="little"
--cross-prefix="/localdev/jms/buildroot/output-riscv-rvv/host/bin/riscv64-buildroot-linux-gnu-"
GIT_DIR=. PATH="/localdev/jms/buildroot/output-riscv-rvv/host/bin:/localdev/jms/buildroot/output-riscv-rvv/host/sbin:/home/jms/.local/bin:/home/jms/bin:/home/jms/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
/usr/bin/make -j385  -C
/localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
standalone

The failing line, with the full paths trimmed for readability:

riscv64-buildroot-linux-gnu-ld -melf64lriscv -nostdlib  -no-pie -z
noexecstack -pie -n -z notext -o riscv/sbi.elf -T riscv/flat.lds \
    riscv/sbi.o riscv/cstart.o riscv/sbi.aux.o lib/libcflat.a
lib/libfdt/libfdt.a
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `cpumask_test_cpu':
lib/cpumask.h:35:(.text+0xd8a): undefined reference to
`sbi_hsm_check_non_retentive_suspend'
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function
`hart_suspend_and_wait_ipi':
riscv/sbi.c:591:(.text+0xde2): undefined reference to
`sbi_hsm_check_non_retentive_suspend'
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `cpumask_test_cpu':
lib/cpumask.h:36:(.text+0x1064): undefined reference to `sbi_susp_resume'
/riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `susp_one_prep':
riscv/sbi.c:1434:(.text+0x1796): undefined reference to
`sbi_hsm_check_hart_start'
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `check_dbcn':
/riscv/sbi.c:1247:(.text.startup+0x9fe): undefined reference to `check_sse'
riscv64-buildroot-linux-gnu-ld:
/localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05/riscv/sbi.c:1247:(.text.startup+0xa02):
undefined reference to `check_fwft'
make[2]: *** [riscv/Makefile:131: riscv/sbi.elf] Error 1

The full build log is at
https://ozlabs.org/~joel/tmp/buildroot-kvm-unit-tests-build-log.txt

I was able to reproduce with the 2025-07-31 tag, which is the same as
today's master branch.

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
