Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE82CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A256133B;
	Fri, 16 Oct 2026 13:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKSPwYo8GEUA; Fri, 16 Oct 2026 13:13:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A9926134F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156401;
	b=qmi4M7K+Mbau0Jtdizb8qVCzcGjV70VoTt3cG4XB7bXZKvGSH7iWV0nctu81AzUPcp2+
	 t1craiYQk3hh9eFQ+evdxRQ6Ka/pcTSaiWaMWwZAHjthyHj8WXeRiXNQznwR0PnhaO54Z
	 bH0JNVZ2iUUPF0TAMuoKvRKRDAAba4qiu7vJSuxsyo1E9TiDI8M7acIH79xtuRwQzEenw
	 LUnr7N7agZkYppPvzMGDEvMCavuuYMgmMElnu+bqThO1IWryaxLpi1p0vDYXorQendhIo
	 cfUFU0RXRsaQKwhSykA8VEtlOjzXIkrJrFev2U2yka2y8pqL43k+4J9MtEFihEKUjHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mk+ZR8sm0jNdB3tpgPoZ/o1wRsyqC5dJJD36dLe/vI4=;
	b=NJqzFx0TNcIp6nBDbfVMkmS/BzOcA0yRL5EPuDMWiYaFfVPXUoXJbjIdopHcM0xRKKPi
	 78coubOQeu7EXh7Sh/Fbu6s5nmblNS74usEeB2WSTySseMsRQrkoRQcldI7TPG5ZFEFC9
	 wOQNWdjx1DuxAk/Pjob7cDAzUV0rAyVLNdhFza4Rt+rvs6rpvtM58oNushFFpuT9UzOBy
	 vrBLK6L4vJ/LTG21qXCyGdnrrQGHK9c8R9Mkgwpb2jWLJLYBFEsLkMI7ViPuEeSNM091T
	 gncxGPs6n3F3mqsptNWguKoW9DwEuFhsaHrZ5LpePDm9ZM6QTImsP5t7MAa3aDOyxGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156401;
	bh=mk+ZR8sm0jNdB3tpgPoZ/o1wRsyqC5dJJD36dLe/vI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k8Z4aD5toek5WkcXn+rzqRUok532mLSemfRX5hKreGNUDgbTeba1yQAj42drwhZi/
	 I2WCORLzTsSgqRVtOw5JMUV6AaJDhq/ozrLAJi643Z9BcZE6UXeZjb/67nQWR6VNWX
	 apYq7akcS6bRHdGIkY7vUwAR6yzNOioYl+HZrITKEHYrakA411rioV7juf9s0StWx3
	 CzSF6fPwMjRGwt1P+GDPJo0BhY+7ohxydSgJPItWt/feYTRdyIu3/336d3f+5LyIuD
	 YovYS3zmT1no0k0oHuHTX1xdefStMhQMsRNDP8Bgy9NXHfwuB1FjZCCcoZLiXFWvqo
	 yBCrrANIbBANQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A9926134F;
	Fri, 16 Oct 2026 13:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A978769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BCB160B3C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39-EKuEfxYUd for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C5AF60F2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=kV+TtyutOr21EhNc5wtEsdz1XSkh7kzXXUpqCbtzpgnEpsYW8fEoPliWzro3lZb3kj3y
 rQ3TC2t0WFJLr79gvl23EcP2/NN3ZVmICsvbHmvyKlbUTsllakhTDv2j9FIScnfLIQArV
 rpWKA7+CQStK8C6nrIga7BNgf9uXgniDVjGUgJ3ChP3DFtwyGnWYTz+p2Zr5aF8yIz7JF
 5x3b/UZua8NjZyjA6XgKiuGe6b1a5GXSvJmstE3D0hnuu4y6hsS3FStG4bvFWXWZ3Fn4J
 l5flf3s5I9xqt/M7x78zdaAKSId5Q6ds7JlGXtjaEzLdqb9asYD7MDJiNKKwLjQInCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NVLx7HPvDqdq1yi8GpgjsswoAWIqijB3fQ86qmymfyE=;
 b=KC4w0G7GrDPmF3KkpyVMXc14uUi2k6wcyX6tiV/1EPtxzUgGTdg3VbxPEIxcfU1sfkBC
 MTQv69yK8NFvCKM95Fa1Y+8hvncmC4zhveRZesqGZYtt9KCReh8jtQGGzks9ZR/n847TD
 7XUWY7SzsCNCKUPMGTcKRT4F+3S/zVqKrzTXb23r3VTrAP8wBzN70fqTcBBUa1XaQbWU2
 T3SDhA1YRq97kPK+49gbbIYxiVEXuKXwfZm6bm9PDp8nSzDpPQXIHFm/VVBDH5Pux5L9k
 7NNIAd1RKUvVQAfxElwC+KeQGkTJV46FGB4qjna89RA0Emdmif1ScvdchUOWQ88t0Rg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C5AF60F2E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C0DC960D7; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 23e6fb3ef2e8d67ed474b867fb9a8cbf7606dfae
X-Git-Newrev: 265e33686b3ba3cca69dd08ba78fa211aa865d76
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.0C0DC960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-autotools.mk:
 also handle libtool 2.6.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5490079557635875783=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5490079557635875783==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/265e33686b3ba3cca69dd08ba78fa211aa865d76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes:
https://autobuild.buildroot.org/results/e6159cee14f84569c85a61f77824b2b58d68a4bc/

Libtool 2.6.x is starting to be used by upstreams when generating
release tarballs (e.g. cryptsetup-2.8.8). As LIBTOOL_PATCH_HOOK does
not know about it, ltmain.sh is left unpatched, so libtool relinks
libraries at install time and adds -L/usr/lib, which is rejected by
the toolchain wrapper:

i686-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

The v2.4.4 patch no longer applies cleanly, so add a v2.6 variant,
rebased on libtool 2.6.2, and use it for 2.6.x versions.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5dbba2616f287cf6d333a0849ef870b0ce49f24f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore                          |  1 +
 package/pkg-autotools.mk                     |  2 +
 support/libtool/buildroot-libtool-v2.6.patch | 96 ++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 298cd65838..1f2c67ae4a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -986,6 +986,7 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
 support/libtool/buildroot-libtool-v2.2.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
 support/libtool/buildroot-libtool-v2.4.4.patch lib_patch.ApplyOrder lib_patch.Upstream
 support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
+support/libtool/buildroot-libtool-v2.6.patch lib_patch.ApplyOrder lib_patch.Upstream
 support/misc/relocate-sdk.sh Shellcheck
 support/scripts/apply-patches.sh Shellcheck
 support/scripts/check-bin-arch Shellcheck
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 16b21acb6d..da33909881 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -76,6 +76,8 @@ define LIBTOOL_PATCH_HOOK
 			fi \
 		elif test $${ltmain_version} = "2.5"; then\
 			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
+		elif test $${ltmain_version} = "2.6"; then\
+			patch -i support/libtool/buildroot-libtool-v2.6.patch $${i}; \
 		fi \
 	done
 endef
diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.patch
new file mode 100644
index 0000000000..b3968b1289
--- /dev/null
+++ b/support/libtool/buildroot-libtool-v2.6.patch
@@ -0,0 +1,96 @@
+Libtool fixes for cross-compilation, many past contributors/authors.
+Update based on libtool-2.6.2.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -3008,9 +3008,8 @@
+ 	# was found and let the user know that the "--tag" command
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+-	  func_echo "unable to infer tagged configuration with compiler."
+-	  func_echo "Possible use of unsupported compiler."
+-	  func_fatal_error "specify a tag with '--tag'. For more information, try '$progname --help'."
++	  func_echo "defaulting to \`CC'"
++	  func_echo "if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -4746,8 +4745,12 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
++
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  #test "$inst_prefix_dir" = "$destdir" && \
++	  #  func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -7063,7 +7066,8 @@
+ 	;;
+       -all-static | -static | -static-libtool-libs | --static | -Bstatic)
+ 	case $arg in
+-	-all-static)
++	# Make -static behave like -all-static -GZ
++	-all-static | -static)
+ 	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
+ 	    func_warning "complete static linking is impossible in this configuration"
+ 	  fi
+@@ -7072,12 +7076,6 @@
+ 	  fi
+ 	  prefer_static_libs=yes
+ 	  ;;
+-	-static)
+-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+-	    dlopen_self=$dlopen_self_static
+-	  fi
+-	  prefer_static_libs=built
+-	  ;;
+ 	-static-libtool-libs | --static | -Bstatic)
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+@@ -7393,7 +7391,8 @@
+       prevarg=$arg
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static -GZ
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  # See comment for -static flag below, for more details.
+ 	  func_append compile_command " $link_static_flag"
+@@ -7695,7 +7694,7 @@
+ 	continue
+ 	;;
+ 
+-      -static | -static-libtool-libs)
++      -static-libtool-libs)
+ 	# The effects of -static are defined in a previous loop.
+ 	# We used to do the same as -all-static on platforms that
+ 	# didn't have a PIC flag, but the assumption that the effects
+@@ -8755,7 +8754,7 @@
+ 	  *)
+ 	    if test no = "$installed"; then
+ 	      func_append notinst_deplibs " $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -11296,6 +11295,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++	      # Replacing uninstalled with installed can easily break crosscompilation,
++	      # since the installed path is generally the wrong architecture.  -CL
++	      newdependency_libs="$newdependency_libs $deplib"
++	      continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"

--===============5490079557635875783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5490079557635875783==--
