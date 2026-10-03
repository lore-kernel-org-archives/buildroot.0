Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFB7CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6156065A;
	Sat,  3 Oct 2026 07:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kdyUSBj5mlY; Sat,  3 Oct 2026 07:11:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79FFD60635
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011472;
	b=lDgTR3Y6qDUtsvoXBmqqYAZIjOOZ6MSd9MsyjjS9Bj//KbxKpgIB8FuIoAngWX2MDa4q
	 ZiFcDiyZxUm5c/AqfRIoSVZvdW9QA25i3u/ssfLFKGxIJe6ItkulCRqGnJCBxsJaggsoq
	 odC9qQYQF0E4Puw/PzF+2qWFt/GRyj8huuTFH9Pnfb3jChBpSWy6cKR36CLQMlufTKH9C
	 IiLaAmkmt9N4tVm2AMfX3HcXVTZaGJ5Xc+S851SgeTZipaETMUDQVaXdk7tK7C9dJ6DCN
	 gSc+3cml1vtTNJlIVUHr6Khu+SbAynuSVro+3MjeokSQzon63UkVH4UEnxbZQe08cEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=96YiA+riu7hK2ZW0o5cTf2PRkwllF601L7Zc9iVBh7E=;
	b=if+uwOme8AB4ebQR/6wIomrVwEE2CyQUsRw8DvqfiCbLbRFe44VNl0enoWdkENzoOiSW
	 BHbu7VMyn/qd85ZBZnISej+mzHz04ksNV75eQCJoYzrKfLXjF+KHgtXrn9Mh51yRj2BaM
	 LWRrIOHwLhYcA/schYe4N93H9eOBIcqWdUOY/J7o8IHzcLKLT7VnK7M2KEFvS51z+8e2+
	 aBR91pO84xN+ZJW65/Q0Z3HnHgbwjpi+gb8egp8XFbox6cLlCR1px7J+RqGICurDo/FxC
	 IzMimp5lJ5lLPcZx2VrzrWXWBd/VM+GeqRJlwWAS+kAPbg9SDz24hD0sPCgetO9VpMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011472;
	bh=96YiA+riu7hK2ZW0o5cTf2PRkwllF601L7Zc9iVBh7E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k/B7YaL2HGNU2KgKR/L/JHZAJ4inh2PcWzVNR8CrJ0eBijJHtmgB+uO6rKpescxZs
	 pptRYpeCKBiG8/p1W2D3PyzZ7ad7Hu92yh7HnMv8igRVJXrSnao8EnvTA/SoJnje5C
	 YOa65bxJAiCAuUF+iDWakleBMak6zWdWmHFKDqZCb8SmKvjf44fheUNogWmYtWL9qN
	 ronYH2GOSNlZdbl3bNHQ7oTeXFHIQ2KIwcY65jz79T/LKbQcIs68XRtM35nOGUbRjN
	 UwPCwXrTnlNZmbt+ZUJCTcDjg0CquQkxSiPH9uXGb6zfOwwR2dUTV1x8C5DhbzVHIX
	 7LNbDb35UtDaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FFD60635;
	Sat,  3 Oct 2026 07:11:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AD4E34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 811C440EDB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zi9g8YFp5__f for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 971BD40ED0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011469;
 b=nKU0qoGvGrbwOv221r4V8UE+lFCZY3MDUx419/2C4MtFRXb0ki3I/Zxnn+rXHQA+lEbj
 0rjERTirVuNwfDzTVkUpU/I+TdZTv1TsvZgKPvEjmaGJHHirBXi08j698Gd/gebduN8VA
 QylyqP/9tORBLW/BXaJgClKBA7iuXX3fEwh7/2i1HzdYia5NuYgY7J7PR6lQx2SKTH4xC
 d5JeFreLJEuDtNgMWZ+4ZN7fdzo/gR5H0WSQtdhCOcZPkGCn4eBshFOUP9KfxV/CH3EAr
 fMu6N16XSuezT7hC0WN7qLG/lKFMVQrXvZBY9bcOkIlN+pT9TpUhVn+xcrcpKiKCbmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011469;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pJn4iSk7phQaNqMMwU30RgqUmc6vpVQydRHdNA6w3oU=;
 b=HpEICyV5scj5CcM4yqBS4D1/iPulv8EqhD7HAqGEGfVrzD6eKIuueG77AZxLb1bdk7B2
 uFnjzR+lFrYFSxVksOAEqEaqtiIkpece0WKj037VkvxbtjwIEBrTTH6NI8h7a6E5kMklG
 ZO/dorQn4hyFN7sUhFIjEkfVpJXLtRMcRpFSQ/e49BsK+mWTjiGHe7hw7gKcjbFBOA4Nm
 udDFJBBZHkn9hPEkudDIzSweQYjaYd3LVN8d93Vhk8ghWfn8pYcT8PrwNtKRGu08/uQ4Q
 Mu/7xRTgX5UR4NFjVDASWvLwqRAON9elSyiFIdS3vmBIVZ63EOE2o2O1AYAUrOVlkEQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GKRlxLUu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GKRlxLUu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 971BD40ED0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010930;
 bh=pJn4iSk7phQaNqMMwU30RgqUmc6vpVQydRHdNA6w3oU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GKRlxLUunfGjtaG6+YSSTagq4Pbrngzv/XdqutlE+9slzxBSiF64AK7ahElRIaHrF
 iAi005NqVvkrFhysirCsNqWFzQxW3/O5kkDHNedx9QhkFznOyG5obW1zG4VaIIkWQG
 M6kZ83VXCmnvvuey1JlahumrSofYBTVCdiB3ECf+9BjpFWOAcNNWM1ZXBMBnd9eIgf
 6eymbwTWAvQwW644uqZ5n+GPMeQxxQnfH69aIDlTMDquptJvgE/aa5L2B+zb4GCh8z
 hV25xGfvk97Ll7RAdRfYadqKS6BcX6ENCI4FEMQ5jSW8EH1S5/0bn6j+MJ1pOff/bx
 LjahxCoFO4rHQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 0GKi4WVWI8GF2xbfxDt9ZwHhFlWcEsJ2/MtVV9OtYomIrnDmuGOf4VnWkJSbCe7auDeg+phFvx3
 t8s0bZ3QPNlGMeVZiD/xyKLDw5al+ckKZ4ZWy0ML+YLJ5lJ6RfxxhgmKyEEg3u4sm+QAx2/KtQo
 oKcto8GOtkP/Fgi9EATra7qDi8fzcMxGS1uY4lGGpdtX8ZHXx2hw1qQ+a/B47VdOtwN2CnY6NE7
 rMkHP7vZ/8t7giP8Bahw1DVzEWF919a38UFl2ECOILa2CuC1YbW2fnd/mNlhSjwQvcndnE+fUCd
 5tRjRBeQGU+qnUyLQZ93WGBsEkVEJspuL+p/tJN67E3zHFc6pg3RaN3c6g7mC2QSO1njBsfck4y
 9KaJlwpzcoETal+Flz3XGQhsPwOSAMPB+jako6/fteYgFXM1SmgHXa7cNI03+0IwveFd62yFlJ7
 IA2nX45PJbbKxrIWUyF5JpX88bxAWApeRDm9nSxBf6ZdD5FWpU0CorfvPwwJZe5yhqA1V8rvlyi
 WykVGvhZKaDJalkHUF32geVL7WNbXYDDQ/b8TpoOfqCAZxN4o+En8+FMCjL1kjhNN6zNhaIyZ6h
 shWQSnQEpo6q2ggKcN3EwM15JiiPuU8OrvsWCyAJru5XtKIM0UuPn/16lWfdfrHa
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A56EA4C5437;
 Sat,  3 Oct 2026 09:02:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-2ehP;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:56 +0200
Message-ID: <20261003070128.1295458-84-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 084/114] package/python-smbprotocol: bump
 version to 1.17.0
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
 package/python-smbprotocol/python-smbprotocol.hash | 4 ++--
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index 3a73e17723..799106067b 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  fc4879f8472ffd714d6aaa986ad2dce2  smbprotocol-1.16.1.tar.gz
-sha256  ad7a31662792817c6da3629a3cfb96a51d8213e993ebd0c0a7ee750d2b1f8ec8  smbprotocol-1.16.1.tar.gz
+md5  15ead75bda29a05576b1a8d2390a7eea  smbprotocol-1.17.0.tar.gz
+sha256  bcc27edfff7d727a7eb30424138766e1ee216ae2ffc1af03dab0448f29c4731c  smbprotocol-1.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 3efe8818f9..815e444841 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.16.1
+PYTHON_SMBPROTOCOL_VERSION = 1.17.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/33/76/c32681e925fc859578d4e41e4bd3ef7e2b9e7d06141f703eec032875b28a
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/0e/ff/1a86a76423210bc9558e6ea978c576b13da448644401f16ee2260d4d3316
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
