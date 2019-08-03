From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 17:19:15 +0200
Subject: [Buildroot] [PATCH v2 0/5] Fix bug 11271 and add test for
 check-package
In-Reply-To: <20181104041209.23028-1-ricardo.martincoski@gmail.com>
References: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
 <20181104041209.23028-1-ricardo.martincoski@gmail.com>
Message-ID: <abae0445-caf8-13b1-544c-7ba85d9cfeb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ricardo,
On 04/11/2018 05:12, Ricardo Martincoski wrote:
> Hello,
> 
> This series fixes bug 11271 and adds a test case that catches the bug.

 Sorry it took so long to apply this series...


> Patch 1 fixes the usage of check-package when called from the same directory
> than the files to be tested in a br2-external tree.
> 
> Patch 2 improves the testing infra by ensuring it can be started from any path,
> not only the Buildroot top directory.
> As a consequence the test infra will always test the repo it belongs to.
> 
> Patch 3 creates a test case for check-package, calling the script in the same
> repo against in-tree files and against files in a br2-external.

 I had a few concerns about this one, but I just fixed it up and applied.

> 
> Patch 4 improves usability of check-package in a br2-external tree by ignoring
> external.mk since it is special: it usually contains raw makefile targets and
> therefore cannot be tested by the script, but it is part of the br2-external
> structure, so it is likely someone expects it to be checkable by an in-tree
> script.
> 
> Patch 5 improves the test case created by patch 3 to test the scenario covered
> by patch 4.

 Series applies to master, thanks!

 Regards,
 Arnout

> 
> On below tests I used another series just to make my life easier:
> http://patchwork.ozlabs.org/project/buildroot/list/?series=72927
> 
> 1) to check patch 2 works and don't bring regressions: (I reused the urls for v1
>    because patch 2 did not change since v1 and also the master branch had no
>    change on support/testing since I sent v1)
> 
> A full run with only patch 2 applied:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/35290055
> 
> Another full run with only patch 2 applied, this time cd'ing to /tmp and
> starting the tests from there:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/35290166
> 
> Without any patches of this series, cd'ing to /tmp and starting the tests from
> there:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/35290220
> 
> 2) to check patch 3 tests what patch 1 fixes:
> 
> With only patches 2 and 3 applied: failed
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/116174566
> 
> With patches 1, 2 and 3 applied: passed
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/116174639
> 
> 3) to check patch 5 tests what patch 4 fixes:
> 
> With only patches 1, 2, 3 and 5 applied: failed
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/116174711
> 
> With all patches applied: passed
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/116174756
> 
> Changes v1 -> v2:
>   - do not absolutize paths on output (Vitaliy Lotorev)
>   - update expectation on the test case after changing patch 1: when a warning
>     is generated for a file from a br2-external and the file was specified in
>     the arguments as a relative path, the relative path is used in the warning
>     message
> 
> Regards,
> Ricardo
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Vitaliy Lotorev <lotorev@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Ricardo Martincoski (5):
>   check-package: fix check of file in current dir with -b
>   support/testing: allow run-tests to be called from anywhere
>   support/testing: add test for check-package
>   check-package: ignore external.mk
>   support/testing: test check-package ignores external.mk
> 
>  .gitlab-ci.yml                                |   1 +
>  support/testing/infra/__init__.py             |   8 +-
>  support/testing/infra/builder.py              |   2 +-
>  support/testing/tests/utils/__init__.py       |   0
>  .../tests/utils/br2-external/Config.in        |   1 +
>  .../tests/utils/br2-external/external.desc    |   1 +
>  .../tests/utils/br2-external/external.mk      |   2 +
>  .../br2-external/package/external/external.mk |   1 +
>  .../testing/tests/utils/test_check_package.py | 171 ++++++++++++++++++
>  utils/check-package                           |   3 +
>  utils/checkpackagelib/lib_mk.py               |   7 +-
>  utils/checkpackagelib/lib_patch.py            |   5 +-
>  12 files changed, 194 insertions(+), 8 deletions(-)
>  create mode 100644 support/testing/tests/utils/__init__.py
>  create mode 100644 support/testing/tests/utils/br2-external/Config.in
>  create mode 100644 support/testing/tests/utils/br2-external/external.desc
>  create mode 100644 support/testing/tests/utils/br2-external/external.mk
>  create mode 100644 support/testing/tests/utils/br2-external/package/external/external.mk
>  create mode 100644 support/testing/tests/utils/test_check_package.py
> 
