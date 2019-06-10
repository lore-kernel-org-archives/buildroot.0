From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 11:03:28 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libgit2: security bump to version 0.27.8
Message-ID: <20190610090328.28495-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixing the following list of issues (fixed in 0.27.6 and 0.27.5):

    The function family git__strtol is used to parse integers
    from a buffer. As the functions do not take a buffer length as
    argument, they will scan either until the end of the current
    number or until a NUL byte is encountered. Many callers have
    been misusing the function and called it on potentially
    non-NUL-terminated buffers, resulting in possible out-of-bounds
    reads. Callers have been fixed to use git__strntol functions
    instead and git__strtol functions were removed.

    The function git__strntol64 relied on the undefined behavior
    of signed integer overflows. While the code tried to detect
    such overflows after they have happened, this is unspecified
    behavior and may lead to weird behavior on uncommon platforms.

    In the case where git__strntol32 was unable to parse an
    integer because it doesn't fit into an int32_t, it printed an
    error message containing the string that is currently being
    parsed. The code didn't truncate the string though, which
    caused it to print the complete string until a NUL byte is
    encountered and not only the currently parsed number. In case
    where the string was not NUL terminated, this could have lead
    to an out-of-bounds read.

    When parsing tags, all unknown fields that appear before the
    tag message are skipped. This skipping is done by using a plain
    strstr(buffer, "\n\n") to search for the two newlines that
    separate tag fields from tag message. As it is not possible to
    supply a buffer length to strstr, this call may skip over the
    buffer's end and thus result in an out of bounds read. As
    strstr may return a pointer that is out of bounds, the
    following computation of buffer_end - buffer will overflow
    and result in an allocation of an invalid length. Note that
    when reading objects from the object database, we make sure to
    always NUL terminate them, making the use of strstr safe.

    When parsing the "encoding" field of a commit, we may perform
    an out of bounds read due to using git__prefixcmp instead of
    git__prefixncmp. This can result in the parsed commit object
    containing uninitialized data in both its message encoding and
    message fields. Note that when reading objects from the object
    database, we make sure to always NUL terminate them, making the
    use of strstr safe.

    Submodule URLs and paths with a leading "-" are now ignored.
    This is due to the recently discovered CVE-2018-17456, which
    can lead to arbitrary code execution in upstream git. While
    libgit2 itself is not vulnerable, it can be used to inject
    options in an implementation which performs a recursive clone
    by executing an external command.

    When running repack while doing repo writes,
    packfile_load__cb() could see some temporary files in the
    directory that were bigger than the usual, and makes memcmp
    overflow on the p->pack_name string. This issue was reported
    and fixed by bisho.

    The configuration file parser used unbounded recursion to parse
    multiline variables, which could lead to a stack overflow. The
    issue was reported by the oss-fuzz project, issue 10048 and
    fixed by Nelson Elhage.

    The fix to the unbounded recursion introduced a memory leak in
    the config parser. While this leak was never in a public
    release, the oss-fuzz project reported this as issue 10127. The
    fix was implemented by Nelson Elhage and Patrick Steinhardt.

    When parsing "ok" packets received via the smart protocol, our
    parsing code did not correctly verify the bounds of the
    packets, which could result in a heap-buffer overflow. The
    issue was reported by the oss-fuzz project, issue 9749 and
    fixed by Patrick Steinhardt.

    The parsing code for the smart protocol has been tightened in
    general, fixing heap-buffer overflows when parsing the packet
    type as well as for "ACK" and "unpack" packets. The issue was
    discovered and fixed by Patrick Steinhardt.

    Fixed potential integer overflows on platforms with 16 bit
    integers when parsing packets for the smart protocol. The issue
    was discovered and fixed by Patrick Steinhardt.

    Fixed potential NULL pointer dereference when parsing
    configuration files which have "include.path" or
    "includeIf..path" statements without a value.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix hash

 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 41ab87bf4d..29b829291c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	0b7ca31cb959ff1b22afa0da8621782afe61f99242bf716c403802ffbdb21d51  libgit2-v0.27.4.tar.gz
+sha256	8313873d49dc01e8b880ec334d7430ae67496a89aaa8c6e7bbd3affb47a00c76  libgit2-v0.27.8.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 551e3dea62..6c64aa67c8 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = v0.27.4
+LIBGIT2_VERSION = v0.27.8
 LIBGIT2_SITE = $(call github,libgit2,libgit2,$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
-- 
2.20.1
