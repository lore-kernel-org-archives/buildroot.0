Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC83C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAA481948;
	Sat,  1 Jan 2022 13:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9r25N6QNmNdH; Sat,  1 Jan 2022 13:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B8CE818C2;
	Sat,  1 Jan 2022 13:29:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B84F21BF31D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C104015F
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUUHvojusr5Q for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:29:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C069040133
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5942981DD0; Sat,  1 Jan 2022 13:23:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 14:27:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e644e5df39c4d63ce7ae28ce2d02bfbf2a230cff
X-Git-Newrev: e745c0b92db3db7008d066813e2529d2032986c4
X-Patchwork-Hint: ignore
Message-Id: <20220101132341.5942981DD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedevs: allow recursive on
 directory with dangling symlinks
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e745c0b92db3db7008d066813e2529d2032986c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using BR2_ROOTFS_DEVICE_TABLE to change ownership of /etc, like so:

  /etc        r  -1 root     wheel     - - - - -

makedevs fails due to trying to chown() a dangling symlink:

  makedevs: chown failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc/mtab: No such file or directory
  makedevs: line 25: recursive failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc: No such file or directory
  make[2]: *** [fs/ext2/ext2.mk:63: /src/myLinux/output/images/rootfs.ext2] Error 1
  make[1]: *** [Makefile:84: _all] Error 2
  make[1]: Leaving directory '/src/myLinux/buildroot'

This patch changes chown() to lchown() in two cases in makedevs.c when
the argument can be a symlink, dangling or not.

In case the recursive operation includes a chmod() as well, explicitly
exclude symlinks that are dangling, because chmod() always operates on
the link target.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/makedevs/makedevs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index c57b964f5c..2796cd5e78 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -440,11 +440,13 @@ void bb_show_usage(void)
 int bb_recursive(const char *fpath, const struct stat *sb,
 		int tflag, struct FTW *ftwbuf){
 
-	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
+	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
 		bb_perror_msg("chown failed for %s", fpath);
 		return -1;
 	}
-	if (recursive_mode != -1) {
+
+	/* chmod() is optional, also skip if dangling symlink */
+	if (recursive_mode != -1 && tflag == FTW_SL && access(fpath, F_OK)) {
 		if (chmod(fpath, recursive_mode) < 0) {
 			bb_perror_msg("chmod failed for %s", fpath);
 			return -1;
@@ -628,7 +630,7 @@ int main(int argc, char **argv)
 				if (mknod(full_name_inc, mode, rdev) < 0) {
 					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
-				} else if (chown(full_name_inc, uid, gid) < 0) {
+				} else if (lchown(full_name_inc, uid, gid) < 0) {
 					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
 					ret = EXIT_FAILURE;
 				} else if (chmod(full_name_inc, mode) < 0) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
