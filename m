From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:35:28 +0200
Subject: [Buildroot] [git commit] docs/manual: makedevs only accepts
	numerical values
Message-ID: <20150829083623.757937FF8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc1ba281a53177739e9b2e094bf5ca97be849829
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because of a limitation in how makedevs resolves names [0], usernames
and groupnames would be resolved with UIDs and GIDs from the host, not
the target.

Fixing makedevs would involve us rewriting a /etc/passwd and /etc/group
parser (not too complex, still not trivial).

Document that the user and group fields should only be numbers, not
names. Also, the manual is currently misleading, as an example indeed
uses names for the user and group fields. Fix that and expand the
explanations.

The mode field should also be numbers, not a rwx combo.

Slight typographical eye-candy about major/minor fields.

[0] it uses getpwnma(3) and getgrnam(3) to resolve names to IDs, and
those only resolve names on the host (i.e. there is no way to specify
a chroot-like feature)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/makedev-syntax.txt |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 283119d..cae37f7 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -28,8 +28,9 @@ There are a few non-trivial blocks:
   * c: a character device file
   * b: a block device file
   * p: a named pipe
-- +mode+, +uid+ and +gid+ are the usual permissions settings
-- +major+ and +minor+ are here for device files - set to - for other
+- +mode+, +uid+ and +gid+ are the usual permissions settings (only
+  numerical values are allowed)
+- +major+ and +minor+ are here for device files, set to +-+ for other
   files
 - +start+, +inc+ and +count+ are for when you want to create a batch
   of files, and can be reduced to a loop, beginning at +start+,
@@ -43,10 +44,12 @@ this syntax, you will need to put:
 ----
 
 Alternatively, if you want to change owner/permission of a directory
-recursively, you can put:
+recursively, you can put (to set UID to 123, GID to 456 and access
+rights to rwxr-x--- for the directory /usr/share/myapp and all files
+and directories below it):
 
 ----
-/usr/share/myapp r 750 myuser myuser - - - - -
+/usr/share/myapp r 750 123 456 - - - - -
 ----
 
 On the other hand, if you want to create the device file +/dev/hda+
