From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 14:52:44 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-external: restrict
 copying of dynamic loader to ld*.so.*
Message-ID: <20191027134610.7EC6989164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4d4056e63a9fa09d1ac0ecb390d4c677ebbb45d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
("toolchain-external: copy ld*.so* for all C libraries") changed (among
other things) the glob pattern to catch the dynamic loader from
    ld*.so.*
to
    ld*.so*

thus now matching files like 'ld-2.20.so' in addition to files like
'ld.so.1'.

However, there is no apparent reason why that change was made. It is
not explicitly mentioned in the commit message as to why that would be
needed, nor is clear based on the rest of the changes in that
commit. But it turns out that it causes too many files to be copied
with some toolchains.

In most toolchains, the structure looks like this:

-rwxr-xr-x 1 tdescham tdescham 834364 Feb 16 21:23 output/target/lib/ld-2.16.so
lrwxrwxrwx 1 tdescham tdescham     10 Feb 16 21:23 output/target/lib/ld.so.1 -> ld-2.16.so

So, a symlink 'ld.so.1' which points to another file. Applications
would have 'ld.so.1' (the link) encoded as program interpreter
(readelf -l <program>, see INTERP entry)

The patterns like 'ld*.so*' are passed as argument to
copy_toolchain_lib_root which is defined in toolchain/helpers.mk.
This macro copy_toolchain_lib_root will find all files/links matching
the pattern. If a match is a regular file, it is simply copied. If it
is a symbolic link, the link is copied and then the logic is
recursively repeated on the link destination. That destination could
either again be a link or a regular file. In the first case we recurse
again, in the latter we stop and continue with the next match of the
pattern.

The problem this patch is solving is when a toolchain does not have
this structure with a link and a real file, but rather two actual
files:

-rwxr-xr-x 1 tdescham tdescham 170892 Feb 16 21:55 output/target/lib/ld-2.20.so
-rwxr-xr-x 1 tdescham tdescham 170892 Feb 16 21:55 output/target/lib/ld.so.1

In this case the pattern 'ld*.so*' would find two regular file matches
and copy both. On the other hand, the pattern 'ld*.so.*' would only
find the 'ld.so.1' file and copy just that. This saves about 170K in
rootfs size.

Closer inspection reveals that this particular toolchain has more such
dedoubled symbolic links, e.g. the standard pattern of
'usr/lib/libfoo.so -> libfoo.so.1 -> libfoo.so.1.0.2' is not present,
and each of these three components are real files. In any case, it is
obvious that the toolchain itself is 'broken'.

That being said, because we have the logic that recursively resolves
symbolic links, TOOLCHAIN_EXTERNAL_LIBS really only needs to contain
the "initial" name of the library to be copied.

Therefore, revert the glob pattern back to what it was.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Thomas: improve the commit log with the additional details from Thomas]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 5147da0104..7dfd2bf1bd 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -112,7 +112,7 @@ endif
 # Definitions of the list of libraries that should be copied to the target.
 #
 
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so.* libgcc_s.so.* libatomic.so.*
 
 ifneq ($(BR2_SSP_NONE),y)
 TOOLCHAIN_EXTERNAL_LIBS += libssp.so.*
