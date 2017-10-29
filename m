From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 12:05:59 -0200
Subject: [Buildroot] [PATCH v3 0/9] tests for git download infra (series 1/3)
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a new iteration of the series that first adds automated tests for the
git download infra and then rewrites the script to use git fetch.

The first 5 patches prepare the test infra to have the git test cases.
Patch 6 adds a test case that ensures hash checking is enabled for git packages.
The last 3 patches add a test case that checks each type of git ref can be used
as version of a git package.

Changes v2 -> v3:
 - remove patch not needed "allow to override logfile";
 - add support for br2-external to the base test class;
 - call make from test infra with empty env;
 - split the runtime test from the base test class;
 - use static repo to test git download;
 - use a single test case for git hash and a single test case for git refs
   because both do not take long to run and each do test a feature that needs
   all checks to pass to be considered OK;

Changes v1 -> v2:
 - use test infra for the tests;
 - split the patch of the download script;
 - remove patch "log checked out sha1" as it is not needed when using the test
   infra (maybe it can be resent later as an improvement);

The detailed changelog is part of each patch.
Here I include an overview of the series history:

v1 had these patches:
 support/download/git: log checked out sha1
 test/support/download/git: new test
 support/download/git: do not use git clone

For the next iterations I split the series in 3:
- s1/3: tests 1/2 (test infra and 2 test cases)
- s2/3: tests 2/2 (rest of the test cases)
- s3/3: changes to the git download infra

s3/3 v2 - the test infra was not merged yet at the time of sending, so I did not
include the tests:
 support/download/git: do not use git clone
 support/download/git: optimized download of sha1
 DEVELOPERS: add entry for support/download/git
 [RFC] support/download/git: shallow fetch of all branches

s1/3 v2 - rewrite using the test infra:
 testing/infra/builder: split configure() from build() 	
 testing/infra/builder: build with target and environment
 testing/infra/builder: allow to override logfile
 testing/tests/download: add infra for git tests
 testing/tests/download: add git hash tests
 testing/tests/download: add test for sha1 as git ref
 testing/tests/download: add test for git submodule

CURRENT s1/3 v3 - rewrite using static repo:
 testing/infra/builder: call make with empty env
 testing/infra/builder: split configure() from build()
 testing/infra/builder: build with target and environment
 testing/infra: split runtime test from BRTest
 testing/infra/basetest: support br2-external
 testing/tests/download: add git hash test
 testing/tests/download: test case for git refs
 testing/tests/download: test git branch
 testing/tests/download: test git submodules
You can see a run in this gitlab url:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/13324257

upcoming s2/3 v3 - rewrite using the test infra and a static repo:
 testing/tests/download: test git tag
 testing/tests/download: test git tag/branch precedence
 testing/tests/download: test git special ref
 testing/tests/download: test git branch with slash

upcoming s3/3 v3 - I know this series or 'git cache' will need to rebase in the
top of the other:
 DEVELOPERS: add entry for support/download/git
 support/download/git: do not use git clone
 testing/tests/download: test sha1 of special ref
 support/download/git: optimized download of sha1
 support/download/git: shallow fetch of all branches

Regards,
Ricardo


Ricardo Martincoski (9):
  testing/infra/builder: call make with empty env
  testing/infra/builder: split configure() from build()
  testing/infra/builder: build with target and environment
  testing/infra: split runtime test from BRTest
  testing/infra/basetest: support br2-external
  testing/tests/download: add git hash test
  testing/tests/download: test case for git refs
  testing/tests/download: test git branch
  testing/tests/download: test git submodules

 .gitlab-ci.yml                                     |   2 +
 support/testing/infra/basetest.py                  |  16 +++---
 support/testing/infra/builder.py                   |  45 +++++++++++++++--
 support/testing/infra/runtimetest.py               |  23 +++++++++
 support/testing/run-tests                          |   1 -
 support/testing/tests/core/test_post_scripts.py    |   3 +-
 support/testing/tests/core/test_rootfs_overlay.py  |   3 +-
 support/testing/tests/core/test_timezone.py        |   7 +--
 support/testing/tests/download/__init__.py         |   0
 .../tests/download/br2-external/git-hash/Config.in |   0
 .../download/br2-external/git-hash/external.desc   |   1 +
 .../download/br2-external/git-hash/external.mk     |   4 ++
 .../br2-external/git-hash/package/bad/bad.hash     |   1 +
 .../br2-external/git-hash/package/bad/bad.mk       |  10 ++++
 .../br2-external/git-hash/package/good/good.hash   |   1 +
 .../br2-external/git-hash/package/good/good.mk     |  10 ++++
 .../br2-external/git-hash/package/nohash/nohash.mk |  10 ++++
 .../tests/download/br2-external/git-refs/Config.in |   0
 .../download/br2-external/git-refs/external.desc   |   1 +
 .../download/br2-external/git-refs/external.mk     |   4 ++
 .../git-refs/package/git-branch/git-branch.hash    |   2 +
 .../git-refs/package/git-branch/git-branch.mk      |  11 +++++
 .../git-partial-sha1-branch-head.hash              |   2 +
 .../git-partial-sha1-branch-head.mk                |  11 +++++
 .../git-partial-sha1-reachable-by-branch.hash      |   2 +
 .../git-partial-sha1-reachable-by-branch.mk        |  11 +++++
 .../git-sha1-branch-head/git-sha1-branch-head.hash |   2 +
 .../git-sha1-branch-head/git-sha1-branch-head.mk   |  11 +++++
 .../git-sha1-reachable-by-branch.hash              |   2 +
 .../git-sha1-reachable-by-branch.mk                |  11 +++++
 .../git-submodule-disabled.hash                    |   2 +
 .../git-submodule-disabled.mk                      |  11 +++++
 .../git-submodule-enabled.hash                     |   3 ++
 .../git-submodule-enabled/git-submodule-enabled.mk |  28 +++++++++++
 .../git-wrong-content/git-wrong-content.hash       |   2 +
 .../package/git-wrong-content/git-wrong-content.mk |  11 +++++
 .../package/git-wrong-sha1/git-wrong-sha1.mk       |  11 +++++
 .../git-remote/refs-sub1.git/.gitattributes        |   1 +
 .../tests/download/git-remote/refs-sub1.git/HEAD   |   1 +
 .../tests/download/git-remote/refs-sub1.git/config |   4 ++
 .../07/cabc655213bdf7087d8dd50fda95124e935570      | Bin 0 -> 22 bytes
 .../1d/f823cb8a6d1866148ae50a8009762a9c4c777f      | Bin 0 -> 180 bytes
 .../7d/52f458bdb0f9f5a4beb46fa82824421b8b988e      | Bin 0 -> 65 bytes
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab      | Bin 0 -> 49 bytes
 .../a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a      | Bin 0 -> 122 bytes
 .../bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23      | Bin 0 -> 22 bytes
 .../cb/545facf77bbc5f24f95b6d503c338d10b7b717      | Bin 0 -> 151 bytes
 .../dd/130f6f4629514adaf2e03407f3ed9344eb6cd6      | Bin 0 -> 122 bytes
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5      | Bin 0 -> 23 bytes
 .../f8/001e5780100962a5e30a25cbc4c9609cfc7bf3      | Bin 0 -> 184 bytes
 .../git-remote/refs-sub1.git/refs/heads/submodule  |   1 +
 .../git-remote/refs-sub2.git/.gitattributes        |   1 +
 .../tests/download/git-remote/refs-sub2.git/HEAD   |   1 +
 .../tests/download/git-remote/refs-sub2.git/config |   4 ++
 .../0a/846af45c3e455789435f49f80d70e86b65b9d7      | Bin 0 -> 22 bytes
 .../0b/32ebd8fc52cec991f18c94be980e85a8341585      | Bin 0 -> 22 bytes
 .../32/d61bae693af7879da63b89a60d3ae67f851e56      | Bin 0 -> 151 bytes
 .../3e/9b0a5198c64cea9c00f820433411e3b4d50c1c      | Bin 0 -> 48 bytes
 .../85/8f666af75b7c0dfba6b8be7eac5f196e7a1221      | Bin 0 -> 49 bytes
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab      | Bin 0 -> 49 bytes
 .../cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb      | Bin 0 -> 184 bytes
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5      | Bin 0 -> 23 bytes
 .../e8/3f6f805bd016b90acafc8702c52d778eb57310      | Bin 0 -> 182 bytes
 .../git-remote/refs-sub2.git/refs/heads/submodule  |   1 +
 .../download/git-remote/repo.git/.gitattributes    |   1 +
 .../tests/download/git-remote/repo.git/HEAD        |   1 +
 .../tests/download/git-remote/repo.git/config      |   4 ++
 .../0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343      | Bin 0 -> 22 bytes
 .../11/93ff46343f4f6a0522e2b28b871e905178c1f0      | Bin 0 -> 23 bytes
 .../25/59d83bfe937fc0412d96ed664663c9e8a99055      | Bin 0 -> 22 bytes
 .../2f/a37f6885d7eb746df75eccaddbacf3ac82799d      | Bin 0 -> 180 bytes
 .../31/7406308d9259e2231bd0d6ddad3de3832bce08      | Bin 0 -> 182 bytes
 .../34/d1da713bf7de1c535e1d7d3ca985afd84bc7e5      | Bin 0 -> 23 bytes
 .../68/c197d0879d485f4f6cee85544722b79e68e59f      | Bin 0 -> 184 bytes
 .../8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7      | Bin 0 -> 65 bytes
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab      | Bin 0 -> 49 bytes
 .../a2/38b1dfcd825d47d834af3c5223417c8411d90d      | Bin 0 -> 152 bytes
 .../a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f      | Bin 0 -> 183 bytes
 .../b2/4b387624edc78d0292a127c43cad9ba97c6232      | Bin 0 -> 49 bytes
 .../d4/e2941d18a63535400476324ddeb7f40164be41      | Bin 0 -> 121 bytes
 .../e2/cfe068f7e5bf4de32ffe1241da53abce9fa89e      | Bin 0 -> 49 bytes
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5      | Bin 0 -> 23 bytes
 .../fe/74231105841041d5f441e70399d37f0e600aa5      | Bin 0 -> 121 bytes
 .../download/git-remote/repo.git/refs/heads/master |   1 +
 .../git-remote/repo.git/refs/heads/mybranch        |   1 +
 .../git-remote/repo.git/refs/heads/submodule       |   1 +
 support/testing/tests/download/gitbase.py          |  27 +++++++++++
 support/testing/tests/download/gitremote.py        |  52 ++++++++++++++++++++
 support/testing/tests/download/test_git.py         |  54 +++++++++++++++++++++
 support/testing/tests/fs/test_ext.py               |   9 ++--
 support/testing/tests/fs/test_iso9660.py           |   9 ++--
 support/testing/tests/fs/test_jffs2.py             |   3 +-
 support/testing/tests/fs/test_squashfs.py          |   3 +-
 support/testing/tests/fs/test_ubi.py               |   3 +-
 support/testing/tests/fs/test_yaffs2.py            |   3 +-
 support/testing/tests/init/base.py                 |   3 +-
 support/testing/tests/package/test_dropbear.py     |   3 +-
 support/testing/tests/package/test_python.py       |   3 +-
 support/testing/tests/toolchain/test_external.py   |   3 +-
 99 files changed, 436 insertions(+), 37 deletions(-)
 create mode 100644 support/testing/infra/runtimetest.py
 create mode 100644 support/testing/tests/download/__init__.py
 create mode 100644 support/testing/tests/download/br2-external/git-hash/Config.in
 create mode 100644 support/testing/tests/download/br2-external/git-hash/external.desc
 create mode 100644 support/testing/tests/download/br2-external/git-hash/external.mk
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/good/good.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/good/good.mk
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/Config.in
 create mode 100644 support/testing/tests/download/br2-external/git-refs/external.desc
 create mode 100644 support/testing/tests/download/br2-external/git-refs/external.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-branch/git-branch.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-branch/git-branch.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/.gitattributes
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/HEAD
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/config
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/07/cabc655213bdf7087d8dd50fda95124e935570
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/refs/heads/submodule
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/.gitattributes
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/HEAD
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/config
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/0a/846af45c3e455789435f49f80d70e86b65b9d7
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule
 create mode 100644 support/testing/tests/download/git-remote/repo.git/.gitattributes
 create mode 100644 support/testing/tests/download/git-remote/repo.git/HEAD
 create mode 100644 support/testing/tests/download/git-remote/repo.git/config
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/11/93ff46343f4f6a0522e2b28b871e905178c1f0
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/31/7406308d9259e2231bd0d6ddad3de3832bce08
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/34/d1da713bf7de1c535e1d7d3ca985afd84bc7e5
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/c197d0879d485f4f6cee85544722b79e68e59f
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/b2/4b387624edc78d0292a127c43cad9ba97c6232
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/e2/cfe068f7e5bf4de32ffe1241da53abce9fa89e
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/master
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/mybranch
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/submodule
 create mode 100644 support/testing/tests/download/gitbase.py
 create mode 100644 support/testing/tests/download/gitremote.py
 create mode 100644 support/testing/tests/download/test_git.py

-- 
2.14.2
