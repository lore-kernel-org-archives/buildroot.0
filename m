Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18323CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E048440A4A;
	Sat,  3 Oct 2026 07:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcmebPMBJUt2; Sat,  3 Oct 2026 07:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11BC840853
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011270;
	b=V/BENil/UCMrnhmYUChWhUfSzjS8Gt0nb5gzMQRbshZGAxHgHlZJ9IXuS4Yd2OuBjCQo
	 X5J6ZBVOaC9dKVfs+X448seNucp2bzl9IETXyy3UkjEIrbkb1+9Wj0tvQc3TiIzCIrunA
	 i6tTQ5n6H2KxRqU21zPaolMLDao6XJJAom3/myEb//nJzxbEj8cq23Ujz50odHvQEqAed
	 oR/UDoYAJTImlk38gSeLUoxEOA8tzKZlWE7R8Mi1R6vivJJI5Rhkkk7YxTuQbPxFHg/NQ
	 2IrLp0OiJUGHqj5cV+Ro6n4NFB205jRhEuD6a0Fl8qpuJJeFk6OaQJHTe/i7xawrYjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MWfJVAl+DQTS+a1UvOmxO5Vv4hYq0pDVhv9EwjJ34Bk=;
	b=Yqw+afPuCSjtgPjdkFyHbyveu81zY861AFomWEh49kMmJWMneAbdG/hppg64L3F+QUxc
	 77X+89SUU/FZmWoNHSk89G3yFD4/fLWe2806w7AgAq2BH9abu2SVMNhkQWZsvy7GyMzVT
	 mXk3ZOo/zvGrfA/Gq2WupiNexyLu5/rVL7ULJNf6YZHubD9pHrnjbpsz1a2u4REPzXHa8
	 QuI1tfN11V7Ih9Nt0rx1GeftSPlEm8KkWZt5EWVZg0F28Q9iiwAw6vmHrXMCiuqkF8YcV
	 DzJ8dBtxpP8XTjy+PnQdXar4he7ulz6O+GfIVLHL8+1ivEiNaz+9elhrkB1PivgysIg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011270;
	bh=MWfJVAl+DQTS+a1UvOmxO5Vv4hYq0pDVhv9EwjJ34Bk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o8++NoB/AZ4pFyemvuQnN6jhraY+2zchFl/Et8qdp19eYkERZzJnQ8nT6dFLnFK3L
	 8fcqhPov9GzovvsWZHiMQatQ3/htdFXZ72KLh8XFrZshq3Qqpf+ewtXayEhk58UAXs
	 O/Dfdq5/M51FzHngnIkW9Qu5mBHiiFkX7ojNQoBpkSNaEKc4JZlKwcAD7uBP+mP8UH
	 ZsSM6pmJ3yefYJRd7imLQ0Wq91KL/dXManGPFre63TftclsO4dMFI/o7YXvxokyGwr
	 rDFVrcRyvad24u1C9Dp8XHpkJtz80aFCfJ3tHD9wC5bRZcYnCET2fikUVZxImmozF4
	 DlZ/8++86+KRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BC840853;
	Sat,  3 Oct 2026 07:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C459263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69EA580F67
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATs-5YKBpZHS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 77A8F80F62
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011267;
 b=YmVpmhSvs3RbxDOSKgRrZynzGQ54sqkKarWOV0fqaZatugQtD9geSB99FlogIRBbKcGU
 e2sGnjFzNF7IAzU/543M/0U+mf95GCehdnkXnncCLZmKYz/2IRtx2Li5eoTTEvvN1M6/q
 h/hzX4gDJg5NbwPy9Kb6qkQy+RKiEXG4Pf63HOgEoSyalqoHGB3oQ0pHOAgTYsyLxgfhk
 XbZtSAOuSDIU0aRcQKQAaE9T+HQjb1VblCd/QNYyyni9lxvnShLjFlP99Io2kx/4IZIym
 Y+hwb+FgIBAJzc8ry8denitPjj3lwnVTG8AHIvepWFNKM37d0UD59F+PF5f3LoY1Iig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011267;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=w0fY6m+RBOJxDeew+ond9ypmneFkE/1Va92iHiAtYOc=;
 b=leNEQvk2Cd0hfmZ54xyecQcdU72P/cPlVzgV0TMGaf/mxAviVOgZUrdrIm+/IKjuo5YL
 NZsk6LYR2juJrV6pAhWILP+WaOPorZbDxtfQD64Kvdj50ZZkD8QKdCfrheImlBzp2Us0f
 gPHiF5MC80GDXVW6OmvSaXl8lH5CHUx3dsRtONePyDJgsevJXZsjGCLhLwrc30Hec4vo7
 GIUdvZUOdg5cRTkiR15dXTfbQ2RS4Kr9SOpgjwF+d5cfJb93jGA6t5VmKZpwRR1jySYpi
 ZEuk7xIzDwRxjWEpF5vXy+osfAGHE/JGQsuAokO9lRr7s00ri0uxVvBMmely3Wp3mGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Pa20iHjV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Pa20iHjV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77A8F80F62
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010927;
 bh=w0fY6m+RBOJxDeew+ond9ypmneFkE/1Va92iHiAtYOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Pa20iHjVROmqbDj4Zgc37RJwFZ6qM2Z2sw/H74g99jEOII8OAdNTN55lZS9iB6YwT
 09TbiiXo7zSXOJ/VX0dvv0RohNCE4JvSTRjBL0P9OYFzsRHl3fJDxAo6LSY5nehFgD
 PiLNrTZCF7hxpSkrXLTRb5zBouLfUBFCmpPw5tudr0oKYSHhWy0CV98pP0BXZnrsyt
 WjsDO0HwPy8K1xX0G7lsrtYoZzBgKvtt53Yt7VemAM5h1SI8SZRQbIAzc5K0UF5wwv
 beEN6LKfHEUx4LsutZ0EyAvhA5iqsMvNaz155yu4OrBzM9me0eIE+N0Lz0QFeCUii0
 felJ5bRg/4jYg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 n1NAbZ2GgrzS8h07PD75uruMkFHJgfIXy2RNON3eoQb8G/kfIKa3TVvt1+K5r1GjSI3qOWqPNAx
 ime4ZSJbmV/wjMTAXLUu/tFPENqtFDbkmJ9bOD/ibaOQQwMyc+FADumLC3hk4s2aHC2h1j439Oi
 ydVeJKPDQpnpgl/JBpzWCub+IeZvwO5KLoDoGk3+hAXbw1RDZDYscYEsgWM9vqeIKqiX6HwmGi7
 vPVTIh4M76mmpxNjyotTYXOYrtmQ1JpJUeA/D8G1tI7B54uCN8MFGXiAVm5BG1XjJlaDr9gEWwI
 WT33VYh502fk0A/PhcED2M1msfz4Ki+LF7y2B054YqRMYJyC/8RZ8LC4rpbc7wSnlBoXHJ9/Hsl
 sVGm/k7iq8QUL5tN+JDPupQjIIiBOe/b/4hsYZlQnS5huY81Acs9wLkzRxCzqYcUgnDstRrixIl
 JGa+XuWV1KOHMgI5qDvc0payYtCTbVFVx62qOVsArr7w93nDoNOBgOwGJuXFhq+lQITOyLYzaLo
 jJYLaUfaRRO+ExKHcKr/mO+YHDv8IVgfclG8ecaHdJRYAUuBOPDtD1od7AjScklKMwxjoJbg4Zz
 7F/MOpCgUMOsazqN4P85BpkNMQgOiqa5ZeMnC74lCE1C6Obg2voOuunRD2suRbjRo67oYN2191f
 DNyu2SYAg+mcvLXSF1fg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5964BA4C5427;
 Sat,  3 Oct 2026 09:02:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-1gJn;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:40 +0200
Message-ID: <20261003070128.1295458-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 068/114] package/python-pyqt5-sip: bump version
 to 12.19.0
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
 Ralf Dragon <hypnotoad@lindra.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Ralf Dragon <hypnotoad@lindra.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 4 ++--
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index bf5560dab1..65882779dc 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyqt5-sip/json
-md5  739bb540472188851f15aac80bf8e715  pyqt5_sip-12.18.0.tar.gz
-sha256  71c37db75a0664325de149f43e2a712ec5fa1f90429a21dafbca005cb6767f94  pyqt5_sip-12.18.0.tar.gz
+md5  30996db30ec078362cce4920dafdd08b  pyqt5_sip-12.19.0.tar.gz
+sha256  71cacf1879da2cd3e50cb239e21673cfe02d358af70ab6768817c960428868c3  pyqt5_sip-12.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e6f5b427c36f94ecf86bc01698af7030a1ed6eb3748110d5dbb8d142d804611  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 7360e6dd48..74e1f28eb5 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -14,8 +14,8 @@
 # recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
-PYTHON_PYQT5_SIP_VERSION = 12.18.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/f3/31/5ef342de9faee0f3801088946ae103db9b9eaeba3d6a64fefd5ce74df244
+PYTHON_PYQT5_SIP_VERSION = 12.19.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/0d/9d/5179b8e619fe084218a87f963f1648cba4c5aa5bb98dd5661d2cbb9eb1e4
 PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
