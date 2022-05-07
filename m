Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DABC433F5
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1201408C3;
	Sat,  7 May 2022 20:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zoZjC1e1juH; Sat,  7 May 2022 20:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4AD740527;
	Sat,  7 May 2022 20:12:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF1271BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE7A960EA8
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=iki.fi
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMTDPp5nbLg2 for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:12:05 +0000 (UTC)
X-Greylist: delayed 00:09:41 by SQLgrey-1.8.0
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E60060D75
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:12:05 +0000 (UTC)
Received: from localhost (dsl-jklbng12-54fba6-116.dhcp.inet.fi
 [84.251.166.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id AC57420048
 for <buildroot@buildroot.org>; Sat,  7 May 2022 23:02:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1651953740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XuDloNYk2hKSLR28WBFbloEXdTAWOm60HEnehg6cd6Q=;
 b=itlf0f7MWiBwAgk8wf6gwFHjyBxOhSkB+xHwGUUZq6RFgGlWqrF/9dr3pwxAThjs13HRLW
 +qp6gshynXOCV9nP75vUzS8n4LNHAY+1cDyCmeR+fy+2znO3Qii9IBwgwXByD1umGAWHCQ
 EpJ3AX9a0chTfleH3udsGigS5T836x4=
Message-ID: <379b85295cffd8c19ca02051849d946a24a915de.camel@iki.fi>
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: buildroot@buildroot.org
Date: Sat, 07 May 2022 23:03:57 +0300
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1651953740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XuDloNYk2hKSLR28WBFbloEXdTAWOm60HEnehg6cd6Q=;
 b=htB5DdmEYhnNs3KPCc01Q4LQc557GdtnfISrLlbcnpyjTnl9tvOxDCekLiFhnAjOiFyPtc
 2YwnxZ1Y9Esn/FHIacxF6Ov8J+e0+v5xGCd3/7IwHSlIJfhkgf6HPKkTPc37dz9n7/YNI2
 Igka0aCWoF+PBOTVOBrwLVFcuMtMK80=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1651953740; a=rsa-sha256; cv=none;
 b=dwPWPb2QgATFv+qecYwv2ZP9TIpYyuT2iGLCdaefk8k9kbNS/6lvjRj7rywq+tpnwe+zzm
 FBhiUBrQUK0duRCveMP4SNBIkmO6NlDFLlQlZcoZHviku8ePOo3XBHdy8AOqZBQnFPnRTC
 lW7Fb2R06hQj0QSCUl+gg1aciAkzgcU=
Subject: [Buildroot] selftests/sgx
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpXaGVuIHNwZWNpZnlpbmcgIkJSMl9QQUNLQUdFX0xJTlVYX1RPT0xTX1NFTEZURVNUUz15
IiwgZm9yIHNvbWUgcmVhc29uCnRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3NneC8gYnVpbGQgcmVz
dWx0cywgaS5lLiAic2d4OnRlc3Rfc2d4IiwgZG9lcwpub3QgZ2V0IGluY2x1ZGVkIHRvIHRoZSBy
b290ZnMgaW1hZ2UsIG5vciBpcyBpdCBsaXN0ZWQgaW7CoAprc2VsZnRlc3QtbGlzdC50eHQuCgpJ
ZiBJIG1hbnVhbGx5IGNvbXBpbGUgYW5kIGluc3RhbGwgc2VsZnRlc3RzLCBpdCBkb2VzIGdldCBp
bmNsdWRlZC4gQW55CmlkZWFzIHdoYXQgY291bGQgYmUgd3Jvbmc/CgpCUiwgSmFya2tvCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
