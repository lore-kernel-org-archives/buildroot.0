From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Mar 2021 08:17:03 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/efivar: add
 upstream post-37 patches fixing efibootmgr -v
Message-ID: <20210326184156.21A638911C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ce4d99699d8e198e7a5db11eab8939a7c932197
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Without this patch, efibootmgr -v errors out:

efibootmgr -v
BootCurrent: 0001
Timeout: 1 seconds
BootOrder: 0001,0002,0000
Boot0000* Diagnostic ProgramCould not parse device path: Invalid argument

vs:

efibootmgr -v
BootCurrent: 0001
Timeout: 1 seconds
BootOrder: 0001,0002,0000
Boot0000* Diagnostic Program    FvVol(5c60f367-a505-419a-859e-2a4ff6ca6fe5)/FvFile(085e8cc2-8ec9-4666-bd2a-49d481e95fa7)
Boot0001* containeros-a HD(1,GPT,1491d519-d9d7-7c4e-9110-4ab21271ac64,0x800,0x20000)/File(\efi\container\boot.efi)

For more details, see:

https://github.com/rhboot/efibootmgr/issues/133
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=963475

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 82f65e2c5f60b25101a5300085c2d80b6366bc23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-ucs2.h-remove-unused-variable.patch       | 35 ++++++++++++++++++++++
 ...logic-that-checks-for-UCS-2-string-termin.patch | 32 ++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/package/efivar/0005-ucs2.h-remove-unused-variable.patch b/package/efivar/0005-ucs2.h-remove-unused-variable.patch
new file mode 100644
index 0000000000..a814043ce8
--- /dev/null
+++ b/package/efivar/0005-ucs2.h-remove-unused-variable.patch
@@ -0,0 +1,35 @@
+From fdb803402fb32fa6d020bac57a40c7efe4aabb7d Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Tue, 5 Mar 2019 17:23:24 +0100
+Subject: [PATCH] ucs2.h: remove unused variable
+
+The const uint16_t pointer is not used since now the two bytes of the
+UCS-2 chars are checked to know if is the termination of the string.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ucs2.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/ucs2.h b/src/ucs2.h
+index edd8367..e0390c3 100644
+--- a/src/ucs2.h
++++ b/src/ucs2.h
+@@ -26,12 +26,11 @@ static inline size_t UNUSED
+ ucs2len(const void *vs, ssize_t limit)
+ {
+ 	ssize_t i;
+-	const uint16_t *s = vs;
+ 	const uint8_t *s8 = vs;
+ 
+ 	for (i = 0;
+ 	     i < (limit >= 0 ? limit : i+1) && s8[0] != 0 && s8[1] != 0;
+-	     i++, s8 += 2, s++)
++	     i++, s8 += 2)
+ 		;
+ 	return i;
+ }
+-- 
+2.20.1
+
diff --git a/package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch b/package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch
new file mode 100644
index 0000000000..00b20332ef
--- /dev/null
+++ b/package/efivar/0006-ucs2.h-fix-logic-that-checks-for-UCS-2-string-termin.patch
@@ -0,0 +1,32 @@
+From 4e04afc2df9bbc26e5ab524b53a6f4f1e61d7c9e Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Tue, 5 Mar 2019 17:23:32 +0100
+Subject: [PATCH] ucs2.h: fix logic that checks for UCS-2 string termination
+
+Currently the loop to count the lenght of the UCS-2 string ends if either
+of the two bytes are 0, but 0 is a valid value for UCS-2 character codes.
+
+So only break the loop when 0 is the value for both UCS-2 char bytes.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ucs2.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ucs2.h b/src/ucs2.h
+index e0390c3..fd8b056 100644
+--- a/src/ucs2.h
++++ b/src/ucs2.h
+@@ -29,7 +29,7 @@ ucs2len(const void *vs, ssize_t limit)
+ 	const uint8_t *s8 = vs;
+ 
+ 	for (i = 0;
+-	     i < (limit >= 0 ? limit : i+1) && s8[0] != 0 && s8[1] != 0;
++	     i < (limit >= 0 ? limit : i+1) && !(s8[0] == 0 && s8[1] == 0);
+ 	     i++, s8 += 2)
+ 		;
+ 	return i;
+-- 
+2.20.1
+
