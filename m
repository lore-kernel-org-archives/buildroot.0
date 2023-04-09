Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A50C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA1660592;
	Sun,  9 Apr 2023 21:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA1660592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odDBh0eXTGfW; Sun,  9 Apr 2023 21:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C885960B06;
	Sun,  9 Apr 2023 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C885960B06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 804761BF3F3
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 584F141369
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584F141369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkugFNPgp-si for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:04:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1358411C6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1358411C6
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:04:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w21so2917495wra.4
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074269;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKA1Zw9Wwqqbt8+3F0RleS2OdE1+Ns5wo4DvRHz7WY0=;
 b=YYtB8501pMQiqLhd1PHfGI5qbU4GVMCe5WWZT8AHXvXE/hI2M9qj7lA7/7lDd7CLqm
 d44elpNoz6TTFMClLtLaL683WzjfeI9xmfcGnvD2eGFi5dFz8KC+e99/6zQ+xbLPQAf3
 fdTlycG7ywn963DTvDqQUENt9COJU31m6hFErTchgB6GhufI/22a3mTTwMQyp7WTQTSC
 SdUQrDQ/HqazuGXiqELlxpVMKTPxWm/yEiGbKGL/CtL4C8e8W8bfAtZnFSM6zDA9MeS1
 UYyrcZnmfnn8IqmZlzX7QTohrvGPBSHVM/gcPcYbc+TjW63eFIViklnmPiwAK5ymF+71
 Vrng==
X-Gm-Message-State: AAQBX9eSmfk7rXxNjo0ba59yXx20WklQtGM7jBfnpGZdvU7Yl3niNL79
 lodHJPqCFMROyNCjSOeRW+2xYw==
X-Google-Smtp-Source: AKy350bTCx0V0+EWKhEcW8HJYAsyTMlkvt39enuZIFPWXlAreUXwe28oHnlrwHrzwwYjh+cV14cYOw==
X-Received: by 2002:adf:f887:0:b0:2cf:e74f:2957 with SMTP id
 u7-20020adff887000000b002cfe74f2957mr6034941wrp.33.1681074268858; 
 Sun, 09 Apr 2023 14:04:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d4a0a000000b002cde626cd96sm9947388wrq.65.2023.04.09.14.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:04:28 -0700 (PDT)
Message-ID: <e2b93112-ea53-5d51-a392-ed238f310f77@mind.be>
Date: Sun, 9 Apr 2023 23:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-15-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724054912.2354219-15-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074269;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oKA1Zw9Wwqqbt8+3F0RleS2OdE1+Ns5wo4DvRHz7WY0=;
 b=J9I+//t/j45LiUzEXN3TRcaCmoBzgVAZDLORN2N2uucE4KbF1dsc6hSvZAdhBLRYCB
 Gzh2ZF8CqMuI5qnjT89NjgXX+/VLIaY7/kwx06Nwl9x0zRMUuF1Vm9RAqKWFRz8bJV7z
 mM7VNuyj0UQaXr8Cfh148kOPbouTG2kwLDJRj7JCvXtZACUS2mQ5Tekc7A/NlotAxtz3
 UlL48LezFdO3hLLzM4LegYqeb2wIT+cX+Bjq/lzEbx2jJguqUFhOPiRPiEBSqTz6QIDS
 eUd0y/OgpPNmf2AM/CPgBn9gAIbevHMkwN4tirS29u3lxqbWTyMrbGAqvwy9MuXU7Nez
 U8qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J9I+//t/
Subject: Re: [Buildroot] [PATCH 14/16] Makefile: merge check-flake8 into
 check-package
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



On 24/07/2022 07:49, Ricardo Martincoski wrote:
> Teach check-package to detect python files by type and check them using
> flake8.
> Do not use subprocess to call 'python3 -m flake8' in order to avoid too
> many spawned shells, which in its turn would slow down the check for
> multiple files. (make check-package takes twice the time using a shell
> for each flake8 call, when compared of importing the main application)
> 
> Expand the runtime test and the unit tests for check-package.
> 
> Since 'make check-package' always run using the docker image, there is
> no dependency added to the host machine.
> 
> Remove check-flake8 from the makefile and also from the GitLab CI
> because the exact same checks become part of check-package.
> 
> Suggested-by:: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Makefile                                      | 11 ++------
>   support/misc/gitlab-ci.yml.in                 |  4 ---
>   support/scripts/generate-gitlab-ci-yml        |  2 +-
>   .../tests/utils/br2-external/utils/x-python   |  2 ++
>   .../testing/tests/utils/test_check_package.py | 17 +++++++++++
>   utils/check-package                           |  3 ++
>   utils/checkpackagelib/lib_python.py           |  1 +
>   utils/checkpackagelib/test_tool.py            | 28 +++++++++++++++++++
>   utils/checkpackagelib/tool.py                 | 15 ++++++++++
>   9 files changed, 69 insertions(+), 14 deletions(-)
>   create mode 100644 support/testing/tests/utils/br2-external/utils/x-python
>   create mode 100644 utils/checkpackagelib/lib_python.py
> 
> diff --git a/Makefile b/Makefile
> index f42dc3151d..7c7b67a616 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -125,7 +125,7 @@ endif
>   noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>   	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
>   	randpackageconfig allyespackageconfig allnopackageconfig \
> -	print-version olddefconfig distclean manual manual-% check-package check-flake8
> +	print-version olddefconfig distclean manual manual-% check-package
>   
>   # Some global targets do not trigger a build, but are used to collect
>   # metadata, or do various checks. When such targets are triggered,
> @@ -1240,19 +1240,12 @@ print-version:
>   check_inside_docker := $(shell if [ "`groups`" = 'br-user' ]; then echo y; else echo n; fi)
>   
>   # List of target that need to run inside docker image to ensure reproducible results
> -inside_docker_targets := check-package check-flake8
> +inside_docker_targets := check-package
>   
>   ifeq ($(check_inside_docker),n)
>   $(inside_docker_targets):
>   	$(Q)utils/docker-run $(MAKE) V=$(V) $@
>   else
> -check-flake8:
> -	$(Q)git ls-tree -r --name-only HEAD \
> -	| xargs file \
> -	| grep 'Python script' \
> -	| cut -d':' -f1 \
> -	| xargs -- python3 -m flake8 --statistics
> -
>   check-package:
>   	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
>   endif
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index 3ac988a519..2fde904006 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -6,10 +6,6 @@
>       script:
>           - utils/get-developers -v
>   
> -.check-flake8_base:
> -    script:
> -        - make check-flake8
> -
>   .check-package_base:
>       script:
>           - make check-package
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index aa43aac019..536ae0f042 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -26,7 +26,7 @@ gen_tests() {
>       local do_basics do_defconfigs do_runtime do_testpkg
>       local defconfigs_ext cfg tst
>   
> -    basics=( check-package DEVELOPERS flake8 package )
> +    basics=( check-package DEVELOPERS package )
>   
>       defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
>   
> diff --git a/support/testing/tests/utils/br2-external/utils/x-python b/support/testing/tests/utils/br2-external/utils/x-python
> new file mode 100644
> index 0000000000..63f77b6be1
> --- /dev/null
> +++ b/support/testing/tests/utils/br2-external/utils/x-python
> @@ -0,0 +1,2 @@
> +#!/usr/bin/env python3
> +
> diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
> index aeda0857e3..e655bff1ec 100644
> --- a/support/testing/tests/utils/test_check_package.py
> +++ b/support/testing/tests/utils/test_check_package.py
> @@ -249,3 +249,20 @@ class TestCheckPackage(unittest.TestCase):
>           self.assert_file_was_processed(m)
>           self.assert_warnings_generated_for_file(m)
>           self.assertIn("{}:0: run 'shellcheck' and fix the warnings".format(abs_file), w)
> +
> +        # python scripts are tested using flake8
> +        rel_file = "utils/x-python"
> +        abs_path = infra.filepath("tests/utils/br2-external")
> +        abs_file = os.path.join(abs_path, rel_file)
> +
> +        w, m = call_script(["check-package", "-vvv", "-b", rel_file],
> +                           self.WITH_UTILS_IN_PATH, abs_path)
> +        self.assert_file_was_processed(m)
> +        self.assert_warnings_generated_for_file(m)
> +        self.assertIn("{}:0: run 'flake8' and fix the warnings".format(rel_file), w)
> +
> +        w, m = call_script(["check-package", "-b", abs_file],
> +                           self.WITH_UTILS_IN_PATH, infra.basepath())
> +        self.assert_file_was_processed(m)
> +        self.assert_warnings_generated_for_file(m)
> +        self.assertIn("{}:0: run 'flake8' and fix the warnings".format(abs_file), w)
> diff --git a/utils/check-package b/utils/check-package
> index 601d899d3d..beebef0ddb 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -14,6 +14,7 @@ import checkpackagelib.lib_config
>   import checkpackagelib.lib_hash
>   import checkpackagelib.lib_mk
>   import checkpackagelib.lib_patch
> +import checkpackagelib.lib_python
>   import checkpackagelib.lib_shellscript
>   import checkpackagelib.lib_sysv
>   
> @@ -94,6 +95,8 @@ def get_lib_from_filetype(fname):
>       filetype = magic.from_file(fname, mime=True)
>       if filetype == "text/x-shellscript":
>           return checkpackagelib.lib_shellscript
> +    if filetype in ["text/x-python", "text/x-script.python"]:
> +        return checkpackagelib.lib_python
>       return None
>   
>   
> diff --git a/utils/checkpackagelib/lib_python.py b/utils/checkpackagelib/lib_python.py
> new file mode 100644
> index 0000000000..f8c17ddc10
> --- /dev/null
> +++ b/utils/checkpackagelib/lib_python.py
> @@ -0,0 +1 @@
> +from checkpackagelib.tool import Flake8                # noqa: F401
> diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
> index a0bf88001d..cfa826f57c 100644
> --- a/utils/checkpackagelib/test_tool.py
> +++ b/utils/checkpackagelib/test_tool.py
> @@ -66,6 +66,34 @@ def test_NotExecutable_hint(testname, hint, filename, permissions, string, expec
>       assert warnings == expected
>   
>   
> +Flake8 = [
> +    ('empty',
> +     'empty.py',
> +     '',
> +     []),
> +    ('W391',
> +     'blank-line.py',
> +     '\n',
> +     ["dir/blank-line.py:0: run 'flake8' and fix the warnings",
> +      "dir/blank-line.py:1:1: W391 blank line at end of file"]),
> +    ('more than one warning',
> +     'file',
> +     'import os\n'
> +     'import re\n'
> +     '\n',
> +     ["dir/file:0: run 'flake8' and fix the warnings",
> +      "dir/file:1:1: F401 'os' imported but unused\n"
> +      "dir/file:2:1: F401 're' imported but unused\n"
> +      'dir/file:3:1: W391 blank line at end of file']),
> +    ]
> +
> +
> +@pytest.mark.parametrize('testname,filename,string,expected', Flake8)
> +def test_Flake8(testname, filename, string, expected):
> +    warnings = check_file(m.Flake8, filename, string)
> +    assert warnings == expected
> +
> +
>   Shellcheck = [
>       ('missing shebang',
>        'empty.sh',
> diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
> index 632aaa9f9e..907ada704f 100644
> --- a/utils/checkpackagelib/tool.py
> +++ b/utils/checkpackagelib/tool.py
> @@ -1,5 +1,7 @@
> +import flake8.main.application
>   import os
>   import subprocess
> +import tempfile
>   from checkpackagelib.base import _Tool
>   
>   
> @@ -14,6 +16,19 @@ class NotExecutable(_Tool):
>               return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
>   
>   
> +class Flake8(_Tool):
> +    def run(self):
> +        with tempfile.NamedTemporaryFile() as output:
> +            app = flake8.main.application.Application()
> +            app.run(['--output-file={}'.format(output.name), self.filename])
> +            stdout = output.readlines()
> +            processed_output = [str(line.decode().rstrip()) for line in stdout if line]
> +            if len(stdout) == 0:
> +                return
> +            return ["{}:0: run 'flake8' and fix the warnings".format(self.filename),
> +                    '\n'.join(processed_output)]
> +
> +
>   class Shellcheck(_Tool):
>       def run(self):
>           cmd = ['shellcheck', self.filename]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
