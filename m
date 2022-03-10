Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6E6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 10:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF7C611E1;
	Thu, 10 Mar 2022 10:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZWJPdyAftzf; Thu, 10 Mar 2022 10:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E106A611CC;
	Thu, 10 Mar 2022 10:23:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36A971BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 10:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2513B611CC
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 10:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqFpOdJK-5Fs for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 10:23:51 +0000 (UTC)
X-Greylist: delayed 00:05:20 by SQLgrey-1.8.0
Received: from parad0x.org (parad0x.org [176.31.119.140])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D21DC60D94
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 10:23:50 +0000 (UTC)
Received: by parad0x.org (Postfix, from userid 1000)
 id A49E810356A; Thu, 10 Mar 2022 11:18:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=parad0x.org; s=mail;
 t=1646907506; bh=3BzWmX0oKV/jE2Okgd8LdX/BO2/1gaqLQNcunc+1YCg=;
 h=Date:From:To:Subject:From;
 b=nZ9i5BeCD7TyqQUR1FM/DSg5eDxgqSAL3tw3bv5zTfjZEgiwMj1GFim9elrgOp96h
 Mkfn7KjXa+zCLfmSiYqDOIVVcrMSgJ8z4RNzoxzbELrsxbzMiWBkUmD731Mt80yG92
 kdeY+o/lVpGKBtd9iomMhacPsfA6p0x2aWs6Il7E=
Date: Thu, 10 Mar 2022 11:18:26 +0100
To: buildroot@buildroot.org
Message-ID: <20220310101826.GA2353@parad0x.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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
From: Mathieu Mirmont via buildroot <buildroot@buildroot.org>
Reply-To: Mathieu Mirmont <mat@parad0x.org>
Content-Type: multipart/mixed; boundary="===============0181263677258459441=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0181263677258459441==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Different shells can have different behaviours when it comes to
globbing patterns. The dash shell (/bin/sh) on Debian testing switched
to a different fnmatch/glob implementation that results in this new
behaviour:

Using bash:
$ mkdir /tmp/foo
$ echo /tmp/foo/.[^.]*
/tmp/foo/.[^.]*

Using dash:
$ mkdir /tmp/foo
$ echo /tmp/foo/.[^.]*
/tmp/foo/..

The current FAKEROOT script uses this shell glob pattern which now
fails on recent Debian testing systems:

rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs=
/cpio/target/run/..'
rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs=
/cpio/target/tmp/..'

It seems safer to use `find | xargs rm` here instead of relying on
shell globbing patterns.

Signed-off-by: Mathieu Mirmont <mat@parad0x.org>
---
 fs/common.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 45beb5ae7b..37eafac4f7 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,7 +186,8 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(R=
OOTFS_$(2)_DEPENDENCIES)
=20
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR=
)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
+	echo "find $$(TARGET_DIR)/run/ -mindepth 1 -prune -print0 | xargs -0r rm =
-rf --" >> $$(FAKEROOT_SCRIPT)
+	echo "find $$(TARGET_DIR)/tmp/ -mindepth 1 -prune -print0 | xargs -0r rm =
-rf --" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
--=20
2.34.1


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJiKdBvAAoJENaa1EWGzzIi6aMQAKVcSvJRLsr0Ndy1tCmMUBZf
NZsmaei7MA93PrgrLhdwD6U2mQdLgs+IxnOaHSy8MUu9Njohsn2T40KwGFkJyqJ+
NPL8scZSbWYU2ksSZBvKtrSpqS27B4hK+Ou/qoLwHlEJX0s/t3xKQRdOE5Jq0K2t
o1UyXuZgkWNpKp3sxg3NaKzLutHOVXJ0L3aKeAcw0S7M+b07BzZ3G1T86uOHtqXt
HapZGp8LPAiUQRMZ8RVV/xeMu0xkkhWwnfK5Al3IynYO8JJ2KBc17VmfEp5BdJct
IviDWNFUwJbkB1cvu8WO9M4uiFwVNOdx3FsYT2qI8t54zd4lbXVF9XjCRU3qWO7W
GVQHrzIKhmK/m/PTsGPik1pTnjQnu1Cghha3wuUZcE+4Zyu+xH+HgXCn78TP81SI
IVC3ioMLOj38wX/gu/MmkmDnPR8aWFxKpMUZWa4V72+LUySfEMRC8Bs+CJfdTNcK
z3WNTndxY17xiVonLfKHGUe8etzDP08R2i+MQhesx1r3sg1tC+shJxydQptbsnEX
Itksh/lBO0Iz5+z9ycho+RnQ/gQ4lOfZWsv06KCOjE/rmfMgIYkHZ8SOrqbe/rs4
mY/+RDOYlDX41QUquSGbkle6UdJn5Pkf6JD5o+Ofc5L9oM1mzYMLRBxfApn2tPc4
T7+79yCQ1iLbTu9A/uBl
=H35S
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

--===============0181263677258459441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0181263677258459441==--
