Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2B9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D67A83E68;
	Tue, 11 Jan 2022 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AccXKD0TO3o4; Tue, 11 Jan 2022 21:00:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92DF683E65;
	Tue, 11 Jan 2022 21:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9E981BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98A6C60F20
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuXpC16qeo2Y for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:59:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C195560E73
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:59:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0013A82BCC; Tue, 11 Jan 2022 20:53:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:58:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a3bdbb88094a7ffc2edc5d94cb2f7af8be360b7
X-Git-Newrev: 5da82181846b81a967c48f02f7404812a8acd60a
X-Patchwork-Hint: ignore
Message-Id: <20220111205334.0013A82BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: drop support for the
 'none' hash
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
Content-Type: multipart/mixed; boundary="===============3707996204283175387=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3707996204283175387==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5da82181846b81a967c48f02f7404812a8acd60a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1ba85b7f874d (support/download: add explicit no-hash support)
introduced the 'none' hash type, in an attempt to make hash files
mandatory, but not failing on archives localy generated, like those
for git or svn repositories, especially for those packages where a
version choice was present, which would allow for either remote
archives for which we'd have a hash or VCS trees for which we could
not have a hash for the localy generated archive.

Indeed, back in the time, we did not have a mean to generate
reproducible archives, so having a hash file without a hash for
thosel ocally generated archives would trigger an error in the
hash-checking machinery.

But now, low-and-behold, we do know how to generate those archives,
and we have a mechanism to explicitly exclude some archives from being
hash-checked (e.g. when the version string itself can be user-provided).

As such, the 'none' hash type no longer has any raison d'être, we do not
use it in-tree, and its use in a br2-external tree is most probably
inexistent (as is the use of hash files alotgether most probably).

So we simply drop the support for that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Thomas: drop support in checkpackagelib, as reported by Ricardo.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.txt | 9 +--------
 support/download/check-hash               | 4 ----
 utils/checkpackagelib/lib_hash.py         | 2 --
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 4ceb3fd772..6c68d7aa67 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -464,9 +464,8 @@ The format of this file is one line for each file for which to check the
 hash, each line with the following three fields separated by two spaces:
 
 * the type of hash, one of:
-** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
+** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+
 * the hash of the file:
-** for +none+, one or more non-space chars, usually just the string +xxx+
 ** for +md5+, 32 hexadecimal characters
 ** for +sha1+, 40 hexadecimal characters
 ** for +sha224+, 56 hexadecimal characters
@@ -500,9 +499,6 @@ target run. For a package with multiple versions (like Qt5),
 create the hash file in a subdirectory +<packageversion>+ of that package
 (see also xref:patch-apply-order[]).
 
-The +none+ hash type is reserved to those archives downloaded from a
-repository, like a 'git clone', a 'subversion checkout'...
-
 The example below defines a +sha1+ and a +sha256+ published by upstream for
 the main +libfoo-1.2.3.tar.bz2+ tarball, an +md5+ from upstream and a
 locally-computed +sha256+ hashes for a binary blob, a +sha256+ for a
@@ -520,9 +516,6 @@ sha256  01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b  libfoo
 # Locally computed:
 sha256  ff52101fb90bbfc3fe9475e425688c660f46216d7e751c4bbdb1dc85cdccacb9  libfoo-fix-blabla.patch
 
-# No hash for 1234:
-none  xxx  libfoo-1234.tar.gz
-
 # Hash for license files:
 sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  COPYING
 sha256  01b1f9f2c8ee648a7a596a1abe8aa4ed7899b1c9e5551bda06da6e422b04aa55  doc/COPYING.LGPL
diff --git a/support/download/check-hash b/support/download/check-hash
index fe9c10570e..5a47f49bc3 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -53,11 +53,7 @@ check_one_hash() {
     # Note: md5 is supported, but undocumented on purpose.
     # Note: sha3 is not supported, since there is currently no implementation
     #       (the NIST has yet to publish the parameters).
-    # Note: 'none' means there is explicitly no hash for that file.
     case "${_h}" in
-        none)
-            return 0
-            ;;
         md5|sha1)                       ;;
         sha224|sha256|sha384|sha512)    ;;
         *) # Unknown hash, exit with error
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 698d24fd6b..1c595e84b8 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -41,8 +41,6 @@ class HashType(_CheckFunction):
             return
 
         htype, hexa = fields[:2]
-        if htype == "none":
-            return
         if htype not in self.len_of_hash.keys():
             return ["{}:{}: unexpected type of hash ({}#adding-packages-hash)"
                     .format(self.filename, lineno, self.url_to_manual),

--===============3707996204283175387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3707996204283175387==--
