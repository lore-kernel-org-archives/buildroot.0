Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BBACA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F2960DA5;
	Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MY7acOTav3Ue; Sat,  3 Oct 2026 01:48:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 408AC60666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992134;
	b=pGzTw5AKq9tKLqnhmQlS8v7PCzxz4Eno2V3o8fVy7lSOmgBSqNiLyCtsei417mTqGdcU
	 L2lngIcznDkMjwRY9EMMNwmiltOKSRnSVtHd22UUcSmdbv3ZAbS11ExRbOa76b0Y2Wb39
	 VblAl2SBr0rtuwvlW4bIE1zylvnjW+BYsO6JudqSIXTTmLenVfRjPSTp+2dGw3a2B3rkB
	 KRG47a5PS/ra/tRw+LvA2uJ0WcXSFmExiBBoZIG0TWoiZzEwgPplG0Vyfs889Rk8OMuO+
	 scSb66qrmw5+kYKZWUjtqDIjY44t3plgUsTY+wDcQMceUnF69Htf3cuJRv1GrSWYAng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sPPTUZ3Y4fzDkm4rWElwgnf6cDLY9S4wZDfMdlv0Ums=;
	b=K/+JaDCB7ttcHUIuhOufg68qwvRws3ZxQY3D39zog4b5aPfvnJOou1ZqgsJEYrpW6PS5
	 D8lyCUytqeIBz42Nb77/akhczXkaC7LI4pO9F18ywZ9xZqlO36yd1jau/BppoX5FzWK21
	 jZxY6b7DdA1cCFv+Otu3w0kqiLXxCtqFPQTkfeQ/7NyIb8NguMQAGpbDulguGpn0lMu5F
	 5LZdSNBcSQY+6/DObDTBqGnIMg7j0zlQkHGqwcClE7SGA/uLSq6AGz3xJoxoW8QdK2kz4
	 SEJ9zt/OmW1v4yp6JxHPWFUVidZ/dQ/4gje3D+EayAL/5kr44MNoDtJoZrvkjtqz/Kw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dhW4SfQd;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992134;
	bh=sPPTUZ3Y4fzDkm4rWElwgnf6cDLY9S4wZDfMdlv0Ums=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LSbYt1+4hbS0tgxRAqlbQxg8Wt6lhHCG8aS91OIuXl2upLme6vq6ZCuXqL8qtKZiV
	 ORGIU+W7GWFwe6w2Ly5r2JNRP1JFvb5DOBSD2IfvveQsjVZtG0J3JhCn9EXmBipS15
	 56ujRkxX/RMseZxlJMyYrs0M21NKgGUtYC6O1rZhSVnOYhKq0+BRcNHYvxP4F9pUW7
	 2etq8EVzma8dN1fpgoDP2FdhwcXAqp3hFTdmnOqkuYdlufhOHoqy7uQ18cUOTfbABQ
	 JKFYrN7C/W7619oXfZe8z05uiCYtV1pbe5WzEkyjxIBcjeY0w+K/X1OGLdElzj/yDW
	 3Sgfnb0IuHCcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 408AC60666;
	Sat,  3 Oct 2026 01:48:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4051D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A315660DA9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpDsDJCp4Z_o for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C176160DA5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992131;
 b=qB1xB7rHdDahvWjeR7/dKu8EPJADILePsmKa2zN/HpI/Gx00gerRZFL1jLVIXO4D7Bgp
 NgShR3V3d7vGwpI73rJPCK1L7i9jRFJSCSnOc82XjseeU+GzvrCBkERaRV4C4iFWh3cDN
 zuO7N79TVZH7UvPjj1p7Iq0eYlSRQnVQmxT8I5Aac3lEC4bGG3hNOalXbTqSg7GMgRE6D
 9/IabSjg2Z57QaGaHcPIbwUblrnrRoosjgk2X16G9KHO2Ph+Eso10Erqjt30OPyFub8Z5
 RcE0gbdZpYbwIvvCr8pElZqWYymH9TBbiGImThjc4ifBiihFcRaO2pGRipfCmg1kP0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992131;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=b50kEzF5G/JRqZzlRZXHJxiTt8VR5J/EI/MlK5NbV3o=;
 b=Fn2pnIJt8Q27nQcaSlpBh5bQ/omRKJ4zWfZdozpGHyTJ8LnYTyHZE7HX94RbVkvMkdy6
 rtdKwie49j4tz78XE5vaDDMGxzTg4boQ+8jvQQF7wRyg5tMkZ0YRAJybKb0f3Y2v0wnGk
 S/a+DPo1y7dSd50kgIKY0WMSey/RHzBtzY/ehNAlrsCU2kHnb6lTMTnasDcY2O+DkdxRc
 CBuFf+Tz9qYSZizJ84evQLDZVgnmUdX0bJo3dc1qJVnfPzeTqd0aMC5xxrLFkzNJCGFlg
 rDkXsUIuvDWZCTKiSKWNJpew+x+lKKjDLt9ugfoHGBxanQcBTeb1Ig26YdfpJ0GJMmA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dhW4SfQd; 
 arc=none smtp.remote-ip="2607:f8b0:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:30::10; helo=mail-oa2-x10.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dhW4SfQd
Received: from mail-oa2-x10.google.com (mail-oa2-x10.google.com
 [IPv6:2607:f8b0:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C176160DA5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:50 +0000 (UTC)
Received: by mail-oa2-x10.google.com with SMTP id
 586e51a60fabf-466ccde2b71so82194fac.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992129; x=1791596929; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b50kEzF5G/JRqZzlRZXHJxiTt8VR5J/EI/MlK5NbV3o=;
 b=dhW4SfQdJku31a1HpH1snQCP61W+odg5U5VvhmjFQr9s6BWwCbRjyozSalHGwPa6am
 VOnmZygI6sj9XKNNS1vxoFDL6yMkoImj15+Odwp5thmc7O2wy2BQFkuqBInF1IutWAPG
 qUm2qFidZUDo93Z420RD8b5wzJFnG9slPiAQEfuL5YW7WVpEFpUN6TbKJu/wRfxnf+1a
 05dtduydZ+xEcCbhh4rnoOyP42zCVISdbTPqu+MQvEkrcq9ImQK36PO4xYJSbKs0Q/rc
 VcDQCF6y6Ib6GI4rHrtDIdMipvOI+hOHjvqZNgR3WGSTDQCEzpTyPxKcwdmtwFVQgf1i
 1WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992129; x=1791596929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b50kEzF5G/JRqZzlRZXHJxiTt8VR5J/EI/MlK5NbV3o=;
 b=SwOKovCCfZDhTQNlXxoaST8I7xoK9YwROWAuFcEZT1QmBiRHHeP6MQNx2PB0ChY/sL
 Y0PnTBlvW8oRMIY+tl1LC3dkNEPUx0xMeJ0C7A7yvL/VyV6fcB5JJb6u/idose1DKq2g
 yaqdQGsHE9SreAqL1tUprCzwOUlDDRtbwccvWc+9iXBrd6FTJ6NiIWBTYTudbit4GolH
 m8gypxeet7wHtP++tXKl20UG0of7rYF/iq6+vFjlLSqcvcqfTwjOEkWjJFgcx+hy+/mI
 MQzTavyDygssMOaIgrAHoO/PPXIc+zw0IkW1YpRFuP890FG0kji6tzO3NE5loIvPyVip
 DREw==
X-Gm-Message-State: AFuF++nB8eu+mVi83DIvCNjb+8z6YotPqqdohx1Qg6ZbcU5oVCa8z/5a
 RtLniRXH+yElPD/Yd+cDSqkvUihLbEiGEXnyF+5h5lpXqkiVpwrQYu0G86TlfQ==
X-Gm-Gg: AYBFou0K7bQhmOJwqXXDkjyfU8av7W0mjrSzelbanZcn9hpvN/w+uvKDgTUobG4rVaA
 rvq7sHXR+Ni5pBkJHyD3KlQIli0coDrdbTIwVzYj8NTY17bAMs8v5eLH+6Q/TDGn1aNLJoEvdjA
 tECvvPpWOhTyxywSTEEq4OmWHO15owWsseeu/tSfC4XsLePuGMMpogbLE6yTJw/gNJQ4XB3o100
 TTc4pGXu+Ty+F5HSY63BWPb2e/ZirstX9kbFDE7i+Qd74RC+PmoduY3ENvGs8TWez5xZ7/PJNNG
 s0seCjcPy4Xgerrs/Brt88rJuCSrNXLlOBNLfcpY572GgxHa+T4QFMspfYbKAU6c2ZjFPFrtJF8
 ORywKKl5QoqQ/VDAstUqINmroPVE1m7PTKzrFVia4KIFW+07Dp8ISznksujyWFvoSf0lVSlPIiK
 Uq2q9BbYw6y0hXdqjAi9Ib4SJRtny3jftgtKVqilMCK8nokELVxOssNiAXAW2GTMQYYMw2bjRd+
 79E2UT9XEa5RYrL2Y2ixHRyWd7bMPb+C+GUAbdbVmlS9AEUK1C35iB6kbG/CKWxm5t1LXx6QOGu
 h9+GFUvUtpH/KKYyfDlUUnAta8z8X5UI6r4uOOVTMVn5ni24ZTGzaznYxcmiVXneC4p6HuXrlnz
 NzOmZfVhXNo/yitOoKTKER/pmYR1sJb5lrjoG1BmPqWE=
X-Received: by 2002:a05:6870:d1c7:b0:494:7435:ebd4 with SMTP id
 586e51a60fabf-49e15f34681mr4010427fac.34.1790992129438; 
 Fri, 02 Oct 2026 18:48:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:25 -0600
Message-ID: <20261003014837.403895-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.4.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/sqlalchemy/mako/commit/155f9568dfd5e46b8325b8fd466227dcedf07202

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index a6aa68ee34..39bfca8cac 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  92390c7e8897e69da67a593a96e88c71  mako-1.3.12.tar.gz
-sha256  9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a  mako-1.3.12.tar.gz
+md5  4b7555300a75b951bf99aa067cbb3633  mako-1.4.3.tar.gz
+sha256  cd6537fe88d5fec315c55c2f8529bc4ce7a9a352ad7db3eeaa6a66e2dd4ec37a  mako-1.4.3.tar.gz
 # Locally computed sha256 checksums
-sha256  68d7064e53e3ffa8e9f420a9e604bd2e2059d9c330492fa6ebd4eb3d48111689  LICENSE
+sha256  8c1d171bc5d341ad9cd33d5e2c39b96a82c7bd49b3ae89a470c37e5822232054  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 0f52fa2185..c008967bd8 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.12
+PYTHON_MAKO_VERSION = 1.4.3
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/00/62/791b31e69ae182791ec67f04850f2f062716bbd205483d63a215f3e062d3
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/5a/09/e07c4b5579a79f4b16f8d4f29f6c54514ac787c4ad506b8c4f28a0e6b0bf
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
