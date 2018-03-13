From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Mar 2018 00:09:38 -0300
Subject: [Buildroot] [PATCH v3 0/7] fix Python code style v3
Message-ID: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series fixes code style warnings reported by flake8 in the Python scripts
in the tree. Many patches from v1 were already applied.

I am ignoring this script for now:
support/scripts/xorg-release
I opened a thread about it:
http://lists.busybox.net/pipermail/buildroot/2018-January/211557.html

The first 4 patches fix each script.
I tried to do the minimum to accomplish the task avoiding any unrelated
refactoring, what IMO brings these advantages:
 - small chance of introducing regressions;
 - easy code review;
 - less testing effort.
The commit messages are terse as the changes I introduced are minimal.

Patch 5 adds flake8 to the Docker image, needed by the next patch.

After this patch, the docker image must be built, published, and have its tag
added to .gitlab.yml{,.in}

Patch 6 creates a job in GitLab to run flake8:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/57046920

Patch 7 ignores a file from the check.

And here a complete run on GitLab using a preview of the new Docker image:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/18789118

Regards,
Ricardo
--
Changes v2 -> v3:
  - manually accepted review tags.
  - dockerfile: improve commit log and use best practices.  (suggested by
    Yann E. MORIN)

Changes v1 -> v2:
  - genrandconfig: fix the long lines instead of ignoring them.  (suggested by
    Thomas Petazzoni)
  - size-stats-compare: the fix for E129 made the code less readable, use
    another fix.  (suggested by Thomas Petazzoni)
  - test_python_cryptography: new patch.
  - scanpypi: new patch.
  - dockerfile: install flake8 to the base docker image instead of adding sudo
    to install tools on the fly.  (suggested by Yann E. MORIN)
  - .gitlab-ci.yml: use flake8 pre-installed.  (suggested by Yann E. MORIN)
  - utils/diffconfig: ignore warnings for this file that comes from kernel
    source.  (suggested by Thomas Petazzoni)
--
Ricardo Martincoski (7):
  genrandconfig: fix code style
  size-stats-compare: fix code style
  test_python_cryptography: fix code style
  scanpypi: fix code style
  support/dockerfile: install flake8
  .gitlab-ci.yml: check flake8
  .flake8: ignore utils/diffconfig

 .flake8                                            |  3 ++
 .gitlab-ci.yml                                     | 11 +++++++
 .gitlab-ci.yml.in                                  | 11 +++++++
 support/docker/Dockerfile                          | 11 ++++++-
 .../tests/package/test_python_cryptography.py      | 23 ++++++++------
 utils/genrandconfig                                | 36 ++++++++++++----------
 utils/scanpypi                                     |  4 ++-
 utils/size-stats-compare                           |  7 +++--
 8 files changed, 75 insertions(+), 31 deletions(-)

-- 
2.7.4
