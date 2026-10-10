Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0695CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92DE0810E3;
	Sat, 10 Oct 2026 15:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQ7QEG9-OCN3; Sat, 10 Oct 2026 15:17:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84029810E8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645443;
	b=G+usVuNZQx4qdQLTouAFPKe82mbzkYBz2su7ti46shLu8pE3zTm4gONrf0I6STN4VIO/
	 mAGZTptpPMC2OqiA8Bc3U+GBzt21W6547N5CcpmE10Hcy3CUgf8dRHILTK4po6ea+cmEC
	 MEPak9siCU7X4AIopqdssjQumw6nzt3yGv8jzulfBGoF42a2Gdcm18GFFYlHchdHyvCKq
	 GfoeWQBBbfjGCUDmDd9KVtSfSEBYTPl2PfOVC5PxuBRfaDER4URU5MtKEMeuw1D/S/5uy
	 nxzBOYsIcH7viTdernY0A7lmnesXP3zT1s+94n+uS6qrBkPMq/qRbnZXsU4WqbrOlmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JyrieLQDuoTLRJVyHF0uwv9KkxYRI+QG3TQ21fnhRGc=;
	b=iXpXVcCvj3V0WdGsBeS7oDNQIUb2jNlV4VvXjGg/ch+xM1UqYr50TjbmARGFDBIDwb7r
	 vqmVDQ5BbJnhxC+azkrGT3/vzEuWMYvxFniX0ssimkvX1G8mteWoRnDzw3PZenyBCyrDM
	 kohzL0xtMTJaRgAkTH1ZhygaMY5R8m/i7829zuH0p7GKCVc3QMCQUQj7svmp/yu+jk8nS
	 CtHebrCQWgzOYaIXvfPPb3D9VZSkDvC48kowY6Nya/CG0K63UeNfRBFYNWYtHHVnG0Srq
	 LQAmoRQhVPKBCtqQkEO5iobrZx2ooYTl9WdMfIRxkfU6RrRZ8/hkgORS3dIK6QCUhfA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645443;
	bh=JyrieLQDuoTLRJVyHF0uwv9KkxYRI+QG3TQ21fnhRGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PbiRuRLpsdEOgE03H4QbssMk1N4OHcO/hMJwEPC79L4PYxS57JwwUGC59IZYROAgz
	 +yzF6st5CwEzYkWjry6FuyZ1uRczKM4lYXLHkS+OrkdSevRuqqQA2wl7ruYI6eVZPa
	 x6IdHMmBwAD/kwUq5RDO9TVo7LzNvrcDMgHHrLQFCYxH+j0EpIharidvQvGM2E2d22
	 KjA+L+Dp7LGY96HY7BWVxG30Tx8HCVL+aDsdcmmMvD1niYn9KHlIjZyFJVrz6XHRYF
	 M2wkc24aLkfIX8MC9Y+8NfkAnPZ90+SBRr9KIeN8VXbCVtaX8sIl/YS4w02qW1kiBn
	 sQO9P9OugLMfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84029810E8;
	Sat, 10 Oct 2026 15:17:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60B8B105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52BB640079
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etwNjxJKbRkg for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:17:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6A1B240004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645441;
 b=SUb2U+/Uv7nt0pI6kAA+LUefcJG9tN3a//Rgse6p/oaK2AJEjBu9gGENLVbrWFQOUn6t
 /1FL9ZOSc4bha51OZxWZTuhMBM7hhnKcY88b+LBsR3ZGlC2aTVEamyZ6vtJ4HZLrjt8+g
 l9E3jtRuEWrtSgqVWBT5fYW926q+U8T3IZeNAzHNzlAFUl0yILI+Ge/npoLNDmGlVuzZd
 JJf1wYCNkHkwpNR5u137NE5mRAC0GDtk5UzZg64DjDXoTKqbhJ61urnchv0oJhu/RR8bO
 Gyjcj979UIllawDK4AQaR1yuAPm5oHEFLuKhVy922XQYp9VJvjUMAFZ7DfZwG4Arb7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4L4H7XriBBc5iMgRALvVpxJR7i2HXRIyFEHD/UqOXHo=;
 b=o3a7QyHM80bIeE534Jr+GIQfTVLgSoHqL6erAEcs5rB4tfh7YOS50wDE8DRDFNsA2Swr
 AZF4QXjD0F8QhqiJ9G1nfU/AkaEIAFgaP90XCSUnHXhlfvVOWofhq93uKDCennO+cTUjp
 5m56nQkScQUeLBkeA8JfOBJcZbySgwRJzHZ6WbKXOmyCz6pjiZqfYx9DeYFbq8ut0biB5
 ZjAKKoAoi9HlHEaEFiU4jGALRo//iH/uwbtc3EG0UqXLz66k8HKClMn1at2Ug6F0BgWqi
 Nr5K2BBjV9EFsDDxUipz9eFecDu2hHYrVKltWx/zHbFvskrYwhGL4g31I3psGI8YBwQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A1B240004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 295A391D3D; Sat, 10 Oct 2026 15:16:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:16:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fe0f0054ba37e9719df21d46e064a06daa68ccd
X-Git-Newrev: 5dbba2616f287cf6d333a0849ef870b0ce49f24f
X-Patchwork-Hint: ignore
Message-Id: <20261010151603.295A391D3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools.mk: also handle
 libtool 2.6.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5dbba2616f287cf6d333a0849ef870b0ce49f24f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 .checkpackageignore                          |  1 +
 package/pkg-autotools.mk                     |  2 +
 support/libtool/buildroot-libtool-v2.6.patch | 96 ++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2dc7bf9039..83c1e0c66a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -981,6 +981,7 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
