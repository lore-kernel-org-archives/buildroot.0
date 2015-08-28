From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 00:25:01 +0200
Subject: [Buildroot] [PATCH] docs/manual: makedevs only accepts numerical
	values
Message-ID: <1440800701-26153-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because of a limitation in how makedevs resolves names [0], usernames
and groupnames would be resolved with UIDs and GIDs from the host, not
the target.

Fixing makedevs would involve us rewriting a /etc/passwd and /etc/group
parser (not too complex, still not trivial).

Document that the user and group fields should only be numbers, not
names. Also, the manual is currently mislieading, as an example indeed
uses names for the user and group fields. Fix that and expand the
explanations.

The mode field should also be numbers, not a rwx combo.

Slight typographical eye-candy about major/minor fields.

[0] it uses getpwnma(3) and getgrnam(3) to resolve names to IDs, and
those only resolve names on the host (i.e. there is no way to specify
a chroot-like feature)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: fixing makedevs to support names would require us to provide
replacements for getpwnam() and getgrnam(), that can read from an
alternate passwd and group file. This is not too complex, but far from
trivial. Fixing the docs is much easier, that close to the release...
---
 docs/manual/makedev-syntax.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

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
-- 
1.9.1
