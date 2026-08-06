Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB96C56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD8D80DC6;
	Thu,  6 Aug 2026 22:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYBFaVpJ7unb; Thu,  6 Aug 2026 22:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C7880DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053819;
	bh=iEsk0A7v/sYZ51p2iNHF+HF4ofgIcaPWuGawXbuoQ7U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XdTnlvD0wMiCgWv7X7UQE++5NimtURlZ3O1l9BS26Z+JxJEYxyOCNz59O5x/R2QPt
	 oH3TuvhSqzHdhV12GGMptyhNTDhn7sVJ1RwvUHf2mHx8YWSYgbUqnDyL+om37S/qLp
	 71c4YZSXnE5BLwm6NYr7cAAJXWVRtjrncJIHjmjO7AH1Ou2K6T7qoIt/a0bqzKxsd1
	 5B0KWtUoBHiSL4cgMo3KChMEBoFtIWg6ZwHuWGtEb2aUYyDk5x/YfXt5+rNssXjrBM
	 MCrqJfQGgxyXNUshLQ2oJ8c+QWN+2lmh1dQXY9USbsojf7qKEKR49pA7ZlT21JVMX5
	 BjZU+OohFIAnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C7880DE9;
	Thu,  6 Aug 2026 22:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 813DD2B6
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73291402E9
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDE504ZyETBK for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:03:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA93D4024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA93D4024A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA93D4024A
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:03:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUosT-1wRWuK3VKb-00PMt3; Fri, 07
 Aug 2026 00:03:26 +0200
Message-ID: <b5bc797f-eddb-40e9-9519-fc654761d010@gmx.de>
Date: Fri, 7 Aug 2026 00:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260806052829.4881-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260806052829.4881-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:7BfL1dxCplJUabw6wulxcvSlogrrcMSTdI6AQnM+6t36I1nG1XU
 KQ/UA0n7wS2F7Y5YEC7fa2lxJECF7mFjbXImIvrKvqO4CFnfk+KAbfiWU63LHGBHFZwNvat
 aqwC/F/3cF5Xio0QeQYeXtjgNtMe8iD+pnxTpmueUbj6wLp0Ugq28bwgHREuFjh9nv/q5dZ
 ytmk9hXtZl1HbpfiDhDtQ==
UI-OutboundReport: notjunk:1;M01:P0:JvG2lVZI0Ac=;570djcCfIzQ50SO+P62umq8v5c5
 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
 gNWcece3dg0mhiTPZzkNrf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786053806; x=1786658606; i=fiona.klute@gmx.de;
 bh=9L55AJLkhrxmARyIe/R3kYIJr3MKWSwPF+UFNr55vVc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KjTTv5iQ1Tpg+lxaep8TedY6jFRFdqVdM4UCnRyOjPGTAzNUXgiMLP0Z0hvKrLBM
 JV7UyK2ajW2/DHPDepNLxoLu+jKVFB26sOvFoYxKJMPMRW232wWfM0N2XJIM1wmlq
 vIaR8XPHV5BOByv3Wli6tiSef2OMxtjXh6BkuuMX5qKdBK41usgYeZY6oIzEoFuss
 GJvJ3T7r63bwsydMXnXMNOYjbugzI0yKm/yh99sZz/2jGSyhnAxI0uHeVgF+h0cuf
 gGmATG1sq4h1k4iSKCHt2XoyXg6Fi6rf8Wt0CCGAlAH6yyiCF/sbPFUxktV9ksk9S
 8z9lSlSTbI9UTRqw5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KjTTv5iQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.7
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 06.08.26 um 07:28 schrieb Bernd Kuhls:
> https://www.python.org/downloads/release/python-3147/
> https://docs.python.org/release/3.14.7/whatsnew/changelog.html
> 
> Rebased patch 0010 due to upstream commit:
> https://github.com/python/cpython/commit/04735deeb2dbdc6404eb38544541abf387d71069#diff-b9d5f29e160364d4616b4bcc3b04538fca8d1d1cca809af4196bcaf16c7c5d40
> 
> Removed patches 0011-0015 which are included in this release.
> 
> Fixes CVE-2026-12003 and others.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipeline including almost all external python modules built
> python3 successfully but crashed due to lack of free disk space:
> https://gitlab.com/bkuhls/buildroot/-/commits/f6a31521d51315228f57e5c2f9384bd7abf85585
> 
> Gitlab pipeline building only python3 passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/e01ff38bf1f65e4f7881debbbd455e525c25b478
> 
>   ...mpilation-of-Modules-_remote_debuggi.patch |  15 +-
>   ...ix-symlink-escape-via-tarfile-hardli.patch |  83 ----------
>   ...ormalize-all-line-endings-CR-CRLF-an.patch |  71 --------
>   ...ake-tarfile._Stream.seek-break-at-EO.patch |  76 ---------
>   ...ass-filter_function-to-TarFile._extr.patch | 151 ------------------
>   ...ix-quadratic-complexity-in-increment.patch | 123 --------------
>   package/python3/python3.hash                  |   4 +-
>   package/python3/python3.mk                    |  17 +-
>   8 files changed, 10 insertions(+), 530 deletions(-)
>   delete mode 100644 package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
>   delete mode 100644 package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
>   delete mode 100644 package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
>   delete mode 100644 package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
>   delete mode 100644 package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
> 
> diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
> index b000a68e9b..833bcc9cc8 100644
> --- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
> +++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
> @@ -7,8 +7,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
>   
>   Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
>   
> -[ Bernd Kuhls: ported to Python 3.14.4]
> -[ Vincent Fazio: update to apply cleanly to 3.14.3 ]
> +[ Bernd Kuhls: ported to Python 3.14.7]
>   Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>   ---
>    .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
> @@ -29,9 +28,9 @@ diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_modu
>   index b46538b76df..e86a27d5812 100644
>   --- a/Modules/_remote_debugging_module.c
>   +++ b/Modules/_remote_debugging_module.c
> -@@ -834,7 +834,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
> -         PyErr_SetString(PyExc_RuntimeError, "Failed to find the AsyncioDebug section in the process.");
> -         _PyErr_ChainExceptions1(exc);
> +@@ -1329,7 +1329,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
> +             _PyErr_ChainExceptions1(exc);
> +         }
>        }
>   -#elif defined(__linux__)
>   +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
> @@ -42,9 +41,9 @@ diff --git a/Python/remote_debug.h b/Python/remote_debug.h
>   index 8f9b6cd4c49..b7d17a0f345 100644
>   --- a/Python/remote_debug.h
>   +++ b/Python/remote_debug.h
> -@@ -923,7 +923,7 @@
> -             handle->pid);
> -         _PyErr_ChainExceptions1(exc);
> +@@ -1174,7 +1174,7 @@
> +             _PyErr_ChainExceptions1(exc);
> +         }
>        }
>   -#elif defined(__linux__)
>   +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
> diff --git a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> deleted file mode 100644
> index d3454a7a6b..0000000000
> --- a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From 79c06bd5c6afa3c440d50faf7ee1b147c8832b4c Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Tue, 23 Jun 2026 15:58:47 +0200
> -Subject: [PATCH] [3.14] gh-151558: Fix symlink escape via `tarfile`
> - hardlink-extraction fallback (GH-151559)
> -
> -(cherry picked from commit 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
> -
> -Co-authored-by: Stan Ulbrych <stan@python.org>
> -
> -Upstream: https://github.com/python/cpython/commit/79c06bd5c6afa3c440d50faf7ee1b147c8832b4c
> -CVE: CVE-2026-11940
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - Lib/tarfile.py                                |  3 +++
> - Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
> - ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
> - 3 files changed, 30 insertions(+)
> - create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> -
> -diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> -index 39b1cd6514c..399f906efdf 100644
> ---- a/Lib/tarfile.py
> -+++ b/Lib/tarfile.py
> -@@ -2784,6 +2784,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
> -                     "makelink_with_filter: if filter_function is not None, "
> -                     + "extraction_root must also not be None")
> -             try:
> -+                filter_function(
> -+                    unfiltered.replace(name=tarinfo.name, deep=False),
> -+                    extraction_root)
> -                 filtered = filter_function(unfiltered, extraction_root)
> -             except _FILTER_ERRORS as cause:
> -                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
> -diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> -index 8503024a690..045377d620c 100644
> ---- a/Lib/test/test_tarfile.py
> -+++ b/Lib/test/test_tarfile.py
> -@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
> -                     self.expect_file("boom", symlink_to='../../link_here')
> -                     self.expect_file("c", symlink_to='b')
> -
> -+    @symlink_test
> -+    def test_sneaky_hardlink_fallback_deep(self):
> -+        # (CVE-2026-11940)
> -+        with ArchiveMaker() as arc:
> -+            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
> -+            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
> -+
> -+        with self.check_context(arc.open(), 'data'):
> -+            e = self.expect_exception(
> -+                tarfile.LinkFallbackError,
> -+                "link 's' would be extracted as a copy of "
> -+                + "'a/b/s', which was rejected")
> -+            self.assertIsInstance(e.__cause__,
> -+                                  tarfile.LinkOutsideDestinationError)
> -+
> -+        for filter in 'tar', 'fully_trusted':
> -+            with self.subTest(filter), self.check_context(arc.open(), filter):
> -+                if not os_helper.can_symlink():
> -+                    self.expect_file("a/")
> -+                    self.expect_file("a/b/")
> -+                else:
> -+                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
> -+                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
> -+
> -     @symlink_test
> -     def test_exfiltration_via_symlink(self):
> -         # (CVE-2025-4138)
> -diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> -new file mode 100644
> -index 00000000000..74459d5680e
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> -@@ -0,0 +1,3 @@
> -+Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
> -+filters where crafted archives could create a symlink pointing outside the
> -+destination directory. This was a bypass of :cve:`2025-4330`.
> ---
> -2.47.3
> -
> diff --git a/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch b/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
> deleted file mode 100644
> index 8c9b35a8d2..0000000000
> --- a/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 71f2e02a52d47417a6fd69f456346cd8aa7aca98 Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Wed, 24 Jun 2026 11:46:33 +0200
> -Subject: [PATCH] [3.14] gh-143927: Normalize all line endings (CR, CRLF, and
> - LF) in configparser (GH-143929) (GH-152003)
> -
> -gh-143927: Normalize all line endings (CR, CRLF, and LF) in configparser (GH-143929)
> -(cherry picked from commit 5858e42c539dac8394636a6e9b30472b8994851f)
> -
> -Co-authored-by: Seth Larson <seth@python.org>
> -
> -Upstream: https://github.com/python/cpython/commit/71f2e02a52d47417a6fd69f456346cd8aa7aca98
> -CVE: CVE-2026-0864
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - Lib/configparser.py                                   |  4 +++-
> - Lib/test/test_configparser.py                         | 11 +++++++++++
> - .../2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst    |  2 ++
> - 3 files changed, 16 insertions(+), 1 deletion(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
> -
> -diff --git a/Lib/configparser.py b/Lib/configparser.py
> -index a53ac872764..3c452afe8ad 100644
> ---- a/Lib/configparser.py
> -+++ b/Lib/configparser.py
> -@@ -992,7 +992,9 @@ def _write_section(self, fp, section_name, section_items, delimiter, unnamed=Fal
> -             value = self._interpolation.before_write(self, section_name, key,
> -                                                      value)
> -             if value is not None or not self._allow_no_value:
> --                value = delimiter + str(value).replace('\n', '\n\t')
> -+                # Convert all possible line-endings into '\n\t'
> -+                value = (delimiter + str(value).replace('\r\n', '\n')
> -+                         .replace('\r', '\n').replace('\n', '\n\t'))
> -             else:
> -                 value = ""
> -             fp.write("{}{}\n".format(key, value))
> -diff --git a/Lib/test/test_configparser.py b/Lib/test/test_configparser.py
> -index 8d8dd2a2bf2..4783943f71a 100644
> ---- a/Lib/test/test_configparser.py
> -+++ b/Lib/test/test_configparser.py
> -@@ -526,6 +526,17 @@ def test_default_case_sensitivity(self):
> -             cf.get(self.default_section, "Foo"), "Bar",
> -             "could not locate option, expecting case-insensitive defaults")
> -
> -+    def test_crlf_normalization(self):
> -+        cf = self.newconfig({"key1": "a\nb","key2": "a\rb", "key3": "a\r\nb", "key4": "a\r\nb"})
> -+        buf = io.StringIO()
> -+        cf.write(buf)
> -+        cf_str = buf.getvalue()
> -+        self.assertNotIn("\r", cf_str)
> -+        self.assertNotIn("\r\n", cf_str)
> -+        self.assertEqual(cf_str.count("\n"), 10)
> -+        self.assertEqual(cf_str.count("\n\t"), 4)
> -+        self.assertTrue(cf_str.endswith("\n\n"))
> -+
> -     def test_parse_errors(self):
> -         cf = self.newconfig()
> -         self.parse_error(cf, configparser.ParsingError,
> -diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
> -new file mode 100644
> -index 00000000000..ca554997e5c
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
> -@@ -0,0 +1,2 @@
> -+Normalize all line endings (CR, CRLF, and LF) to LF+TAB when writing
> -+multi-line configparser values.
> ---
> -2.47.3
> -
> diff --git a/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch b/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
> deleted file mode 100644
> index 7db9439639..0000000000
> --- a/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -From e86666c9dd256d52d0fbef6feb1ea4a51768fdec Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Tue, 23 Jun 2026 15:46:18 +0200
> -Subject: [PATCH] [3.14] gh-151981: Make tarfile._Stream.seek break at EOF
> - (GH-151982) (#151992)
> -
> -(cherry picked from commit f50bf13566189c8d0ce5a814f33eff3d89951896)
> -
> -Co-authored-by: Petr Viktorin <encukou@gmail.com>
> -Co-authored-by: Stan Ulbrych <stan@python.org>
> -
> -Upstream: https://github.com/python/cpython/commit/e86666c9dd256d52d0fbef6feb1ea4a51768fdec
> -CVE: CVE-2026-11972
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - Lib/tarfile.py                                   |  4 +++-
> - Lib/test/test_tarfile.py                         | 16 ++++++++++++++++
> - ...026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst |  2 ++
> - 3 files changed, 21 insertions(+), 1 deletion(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
> -
> -diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> -index e6734db24f6..39b1cd6514c 100644
> ---- a/Lib/tarfile.py
> -+++ b/Lib/tarfile.py
> -@@ -524,7 +524,9 @@ def seek(self, pos=0):
> -         if pos - self.pos >= 0:
> -             blocks, remainder = divmod(pos - self.pos, self.bufsize)
> -             for i in range(blocks):
> --                self.read(self.bufsize)
> -+                data = self.read(self.bufsize)
> -+                if not data:
> -+                    break
> -             self.read(remainder)
> -         else:
> -             raise StreamError("seeking backwards is not allowed")
> -diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> -index d974c7d46ec..8503024a690 100644
> ---- a/Lib/test/test_tarfile.py
> -+++ b/Lib/test/test_tarfile.py
> -@@ -4762,6 +4762,22 @@ def valueerror_filter(tarinfo, path):
> -         with self.check_context(arc.open(errorlevel='boo!'), filtererror_filter):
> -             self.expect_exception(TypeError)  # errorlevel is not int
> -
> -+    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
> -+    def test_getmembers_big_size(self, format):
> -+        # gh-151981: A loop in seek() for streaming files tried to read the
> -+        # declared number of blocks even at EOF
> -+        tinfo = tarfile.TarInfo("huge-file")
> -+        tinfo.size = 1 << 64
> -+        bio = io.BytesIO()
> -+        # Write header without data
> -+        bio.write(tinfo.tobuf(format))
> -+
> -+        # Reset & try to get contents
> -+        bio.seek(0)
> -+        with tarfile.open(fileobj=bio, mode="r|") as tar:
> -+            with self.assertRaises(tarfile.ReadError):
> -+                tar.getmembers()
> -+
> -
> - class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
> -     testdir = os.path.join(TEMPDIR, "testoverwrite")
> -diff --git a/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst b/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
> -new file mode 100644
> -index 00000000000..2123ab8e081
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
> -@@ -0,0 +1,2 @@
> -+In :mod:`tarfile`, seeking a stream now stops when end of the stream is
> -+reached.
> ---
> -2.47.3
> -
> diff --git a/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch b/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
> deleted file mode 100644
> index 3b38594c75..0000000000
> --- a/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
> +++ /dev/null
> @@ -1,151 +0,0 @@
> -From 5e0ef3f1afe892e4f64eb83368db57ac4c40cba0 Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Mon, 29 Jun 2026 21:11:22 +0200
> -Subject: [PATCH] [3.14] gh-151987: Pass filter_function to
> - `TarFile._extract_one()` during `.extract()` (GH-151988) (#152609)
> -
> -(cherry picked from commit 7ccdbaba2c54250a70d7f25632152df7655a5e0a)
> -
> -Co-authored-by: Petr Viktorin <encukou@gmail.com>
> -Co-authored-by: Seth Michael Larson <seth@python.org>
> -
> -Upstream: https://github.com/python/cpython/commit/5e0ef3f1afe892e4f64eb83368db57ac4c40cba0
> -CVE: CVE-2026-4360
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - Lib/tarfile.py                                |  3 +-
> - Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
> - ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
> - 3 files changed, 96 insertions(+), 1 deletion(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
> -
> -diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> -index cb09e307c46..d3c48999700 100644
> ---- a/Lib/tarfile.py
> -+++ b/Lib/tarfile.py
> -@@ -2538,7 +2538,8 @@ def extract(self, member, path="", set_attrs=True, *, numeric_owner=False,
> -         tarinfo, unfiltered = self._get_extract_tarinfo(
> -             member, filter_function, path)
> -         if tarinfo is not None:
> --            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
> -+            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
> -+                              filter_function=filter_function)
> -
> -     def _get_extract_tarinfo(self, member, filter_function, path):
> -         """Get (filtered, unfiltered) TarInfos from *member*
> -diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> -index 804c3e6d809..f3b61d9fbad 100644
> ---- a/Lib/test/test_tarfile.py
> -+++ b/Lib/test/test_tarfile.py
> -@@ -4470,6 +4470,98 @@ def test_chmod_outside_dir(self):
> -                     st_mode = cc.outerdir.stat().st_mode
> -                     self.assertNotEqual(st_mode & 0o777, 0o777)
> -
> -+    @symlink_test
> -+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
> -+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
> -+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
> -+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
> -+    def test_chown_links_on_extract(self, link_type):
> -+        with ArchiveMaker() as arc:
> -+            arc.add("test.txt",
> -+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
> -+            arc.add("link",
> -+                    type=link_type,
> -+                    linkname='test.txt',
> -+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
> -+
> -+        with (
> -+            os_helper.temp_dir() as tmpdir,
> -+            arc.open() as tar,
> -+            unittest.mock.patch("os.chown") as mock_chown,
> -+            unittest.mock.patch("os.lchown") as mock_lchown,
> -+            unittest.mock.patch("os.geteuid") as mock_geteuid,
> -+        ):
> -+            # Set UID to 0 so chown() is attempted.
> -+            mock_geteuid.return_value = 0
> -+            tar.extract("link", path=tmpdir, filter='data')
> -+            extract_path = os.path.join(tmpdir, "link")
> -+
> -+            if link_type == tarfile.SYMTYPE:
> -+                mock_chown.assert_not_called()
> -+                mock_lchown.assert_called_once_with(extract_path, -1, -1)
> -+            else:
> -+                mock_chown.assert_has_calls([
> -+                    unittest.mock.call(extract_path, -1, -1),
> -+                    unittest.mock.call(extract_path, -1, -1)
> -+                ])
> -+                mock_lchown.assert_not_called()
> -+
> -+    @symlink_test
> -+    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
> -+    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
> -+    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
> -+    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
> -+    def test_chown_links_on_extractall(self, link_type):
> -+        with ArchiveMaker() as arc:
> -+            arc.add("test.txt",
> -+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
> -+            arc.add("link",
> -+                    type=link_type,
> -+                    linkname='test.txt',
> -+                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
> -+
> -+        with (
> -+            os_helper.temp_dir() as tmpdir,
> -+            arc.open() as tar,
> -+            unittest.mock.patch("os.chown") as mock_chown,
> -+            unittest.mock.patch("os.lchown") as mock_lchown,
> -+            unittest.mock.patch("os.geteuid") as mock_geteuid,
> -+        ):
> -+            # Set UID to 0 so chown() is attempted.
> -+            mock_geteuid.return_value = 0
> -+            tar.extractall(path=tmpdir, filter='data')
> -+            extract_link_path = os.path.join(tmpdir, "link")
> -+            extract_file_path = os.path.join(tmpdir, "test.txt")
> -+
> -+            if link_type == tarfile.SYMTYPE:
> -+                mock_chown.assert_called_once_with(extract_file_path, -1, -1)
> -+                mock_lchown.assert_called_once_with(extract_link_path, -1, -1)
> -+            else:
> -+                mock_chown.assert_has_calls([
> -+                    unittest.mock.call(extract_file_path, -1, -1),
> -+                    unittest.mock.call(extract_link_path, -1, -1)
> -+                ])
> -+                mock_lchown.assert_not_called()
> -+
> -+    def test_extract_filters_target(self):
> -+        # Test that when extract() falls back to extracting (rather than
> -+        # linking) a hardlink target, it filters the target.
> -+        with ArchiveMaker() as arc:
> -+            arc.add("target")
> -+            arc.add("link", hardlink_to="target")
> -+        def testing_filter(member, path):
> -+            if member.name == 'target':
> -+                # target: set read-only
> -+                return member.replace(mode=stat.S_IRUSR)
> -+            # link: don't overwrite the mode
> -+            return member.replace(mode=None)
> -+        tempdir = pathlib.Path(TEMPDIR) / 'extract'
> -+        with os_helper.temp_dir(tempdir), arc.open() as tar:
> -+            tar.extract("link", path=tempdir, filter=testing_filter)
> -+            path = tempdir / 'link'
> -+            if os_helper.can_chmod():
> -+                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
> -+
> -     def test_link_fallback_normalizes(self):
> -         # Make sure hardlink fallbacks work for non-normalized paths for all
> -         # filters
> -diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
> -new file mode 100644
> -index 00000000000..9eea7b32c4d
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
> -@@ -0,0 +1,2 @@
> -+The :meth:`tarfile.TarFile.extract` method now applies the given filter when
> -+it extracts a link target from the archive as a fallback.
> ---
> -2.47.3
> -
> diff --git a/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch b/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
> deleted file mode 100644
> index e9c3f40cc0..0000000000
> --- a/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -From 07efb08123ba9367a7107325adb9d5626dca1ca9 Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Sat, 4 Jul 2026 20:08:05 +0200
> -Subject: [PATCH] [3.14] gh-153030: Fix quadratic complexity in incremental
> - parsing in HTMLParser (GH-153031) (GH-153039)
> -
> -When an unterminated construct (e.g. a tag or comment) spanned many
> -feed() calls, rescanning the growing buffer and concatenating new data
> -onto it were both quadratic.  New data is now accumulated in a list and
> -only joined and parsed once enough has piled up.
> -(cherry picked from commit bcf98ddbc40ec9b3ee87da0124a5660b19b7e606)
> -
> -Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
> -Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
> -
> -Upstream: https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9d5626dca1ca9
> -CVE: CVE-2026-15308
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - Lib/html/parser.py                            | 32 +++++++++++++++++--
> - Lib/test/test_htmlparser.py                   | 20 ++++++++++++
> - ...-07-04-17-00-00.gh-issue-153030.RovkP6.rst |  3 ++
> - 3 files changed, 53 insertions(+), 2 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
> -
> -diff --git a/Lib/html/parser.py b/Lib/html/parser.py
> -index 38ddf9ef442..fbe0d3665e0 100644
> ---- a/Lib/html/parser.py
> -+++ b/Lib/html/parser.py
> -@@ -157,6 +157,9 @@ def reset(self):
> -         self.cdata_elem = None
> -         self._support_cdata = True
> -         self._escapable = True
> -+        self._pending = []
> -+        self._pending_len = 0
> -+        self._parse_threshold = 1
> -         super().reset()
> -
> -     def feed(self, data):
> -@@ -165,11 +168,36 @@ def feed(self, data):
> -         Call this as often as you want, with as little or as much text
> -         as you want (may include '\n').
> -         """
> --        self.rawdata = self.rawdata + data
> --        self.goahead(0)
> -+        # Accumulate new data in a list and only join and parse it once
> -+        # enough has piled up.  Rescanning an unparsed buffer (e.g. an
> -+        # unterminated tag) and concatenating onto it on every call would
> -+        # both be quadratic in the input size.
> -+        self._pending_len += len(data)
> -+        if self._pending_len < self._parse_threshold:
> -+            self._pending.append(data)
> -+        else:
> -+            if not self._pending:
> -+                self.rawdata += data
> -+            else:
> -+                self._pending.append(data)
> -+                self.rawdata += ''.join(self._pending)
> -+                self._pending.clear()
> -+            self._pending_len = 0
> -+            n = len(self.rawdata)
> -+            self.goahead(0)
> -+            if len(self.rawdata) < n:
> -+                # Some data was parsed; resume on the next call.
> -+                self._parse_threshold = 1
> -+            else:
> -+                # Nothing was parsed; wait until the buffer doubles.
> -+                self._parse_threshold = len(self.rawdata)
> -
> -     def close(self):
> -         """Handle any buffered data."""
> -+        if self._pending:
> -+            self.rawdata += ''.join(self._pending)
> -+            self._pending.clear()
> -+            self._pending_len = 0
> -         self.goahead(1)
> -
> -     __starttag_text = None
> -diff --git a/Lib/test/test_htmlparser.py b/Lib/test/test_htmlparser.py
> -index 6b7624f1150..3fdaed4ff46 100644
> ---- a/Lib/test/test_htmlparser.py
> -+++ b/Lib/test/test_htmlparser.py
> -@@ -1041,6 +1041,26 @@ def check(source):
> -         check("<![CDATA[" * 9 * n)
> -         check("<!doctype" * 35 * n)
> -
> -+    @support.requires_resource('cpu')
> -+    def test_incremental_no_quadratic_complexity(self):
> -+        # An unterminated construct fed in many small chunks used to take
> -+        # quadratic time, both to rescan and to concatenate the buffer.
> -+        # Now it takes a fraction of a second.
> -+        def check(prefix, chunk, suffix):
> -+            parser = html.parser.HTMLParser()
> -+            parser.feed(prefix)
> -+            for _ in range(200_000):
> -+                parser.feed(chunk)
> -+            parser.feed(suffix)
> -+            parser.close()
> -+        chunk = "a" * 64
> -+        check("<!--", chunk, "-->")       # comment
> -+        check("<?", chunk, ">")           # processing instruction
> -+        check("<!doctype ", chunk, ">")   # doctype
> -+        check("<![CDATA[", chunk, "]]>")  # CDATA section
> -+        check("<a href='", chunk, "'>")   # start tag
> -+        check("<script>", chunk, "</script>")  # RAWTEXT element
> -+
> -
> - class AttributesTestCase(TestCaseBase):
> -
> -diff --git a/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst b/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
> -new file mode 100644
> -index 00000000000..d1d60593f4b
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
> -@@ -0,0 +1,3 @@
> -+Fixed quadratic complexity in incremental parsing of long unterminated
> -+constructs (such as tags or comments) in :class:`html.parser.HTMLParser`,
> -+which could be exploited for a denial of service.
> ---
> -2.47.3
> -
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 0f2436fb23..97302bc750 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,4 +1,4 @@
> -# From https://www.python.org/downloads/release/python-3146/
> -sha256  143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63  Python-3.14.6.tar.xz
> +# From https://www.python.org/downloads/release/python-3147/
> +sha256  3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81  Python-3.14.7.tar.xz
>   # Locally computed
>   sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 9a47a1f306..cb5e1a4b85 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   PYTHON3_VERSION_MAJOR = 3.14
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
>   PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>   PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>   PYTHON3_LICENSE = Python-2.0, others
> @@ -13,21 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
>   PYTHON3_CPE_ID_VENDOR = python
>   PYTHON3_CPE_ID_PRODUCT = python
>   
> -# 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> -PYTHON3_IGNORE_CVES += CVE-2026-11940
> -
> -# 0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
> -PYTHON3_IGNORE_CVES += CVE-2026-0864
> -
> -# 0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
> -PYTHON3_IGNORE_CVES += CVE-2026-11972
> -
> -# 0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
> -PYTHON3_IGNORE_CVES += CVE-2026-4360
> -
> -# 0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
> -PYTHON3_IGNORE_CVES += CVE-2026-15308
> -
>   # This host Python is installed in $(HOST_DIR), as it is needed when
>   # cross-compiling third-party Python modules.
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
