From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 22:58:41 +0200
Subject: [Buildroot] [git commit] package/pkg-python: use a shell expansion
 for sysconfigdata_name
Message-ID: <20200615210945.EDF5C7FADC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2158c87206a901be7fcd0beb5b499f086638dc58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, GNU Make expands the Python SYSCONFIGDATA_NAME variable;
however, when building with per-package directories, this variable is
not set because the evaluation of this variable occurs before buildroot
creates the per-package directories of a given package.

This can be easily demonstrated with that trivial Makefile:

    $ cat Makefile
    BLA = $(wildcard bla)
    all:
        @echo 'BLA=$(BLA)'
        @touch bla
        @echo 'BLA=$(BLA)'

    $ make
    BLA=
    BLA=

    $ make
    BLA=bla
    BLA=bla

I.e. the variables are evaluated at the beginning of a recipe, not for
each line of the recipe.

There are two solutions to fix this problem:

  - add a step between "patch" and "configure," which would evaluate all
    of the variables after creating the per-package directories;

  - evaluate SYSCONFIGDATA_NAME via a shell expansion instead of
    Makefile, to postpone the effective ex[ansion to until after the
    file has been created.

Even though the first option is semantically the best solution, this is
also very intrusive, especially since python3 is so far the only case
where we would need it. The second option however is more expedient, adn
so this is what we're doing here.

We introduce PKG_PYTHON_SYSCONFIGDATA_PATH to avoid duplication and to
make the following line easier to read.

Then PKG_PYTHON_SYSCONFIGDATA_NAME is actually defined as a back-tick
shell expansion (although back-ticks have their drawbacks, using $(...)
in Makefile is not trivial either):

  - we test that the file does exist, to cover the python2 and python3
    cases: with python2, the file does not exist, so we want to expand
    to an empty string; 'basename' only works on the filename, and does
    not check the file actually exists;

  - if the file exist, we get its basename without the .py extension,
    and this makes our expansion;

  - the "|| true" is added to ensure the old behavior of returning an
    empty string if the file does not exist still works, when the
    expansion is attempted in a shell where 'set -e' is in effect (the
    test would fail with python2, but this is not an error).

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12941
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: slight rewording in commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e5cd52003e..31b53e281b 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -20,9 +20,11 @@
 #
 ################################################################################
 
-define PKG_PYTHON_SYSCONFIGDATA_NAME
-$(basename $(notdir $(wildcard $(PYTHON3_PATH)/_sysconfigdata__linux_*.py)))
-endef
+# basename does not evaluate if a file exists, so we must check to ensure
+# the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
+# an empty string if the file does not exist.
+PKG_PYTHON_SYSCONFIGDATA_PATH = $(PYTHON#_PATH)/_sysconfigdata__linux_*.py
+PKG_PYTHON_SYSCONFIGDATA_NAME = `{ [ -e $(PKG_PYTHON_SYSCONFIGDATA_PATH) ] && basename $(PKG_PYTHON_SYSCONFIGDATA_PATH) .py; } || true`
 
 # Target distutils-based packages
 PKG_PYTHON_DISTUTILS_ENV = \
