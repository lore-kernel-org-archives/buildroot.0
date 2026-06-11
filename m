Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A2ACD98D2
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 09:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CEF605AE;
	Thu, 11 Jun 2026 09:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNU6oLmxQqhE; Thu, 11 Jun 2026 09:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3EEA605AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781170397;
	bh=5zIWeB86Oj6HUx5ALpuS1C2BF0FKugTAZICZuetUYqo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ks5iQQ/TBvWsybuwEbDEGOIg8fPgFVGnM170C4na56nGqSK9fNsk/ApQtBXoTDHNV
	 Dxt2KqxJTcveA+7VKVqCDJ2gB/wdCSqhfqWPk5/OKuhr9pHqv2E3zQ5TtN4Y3L0uIF
	 aukDUWnYsZUmhu7w9fCt6d7hY87Iup6ZV9owSmru0yEUddv+p6lMjANuVL4av/NbjH
	 5ImyIe5F7BZBssXmi9GDC00RQV0Axd7f6NCs6Q3mK+dhAq5DDXO2ZBsfX+oHNrH/xg
	 +1U7cSl27s5bH3CHbqQD9nipQq2iY6LEISAafZtWn8S9u36Cem7J8sf4FXbNOPxAwr
	 MTrvQONOl714w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3EEA605AF;
	Thu, 11 Jun 2026 09:33:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F8AD12F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 09:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81798408FB
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 09:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDrBJW-ZfQDB for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 09:33:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBFD7408ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBFD7408ED
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBFD7408ED
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 09:33:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso64725325e9.1
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 02:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781170391; x=1781775191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w8YZmm8FPQvGOKbZ8e76nHdz61SsGDrq46Yogzx5OY8=;
 b=jNrVTpFcxmHgNuwV1BygwfGkfBfGzmKteoxMLcRw8PFUAJbgEqKDWMc1OG1fFSOqIj
 e8AZHAmNjtHK4zprY8KjJbp82BP0s165pKRpPDfVDvSjr4ZwR7uijORJt4ShEJ24SvZn
 /TmQwffRNMJu9vhtzjKqo62kp1j5PFrJutUHjvZ6MTzUKbJxc1KVduQkP38cH6Pp0iUs
 1XBaESY5gPJZnAOrWeJTjRvFTo81PRecBZR2sre0C/6qAjhVmtKyG1YFSscR3ippSW5j
 P6AGfEHiVgI1gRbgOdA8OBVzDBYCMqkjaSodfzMvqDYXihmW0iSKmknrsgjflb5HKr0O
 vFXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/zr3Ufp5aFuTXyx12U5Cflca5C/6o6rwjQk7E2GTXfLPW0wtp5ZBQn5eIulSkjrP7NebGBKgsA7jQ=@buildroot.org
X-Gm-Message-State: AOJu0YyEb4riGiVgzpVLFAbICz3YW3UaN4Ab2ZzNozT0g1wJPLlA67xj
 q+8rW2QHRN/KC4XO8wvrP2fh/aOJJ40Gq0QNX/jKhZGnTb18MkkEDFOp2oTM7OkdyC4=
X-Gm-Gg: Acq92OFQSag4yMKx4fdUG41SEzWe0pQ3z0cl7mo/qxnsDllz0WFj1La/ghOkjH72BJB
 QMMzVk5RgUeqH6ladHUkJKU6RevBwIdh56e/ARXVlI0HTkOx0WyWYaFdHTO5Mq70fvYRM05AtCG
 j00V/NfanxXcn2IJdig624rBvg1V4tIJRh4I20JvklLD2pcrk/ErI7/cumJJybwyzc3MGR2ntnF
 ZDpeRZ4pzJ0YPmDuhkRu+85M8/iBph2eCaGuzVI0XCsYFOFBROkrtggopCjBa0uUqkJzQsBsU0w
 FDPc6vdAcGjOJ1SycQApstTpA1uryK89ng2rFZeCt5/pImKzgo4gGV6JNJfxCIsaG8ryPFxbdLT
 rLVR2mozuE7z/OMpeIdWmo5JU/vO1h/NjUr7yWoWaKxN23nmL2fGP/gtReD15l66kMlYvgEQFEa
 v4n/+7+WKjQMiH2bdusd0eayeq+it2FLw4tz4I
X-Received: by 2002:a05:600c:8b29:b0:490:be1e:6ce6 with SMTP id
 5b1f17b1804b1-490e55cdb37mr27349195e9.9.1781170390812; 
 Thu, 11 Jun 2026 02:33:10 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm68275864f8f.32.2026.06.11.02.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 02:33:10 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe via buildroot <buildroot@buildroot.org>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Christian Stewart <christian@aperture.us>
Date: Thu, 11 Jun 2026 11:33:09 +0200
Message-ID: <20260611093309.425882-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87jys8pyn0.fsf@dell.be.48ers.dk>
References: <87jys8pyn0.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781170391; x=1781775191; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w8YZmm8FPQvGOKbZ8e76nHdz61SsGDrq46Yogzx5OY8=;
 b=WsBaTjB0B/H8trXORzvQDmJdQ0eJGZkoTk2+PLgtrGWgrvV78edCx4I77uzFufrLxD
 5zxvHzaiZ/c2+RBQaVrNSwF0G7UxkQAjm8Qva0c25qzJFNQUzdDx5uc3xlQkW+dH6vR9
 8RomY9Nbo3kwwaMgcGt6Wh2ElXi2UDn9uI2SZp1LobrpJ8IrgO5MJAoN8llqKCPnt0hO
 yk6Ap3cf70j9irCotqSvbS3P8vijigFiv3gx/c0NBak5VTXpdzqz/UGB7Gs71Q7cqlUV
 nQciyGecfPdc5TN+JCpx1emKkSgntXUhnRAhaDqU2vnUlKJV5h8o2F2lpv4xdN1ZelLa
 Ri+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WsBaTjB0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/runc: security bump
 to v1.2.9
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

Hi,

In reply of:
> >>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:
> 
>  > Fixes the following security issues (in v1.2.8):
>  > - CVE-2025-31133: container escape via "masked path" abuse due to mount race
>  >   conditions
>  >   https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2
> 
>  > - CVE-2025-52565: container escape with malicious config due to /dev/console
>  >   mount and related races
>  >   https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r
> 
>  > - CVE-2025-52881: container escape and denial of service due to arbitrary
>  >   write gadgets and procfs write redirects
>  >   https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm
> 
>  > There are also numerous bugfixes.
> 
>  > See the releases notes:
> 
>  > - https://github.com/opencontainers/runc/releases/v1.2.5
>  > - https://github.com/opencontainers/runc/releases/v1.2.6
>  > - https://github.com/opencontainers/runc/releases/v1.2.7
>  > - https://github.com/opencontainers/runc/releases/v1.2.8
>  > - https://github.com/opencontainers/runc/releases/v1.2.9
> 
>  > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> 
> LGTM, but maybe check if it breaks setups without CONFIG_USER_NS=y like
> the 1.3.5 bump did on master (test_oci.py is a good test).

Thanks for the heads up, it runs into the same issue on 2025.02.x

```
11:22:10 TestOci                                  Starting
11:23:38 TestOci                                  Cleaning up
F
======================================================================
FAIL: test_run (tests.fs.test_oci.TestOci.test_run)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/tperale/Documents/mind/buildroot/support/testing/tests/fs/test_oci.py", line 58, in test_run
    self.assertRunOk(cmd, timeout=120)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
  File "/home/tperale/Documents/mind/buildroot/support/testing/infra/basetest.py", line 89, in assertRunOk
    self.assertEqual(
    ~~~~~~~~~~~~~~~~^
        exit_code,
        ^^^^^^^^^^
        0,
        ^^
        "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
AssertionError: 1 != 0 :
Failed to run: ctr run --rm --tty buildroot-test:latest v1
output was:
  INFO[2026-06-11T09:23:36.024152816Z] connecting to shim v1                         address="unix:///run/containerd/s/fa1df95770fd1282e346e863f7206cd70feb23ce61146496cab81901583e2aa1" namespace=default protocol=ttrpc version=3
  INFO[2026-06-11T09:23:37.510560752Z] shim disconnected                             id=v1 namespace=default
  WARN[2026-06-11T09:23:37.513943232Z] cleaning up after shim disconnected           id=v1 namespace=default
  INFO[2026-06-11T09:23:37.514640528Z] cleaning up dead shim                         namespace=default
  WARN[2026-06-11T09:23:37.687951312Z] cleanup warnings time="2026-06-11T09:23:37Z" level=warning msg="failed to read init pid file" error="open /run/containerd/io.containerd.runtime.v2.task/default/v1/init.pid: no such file or directory" runtime=io.containerd.runc.v2  namespace=default
  ERRO[2026-06-11T09:23:37.700984736Z] copy shim log                                 error="read /proc/self/fd/13: file already closed" namespace=default
  ctr: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: unable to setup user: unsafe procfs detected: openat2 fsmount:fscontext:proc/self/setgroups: no such file or directory
```

Regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
