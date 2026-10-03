Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E791CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F9981349;
	Sat,  3 Oct 2026 01:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4n_FGWVq2ki; Sat,  3 Oct 2026 01:33:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1C4338127B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991207;
	b=jU6P1ZQVySbq4kRt3UGbYD/8xjxNuqi3tF/jDDl0ZIZfoJKEJRaD5cga5LzEK4tMr5Vv
	 GjGe6wKmE88SHecF4J9VTSpLRnJ/CLa7FD22pDG4PU7+cMFvNwABVya0mUXClwZe/uFLj
	 ULEr9Dsa6IW5Rj2PtqaVbDZNN1Ce1pwYth3i00zsxQJQ7J7FK8EnbcchALtIhFbnecBOZ
	 IcapSxh7s0c8O/99Nkmzm0RpEqiwrmE6qTlZ+SaeYVth9JPxwBosA06gp1ZP2YW9bN9Sf
	 AvvloYB4v/1C4PRmgEXR3neDGS4lK3VHzxwiDLAz0MJaltF+kGYwov1OMB9HGBEz2ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OgCWhVI44wzFJWViYRS0cOY2/1ZfODOylg0ER7FtYaU=;
	b=ouLntDoeosb1TGc7SMDpdcHSWqicDUTcEERKNLhjyP0ShCgYaqYNebfV2d3ORUADqd0K
	 zTb8FtZA82yNW4UuhHEqKfh46BpO4Y8cUvQ9RORbvTvjBOo3UgqHnTPFhcI+Xh4BnchMA
	 C7BxZ92nRM5zIx1FWCl6BUjgYEwaxAliK6FGUq/pSfz+X4zNx2NYlSwLxEAfMdOxHjxUI
	 h8lHaSvX2+ucBbUWP6hX5PnCNUSW8zHSRHy8fE2kzylzQ9yUVsDGfsAlI7kJ2+n7n/jo+
	 qTdoDCEu++5nrxPmWebsBejY/ZZoUqB9KrUCVsWDra8P5S4XkmFbeKCuPM5fv2qiO4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991207;
	bh=OgCWhVI44wzFJWViYRS0cOY2/1ZfODOylg0ER7FtYaU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GW0zBInPvRHutpmJbKgzPMc1meefUVfqRE+2JvAtLj2THiia1XN6ABjy5/BweUnJ4
	 rBtum1nUSJrAxdif6Uhq0WU2EsfETFPxEWQlD4HWGtUt2qXl4W9xJfnmjL0fMFqtwe
	 8Qmlsn5Ivbg9+glT/GUzBVgVhQgNvBMxy/jF+mZXI0cPn8yf6uUNIpKkvDm8LLN1sn
	 cjzWcX/mjCgDwcumtjBq1pQfao57sR61DNhR9oX8M1jwz0KAQA2GpEmMrlhwv09e91
	 ZiPAb0zavFSsMRFdm2p9xbagJapF5oxjq1lPUFYptJ4wQAlffc6Low3PGTmT32qnyZ
	 KMQrz9uBZbuOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C4338127B;
	Sat,  3 Oct 2026 01:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6702D1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64F2F400F1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDzhQz3nD_Hp for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8B5EB400C8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991204;
 b=lUTEElpfl1ss1N2+THW4h63G1uypfp5aaSDyi2SCfvrG3S4ZvypcMy3yg4s/yFxFVfhU
 oh+UmKgamXGXVlYv6zk67yABE8ZO61w23CptVjyiNZwGgUDvlv3B6wSwMouGJr4zgvrR/
 98smmf6ltvnYa+tvAwjl92cwGsjrUrqdN0a65cRDCBkYTYJNwlNwA3B4MbcGu+zUvr6TU
 y3uo4loMQL3h/pTgH04J3K2/zC9BUVIXZMdQ0Q6O0W3y6GsikNo5xHOe0FN/mF+QKHYQq
 K1J4MBztsrafF0JJ5ixmrS9cAIFvo8SCUTaYiV4Cz8jzVU32JOmKEx/JnBdKP5BHruw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991204;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/pYfUiJTHM8lP0FyDJoa/aukDskp5R2d/6vTMZ5D5lk=;
 b=OSoSrayc2y6jWX64h+YHfMRis1zJRcWpCBoQ4ibCR/WnQdZ4fWjq85XqFT/msqzWIDeh
 00WhsCv+votnR/YNfpZWTo5z+MFW1wYyzGn4/QfVKOJrYJHLAssoeWQA2AEpQRctNrxtE
 VpFMJWtBH/a9jj2QQHCCt19lGAii221O0OfJfdnHtHtQqb3GW4wpUMa1QyHx75bNUeqiP
 k5Zv1aKBwQjDTkzw5Qw703t7+rjkmSwRTCOPrhpWY4EMcIzPWS8HHWjA2xxIrpptQcoB4
 aq7pAp3Kc4bnVZXpS9pJcnC2WRl5lx6eUCkMdCeNqawtKrBEmBOkUurJIDsOsZhvKbw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kHyFmL6G; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=kHyFmL6G
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B5EB400C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:24 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6dde81a6820so272942eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991203; x=1791596003; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/pYfUiJTHM8lP0FyDJoa/aukDskp5R2d/6vTMZ5D5lk=;
 b=kHyFmL6GQA7m6ARrCKTMshNWNoIk5Juq3jfwF409rdaB1xkT8W/VTMGDPIU927ZkGm
 o1fyXsbUdf0k8cJGY1Mu9JaTn4SUGDXTJErDnC2UOmxwFFv04DO+HjZSiJ1JfDy1jJy7
 ANCk4cOAVcbLhTyRdm3iKIZKTPCr+4G7kCw7DRYdmC8oGoxrwohfl8Wgd02tzpfu7CHk
 /WJTT5eEwo7xQJHVCbliK5TPVku6LSnlRZDHNCUrjINLrrzGvPKQusF+YaUbQYhntjd9
 y4iMXE3dZtp7GKgo6ODi0HqCpZZp/clunIJFVFAB+8qHGxRIrH6Xk2/V1W92cPbkyNoQ
 KfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991203; x=1791596003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/pYfUiJTHM8lP0FyDJoa/aukDskp5R2d/6vTMZ5D5lk=;
 b=Nlp8fM6Mre08/DRj96LvxQHvP6dHj/lLecawqKXNlB22QJPxHdPTloWkgCrd6KrFKX
 /glnihVq+Inv9WBaRB2lqI2/GLHE+uMLMpDGuxaZMgLOuhGtuErT4E+GwkKZwcDbeq8O
 zpivzwdi5Kvy3BYfEOcQ7E+5ZgOkhEx8RjaS3A7GaAcWVg2IG1ahs+T9ZdlemFL7DAQ+
 kyPPbscucJuEzmwwAIfifTchOE+oHzM5ZUqIqTAoFCVcLAF3S7aj+ON8yzwVGjxta/j/
 TLY1cV9HpxvHr3XvaRmaE+LJe3hoglrrdAamxSSoiop7aCPamIwJ/Jl7lFP4bSeN3DUh
 GSBw==
X-Gm-Message-State: AFuF++m8hIFysd4MsUpwLm+A2i0InTEZb4mhBv58ulRkPEQZova42VIZ
 1gnsSdLsnHa5UclJzGh7BS5vN4P4RN6H+zvd+aRHMvp2fWYcFPdClI5fqVWrkw==
X-Gm-Gg: AYBFou3P/ewpOdoD5O6goQh6sl9x7QqQEBe5UvWyWSi4ZTRRSwM+3e3jLAiyfQWnqX8
 3X1Oj0+ICskP4PUdG4vSkdzwQtvh+yOJ5v6rsbBACYXe8zR27eW/BRJrEa39wQRjhsGD3FzH/gF
 26RS79CnuqPABbvL8bomwTsmuligqVSGcZ/4Eje/+nBNTdJToxAaq6OmccG89MxCN6YARP8SjE+
 xVRXa0TriYHPf4ccm+sabpS3ap/zhv1pRoelNkNN0XtJ3XyJCv3BCD7ihQsNTMmLCEneEHOm4jt
 lUXjaeqsyRbP8A9s/6KkxwGywkTVasMSdU39Jxff3CbT/qZa4IzdltEwgULrx4ZpmUy16wvz0xQ
 qZ1TXgafQ/1/6G9JcNGWHuUwMrZDGp/z0Y9h1X+c0Evhw0Ia8ffwNHndk2jlx6mPyoYelq0EdSE
 wtEEH+hC9iolaq7LOKE+OFvNBLkaJ3sphUh51j+We/F1EwgqqTqVJ0Kc0GLCrq7SubJ2L3BObRm
 Kd1g/zfSUQjxC/N9QLBlKDzD6W0DgXuw3x57bBiDWDPNgyIMk3+DAODEWpb6riYF9rkXwV2nrgg
 bt0fGhHuAcqJyKM/XTs46PWvuhwmhAtxmYWMyIo9sfDg+dGXXIGf7jSnaotgle1+UZZMCgbDIBD
 t9gtNz5OKGIYynbQGKpfK7gHACn9PoLT7FaMRLMcz0w==
X-Received: by 2002:a05:6820:4dc9:b0:6d9:4c33:6504 with SMTP id
 006d021491bc7-6e09eb60ba7mr883214eaf.68.1790991203133; 
 Fri, 02 Oct 2026 18:33:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:11 -0600
Message-ID: <20261003013304.400979-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-installer: bump to version
 1.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index dbea06738d..0a4c9f6dd6 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  fdf6be7db2ab6fdfbfacfdb208abc33a  installer-1.0.0.tar.gz
-sha256  c6d691331621cf3fec4822f5c6f83cab3705f79b316225dc454127411677c71f  installer-1.0.0.tar.gz
+md5  c919fdc746e46b0a93ae53ed375e047f  installer-1.0.1.tar.gz
+sha256  052c7fc3721d54c696e2dea019be67539d7b144e924f559f54beb3121831c364  installer-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 22b79ec464..20cf1cb744 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 1.0.0
+PYTHON_INSTALLER_VERSION = 1.0.1
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/5f/ef/230b70e66db6ab01d5cbb93329688ed1f06b2b0618a74925e36384ff0fba
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/06/fe/b9f481cf0cc867958a21338baa900357b7b7d86cac9b025948049d77923c
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
