From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 22:04:33 +0100
Subject: [Buildroot] [git commit] support/download: add helper to generate a
 reproducible archive
Message-ID: <20210110205118.D1F43815EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe95b1a455bbefcaa90a08cf3dd1a590630921e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently need to generate reproducible archives in at least two
locations: the git and svn download backends. We also know of some
future potential use (e.g. the other download backends, like cvs, or
in the upcoming download post-processors for vendoring, like cargo
and go).

However, we are currently limited to a narrow range of tar versions
that we support, to create reproducible archives, because the gnu
format we use has changed with tar 1.30.

As a consequence, and as time advances, more and more distros are,
or will eventually start, shipping with tar 1.30 or later, and thus
we need to always build our on host-tar.

Now, thanks to some grunt work by Vincent, we have a set of options
that we can pass tar, to generate reproducible archives back from
tar-1.27 and up through tar-1.32, the latest released version.

However, those options are non-trivial, so we do not want to have
to repeat those (and maintain them) in multiple locations.

Introduce a helper that can generate a reproducible archive from
an input directory.

The --pax-option, to set specific PAX headers, does not accept
RFC2822 timestamps which value are too away from some fixed point
(set atcompile-time?):
    tar: Time stamp is out of allowed range

However, the same timestamps passed as strict compliant ISO 8601 are
accepted, so that's what we expect as a date format.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

    ---8<------8<------8<------8<---
    # Here is a Makefile used to test all the versions of tar, with
    # different output formats and different sets of options:
    # Versions prior to 1.27 do not build on recent machines, because
    # 'gets()' got removed (rightfully so), so don't count them as
    # candidates.
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
    ---8<------8<------8<------8<---
---
 support/download/helpers | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/support/download/helpers b/support/download/helpers
new file mode 100755
index 0000000000..0e0432c884
--- /dev/null
+++ b/support/download/helpers
@@ -0,0 +1,70 @@
+# Generate a reproducible archive from the content of a directory
+#
+# $1    : input directory
+# $2    : leading component in archive
+# $3    : ISO8601 date: YYYY-MM-DDThh:mm:ssZZ
+# $4    : output file
+# $5... : globs of filenames to exclude from the archive, suitable for
+#         find's -path option, and relative to the input directory $1
+#
+# Notes :
+#   - must not be called with CWD as, or below, the input directory
+#   - some temporary files are created in CWD, and removed@the end
+#
+# Example:
+#   $ find /path/to/temp/dir
+#   /path/to/temp/dir/
+#   /path/to/temp/dir/some-file
+#   /path/to/temp/dir/some-dir/
+#   /path/to/temp/dir/some-dir/some-other-file
+#
+#   $ mk_tar_gz /path/to/some/dir \
+#               foo_bar-1.2.3 \
+#               1970-01-01T00:00:00Z \
+#               /path/to/foo.tar.gz \
+#               '.git/*' '.svn/*'
+#
+#   $ tar tzf /path/to/foo.tar.gz
+#   foo_bar-1.2.3/some-file
+#   foo_bar-1.2.3/some-dir/some-other-file
+#
+mk_tar_gz() {
+    local in_dir="${1}"
+    local base_dir="${2}"
+    local date="${3}"
+    local out="${4}"
+    shift 4
+    local glob tmp pax_options
+    local -a find_opts
+
+    for glob; do
+        find_opts+=( -or -path "./${glob#./}" )
+    done
+
+    pax_options="delete=atime,delete=ctime,delete=mtime"
+    pax_options+=",exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={${date}}"
+
+    tmp="$(mktemp --tmpdir="$(pwd)")"
+    pushd "${in_dir}" >/dev/null
+
+    # Establish list
+    find . -not -type d -and -not \( -false "${find_opts[@]}" \) >"${tmp}.list"
+    # Sort list for reproducibility
+    LC_ALL=C sort <"${tmp}.list" >"${tmp}.sorted"
+
+    # Create POSIX tarballs, since that's the format the most reproducible
+    tar cf - --transform="s#^\./#${base_dir}/#" \
+             --numeric-owner --owner=0 --group=0 --mtime="${date}" \
+             --format=posix --pax-option="${pax_options}" \
+             -T "${tmp}.sorted" >"${tmp}.tar"
+
+    # Compress the archive
+    gzip -6 -n <"${tmp}.tar" >"${out}"
+
+    rm -f "${tmp}"{.list,.sorted,.tar}
+
+    popd >/dev/null
+}
+
+# Keep this line and the following as last lines in this file.
+# vim: ft=bash
