Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F375FCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E4F40F98;
	Sat,  3 Oct 2026 07:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb2yrxoMTIiI; Sat,  3 Oct 2026 07:14:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D25A040F2A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011691;
	b=r6VzjqHc0J51hOHj5o4TnBXg3VvoMEnOHP6P9v2WasdoaBgAJpH6O7jhPOajoPhAHFaz
	 P0z35j+dQ2j22jiFGisg4l+pRQo5pdhk6ar/9uZzfNkqthQiOpkiMMQS0GpDVigCzyF1q
	 2UloN3INQIwPYfdYiDnrTvBsn1EZ4SYubadIUMU/ufDnFCOoDQWaOjnhoC/VfPGYS+l0z
	 uYkQfdQVAnDHL9XK2z1hqcEKBHznOijNYvy/S94IkG67z9Xj6a4eQgEXBKFcAEmpEM0Tk
	 EQNLBFzjKU2elIsLsKIPMeF6fxMv3cbKigdvc3jT/XGGtPGI/3/oNzQviH9kZNYIKXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3zR3w7OL99uO+sgxcgxZ8WYyN8+iiLgQL1WBWAJfbuU=;
	b=seF0z9vLMOqJ1lJ59c3Acnxmp8/bGD1nR75/TGhqsNhTGYx+kXQG2tIMXmUmJ2OjL8dK
	 g0/p7FWiLvSt05yGLTWmSr9O1Ed4o1vBLxAQA/bkW4f2hZxmfonztF0vXgQOgXEetBmsP
	 YMnqXTlxbsofzefCiQR7s3Lv+ic5ACE4Te0gIoOBolrwBv10sBQbUIEqj6kpxdOV8mJgG
	 Vyobee7oTQTjxKVNOtJBRZqaPd4EowaeZMW1kFw8794E9KGluIGqeKX6Vt+IcmIBGjUIr
	 MfZiPLIuhbyU8/qXuUHD2ATJ5nkIEciUMp9PElL8HPBQ1wNRGJRj5mmv5abUJrU25yA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011691;
	bh=3zR3w7OL99uO+sgxcgxZ8WYyN8+iiLgQL1WBWAJfbuU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gqnMS8m304pdPe3Ez6UFWofycZT5Kzw/CYV4gneiz0vO+TA4IiBmscgcxiYHO7R8V
	 9/F9O/K8z8lIJbhxMEy2KPIZFfxiOGN/4Bvqqi3apkvzEpt6RrxlcdudnBLuzfWYkp
	 TkboEkkKL4C3veHE0P1jvb3VVDqZbdRZSxHIpbFi1Jp0KlIz27kqD5oGlPpTwV0CQ1
	 2pRVLViMoNLzgI5j7TXkJ+mnH0jPUAkoQVCAj65xv/c7SN1B/NP7ov+h1CNsl5h/tB
	 Q9xIfXCwRH0zE94HYFYl3eqAGdx1vhOupd7ZCdQpIP4iWPodBHrz4jusYfcdRK91Hk
	 lU2bNx3eZDmVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25A040F2A;
	Sat,  3 Oct 2026 07:14:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E3971D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 432A440059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fj-QjqY9uLzX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:14:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4B2BB40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011689;
 b=Kpw/2S0aIbWmdvPdZ2a9RYFnNdbKehr01ptTgCtnsa7v40ak74W4O2P6cfUGeBe3KKvu
 4EwP3st2ybMX0Um1yzuCkLdnaYoOVQ1pndnvDhOFAzSh7e6d1CbiXm0901w+1UP7/HfmM
 +crHFnycHLa3sastDHXIgyKWcboQeA/EW0//81OepZ5i30MjAUaEQ4LPWMnWWxSD99mNp
 NZIeRo08R3USmU4e+xShxtkRv0e0Hdiyi66O+kCNH4XruVhg7uz+BPCOVvVW3CutDfrLF
 tSaRT4EALwn5wvdkYtaLrr35+emIn27RZOUj4O9o0mJWVIig1VxzSHTv7cOk7QhkjDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011689;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+2Xr8DnkAfYhlpAF5IMu/6OrTDuyFUH1E7tQPwdYUoY=;
 b=CAu/g+eWPDPnBmh1Ho+qJmdYuOnWSytPEvRu6vRHhl5TDWofro4C4Jv1A6rsM3Tt2Y5d
 LcRigOnYajiwTDe/tFQdtt91XI/ns6nkPOzgk+aHa1QwblONwQ2vwFqH6rJeP/CRdQ7A/
 Jf7k4uhkvMmSq2xQIqfsbkH9Y/4X5IVY+kTGcSNuyi3JOhFgDr9qUAfocaROW9EeD8hiA
 046OFffD7BZYmzfviIaRnQli7GXkbhD+sI4wa82Uy8WoWtxIwSGdvq5pk8HzhOAj1UswZ
 yQHWt+Ler+4WHpfX5+7+Foktk0J3vlrWh4ud5S4fNffuZ7rgYpJoeUtfuW0TcEJmjFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XAdCslSp; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=XAdCslSp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B2BB40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010933;
 bh=+2Xr8DnkAfYhlpAF5IMu/6OrTDuyFUH1E7tQPwdYUoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XAdCslSpvfxzMQKu1tlmHj/MU0AYndxGbPVsDEwxz9sj9Iw1e7wO3RdFbtaIEzILr
 RcJ/VShSNaBu+0h9wjUljAoa51quGxT80gnizzISOx7PLsqaFfHDk7eUCZb7j3FrSr
 WTtXW1crdmvP1lw4Az34okBqCbOQAVHh8tQ7laFw3GvJ1ioifETc84EkjiM//3yHxC
 Ue9hb3C/UBF2kc769yikMi7CWA1Y+Fjrsl+z+mKJu1aLdC7CXcc5DZnW4TwGCMLowL
 UfE/XzaUw18YFtCUfBVtVDGzssX6iB44/tuNlIhNfEbnUZ1roZyfPAzmhYt0Pk0XMm
 VBZTX6mYBiX9Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 HJERnVrXKAXKMyXjhusoS0pdjFAjKM1XX8xFdZD+aeWur4WEG/aDYCcCArVJ5wFIxKCF6Ak0i0P
 /UwFICUKQuDXAzITApqqYs/uXQpXs/pmG+7S6eip43prrk4o+Kf0qqLGGrJ7R8x+/zSLbwAhwK3
 eMWJfzJZxdlUqBLtTAsD/MQgDGFdgiGH4BK33T429Ew2u4UBX0GG5Nr5P4b0RPuPeiuQqvkTFn7
 146knx3iOCAtB4RFpgObocXgjK+q0LrMNkY8X+0KRYq8suLDYup2e7aBXaNNR6Btfpv1JzL613V
 2yUPytozfOEF3sGH5FPih7oCN4zZ3Z86JcJP8CrZcSIeF8t7YxoEKVL2UgglyRiqwdOS36B4/OF
 Omni0RoSkUoL3CcDGADUVQEP0kgLOLFqGZ35g3dxtq/tnVueg/9rpWgmpBEEe0qS6rgdkGXAP18
 IwkoB51xL2o40pMJrJmmg/w+nSo35DRzq0BCM8lZZyR1Xac+FVUoakahbOweT0AsPcjL8zPK8rJ
 a2fAiHwZQKzkBXlHBfl48IA6iU2LMyXoBlCNS1BHt4/a+XzJ2s5Oo7dMl18YJbdq5ZdWjPQ/aCV
 eSOwADZ3Jp2kxnCcs0Y0H68We82X1QJ/zmtSXXMYrgz+g5S5hCTOHxl+dML1FKLGwA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5FA6A4C53C2;
 Sat,  3 Oct 2026 09:02:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-02cO;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:14 +0200
Message-ID: <20261003070128.1295458-102-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 102/114] package/python-types-python-dateutil:
 bump version to 2.9.0.20260807
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
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 9f8e30447b..99eff042b3 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  59a73a1592656ca894f6c61eb8f2a0b3  types_python_dateutil-2.9.0.20260305.tar.gz
-sha256  389717c9f64d8f769f36d55a01873915b37e97e52ce21928198d210fbd393c8b  types_python_dateutil-2.9.0.20260305.tar.gz
+md5  e6fb2bbea5ab3d9c1756cef961e2806c  types_python_dateutil-2.9.0.20260807.tar.gz
+sha256  e0b8a90d464c8684c66b7b8e4556d9074afdddcc56ca45323f0987134f9e7034  types_python_dateutil-2.9.0.20260807.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index cece2e4fb1..f5b44c836f 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260305
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260807
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1d/c7/025c624f347e10476b439a6619a95f1d200250ea88e7ccea6e09e48a7544
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/c8/4e/b3fa538f9cb38dfece0d6ccf6d3d0d925bdedb144fb9c8129dfc007cd003
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
