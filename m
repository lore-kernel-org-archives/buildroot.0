Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85534CE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2815C60E19;
	Sun, 24 Sep 2023 21:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2815C60E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGqZGYH3TU4X; Sun, 24 Sep 2023 21:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F3C60F20;
	Sun, 24 Sep 2023 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F3C60F20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A105D1BF313
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871534161C
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 871534161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TktB7Au5IWMI for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:02:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E98C41620
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E98C41620
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095B9240004;
 Sun, 24 Sep 2023 21:02:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkWFJ-001wLc-7M; Sun, 24 Sep 2023 23:02:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20230916070153.2983243-1-m.niestroj@grinn-global.com>
Date: Sun, 24 Sep 2023 23:02:29 +0200
In-Reply-To: <20230916070153.2983243-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Sat, 16 Sep 2023 09:01:47 +0200")
Message-ID: <87v8bzgu8q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] package/python-pytest: fix dependency
 on zlib
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > tests.package.test_python_pytest.TestPythonPy3Pytest runtime tests fails
 > now with following error:

 >   ======================================================================
 >   FAIL: test_run (tests.package.test_python_pytest.TestPythonPy3Pytest.test_run)
 >   ----------------------------------------------------------------------
 >   Traceback (most recent call last):
 >     File "/buildroot/support/testing/tests/package/test_python.py", line 137, in test_run
 >       self.run_sample_scripts()
 >     File "/buildroot/support/testing/tests/package/test_python_pytest.py", line 18, in run_sample_scripts
 >       self.assertRunOk(cmd, timeout=self.timeout)
 >     File "/buildroot/support/testing/infra/basetest.py", line 89, in assertRunOk
 >       self.assertEqual(
 >   AssertionError: 1 != 0 :
 >   Failed to run: python -m pytest sample_python_pytest.py
 >   output was:
 >     Traceback (most recent call last):
 >       File "<frozen runpy>", line 189, in _run_module_as_main
 >       File "<frozen runpy>", line 148, in _get_module_details
 >       File "<frozen runpy>", line 112, in _get_module_details
 >       File "/usr/lib/python3.11/site-packages/pytest/__init__.py", line 5, in <module>
 >       File "/usr/lib/python3.11/site-packages/_pytest/_code/__init__.py", line 2, in <module>
 >       File "/usr/lib/python3.11/site-packages/_pytest/_code/code.py", line 36, in <module>
 >       File "/usr/lib/python3.11/site-packages/pluggy/__init__.py", line 16, in <module>
 >       File "/usr/lib/python3.11/site-packages/pluggy/_manager.py", line 10, in <module>
 >       File "/usr/lib/python3.11/importlib/metadata/__init__.py", line 8, in <module>
 >       File "/usr/lib/python3.11/zipfile.py", line 6, in <module>
 >     ImportError: libz.so.1: cannot open shared object file: No such file or directory

 > Fix that by adding BR2_PACKAGE_PYTHON3_ZLIB dependency.

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
