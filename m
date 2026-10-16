Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA2DCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3A640A66;
	Fri, 16 Oct 2026 15:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4h7B0-q4qE4l; Fri, 16 Oct 2026 15:03:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D7FDC40A9C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163039;
	b=PcHy2Qu/m2eMyB8mRCQ/rRtESplOOByIBbRXCOEf+bHC2319SOYtIcTt5/OBF0MRxGGz
	 0rE1EK6NZ+wqQmJ1blPzRtK9uppNykEA4guQIjgrkCfLbkQpqY3w5YIANRcoPsjZCtZpB
	 6Pl+krSn3NXwWvnAp1BRdKlcBv/KUBLeZTzOQhvhfnZWji/PaNYiqSEXsZzl7KF1+Wu2R
	 X6lNU04NbDXd28fEsRQjZXsG4xp5OMf4VGyCEkXJiv2nJX5RozTOP8/Yl335trbY5lthP
	 V3qmHnYgkQPmq85d75hcsfYR/Qt7Dx/3B2rSA4EnZoE+8C23IFaH9ZrBk9F4ZbQEEuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WF0TlRVmJCcunQ9ei5tR05KRF8kp+FqusI+bYdajLyc=;
	b=fglDFyA8uDP5QAEb1wPNVlWBWO/vce5D2khaOdQuZ0e3KXc8xV5ZBiSGTmWzgfW//xt7
	 6ikxeE97ri3VGwNStV7+u8rxEnc66mOlGn+7BwAVeKmfwud29ScY37w17hckg4+nSypnx
	 Xrle9Of/r+mpn+vDY+cMUXkHbTX0wreS6c/igGBlOsaIyna2VUqqn7NlGjvRCQqQvNa/Z
	 2rXmJeZZ1C1KmmAegrnHpTeIUmpYFsN0l9s9iySWiFrHeMh0QKGf8IaJTDiPAfwsmnqxL
	 iH8ZBQpq8xSqVYaPJ3efnnAfilxQcpo6cTn3cM9x3+7a45OuTE7yxaNzLA7fzm1GE9w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163038;
	bh=WF0TlRVmJCcunQ9ei5tR05KRF8kp+FqusI+bYdajLyc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P0YdFzqkCPgsw4Zw1WlRqqHd4VXNI9rfaTEJvEllOZEnYDdlSFxMf7cewpOeo8ckS
	 18CwNJnDvoWAQtcv8pcEMyvA1T8KSbEzBhgxoPntMFuhe5p+HLU+hHOedlDYOANIY4
	 epx349VAvM9wV2wmFSbLXEXmkpkOO7CPAoA982GDDpDjJDjudTiTgaCQUzCODbyMja
	 OooJxSendrfmD/1XvdIq5rtJq3ZtT2HUSto55wPLF+XL6ZQHYW8C+kT7ASQTZTlGwo
	 oX3xM8EqQPnw2Run4ybMD+OI+j+beD1qMx/3ia9p4bG9jlle/yLupnMIYD9orMSPRd
	 HdjxufqHszd7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7FDC40A9C;
	Fri, 16 Oct 2026 15:03:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A27D7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1073040A66
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmsKA33NS2Gx for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C963F409FB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163036;
 b=JYovwrVCov59iIfuTbyLcoFlJn2hjS3Rkv25NhPGKV3UdHuexidq/WoUDvyMQprDmrY+
 JKoutLvg4i8Ht7C0we+9xoNbKjHCuoiE8KGtAWo6q8LKGj2jcQ7gN+Mm7n9XJhl1RS8hG
 00pzQKEyxvCRjobhH6J9k5DXXpsD6UgtjMeFLcw9DoHKuYvaZAgelnvqMETkCqRRj+6dD
 0PTcGZ5kEHKs9Y6rgRi3KV098Zx00V1iJ0Y1VrBBfXr6n/qF59NVdIEwyoEWEr8qz5bgF
 xc6Scm8iecrxBR0hzIYkV8c4gRXb6qujKldpbsytvAVkowd9bS9gORvSXW5Vg2mwjew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163036;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=qipGr5YJpArQ7LrLPfWlCFFNTWSoxWkJJY+s/Ng2DqA=;
 b=NuXZ0l808VMScZFXNdk+4zaIUMTMgN2qvSNLM0PPJSkAuZxOpbiGQd+kkoi09c6vExhO
 CbfTZ9bIs1+7C+9bqfKyKnUOVqV43bwfOuhSYq9eykSE+myqV84I7CK9kxSllP1n2dnDa
 oE1km9P6HRHdiVnqRGaMSXCia6/pxkauJsrpeUV9qFzIx2/b2vMFUDkHDPFvmxjz0HRH1
 SWaYTjkN1rOMBl/VDvmJlDNTzovjwnPJ3qd4dq0kPkw67LPYP8/lp21yfoAhM4aZjj5Sj
 90evc9LAZbazL1OQ39SavL7W1g7LTKxtK1g4z4gTHvjJf/PbEEM4maouIMMvy47m+Sw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h4VR3fTe; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C963F409FB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso1707788f8f.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163033; x=1792767833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qipGr5YJpArQ7LrLPfWlCFFNTWSoxWkJJY+s/Ng2DqA=;
 b=KxfOFUudLquQpjqzb4DsQIGjAKEbYCT+AtB6n0WAiLeNqzI0qy1lybCf265z86Y6F9
 v6DwcdAo0YtcaBUnRHnYb8GhU663AE/7dQYjvoNsnfk2t9CnqUwAbESqzwD0rcrkJLET
 p8VDy6PNdRotcCM0wXtYvogR1bnQo4gLvv22rrgKOByrW9XTDUzYtjRPOdNb7eBa1lxr
 ruQxQZxeFP5x6pT8eYoNQdxAVVu/IEwyG2u/VP9hq6jHRSpDXiKww96IBrWUZ7DT9dkr
 jThGx54d42viEQWwp2tGGqTKq+T+IR+a6+SJweJwuwViQGfZbOBqUft9qI1QnlHjMb8M
 yQGw==
X-Gm-Message-State: AFq9FYI/EVQe0mu7GZtVJ2hSEahH5Xscj5CWUOw0MxI6wcbeNno8MKSA
 hRy0MK26d3LW1cfJa2onuPE3rrqnyWUry77CQ6Frf9IdGjIMCKPd656fgxJow21PGDpGonk+xEe
 MzLz3/m4=
X-Gm-Gg: AYBFou3AWcyMyTb4lw3vXkgTKu76srkQc0R6C6pTBbF9+FYJYU7EgI6RGOGvrgfyJKH
 7x+xLwJUcGpslhSXUxacBo96aHFQ3qVg63R0e4e954DnZfHBg/7fOqgF5eYT3QdkmCp/qVY2VGU
 /VpoHL/1W36Pk2TiH8+Q1wASeBpNEBXC7MW2rVs/3Kt62UlEj67CbiaOoTbdbijH5/LjE4q2PX2
 VB66Zd+9VklV4+eOTUIWEZH96BbK3+an1BBTAeVy75ZYNcWnHYMtL5TFSOovOBJRdaxr7uBP/HP
 yVVUNrrwPGajXBco2+EPOdrV9N//2N12I7vz6mYZoDaUUfPXqevlU9/dIsHGVmOl4IoK6t3+Yra
 xeUDwkvyMXdBxyZDuuPOlwWwye2ZCh0pdEx+RN5w2LuabLP4BAi8KKZmg5QrK1yLFSlXF7UrzVS
 88cyLDnRCCaQMzbVIMy5RB+3ncnXQTZvMpS6aGCl6lpC0OABGlv3XpccLKFsI0U+QqT/x1Nlyi0
 9/JORfym7Em9kgq+FhwfwHNxp+yiMlELxBGkkdgNQ==
X-Received: by 2002:a05:6000:160e:b0:487:27f9:842 with SMTP id
 ffacd0b85a97d-48dbace9d4fmr30113959f8f.55.1792163033492; 
 Fri, 16 Oct 2026 08:03:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd5128f1sm5645404f8f.59.2026.10.16.08.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:52 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:50 +0200
Message-ID: <20261016150352.66820-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924134109.2415498-1-yegorslists@googlemail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk:
 LIBTOOL_PATCH_HOOK: also handle libtool 2.6.x
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.org/results/e6159cee14f84569c85a61f77824b2b58d68a4bc/
> 
> Libtool 2.6.x is starting to be used by upstreams when generating
> release tarballs (e.g. cryptsetup-2.8.8). As LIBTOOL_PATCH_HOOK does
> not know about it, ltmain.sh is left unpatched, so libtool relinks
> libraries at install time and adds -L/usr/lib, which is rejected by
> the toolchain wrapper:
> 
> i686-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
> 
> The v2.4.4 patch no longer applies cleanly, so add a v2.6 variant,
> rebased on libtool 2.6.2, and use it for 2.6.x versions.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-autotools.mk                     |  2 +
>  support/libtool/buildroot-libtool-v2.6.patch | 96 ++++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 support/libtool/buildroot-libtool-v2.6.patch
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 16b21acb6d..da33909881 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -76,6 +76,8 @@ define LIBTOOL_PATCH_HOOK
>  			fi \
>  		elif test $${ltmain_version} = "2.5"; then\
>  			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
> +		elif test $${ltmain_version} = "2.6"; then\
> +			patch -i support/libtool/buildroot-libtool-v2.6.patch $${i}; \
>  		fi \
>  	done
>  endef
> diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.patch
> new file mode 100644
> index 0000000000..b3968b1289
> --- /dev/null
> +++ b/support/libtool/buildroot-libtool-v2.6.patch
> @@ -0,0 +1,96 @@
> +Libtool fixes for cross-compilation, many past contributors/authors.
> +Update based on libtool-2.6.2.
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +
> +--- a/ltmain.sh
> ++++ b/ltmain.sh
> +@@ -3008,9 +3008,8 @@
> + 	# was found and let the user know that the "--tag" command
> + 	# line option must be used.
> + 	if test -z "$tagname"; then
> +-	  func_echo "unable to infer tagged configuration with compiler."
> +-	  func_echo "Possible use of unsupported compiler."
> +-	  func_fatal_error "specify a tag with '--tag'. For more information, try '$progname --help'."
> ++	  func_echo "defaulting to \`CC'"
> ++	  func_echo "if this is not correct, specify a tag with \`--tag'"
> + #	else
> + #	  func_verbose "using $tagname tagged configuration"
> + 	fi
> +@@ -4746,8 +4745,12 @@
> + 	  # At present, this check doesn't affect windows .dll's that
> + 	  # are installed into $libdir/../bin (currently, that works fine)
> + 	  # but it's something to keep an eye on.
> +-	  test "$inst_prefix_dir" = "$destdir" && \
> +-	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
> ++
> ++	  #
> ++	  # This breaks install into our staging area.  -PB
> ++	  #
> ++	  #test "$inst_prefix_dir" = "$destdir" && \
> ++	  #  func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
> + 
> + 	  if test -n "$inst_prefix_dir"; then
> + 	    # Stick the inst_prefix_dir data into the link command.
> +@@ -7063,7 +7066,8 @@
> + 	;;
> +       -all-static | -static | -static-libtool-libs | --static | -Bstatic)
> + 	case $arg in
> +-	-all-static)
> ++	# Make -static behave like -all-static -GZ
> ++	-all-static | -static)
> + 	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
> + 	    func_warning "complete static linking is impossible in this configuration"
> + 	  fi
> +@@ -7072,12 +7076,6 @@
> + 	  fi
> + 	  prefer_static_libs=yes
> + 	  ;;
> +-	-static)
> +-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
> +-	    dlopen_self=$dlopen_self_static
> +-	  fi
> +-	  prefer_static_libs=built
> +-	  ;;
> + 	-static-libtool-libs | --static | -Bstatic)
> + 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
> + 	    dlopen_self=$dlopen_self_static
> +@@ -7393,7 +7391,8 @@
> +       prevarg=$arg
> + 
> +       case $arg in
> +-      -all-static)
> ++      # Make -static behave like -all-static -GZ
> ++      -all-static | -static)
> + 	if test -n "$link_static_flag"; then
> + 	  # See comment for -static flag below, for more details.
> + 	  func_append compile_command " $link_static_flag"
> +@@ -7695,7 +7694,7 @@
> + 	continue
> + 	;;
> + 
> +-      -static | -static-libtool-libs)
> ++      -static-libtool-libs)
> + 	# The effects of -static are defined in a previous loop.
> + 	# We used to do the same as -all-static on platforms that
> + 	# didn't have a PIC flag, but the assumption that the effects
> +@@ -8755,7 +8754,7 @@
> + 	  *)
> + 	    if test no = "$installed"; then
> + 	      func_append notinst_deplibs " $lib"
> +-	      need_relink=yes
> ++	      need_relink=no
> + 	    fi
> + 	    ;;
> + 	  esac
> +@@ -11296,6 +11295,10 @@
> + 	    # Replace all uninstalled libtool libraries with the installed ones
> + 	    newdependency_libs=
> + 	    for deplib in $dependency_libs; do
> ++	      # Replacing uninstalled with installed can easily break crosscompilation,
> ++	      # since the installed path is generally the wrong architecture.  -CL
> ++	      newdependency_libs="$newdependency_libs $deplib"
> ++	      continue
> + 	      case $deplib in
> + 	      *.la)
> + 		func_basename "$deplib"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
