Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329C5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E469840EC1;
	Sat,  3 Oct 2026 07:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBLO2AmvjvfJ; Sat,  3 Oct 2026 07:10:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0EC8440EBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011433;
	b=EeR9AiqbaBcwnwAy9J11yjJBttX5HM9WL7GseObpd28ahlZzW4PMmEDR56q2MWubIPBf
	 +Dp9rdfPLZ/M1j++fXWuPh4MfqbdWPXZDBysqL/O+a87WL+IDuTS+4N41aC0ffIUh/0TG
	 apS6PTp3QHTVI4A0kEZV8XqCEpIGfYvq/S+cGEPYNRJfP/vNtcAPnciVAiypwgFfzjTER
	 Z8qBz/Uz8Yv78H7pZbYeWq6iYgctkUOjJFqDC1aFlrC4PRteWnXxeVuSDRufK5FeV9HqB
	 iH3xa5RcPE2n3WvShE4Tv+BVpVta1FxOCsyNxpXdb2e0EQp696/HED+tRl47KyII8pg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+mhW7F5tZJ8O8e1INZ5qfIecbHJEhSCGXb0FcwmlY3Y=;
	b=jzJ/SSe2Jb2BVeMKSo82Mwr/kTngddmpRaGfn9A8JL8R6fDF10EQhGoh7iV5JrAmKScm
	 i9q8cpUC6dLAYavOqgMjFQsWvFeEPAePZFhovADmMULVO4w8ndAXlyXEMTHE8pN5FPg/J
	 9BgI2+GDUrRjY8tbDHiW6Crp5aIt5LWR05tXNXg2y6QpHcSLFYYx6ucKKGY1M0bM3U7fu
	 Z62n51EZcdsadfjh6VJxuqCt429lYLBaqn1E6l3OToUjnHjj9Mw/n+LmXnrUB8z7orjzM
	 pdKbj2fDnX3dgslmtp3aDBI5Nbg0A3/OiGpnfzrk1q2bJpiVGlPKXrmruVrmuQq+7nQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011433;
	bh=+mhW7F5tZJ8O8e1INZ5qfIecbHJEhSCGXb0FcwmlY3Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Qv716Rjs9FY55Sj2qaYXxvGXswqJr4y0eTOLHdYCHWgoL2UHoEF1RegTHZkWXBpSk
	 zPzm3gyLdRHKRvX9b20KoUZGyUqQGlmlKNIIZazUfpVA9PQzZJu2mfg8bFngu5L9//
	 V/O/qEwVlOgQnNlC6eqBhZgkqPehJkJUbqzXmkWhf8o5rDuCxjIEffRdS72CqUgjrx
	 LR9mg1NiaylAES7RgvQCzf9sA1y04PXZNxJrhKOZwXYa34zIb/AEI30Vlr+0PZJgPZ
	 4GrDSCt7ZVSmkSUCya1E1YqGYyLyBXQPkakep6z2xsZp8LrgVilrgF6RVqY+/5yrZM
	 JS0LZSzF9W7Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC8440EBC;
	Sat,  3 Oct 2026 07:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30A6A263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CE78112F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-VBqh01DanY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:10:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 09DD181124
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011429;
 b=oq4+RURKf5yBv+R/hXoNsc4hHKa/VD/FxvsyuMUpEAb2DJBA48TzWrsQ6RUig8l1ZbfE
 TxfY7S8qFz5h1QU52+y7x+RV5rhJCp71QYYKw9L2XYeTVCBeJgbfN2bzquuBqI88E77JD
 E+egTTmKRq+lpfL+iWXklOx4kLcgcMyuBWwRFduE4huff4erraxBg5eIAcjLciemx5A3e
 QiV3eAXUEdEQfXurjRXzNX8xVsTZPTQbqHFVx2x/mvCZuqgcJlCAyPgp0ndb73IYrTUA2
 XGR8rYkYRLOqt502sId+041Tl7B9NTHV+G2grrIzHoz1fgX6sorsRkJ67eKiUpzE4Zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011429;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=106dkSYty0lcUPK/Vxfd3TzcWw0l3/cBPgzlSh2ROOE=;
 b=mloVZfO+ZYU1/GJ2NJtwtHb6byTraaGX08OSxX4mMRKI8ibi+TCXkbBHb5HRSetwRMvJ
 ALGZP3khEnwKaFdl3w/Ek9Gx6bsQBDgJnEcqxlMgG2XrYzG8s1sTDiXQXtLzkEkEP+E2m
 QF9wrNTeDUqNYVUmq07+ZeCjm0A598QID4H97sAEdggjIdu7B+G5n46PFLrmZbnA/Kh+i
 Ah7DV8x/fMXCCr6kBtaU5EFPA5rezd+5Jbx/zGNrfF7Cq1Jma23A6SqzqeAX+1lbW6QoD
 8tOYEhxrRgCC+ivhOQ3xTriSa871EakoH5tvq5Hqe0AZwqaHL7+LxPLOv/+2vvKTHzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q2slwZZj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=q2slwZZj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09DD181124
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010929;
 bh=106dkSYty0lcUPK/Vxfd3TzcWw0l3/cBPgzlSh2ROOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=q2slwZZjskUJHJMYakz+p71bc69R29ZevP0f4/AQMUVbufwrN/9QDVKlnpozHgXqX
 MmgLil4pKFCSxGfLnSHXLnerJnaVbfPPGBLZDogKyDsdfnNiQ6akPdUMSsv+0eLoeD
 uCUhbRyyvk3ZHtKv7Z/YUnva48C9YtdSVAjYp51BZR30w385IgUGv/CPLiZMO3MvhH
 YY3ie2Ecp96fzaAdVn4KnxRDxTaTD9LOVE+OAUvt3RfTtMX9I00EZkOuUKJhtNg10V
 oQeQM38naTo4wYIechFA6bX+NK6cRFJtJGy7/lsnIwc5Pj0OhWQgMiUCUpDJ6+57Pu
 Pd4Tn6iig3DZg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 2s1v6x2LTeHZOyUt9lFVMblUHuzbynozeyXY21ebbM2Q36q2wy5Xq25cydrNNBkLsSPTz8Iwv/3
 2pDHVIi9ypxMCmU7q/GIHUk1RwKOsNewP3os3o/cY/x7bV+974Gbe0vwoOsvXxpZFxSGupmN7u0
 WbsWCmktuU1qBPKQVtPCY/syK99rMw9M/EB9Dfbm+xqdjS2J6KC6XGqT9DiqduKEtK7xdS14Eas
 KJ25fJpURx4D35IcEA5/1LKirhhnoJyvSjl7Pv4HHhLNDQVA7Jk60NCp3OF6ntPWChQgtpiNHDC
 5QCNXFHKrhKlemfPOPQvGpbqdVEBgqZrkszaTpafZ3o5lzy1cEX0kwlQYR9w3HxAnsaxRDHl40A
 5jrgqsVh8j68GyiIpit0QVW+jXuRvzeAHsxiA/SO6IvNVdRPmKWy5G9La01QJ0cuz8Z+BSbuyzt
 yhzC/wYxVsrzorPQ7plxSK43Rp0yaqdG1zZ6/T/2ne6H11o8alqVS2rxu3UhIz9fCtTS7zuPE0W
 uag7kK7Gfg9RXhQx91vfvWmzbXqb/fzbPLuZi6XbWfo2BlT5RWORhp7jDSFIHsbsbQtNcv90bMC
 F+dEoCmMO4YvGWtvp/vbfKhCDENAODjJdL34NYcWU1ehgF+lU9HNaSQ+VL+XB7Qg
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDE00A4C5434;
 Sat,  3 Oct 2026 09:02:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-1eSC;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:53 +0200
Message-ID: <20261003070128.1295458-81-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 081/114] package/python-service-identity: bump
 version to 26.1.0
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
 package/python-service-identity/python-service-identity.hash | 4 ++--
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 1d7f66fd5e..e76381e334 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  e575db51719742ec39191c896e4c2971  service_identity-24.2.0.tar.gz
-sha256  b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557cbe8e09  service_identity-24.2.0.tar.gz
+md5  fc0ed70ba5b73387d25b51e88e2740cf  service_identity-26.1.0.tar.gz
+sha256  6358c52882c96e66ac4a55eb3a72c7dd4a70763f8cc6fa4e70abde2656f4bf3b  service_identity-26.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  24bd0a9ba7d0eae08a3a6e32a1b09f8e6871fa0325520a2fcb00e1539eaa602a  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 7965811c6a..4b050fb7dd 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 24.2.0
+PYTHON_SERVICE_IDENTITY_VERSION = 26.1.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/07/a5/dfc752b979067947261dbbf2543470c58efe735c3c1301dd870ef27830ee
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/61/87/ad52e2c582c0f0e7f0a1b86950494c38d67422dc0f5ed9044a5fb9569a49
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = hatch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
