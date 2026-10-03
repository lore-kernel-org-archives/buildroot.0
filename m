Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9DECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1FB540BFD;
	Sat,  3 Oct 2026 07:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYKAhjmfTXAe; Sat,  3 Oct 2026 07:03:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D4CF840BBA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010986;
	b=HtvClkBykJxqoUIl0ZyD5VzK6yv2Kfn+ryM2BkJGaDdUudA+G0GD9AOcQy2tPt+LHyLZ
	 +sof+eooSryjIcqZR9mkyQvqiDQoUraoxQYq+ro3BtcD51zBS+aE2iJqtlp3Y6bTmd7V1
	 bms9PscrR5wnv6AEapL/zMsVffaZVRHL5zd0AoxEqpK9HH6ysYJkA7iM1plAiOFechpoH
	 dpcZEwrMnU5eYc9b4LJ1zU3mf01ZeA9ANJ4HCSaXsCTH1YwJyMdM975hugV1GqLKeqLNz
	 JfqbcJpXdnAj6E0LtBbKO6xFbQSw2IbprBbVQhQ8z9/zhfTmv4iXLs7he0U1j8dPRjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fhf6qTedtLAQY0nyDUGonzse2DD+HbMGplNrlI9hq4w=;
	b=J203KDHBSOfMsi7O1OF+TeNCYW5x9JQx/q+vZyIjLuRApqGgREkSTK/T+oOoO9vpq61c
	 8zyE8c8iQyzuznVpEDA1do+vB7pxuWSbVLmUfNqp9IYXOEaonCkSQkXOIW0+V0vURu1Fk
	 n7QBRcT0T2YotOOKtSEaNlB0CxqsNtFh1+7IkceYWczZXyfpX0cq0Rn5+Q/gJT6YJ6c6v
	 P27hkU8trrbM1+EI9w+LqPI/OKrFnVnWt0xze789xxK+/T4dvjFuj0CeWazagSTY4MsRA
	 3fAaFvdOTYFtR32wWFt6n/DRXhNkVcVbu3m6jP+r0kKLr+Fty5yUFvsWlNV0vPt7RmA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010985;
	bh=fhf6qTedtLAQY0nyDUGonzse2DD+HbMGplNrlI9hq4w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eVKNZWlyAoEeXwgfTH33o7d6oP5/7DgsLWeRTmEjSSz6AWzanOLlZ34S/ODJYEScH
	 zKX3FURT1ScNJVHH7b1FXnLhXyp8jMBcmiwzheFtpMYoFa8RhOC29phTazDd+SFuBt
	 gdmVP2TSHrTyCKCREghlmjFCGuD1M6QjDZtY45WHaREPg1r+wOHueHjyG5vYUbLoEn
	 m20k5jeUJ2EZdQtgDAX89h+rwTSpTgx1+a9gAravC7zqPlPQRWI8cifPsg2R1q3d8P
	 0gICo6JMczIAgl2DwTQXoAs/wmifqX92/bzlXyzKxpdH1FlgCAQIodwEExdwfrlPhU
	 ouun/I8uYbNlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CF840BBA;
	Sat,  3 Oct 2026 07:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04AD2263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF942400F6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-aqPTj81d_K for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:03:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F255540064
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010983;
 b=h44U8N3vJd2qFK5fRdJuoggj90xTpMtZW/BS8jfA0zD5yt7g7yAOnnFRT0HVAE7VFqBr
 xH22kbmR7n+n/QCA+7KznX4UWbAR6sajzg0ORYtN2ra5hI/QWU6bkDEa9YUMwR4aN5laZ
 P4j1Or18qLsUmaYIlxTzxsWlhDfMd5bDCf2Pz/i25eZe91iA1R4tIY8BFeOi0p9CwpgQY
 YnW9DEZc+vpcTBu5iqC8nzcXCsAvyhFcQMhDnudxFMUG6+V5nZoQ2io1BTH/IOFs/WhjB
 rm01bv8mNY3v5Yf5kr1Q3gd55tnglnxUwKU4FvpRjUqtRXLyUIpa4fK6/AJE19qSUyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010983;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=swnMGccv5GWp6l4BOMB0CxNqMICg1aN0ui7k+7TTSXM=;
 b=Q+c052tyxh/YwkPIIogeafgkvU1vctvln299CKXTo59nSG1g4fe+pueWWpCjtr5TgA7I
 bRm1jOUuJnJVMTQEwJbah8GcPLzlJVyC/y5KDeHe+sCyJ3QmLbefJsL6QnMs5EAtvN0HH
 y6qgnBSWJmcsLrOviT+gglUgM7+zzDYC76QcUJBikQ63VtZqkQboAKpO0B52aROC16mgu
 l+M6kMClnIq7t5496Rvk1i4PUp0CPgk4/SGmm52j2Ykjq7gvJRkCbi44oM5OL47CkZtHz
 3qRif54WcVInm7mv62AHixTa61/hp5PIvCdO/FmZyRXYdkRh7xOrzoIKN5eI9wuWfpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nb51WShn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nb51WShn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F255540064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010922;
 bh=swnMGccv5GWp6l4BOMB0CxNqMICg1aN0ui7k+7TTSXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nb51WShnYs5zP9ACwBoV9qL2PM15KN9GQs8gI5vBJbmUO90fMU4569IHKV5AalFBe
 wnaLo+JHOwlQ6/aLvU0dsUnYk7RIA+/6DaMO8lYqsXsvNnqoxLQadg0x8kad23ZktE
 geJk0FBydvoTP8xChf1OoL32P/0xP9NMBKN2ZIkJo9e32EemQiHLu/Vw+OIHxkYbdF
 tQPlLxjr6CPDSCl3bgzptQ2oCbGuLOdYgwYzf5qdNhpZkYv3oMzH1dVj/eoOcWF1Bm
 J9rSnUzAOQwDQV9SaTH/3d2LEeFcmS+8Bk/z+lHAWZicBMxYzukRGtreXqvC0oNNJm
 TDef6eLLrCF1w==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 KOctXStbpyho7AKMuTdYVqRPW2w5OJQngnwQnXZfJlhVSWSiyPQbtQkA0LR+x9hmQaupcz9jZmf
 k8WPmTzqMG4+jbKs+INK5vGAeLgyhWVxS1fdA90JWQs0ISqP+Lydxan8qPvNFFZCEpxA8n2bXpk
 xrNNCgicnKri6mW0EMeJXOsSU8M2diQkjuy2QYyzyl9hRMYgXxtWLFimcwCVqF51AFRGCx7FD92
 ovqyBNEiVBwGlmGBJAiHGmoLTo0zPm0OcMzl4rLQx3XFsistOrMXb7d7Ret/nlA2UsIP/RgJPdH
 RBFh9+Jzy8AAtsvDWHMUwSQn0wobE1CNYC3dPELXktv4vBY6PBK9a2Gq/FB2RADYq3lDLr9mpV/
 CBGni+foCOswfJs9TKDuNNxo9rbSfv+yD/0SIugk3e2DeWRIetp/+vQ8Mgpiq63Syk60l69+gRX
 ctyRNfNkbqbOSN/ZY6CgDo7MexOK6HQbHDz8zIgfH9Ls3u5q/N1aKrpX7BM2Dir4gOOyZ+/IKxU
 l2Rirq3AkCNCA8mkWpHJM/fkxAgbcq3cytssgqVsINkgL557AYZXASMdeUuhgbDTPoOYFqi6DGh
 bqWdeQoBx5az3YNofkLfzYxHm4gvRuKqGMsFnSuZa2Nycg28gwG3ykQfhDJfxU587g==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 170A5A4C540E;
 Sat,  3 Oct 2026 09:02:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-1GWn;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:18 +0200
Message-ID: <20261003070128.1295458-106-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 106/114] package/python-weasyprint: bump version
 to 70.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 6c482e0445..a2120c93af 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  be6662c500fe803df4f2d1bf512671af  weasyprint-68.1.tar.gz
-sha256  d3b752049b453a5c95edb27ce78d69e9319af5a34f257fa0f4c738c701b4184e  weasyprint-68.1.tar.gz
+md5  bc6f55c033f3013f418f672991f4d754  weasyprint-70.0.tar.gz
+sha256  c263abf0e86c747b12af678b67f85f4abbfb97d18a20503031e7ba94e4b8cf8c  weasyprint-70.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index b36d96fd1d..c965348b94 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 68.1
+PYTHON_WEASYPRINT_VERSION = 70.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/db/3e/65c0f176e6fb5c2b0a1ac13185b366f727d9723541babfa7fa4309998169
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/8d/0e/461aeb736762862b511034933d5b98d68f812431b7393b026d9ace5f6b42
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
