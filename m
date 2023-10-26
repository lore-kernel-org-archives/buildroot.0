Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9920C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8904C41790;
	Thu, 26 Oct 2023 09:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8904C41790
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jA9M_XduRK6U; Thu, 26 Oct 2023 09:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0463240A71;
	Thu, 26 Oct 2023 09:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0463240A71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB8D1BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 443794114E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 443794114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0I-DbapvDArr for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:27 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25D5941725
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D5941725
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so110310266b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312445; x=1698917245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkAOg89tTOjD63yAJqATILwA73p8LrsO/OA8W91vGpE=;
 b=QBptr05Uq63N+eAj6HG3JXXb4phA7LVLwjSozwjyXz1j2VDm6hCeuJ4mxDyydXflyI
 qcdlO44FZ51VkMNRAIQUc5AP+6qOxDK0E3Zqauk01L+NrrRPdHLjzNXDx5R82pB6seVQ
 LNYYWEBuQqp7dPhwVMndRT46PLaQC2590iPTJ04yvVD2vc8wsfYtl56a7Wrp7zrQOduk
 Aek4VVVUScPgIUtE8SzhgF4+bho6IZ22jJqYJwIVq1eI7k9J1M61NjspXNiLdW6E/Bvd
 Bo6zaCJ85cRRKnTb3nI48xWie9MFGoaca2YAqsXtuRiF5o6N6nBRabzcAx0fM1kD1Ar0
 IL0w==
X-Gm-Message-State: AOJu0YwYMK/uksMRNCkuJMde+qQYsWlPV9NtiGS5os6c06ZqIU+iBpJT
 3TRxaSZM9yR21QSH714/d+nRs4lI6fkX5kmunJUDOpQvvmJi9ezq
X-Google-Smtp-Source: AGHT+IHlO7hr9Y/j/XBD5U+dcdA7o/xWAH6sZOO1I43aDacjFjXkqFYNObH/MfWzYI70FX5Hx1DImg==
X-Received: by 2002:a17:907:9403:b0:9ae:57b8:ad1b with SMTP id
 dk3-20020a170907940300b009ae57b8ad1bmr14333030ejc.21.1698312443375; 
 Thu, 26 Oct 2023 02:27:23 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:51 +0200
Message-ID: <20231026092701.12345-21-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312445; x=1698917245;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkAOg89tTOjD63yAJqATILwA73p8LrsO/OA8W91vGpE=;
 b=hcN5krprtI1uW8jfKDm6fK/y3ILFiSTTsY/h9IN/AJURq1H8leCqJ0LmMY/W5A+jVS
 6tM0RuVWgJs9pxO/NbPyYFk36ahdl3Zkdcb0sXlQXyoZ/v893oUmL+dX9bFz6aoL6ITA
 UOuHKINQlvx1ZqdjwXnZJ6D7Y+mCK6+oEwBwg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hcN5krpr
Subject: [Buildroot] [PATCH 20/30] package/python-constantly: update
 versioneer to 0.29
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Versioneer < 0.21 is incompatible with Python 3.12.0. Use the latest version
which is 0.29 as of this commit.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0001-Update-versioneer-to-0.29.patch      | 2619 +++++++++++++++++
 1 file changed, 2619 insertions(+)
 create mode 100644 package/python-constantly/0001-Update-versioneer-to-0.29.patch

diff --git a/package/python-constantly/0001-Update-versioneer-to-0.29.patch b/package/python-constantly/0001-Update-versioneer-to-0.29.patch
new file mode 100644
index 0000000000..1c865fe9c1
--- /dev/null
+++ b/package/python-constantly/0001-Update-versioneer-to-0.29.patch
@@ -0,0 +1,2619 @@
+From 2ab3f529c070e3efae209a46128cca6669029cec Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Mon, 23 Oct 2023 18:01:12 +0200
+Subject: [PATCH] Update versioneer to 0.29
+
+Fixes builds against Python 3.12.0
+
+Upstream: https://github.com/twisted/constantly/pull/30
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ versioneer.py | 1851 +++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 1243 insertions(+), 608 deletions(-)
+
+diff --git a/versioneer.py b/versioneer.py
+index c010f63..de97d90 100644
+--- a/versioneer.py
++++ b/versioneer.py
+@@ -1,23 +1,19 @@
++# Version: 0.29
+ 
+-# Version: 0.15
++"""The Versioneer - like a rocketeer, but for versions.
+ 
+-"""
+ The Versioneer
+ ==============
+ 
+ * like a rocketeer, but for versions!
+-* https://github.com/warner/python-versioneer
++* https://github.com/python-versioneer/python-versioneer
+ * Brian Warner
+-* License: Public Domain
+-* Compatible With: python2.6, 2.7, 3.2, 3.3, 3.4, and pypy
+-* [![Latest Version]
+-(https://pypip.in/version/versioneer/badge.svg?style=flat)
+-](https://pypi.python.org/pypi/versioneer/)
+-* [![Build Status]
+-(https://travis-ci.org/warner/python-versioneer.png?branch=master)
+-](https://travis-ci.org/warner/python-versioneer)
+-
+-This is a tool for managing a recorded version number in distutils-based
++* License: Public Domain (Unlicense)
++* Compatible with: Python 3.7, 3.8, 3.9, 3.10, 3.11 and pypy3
++* [![Latest Version][pypi-image]][pypi-url]
++* [![Build Status][travis-image]][travis-url]
++
++This is a tool for managing a recorded version number in setuptools-based
+ python projects. The goal is to remove the tedious and error-prone "update
+ the embedded version string" step from your release process. Making a new
+ release should be as easy as recording a new tag in your version-control
+@@ -26,9 +22,38 @@ system, and maybe making new tarballs.
+ 
+ ## Quick Install
+ 
+-* `pip install versioneer` to somewhere to your $PATH
+-* add a `[versioneer]` section to your setup.cfg (see below)
+-* run `versioneer install` in your source tree, commit the results
++Versioneer provides two installation modes. The "classic" vendored mode installs
++a copy of versioneer into your repository. The experimental build-time dependency mode
++is intended to allow you to skip this step and simplify the process of upgrading.
++
++### Vendored mode
++
++* `pip install versioneer` to somewhere in your $PATH
++   * A [conda-forge recipe](https://github.com/conda-forge/versioneer-feedstock) is
++     available, so you can also use `conda install -c conda-forge versioneer`
++* add a `[tool.versioneer]` section to your `pyproject.toml` or a
++  `[versioneer]` section to your `setup.cfg` (see [Install](INSTALL.md))
++   * Note that you will need to add `tomli; python_version < "3.11"` to your
++     build-time dependencies if you use `pyproject.toml`
++* run `versioneer install --vendor` in your source tree, commit the results
++* verify version information with `python setup.py version`
++
++### Build-time dependency mode
++
++* `pip install versioneer` to somewhere in your $PATH
++   * A [conda-forge recipe](https://github.com/conda-forge/versioneer-feedstock) is
++     available, so you can also use `conda install -c conda-forge versioneer`
++* add a `[tool.versioneer]` section to your `pyproject.toml` or a
++  `[versioneer]` section to your `setup.cfg` (see [Install](INSTALL.md))
++* add `versioneer` (with `[toml]` extra, if configuring in `pyproject.toml`)
++  to the `requires` key of the `build-system` table in `pyproject.toml`:
++  ```toml
++  [build-system]
++  requires = ["setuptools", "versioneer[toml]"]
++  build-backend = "setuptools.build_meta"
++  ```
++* run `versioneer install --no-vendor` in your source tree, commit the results
++* verify version information with `python setup.py version`
+ 
+ ## Version Identifiers
+ 
+@@ -60,7 +85,7 @@ version 1.3). Many VCS systems can report a description that captures this,
+ for example `git describe --tags --dirty --always` reports things like
+ "0.7-1-g574ab98-dirty" to indicate that the checkout is one revision past the
+ 0.7 tag, has a unique revision id of "574ab98", and is "dirty" (it has
+-uncommitted changes.
++uncommitted changes).
+ 
+ The version identifier is used for multiple purposes:
+ 
+@@ -87,125 +112,7 @@ the generated version data.
+ 
+ ## Installation
+ 
+-First, decide on values for the following configuration variables:
+-
+-* `VCS`: the version control system you use. Currently accepts "git".
+-
+-* `style`: the style of version string to be produced. See "Styles" below for
+-  details. Defaults to "pep440", which looks like
+-  `TAG[+DISTANCE.gSHORTHASH[.dirty]]`.
+-
+-* `versionfile_source`:
+-
+-  A project-relative pathname into which the generated version strings should
+-  be written. This is usually a `_version.py` next to your project's main
+-  `__init__.py` file, so it can be imported at runtime. If your project uses
+-  `src/myproject/__init__.py`, this should be `src/myproject/_version.py`.
+-  This file should be checked in to your VCS as usual: the copy created below
+-  by `setup.py setup_versioneer` will include code that parses expanded VCS
+-  keywords in generated tarballs. The 'build' and 'sdist' commands will
+-  replace it with a copy that has just the calculated version string.
+-
+-  This must be set even if your project does not have any modules (and will
+-  therefore never import `_version.py`), since "setup.py sdist" -based trees
+-  still need somewhere to record the pre-calculated version strings. Anywhere
+-  in the source tree should do. If there is a `__init__.py` next to your
+-  `_version.py`, the `setup.py setup_versioneer` command (described below)
+-  will append some `__version__`-setting assignments, if they aren't already
+-  present.
+-
+-* `versionfile_build`:
+-
+-  Like `versionfile_source`, but relative to the build directory instead of
+-  the source directory. These will differ when your setup.py uses
+-  'package_dir='. If you have `package_dir={'myproject': 'src/myproject'}`,
+-  then you will probably have `versionfile_build='myproject/_version.py'` and
+-  `versionfile_source='src/myproject/_version.py'`.
+-
+-  If this is set to None, then `setup.py build` will not attempt to rewrite
+-  any `_version.py` in the built tree. If your project does not have any
+-  libraries (e.g. if it only builds a script), then you should use
+-  `versionfile_build = None` and override `distutils.command.build_scripts`
+-  to explicitly insert a copy of `versioneer.get_version()` into your
+-  generated script.
+-
+-* `tag_prefix`:
+-
+-  a string, like 'PROJECTNAME-', which appears at the start of all VCS tags.
+-  If your tags look like 'myproject-1.2.0', then you should use
+-  tag_prefix='myproject-'. If you use unprefixed tags like '1.2.0', this
+-  should be an empty string.
+-
+-* `parentdir_prefix`:
+-
+-  a optional string, frequently the same as tag_prefix, which appears at the
+-  start of all unpacked tarball filenames. If your tarball unpacks into
+-  'myproject-1.2.0', this should be 'myproject-'. To disable this feature,
+-  just omit the field from your `setup.cfg`.
+-
+-This tool provides one script, named `versioneer`. That script has one mode,
+-"install", which writes a copy of `versioneer.py` into the current directory
+-and runs `versioneer.py setup` to finish the installation.
+-
+-To versioneer-enable your project:
+-
+-* 1: Modify your `setup.cfg`, adding a section named `[versioneer]` and
+-  populating it with the configuration values you decided earlier (note that
+-  the option names are not case-sensitive):
+-
+-  ````
+-  [versioneer]
+-  VCS = git
+-  style = pep440
+-  versionfile_source = src/myproject/_version.py
+-  versionfile_build = myproject/_version.py
+-  tag_prefix = ""
+-  parentdir_prefix = myproject-
+-  ````
+-
+-* 2: Run `versioneer install`. This will do the following:
+-
+-  * copy `versioneer.py` into the top of your source tree
+-  * create `_version.py` in the right place (`versionfile_source`)
+-  * modify your `__init__.py` (if one exists next to `_version.py`) to define
+-    `__version__` (by calling a function from `_version.py`)
+-  * modify your `MANIFEST.in` to include both `versioneer.py` and the
+-    generated `_version.py` in sdist tarballs
+-
+-  `versioneer install` will complain about any problems it finds with your
+-  `setup.py` or `setup.cfg`. Run it multiple times until you have fixed all
+-  the problems.
+-
+-* 3: add a `import versioneer` to your setup.py, and add the following
+-  arguments to the setup() call:
+-
+-        version=versioneer.get_version(),
+-        cmdclass=versioneer.get_cmdclass(),
+-
+-* 4: commit these changes to your VCS. To make sure you won't forget,
+-  `versioneer install` will mark everything it touched for addition using
+-  `git add`. Don't forget to add `setup.py` and `setup.cfg` too.
+-
+-## Post-Installation Usage
+-
+-Once established, all uses of your tree from a VCS checkout should get the
+-current version string. All generated tarballs should include an embedded
+-version string (so users who unpack them will not need a VCS tool installed).
+-
+-If you distribute your project through PyPI, then the release process should
+-boil down to two steps:
+-
+-* 1: git tag 1.0
+-* 2: python setup.py register sdist upload
+-
+-If you distribute it through github (i.e. users use github to generate
+-tarballs with `git archive`), the process is:
+-
+-* 1: git tag 1.0
+-* 2: git push; git push --tags
+-
+-Versioneer will report "0+untagged.NUMCOMMITS.gHASH" until your tree has at
+-least one tag in its history.
++See [INSTALL.md](./INSTALL.md) for detailed installation instructions.
+ 
+ ## Version-String Flavors
+ 
+@@ -226,6 +133,10 @@ information:
+ * `['full-revisionid']`: detailed revision identifier. For Git, this is the
+   full SHA1 commit id, e.g. "1076c978a8d3cfc70f408fe5974aa6c092c949ac".
+ 
++* `['date']`: Date and time of the latest `HEAD` commit. For Git, it is the
++  commit date in ISO 8601 format. This will be None if the date is not
++  available.
++
+ * `['dirty']`: a boolean, True if the tree has uncommitted changes. Note that
+   this is only accurate if run in a VCS checkout, otherwise it is likely to
+   be False or None
+@@ -264,8 +175,8 @@ that this commit is two revisions ("+2") beyond the "0.11" tag. For released
+ software (exactly equal to a known tag), the identifier will only contain the
+ stripped tag, e.g. "0.11".
+ 
+-Other styles are available. See details.md in the Versioneer source tree for
+-descriptions.
++Other styles are available. See [details.md](details.md) in the Versioneer
++source tree for descriptions.
+ 
+ ## Debugging
+ 
+@@ -275,47 +186,84 @@ version`, which will run the version-lookup code in a verbose mode, and will
+ display the full contents of `get_versions()` (including the `error` string,
+ which may help identify what went wrong).
+ 
+-## Updating Versioneer
++## Known Limitations
+ 
+-To upgrade your project to a new release of Versioneer, do the following:
++Some situations are known to cause problems for Versioneer. This details the
++most significant ones. More can be found on Github
++[issues page](https://github.com/python-versioneer/python-versioneer/issues).
+ 
+-* install the new Versioneer (`pip install -U versioneer` or equivalent)
+-* edit `setup.cfg`, if necessary, to include any new configuration settings
+-  indicated by the release notes
+-* re-run `versioneer install` in your source tree, to replace
+-  `SRC/_version.py`
+-* commit any changed files
++### Subprojects
++
++Versioneer has limited support for source trees in which `setup.py` is not in
++the root directory (e.g. `setup.py` and `.git/` are *not* siblings). The are
++two common reasons why `setup.py` might not be in the root:
++
++* Source trees which contain multiple subprojects, such as
++  [Buildbot](https://github.com/buildbot/buildbot), which contains both
++  "master" and "slave" subprojects, each with their own `setup.py`,
++  `setup.cfg`, and `tox.ini`. Projects like these produce multiple PyPI
++  distributions (and upload multiple independently-installable tarballs).
++* Source trees whose main purpose is to contain a C library, but which also
++  provide bindings to Python (and perhaps other languages) in subdirectories.
++
++Versioneer will look for `.git` in parent directories, and most operations
++should get the right version string. However `pip` and `setuptools` have bugs
++and implementation details which frequently cause `pip install .` from a
++subproject directory to fail to find a correct version string (so it usually
++defaults to `0+unknown`).
++
++`pip install --editable .` should work correctly. `setup.py install` might
++work too.
++
++Pip-8.1.1 is known to have this problem, but hopefully it will get fixed in
++some later version.
++
++[Bug #38](https://github.com/python-versioneer/python-versioneer/issues/38) is tracking
++this issue. The discussion in
++[PR #61](https://github.com/python-versioneer/python-versioneer/pull/61) describes the
++issue from the Versioneer side in more detail.
++[pip PR#3176](https://github.com/pypa/pip/pull/3176) and
++[pip PR#3615](https://github.com/pypa/pip/pull/3615) contain work to improve
++pip to let Versioneer work correctly.
++
++Versioneer-0.16 and earlier only looked for a `.git` directory next to the
++`setup.cfg`, so subprojects were completely unsupported with those releases.
+ 
+-### Upgrading to 0.15
++### Editable installs with setuptools <= 18.5
+ 
+-Starting with this version, Versioneer is configured with a `[versioneer]`
+-section in your `setup.cfg` file. Earlier versions required the `setup.py` to
+-set attributes on the `versioneer` module immediately after import. The new
+-version will refuse to run (raising an exception during import) until you
+-have provided the necessary `setup.cfg` section.
++`setup.py develop` and `pip install --editable .` allow you to install a
++project into a virtualenv once, then continue editing the source code (and
++test) without re-installing after every change.
+ 
+-In addition, the Versioneer package provides an executable named
+-`versioneer`, and the installation process is driven by running `versioneer
+-install`. In 0.14 and earlier, the executable was named
+-`versioneer-installer` and was run without an argument.
++"Entry-point scripts" (`setup(entry_points={"console_scripts": ..})`) are a
++convenient way to specify executable scripts that should be installed along
++with the python package.
+ 
+-### Upgrading to 0.14
++These both work as expected when using modern setuptools. When using
++setuptools-18.5 or earlier, however, certain operations will cause
++`pkg_resources.DistributionNotFound` errors when running the entrypoint
++script, which must be resolved by re-installing the package. This happens
++when the install happens with one version, then the egg_info data is
++regenerated while a different version is checked out. Many setup.py commands
++cause egg_info to be rebuilt (including `sdist`, `wheel`, and installing into
++a different virtualenv), so this can be surprising.
+ 
+-0.14 changes the format of the version string. 0.13 and earlier used
+-hyphen-separated strings like "0.11-2-g1076c97-dirty". 0.14 and beyond use a
+-plus-separated "local version" section strings, with dot-separated
+-components, like "0.11+2.g1076c97". PEP440-strict tools did not like the old
+-format, but should be ok with the new one.
++[Bug #83](https://github.com/python-versioneer/python-versioneer/issues/83) describes
++this one, but upgrading to a newer version of setuptools should probably
++resolve it.
+ 
+-### Upgrading from 0.11 to 0.12
+ 
+-Nothing special.
++## Updating Versioneer
+ 
+-### Upgrading from 0.10 to 0.11
++To upgrade your project to a new release of Versioneer, do the following:
+ 
+-You must add a `versioneer.VCS = "git"` to your `setup.py` before re-running
+-`setup.py setup_versioneer`. This will enable the use of additional
+-version-control systems (SVN, etc) in the future.
++* install the new Versioneer (`pip install -U versioneer` or equivalent)
++* edit `setup.cfg` and `pyproject.toml`, if necessary,
++  to include any new configuration settings indicated by the release notes.
++  See [UPGRADING](./UPGRADING.md) for details.
++* re-run `versioneer install --[no-]vendor` in your source tree, to replace
++  `SRC/_version.py`
++* commit any changed files
+ 
+ ## Future Directions
+ 
+@@ -330,49 +278,101 @@ installation by editing setup.py . Alternatively, it might go the other
+ direction and include code from all supported VCS systems, reducing the
+ number of intermediate scripts.
+ 
++## Similar projects
++
++* [setuptools_scm](https://github.com/pypa/setuptools_scm/) - a non-vendored build-time
++  dependency
++* [minver](https://github.com/jbweston/miniver) - a lightweight reimplementation of
++  versioneer
++* [versioningit](https://github.com/jwodder/versioningit) - a PEP 518-based setuptools
++  plugin
+ 
+ ## License
+ 
+-To make Versioneer easier to embed, all its code is hereby released into the
+-public domain. The `_version.py` that it creates is also in the public
+-domain.
++To make Versioneer easier to embed, all its code is dedicated to the public
++domain. The `_version.py` that it creates is also in the public domain.
++Specifically, both are released under the "Unlicense", as described in
++https://unlicense.org/.
++
++[pypi-image]: https://img.shields.io/pypi/v/versioneer.svg
++[pypi-url]: https://pypi.python.org/pypi/versioneer/
++[travis-image]:
++https://img.shields.io/travis/com/python-versioneer/python-versioneer.svg
++[travis-url]: https://travis-ci.com/github/python-versioneer/python-versioneer
+ 
+ """
++# pylint:disable=invalid-name,import-outside-toplevel,missing-function-docstring
++# pylint:disable=missing-class-docstring,too-many-branches,too-many-statements
++# pylint:disable=raise-missing-from,too-many-lines,too-many-locals,import-error
++# pylint:disable=too-few-public-methods,redefined-outer-name,consider-using-with
++# pylint:disable=attribute-defined-outside-init,too-many-arguments
+ 
+-from __future__ import print_function
+-try:
+-    import configparser
+-except ImportError:
+-    import ConfigParser as configparser
++import configparser
+ import errno
+ import json
+ import os
+ import re
+ import subprocess
+ import sys
++from pathlib import Path
++from typing import Any, Callable, cast, Dict, List, Optional, Tuple, Union
++from typing import NoReturn
++import functools
++
++have_tomllib = True
++if sys.version_info >= (3, 11):
++    import tomllib
++else:
++    try:
++        import tomli as tomllib
++    except ImportError:
++        have_tomllib = False
+ 
+ 
+ class VersioneerConfig:
+-    pass
++    """Container for Versioneer configuration parameters."""
+ 
++    VCS: str
++    style: str
++    tag_prefix: str
++    versionfile_source: str
++    versionfile_build: Optional[str]
++    parentdir_prefix: Optional[str]
++    verbose: Optional[bool]
+ 
+-def get_root():
+-    # we require that all commands are run from the project root, i.e. the
+-    # directory that contains setup.py, setup.cfg, and versioneer.py .
++
++def get_root() -> str:
++    """Get the project root directory.
++
++    We require that all commands are run from the project root, i.e. the
++    directory that contains setup.py, setup.cfg, and versioneer.py .
++    """
+     root = os.path.realpath(os.path.abspath(os.getcwd()))
+     setup_py = os.path.join(root, "setup.py")
++    pyproject_toml = os.path.join(root, "pyproject.toml")
+     versioneer_py = os.path.join(root, "versioneer.py")
+-    if not (os.path.exists(setup_py) or os.path.exists(versioneer_py)):
++    if not (
++        os.path.exists(setup_py)
++        or os.path.exists(pyproject_toml)
++        or os.path.exists(versioneer_py)
++    ):
+         # allow 'python path/to/setup.py COMMAND'
+         root = os.path.dirname(os.path.realpath(os.path.abspath(sys.argv[0])))
+         setup_py = os.path.join(root, "setup.py")
++        pyproject_toml = os.path.join(root, "pyproject.toml")
+         versioneer_py = os.path.join(root, "versioneer.py")
+-    if not (os.path.exists(setup_py) or os.path.exists(versioneer_py)):
+-        err = ("Versioneer was unable to run the project root directory. "
+-               "Versioneer requires setup.py to be executed from "
+-               "its immediate directory (like 'python setup.py COMMAND'), "
+-               "or in a way that lets it use sys.argv[0] to find the root "
+-               "(like 'python path/to/setup.py COMMAND').")
++    if not (
++        os.path.exists(setup_py)
++        or os.path.exists(pyproject_toml)
++        or os.path.exists(versioneer_py)
++    ):
++        err = (
++            "Versioneer was unable to run the project root directory. "
++            "Versioneer requires setup.py to be executed from "
++            "its immediate directory (like 'python setup.py COMMAND'), "
++            "or in a way that lets it use sys.argv[0] to find the root "
++            "(like 'python path/to/setup.py COMMAND')."
++        )
+         raise VersioneerBadRootError(err)
+     try:
+         # Certain runtime workflows (setup.py install/develop in a setuptools
+@@ -381,122 +381,189 @@ def get_root():
+         # module-import table will cache the first one. So we can't use
+         # os.path.dirname(__file__), as that will find whichever
+         # versioneer.py was first imported, even in later projects.
+-        me = os.path.realpath(os.path.abspath(__file__))
+-        if os.path.splitext(me)[0] != os.path.splitext(versioneer_py)[0]:
+-            print("Warning: build in %s is using versioneer.py from %s"
+-                  % (os.path.dirname(me), versioneer_py))
++        my_path = os.path.realpath(os.path.abspath(__file__))
++        me_dir = os.path.normcase(os.path.splitext(my_path)[0])
++        vsr_dir = os.path.normcase(os.path.splitext(versioneer_py)[0])
++        if me_dir != vsr_dir and "VERSIONEER_PEP518" not in globals():
++            print(
++                "Warning: build in %s is using versioneer.py from %s"
++                % (os.path.dirname(my_path), versioneer_py)
++            )
+     except NameError:
+         pass
+     return root
+ 
+ 
+-def get_config_from_root(root):
+-    # This might raise EnvironmentError (if setup.cfg is missing), or
++def get_config_from_root(root: str) -> VersioneerConfig:
++    """Read the project setup.cfg file to determine Versioneer config."""
++    # This might raise OSError (if setup.cfg is missing), or
+     # configparser.NoSectionError (if it lacks a [versioneer] section), or
+     # configparser.NoOptionError (if it lacks "VCS="). See the docstring at
+     # the top of versioneer.py for instructions on writing your setup.cfg .
+-    setup_cfg = os.path.join(root, "setup.cfg")
+-    parser = configparser.SafeConfigParser()
+-    with open(setup_cfg, "r") as f:
+-        parser.readfp(f)
+-    VCS = parser.get("versioneer", "VCS")  # mandatory
+-
+-    def get(parser, name):
+-        if parser.has_option("versioneer", name):
+-            return parser.get("versioneer", name)
+-        return None
++    root_pth = Path(root)
++    pyproject_toml = root_pth / "pyproject.toml"
++    setup_cfg = root_pth / "setup.cfg"
++    section: Union[Dict[str, Any], configparser.SectionProxy, None] = None
++    if pyproject_toml.exists() and have_tomllib:
++        try:
++            with open(pyproject_toml, "rb") as fobj:
++                pp = tomllib.load(fobj)
++            section = pp["tool"]["versioneer"]
++        except (tomllib.TOMLDecodeError, KeyError) as e:
++            print(f"Failed to load config from {pyproject_toml}: {e}")
++            print("Try to load it from setup.cfg")
++    if not section:
++        parser = configparser.ConfigParser()
++        with open(setup_cfg) as cfg_file:
++            parser.read_file(cfg_file)
++        parser.get("versioneer", "VCS")  # raise error if missing
++
++        section = parser["versioneer"]
++
++    # `cast`` really shouldn't be used, but its simplest for the
++    # common VersioneerConfig users at the moment. We verify against
++    # `None` values elsewhere where it matters
++
+     cfg = VersioneerConfig()
+-    cfg.VCS = VCS
+-    cfg.style = get(parser, "style") or ""
+-    cfg.versionfile_source = get(parser, "versionfile_source")
+-    cfg.versionfile_build = get(parser, "versionfile_build")
+-    cfg.tag_prefix = get(parser, "tag_prefix")
+-    cfg.parentdir_prefix = get(parser, "parentdir_prefix")
+-    cfg.verbose = get(parser, "verbose")
++    cfg.VCS = section["VCS"]
++    cfg.style = section.get("style", "")
++    cfg.versionfile_source = cast(str, section.get("versionfile_source"))
++    cfg.versionfile_build = section.get("versionfile_build")
++    cfg.tag_prefix = cast(str, section.get("tag_prefix"))
++    if cfg.tag_prefix in ("''", '""', None):
++        cfg.tag_prefix = ""
++    cfg.parentdir_prefix = section.get("parentdir_prefix")
++    if isinstance(section, configparser.SectionProxy):
++        # Make sure configparser translates to bool
++        cfg.verbose = section.getboolean("verbose")
++    else:
++        cfg.verbose = section.get("verbose")
++
+     return cfg
+ 
+ 
+ class NotThisMethod(Exception):
+-    pass
++    """Exception raised if a method is not valid for the current scenario."""
++
+ 
+ # these dictionaries contain VCS-specific tools
+-LONG_VERSION_PY = {}
+-HANDLERS = {}
++LONG_VERSION_PY: Dict[str, str] = {}
++HANDLERS: Dict[str, Dict[str, Callable]] = {}
+ 
+ 
+-def register_vcs_handler(vcs, method):  # decorator
+-    def decorate(f):
+-        if vcs not in HANDLERS:
+-            HANDLERS[vcs] = {}
+-        HANDLERS[vcs][method] = f
++def register_vcs_handler(vcs: str, method: str) -> Callable:  # decorator
++    """Create decorator to mark a method as the handler of a VCS."""
++
++    def decorate(f: Callable) -> Callable:
++        """Store f in HANDLERS[vcs][method]."""
++        HANDLERS.setdefault(vcs, {})[method] = f
+         return f
++
+     return decorate
+ 
+ 
+-def run_command(commands, args, cwd=None, verbose=False, hide_stderr=False):
++def run_command(
++    commands: List[str],
++    args: List[str],
++    cwd: Optional[str] = None,
++    verbose: bool = False,
++    hide_stderr: bool = False,
++    env: Optional[Dict[str, str]] = None,
++) -> Tuple[Optional[str], Optional[int]]:
++    """Call the given command(s)."""
+     assert isinstance(commands, list)
+-    p = None
+-    for c in commands:
++    process = None
++
++    popen_kwargs: Dict[str, Any] = {}
++    if sys.platform == "win32":
++        # This hides the console window if pythonw.exe is used
++        startupinfo = subprocess.STARTUPINFO()
++        startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
++        popen_kwargs["startupinfo"] = startupinfo
++
++    for command in commands:
+         try:
+-            dispcmd = str([c] + args)
++            dispcmd = str([command] + args)
+             # remember shell=False, so use git.cmd on windows, not just git
+-            p = subprocess.Popen([c] + args, cwd=cwd, stdout=subprocess.PIPE,
+-                                 stderr=(subprocess.PIPE if hide_stderr
+-                                         else None))
++            process = subprocess.Popen(
++                [command] + args,
++                cwd=cwd,
++                env=env,
++                stdout=subprocess.PIPE,
++                stderr=(subprocess.PIPE if hide_stderr else None),
++                **popen_kwargs,
++            )
+             break
+-        except EnvironmentError:
+-            e = sys.exc_info()[1]
++        except OSError as e:
+             if e.errno == errno.ENOENT:
+                 continue
+             if verbose:
+                 print("unable to run %s" % dispcmd)
+                 print(e)
+-            return None
++            return None, None
+     else:
+         if verbose:
+             print("unable to find command, tried %s" % (commands,))
+-        return None
+-    stdout = p.communicate()[0].strip()
+-    if sys.version_info[0] >= 3:
+-        stdout = stdout.decode()
+-    if p.returncode != 0:
++        return None, None
++    stdout = process.communicate()[0].strip().decode()
++    if process.returncode != 0:
+         if verbose:
+             print("unable to run %s (error)" % dispcmd)
+-        return None
+-    return stdout
+-LONG_VERSION_PY['git'] = '''
++            print("stdout was %s" % stdout)
++        return None, process.returncode
++    return stdout, process.returncode
++
++
++LONG_VERSION_PY[
++    "git"
++] = r'''
+ # This file helps to compute a version number in source trees obtained from
+ # git-archive tarball (such as those provided by githubs download-from-tag
+ # feature). Distribution tarballs (built by setup.py sdist) and build
+ # directories (produced by setup.py build) will contain a much shorter file
+ # that just contains the computed version number.
+ 
+-# This file is released into the public domain. Generated by
+-# versioneer-0.15 (https://github.com/warner/python-versioneer)
++# This file is released into the public domain.
++# Generated by versioneer-0.29
++# https://github.com/python-versioneer/python-versioneer
++
++"""Git implementation of _version.py."""
+ 
+ import errno
+ import os
+ import re
+ import subprocess
+ import sys
++from typing import Any, Callable, Dict, List, Optional, Tuple
++import functools
+ 
+ 
+-def get_keywords():
++def get_keywords() -> Dict[str, str]:
++    """Get the keywords needed to look up the version information."""
+     # these strings will be replaced by git during git-archive.
+     # setup.py/versioneer.py will grep for the variable names, so they must
+     # each be defined on a line of their own. _version.py will just call
+     # get_keywords().
+     git_refnames = "%(DOLLAR)sFormat:%%d%(DOLLAR)s"
+     git_full = "%(DOLLAR)sFormat:%%H%(DOLLAR)s"
+-    keywords = {"refnames": git_refnames, "full": git_full}
++    git_date = "%(DOLLAR)sFormat:%%ci%(DOLLAR)s"
++    keywords = {"refnames": git_refnames, "full": git_full, "date": git_date}
+     return keywords
+ 
+ 
+ class VersioneerConfig:
+-    pass
++    """Container for Versioneer configuration parameters."""
+ 
++    VCS: str
++    style: str
++    tag_prefix: str
++    parentdir_prefix: str
++    versionfile_source: str
++    verbose: bool
+ 
+-def get_config():
++
++def get_config() -> VersioneerConfig:
++    """Create, populate and return the VersioneerConfig() object."""
+     # these strings are filled in when 'setup.py versioneer' creates
+     # _version.py
+     cfg = VersioneerConfig()
+@@ -510,15 +577,17 @@ def get_config():
+ 
+ 
+ class NotThisMethod(Exception):
+-    pass
++    """Exception raised if a method is not valid for the current scenario."""
+ 
+ 
+-LONG_VERSION_PY = {}
+-HANDLERS = {}
++LONG_VERSION_PY: Dict[str, str] = {}
++HANDLERS: Dict[str, Dict[str, Callable]] = {}
+ 
+ 
+-def register_vcs_handler(vcs, method):  # decorator
+-    def decorate(f):
++def register_vcs_handler(vcs: str, method: str) -> Callable:  # decorator
++    """Create decorator to mark a method as the handler of a VCS."""
++    def decorate(f: Callable) -> Callable:
++        """Store f in HANDLERS[vcs][method]."""
+         if vcs not in HANDLERS:
+             HANDLERS[vcs] = {}
+         HANDLERS[vcs][method] = f
+@@ -526,91 +595,142 @@ def register_vcs_handler(vcs, method):  # decorator
+     return decorate
+ 
+ 
+-def run_command(commands, args, cwd=None, verbose=False, hide_stderr=False):
++def run_command(
++    commands: List[str],
++    args: List[str],
++    cwd: Optional[str] = None,
++    verbose: bool = False,
++    hide_stderr: bool = False,
++    env: Optional[Dict[str, str]] = None,
++) -> Tuple[Optional[str], Optional[int]]:
++    """Call the given command(s)."""
+     assert isinstance(commands, list)
+-    p = None
+-    for c in commands:
++    process = None
++
++    popen_kwargs: Dict[str, Any] = {}
++    if sys.platform == "win32":
++        # This hides the console window if pythonw.exe is used
++        startupinfo = subprocess.STARTUPINFO()
++        startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
++        popen_kwargs["startupinfo"] = startupinfo
++
++    for command in commands:
+         try:
+-            dispcmd = str([c] + args)
++            dispcmd = str([command] + args)
+             # remember shell=False, so use git.cmd on windows, not just git
+-            p = subprocess.Popen([c] + args, cwd=cwd, stdout=subprocess.PIPE,
+-                                 stderr=(subprocess.PIPE if hide_stderr
+-                                         else None))
++            process = subprocess.Popen([command] + args, cwd=cwd, env=env,
++                                       stdout=subprocess.PIPE,
++                                       stderr=(subprocess.PIPE if hide_stderr
++                                               else None), **popen_kwargs)
+             break
+-        except EnvironmentError:
+-            e = sys.exc_info()[1]
++        except OSError as e:
+             if e.errno == errno.ENOENT:
+                 continue
+             if verbose:
+                 print("unable to run %%s" %% dispcmd)
+                 print(e)
+-            return None
++            return None, None
+     else:
+         if verbose:
+             print("unable to find command, tried %%s" %% (commands,))
+-        return None
+-    stdout = p.communicate()[0].strip()
+-    if sys.version_info[0] >= 3:
+-        stdout = stdout.decode()
+-    if p.returncode != 0:
++        return None, None
++    stdout = process.communicate()[0].strip().decode()
++    if process.returncode != 0:
+         if verbose:
+             print("unable to run %%s (error)" %% dispcmd)
+-        return None
+-    return stdout
++            print("stdout was %%s" %% stdout)
++        return None, process.returncode
++    return stdout, process.returncode
++
++
++def versions_from_parentdir(
++    parentdir_prefix: str,
++    root: str,
++    verbose: bool,
++) -> Dict[str, Any]:
++    """Try to determine the version from the parent directory name.
++
++    Source tarballs conventionally unpack into a directory that includes both
++    the project name and a version string. We will also support searching up
++    two directory levels for an appropriately named parent directory
++    """
++    rootdirs = []
++
++    for _ in range(3):
++        dirname = os.path.basename(root)
++        if dirname.startswith(parentdir_prefix):
++            return {"version": dirname[len(parentdir_prefix):],
++                    "full-revisionid": None,
++                    "dirty": False, "error": None, "date": None}
++        rootdirs.append(root)
++        root = os.path.dirname(root)  # up a level
+ 
+-
+-def versions_from_parentdir(parentdir_prefix, root, verbose):
+-    # Source tarballs conventionally unpack into a directory that includes
+-    # both the project name and a version string.
+-    dirname = os.path.basename(root)
+-    if not dirname.startswith(parentdir_prefix):
+-        if verbose:
+-            print("guessing rootdir is '%%s', but '%%s' doesn't start with "
+-                  "prefix '%%s'" %% (root, dirname, parentdir_prefix))
+-        raise NotThisMethod("rootdir doesn't start with parentdir_prefix")
+-    return {"version": dirname[len(parentdir_prefix):],
+-            "full-revisionid": None,
+-            "dirty": False, "error": None}
++    if verbose:
++        print("Tried directories %%s but none started with prefix %%s" %%
++              (str(rootdirs), parentdir_prefix))
++    raise NotThisMethod("rootdir doesn't start with parentdir_prefix")
+ 
+ 
+ @register_vcs_handler("git", "get_keywords")
+-def git_get_keywords(versionfile_abs):
++def git_get_keywords(versionfile_abs: str) -> Dict[str, str]:
++    """Extract version information from the given file."""
+     # the code embedded in _version.py can just fetch the value of these
+     # keywords. When used from setup.py, we don't want to import _version.py,
+     # so we do it with a regexp instead. This function is not used from
+     # _version.py.
+-    keywords = {}
++    keywords: Dict[str, str] = {}
+     try:
+-        f = open(versionfile_abs, "r")
+-        for line in f.readlines():
+-            if line.strip().startswith("git_refnames ="):
+-                mo = re.search(r'=\s*"(.*)"', line)
+-                if mo:
+-                    keywords["refnames"] = mo.group(1)
+-            if line.strip().startswith("git_full ="):
+-                mo = re.search(r'=\s*"(.*)"', line)
+-                if mo:
+-                    keywords["full"] = mo.group(1)
+-        f.close()
+-    except EnvironmentError:
++        with open(versionfile_abs, "r") as fobj:
++            for line in fobj:
++                if line.strip().startswith("git_refnames ="):
++                    mo = re.search(r'=\s*"(.*)"', line)
++                    if mo:
++                        keywords["refnames"] = mo.group(1)
++                if line.strip().startswith("git_full ="):
++                    mo = re.search(r'=\s*"(.*)"', line)
++                    if mo:
++                        keywords["full"] = mo.group(1)
++                if line.strip().startswith("git_date ="):
++                    mo = re.search(r'=\s*"(.*)"', line)
++                    if mo:
++                        keywords["date"] = mo.group(1)
++    except OSError:
+         pass
+     return keywords
+ 
+ 
+ @register_vcs_handler("git", "keywords")
+-def git_versions_from_keywords(keywords, tag_prefix, verbose):
+-    if not keywords:
+-        raise NotThisMethod("no keywords at all, weird")
++def git_versions_from_keywords(
++    keywords: Dict[str, str],
++    tag_prefix: str,
++    verbose: bool,
++) -> Dict[str, Any]:
++    """Get version information from git keywords."""
++    if "refnames" not in keywords:
++        raise NotThisMethod("Short version file found")
++    date = keywords.get("date")
++    if date is not None:
++        # Use only the last line.  Previous lines may contain GPG signature
++        # information.
++        date = date.splitlines()[-1]
++
++        # git-2.2.0 added "%%cI", which expands to an ISO-8601 -compliant
++        # datestamp. However we prefer "%%ci" (which expands to an "ISO-8601
++        # -like" string, which we must then edit to make compliant), because
++        # it's been around since git-1.5.3, and it's too difficult to
++        # discover which version we're using, or to work around using an
++        # older one.
++        date = date.strip().replace(" ", "T", 1).replace(" ", "", 1)
+     refnames = keywords["refnames"].strip()
+     if refnames.startswith("$Format"):
+         if verbose:
+             print("keywords are unexpanded, not using")
+         raise NotThisMethod("unexpanded keywords, not a git-archive tarball")
+-    refs = set([r.strip() for r in refnames.strip("()").split(",")])
++    refs = {r.strip() for r in refnames.strip("()").split(",")}
+     # starting in git-1.8.3, tags are listed as "tag: foo-1.0" instead of
+     # just "foo-1.0". If we see a "tag: " prefix, prefer those.
+     TAG = "tag: "
+-    tags = set([r[len(TAG):] for r in refs if r.startswith(TAG)])
++    tags = {r[len(TAG):] for r in refs if r.startswith(TAG)}
+     if not tags:
+         # Either we're using git < 1.8.3, or there really are no tags. We use
+         # a heuristic: assume all version tags have a digit. The old git %%d
+@@ -619,63 +739,118 @@ def git_versions_from_keywords(keywords, tag_prefix, verbose):
+         # between branches and tags. By ignoring refnames without digits, we
+         # filter out many common branch names like "release" and
+         # "stabilization", as well as "HEAD" and "master".
+-        tags = set([r for r in refs if re.search(r'\d', r)])
++        tags = {r for r in refs if re.search(r'\d', r)}
+         if verbose:
+-            print("discarding '%%s', no digits" %% ",".join(refs-tags))
++            print("discarding '%%s', no digits" %% ",".join(refs - tags))
+     if verbose:
+         print("likely tags: %%s" %% ",".join(sorted(tags)))
+     for ref in sorted(tags):
+         # sorting will prefer e.g. "2.0" over "2.0rc1"
+         if ref.startswith(tag_prefix):
+             r = ref[len(tag_prefix):]
++            # Filter out refs that exactly match prefix or that don't start
++            # with a number once the prefix is stripped (mostly a concern
++            # when prefix is '')
++            if not re.match(r'\d', r):
++                continue
+             if verbose:
+                 print("picking %%s" %% r)
+             return {"version": r,
+                     "full-revisionid": keywords["full"].strip(),
+-                    "dirty": False, "error": None
+-                    }
++                    "dirty": False, "error": None,
++                    "date": date}
+     # no suitable tags, so version is "0+unknown", but full hex is still there
+     if verbose:
+         print("no suitable tags, using unknown + full revision id")
+     return {"version": "0+unknown",
+             "full-revisionid": keywords["full"].strip(),
+-            "dirty": False, "error": "no suitable tags"}
++            "dirty": False, "error": "no suitable tags", "date": None}
+ 
+ 
+ @register_vcs_handler("git", "pieces_from_vcs")
+-def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+-    # this runs 'git' from the root of the source tree. This only gets called
+-    # if the git-archive 'subst' keywords were *not* expanded, and
+-    # _version.py hasn't already been rewritten with a short version string,
+-    # meaning we're inside a checked out source tree.
+-
+-    if not os.path.exists(os.path.join(root, ".git")):
+-        if verbose:
+-            print("no .git in %%s" %% root)
+-        raise NotThisMethod("no .git directory")
+-
++def git_pieces_from_vcs(
++    tag_prefix: str,
++    root: str,
++    verbose: bool,
++    runner: Callable = run_command
++) -> Dict[str, Any]:
++    """Get version from 'git describe' in the root of the source tree.
++
++    This only gets called if the git-archive 'subst' keywords were *not*
++    expanded, and _version.py hasn't already been rewritten with a short
++    version string, meaning we're inside a checked out source tree.
++    """
+     GITS = ["git"]
+     if sys.platform == "win32":
+         GITS = ["git.cmd", "git.exe"]
+-    # if there is a tag, this yields TAG-NUM-gHEX[-dirty]
+-    # if there are no tags, this yields HEX[-dirty] (no NUM)
+-    describe_out = run_command(GITS, ["describe", "--tags", "--dirty",
+-                                      "--always", "--long"],
+-                               cwd=root)
++
++    # GIT_DIR can interfere with correct operation of Versioneer.
++    # It may be intended to be passed to the Versioneer-versioned project,
++    # but that should not change where we get our version from.
++    env = os.environ.copy()
++    env.pop("GIT_DIR", None)
++    runner = functools.partial(runner, env=env)
++
++    _, rc = runner(GITS, ["rev-parse", "--git-dir"], cwd=root,
++                   hide_stderr=not verbose)
++    if rc != 0:
++        if verbose:
++            print("Directory %%s not under git control" %% root)
++        raise NotThisMethod("'git rev-parse --git-dir' returned error")
++
++    # if there is a tag matching tag_prefix, this yields TAG-NUM-gHEX[-dirty]
++    # if there isn't one, this yields HEX[-dirty] (no NUM)
++    describe_out, rc = runner(GITS, [
++        "describe", "--tags", "--dirty", "--always", "--long",
++        "--match", f"{tag_prefix}[[:digit:]]*"
++    ], cwd=root)
+     # --long was added in git-1.5.5
+     if describe_out is None:
+         raise NotThisMethod("'git describe' failed")
+     describe_out = describe_out.strip()
+-    full_out = run_command(GITS, ["rev-parse", "HEAD"], cwd=root)
++    full_out, rc = runner(GITS, ["rev-parse", "HEAD"], cwd=root)
+     if full_out is None:
+         raise NotThisMethod("'git rev-parse' failed")
+     full_out = full_out.strip()
+ 
+-    pieces = {}
++    pieces: Dict[str, Any] = {}
+     pieces["long"] = full_out
+     pieces["short"] = full_out[:7]  # maybe improved later
+     pieces["error"] = None
+ 
++    branch_name, rc = runner(GITS, ["rev-parse", "--abbrev-ref", "HEAD"],
++                             cwd=root)
++    # --abbrev-ref was added in git-1.6.3
++    if rc != 0 or branch_name is None:
++        raise NotThisMethod("'git rev-parse --abbrev-ref' returned error")
++    branch_name = branch_name.strip()
++
++    if branch_name == "HEAD":
++        # If we aren't exactly on a branch, pick a branch which represents
++        # the current commit. If all else fails, we are on a branchless
++        # commit.
++        branches, rc = runner(GITS, ["branch", "--contains"], cwd=root)
++        # --contains was added in git-1.5.4
++        if rc != 0 or branches is None:
++            raise NotThisMethod("'git branch --contains' returned error")
++        branches = branches.split("\n")
++
++        # Remove the first line if we're running detached
++        if "(" in branches[0]:
++            branches.pop(0)
++
++        # Strip off the leading "* " from the list of branches.
++        branches = [branch[2:] for branch in branches]
++        if "master" in branches:
++            branch_name = "master"
++        elif not branches:
++            branch_name = None
++        else:
++            # Pick the first branch that is returned. Good or bad.
++            branch_name = branches[0]
++
++    pieces["branch"] = branch_name
++
+     # parse describe_out. It will be like TAG-NUM-gHEX[-dirty] or HEX[-dirty]
+     # TAG might have hyphens.
+     git_describe = describe_out
+@@ -692,7 +867,7 @@ def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+         # TAG-NUM-gHEX
+         mo = re.search(r'^(.+)-(\d+)-g([0-9a-f]+)$', git_describe)
+         if not mo:
+-            # unparseable. Maybe git-describe is misbehaving?
++            # unparsable. Maybe git-describe is misbehaving?
+             pieces["error"] = ("unable to parse git-describe output: '%%s'"
+                                %% describe_out)
+             return pieces
+@@ -717,27 +892,35 @@ def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+     else:
+         # HEX: no tags
+         pieces["closest-tag"] = None
+-        count_out = run_command(GITS, ["rev-list", "HEAD", "--count"],
+-                                cwd=root)
+-        pieces["distance"] = int(count_out)  # total number of commits
++        out, rc = runner(GITS, ["rev-list", "HEAD", "--left-right"], cwd=root)
++        pieces["distance"] = len(out.split())  # total number of commits
++
++    # commit date: see ISO-8601 comment in git_versions_from_keywords()
++    date = runner(GITS, ["show", "-s", "--format=%%ci", "HEAD"], cwd=root)[0].strip()
++    # Use only the last line.  Previous lines may contain GPG signature
++    # information.
++    date = date.splitlines()[-1]
++    pieces["date"] = date.strip().replace(" ", "T", 1).replace(" ", "", 1)
+ 
+     return pieces
+ 
+ 
+-def plus_or_dot(pieces):
++def plus_or_dot(pieces: Dict[str, Any]) -> str:
++    """Return a + if we don't already have one, else return a ."""
+     if "+" in pieces.get("closest-tag", ""):
+         return "."
+     return "+"
+ 
+ 
+-def render_pep440(pieces):
+-    # now build up version string, with post-release "local version
+-    # identifier". Our goal: TAG[+DISTANCE.gHEX[.dirty]] . Note that if you
+-    # get a tagged build and then dirty it, you'll get TAG+0.gHEX.dirty
++def render_pep440(pieces: Dict[str, Any]) -> str:
++    """Build up version string, with post-release "local version identifier".
+ 
+-    # exceptions:
+-    # 1: no tags. git_describe was just HEX. 0+untagged.DISTANCE.gHEX[.dirty]
++    Our goal: TAG[+DISTANCE.gHEX[.dirty]] . Note that if you
++    get a tagged build and then dirty it, you'll get TAG+0.gHEX.dirty
+ 
++    Exceptions:
++    1: no tags. git_describe was just HEX. 0+untagged.DISTANCE.gHEX[.dirty]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"] or pieces["dirty"]:
+@@ -754,31 +937,80 @@ def render_pep440(pieces):
+     return rendered
+ 
+ 
+-def render_pep440_pre(pieces):
+-    # TAG[.post.devDISTANCE] . No -dirty
++def render_pep440_branch(pieces: Dict[str, Any]) -> str:
++    """TAG[[.dev0]+DISTANCE.gHEX[.dirty]] .
+ 
+-    # exceptions:
+-    # 1: no tags. 0.post.devDISTANCE
++    The ".dev0" means not master branch. Note that .dev0 sorts backwards
++    (a feature branch will appear "older" than the master branch).
+ 
++    Exceptions:
++    1: no tags. 0[.dev0]+untagged.DISTANCE.gHEX[.dirty]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
++        if pieces["distance"] or pieces["dirty"]:
++            if pieces["branch"] != "master":
++                rendered += ".dev0"
++            rendered += plus_or_dot(pieces)
++            rendered += "%%d.g%%s" %% (pieces["distance"], pieces["short"])
++            if pieces["dirty"]:
++                rendered += ".dirty"
++    else:
++        # exception #1
++        rendered = "0"
++        if pieces["branch"] != "master":
++            rendered += ".dev0"
++        rendered += "+untagged.%%d.g%%s" %% (pieces["distance"],
++                                          pieces["short"])
++        if pieces["dirty"]:
++            rendered += ".dirty"
++    return rendered
++
++
++def pep440_split_post(ver: str) -> Tuple[str, Optional[int]]:
++    """Split pep440 version string at the post-release segment.
++
++    Returns the release segments before the post-release and the
++    post-release version number (or -1 if no post-release segment is present).
++    """
++    vc = str.split(ver, ".post")
++    return vc[0], int(vc[1] or 0) if len(vc) == 2 else None
++
++
++def render_pep440_pre(pieces: Dict[str, Any]) -> str:
++    """TAG[.postN.devDISTANCE] -- No -dirty.
++
++    Exceptions:
++    1: no tags. 0.post0.devDISTANCE
++    """
++    if pieces["closest-tag"]:
+         if pieces["distance"]:
+-            rendered += ".post.dev%%d" %% pieces["distance"]
++            # update the post release segment
++            tag_version, post_version = pep440_split_post(pieces["closest-tag"])
++            rendered = tag_version
++            if post_version is not None:
++                rendered += ".post%%d.dev%%d" %% (post_version + 1, pieces["distance"])
++            else:
++                rendered += ".post0.dev%%d" %% (pieces["distance"])
++        else:
++            # no commits, use the tag as the version
++            rendered = pieces["closest-tag"]
+     else:
+         # exception #1
+-        rendered = "0.post.dev%%d" %% pieces["distance"]
++        rendered = "0.post0.dev%%d" %% pieces["distance"]
+     return rendered
+ 
+ 
+-def render_pep440_post(pieces):
+-    # TAG[.postDISTANCE[.dev0]+gHEX] . The ".dev0" means dirty. Note that
+-    # .dev0 sorts backwards (a dirty tree will appear "older" than the
+-    # corresponding clean one), but you shouldn't be releasing software with
+-    # -dirty anyways.
++def render_pep440_post(pieces: Dict[str, Any]) -> str:
++    """TAG[.postDISTANCE[.dev0]+gHEX] .
+ 
+-    # exceptions:
+-    # 1: no tags. 0.postDISTANCE[.dev0]
++    The ".dev0" means dirty. Note that .dev0 sorts backwards
++    (a dirty tree will appear "older" than the corresponding clean one),
++    but you shouldn't be releasing software with -dirty anyways.
+ 
++    Exceptions:
++    1: no tags. 0.postDISTANCE[.dev0]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"] or pieces["dirty"]:
+@@ -796,12 +1028,43 @@ def render_pep440_post(pieces):
+     return rendered
+ 
+ 
+-def render_pep440_old(pieces):
+-    # TAG[.postDISTANCE[.dev0]] . The ".dev0" means dirty.
++def render_pep440_post_branch(pieces: Dict[str, Any]) -> str:
++    """TAG[.postDISTANCE[.dev0]+gHEX[.dirty]] .
++
++    The ".dev0" means not master branch.
++
++    Exceptions:
++    1: no tags. 0.postDISTANCE[.dev0]+gHEX[.dirty]
++    """
++    if pieces["closest-tag"]:
++        rendered = pieces["closest-tag"]
++        if pieces["distance"] or pieces["dirty"]:
++            rendered += ".post%%d" %% pieces["distance"]
++            if pieces["branch"] != "master":
++                rendered += ".dev0"
++            rendered += plus_or_dot(pieces)
++            rendered += "g%%s" %% pieces["short"]
++            if pieces["dirty"]:
++                rendered += ".dirty"
++    else:
++        # exception #1
++        rendered = "0.post%%d" %% pieces["distance"]
++        if pieces["branch"] != "master":
++            rendered += ".dev0"
++        rendered += "+g%%s" %% pieces["short"]
++        if pieces["dirty"]:
++            rendered += ".dirty"
++    return rendered
++
++
++def render_pep440_old(pieces: Dict[str, Any]) -> str:
++    """TAG[.postDISTANCE[.dev0]] .
+ 
+-    # exceptions:
+-    # 1: no tags. 0.postDISTANCE[.dev0]
++    The ".dev0" means dirty.
+ 
++    Exceptions:
++    1: no tags. 0.postDISTANCE[.dev0]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"] or pieces["dirty"]:
+@@ -816,13 +1079,14 @@ def render_pep440_old(pieces):
+     return rendered
+ 
+ 
+-def render_git_describe(pieces):
+-    # TAG[-DISTANCE-gHEX][-dirty], like 'git describe --tags --dirty
+-    # --always'
++def render_git_describe(pieces: Dict[str, Any]) -> str:
++    """TAG[-DISTANCE-gHEX][-dirty].
+ 
+-    # exceptions:
+-    # 1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    Like 'git describe --tags --dirty --always'.
+ 
++    Exceptions:
++    1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"]:
+@@ -835,13 +1099,15 @@ def render_git_describe(pieces):
+     return rendered
+ 
+ 
+-def render_git_describe_long(pieces):
+-    # TAG-DISTANCE-gHEX[-dirty], like 'git describe --tags --dirty
+-    # --always -long'. The distance/hash is unconditional.
++def render_git_describe_long(pieces: Dict[str, Any]) -> str:
++    """TAG-DISTANCE-gHEX[-dirty].
+ 
+-    # exceptions:
+-    # 1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    Like 'git describe --tags --dirty --always -long'.
++    The distance/hash is unconditional.
+ 
++    Exceptions:
++    1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         rendered += "-%%d-g%%s" %% (pieces["distance"], pieces["short"])
+@@ -853,22 +1119,28 @@ def render_git_describe_long(pieces):
+     return rendered
+ 
+ 
+-def render(pieces, style):
++def render(pieces: Dict[str, Any], style: str) -> Dict[str, Any]:
++    """Render the given version pieces into the requested style."""
+     if pieces["error"]:
+         return {"version": "unknown",
+                 "full-revisionid": pieces.get("long"),
+                 "dirty": None,
+-                "error": pieces["error"]}
++                "error": pieces["error"],
++                "date": None}
+ 
+     if not style or style == "default":
+         style = "pep440"  # the default
+ 
+     if style == "pep440":
+         rendered = render_pep440(pieces)
++    elif style == "pep440-branch":
++        rendered = render_pep440_branch(pieces)
+     elif style == "pep440-pre":
+         rendered = render_pep440_pre(pieces)
+     elif style == "pep440-post":
+         rendered = render_pep440_post(pieces)
++    elif style == "pep440-post-branch":
++        rendered = render_pep440_post_branch(pieces)
+     elif style == "pep440-old":
+         rendered = render_pep440_old(pieces)
+     elif style == "git-describe":
+@@ -879,10 +1151,12 @@ def render(pieces, style):
+         raise ValueError("unknown style '%%s'" %% style)
+ 
+     return {"version": rendered, "full-revisionid": pieces["long"],
+-            "dirty": pieces["dirty"], "error": None}
++            "dirty": pieces["dirty"], "error": None,
++            "date": pieces.get("date")}
+ 
+ 
+-def get_versions():
++def get_versions() -> Dict[str, Any]:
++    """Get version information or return default if unable to do so."""
+     # I am in _version.py, which lives at ROOT/VERSIONFILE_SOURCE. If we have
+     # __file__, we can work backwards from there to the root. Some
+     # py2exe/bbfreeze/non-CPython implementations don't do __file__, in which
+@@ -902,12 +1176,13 @@ def get_versions():
+         # versionfile_source is the relative path from the top of the source
+         # tree (where the .git directory might live) to this file. Invert
+         # this to find the root from __file__.
+-        for i in cfg.versionfile_source.split('/'):
++        for _ in cfg.versionfile_source.split('/'):
+             root = os.path.dirname(root)
+     except NameError:
+         return {"version": "0+unknown", "full-revisionid": None,
+                 "dirty": None,
+-                "error": "unable to find root of source tree"}
++                "error": "unable to find root of source tree",
++                "date": None}
+ 
+     try:
+         pieces = git_pieces_from_vcs(cfg.tag_prefix, root, verbose)
+@@ -923,48 +1198,70 @@ def get_versions():
+ 
+     return {"version": "0+unknown", "full-revisionid": None,
+             "dirty": None,
+-            "error": "unable to compute version"}
++            "error": "unable to compute version", "date": None}
+ '''
+ 
+ 
+ @register_vcs_handler("git", "get_keywords")
+-def git_get_keywords(versionfile_abs):
++def git_get_keywords(versionfile_abs: str) -> Dict[str, str]:
++    """Extract version information from the given file."""
+     # the code embedded in _version.py can just fetch the value of these
+     # keywords. When used from setup.py, we don't want to import _version.py,
+     # so we do it with a regexp instead. This function is not used from
+     # _version.py.
+-    keywords = {}
++    keywords: Dict[str, str] = {}
+     try:
+-        f = open(versionfile_abs, "r")
+-        for line in f.readlines():
+-            if line.strip().startswith("git_refnames ="):
+-                mo = re.search(r'=\s*"(.*)"', line)
+-                if mo:
+-                    keywords["refnames"] = mo.group(1)
+-            if line.strip().startswith("git_full ="):
+-                mo = re.search(r'=\s*"(.*)"', line)
+-                if mo:
+-                    keywords["full"] = mo.group(1)
+-        f.close()
+-    except EnvironmentError:
++        with open(versionfile_abs, "r") as fobj:
++            for line in fobj:
++                if line.strip().startswith("git_refnames ="):
++                    mo = re.search(r'=\s*"(.*)"', line)
++                    if mo:
++                        keywords["refnames"] = mo.group(1)
++                if line.strip().startswith("git_full ="):
++                    mo = re.search(r'=\s*"(.*)"', line)
++                    if mo:
++                        keywords["full"] = mo.group(1)
++                if line.strip().startswith("git_date ="):
++                    mo = re.search(r'=\s*"(.*)"', line)
++                    if mo:
++                        keywords["date"] = mo.group(1)
++    except OSError:
+         pass
+     return keywords
+ 
+ 
+ @register_vcs_handler("git", "keywords")
+-def git_versions_from_keywords(keywords, tag_prefix, verbose):
+-    if not keywords:
+-        raise NotThisMethod("no keywords at all, weird")
++def git_versions_from_keywords(
++    keywords: Dict[str, str],
++    tag_prefix: str,
++    verbose: bool,
++) -> Dict[str, Any]:
++    """Get version information from git keywords."""
++    if "refnames" not in keywords:
++        raise NotThisMethod("Short version file found")
++    date = keywords.get("date")
++    if date is not None:
++        # Use only the last line.  Previous lines may contain GPG signature
++        # information.
++        date = date.splitlines()[-1]
++
++        # git-2.2.0 added "%cI", which expands to an ISO-8601 -compliant
++        # datestamp. However we prefer "%ci" (which expands to an "ISO-8601
++        # -like" string, which we must then edit to make compliant), because
++        # it's been around since git-1.5.3, and it's too difficult to
++        # discover which version we're using, or to work around using an
++        # older one.
++        date = date.strip().replace(" ", "T", 1).replace(" ", "", 1)
+     refnames = keywords["refnames"].strip()
+     if refnames.startswith("$Format"):
+         if verbose:
+             print("keywords are unexpanded, not using")
+         raise NotThisMethod("unexpanded keywords, not a git-archive tarball")
+-    refs = set([r.strip() for r in refnames.strip("()").split(",")])
++    refs = {r.strip() for r in refnames.strip("()").split(",")}
+     # starting in git-1.8.3, tags are listed as "tag: foo-1.0" instead of
+     # just "foo-1.0". If we see a "tag: " prefix, prefer those.
+     TAG = "tag: "
+-    tags = set([r[len(TAG):] for r in refs if r.startswith(TAG)])
++    tags = {r[len(TAG) :] for r in refs if r.startswith(TAG)}
+     if not tags:
+         # Either we're using git < 1.8.3, or there really are no tags. We use
+         # a heuristic: assume all version tags have a digit. The old git %d
+@@ -973,63 +1270,129 @@ def git_versions_from_keywords(keywords, tag_prefix, verbose):
+         # between branches and tags. By ignoring refnames without digits, we
+         # filter out many common branch names like "release" and
+         # "stabilization", as well as "HEAD" and "master".
+-        tags = set([r for r in refs if re.search(r'\d', r)])
++        tags = {r for r in refs if re.search(r"\d", r)}
+         if verbose:
+-            print("discarding '%s', no digits" % ",".join(refs-tags))
++            print("discarding '%s', no digits" % ",".join(refs - tags))
+     if verbose:
+         print("likely tags: %s" % ",".join(sorted(tags)))
+     for ref in sorted(tags):
+         # sorting will prefer e.g. "2.0" over "2.0rc1"
+         if ref.startswith(tag_prefix):
+-            r = ref[len(tag_prefix):]
++            r = ref[len(tag_prefix) :]
++            # Filter out refs that exactly match prefix or that don't start
++            # with a number once the prefix is stripped (mostly a concern
++            # when prefix is '')
++            if not re.match(r"\d", r):
++                continue
+             if verbose:
+                 print("picking %s" % r)
+-            return {"version": r,
+-                    "full-revisionid": keywords["full"].strip(),
+-                    "dirty": False, "error": None
+-                    }
++            return {
++                "version": r,
++                "full-revisionid": keywords["full"].strip(),
++                "dirty": False,
++                "error": None,
++                "date": date,
++            }
+     # no suitable tags, so version is "0+unknown", but full hex is still there
+     if verbose:
+         print("no suitable tags, using unknown + full revision id")
+-    return {"version": "0+unknown",
+-            "full-revisionid": keywords["full"].strip(),
+-            "dirty": False, "error": "no suitable tags"}
++    return {
++        "version": "0+unknown",
++        "full-revisionid": keywords["full"].strip(),
++        "dirty": False,
++        "error": "no suitable tags",
++        "date": None,
++    }
+ 
+ 
+ @register_vcs_handler("git", "pieces_from_vcs")
+-def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+-    # this runs 'git' from the root of the source tree. This only gets called
+-    # if the git-archive 'subst' keywords were *not* expanded, and
+-    # _version.py hasn't already been rewritten with a short version string,
+-    # meaning we're inside a checked out source tree.
+-
+-    if not os.path.exists(os.path.join(root, ".git")):
+-        if verbose:
+-            print("no .git in %s" % root)
+-        raise NotThisMethod("no .git directory")
+-
++def git_pieces_from_vcs(
++    tag_prefix: str, root: str, verbose: bool, runner: Callable = run_command
++) -> Dict[str, Any]:
++    """Get version from 'git describe' in the root of the source tree.
++
++    This only gets called if the git-archive 'subst' keywords were *not*
++    expanded, and _version.py hasn't already been rewritten with a short
++    version string, meaning we're inside a checked out source tree.
++    """
+     GITS = ["git"]
+     if sys.platform == "win32":
+         GITS = ["git.cmd", "git.exe"]
+-    # if there is a tag, this yields TAG-NUM-gHEX[-dirty]
+-    # if there are no tags, this yields HEX[-dirty] (no NUM)
+-    describe_out = run_command(GITS, ["describe", "--tags", "--dirty",
+-                                      "--always", "--long"],
+-                               cwd=root)
++
++    # GIT_DIR can interfere with correct operation of Versioneer.
++    # It may be intended to be passed to the Versioneer-versioned project,
++    # but that should not change where we get our version from.
++    env = os.environ.copy()
++    env.pop("GIT_DIR", None)
++    runner = functools.partial(runner, env=env)
++
++    _, rc = runner(GITS, ["rev-parse", "--git-dir"], cwd=root, hide_stderr=not verbose)
++    if rc != 0:
++        if verbose:
++            print("Directory %s not under git control" % root)
++        raise NotThisMethod("'git rev-parse --git-dir' returned error")
++
++    # if there is a tag matching tag_prefix, this yields TAG-NUM-gHEX[-dirty]
++    # if there isn't one, this yields HEX[-dirty] (no NUM)
++    describe_out, rc = runner(
++        GITS,
++        [
++            "describe",
++            "--tags",
++            "--dirty",
++            "--always",
++            "--long",
++            "--match",
++            f"{tag_prefix}[[:digit:]]*",
++        ],
++        cwd=root,
++    )
+     # --long was added in git-1.5.5
+     if describe_out is None:
+         raise NotThisMethod("'git describe' failed")
+     describe_out = describe_out.strip()
+-    full_out = run_command(GITS, ["rev-parse", "HEAD"], cwd=root)
++    full_out, rc = runner(GITS, ["rev-parse", "HEAD"], cwd=root)
+     if full_out is None:
+         raise NotThisMethod("'git rev-parse' failed")
+     full_out = full_out.strip()
+ 
+-    pieces = {}
++    pieces: Dict[str, Any] = {}
+     pieces["long"] = full_out
+     pieces["short"] = full_out[:7]  # maybe improved later
+     pieces["error"] = None
+ 
++    branch_name, rc = runner(GITS, ["rev-parse", "--abbrev-ref", "HEAD"], cwd=root)
++    # --abbrev-ref was added in git-1.6.3
++    if rc != 0 or branch_name is None:
++        raise NotThisMethod("'git rev-parse --abbrev-ref' returned error")
++    branch_name = branch_name.strip()
++
++    if branch_name == "HEAD":
++        # If we aren't exactly on a branch, pick a branch which represents
++        # the current commit. If all else fails, we are on a branchless
++        # commit.
++        branches, rc = runner(GITS, ["branch", "--contains"], cwd=root)
++        # --contains was added in git-1.5.4
++        if rc != 0 or branches is None:
++            raise NotThisMethod("'git branch --contains' returned error")
++        branches = branches.split("\n")
++
++        # Remove the first line if we're running detached
++        if "(" in branches[0]:
++            branches.pop(0)
++
++        # Strip off the leading "* " from the list of branches.
++        branches = [branch[2:] for branch in branches]
++        if "master" in branches:
++            branch_name = "master"
++        elif not branches:
++            branch_name = None
++        else:
++            # Pick the first branch that is returned. Good or bad.
++            branch_name = branches[0]
++
++    pieces["branch"] = branch_name
++
+     # parse describe_out. It will be like TAG-NUM-gHEX[-dirty] or HEX[-dirty]
+     # TAG might have hyphens.
+     git_describe = describe_out
+@@ -1038,17 +1401,16 @@ def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+     dirty = git_describe.endswith("-dirty")
+     pieces["dirty"] = dirty
+     if dirty:
+-        git_describe = git_describe[:git_describe.rindex("-dirty")]
++        git_describe = git_describe[: git_describe.rindex("-dirty")]
+ 
+     # now we have TAG-NUM-gHEX or HEX
+ 
+     if "-" in git_describe:
+         # TAG-NUM-gHEX
+-        mo = re.search(r'^(.+)-(\d+)-g([0-9a-f]+)$', git_describe)
++        mo = re.search(r"^(.+)-(\d+)-g([0-9a-f]+)$", git_describe)
+         if not mo:
+-            # unparseable. Maybe git-describe is misbehaving?
+-            pieces["error"] = ("unable to parse git-describe output: '%s'"
+-                               % describe_out)
++            # unparsable. Maybe git-describe is misbehaving?
++            pieces["error"] = "unable to parse git-describe output: '%s'" % describe_out
+             return pieces
+ 
+         # tag
+@@ -1057,10 +1419,12 @@ def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+             if verbose:
+                 fmt = "tag '%s' doesn't start with prefix '%s'"
+                 print(fmt % (full_tag, tag_prefix))
+-            pieces["error"] = ("tag '%s' doesn't start with prefix '%s'"
+-                               % (full_tag, tag_prefix))
++            pieces["error"] = "tag '%s' doesn't start with prefix '%s'" % (
++                full_tag,
++                tag_prefix,
++            )
+             return pieces
+-        pieces["closest-tag"] = full_tag[len(tag_prefix):]
++        pieces["closest-tag"] = full_tag[len(tag_prefix) :]
+ 
+         # distance: number of commits since tag
+         pieces["distance"] = int(mo.group(2))
+@@ -1071,67 +1435,98 @@ def git_pieces_from_vcs(tag_prefix, root, verbose, run_command=run_command):
+     else:
+         # HEX: no tags
+         pieces["closest-tag"] = None
+-        count_out = run_command(GITS, ["rev-list", "HEAD", "--count"],
+-                                cwd=root)
+-        pieces["distance"] = int(count_out)  # total number of commits
++        out, rc = runner(GITS, ["rev-list", "HEAD", "--left-right"], cwd=root)
++        pieces["distance"] = len(out.split())  # total number of commits
++
++    # commit date: see ISO-8601 comment in git_versions_from_keywords()
++    date = runner(GITS, ["show", "-s", "--format=%ci", "HEAD"], cwd=root)[0].strip()
++    # Use only the last line.  Previous lines may contain GPG signature
++    # information.
++    date = date.splitlines()[-1]
++    pieces["date"] = date.strip().replace(" ", "T", 1).replace(" ", "", 1)
+ 
+     return pieces
+ 
+ 
+-def do_vcs_install(manifest_in, versionfile_source, ipy):
++def do_vcs_install(versionfile_source: str, ipy: Optional[str]) -> None:
++    """Git-specific installation logic for Versioneer.
++
++    For Git, this means creating/changing .gitattributes to mark _version.py
++    for export-subst keyword substitution.
++    """
+     GITS = ["git"]
+     if sys.platform == "win32":
+         GITS = ["git.cmd", "git.exe"]
+-    files = [manifest_in, versionfile_source]
++    files = [versionfile_source]
+     if ipy:
+         files.append(ipy)
+-    try:
+-        me = __file__
+-        if me.endswith(".pyc") or me.endswith(".pyo"):
+-            me = os.path.splitext(me)[0] + ".py"
+-        versioneer_file = os.path.relpath(me)
+-    except NameError:
+-        versioneer_file = "versioneer.py"
+-    files.append(versioneer_file)
++    if "VERSIONEER_PEP518" not in globals():
++        try:
++            my_path = __file__
++            if my_path.endswith((".pyc", ".pyo")):
++                my_path = os.path.splitext(my_path)[0] + ".py"
++            versioneer_file = os.path.relpath(my_path)
++        except NameError:
++            versioneer_file = "versioneer.py"
++        files.append(versioneer_file)
+     present = False
+     try:
+-        f = open(".gitattributes", "r")
+-        for line in f.readlines():
+-            if line.strip().startswith(versionfile_source):
+-                if "export-subst" in line.strip().split()[1:]:
+-                    present = True
+-        f.close()
+-    except EnvironmentError:
++        with open(".gitattributes", "r") as fobj:
++            for line in fobj:
++                if line.strip().startswith(versionfile_source):
++                    if "export-subst" in line.strip().split()[1:]:
++                        present = True
++                        break
++    except OSError:
+         pass
+     if not present:
+-        f = open(".gitattributes", "a+")
+-        f.write("%s export-subst\n" % versionfile_source)
+-        f.close()
++        with open(".gitattributes", "a+") as fobj:
++            fobj.write(f"{versionfile_source} export-subst\n")
+         files.append(".gitattributes")
+     run_command(GITS, ["add", "--"] + files)
+ 
+ 
+-def versions_from_parentdir(parentdir_prefix, root, verbose):
+-    # Source tarballs conventionally unpack into a directory that includes
+-    # both the project name and a version string.
+-    dirname = os.path.basename(root)
+-    if not dirname.startswith(parentdir_prefix):
+-        if verbose:
+-            print("guessing rootdir is '%s', but '%s' doesn't start with "
+-                  "prefix '%s'" % (root, dirname, parentdir_prefix))
+-        raise NotThisMethod("rootdir doesn't start with parentdir_prefix")
+-    return {"version": dirname[len(parentdir_prefix):],
+-            "full-revisionid": None,
+-            "dirty": False, "error": None}
++def versions_from_parentdir(
++    parentdir_prefix: str,
++    root: str,
++    verbose: bool,
++) -> Dict[str, Any]:
++    """Try to determine the version from the parent directory name.
++
++    Source tarballs conventionally unpack into a directory that includes both
++    the project name and a version string. We will also support searching up
++    two directory levels for an appropriately named parent directory
++    """
++    rootdirs = []
++
++    for _ in range(3):
++        dirname = os.path.basename(root)
++        if dirname.startswith(parentdir_prefix):
++            return {
++                "version": dirname[len(parentdir_prefix) :],
++                "full-revisionid": None,
++                "dirty": False,
++                "error": None,
++                "date": None,
++            }
++        rootdirs.append(root)
++        root = os.path.dirname(root)  # up a level
++
++    if verbose:
++        print(
++            "Tried directories %s but none started with prefix %s"
++            % (str(rootdirs), parentdir_prefix)
++        )
++    raise NotThisMethod("rootdir doesn't start with parentdir_prefix")
++
+ 
+ SHORT_VERSION_PY = """
+-# This file was generated by 'versioneer.py' (0.15) from
++# This file was generated by 'versioneer.py' (0.29) from
+ # revision-control system data, or from the parent directory name of an
+ # unpacked source archive. Distribution tarballs contain a pre-generated copy
+ # of this file.
+ 
+ import json
+-import sys
+ 
+ version_json = '''
+ %s
+@@ -1143,43 +1538,50 @@ def get_versions():
+ """
+ 
+ 
+-def versions_from_file(filename):
++def versions_from_file(filename: str) -> Dict[str, Any]:
++    """Try to determine the version from _version.py if present."""
+     try:
+         with open(filename) as f:
+             contents = f.read()
+-    except EnvironmentError:
++    except OSError:
+         raise NotThisMethod("unable to read _version.py")
+-    mo = re.search(r"version_json = '''\n(.*)'''  # END VERSION_JSON",
+-                   contents, re.M | re.S)
++    mo = re.search(
++        r"version_json = '''\n(.*)'''  # END VERSION_JSON", contents, re.M | re.S
++    )
++    if not mo:
++        mo = re.search(
++            r"version_json = '''\r\n(.*)'''  # END VERSION_JSON", contents, re.M | re.S
++        )
+     if not mo:
+         raise NotThisMethod("no version_json in _version.py")
+     return json.loads(mo.group(1))
+ 
+ 
+-def write_to_version_file(filename, versions):
+-    os.unlink(filename)
+-    contents = json.dumps(versions, sort_keys=True,
+-                          indent=1, separators=(",", ": "))
++def write_to_version_file(filename: str, versions: Dict[str, Any]) -> None:
++    """Write the given version number to the given _version.py file."""
++    contents = json.dumps(versions, sort_keys=True, indent=1, separators=(",", ": "))
+     with open(filename, "w") as f:
+         f.write(SHORT_VERSION_PY % contents)
+ 
+     print("set %s to '%s'" % (filename, versions["version"]))
+ 
+ 
+-def plus_or_dot(pieces):
++def plus_or_dot(pieces: Dict[str, Any]) -> str:
++    """Return a + if we don't already have one, else return a ."""
+     if "+" in pieces.get("closest-tag", ""):
+         return "."
+     return "+"
+ 
+ 
+-def render_pep440(pieces):
+-    # now build up version string, with post-release "local version
+-    # identifier". Our goal: TAG[+DISTANCE.gHEX[.dirty]] . Note that if you
+-    # get a tagged build and then dirty it, you'll get TAG+0.gHEX.dirty
++def render_pep440(pieces: Dict[str, Any]) -> str:
++    """Build up version string, with post-release "local version identifier".
+ 
+-    # exceptions:
+-    # 1: no tags. git_describe was just HEX. 0+untagged.DISTANCE.gHEX[.dirty]
++    Our goal: TAG[+DISTANCE.gHEX[.dirty]] . Note that if you
++    get a tagged build and then dirty it, you'll get TAG+0.gHEX.dirty
+ 
++    Exceptions:
++    1: no tags. git_describe was just HEX. 0+untagged.DISTANCE.gHEX[.dirty]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"] or pieces["dirty"]:
+@@ -1189,38 +1591,85 @@ def render_pep440(pieces):
+                 rendered += ".dirty"
+     else:
+         # exception #1
+-        rendered = "0+untagged.%d.g%s" % (pieces["distance"],
+-                                          pieces["short"])
++        rendered = "0+untagged.%d.g%s" % (pieces["distance"], pieces["short"])
+         if pieces["dirty"]:
+             rendered += ".dirty"
+     return rendered
+ 
+ 
+-def render_pep440_pre(pieces):
+-    # TAG[.post.devDISTANCE] . No -dirty
++def render_pep440_branch(pieces: Dict[str, Any]) -> str:
++    """TAG[[.dev0]+DISTANCE.gHEX[.dirty]] .
+ 
+-    # exceptions:
+-    # 1: no tags. 0.post.devDISTANCE
++    The ".dev0" means not master branch. Note that .dev0 sorts backwards
++    (a feature branch will appear "older" than the master branch).
+ 
++    Exceptions:
++    1: no tags. 0[.dev0]+untagged.DISTANCE.gHEX[.dirty]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
++        if pieces["distance"] or pieces["dirty"]:
++            if pieces["branch"] != "master":
++                rendered += ".dev0"
++            rendered += plus_or_dot(pieces)
++            rendered += "%d.g%s" % (pieces["distance"], pieces["short"])
++            if pieces["dirty"]:
++                rendered += ".dirty"
++    else:
++        # exception #1
++        rendered = "0"
++        if pieces["branch"] != "master":
++            rendered += ".dev0"
++        rendered += "+untagged.%d.g%s" % (pieces["distance"], pieces["short"])
++        if pieces["dirty"]:
++            rendered += ".dirty"
++    return rendered
++
++
++def pep440_split_post(ver: str) -> Tuple[str, Optional[int]]:
++    """Split pep440 version string at the post-release segment.
++
++    Returns the release segments before the post-release and the
++    post-release version number (or -1 if no post-release segment is present).
++    """
++    vc = str.split(ver, ".post")
++    return vc[0], int(vc[1] or 0) if len(vc) == 2 else None
++
++
++def render_pep440_pre(pieces: Dict[str, Any]) -> str:
++    """TAG[.postN.devDISTANCE] -- No -dirty.
++
++    Exceptions:
++    1: no tags. 0.post0.devDISTANCE
++    """
++    if pieces["closest-tag"]:
+         if pieces["distance"]:
+-            rendered += ".post.dev%d" % pieces["distance"]
++            # update the post release segment
++            tag_version, post_version = pep440_split_post(pieces["closest-tag"])
++            rendered = tag_version
++            if post_version is not None:
++                rendered += ".post%d.dev%d" % (post_version + 1, pieces["distance"])
++            else:
++                rendered += ".post0.dev%d" % (pieces["distance"])
++        else:
++            # no commits, use the tag as the version
++            rendered = pieces["closest-tag"]
+     else:
+         # exception #1
+-        rendered = "0.post.dev%d" % pieces["distance"]
++        rendered = "0.post0.dev%d" % pieces["distance"]
+     return rendered
+ 
+ 
+-def render_pep440_post(pieces):
+-    # TAG[.postDISTANCE[.dev0]+gHEX] . The ".dev0" means dirty. Note that
+-    # .dev0 sorts backwards (a dirty tree will appear "older" than the
+-    # corresponding clean one), but you shouldn't be releasing software with
+-    # -dirty anyways.
++def render_pep440_post(pieces: Dict[str, Any]) -> str:
++    """TAG[.postDISTANCE[.dev0]+gHEX] .
+ 
+-    # exceptions:
+-    # 1: no tags. 0.postDISTANCE[.dev0]
++    The ".dev0" means dirty. Note that .dev0 sorts backwards
++    (a dirty tree will appear "older" than the corresponding clean one),
++    but you shouldn't be releasing software with -dirty anyways.
+ 
++    Exceptions:
++    1: no tags. 0.postDISTANCE[.dev0]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"] or pieces["dirty"]:
+@@ -1238,12 +1687,43 @@ def render_pep440_post(pieces):
+     return rendered
+ 
+ 
+-def render_pep440_old(pieces):
+-    # TAG[.postDISTANCE[.dev0]] . The ".dev0" means dirty.
++def render_pep440_post_branch(pieces: Dict[str, Any]) -> str:
++    """TAG[.postDISTANCE[.dev0]+gHEX[.dirty]] .
++
++    The ".dev0" means not master branch.
++
++    Exceptions:
++    1: no tags. 0.postDISTANCE[.dev0]+gHEX[.dirty]
++    """
++    if pieces["closest-tag"]:
++        rendered = pieces["closest-tag"]
++        if pieces["distance"] or pieces["dirty"]:
++            rendered += ".post%d" % pieces["distance"]
++            if pieces["branch"] != "master":
++                rendered += ".dev0"
++            rendered += plus_or_dot(pieces)
++            rendered += "g%s" % pieces["short"]
++            if pieces["dirty"]:
++                rendered += ".dirty"
++    else:
++        # exception #1
++        rendered = "0.post%d" % pieces["distance"]
++        if pieces["branch"] != "master":
++            rendered += ".dev0"
++        rendered += "+g%s" % pieces["short"]
++        if pieces["dirty"]:
++            rendered += ".dirty"
++    return rendered
++
++
++def render_pep440_old(pieces: Dict[str, Any]) -> str:
++    """TAG[.postDISTANCE[.dev0]] .
+ 
+-    # exceptions:
+-    # 1: no tags. 0.postDISTANCE[.dev0]
++    The ".dev0" means dirty.
+ 
++    Exceptions:
++    1: no tags. 0.postDISTANCE[.dev0]
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"] or pieces["dirty"]:
+@@ -1258,13 +1738,14 @@ def render_pep440_old(pieces):
+     return rendered
+ 
+ 
+-def render_git_describe(pieces):
+-    # TAG[-DISTANCE-gHEX][-dirty], like 'git describe --tags --dirty
+-    # --always'
++def render_git_describe(pieces: Dict[str, Any]) -> str:
++    """TAG[-DISTANCE-gHEX][-dirty].
+ 
+-    # exceptions:
+-    # 1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    Like 'git describe --tags --dirty --always'.
+ 
++    Exceptions:
++    1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         if pieces["distance"]:
+@@ -1277,13 +1758,15 @@ def render_git_describe(pieces):
+     return rendered
+ 
+ 
+-def render_git_describe_long(pieces):
+-    # TAG-DISTANCE-gHEX[-dirty], like 'git describe --tags --dirty
+-    # --always -long'. The distance/hash is unconditional.
++def render_git_describe_long(pieces: Dict[str, Any]) -> str:
++    """TAG-DISTANCE-gHEX[-dirty].
+ 
+-    # exceptions:
+-    # 1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    Like 'git describe --tags --dirty --always -long'.
++    The distance/hash is unconditional.
+ 
++    Exceptions:
++    1: no tags. HEX[-dirty]  (note: no 'g' prefix)
++    """
+     if pieces["closest-tag"]:
+         rendered = pieces["closest-tag"]
+         rendered += "-%d-g%s" % (pieces["distance"], pieces["short"])
+@@ -1295,22 +1778,30 @@ def render_git_describe_long(pieces):
+     return rendered
+ 
+ 
+-def render(pieces, style):
++def render(pieces: Dict[str, Any], style: str) -> Dict[str, Any]:
++    """Render the given version pieces into the requested style."""
+     if pieces["error"]:
+-        return {"version": "unknown",
+-                "full-revisionid": pieces.get("long"),
+-                "dirty": None,
+-                "error": pieces["error"]}
++        return {
++            "version": "unknown",
++            "full-revisionid": pieces.get("long"),
++            "dirty": None,
++            "error": pieces["error"],
++            "date": None,
++        }
+ 
+     if not style or style == "default":
+         style = "pep440"  # the default
+ 
+     if style == "pep440":
+         rendered = render_pep440(pieces)
++    elif style == "pep440-branch":
++        rendered = render_pep440_branch(pieces)
+     elif style == "pep440-pre":
+         rendered = render_pep440_pre(pieces)
+     elif style == "pep440-post":
+         rendered = render_pep440_post(pieces)
++    elif style == "pep440-post-branch":
++        rendered = render_pep440_post_branch(pieces)
+     elif style == "pep440-old":
+         rendered = render_pep440_old(pieces)
+     elif style == "git-describe":
+@@ -1320,17 +1811,24 @@ def render(pieces, style):
+     else:
+         raise ValueError("unknown style '%s'" % style)
+ 
+-    return {"version": rendered, "full-revisionid": pieces["long"],
+-            "dirty": pieces["dirty"], "error": None}
++    return {
++        "version": rendered,
++        "full-revisionid": pieces["long"],
++        "dirty": pieces["dirty"],
++        "error": None,
++        "date": pieces.get("date"),
++    }
+ 
+ 
+ class VersioneerBadRootError(Exception):
+-    pass
++    """The project root directory is unknown or missing key files."""
+ 
+ 
+-def get_versions(verbose=False):
+-    # returns dict with two keys: 'version' and 'full'
++def get_versions(verbose: bool = False) -> Dict[str, Any]:
++    """Get the project version from whatever source is available.
+ 
++    Returns dict with two keys: 'version' and 'full'.
++    """
+     if "versioneer" in sys.modules:
+         # see the discussion in cmdclass.py:get_cmdclass()
+         del sys.modules["versioneer"]
+@@ -1341,9 +1839,10 @@ def get_versions(verbose=False):
+     assert cfg.VCS is not None, "please set [versioneer]VCS= in setup.cfg"
+     handlers = HANDLERS.get(cfg.VCS)
+     assert handlers, "unrecognized VCS '%s'" % cfg.VCS
+-    verbose = verbose or cfg.verbose
+-    assert cfg.versionfile_source is not None, \
+-        "please set versioneer.versionfile_source"
++    verbose = verbose or bool(cfg.verbose)  # `bool()` used to avoid `None`
++    assert (
++        cfg.versionfile_source is not None
++    ), "please set versioneer.versionfile_source"
+     assert cfg.tag_prefix is not None, "please set versioneer.tag_prefix"
+ 
+     versionfile_abs = os.path.join(root, cfg.versionfile_source)
+@@ -1397,15 +1896,26 @@ def get_versions(verbose=False):
+     if verbose:
+         print("unable to compute version")
+ 
+-    return {"version": "0+unknown", "full-revisionid": None,
+-            "dirty": None, "error": "unable to compute version"}
++    return {
++        "version": "0+unknown",
++        "full-revisionid": None,
++        "dirty": None,
++        "error": "unable to compute version",
++        "date": None,
++    }
+ 
+ 
+-def get_version():
++def get_version() -> str:
++    """Get the short version string for this project."""
+     return get_versions()["version"]
+ 
+ 
+-def get_cmdclass():
++def get_cmdclass(cmdclass: Optional[Dict[str, Any]] = None):
++    """Get the custom setuptools subclasses used by Versioneer.
++
++    If the package uses a different cmdclass (e.g. one from numpy), it
++    should be provide as an argument.
++    """
+     if "versioneer" in sys.modules:
+         del sys.modules["versioneer"]
+         # this fixes the "python setup.py develop" case (also 'install' and
+@@ -1419,34 +1929,36 @@ def get_cmdclass():
+         # parent is protected against the child's "import versioneer". By
+         # removing ourselves from sys.modules here, before the child build
+         # happens, we protect the child from the parent's versioneer too.
+-        # Also see https://github.com/warner/python-versioneer/issues/52
++        # Also see https://github.com/python-versioneer/python-versioneer/issues/52
+ 
+-    cmds = {}
++    cmds = {} if cmdclass is None else cmdclass.copy()
+ 
+-    # we add "version" to both distutils and setuptools
+-    from distutils.core import Command
++    # we add "version" to setuptools
++    from setuptools import Command
+ 
+     class cmd_version(Command):
+         description = "report generated version string"
+-        user_options = []
+-        boolean_options = []
++        user_options: List[Tuple[str, str, str]] = []
++        boolean_options: List[str] = []
+ 
+-        def initialize_options(self):
++        def initialize_options(self) -> None:
+             pass
+ 
+-        def finalize_options(self):
++        def finalize_options(self) -> None:
+             pass
+ 
+-        def run(self):
++        def run(self) -> None:
+             vers = get_versions(verbose=True)
+             print("Version: %s" % vers["version"])
+             print(" full-revisionid: %s" % vers.get("full-revisionid"))
+             print(" dirty: %s" % vers.get("dirty"))
++            print(" date: %s" % vers.get("date"))
+             if vers["error"]:
+                 print(" error: %s" % vers["error"])
++
+     cmds["version"] = cmd_version
+ 
+-    # we override "build_py" in both distutils and setuptools
++    # we override "build_py" in setuptools
+     #
+     # most invocation pathways end up running build_py:
+     #  distutils/build -> build_py
+@@ -1455,29 +1967,86 @@ def get_cmdclass():
+     #  setuptools/bdist_egg -> distutils/install_lib -> build_py
+     #  setuptools/install -> bdist_egg ->..
+     #  setuptools/develop -> ?
+-
+-    from distutils.command.build_py import build_py as _build_py
++    #  pip install:
++    #   copies source tree to a tempdir before running egg_info/etc
++    #   if .git isn't copied too, 'git describe' will fail
++    #   then does setup.py bdist_wheel, or sometimes setup.py install
++    #  setup.py egg_info -> ?
++
++    # pip install -e . and setuptool/editable_wheel will invoke build_py
++    # but the build_py command is not expected to copy any files.
++
++    # we override different "build_py" commands for both environments
++    if "build_py" in cmds:
++        _build_py: Any = cmds["build_py"]
++    else:
++        from setuptools.command.build_py import build_py as _build_py
+ 
+     class cmd_build_py(_build_py):
+-        def run(self):
++        def run(self) -> None:
+             root = get_root()
+             cfg = get_config_from_root(root)
+             versions = get_versions()
+             _build_py.run(self)
++            if getattr(self, "editable_mode", False):
++                # During editable installs `.py` and data files are
++                # not copied to build_lib
++                return
+             # now locate _version.py in the new build/ directory and replace
+             # it with an updated value
+             if cfg.versionfile_build:
+-                target_versionfile = os.path.join(self.build_lib,
+-                                                  cfg.versionfile_build)
++                target_versionfile = os.path.join(self.build_lib, cfg.versionfile_build)
+                 print("UPDATING %s" % target_versionfile)
+                 write_to_version_file(target_versionfile, versions)
++
+     cmds["build_py"] = cmd_build_py
+ 
++    if "build_ext" in cmds:
++        _build_ext: Any = cmds["build_ext"]
++    else:
++        from setuptools.command.build_ext import build_ext as _build_ext
++
++    class cmd_build_ext(_build_ext):
++        def run(self) -> None:
++            root = get_root()
++            cfg = get_config_from_root(root)
++            versions = get_versions()
++            _build_ext.run(self)
++            if self.inplace:
++                # build_ext --inplace will only build extensions in
++                # build/lib<..> dir with no _version.py to write to.
++                # As in place builds will already have a _version.py
++                # in the module dir, we do not need to write one.
++                return
++            # now locate _version.py in the new build/ directory and replace
++            # it with an updated value
++            if not cfg.versionfile_build:
++                return
++            target_versionfile = os.path.join(self.build_lib, cfg.versionfile_build)
++            if not os.path.exists(target_versionfile):
++                print(
++                    f"Warning: {target_versionfile} does not exist, skipping "
++                    "version update. This can happen if you are running build_ext "
++                    "without first running build_py."
++                )
++                return
++            print("UPDATING %s" % target_versionfile)
++            write_to_version_file(target_versionfile, versions)
++
++    cmds["build_ext"] = cmd_build_ext
++
+     if "cx_Freeze" in sys.modules:  # cx_freeze enabled?
+-        from cx_Freeze.dist import build_exe as _build_exe
++        from cx_Freeze.dist import build_exe as _build_exe  # type: ignore
++
++        # nczeczulin reports that py2exe won't like the pep440-style string
++        # as FILEVERSION, but it can be used for PRODUCTVERSION, e.g.
++        # setup(console=[{
++        #   "version": versioneer.get_version().split("+", 1)[0], # FILEVERSION
++        #   "product_version": versioneer.get_version(),
++        #   ...
+ 
+         class cmd_build_exe(_build_exe):
+-            def run(self):
++            def run(self) -> None:
+                 root = get_root()
+                 cfg = get_config_from_root(root)
+                 versions = get_versions()
+@@ -1489,24 +2058,100 @@ def get_cmdclass():
+                 os.unlink(target_versionfile)
+                 with open(cfg.versionfile_source, "w") as f:
+                     LONG = LONG_VERSION_PY[cfg.VCS]
+-                    f.write(LONG %
+-                            {"DOLLAR": "$",
+-                             "STYLE": cfg.style,
+-                             "TAG_PREFIX": cfg.tag_prefix,
+-                             "PARENTDIR_PREFIX": cfg.parentdir_prefix,
+-                             "VERSIONFILE_SOURCE": cfg.versionfile_source,
+-                             })
++                    f.write(
++                        LONG
++                        % {
++                            "DOLLAR": "$",
++                            "STYLE": cfg.style,
++                            "TAG_PREFIX": cfg.tag_prefix,
++                            "PARENTDIR_PREFIX": cfg.parentdir_prefix,
++                            "VERSIONFILE_SOURCE": cfg.versionfile_source,
++                        }
++                    )
++
+         cmds["build_exe"] = cmd_build_exe
+         del cmds["build_py"]
+ 
++    if "py2exe" in sys.modules:  # py2exe enabled?
++        try:
++            from py2exe.setuptools_buildexe import py2exe as _py2exe  # type: ignore
++        except ImportError:
++            from py2exe.distutils_buildexe import py2exe as _py2exe  # type: ignore
++
++        class cmd_py2exe(_py2exe):
++            def run(self) -> None:
++                root = get_root()
++                cfg = get_config_from_root(root)
++                versions = get_versions()
++                target_versionfile = cfg.versionfile_source
++                print("UPDATING %s" % target_versionfile)
++                write_to_version_file(target_versionfile, versions)
++
++                _py2exe.run(self)
++                os.unlink(target_versionfile)
++                with open(cfg.versionfile_source, "w") as f:
++                    LONG = LONG_VERSION_PY[cfg.VCS]
++                    f.write(
++                        LONG
++                        % {
++                            "DOLLAR": "$",
++                            "STYLE": cfg.style,
++                            "TAG_PREFIX": cfg.tag_prefix,
++                            "PARENTDIR_PREFIX": cfg.parentdir_prefix,
++                            "VERSIONFILE_SOURCE": cfg.versionfile_source,
++                        }
++                    )
++
++        cmds["py2exe"] = cmd_py2exe
++
++    # sdist farms its file list building out to egg_info
++    if "egg_info" in cmds:
++        _egg_info: Any = cmds["egg_info"]
++    else:
++        from setuptools.command.egg_info import egg_info as _egg_info
++
++    class cmd_egg_info(_egg_info):
++        def find_sources(self) -> None:
++            # egg_info.find_sources builds the manifest list and writes it
++            # in one shot
++            super().find_sources()
++
++            # Modify the filelist and normalize it
++            root = get_root()
++            cfg = get_config_from_root(root)
++            self.filelist.append("versioneer.py")
++            if cfg.versionfile_source:
++                # There are rare cases where versionfile_source might not be
++                # included by default, so we must be explicit
++                self.filelist.append(cfg.versionfile_source)
++            self.filelist.sort()
++            self.filelist.remove_duplicates()
++
++            # The write method is hidden in the manifest_maker instance that
++            # generated the filelist and was thrown away
++            # We will instead replicate their final normalization (to unicode,
++            # and POSIX-style paths)
++            from setuptools import unicode_utils
++
++            normalized = [
++                unicode_utils.filesys_decode(f).replace(os.sep, "/")
++                for f in self.filelist.files
++            ]
++
++            manifest_filename = os.path.join(self.egg_info, "SOURCES.txt")
++            with open(manifest_filename, "w") as fobj:
++                fobj.write("\n".join(normalized))
++
++    cmds["egg_info"] = cmd_egg_info
++
+     # we override different "sdist" commands for both environments
+-    if "setuptools" in sys.modules:
+-        from setuptools.command.sdist import sdist as _sdist
++    if "sdist" in cmds:
++        _sdist: Any = cmds["sdist"]
+     else:
+-        from distutils.command.sdist import sdist as _sdist
++        from setuptools.command.sdist import sdist as _sdist
+ 
+     class cmd_sdist(_sdist):
+-        def run(self):
++        def run(self) -> None:
+             versions = get_versions()
+             self._versioneer_generated_versions = versions
+             # unless we update this, the command will keep using the old
+@@ -1514,7 +2159,7 @@ def get_cmdclass():
+             self.distribution.metadata.version = versions["version"]
+             return _sdist.run(self)
+ 
+-        def make_release_tree(self, base_dir, files):
++        def make_release_tree(self, base_dir: str, files: List[str]) -> None:
+             root = get_root()
+             cfg = get_config_from_root(root)
+             _sdist.make_release_tree(self, base_dir, files)
+@@ -1523,8 +2168,10 @@ def get_cmdclass():
+             # updated value
+             target_versionfile = os.path.join(base_dir, cfg.versionfile_source)
+             print("UPDATING %s" % target_versionfile)
+-            write_to_version_file(target_versionfile,
+-                                  self._versioneer_generated_versions)
++            write_to_version_file(
++                target_versionfile, self._versioneer_generated_versions
++            )
++
+     cmds["sdist"] = cmd_sdist
+ 
+     return cmds
+@@ -1539,7 +2186,7 @@ a section like:
+  style = pep440
+  versionfile_source = src/myproject/_version.py
+  versionfile_build = myproject/_version.py
+- tag_prefix = ""
++ tag_prefix =
+  parentdir_prefix = myproject-
+ 
+ You will also need to edit your setup.py to use the results:
+@@ -1567,22 +2214,26 @@ SAMPLE_CONFIG = """
+ 
+ """
+ 
+-INIT_PY_SNIPPET = """
++OLD_SNIPPET = """
+ from ._version import get_versions
+ __version__ = get_versions()['version']
+ del get_versions
+ """
+ 
++INIT_PY_SNIPPET = """
++from . import {0}
++__version__ = {0}.get_versions()['version']
++"""
++
+ 
+-def do_setup():
++def do_setup() -> int:
++    """Do main VCS-independent setup function for installing Versioneer."""
+     root = get_root()
+     try:
+         cfg = get_config_from_root(root)
+-    except (EnvironmentError, configparser.NoSectionError,
+-            configparser.NoOptionError) as e:
+-        if isinstance(e, (EnvironmentError, configparser.NoSectionError)):
+-            print("Adding sample versioneer config to setup.cfg",
+-                  file=sys.stderr)
++    except (OSError, configparser.NoSectionError, configparser.NoOptionError) as e:
++        if isinstance(e, (OSError, configparser.NoSectionError)):
++            print("Adding sample versioneer config to setup.cfg", file=sys.stderr)
+             with open(os.path.join(root, "setup.cfg"), "a") as f:
+                 f.write(SAMPLE_CONFIG)
+         print(CONFIG_ERROR, file=sys.stderr)
+@@ -1591,71 +2242,50 @@ def do_setup():
+     print(" creating %s" % cfg.versionfile_source)
+     with open(cfg.versionfile_source, "w") as f:
+         LONG = LONG_VERSION_PY[cfg.VCS]
+-        f.write(LONG % {"DOLLAR": "$",
+-                        "STYLE": cfg.style,
+-                        "TAG_PREFIX": cfg.tag_prefix,
+-                        "PARENTDIR_PREFIX": cfg.parentdir_prefix,
+-                        "VERSIONFILE_SOURCE": cfg.versionfile_source,
+-                        })
+-
+-    ipy = os.path.join(os.path.dirname(cfg.versionfile_source),
+-                       "__init__.py")
++        f.write(
++            LONG
++            % {
++                "DOLLAR": "$",
++                "STYLE": cfg.style,
++                "TAG_PREFIX": cfg.tag_prefix,
++                "PARENTDIR_PREFIX": cfg.parentdir_prefix,
++                "VERSIONFILE_SOURCE": cfg.versionfile_source,
++            }
++        )
++
++    ipy = os.path.join(os.path.dirname(cfg.versionfile_source), "__init__.py")
++    maybe_ipy: Optional[str] = ipy
+     if os.path.exists(ipy):
+         try:
+             with open(ipy, "r") as f:
+                 old = f.read()
+-        except EnvironmentError:
++        except OSError:
+             old = ""
+-        if INIT_PY_SNIPPET not in old:
++        module = os.path.splitext(os.path.basename(cfg.versionfile_source))[0]
++        snippet = INIT_PY_SNIPPET.format(module)
++        if OLD_SNIPPET in old:
++            print(" replacing boilerplate in %s" % ipy)
++            with open(ipy, "w") as f:
++                f.write(old.replace(OLD_SNIPPET, snippet))
++        elif snippet not in old:
+             print(" appending to %s" % ipy)
+             with open(ipy, "a") as f:
+-                f.write(INIT_PY_SNIPPET)
++                f.write(snippet)
+         else:
+             print(" %s unmodified" % ipy)
+     else:
+         print(" %s doesn't exist, ok" % ipy)
+-        ipy = None
+-
+-    # Make sure both the top-level "versioneer.py" and versionfile_source
+-    # (PKG/_version.py, used by runtime code) are in MANIFEST.in, so
+-    # they'll be copied into source distributions. Pip won't be able to
+-    # install the package without this.
+-    manifest_in = os.path.join(root, "MANIFEST.in")
+-    simple_includes = set()
+-    try:
+-        with open(manifest_in, "r") as f:
+-            for line in f:
+-                if line.startswith("include "):
+-                    for include in line.split()[1:]:
+-                        simple_includes.add(include)
+-    except EnvironmentError:
+-        pass
+-    # That doesn't cover everything MANIFEST.in can do
+-    # (http://docs.python.org/2/distutils/sourcedist.html#commands), so
+-    # it might give some false negatives. Appending redundant 'include'
+-    # lines is safe, though.
+-    if "versioneer.py" not in simple_includes:
+-        print(" appending 'versioneer.py' to MANIFEST.in")
+-        with open(manifest_in, "a") as f:
+-            f.write("include versioneer.py\n")
+-    else:
+-        print(" 'versioneer.py' already in MANIFEST.in")
+-    if cfg.versionfile_source not in simple_includes:
+-        print(" appending versionfile_source ('%s') to MANIFEST.in" %
+-              cfg.versionfile_source)
+-        with open(manifest_in, "a") as f:
+-            f.write("include %s\n" % cfg.versionfile_source)
+-    else:
+-        print(" versionfile_source already in MANIFEST.in")
++        maybe_ipy = None
+ 
+     # Make VCS-specific changes. For git, this means creating/changing
+-    # .gitattributes to mark _version.py for export-time keyword
++    # .gitattributes to mark _version.py for export-subst keyword
+     # substitution.
+-    do_vcs_install(manifest_in, cfg.versionfile_source, ipy)
++    do_vcs_install(cfg.versionfile_source, maybe_ipy)
+     return 0
+ 
+ 
+-def scan_setup_py():
++def scan_setup_py() -> int:
++    """Validate the contents of setup.py against Versioneer's expectations."""
+     found = set()
+     setters = False
+     errors = 0
+@@ -1690,10 +2320,15 @@ def scan_setup_py():
+         errors += 1
+     return errors
+ 
++
++def setup_command() -> NoReturn:
++    """Set up Versioneer and exit with appropriate error code."""
++    errors = do_setup()
++    errors += scan_setup_py()
++    sys.exit(1 if errors else 0)
++
++
+ if __name__ == "__main__":
+     cmd = sys.argv[1]
+     if cmd == "setup":
+-        errors = do_setup()
+-        errors += scan_setup_py()
+-        if errors:
+-            sys.exit(1)
++        setup_command()
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
