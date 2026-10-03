Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF04CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD123811AD;
	Sat,  3 Oct 2026 08:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg9_tHyoE94f; Sat,  3 Oct 2026 08:45:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EAFBF81086
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017102;
	b=eW4fsY7bxCVGjxZKl6iSUycvTtAfkouk50xX1MKVGWyUp2QUrXWy5i9qWWQH3lXTmN4P
	 wK+l4UxvETIn2GYRniB56eG3vd5EM3WfOngemNOREL11WEK1/sqhh+C9hqxy5Rvh9GfiC
	 X4A17vJNobybww/CsRoWlJSboPdIzF8e7kp5BIshnK2eV6sKCh/E1UgkmyMcmPnqlAD+C
	 3+dSR+Mssg+iBIAi6ao8MDv1Wd+IgyjRdAOkLF3q3XiNSeA/n7yi64JIil10dYZO7shna
	 k71gHDrN5HVfUhQ6Ltcam4iiSc+Um05DJ65DSzXoUq00Q+uUoiUpO+jVbyNs8PalQRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fUWP6/WiVi3YZkms8jK4wonRK1cLxwTvJf855OZm5wI=;
	b=P0MvW5JVAhAZMf/EOzSLnr2FRTgCtpY65TJ9kaFZ7ZmPBtjv2NW47KTJ9OOmKaNbVtri
	 VKwmClqtouXX3NZLA1AnHoUzvPtyrshEXaWpmtwIzIcd1U8rdd3ntLJI5ofQUIGodoinK
	 Jpjc45rQAXQfivyCcVbGnn6wwog1dTNQUZLhfUnfYBCID0UpI4gvV9lJh5oa6wSNENrr+
	 PsYhk9JG76yS8fjD5Hu7utAGc6V9Dat8u5ACMurrtoBcXtp89PDKkvc5s1ihw+VA2XYXA
	 SC98IHeP3Cs5q9zFJE2D6j2jUQUeny5K76phkfKJknCKl7erXDBCAa/ZJ61Q3OckeHw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QFu9h7CS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017102;
	bh=fUWP6/WiVi3YZkms8jK4wonRK1cLxwTvJf855OZm5wI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=n36tPRrt1iYwhGa50rdPYpfbw4gDnojLefel/pLYyJlGxg9tluKfm1cgJEMWlaexD
	 C8IXxdBzx4GegWvnNq7pSss56TnwS0NSh/0J1gkzcLc8S/r5OF4+bydyZnYdJhtGI2
	 HH2GKneLzLkeZzSxvF4YmaNejU85jAlM18+iD0+bK+hujZQDPon+UfczAxYhXe4pF4
	 xN2UoQ+sJzcC/u2wsvIMxjDuUShrFMIgj4lRl0IxYvejZzc/MPo1oFS03Bl6H4ygzO
	 tgAvMSb6Crz2W3Uq4FpItjHs/JbD/CUooOqVhy10yjrWXzobRxMQ+2aFURQLjrq2Gk
	 ZMrjh0EXew05w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFBF81086;
	Sat,  3 Oct 2026 08:45:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C66C72E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3AD981086
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoyvghdmSfHo for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E6D9581062
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017099;
 b=SzIjPFCpH7sztvFu3g9JNWSkJLHjzKkDkO+JgYvSKpWBvYTNBrRH+8j0otmRcGOwvRp6
 TML/aR1YGfLjrDsLzjTSSZP2NhCHrwXPWob5EsBoEh4ml/oTGuPprQzByKktCQ20dvSwY
 nnAcOAHni5Kor6aDBJalJNaD8RnVAEzs7z9TgMbCgPph0C3aUFmPnhF2CJ5Nf9BQDzN9N
 GVasxCJXVAaRxAdS4r7TOVV/d4atpHP2iSWo1Me6tXAC4LO1LISVwVMHJVfEk5iEnQECs
 JgOzGD+voIokQsNlhcEOS29lICAH+Yg+NjrA6G5mjzziKut1ZfymidjJ73tNLvSTq0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017099;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=jfetKY2vLSYgkzXI8KmoaRjN/lnsnT6bq/UehMIorh8=;
 b=Mshbu7sHkGDYvIB561u/vikJeXDS9KMTieKClwewkp913etzsiOyk/PDVkqLeEa/FVDk
 OC7BYofLtavUxltLQ143KF6bLQ8RbtPM5zFA2PHQnChBbaFWC5l3MSkOXnLbxjML+u9LD
 5AkoF+8AsJnSPxig26bkdOJTIrjRQPGZ/Y9JcKLFbUzpYZWC4xZNYUM+c7VL3W7gnJ24l
 t78Gsu63e3wkp/mkCEWUOJlRSm9DfGEyGoxyolnHnxb/wspGT8+Mu5O9Ex6hwEsFlBvFL
 uUC7Thi4c5V22jbFDUz54fp83m6R8JlVgD4bMO5toxUY/T68T6tkNNrnhFKcfXLTI5Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QFu9h7CS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::e;
 helo=mail-oo2-x0e.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QFu9h7CS
Received: from mail-oo2-x0e.google.com (mail-oo2-x0e.google.com
 [IPv6:2607:f8b0:4864:31::e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6D9581062
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:44:58 +0000 (UTC)
Received: by mail-oo2-x0e.google.com with SMTP id
 006d021491bc7-6d8709e0de8so283840eaf.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017097; x=1791621897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jfetKY2vLSYgkzXI8KmoaRjN/lnsnT6bq/UehMIorh8=;
 b=QFu9h7CSjOnL4R+r1TFdA631F07fBV3IXGJsGj6YtOGe329hvIPPyRwPdFlM4kIYWv
 rh4tnwfA6sYKkoFHM6x2FOFMv/EFqMa0Tt/Pfp5E4DdEBR2Z+pbLKSKlHg/YxDV6MZq6
 fKi2X+c9rPxLfa4DzmyLpL/bhUTyoo06L9Cg++zTDxTZg7UMaCOM0Bq0V7EDD64FYSd2
 b3f/+f8dmsi4tJlaxAdPO3EUiJpqxE8MDCmGc4MJ9R7Rcdkw+XrN8PAvpzkPtTKTnM4I
 R+1I4L97vrEpSK7MI1cNSFanlcRWuaGS7Fyt6OHms/zrDuNU6Ye6Wuh3fHb2FsVg9R2J
 iN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017097; x=1791621897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jfetKY2vLSYgkzXI8KmoaRjN/lnsnT6bq/UehMIorh8=;
 b=vQF6BVO908mOEDL/PkTPUoTA70LG8S2srsW2LaGEwkc5X9O5pSxle7ev5Zwg1gAfvE
 CLWPTHMATazXx9QzEUiFWAtVJ15Iaj8ZAwpMFnf1TOUzJrV5bJFfGkzs53mIZbV157Nk
 kzh1V1dv6wSphK6uTFf1+4GDJiz6DAlkl+X8sAWxBsocdxOMEkvlO+m6G0HYyYGkOkyZ
 KuLYoyyNFqNX8bqTsDZlLI530yaxfFQD7mkHvDc40Q9KIxNxxSu86oPcLZcNqxUJz8aS
 KtVI195Affy3RQ7pXc2HIbZTKtuxrAYPP9sfcpOFFnqKQxtkjnU8NxARrRjFla68eKoL
 la1g==
X-Gm-Message-State: AFuF++k5rRlg6ncSFTB5EyNEfvL+iGFNXphWBoRnFYUqYvu/lcuBMipZ
 EmUYE/Bqkzjw5M/8kPMKQXfKzmu+qCHxjLKazlSxc6ft/EC1bOUVKQs+4EruqA==
X-Gm-Gg: AYBFou0PlR8ZWkpqafoRK4Se5nbKTLlplWaHzaYkr7KKJFL77JFpD/8/8Z4dKDSX27d
 oWIqTStJuwZ7bAunfnC/oyxHMk79FFIl7dTn91W0tD4fU+9qAcCjGUbWZxC8R6BvM7H8IHHllXf
 P9hCaIFdj7s73G5yEnsdeWFx67EfoCORQGMNrIV+9rRdxQ4jrewaf7z3tGvMUNK4AQOyoWoMrsu
 3aHxPFlM26IX8rTjTXNC1MoLwfCAme393wX27LjQyiBkidHOKWhzQHC2JPVsjxufkmuI7H8HhaD
 cB3lRNjbigh6waDtwCgthvvuHs7z71kSwpR3DxS6MF75Bm8MH5nmYF0PBUYFaP/H/683vekJB1K
 Qhn0mluVnulnHgpIrzTn85tclKzqS5Hn4ic50DGgCgydIvjg9wej8UGKu3YIXYXP1rhnzcoFnvg
 oufOMmRotW8ILYZADmRWpSttk0N7AWGL37E+W2fFtPDCecpuCdCxe0cbIl7tbKt3ixWHNCDsXGT
 fhbVKFZPu4KNLCSIgB1AFHXvmLvDXv0Xk3BNWdHMwwWD9wKgss5Q46b739bGtx9FVcGt8bxS5F0
 HKY+aSZo2GQSlFpXzPiJrdbe/53L6oDTBAoyYLP9FfEXpCW0pMxV2snPrHMABZzR/mchhkhY1Dy
 l7Iw+Fpc2Rugd1pZix3ULhZCdFTVEvQtNkjnEPQNlaw==
X-Received: by 2002:a05:6820:c95:b0:6d7:8f37:8b97 with SMTP id
 006d021491bc7-6df3525b369mr3749177eaf.64.1791017097343; 
 Sat, 03 Oct 2026 01:44:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:44:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:47 -0600
Message-ID: <20261003084453.545653-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/python-babel/babel/commit/56c63caf50b18b152541b5dcafd51f645d867074

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 436e49a9bc..154c6ce306 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  726d2ed119255a011d248ac0c9caa24a  babel-2.17.0.tar.gz
-sha256  0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d  babel-2.17.0.tar.gz
+md5  b5ea9705c2ad6f8c630e4a66d3dd2cfa  babel-2.18.0.tar.gz
+sha256  b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c5750937c992d  babel-2.18.0.tar.gz
 # Locally computed sha256 checksums
-sha256  7801a84fe811279cb350bdb4fb18f94c36b18ef813fa6aac043b6c6d39484d0d  LICENSE
+sha256  86bad5758c7859ba06251f8f12eee885eca31369923dfb2b87a7c13c3634d870  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 57e372fc1a..659db0fd83 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.17.0
+PYTHON_BABEL_VERSION = 2.18.0
 PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/6b/d52e42361e1aa00709585ecc30b3f9684b3ab62530771402248b1b1d6240
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/b2/51899539b6ceeeb420d40ed3cd4b7a40519404f9baf3d4ac99dc413a834b
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
