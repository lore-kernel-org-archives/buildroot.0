From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Feb 2021 23:01:27 +0100
Subject: [Buildroot] [git commit] support/download: drop sub-second
 precision in tarball creation
Message-ID: <20210222213950.8796C8624F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b50eef1dfd9018bb6eec7bed1d7f20d4264621e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some download backends, like svn, will provide timestamps with a
sub-second precision, e.g.

    $ svn info --show-item last-changed-date [...]
    2021-02-19T20:22:34.889717Z

However, the PAX headers do not accept sub-second precision, leading to
failure to download from subversion:

    tar: Time stamp is out of allowed range
    tar: Exiting with failure status due to previous errors
    make[1]: *** [package/pkg-generic.mk:148: [...]/build/subversion-1886712/.stamp_downloaded] Error 1

Fix that by massaging the timestamp to drop the sub-second part. We
do that in the generic helper, rather than the svn backend, so that
all callers to the generic helper benefit from this, as this is more
an internal details of the tarball limitations, than of the backends
themselves.

Reported-by: Roosen Henri <Henri.Roosen@ginzinger.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[yann.morin.1998 at free.fr:
  - add Henri as reporter
  - move it out of the svn backend, and to the generic helper
  - reword the commit log accordingly
  - use an explicit time format rather than -Iseconds
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/helpers | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/download/helpers b/support/download/helpers
index 0e0432c884..57cc9fef44 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -8,6 +8,9 @@
 #         find's -path option, and relative to the input directory $1
 #
 # Notes :
+#   - the timestamp is internally rounded to the highest entire second
+#     less than or equal to the timestamp (i.e. any sub-second fractional
+#     part is ignored)
 #   - must not be called with CWD as, or below, the input directory
 #   - some temporary files are created in CWD, and removed at the end
 #
@@ -41,6 +44,9 @@ mk_tar_gz() {
         find_opts+=( -or -path "./${glob#./}" )
     done
 
+    # Drop sub-second precision to play nice with GNU tar's valid_timespec check
+    date="$(date -d "${date}" -u +%Y-%m-%dT%H:%M:%S+00:00)"
+
     pax_options="delete=atime,delete=ctime,delete=mtime"
     pax_options+=",exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={${date}}"
 
