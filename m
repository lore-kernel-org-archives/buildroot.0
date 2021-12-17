Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EFEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 18:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A64F61143;
	Fri, 17 Dec 2021 18:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRXhU5Fi-cgz; Fri, 17 Dec 2021 18:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D0716113E;
	Fri, 17 Dec 2021 18:03:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65D201BF36D
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54C7741C1F
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNWUnYERmlDP for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 18:03:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91CB9417C9
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 18:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DBE6281E69; Fri, 17 Dec 2021 17:58:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 19:02:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83b587a642075e605a4796a4ef924f90131bddae
X-Git-Newrev: 34ed9dae4d6ba7597ce0fef43bd81d3acdbb2d19
X-Patchwork-Hint: ignore
Message-Id: <20211217175811.DBE6281E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: re-enable on Microblaze
 architecture
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
Content-Type: multipart/mixed; boundary="===============9069318447081152643=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9069318447081152643==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=34ed9dae4d6ba7597ce0fef43bd81d3acdbb2d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While adding this package with commit[1] Microblaze architecture has been
disabled by default pointing that it suffers from gcc ICE, but this is not
true, indeed the build error is referred to libgeos that is postgis
dependency:
```
  during RTL pass: reload
  .../bootlin-microblazeel-uclibc/build/libgeos-3.9.0/src/geom/util/Densifier.cpp: In static member function ‘static std::unique_ptr<std::vector<geos::geom::Coordinate> > geos::geom::util::Densifier::densifyPoints(geos::geom::Coordinate::Vect, double, const geos::geom::PrecisionModel*)’:
  .../bootlin-microblazeel-uclibc/build/libgeos-3.9.0/src/geom/util/Densifier.cpp:128:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1155
  128 | }
      | ^
```

This build error has been worked around with this commit[2] and I've just
tested this build with Microblaze gcc 9.3/9.4/10.3 and 11.2 and it builds
succesfully since the bug above is gcc bug 90620[3] and it's been handled
in libgeos already.

So let's allow Microblaze(el/be) to build this postgis.

[1]: https://git.buildroot.net/buildroot/commit/?id=9bb1034455de299876dfd03c5074d8bb9622f873
[2]: https://git.buildroot.net/buildroot/commit/?id=847b441b1ca2230c4f26a49aaede69eca5e7e7ad
[3]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgis/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 2642115026..f4d913ece7 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
-	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
@@ -21,7 +20,6 @@ config BR2_PACKAGE_POSTGIS
 	  https://postgis.net/
 
 comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
-	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \

--===============9069318447081152643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9069318447081152643==--
