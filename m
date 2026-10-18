Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F4CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 16:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A6040744;
	Sun, 18 Oct 2026 16:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUakw-xwYcLM; Sun, 18 Oct 2026 16:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0750F405D9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792339629;
	b=gpO9JuZ+Gf+RZRiSdFIfwY0zW/ZadQdt3HQFqxuZ66xnODyz1xeBIO+1dbyA9PxfyorI
	 CLszCQU2n/gQspNvwv7XpThx8sg3ZKfkWFtVWQVzc5SOYuvO8Unp+XEhUU9a20HPCof7k
	 tya38xGIXRL4tXbkgXCy4+4ECkU59vWJJ8jl+Tv7MM5847MGVQ+zMqJYzmmNkRfSAXqiB
	 1G2HEygApZuO9NO1j5P6hKuPflX3v/RGj3gPKxEAib/6D00DQ4E9YCfjrLW/naGCPj0I9
	 +vrrzxZbUOcBeyFc4rUsNd0LzDpY0AQIp3s/jjZokiosrV9ZT7Q/q2MZuqwzJBKTH7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792339629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y4rG9y7ImlSsSkLL+aLIlY8eJVN+xH1gCS+kwnugO24=;
	b=SZ4V72IFfPN/AbSBx/5YgnZGbdSNmNuqRVtsOEb6BhNVmPV+Rnb+UXscLwxi/yMtB6Wd
	 Es1nH2hFpjRq8Jz77wMth9b5hAOfjUOcaYBGN8escAdGVh92GpBl+tVGynzJZcg+QEeHN
	 c1VaeoEbpoagrsT0ajZ9myuN85x996B+WSp1klgnEgihCtV6oK+ytyyKSmwZI2Es1IcoP
	 fLOB/0jN5dmzkCiYTsSoI9b4yRX0lWq/NElZ3j8o/yeY4KSVO1H8yEOTEBl744RuyEZhi
	 CVCUoYNou6gTgq/ulEr4A+sSXk0R5vPP/miAr7Ju3+zRtG1tyr0tpvR8BmOiFcOvZNQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792339629;
	bh=y4rG9y7ImlSsSkLL+aLIlY8eJVN+xH1gCS+kwnugO24=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O7cGrUhHLkraturwMHWgTsQ+hNykjOKD429QrkFcoGt+Tq+Y0eTuXJzrjrEiKB5yS
	 5vMgr+2xLFNf90py5/Pw0Gnt3mQ0jp7O2Vnc/VZ3c0s2MRNaI+vUjfFTSjF/sZVbpt
	 21tTv7ydbG7euoBBy3K/qtdAKAiKHOn+U7gv82aebxboV1FozzmGnpIdQ5rd2BmKEr
	 YyU+g9gmiFT06kpolZTDWXWKnAq+KlvBFgsggZazLQ4cvO7D4M3TEx/CLyJf46xJW9
	 KWziyT3tdOyuCr34FyLUpJGj96LOJbM2oTw9jIQigIMtKN+k8n0TfEHvmxCsSc55zl
	 JEhbVorwnTf5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0750F405D9;
	Sun, 18 Oct 2026 16:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B8461
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 16:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DD3B80D1D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 16:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRfAj5IrCBN3 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 16:07:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 979B980C95
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792339626;
 b=VbaUucZQPjk72C/LGeiDtmV+ZbcabfGJHnsuh+reVhWiI4rC6sx2PljRlI4zDxX/6iAC
 /n2ywxOvd+JmUqEVTNx9een4ChlhxWCGOdcR5VKt39fL/pExuQglSfBKEqU4L1JAYW1v2
 XjvAm3OzVBaWwpmZ2gbkEdA3+gv8AcFX2YsnlcGJumpfgYPqs4PLLMIAnTBBPEPj46JuU
 XvJ4+7tK2CYBAI+tD60cJkl3i1jBZqntwYdeP+MYXSkCYFMK4EoufU5rgyqAYnboUML13
 bLsnLJIe4PzwjVyjwitr/2WWAoQ9xTeuzf5QKRt60b6nB3ebwIhkuYTVdGPxqH2drwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792339626;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=m8zk4XDe3nBR3Ahd25Myn8vBbxA6uZTnhzJXhchmPfQ=;
 b=H/T+2atSjzYP5RJ2fym/4Z9Peie4sFJtRwnfRSvANT8YRhUniFakGzg9iw8+scPh0vEB
 HbB94WJr8zRd9qW+eoS4UNBF5Glc17EtLKsjfAtm5tGdZq5YJvGmbsP5l4ZcQB3jLgBhW
 N9FREl2DlfL3hmoEy+KtByJeOqJ9tJpUu1e0s6ppyVfVkXk4i43uZxvIEgZvcYox9V5tz
 ZSSN3fVEgNXmv6HWTDhACGxLThGpJ71je0UoG00q54s4Ksj5+F+BIZjuRrWLCebaZPBfb
 v5p2EvNVuzG1rlRTyYYA1p6s7Zh+bDt5CRM+Z/QKjxn3o2wVSgZ2ppUGFVufSI2nLVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b="D2/WcG2m"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=D2/WcG2m
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 979B980C95
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 16:07:02 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5be53e5fce1so951409e87.1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792339620; x=1792944420;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=m8zk4XDe3nBR3Ahd25Myn8vBbxA6uZTnhzJXhchmPfQ=;
 b=D2/WcG2mL1piH/cU1Luy5S1ffDSqSjAgw6HMe2JN64EiY536NdqPfUOx5Ox/n7KH8/
 vwl5HHj8veRLZsjD9FkjhRZExGn5T4lG5CVRoBlImCi/O+tigokMynAwe3dwt7Yzn5e/
 fmyXqad1P0Eesh4lGWxqKPnfmFv47OgbG4Ld6t6z8vNHO7+rhs68Wz+BhFxZojrjOqpO
 bhk8DGnpm2Y1yKSQm+dUIeG7Uu9hPbfUkG5PvXDsGbBFUaeKulihB+kpAyD9BERnCzUA
 qpZbironglGO5SI8v0C/5XxwOhsTShbQCI5QByzfU8u7aHilamfiHM9iETB/T+ZzQMNt
 ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792339620; x=1792944420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m8zk4XDe3nBR3Ahd25Myn8vBbxA6uZTnhzJXhchmPfQ=;
 b=NwLKP4JYxwVwWFbyrT05OreVQHmLbsNAEOiZ6FOU9kjhIVtikuXjgfcUxLPPEoAmyo
 EkjhLyTbCTBQcU0KLiGc5rklapnRv24SHVGWst13a84LOw2+7xF3W1HoHEZZTvA3Xdm9
 glWBJTOXoayG0Omk2Q4plmTmUi+mRKVao1eD0S3GpP8nQrspAKRLc2TVYkZNjpqV2fL1
 +Bfm+BfSO2I0Ixdpj9c2wFKsohMn4EPlO1RnO+3dCZRzt0YrBKJv4IPzLe03cmDTdmNx
 yNBi/Szo6GdrhQlc/2qPANoFaKiZxDW70xAYtmT2d2iA8urTWQgfQwosnOkHJGqCtKI5
 Wi9g==
X-Gm-Message-State: AFq9FYLkQK6omsxrhK4eSuv/iAdzugPjWbp7daMYPKRkGi0/tTNpoquw
 NF473CLTIp0DRY+kHTkhsE2LfwZsPrSEg7kaczUQ7nFgmOFvxZ89IH415YCxUwXYccAkr062FFM
 LXALtdtI=
X-Gm-Gg: AYBFou2z4SnheBJDsDVEDiXiDQRRUBQQQNVMs8BM1B+WQ8H4cmo7GGjV57bBsXty5g1
 2AsLk7izmqd3Erv3lopox4su0hsHQzkOQ2wbcQjbYSg+NWMAy8K0TliY8tb/CfB016PnQn052fJ
 QyicSTC5qQn+FBesJA6eNrKTljAUBV4xH8+G9Ymjk4sf8VTDrqPvHrp6GSi4/zvtiwSYc4g8MPD
 qE9uPk//wLn1sI5dGdPgEvxG1WHYjg71OIr/ze2UhYiDKzxkqRMQe2cbEAFpnNAGPxu8VyACGye
 YYJh2PwJdRYaOYuOWkS3Zfp4+8CFW1YzoYbQqsab6nfhdtiaR0DzminQ5QWsH05aBPmxTqWBg9B
 lBzBrc/wf5lz9HH/gbMRKvZcQLaBKtVJ6yQMMWOvQoEdXt6qaU1b4GSY40c5QWEgfeBIV/+JLS8
 KAm9IyrVGp2XE1YEca/axtszs9oEOPNQ1ltOZzNEQewfe9QQxv0lqXUv8WRI/FDuI0rdkmDFAhr
 uCQ65c7+P7cWkLb+eqRWQHFyfHtzkwqz+JwG6TkEy0xHpZubNJSe1fSaw5hdbhS0C/Utumvyut5
 37ch+JEgkU0E
X-Received: by 2002:a05:6512:668c:20b0:5be:5199:402b with SMTP id
 2adb3069b0e04-5be51994051mr744025e87.12.1792339619493; 
 Sun, 18 Oct 2026 09:06:59 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5be4a42ade9sm1458976e87.14.2026.10.18.09.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2026 09:06:57 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <j@j-ernberg.se>, Adam Ford <aford173@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Oct 2026 18:06:51 +0200
Message-ID: <20261018160651.349981-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A package depending on libgl doesn't obtain all the provided features
of the package that libglvnd uses as a GL provider.

When building xorg-server with this configuration appended to the
x86_64_efi_defconfig:

    +BR2_PER_PACKAGE_DIRECTORIES=y
    +BR2_PACKAGE_LIBGLVND=y
    +BR2_PACKAGE_MESA3D=y
    +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
    +BR2_PACKAGE_MESA3D_OPENGL_GLX=y
    +BR2_PACKAGE_XORG7=y
    +BR2_PACKAGE_XSERVER_XORG_SERVER=y

The build will fail with the following error:

    configure: error: Package requirements (fixesproto >= 6.0
    damageproto >= 1.1 xcmiscproto >= 1.2.0 xtrans >= 1.3.5 bigreqsproto
    >= 1.1.0 xproto >= 7.0.31 randrproto >= 1.6.0 renderproto >= 0.11
    xextproto >= 7.2.99.901 inputproto >= 2.3.99.1 kbproto >= 1.0.3
    fontsproto >= 2.1.3 pixman-1 >= 0.27.2 videoproto recordproto >=
    1.13.99.1 resourceproto >= 1.2.0 xf86driproto >= 2.1.0 glproto >=
    1.4.17 dri >= 7.8.0 dri3proto presentproto >= 1.2 xineramaproto
    xkbfile  pixman-1 >= 0.27.2 xfont2 >= 2.0.0 xau xshmfence >= 1.1
    xdmcp) were not met:

    Package 'dri' not found

    Consider adjusting the PKG_CONFIG_PATH environment variable if you
    installed software in a non-standard prefix.

xwayland will fail with a similar error, not finding dri.

This is because dri.pc is in this configuration is provided by mesa3d,
but libgl is provided by libglvnd, which does not depend on mesa3d
(because mesa3d depends on libglvnd to build the interface used by
libglvnd).

If libglvnd is extended to cover the nvidia-driver, dri.pc would be
provided by mesa3d-headers.

It seems that only libgl usually needs this extra bit, so EGL and GLES
are left untouched.

Cc: Adam Ford <aford173@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

Previous approach adding mesa3d and mesa3d-headers conditionally to
xorg-server and xwayland was deemed incorrect [1].

RFC: Does this make sense, or should dri.pc providers be virtual
instead?

[1]: https://lore.kernel.org/buildroot/20260927204842.1113860-1-j@j-ernberg.se/
---
 package/libglvnd/Config.in    | 6 ++++++
 package/mesa3d/Config.in      | 3 +++
 package/opengl/libgl/libgl.mk | 9 +++++++++
 3 files changed, 18 insertions(+)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index f471e289bd..b0d8a4efcb 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -27,6 +27,12 @@ config BR2_PACKAGE_LIBGLVND_DISPATCH_GL
 	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_HAS_LIBGL
 
+# So far only GL dependant packages are known to need other parts of
+# the dispatch GL providers components (e.g. xorg-xserver)
+config BR2_PACKAGE_LIBGLVND_DISPATCH_GL_PROVIDER
+	string
+	depends on BR2_PACKAGE_LIBGLVND_DISPATCH_GL
+
 config BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
 	bool
 	select BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..fc99345e32 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -488,6 +488,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	help
 	  Enable GLX graphic acceleration (OpenGL + X11).
 
+config BR2_PACKAGE_LIBGLVND_DISPATCH_GL_PROVIDER
+	default "mesa3d" if BR2_PACKAGE_LIBGLVND && BR2_PACKAGE_LIBGLVND_DISPATCH_GL
+
 comment "OpenGL GLX support needs X11"
 	depends on !BR2_PACKAGE_XORG7
 
diff --git a/package/opengl/libgl/libgl.mk b/package/opengl/libgl/libgl.mk
index 7abc13d637..c747297ec0 100644
--- a/package/opengl/libgl/libgl.mk
+++ b/package/opengl/libgl/libgl.mk
@@ -4,4 +4,13 @@
 #
 ################################################################################
 
+# The dependency is for libgl consumers, not for the libglvnd package
+# as that creates a circular dependency since some providers need
+# libglvnd to build their compatible interfaces (e.g. mesa3d).
+ifeq ($(BR2_PACKAGE_LIBGLVND),y)
+ifneq ($(call qstrip,$(BR2_PACKAGE_LIBGLVND_DISPATCH_GL_PROVIDER)),)
+LIBGL_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_LIBGLVND_DISPATCH_GL_PROVIDER))
+endif
+endif
+
 $(eval $(virtual-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
