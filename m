Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA88CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541C840FC4;
	Sat,  3 Oct 2026 07:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEZlpgiJ2tbx; Sat,  3 Oct 2026 07:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5D95440FBB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011753;
	b=cMeK9NzXbRjbpcQzHNvkRMbXMDV7Mx+xHEpVdGPXLV1rXMg6rz3lvAIvg3/gD6QQZD+5
	 c4PIBQYW4B9qrYIS0YxGNL5EBoFL/LCGYr1bUQNzJYC8B1NMV6j/w6cYF1Di6IZdsxns8
	 mHVnpBkmBdpAhcul/tmffOa2NoEAE8XGWq8QytX1SvcafjwG8g5IemfQVyfc9HNEwZ42i
	 kVBseErcYMj01n/jdJWQcGOG3wNLG22SawLjd2vXXoHy7EXqIxW9+H9D3MOhz5YP+qPdp
	 Tchei4jHnMUrHBV5w20ZWkU0aN7L9AYy006tczp50mJeddfmxtVZF7jY9JC/TPXDSMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R2HHsQ4kP9jQ2Wi55rNKvPT0VooFpElkUMWeH8sz2NE=;
	b=Ym5CAMkH4seNgzi7lXUm/Hq1U0ohAApHMwmJCSQl5HLOXN15iVQ/rQ8TY97Vaje6E+1R
	 ukmDAAiX3ALkFKqHG35u8v0XWCKU6SLS9x21uKw+9M5lbcIlYi1VuN26MHQsLDXYywvOd
	 Grinoa2sDqbp7+F/SFUtzcynnnTTf0+B0K3osKz6T8b+Je/gByD87TN6+/hMmocXYj3QP
	 WW+M0ndpnOirpiyu7y39Ih4wt2sd+xzTxpsxaMjgyspxN1ayrW7n++JCMigQ8Bw3mCJrV
	 K1DYHX7TjjLDKN9XYfz1S6KoKJa7k0j3daIsEmaAX2AYfp2Zm52yAciS49IDEF06t+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011753;
	bh=R2HHsQ4kP9jQ2Wi55rNKvPT0VooFpElkUMWeH8sz2NE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GjI0mM37aWuzillM3OtWUDpH6WVYdf9+QCeRNZhDBKQhXdGDGmmKIYak/8GqHCRJO
	 Rb1e8GvtaAoV4cAJcx9ahYIHao1ACCY9qK6sO0WCqXspRP4pz+pjWhn5T0XFSW2B1d
	 BRXkXxn2IEAshXvYOwf3Z2X0/fbrtn56soy0pi/d5o8wWuRc6/TX3IyxlUZQPnVsjE
	 xqSt68NL+4iE7u4MQSI2FlMF3VwhViT2ffOXFmM/JbIKD8CYqlJyMx8lcy1HzKBomC
	 RQH60sivjh8bLrUxvFbvkENTfWi8KAuYSc6dqwYijLdDMFXkc/8W5PQmzLWgph+u9E
	 j4E3IuhvDjdDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D95440FBB;
	Sat,  3 Oct 2026 07:15:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 859F934E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83C5840059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sukiDVLv-J2Y for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 93D0740050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011750;
 b=Nt6W8/T8Ax9NlQ4oPIO+ju6afu1Hl3jIs+EsPYtDt/dZ0KBK+5aOUaN5ayPdk0aIxm/j
 T/0Ec/PnOkaAtPwacPnDHH6Il4hDXwyuhRX1A2R4KTAnX7PNLUmop5BLzUBvCTGGyxNGC
 MUi8BwK5gPpXeqKzuEBf4XNcEk/nKotvZJUbSfwZckNqIfphVHPq49ACftmruMZnliAUa
 1cye3Top0nYznEP7OJDuqvSx56Au/Qcwnty4MoLztVsYcM1RTbdm5TTP0vYC0U1PF4APc
 qmw5CxogSWFStqrPcNH5JDpAxFsrJG+eY0xc4W17vnyT1+JUz7SH/+2IAi472Nj+66A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011750;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UqJ/HhcYLNvOmHwDGGJTLtu995lXp9dMmC7dbrR78Kc=;
 b=d3GCOFUnPKJpkr8LSsl9r3gtIX3A+QJ1zVMJLbvQmLFCalOBDD8h6stzfLYmd7fj55pw
 44eeq0G29MToyK975zxDUyW8IdhZSp9k5hn9d6rzZLM1Ykhx1niP/+PX0s0E1cABPMpCu
 YE1IlEhoLk0PajxIKbv6wTdMl+j3A8AaMmLfiXJ2og31YU/H1xPuDzoSo7rXhWuwAavgY
 U0TwwxHAHvdpeGD3WOffFd7Nn3wCNYVi0FJKuK5lnxN//6uk+wgQHe1EG3KcTAjC7+W0g
 XHrUhrFCviIbEefRzFobxHIgb+rRxDSJHI9yN2yegy2br2f5O03YbzZsmUTdANBa9dg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Meq47Zjj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Meq47Zjj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93D0740050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010934;
 bh=UqJ/HhcYLNvOmHwDGGJTLtu995lXp9dMmC7dbrR78Kc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Meq47ZjjJVGG/M/EhqqPW1gERk3GR9Dmkgrg2pVCKGumY43BrKl887NYpKbrV6+G2
 b/Uyr0GoNqRehdUFefZLM2Q3CxCGsBHlsJod64zXMBLB4Mntpwjbo5qegMsOmcGZ1n
 A0+aAljs6a28/3s+u1jVqN67ibt7WygdSaBvpfqhx7SWpll97RfV9+6HP/vnWq9aYp
 bgxp6+FSPnu5N4avfJjuSUFwNyhzzlRBR/poWwCjBzIsJm5E1FP9ssFsgDsb/iErb6
 SVpCljGrUbwYt5Py1HZ3TcXX59NG9pJj+aHSwcOfs10Mp4FNG7XrzLr6D0RUVPjOPy
 oNLO9HR3x7OOg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 A7A6juJO5p9jlfw2t/1GIrKTAkShiRLosJwpWopy9xfTCPu1UpnCFpu2BbzZNyH9hsUVAZx7hWu
 UcExM0d/l8/MNX+/t5Axypo5BpAmlPEROCzyPBPXHTlYJi4Kxm+uNPpzFVgc1L3PCFAbDZSRVTW
 MPDYp7SbcIJcifFdQi+Ax0n1ToQLYda5D9MBeBafSPXYw/UfD3F2YXs4jnFy/BHvjeNH4wL+E+U
 4hs6cx3PFPQEllaOQbgrtr5zdv0QVaS0xMIEE6DSaulp1+zQae3brpyr5RkgwwzBMLMHZCe96tf
 OncismJN0knHGIqnXpZwoK58LJuKBwLtIG7BJ3JRhiRqigh2ZCzymTLRoTrBm+778Z/aBR7fNTL
 PMq+5kDwGSNrthXxoltOoiZ1hgMLUtpLH1/l901sLyxq1soGNaVeAUXuvuilv3pIH3QK4rXKTXS
 2NJRZptsCnX7+h+b8WA/sPBt71qJu9eyH1KNt2NyJ/p5SZ1Q5HD6WtKIuHuKUdPSlpy3TGjygQY
 RAPxA2Y+aUknEx5KSUzzsC+qXP9QL5BN31wMnDKH+zNIjl0M8zJeFn0TeN0CV5jJ3yyvla9T4TH
 8mhbBZeEs/hqWcakcCfOSzRQyS1AftPbaCqmXJdUpZ58gW0WlSMBkJj8NNezYX1J
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8077A4C544D;
 Sat,  3 Oct 2026 09:02:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-3QVT;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:42 +0200
Message-ID: <20261003070128.1295458-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 010/114] package/python-cchardet: bump version
 to 2.3.0
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
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index 1ecfd6fa95..f2e72a0bb4 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5  8a76472ad09c68c12069203ea9348ee3  cchardet-2.1.7.tar.gz
-sha256  c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf  cchardet-2.1.7.tar.gz
+md5  e8a5838c4d705346489d4335fda539b2  cchardet-2.3.0.tar.gz
+sha256  e08fade06af9aa4888ad99609a66bbce99ad01c1269c0ea673af75a15a6f762e  cchardet-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 53a17f6732..cadd892256 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.1.7
+PYTHON_CCHARDET_VERSION = 2.3.0
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/a8/5d/090c9f0312b7988a9433246c9cf0b566b1ae1374368cfb8ac897218a4f65
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/86/80/6b87429533a8a6fc5b970c44a3a844c315c3313377ecc4fb9efeb56a3241
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
