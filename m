Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC316CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25A74080D;
	Sat,  3 Oct 2026 07:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkKq8NuwT9-T; Sat,  3 Oct 2026 07:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D501C4082C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010948;
	b=OM3Jo3whcceHQfyombdggyxHJWxuLCN5PJ7FgiX7G38ZtFDBFXQ5Iad0xpAPEN9yC7iS
	 UthmNim9F5KjhQKBGebhuXmJDSxHOVcXcfOCH1MLHaatRdOHGsiZMXJnp5HP5w3BDKGcR
	 OkgvNZoLM7LFww9gz9GWUWY8YiyszXs9JmVP0yIlj1c92U4w0WtwdbAcPxaaae9wZSDLs
	 fE1AtsdMNUHWBkXeWr55y7p/bJpMB22oD/mnDqH6f/vn7/ZBzMhJffhZdTcX172reT/c6
	 OBceoMNIc+R8kyOo3NmDt6t2GwhLeS9ZzDXH4IHi4Zb1O1FT84QvZgEwj/zShMElSbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MeBbST8T80wI17oZ74zNPuT8tkSRgM4wi3y7r2eLozQ=;
	b=HBugkGkMhkAsHHBteRuJEucgPDWtz4XqrcI8eeKZH95zOIV7f4J28gOA0gJXBJqndbCO
	 8RJb/T7/8oFocrdgwTvQjsD9lua0El87Ullqtz4zz3Z0CC0aA4Twi5wvlBpfSOQ7dSPfH
	 MjXVvpmmTDgiejTCZhVIg/5WSUwkT8oCLOHlbMSvdyLY+E/7afshsn/DYliEZaZQblQko
	 yzkPpW/LNErlTXRhSctyznbOhHDyM/s14zJueITivzOYYmcAdQM4jmoi6im9XHc7rXy11
	 i+u0W/Lcz6nmEIfKy6GsUNVecQMthKJ4bjt+oLV1iyXnErf6HtNaYcmfPvRPqD2eolw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Pkm9JvlX;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010947;
	bh=MeBbST8T80wI17oZ74zNPuT8tkSRgM4wi3y7r2eLozQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oZEb4dCo8W0uSw3dhoVzIA8FnaBYEvF6gdtCn2YVu0PgLxpRMrfyzVIdQDbx31w+y
	 7lFv4IkKTqgSc7RNrFzVrybTiAFG8Iv3TBPDQZUJ3xoXhai2ANlBuMCP2YbImF3mNa
	 uNJb9YuPs2erjiIHt8HzYB13tCaWvQ14YwoyM5jy5fCH+vzAJ/vkNNIPXVPocc77U8
	 l+M2d6J4TLWVmJW+XgHMgZOMJ1OUJq1kB4+OtuFLik4n2i/sio783E+v/h3MMbOgZ4
	 czgSCshXXLuopqgQdFBY5GqbSOk3u1OY+zBXAJE3ZE5U11IoWKLAZgU/uotFTE+qt2
	 hDcXsBhoc6qpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D501C4082C;
	Sat,  3 Oct 2026 07:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 700AD2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 617964080D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1NDEMAef6om for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:02:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7D33B40722
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010945;
 b=Ci9eEmm/IXRpumdVCzTuo3FSw6ALGK5hds33pceNOP8HPbUd1dE6QHlB7zimNsSI4tam
 5OeP3tby5hnMNuvrK4IGrECFVwUCkBbODh+dYaYtgL6TGawkPn5a0pMptSuWhrRLoFzgH
 1b11DWMkbYqhXqqVLHUg0sacuIMmhJMH6I9IMU6pK+9XNKearmrJ7bPQ7NYU7sVSJ1U+Y
 3YScLnQ+yw9MSzOgQs6UMHYTy5NZVMHUQKODInspiagG6FC0UkKkLWN5DCk0ep8bnU0dG
 XoXmBF+xMSmLYfgUANYmrh97cOSfN/txMg3nWzmu+nbo7zfanoily2UQtR5lqchJSoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010945;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IxPP8XvoOzULCQPVKkopm6DZjvo2gdHY7iFUXzAHf/c=;
 b=DrLpzWVieZbSYpCywHqsfEF+2+r7nZ8yQjx0K+5Mah9x7FiuMvgDk8/StgtKrLa2cDnn
 ywQ+1VqcLTyZqQM16o5OZQgwHYYabzzhORibOOrCoYI7QV7iwID9QS4T2jnXVpYdks8RG
 npYX+IOGBuJFk7vkhHAIKn9dhWfam10guLJRI1MkExhiv0yhfSjcJX94t3Yf2g6sWoji9
 gqJ47pzo4DOha6/pQWywzNvwg+QybYU0l9YqDUxMldRUsHf7Nt7Mwmh0V/NBbz6T0f6vZ
 uTKZrP7BOeRD02bjAuAN4b1FvecjfoWWHATup/LhoCUWj2FBd4xYeTdu6A73o9EZGtw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Pkm9JvlX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Pkm9JvlX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D33B40722
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010921;
 bh=IxPP8XvoOzULCQPVKkopm6DZjvo2gdHY7iFUXzAHf/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Pkm9JvlXxSDjx/qjxeXCXHUlfaFwgAdT8OMnqjvj/HiVlH1u2wr2gY7q5cKQqxTk/
 nLxYyDr5UkFBKnSneiwOkz/dTBZpdFVnO2IK+MegzD4/J+KCaXP4YLD18fGLVHmbSn
 bKnVdQepisCFWMzcE5h63eZWZznDYue5xbjce/mbgG1BtzMgYwq/VuXqMXRXgb2znc
 a5XTmrbLLFgg2n3a3iZGx6JU31CnKN3RkvJGXcxLvinMPljSLy2s6wzYBysAxU21fY
 8EG6wg/nzj7aaZ92KySiTGnswuqDV+HJZ1L3fk/05kqI1A8/3jHRnKovpEkXbvYjKE
 pk53tMXvgqjGw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 hFYBBqrf6vwgiK7BMhwKGJjVYm6CuIkpILhkseKEkONxyeCkDUyRxZ1OjmtRT/p8Ca4Z0Lkwg4a
 kdL9RIbhzzeDJruyOwZMM4G3bSmFdB0NRf9kB19NpNttbOgK6QUpqB9NgSBlypHPmIngE+2fSnU
 GaUVvPvoDAZhUgYdPOrghyY5rwoqZ9cdYHdjnvlCTRS799DBPm6LgY6YskYLSayAr7yz4265ODk
 BrjejlpNOGAQ+HajtAl0NivmMh4lIkZKO291oUbaMT6l2tgocWPZzw2f3xstvXjN4Q2lyC694aJ
 77+qC+xvOaNu8+YgLRSR7PCVOIyXZALcZouo1bmvuayezbJtnmeknRUJu6L6ISEiHq0+daCbdhg
 6jpSB3QO0SHmpKzEtdcTsDRKFYVYeTUUHkrWEfj+VBicQpRxuj8xtEcp5de2WLRgaYZTlxVcGbj
 Sf1Yx3HvPKLGsZ/0O61G2E0noMRIlWvUQL4+PzaeDtUC1QcMwAUl6xzAcCgq30Aih9Ny7XBUGBQ
 FOVr8HIVrKK+m3dIYx/st8ovkT+Zu3Xy4cYcqt+S2UdVqxrcUKmPEEVM7qS7jpM1jN1ZJSD47eW
 IRcd94GLjYNu0shXn83j79fhve2XaazYRdWOguXeqeUXHFronjZKtgmMZTLVqL/X
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DFCBA4C53CD;
 Sat,  3 Oct 2026 09:02:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-0GpU;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:23 +0200
Message-ID: <20261003070128.1295458-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 051/114] package/python-parso: bump version to
 0.8.7
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-parso/python-parso.hash | 4 ++--
 package/python-parso/python-parso.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index 17e3cbe4b1..021e53e2c6 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5  10fb3883e4c595ec7333b722e3ad30b5  parso-0.8.6.tar.gz
-sha256  2b9a0332696df97d454fa67b81618fd69c35a7b90327cbe6ba5c92d2c68a7bfd  parso-0.8.6.tar.gz
+md5  ffbae6a466724074ccac6a2823cd1afe  parso-0.8.7.tar.gz
+sha256  eaaac4c9fdd5e9e8852dc778d2d7405897ec510f2a298071453e5e3a07914bb1  parso-0.8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index 9457fcde6d..3622c9bea2 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.8.6
+PYTHON_PARSO_VERSION = 0.8.7
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/81/76/a1e769043c0c0c9fe391b702539d594731a4362334cdf4dc25d0c09761e7
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/30/4b/90c937815137d43ce71ba043cd3566221e9df6b9c805f24b5d138c9d40a7
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
