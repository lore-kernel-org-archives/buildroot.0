Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A96CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB8960DB9;
	Sat,  3 Oct 2026 07:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FQ124vDaiYS; Sat,  3 Oct 2026 07:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E335C6065A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011925;
	b=PAVi1vgVMCzt2vhdCqC0lic3Mn8qjwC7C7rNfKas4x1WYR1zjRARwJOG0NCR2gRW0JSr
	 XPEUTzwFA1oFa2lYV/U/0+9C8OaYjNSiQwI1jaBL02DzswY9rHRwcU3snIw32MeoPEG3+
	 8iftt5ge01LDm4SwXhsjBVsHHpA2c/R6dE9yMXoAe7Cnjj0gzXeyBXy93brj7fxLcROc3
	 DKGJSIGZDADK9sM9QQLOHpIkB378EGkcAlYvnx+OVcFnL1eFViPVHogkFiEA9EdUITtBN
	 wEa18PPke1CFqmSBZ83J+XdHupwKqx0ehZmbKmx1UtFmKl+nYpGM54jPw+Re14oHt7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r7FZm/QwRgbL978cLSI3HWdbtPxBHjKbtEY2lVvKlRA=;
	b=ZctXJm27Dq/ukFlgix70gOvFXIV8GWHcnbkr52thl2WirerbJhZ9vXIyjDHbatYB2cFj
	 2R+AkTdX6J9zpYcn6YKMeQVgjd8Tqc+R3uB+hMQoV7Ydv3pTij4BfaScxCVI/uBa6tNcr
	 zmh2U9wjL5mKy0coVFb4nfwVodXToeyZZ4fMEo351LYTlZlFe8mpSmAfe2i1BqSHRNX/T
	 5TkPasXkikt8DQVLe2DjDL++6qvMcIBodTFIyx77QwX2aqJ8KNYd4at4Cb525/wy5UetR
	 skvCVUg/KA6NyXaomS6weTeHzKAHXeKmyG29IWxzIJyAFOWMM2cRpfcpGdmHonTj62A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="hTkGu/rD";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011925;
	bh=r7FZm/QwRgbL978cLSI3HWdbtPxBHjKbtEY2lVvKlRA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pSuTJ8+Za8P4V061E9tFPAPuIScZkeEQSK3jHCPL6hOjbgHsLqP2fuw7zBllDQLXY
	 +vVmd4jhZXmZvDMU0V/O33ztpDiKyAwTMeiWz0Pb91pM+zdJ9hDPXCh/tN8+8IlcB0
	 zS3U44Bfpec6RSRsP+hMA7NHQ42Ku12cnf4xsSh/X69y7VawEOuxK6FTZRlMyvhphb
	 r6SrCvY4D8PhgjpBp+Q06vWWrVmwvsJfxyC+Ssu1/N3ydEGCVazpQux62MSCK2sw3m
	 dD6jc4fJ7h6bD7BxxS1DfplWsxRsaSYT+C75kZqYfivLEU6k+ryZgoMyxxbbCqgEs1
	 qwAClW/r0ZQbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E335C6065A;
	Sat,  3 Oct 2026 07:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 989661D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E7CF6065A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNnpSlGW4XdW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:18:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9016660652
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011922;
 b=MqiymcR13+S8WS206Gmo+GtrTw2qExeuzZFp7N6HLbuhKqdfc1zskQe1oiSIIG+K7xju
 CmiF3V9fuLGD3yrrw7lDA0RZktL4Z8CC3uJhy0osXXtfOrFMW6uAAgswocAl0LuJCwKpz
 oRmblukB7U/lcMotSS5ATtR5JxNZqzdPgKTjIE4aAuFEolwJzULT2bX/CVPc3hzmT5neD
 vlZKVv84jw3B9pe6zVwgrt5gWNLouUQFBqbTlL/ct2XXeBZV449LjoH52zbj5nYL70/gy
 udjVqnjc5APudxZfnrqZs8IWn9RtU8NimN3Shn2ONquGq0JTcPSvEyy1To+ScJebQVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011922;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1iWYg9fP5SeZDjE/CbRihl4KYOwwAfDZKuw0R6snjlc=;
 b=C7nvOkZqrbxe2y/XKq2VlwxDowsaRGh9RlBajAkoVJgusKGP2Bsl/9dGMJHTQeIm/8Iu
 oRqwITB29qakUiUZQk6kOLfkEqJoZh5m+t0Q86ztjBfNmvajBDBcDA+sfbF8PKJSIwHRL
 14ohAv/EfQzItSOswXz+cDd9kqacd60WcmExapzOjV7FPsDiLh2KZDQE7rugxgjGjmbdU
 zyMDtGRHjO2Obiy6gact1u9bbJ0tVmEtEADJearB8nbtSrjQElxoBPR+oIswslfFUT9t7
 29hJeo7KlYftJWrRLTOoxS6ae+Clo5Sur1cpKiUdTQjz9NWXvzZAxfyQrR1eVrUzOYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="hTkGu/rD"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hTkGu/rD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9016660652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010937;
 bh=1iWYg9fP5SeZDjE/CbRihl4KYOwwAfDZKuw0R6snjlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hTkGu/rDwh2FqyoLmeEUnZgdDXCde+HgnKUlHiSBrIIxxsquAlGX8mCuWIG+L3pm2
 0dax420xENAq5ZnniF2MEnCfjZGzHCAHsF/WdLMn0jEJkWd/FVeE+YoMscVo2MO49F
 9xPdYgvsSIeDknrXn8RBjyggW6g0WlnjvVP9gM00sFO22gsxTg9qTbEnR+36htLDkF
 vVyGHtl2kZ7v279UXcx0jd3RNFe9Q86NGeBrsG1xXmAqxMFT2sjG1h9BJ2WU/ufe14
 br49yRqIFPeBK98So0Azc/SaN/J4/JUJWN+3KdPvzGt8FsJFvicyU9xUllsg87RDrZ
 8Z3IF/i6FKB4g==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 v/G4hvz4pMtPXEdeKJHSeVFlFmRNHT18jrzxfysoZGueloPFeJdbSWky7A/uCjIQAKju7kOsK0i
 mZajj8p1RteA6/+hW0iBP8QCoBH1R/jIw+Ut9I4theAGt86AGXW71jPXBUlAMlCyGAOSyRqoOWN
 MPo3WxTcAnpJVmGvUCX5Txg9KCddoGPVxp49WYrNdMoqkEpIRE07Qc1ntwdeUzLPCvoiMR2VdgY
 0uPZ7jNw8iDFN49AJdYJbIddhQ9jqmfDJfiyGmlDqRYY+Psyc6f3Ti5cJskc3trsteY6iTwOWXb
 NNW6aZcz1hb/eZV48F2FhyoDAsS4eyOXS+8D96cZa4FL26BYaCH1e9nUdV11NeTORz3MZhOtWrn
 GrUnNWLourQMC7qsJodSDQFmV1rl/Yc0EaD7cL6RKwrmJOSsM95PNQOL9OvfNvvyu6FQQN/yiJH
 y5p3ZNIdhtKEEU2SPV4ToSgoUMRBsMH5+mJtb7dm/EC5qcCcekTssEVAW7TBCQbwXa+e/GrhVt4
 At/pIzbXq7uvwQUTJdYR0nvP35joP/crvG/qS3vLSAH38HwsIpE/VdUZsMCU+tXK8T2EEFWQwst
 kgObga5J/RSGY9BYgcIKfoX18LtylQetb5QEJPp7ul2GKFZeR064pOpoiyO4dyVrnFYYljVrHIQ
 9ufsQ6P3bDQNrWreZkDk=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B1881A4C547B;
 Sat,  3 Oct 2026 09:02:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-2lF9;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:53 +0200
Message-ID: <20261003070128.1295458-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 021/114] package/python-esptool: bump version to
 5.4.0
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index af517e0844..2bb439b34c 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  fc9cea4910ecfb6fbbb2942e44c835bd  esptool-5.1.0.tar.gz
-sha256  2ea9bcd7eb263d380a4fe0170856a10e4c65e3f38c757ebdc73584c8dd8322da  esptool-5.1.0.tar.gz
+md5  bdf32c6c0919520e64d7375471846301  esptool-5.4.0.tar.gz
+sha256  fd756598db0a26c9975fa18511b08687c54bf2ce7322ede80cf1f5117dad1f50  esptool-5.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index eda9d024c6..09dfc7a148 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 5.1.0
+PYTHON_ESPTOOL_VERSION = 5.4.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/c2/03/d7d79a77dd787dbe6029809c5f81ad88912340a131c88075189f40df3aba
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/2c/43/1a2ae2dd8ae97bf1ec9991db097e52626d35b57d242f9687c9314eac5b57
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
