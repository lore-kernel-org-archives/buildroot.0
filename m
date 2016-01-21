From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2016 22:23:38 +0100
Subject: [Buildroot] [PATCH 3/4] docs/manual: makedev syntax accepts
	usernames and group names
In-Reply-To: <cover.1453411322.git.yann.morin.1998@free.fr>
References: <cover.1453411322.git.yann.morin.1998@free.fr>
Message-ID: <f4a46ff20ba8d4e0513a82c0796c74f3ed4474e1.1453411322.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt | 22 +++++++++++-----------
 docs/manual/makedev-syntax.txt          | 20 ++++++++++++--------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1f9c7bb..b7817e3 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -43,16 +43,16 @@ system is based on hand-written Makefiles or shell scripts.
 28:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
 29: endef
 30:
-31: define LIBFOO_DEVICES
-32:	/dev/foo  c  666  0  0	42  0  -  -  -
+31: define LIBFOO_USERS
+32:	foo -1 libfoo -1 * - - - LibFoo daemon
 33: endef
 34:
-35: define LIBFOO_PERMISSIONS
-36:	/bin/foo  f  4755  0  0	 -  -  -  -  -
+35: define LIBFOO_DEVICES
+36:	/dev/foo  c  666  0  0	42  0  -  -  -
 37: endef
 38:
-39: define LIBFOO_USERS
-40:	foo -1 libfoo -1 * - - - LibFoo daemon
+39: define LIBFOO_PERMISSIONS
+40:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
 41: endef
 42:
 43: $(eval $(generic-package))
@@ -142,15 +142,15 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-On line 31..33, we define a device-node file used by this package
+On lines 31..43, we define a user that is used by this package (e.g.
+to run a daemon as non-root) (+LIBFOO_USERS+).
+
+On line 35..37, we define a device-node file used by this package
 (+LIBFOO_DEVICES+).
 
-On line 35..37, we define the permissions to set to specific files
+On line 39..41, we define the permissions to set to specific files
 installed by this package (+LIBFOO_PERMISSIONS+).
 
-On lines 39..41, we define a user that is used by this package (e.g.
-to run a daemon as non-root) (+LIBFOO_USERS+).
-
 Finally, on line 43, we call the +generic-package+ function, which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index cae37f7..0bbc16e 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -28,8 +28,10 @@ There are a few non-trivial blocks:
   * c: a character device file
   * b: a block device file
   * p: a named pipe
-- +mode+, +uid+ and +gid+ are the usual permissions settings (only
-  numerical values are allowed)
+- +mode+ are the usual permissions settings (only numerical values
+  are allowed)
+- +uid+ and +gid+ are the UID and GID to set on this file; can be
+  either numerical values or actual names
 - +major+ and +minor+ are here for device files, set to +-+ for other
   files
 - +start+, +inc+ and +count+ are for when you want to create a batch
@@ -37,19 +39,21 @@ There are a few non-trivial blocks:
   incrementing its counter by +inc+ until it reaches +count+
 
 Let's say you want to change the permissions of a given file; using
-this syntax, you will need to put:
+this syntax, you will need to write:
 
 ----
-/usr/bin/foobar f 644 0 0 - - - - -
+/usr/bin/foo f 755 0 0 - - - - -
+/usr/bin/bar f 755 root root - - - - -
+/data/buz f buz-user buz-group - - - - -
 ----
 
 Alternatively, if you want to change owner/permission of a directory
-recursively, you can put (to set UID to 123, GID to 456 and access
+recursively, you can write (to set UID to foo, GID to bar and access
 rights to rwxr-x--- for the directory /usr/share/myapp and all files
 and directories below it):
 
 ----
-/usr/share/myapp r 750 123 456 - - - - -
+/usr/share/myapp r 750 foo bar - - - - -
 ----
 
 On the other hand, if you want to create the device file +/dev/hda+
@@ -57,13 +61,13 @@ and the corresponding 15 files for the partitions, you will need for
 +/dev/hda+:
 
 ----
-/dev/hda b 640 0 0 3 0 0 0 -
+/dev/hda b 640 root root 3 0 0 0 -
 ----
 
 and then for device files corresponding to the partitions of
 +/dev/hda+, +/dev/hdaX+, +X+ ranging from 1 to 15:
 
 ----
-/dev/hda b 640 0 0 3 1 1 1 15
+/dev/hda b 640 root root 3 1 1 1 15
 ----
 
-- 
1.9.1
