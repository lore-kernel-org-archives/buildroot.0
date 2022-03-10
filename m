Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 12:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB5B414C9;
	Thu, 10 Mar 2022 12:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HT4RZZWWDZj; Thu, 10 Mar 2022 12:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB10A402CA;
	Thu, 10 Mar 2022 12:03:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 865681BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F4F61205
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 12:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=parad0x.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqMg66j9H5rl for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 12:02:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from parad0x.org (parad0x.org [176.31.119.140])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2FF7611FD
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:02:58 +0000 (UTC)
Received: by parad0x.org (Postfix, from userid 1000)
 id E25D5102DFE; Thu, 10 Mar 2022 13:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=parad0x.org; s=mail;
 t=1646913776; bh=jH0ctOPImUz4UaQUxYqsKLSuFC1R7dvwS1R9AK32NIg=;
 h=Date:From:To:Subject:In-Reply-To:From;
 b=TnomjVns4LzKAd6X7tf9h1qs7r203/NqrnvGHEZswASrlftQ42Kc6g1KO7RTGxo4o
 rFluHirO3kFSEV4I5V8yi2DIk5ChQlPKrIfaw5JhVmic40iq9Tgn5JQ3b7W75rO5ly
 id3+c2m42ciY9WvHEbDB339PpUZCm+Vq4U/H80fA=
Date: Thu, 10 Mar 2022 13:02:56 +0100
To: buildroot@buildroot.org
Message-ID: <20220310120256.GA11974@parad0x.org>
MIME-Version: 1.0
In-Reply-To: <20220310101826.GA2353@parad0x.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [Buildroot] [PATCH v2] fs/common.mk: fix the globing pattern
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
Content-Type: multipart/mixed; boundary="===============3075302947547712692=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3075302947547712692==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The FAKEROOT script uses [^x] wildcard patterns which, while supported
by many shells and interpreted like a regex, are undefined according
to POSIX.

The dash shell (/bin/sh) on Debian testing switched to a different
fnmatch/glob implementation that does not support [^x]. Instead it
treats [^x] as either "^" or "x", and as a result buildroot fails to
build on this distro:

rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs=
/cpio/target/run/..'
rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs=
/cpio/target/tmp/..'

The correct form should be [!x] rather than [^x].

Signed-off-by: Mathieu Mirmont <mat@parad0x.org>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 45beb5ae7b..64a94d9ad8 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(R=
OOTFS_$(2)_DEPENDENCIES)
=20
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
-	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR=
)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
+	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[!.]* $$(TARGET_DIR=
)/tmp/* $$(TARGET_DIR)/tmp/.[!.]*" >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
--=20
2.35.1
Changes v1 -> v2:
  - Fix the regex rather than use find|xargs (suggested by Edgar Bonet & Da=
vid Laight)


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJiKejtAAoJENaa1EWGzzIil4oQAKdp04GgVw3pvQ1xulzBh0MW
kcDIsdbvJhV5PqEBd72aGh1Bgl2khiXen3e3UDx4t2kRG6tptrZ8zGElYR9WSO2+
RB+VRAxD5y5BtT7Dp4N0ixxZgqt6KmiGoXbtWCEwY57lUngHARPH0mT4cuBcnmY3
sAqRWfRMvWFeuG9Kfkh/uBKVLdK05X3xlJfXlaDN3CkFumK9h/4EMlfyPkGwz7JO
NVpzd09tC05+HuEjJ4ab8MoH0LIkpLJ/4cf1auNq6fY1nFwvg4RCGaY3G7ly4OEG
dEnvOe7/rWFAlG4iGlZ5SdMCxx1NcgskBBvQwLE2smlww0iLu2IgHH7gTWhOIXNw
pobuSbWjSycQEghnluY2gh+jHk8pSQMViuhzfA1OljcZqRgSBvF+Ld1PEf2wAyL3
DdDTmJulGicWIOy82Zo78e92NfwZhPjDlVbVFJ+IGoW5T/b0Jb3DELmbPVq5ykjy
4TMC4U6BoPZjyBVLyyyxWnsbHRHZJpwhcSXoT0b/Az2AfDNOevOnSe4WLqY9PkRk
WE1EGrhL8huc3s0KKp9lC4F1T2AFRR0ZiMbMUSFmM9ZqMwhWK6CoKrxle6f+GDaL
XKq8YMlqO56MfEhme6+ZOQ8G45cQ3Z7dzRfasTXLMuugrRZevNWiiF/tf2/Lxnqb
co7D0/lrpqhV/TOzT64Y
=kNq0
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============3075302947547712692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3075302947547712692==--
