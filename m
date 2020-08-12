From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:28:58 +0200
Subject: [Buildroot] [PATCH 0/7] Switch to Python 3.x flake8
Message-ID: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Now that we are using the "async" keyword and related Python 3.x
functionality in support/scripts/pkg-stats, our check-flake8 Gitlab CI
job no longer passes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/681711009

It borks on the "async" keyword. The purpose of this series is to
switch to using the Python 3.x flake8.

Patches 1 to 5 fix existing issues in our Python codebase which were
accepted by the Python 2.x flake8, but not the Python 3.x flake8.

Patch 6 changes our Dockerfile to install python3-flake8 instead of
python-flake8, and patch 7 changes our Gitlab CI job to use the
Python3 flake8 checker.

Once patch 6 is applied, someone will have to rebuild and upload the
Docker image that Buildroot's Gitlab CI is using, and re-adjust patch
7 before applying it to use the new Docker image.

Thanks,

Thomas

Thomas Petazzoni (7):
  utils/{check-package,checkpackagelib}: consistently use raw strings
    for re.compile
  support/testing: consistently use raw strings for re.compile
  support/testing/tests/core/test_timezone.py: fix indentation
  utils/getdeveloperlib.py: use raw strings for re.compile/re.match
  utils/scanpypi: use raw strings in re.compile/re.sub
  support/docker: use python3-flake8
  support/misc/gitlab-ci.yml.in: use python3 for flake8

 support/docker/Dockerfile                   |  2 +-
 support/misc/gitlab-ci.yml.in               |  2 +-
 support/testing/infra/__init__.py           |  4 +-
 support/testing/tests/core/test_timezone.py |  8 +--
 utils/check-package                         | 34 ++++++------
 utils/checkpackagelib/lib_config.py         |  4 +-
 utils/checkpackagelib/lib_mk.py             | 60 ++++++++++-----------
 utils/checkpackagelib/lib_patch.py          |  6 +--
 utils/getdeveloperlib.py                    | 10 ++--
 utils/scanpypi                              |  8 +--
 10 files changed, 69 insertions(+), 69 deletions(-)

-- 
2.26.2
