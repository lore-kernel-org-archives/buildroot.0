Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0F2ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32C160A97;
	Sun, 30 Oct 2022 22:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32C160A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QVD6g2qC9Vw0; Sun, 30 Oct 2022 22:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B942560687;
	Sun, 30 Oct 2022 22:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B942560687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99CC71BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71FD940101
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71FD940101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgR3WBojxBwl for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:17:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA22400DC
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA22400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:17:50 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so11918088fac.1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6f79yvnOi5SpaEZaQG1s//wb9ESjpEzfzo/Od/0426g=;
 b=NCKC5XIiBeH8zBjP3XI6l6IdjNzT1UCelqQJ/5pc4kGbAhIoJmCmDOqmDvjVYRqjmo
 Y26tLGZTh+BaaXHZzPCAe1zd/OTnT9YaMMd0UqHt+xnRq9M761ng68OKWSMU2SCqEf0S
 1gQPnGomEQWlVlpwT/RRVlvS2uKi0dhzmP1z2kesshTwCXHbObjgopgPplwg6/s+UBSi
 tR92MTaG59Xp1kvUW9oI1sVjVyeSTHS9igA6/+jy3KpHLOT9LuSpaMxLjIN/R2atCJJC
 gZEgbXXTCGjNt2i9UPWS4Wukc8JmhHqIC4r67jzVMUENLZG6ms0+eXGaUgxZMTGXOY5c
 2TYA==
X-Gm-Message-State: ACrzQf1XMpRDEYDZgPM+Ib2bI4NplWPRji5wZqBGOdsvsVMcwuvT9ivK
 XMv7RuBYDo21KhjB6szzbNMyKB8UKe0=
X-Google-Smtp-Source: AMsMyM5w13nqkF5ZQaLN4q7PyiQLn9ED5vqSEfLDE4YHoEJZCeKQLGRiZ0x/M5irVE8DtX/3NvGmhA==
X-Received: by 2002:a05:6870:96aa:b0:13b:83c1:4c0c with SMTP id
 o42-20020a05687096aa00b0013b83c14c0cmr5880360oaq.22.1667168269435; 
 Sun, 30 Oct 2022 15:17:49 -0700 (PDT)
Received: from gmail.com ([2804:14c:7980:988a:c978:dc5f:a55f:695])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05683011d500b00655ca9a109bsm2091424otq.36.2022.10.30.15.17.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Oct 2022 15:17:48 -0700 (PDT)
Date: Sun, 30 Oct 2022 19:17:47 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: oguz.ozhan@mind.be
Message-ID: <635ef80b8245f_3fcfb2ad92177830821937@xultri.mail>
References: <20221021091531.2989489-1-oguz.ozhan@mind.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_635ef809be6eb_3fcfb2ad921778308218b3";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6f79yvnOi5SpaEZaQG1s//wb9ESjpEzfzo/Od/0426g=;
 b=E9whkLRk+g4PffmLh/ersrin7hsy6X6CoBjtQVtPm1Ay6P3LremiKCJAlZXzS44Z2c
 2J1V/oR3Qn023lg3Z2uBXRYi/OX69i8nMp2V9u6pILLJd4jONlkfs10tBVnGvHQvV77T
 AqDMSqmir7ULFbzMcOyQBMJxR9KeoFWZkq21JX12uCkFWFlX1nLUfRBCi2uPJhf/BW3s
 xB+FnNA45sEWIi55PS237KdzVPNhWOxHU3FteE321Mju3CQmm70RGqy4kqBE/L/aaA2r
 Mq3OA6bBCSgeEJA7K7MMHO97U25/usjRVAxXZvo00R5B9yQP4dgi8qvltRN0FeehklV3
 aPcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E9whkLRk
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: replace nose2 with
 pytest - Dockerfile
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_635ef809be6eb_3fcfb2ad921778308218b3
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I am not against to switch to pytest.
But I didn't understand clearly yet the use case that motivated this series, in
which nose2 is not good and pytest is better. Could you elaborate?

Also, there are issues to be addressed before merging this series:
- the detection of a failed test on GitLab CI is broken, even tests failing
  return exit code 0, so GitLab infra mark them as PASS, see [1];
- run-tests -s is broken (does not show the build and runtime console);
- support to ask a single runtime test to run on GitLab CI is broken due to a
  regexp that needs to be adapted;
- the manual needs to be updated.

There are also some changes in behavior that would be nice to be highlighted:
- someone willing to find a test in the output of run-tests -l can do:
nose2:  run-tests -l 2>&1 | grep pattern
pytest: run-tests -l | grep pattern
- total number of tests:
nose2:  run-tests -l prints the number of tests at the end "Ran 481 tests"
pytest: run-tests -l does not
- the name of tests change (list)
nose2:  test_run (tests.toolchain.test_external_bootlin.\
        TestExternalToolchainBootlinPowerpc64lepower8GlibcBleedingEdge) ... ok
pytest: support/testing/tests/toolchain/test_external_bootlin.py::\
        TestExternalToolchainBootlinPowerpc64lepower8GlibcBleedingEdge::test_run
- the name of tests change (local run)
nose2:  support/testing/run-tests tests.init.test_busybox \
        tests.package.test_php_lua.TestPhpLuaLuajit
pytest: support/testing/run-tests support/testing/tests/init/test_busybox.py \
        support/testing/tests/package/test_php_lua.py::TestPhpLuaLua
- the name of tests change (gitlab test suite)
nose2:  git push gitlab HEAD:foo-tests.init.test_busybox
        see [2]
pytest: git push gitlab HEAD:foo-support/testing/tests/init/test_busybox.py
        see [3]
- the name of tests change (gitlab test case)
nose2:  git push gitlab HEAD:foo-tests.package.test_php_lua.TestPhpLuaLuajit
        see [4]
pytest: git push gitlab \
        HEAD:foo-support/testing/tests/package/test_php_lua.py--TestPhpLuaLuajit
        see [5]
        NOTICE: the use of '--' is just the first solution that came to mind.
- the name of tests are longer, so in the GitLab CI the display is a bit worse:
nose2:  tests.init.test_busybox.TestInitSystemBusyboxRo
        tests.init.test_busybox.TestInitSystemBusybox...
        tests.init.test_busybox.TestInitSystemBusybox...
        tests.init.test_busybox.TestInitSystemBusybox...
        tests.package.test_php_lua.TestPhpLuaLua
        tests.package.test_php_lua.TestPhpLuaLuajit
pytest: support/testing/tests/init/test_busybox.py::Tes...
        support/testing/tests/init/test_busybox.py::Tes...
        support/testing/tests/init/test_busybox.py::Tes...
        support/testing/tests/init/test_busybox.py::Tes...
        support/testing/tests/package/test_php_lua.p...
        support/testing/tests/package/test_php_lua.p...
- bash completion for the name of a test suite
nose2:  no completion
        support/testing/run-tests tests.init.test_busybox
pytest: since it uses the path as the begin of test name one can type
        'support/testing/run-tests support/testing' and use bash completion for
        test files names:
        support/testing/run-tests support/testing/tests/init/test_busybox.py
- cache of results
nose2:  no cache
pytest: it creates a .pytest_cache/ with a cache of the results, so we could
        later expose another parameter in run-tests that passes '-lf' to pytest,
        which will re-run only the tests that failed on last run
- verbosity when collecting tests:
nose2:  no output
pytest: prints a summary 'collected 1 item'
        'pytest-parallel: 1 worker (process), 1 test per worker (thread)'
- verbosity while tests are running:
nose2:  show states for each test (Starting, Building)
pytest: shows nothing before each test ends
- verbosity when tests fail:
nose2:  verbose
pytest: more verbose than nose2
- verbosity when tests pass:
nose2:  show states for each test (Starting, Building)
pytest: show only a '.' for each test

[1] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/3248620433
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/680878149
[3] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/680879324
[4] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/680879308
[5] https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/680878335

Regards,
Ricardo
----==_mimepart_635ef809be6eb_3fcfb2ad921778308218b3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_635ef809be6eb_3fcfb2ad921778308218b3--
