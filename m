Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02137CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4266605D9;
	Sat,  3 Oct 2026 07:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDYtnqiO2L7E; Sat,  3 Oct 2026 07:21:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C4E8260DBC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012101;
	b=gugLdmNVxjx6Yg/4wSAYv3ZJprb7Pz1lQqbcdvCDHOsGxNMsu4Bt5YkcY3GFiJmWV0YJ
	 4njZjsw8z8dBnPv54u9Fgh59sYpKFC4G0eoZSHaGcL482MaJLQaEXdald6FHJ9dK96qnm
	 alKkISB+hCGComJbDSgg7CJPiHkKBJ+CNOKnkYkPJ83xerRSLV3dyX5uy+DlzFa2uOkzb
	 gA3J1IYvfbqTYwX0PtjrSnScmVxD9fOkKJOFnVaJwQeJSDQh9n7WOP0zv4u789YHYjHOI
	 6bQ+jkV2vXzsKO1xKagEIex+I6pdPl5AcLrpJ2W6R7IoX/8Uj9jBBnUQbZI97+4L8oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mJejfjsbfylSWCAmOdx3/FYU203+yMa8xHL9bY9MPr4=;
	b=S1D8QzMXnJLhcR9/cHeV1vwww/aNtKFSAEucDxh8SG1mlKb75pi13H4Ivf16el65aKDf
	 7lG1+Ltw3Fd52GL5QF+4ayyVIy9ocSoVGrOqQxZfvH/70VpZTELB46IowrXmxTvu4ZkGi
	 LacQKLonnD7Plqz+E5kG1FY6FVIF60y4pbdM/Cx/H4Y0a2oaY48A/x3BVSR2XZqHl+U5O
	 c7N8XLuPAff8Y6tyL0GGGcwXQPJITUHHaHnYg58mPsvircdaxdgEhNqcLQqZswjRRkjiI
	 gaOffiD/CezkWtyzv+3xvtUHNP31NlxRrfAEySlSquQcbZt5bT5KMhfObiH7JXPX9Rw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012101;
	bh=mJejfjsbfylSWCAmOdx3/FYU203+yMa8xHL9bY9MPr4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GKF1VqrkJKBQf8IxV3iRANwHL8CXkr97ZQj9mHsmZXvhOo8tXt77BLlJC6vsiQxPP
	 HloXeF0o/ha4ydSG1AF9ajqKUMpb0QXUl/7jF/MYirvSRswZ9khP+cWkZKJNw1rhYz
	 dBMTj7mVLx6onCR/XVWFJs1GanbTCXy4MfND0evFSDqy8P17cIBGREZ4Jk/kCACzqd
	 hZPKW5qcy4vqJcqzHXu2PTgg+PlV4sPEEwkpJsG2PiTBGssbtVnuztZHkIYTt281uZ
	 kD+anghMXlV/xcCMncPb/HtWMsVU4dZebYmjFbSW7cYwLqyee1YS5P+Us+sGegdVCE
	 hJ4DDeNInCBAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E8260DBC;
	Sat,  3 Oct 2026 07:21:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8B20179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAC9240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6gfA_ftFbdv for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:21:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CCFB440050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012099;
 b=C2si2dryS9K4vdTTm4zcVCE5XCxTIXEMQYhwHKB4SmQDm4hMl+bsIAu1ryKhpxt79aOq
 KGQZ12shU4mReg7AO29HjoLpRbceMo+aQpRL6O9WX3r2dJjXS5qReELCk5w40k2Sj9Jgj
 VOKx9YBH1d5ihqvmokZ3XjXp++uZ6ym6tnq3eXQu+5UPEDIZFy7rwGkBOh2yl7FRFzoha
 uI5CnM9I6r21Q+2zPPC3V2+Xc4XXihbtqLJAQ8S+wUsHR9Qub/XqISE3u/6f0VD95vsbf
 dnH5B1j1CrJ+inrg+s3pzvVkBySEiu290OZBbWKQlx0YHMQGg1gh+/VWDpaWrlA3nyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012099;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8uJqCj2oD2KzUp3YFKcBzlzwn5BGduUoctisyK43ZDI=;
 b=Rcu65Gp8MKZC0vFKSy/NBuxsj/CVh171nu6ED8rl7Myvtn7FF48BFrXGGlfLmsa5uy4e
 Ju5U/TgnDNwIh0cytrVxa5qO6WA/G9UDXZTtM1XzsCKYvtVsrzP2JJdYJAITr9O1brjCb
 gKMcdWTesDcJpqlSOKjMPQrP8AxzwdT6oqUFXDR15Tst9C/24SmqhIS2XwDmR4UHSnOOd
 898leZVPORhM8hQ5sKOtbgbGjC4myQHmvm8DbYvPgnKu0PXayN/pf3Oddw7jAxnsk1mUx
 TJA49vPCzyvBFnKBAdkO1v4iC57dmpov5SHnik2lQL7Kto8z6sWm5N3IGTA+f4Eborw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mx2BmsaC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mx2BmsaC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCFB440050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010940;
 bh=8uJqCj2oD2KzUp3YFKcBzlzwn5BGduUoctisyK43ZDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mx2BmsaCW2w2q/INk+md0WuYuX1QDET8AAgrhvCD9W8/i1dGiODx8vQMlk9O3WpKj
 0tE3I6XEG6QZwvjgtv5P7weu/fXuX5pVFP0G6PPGeBKqKk0oqFwScFsJjnORSqzU//
 JyXB4LodjFxfEHalD9hfYpYrntKSRIAh5p2TGmXxVsMf0rV7+VqNzLNqdUSVthV3Ri
 cYDp6g/wp+ggifxu7qgebn4wCl6B971rT8DGePOUJIln5jz6Cob4Iopa9dFf+CZxdK
 jz2Sa/+Lf1/gdsJlSvxB8uxJE4fLIbQ3CIlCVmFYZiHqHwBUnfhqRaLHDZvNQXqaS2
 3AV1IS+XADFTg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 5aQcmxqTB9T2jYUvAeudyJ/MkGVF42HfwxmkYqVNb2g+kw229p8CgJ5v/18xLf6Ol/F4OlIVc4e
 agBNtD9FrHcLCel0EJZTrDZdbM8sDOZPJaGHCHtHeNGzbQskaaCmifeTA5HoTsFLPTAfRXBBScJ
 O0vNJXoAoa0KfCqDmah9Y2hKckNesyH8WKOT7xbILIuANu6wcShUFa598exJAtlkrb5B8Z3V+7h
 dLNYCLBay4LHjHC596ZZF7nFDtWRpPabFIa62UFDf2/jKdfkRosxfR4godZFSz0bQGPNebAIMqp
 0LYiADgRcI9NTq8v68SavGbZbIjaGruNFV+j+HSHvJc2ZZaT8nR+/Ri27Kf4adbYTZzS3bUC5xN
 tMXGssChYjug1wfgjyjMNRJr5ZQPAHZjvliTAg0T1sZI/W9AUwaFkOzbeW4hJbrGwAD47lngyHA
 TqaGBdDYoG5NndnBz0KMNCW+raFWgytmsV3+32BxeGlub3WlbfCLxvodhFXQZJfESwswgRZKvhL
 tJBjZTq/rqZLbDruJong7ok/jZqTssnCRcSRvPfNqbBFm86CQq2cDR0Qb8hqvZ+FWA7fjL/BOml
 tgd8whKNOeqGKQ+KvKLpagY/7lJtOgFEPnLmenrB8E4Kf20Nk3kTtKrzsiQx4jk=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 807DEA4C5516;
 Sat,  3 Oct 2026 09:02:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-3Itq;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:07 +0200
Message-ID: <20261003070128.1295458-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 035/114] package/python-iterable-io: bump
 version to 1.0.4
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

https://github.com/pR0Ps/iterable-io/blob/v1.0.4/CHANGELOG.md

Upstream switched to hatch:
https://github.com/pR0Ps/iterable-io/commit/07fc1f02298ad9aec22da3e65382c6c7cf6673d4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-iterable-io/python-iterable-io.hash | 4 ++--
 package/python-iterable-io/python-iterable-io.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
index 1407153935..2bbeebccb1 100644
--- a/package/python-iterable-io/python-iterable-io.hash
+++ b/package/python-iterable-io/python-iterable-io.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iterable-io/json
-md5  242753419dc0cfbf09bd0fc0fa09e322  iterable_io-1.0.1.tar.gz
-sha256  55db222c5914097a8508dc722f8db6112f636a04a8acb94ee6589d9b14bd4bb7  iterable_io-1.0.1.tar.gz
+md5  107eec70d227ae73ae6d285a6396550e  iterable_io-1.0.4.tar.gz
+sha256  63b5b394aedbc61b4409a0d213130a4d153c602d1eac9dcff860a43ae0340405  iterable_io-1.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  1965c87639963d053bce1b662b86e04ce22f53d2c39f39ee416745b1fa9e6b2f  README.md
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
index 485dcc9231..96c4712265 100644
--- a/package/python-iterable-io/python-iterable-io.mk
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ITERABLE_IO_VERSION = 1.0.1
+PYTHON_ITERABLE_IO_VERSION = 1.0.4
 PYTHON_ITERABLE_IO_SOURCE = iterable_io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
-PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/9e/ad/cc53869e3357520033e3ab9a7d6043045bcdd666da427583678efdbb446e
-PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
+PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/0f/c5/c3578d4ebc1f0e80c1a321b9f81a74c4486a6ad48e2a3dd1d228e3ba6199
+PYTHON_ITERABLE_IO_SETUP_TYPE = hatch
 PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
 PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
