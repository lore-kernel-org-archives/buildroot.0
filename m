Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B148ACC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7950160F58;
	Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBIlc1NawLSG; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5499260F0A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156188;
	b=gM+edzE9uG7OuFEXwPQDW03rAGGHuFR2TOtaKXsBpq8FTLEUACh+ypqRmoynLv2zPYJX
	 HAiE9/R9CYMoVCFa+PLjrlxHqgKlZ0+G1vL+fsC+PZHE849ElOg9pZFa5Poau5HgYk3FO
	 0fxlp65wr6nhqnfBGkAD9pHGD91Br1vCfZG6Xa0IkjKcg0txzRnuRAMbLfcz4R4jKLGKL
	 uoUPyZxuaw0K9g18kkHRQYfOZa0NJ41oPtoIRmC7ku2GP/ssSRyxnRCJRtmwdn8ApfY/A
	 BwOr1telYKoJZyc9eiLImGDSoPWvTz/yx4FdRuJnvPMqqagQnmXLfhVb1E6nXlZGUAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=n7aKcpUuNXB5glo6GwQ/RXq3RphnG+8qnprqoTDfIwc=;
	b=d9Bep9fR/bkYqQ1INA7ojNPi/MlwOOwtJBRix2zWNEBqpOg/E+5OBGHtO7f7Iw3wXIMJ
	 jt6722XbEEbeT8vO4ocGmH3Ks886SDjbqaVUg9w5uzIfKceR6lwYa05/tz5OLZEkAxjQV
	 yUB+0qX5tcmVJDEcCcotlHe7h3EBvHHOFjJMajJNSBvNd8spwoHMRyWbEY+WcNF3HCN2R
	 qeacVYxgfaEs3YTso4/49YfYOe9Nko8MT5EnLhY40Mvnd1WsL815zPn9Om4nFFvySUJeq
	 ArBUiy9wDlIPcdgKAaT3gSbp3uTBnXe15V4GA+wFUjpNHVlxRZAdTm1piG7qsz8t+gA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156188;
	bh=n7aKcpUuNXB5glo6GwQ/RXq3RphnG+8qnprqoTDfIwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MM3CwLBUhD62zN5MJE7WXRZVmJGhVs1GzVi6Leuc3WzWXGYG7zp/NhsmNmtaw/EwT
	 +Iu3Jqz5cGmj9QZR1udp8+yzgmZr0NxB98bY+imGxuXWQNK8UlIBm15+aAfLrq1t9q
	 B7RXhfzeD5rjiKure3k21mS9VOtTwE+OcSrZ7MXtQyM3l9TAMSR6v7CNx5VimhY0I9
	 ohEHOBV/MVE6+EUh3rjujcCsLCbArOVRSVnK0MeFxZfgcJrMzdSphOZ839/GV6MfEL
	 eWreU8+KWPdA4cmWfGP73EzVXS0kQ2sZnnPbEsL+dhAwr12CL/lhKibKnJKhz6Dup3
	 mIEv0wtMvHskw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5499260F0A;
	Fri, 16 Oct 2026 13:09:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A940E1C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E88780772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaWe5F_qwGQT for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 95FCB814D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=FeVS+29mLeyZuDrrz55rh+XGGkCGJggM2lyn9IOY5Ae6v+5VVCZObn60tKWNFDXpMb6g
 +4b6hj/hx/tfitIXtVTW7SL8gOgrUeHHy3q2bRivTtgQRo9K9pqytSxHH1yOW0v85BOmC
 4HVnqcM53eIHi12o4lR9Ha3JXCqPH+eGrecsMBMtwPQN/NbSdu2XzvmPNnoly9CqqrDjD
 T8RQcmj0j7KaVocsE9cJWeWOy4h6i8wpQz6C7QUIb06sTOG5jP1d6kpK7gZIurKWgFenE
 fiWT2/TlsBpsubgUeR0Qk3paT6BIlY1SikcO5W8ToB3LeckWtGO7rt/yDnADIE4knrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=52yqHAnZuw6uLfWFBg/SE8SzNa9NmxU2xLHrSzLLAEM=;
 b=Zhh4F+Ko85DEcQNuhKLrsG4TRK2N2QtA7jjRhMPLW0pR/8h0tqm9Vn6xY7Wok61IiVeH
 0+HcAJKdNeKam7VYU8/IKoZbEsOFBuFXAWNH9Jiz8g5pEHfszDhbXf90OrjVmFekKicNC
 SGezQ15bfFYS2QJrssy7fuRdmlxD1rTqkMgUHOCLlS1kwOZyVnTL+cDgFiOgXlU3LTdvW
 wpTRnCUY8XULTqbYCI+I+6axUBPxuSGNi7dUzYOD8bEASu9+yqHylC8gH2chX0zD/ElKZ
 SnZfX4p8Oo91ekBnVxI6D2Uv8NvgfQLocajnR5UfBG6x9mdAILMvWamNdpdRnGwrZdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FCB814D6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 870D8960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f878cf1a608f0d87370a89c4964c8aa3a113640d
X-Git-Newrev: 4f4acd09d5e34842e4230fdbe84a70076acaa799
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.870D8960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-autotools.mk:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7312906952184138765=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7312906952184138765==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f4acd09d5e34842e4230fdbe84a70076acaa799
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 0ecdc6cc3c..ceb4f785b6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1214,6 +1214,7 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
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

--===============7312906952184138765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7312906952184138765==--
