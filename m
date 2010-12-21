From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Dec 2010 09:39:33 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: bump 1.18.x version
Message-ID: <20101221103835.022998E215@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5366b4fa9972f3372711f7f69810c0fcef183b07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.18.0/busybox-1.18.0-buildsys.patch   |   21 ----
 .../busybox-1.18.0/busybox-1.18.0-runsvdir.patch   |   17 ---
 .../busybox-1.18.0/busybox-1.18.0-sha.patch        |  118 --------------------
 4 files changed, 1 insertions(+), 157 deletions(-)
 delete mode 100644 package/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
 delete mode 100644 package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
 delete mode 100644 package/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 72722b9..9988178 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
 	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
-	default "1.18.0"	if BR2_BUSYBOX_VERSION_1_18_X
+	default "1.18.1"	if BR2_BUSYBOX_VERSION_1_18_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
diff --git a/package/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch b/package/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
deleted file mode 100644
index c72e4d3..0000000
--- a/package/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -urpN busybox-1.18.0/scripts/gen_build_files.sh busybox-1.18.0-buildsys/scripts/gen_build_files.sh
---- busybox-1.18.0/scripts/gen_build_files.sh	2010-11-22 21:43:22.000000000 +0100
-+++ busybox-1.18.0-buildsys/scripts/gen_build_files.sh	2010-11-24 14:59:47.732712663 +0100
-@@ -18,14 +18,14 @@ generate()
- 	local src="$1" dst="$2" header="$3" insert="$4"
- 	#chk "${dst}"
- 	(
--		echo "${header}"
-+		printf "%s\n" "${header}"
- 		if grep -qs '^INSERT$' "${src}"; then
- 			sed -n '1,/^INSERT$/p' "${src}"
--			echo "${insert}"
-+			printf "%s\n" "${insert}"
- 			sed -n '/^INSERT$/,$p' "${src}"
- 		else
- 			if [ -n "${insert}" ]; then
--				echo "ERROR: INSERT line missing in: ${src}" 1>&2
-+				printf "%s\n" "ERROR: INSERT line missing in: ${src}" 1>&2
- 			fi
- 			cat "${src}"
- 		fi
diff --git a/package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch b/package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
deleted file mode 100644
index 41ad570..0000000
--- a/package/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -urpN busybox-1.18.0/runit/runsvdir.c busybox-1.18.0-runsvdir/runit/runsvdir.c
---- busybox-1.18.0/runit/runsvdir.c	2010-11-22 21:43:22.000000000 +0100
-+++ busybox-1.18.0-runsvdir/runit/runsvdir.c	2010-12-06 01:27:56.926036992 +0100
-@@ -312,8 +312,11 @@ int runsvdir_main(int argc UNUSED_PARAM,
- 						last_mtime = s.st_mtime;
- 						last_dev = s.st_dev;
- 						last_ino = s.st_ino;
--						//if (now <= mtime)
--						//	sleep(1);
-+						/* if the svdir changed this very second, wait until the
-+						 * next second, because we won't be able to detect more
-+						 * changes within this second */
-+						while (time(NULL) == last_mtime)
-+							usleep(100000);
- 						need_rescan = do_rescan();
- 						while (fchdir(curdir) == -1) {
- 							warn2_cannot("change directory, pausing", "");
diff --git a/package/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch b/package/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch
deleted file mode 100644
index 3ad66fd..0000000
--- a/package/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-diff -urpN busybox-1.18.0/libbb/pw_encrypt_sha.c busybox-1.18.0-sha/libbb/pw_encrypt_sha.c
---- busybox-1.18.0/libbb/pw_encrypt_sha.c	2010-11-22 21:43:22.000000000 +0100
-+++ busybox-1.18.0-sha/libbb/pw_encrypt_sha.c	2010-12-01 13:56:24.372704380 +0100
-@@ -3,7 +3,7 @@
-  */
- 
- /* Prefix for optional rounds specification.  */
--static const char str_rounds[] = "rounds=%u$";
-+static const char str_rounds[] ALIGN1 = "rounds=%u$";
- 
- /* Maximum salt string length.  */
- #define SALT_LEN_MAX 16
-@@ -19,8 +19,8 @@ NOINLINE
- sha_crypt(/*const*/ char *key_data, /*const*/ char *salt_data)
- {
- 	void (*sha_begin)(void *ctx) FAST_FUNC;
--	void (*sha_hash)(const void *buffer, size_t len, void *ctx) FAST_FUNC;
--	void (*sha_end)(void *resbuf, void *ctx) FAST_FUNC;
-+	void (*sha_hash)(void *ctx, const void *buffer, size_t len) FAST_FUNC;
-+	void (*sha_end)(void *ctx, void *resbuf) FAST_FUNC;
- 	int _32or64;
- 
- 	char *result, *resptr;
-@@ -103,40 +103,40 @@ sha_crypt(/*const*/ char *key_data, /*co
- 
- 	/* Add KEY, SALT.  */
- 	sha_begin(&ctx);
--	sha_hash(key_data, key_len, &ctx);
--	sha_hash(salt_data, salt_len, &ctx);
-+	sha_hash(&ctx, key_data, key_len);
-+	sha_hash(&ctx, salt_data, salt_len);
- 
- 	/* Compute alternate SHA sum with input KEY, SALT, and KEY.
- 	   The final result will be added to the first context.  */
- 	sha_begin(&alt_ctx);
--	sha_hash(key_data, key_len, &alt_ctx);
--	sha_hash(salt_data, salt_len, &alt_ctx);
--	sha_hash(key_data, key_len, &alt_ctx);
--	sha_end(alt_result, &alt_ctx);
-+	sha_hash(&alt_ctx, key_data, key_len);
-+	sha_hash(&alt_ctx, salt_data, salt_len);
-+	sha_hash(&alt_ctx, key_data, key_len);
-+	sha_end(&alt_ctx, alt_result);
- 
- 	/* Add result of this to the other context.  */
- 	/* Add for any character in the key one byte of the alternate sum.  */
- 	for (cnt = key_len; cnt > _32or64; cnt -= _32or64)
--		sha_hash(alt_result, _32or64, &ctx);
--	sha_hash(alt_result, cnt, &ctx);
-+		sha_hash(&ctx, alt_result, _32or64);
-+	sha_hash(&ctx, alt_result, cnt);
- 
- 	/* Take the binary representation of the length of the key and for every
- 	   1 add the alternate sum, for every 0 the key.  */
- 	for (cnt = key_len; cnt != 0; cnt >>= 1)
- 		if ((cnt & 1) != 0)
--			sha_hash(alt_result, _32or64, &ctx);
-+			sha_hash(&ctx, alt_result, _32or64);
- 		else
--			sha_hash(key_data, key_len, &ctx);
-+			sha_hash(&ctx, key_data, key_len);
- 
- 	/* Create intermediate result.  */
--	sha_end(alt_result, &ctx);
-+	sha_end(&ctx, alt_result);
- 
- 	/* Start computation of P byte sequence.  */
- 	/* For every character in the password add the entire password.  */
- 	sha_begin(&alt_ctx);
- 	for (cnt = 0; cnt < key_len; ++cnt)
--		sha_hash(key_data, key_len, &alt_ctx);
--	sha_end(temp_result, &alt_ctx);
-+		sha_hash(&alt_ctx, key_data, key_len);
-+	sha_end(&alt_ctx, temp_result);
- 
- 	/* NB: past this point, raw key_data is not used anymore */
- 
-@@ -153,8 +153,8 @@ sha_crypt(/*const*/ char *key_data, /*co
- 	/* For every character in the password add the entire password.  */
- 	sha_begin(&alt_ctx);
- 	for (cnt = 0; cnt < 16 + alt_result[0]; ++cnt)
--		sha_hash(salt_data, salt_len, &alt_ctx);
--	sha_end(temp_result, &alt_ctx);
-+		sha_hash(&alt_ctx, salt_data, salt_len);
-+	sha_end(&alt_ctx, temp_result);
- 
- 	/* NB: past this point, raw salt_data is not used anymore */
- 
-@@ -174,22 +174,22 @@ sha_crypt(/*const*/ char *key_data, /*co
- 
- 		/* Add key or last result.  */
- 		if ((cnt & 1) != 0)
--			sha_hash(p_bytes, key_len, &ctx);
-+			sha_hash(&ctx, p_bytes, key_len);
- 		else
--			sha_hash(alt_result, _32or64, &ctx);
-+			sha_hash(&ctx, alt_result, _32or64);
- 		/* Add salt for numbers not divisible by 3.  */
- 		if (cnt % 3 != 0)
--			sha_hash(s_bytes, salt_len, &ctx);
-+			sha_hash(&ctx, s_bytes, salt_len);
- 		/* Add key for numbers not divisible by 7.  */
- 		if (cnt % 7 != 0)
--			sha_hash(p_bytes, key_len, &ctx);
-+			sha_hash(&ctx, p_bytes, key_len);
- 		/* Add key or last result.  */
- 		if ((cnt & 1) != 0)
--			sha_hash(alt_result, _32or64, &ctx);
-+			sha_hash(&ctx, alt_result, _32or64);
- 		else
--			sha_hash(p_bytes, key_len, &ctx);
-+			sha_hash(&ctx, p_bytes, key_len);
- 
--		sha_end(alt_result, &ctx);
-+		sha_end(&ctx, alt_result);
- 	}
- 
- 	/* Append encrypted password to result buffer */
-- 
1.7.2.2
