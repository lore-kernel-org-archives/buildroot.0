From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Sep 2020 23:40:58 +0200
Subject: [Buildroot] [PATCH 2/7 RFC] WIP: support/download: change format of
 archives generated from git
In-Reply-To: <cover.1601329249.git.yann.morin.1998@free.fr>
References: <cover.1601329249.git.yann.morin.1998@free.fr>
Message-ID: <e4c7e8b122603628188517234a34f8486835e083.1601329249.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

** WIP: needs an update to all the hashes.

Currently, our git archives are reproducible because we ensure that we
use one of the few tar versions that generate identical gnu-formated
archives. However, than means that any tar version greater or equal
to 1.30 is not compatible. I.e. we're stuck in the past, forever.

However, thanks to some grunt work by Vincent, we now have a set of
options that we can pass tar, to generate reproducible archives back
from tar-1.27 and up through tar-1.32, the latest released version.

However, those archives are not identical to the previous ones generated
in the (now-broken) gnu format.

To avoid any clashing between old and new archives, and new and old
Buildroot versions, we need to name the new generated archives
differently from the existing ones. The only lattitude we have is to
change the extension.

The .tar.gz extension is a historical accident, dating back to when we
introduced downloads from VCS, at which time we decided to use the same
compression as was used for the tarballs directly downloaded via wget.

We could switch over to use .tgz, which is just a shorter name for a
.tar.gz. But while at it, lets also switch the compression, from the
venerable gzip, to the not-so-new-nowadays xz. But since xz is quite
slower than xz, we add traces that something is going on, so users do
not wonder why there does not seem to be any progress.

Setting the _SOURCE_EXT needs _SITE_METHOD to be known, which only
happens later in the file, so we move it down. This is OK, as long as
the variable are set before they are used to generate dependency rules
(or other conditional code).

The --pax-option, to set specific PAX headers, does not accept RFC2822
timestampes which value diverge too much:
    tar: Time stamp is out of allowed range

However, the same timestamp passed as strict compliant ISO 8601 is
accepted, so that's what we switch to as the date representation (%ci
has been supported by git back to 1.6.0, released August 2008).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Here is a Makefile used to test all the versions of tar, along with a
set of options:

 # Versions prior to 1.27 do not build on recent machines, because 'gets'
 # got removed (rightfully so), so don't count them as candidates.
VERSIONS = 1.27 1.27.1 1.28 1.29 1.30 1.31 1.32
DATE = Thu 21 May 2020 06:44:11 PM CEST

TARS = \
	$(patsubst %,test_gnu_%.tar,$(VERSIONS)) \
	$(patsubst %,test_posix_%.tar,$(VERSIONS)) \
	$(patsubst %,test_posix_paxoption_%.tar,$(VERSIONS))

all: $(TARS)
	sha1sum $(^)

.INTERMEDIATE: test_%.tar
test_gnu_%.tar: tar.% list
	./$(<) cf - -C test \
		--transform="s#^\./#test-version/#" \
		--numeric-owner --owner=0 --group=0 \
		--mtime="$(DATE)" \
		--format=gnu \
		-T list \
	>$(@)
test_posix_%.tar: tar.% list
	./$(<) cf - -C test \
		--transform="s#^\./#test-version/#" \
		--numeric-owner --owner=0 --group=0 \
		--mtime="$(DATE)" \
		--format=posix \
		-T list \
	>$(@)
test_posix_paxoption_%.tar: tar.% list
	./$(<) cf - -C test \
		--transform="s#^\./#test-version/#" \
		--numeric-owner --owner=0 --group=0 \
		--mtime="$(DATE)" \
		--format=posix \
		--pax-option='delete=atime,delete=ctime,delete=mtime' \
		--pax-option='exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={$(DATE)}' \
		-T list \
	>$(@)

list: .FORCE
list: test
	(cd test && find . -not -type d ) |LC_ALL=C sort >$(@)

LONG = L$$(for i in $$(seq 1 200); do printf 'o'; done)ng
test: .FORCE
test:
	rm -rf test
	mkdir -p test/bar
	echo foo >test/Foo
	echo bar >test/bar/Bar
	ln -s bar/Bar test/buz
	echo long >test/Very-$(LONG)-filename
	ln test/Very-$(LONG)-filename \
	   test/short

.PRECIOUS: tar.%
tar.%: tar-%
	cd $(<) && ./configure
	$(MAKE) -C $(<)
	install -m 0755 $(<)/src/tar $(@)

.PRECIOUS: tar-%
tar-%: tar-%.tar.gz
	tar xzf $(<)

.PRECIOUS: tar-%.tar.gz
tar-%.tar.gz:
	wget "https://ftp.gnu.org/gnu/tar/$(@)"

.FORCE:

clean:
	rm -rf tar-* tar.* test_* test list
---
 package/pkg-generic.mk |  8 +++++++-
 support/download/git   | 20 ++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5fe1bfe0e2..115115a345 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -514,11 +514,11 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_VERSION = custom
 endif
 
-$(2)_SOURCE_EXT = .tar.gz
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else ifdef $(2)_VERSION
+  # _SOURCE_EXT is defined below, after we compute the _SITE_METHOD
   $(2)_SOURCE			?= $$($(2)_BASENAME_RAW)$$($(2)_SOURCE_EXT)
  endif
 endif
@@ -564,6 +564,12 @@ ifndef $(2)_DL_OPTS
  endif
 endif
 
+ifneq ($$(filter git,$$($(2)_SITE_METHOD)),)
+$(2)_SOURCE_EXT = .tar.xz
+else
+$(2)_SOURCE_EXT = .tar.gz
+endif
+
 ifneq ($$(filter bzr cvs hg,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
diff --git a/support/download/git b/support/download/git
index 15d8c66e05..7bdc807ca7 100755
--- a/support/download/git
+++ b/support/download/git
@@ -170,8 +170,8 @@ _git checkout -f -q "'${cset}'"
 _git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
-# %cD is RFC2822, so it's fully qualified, with TZ and all.
-date="$( _git log -1 --pretty=format:%cD )"
+# %ci is ISO 8601, so it's fully qualified, with TZ and all.
+date="$( _git log -1 --pretty=format:%ci )"
 
 # There might be submodules, so fetch them.
 if [ ${recurse} -eq 1 ]; then
@@ -201,12 +201,20 @@ find . -not -type d \
        -and -not -path "./.git/*" >"${output}.list"
 LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
-# Create GNU-format tarballs, since that's the format of the tarballs on
-# sources.buildroot.org and used in the *.hash files
+# Explicit options to ensure reproducibility of the archive
+pax_options="delete=atime,delete=ctime,delete=mtime"
+pax_options+=",exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={${date}}"
+
+# Create tarballs in the posix format, since that's the most
+# reproducible format
+printf 'Creating tarball (%d files)...\n' "$( cat "${output}.list.sorted" |wc -l )"
 tar cf - --transform="s#^\./#${basename}/#" \
-         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
+         --numeric-owner --owner=0 --group=0 --mtime="${date}" \
+         --format=posix \
+         --pax-option="${pax_options}" \
          -T "${output}.list.sorted" >"${output}.tar"
-gzip -6 -n <"${output}.tar" >"${output}"
+printf 'Compressing tarball (%d bytes)...\n' "$( stat -c %s "${output}.tar" )"
+xz -9 <"${output}.tar" >"${output}"
 
 rm -f "${output}.list"
 rm -f "${output}.list.sorted"
-- 
2.25.1
