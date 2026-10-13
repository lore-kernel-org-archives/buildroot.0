Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D87ACC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3926580C70;
	Tue, 13 Oct 2026 16:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiWE--RcXEuP; Tue, 13 Oct 2026 16:43:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2AB8980DCD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909803;
	b=f5smb95pxQt98i7TlT+bJl5mYDBO8tnx7z0CwRB1Ky+zaJIKYkQJwk6l+zyx8qEZIFnO
	 kFhfqttm62l24BeUwcRJnp1jMKefRlYnd7/MRNC3QhrMPT1N+n+am3ZHhkx3Y57ERFKOI
	 Pjwt5jTFqjw6D8XWHvGdep/0B1oYDjW7rqoOhkKAhviNkynlnDJxDCopDqkPgFy/tyoHa
	 GVEqzKO5A2q+4PnB+sPEp/C2id6WQjHfn4nrhRHczwU1L1TYa1ejiLS8PWj4hbCqeNeqb
	 ULMcbrRnRYZpzxmqWXFcKm7Y12CYeFlYMFHKadbbk0ClkWpanCBXD4dJsfG1XskbA7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909803;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UkHBH7VPZRWTzwPnHmyP9/Scfk2eihwgTGHPNHe3d4c=;
	b=HRxNuns3OY3nnVLejWBjYCAPtjcXYZ/VS+27qUw9eSXPEtjKFkFqVNMG4spN1CEBmNqg
	 LkGZ9mY70X48EUITVt4YlCzJBdUHdZ8i2LNDi2LtxW0Zq70E0usBz93vhL3p5/uUFvbsJ
	 y2E5Pvm/6SOFPhEFkL2O4IJIrymHltgeNvE58Wxd/aEeRbbFudLS/BzVofP9m4UrYNhuG
	 4qA4p25R7fWsHqOgAYUQLe4MBOuSu3TkbyJ/ZBfSAkRnkcrj7wzf86jTgS5P8l+zvrJTA
	 p4rdMw4eG5c2a06W1i6NxE6i82anRireUz2/G9NOQbeEDeXMqq3egEiVYALeA82F0JQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909803;
	bh=UkHBH7VPZRWTzwPnHmyP9/Scfk2eihwgTGHPNHe3d4c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=U3TtV4efOthhQjtt1wNorHpmu2cKBqo3ooqEZXFmeXAHEgOpAwQhKKvdaqQ/Fs/4E
	 vdsuMjMvKWtm3JXa7W3YeY9fp8PlssxPuhwiqnXPNwViEj757tuwfyvxl8ayFB+rBg
	 8bUGHA4C9gL56i7Xac+pt4coIDw+IQGU0kWONtNIXMuHWRYa+5it/IjHgrRDHRtO+J
	 0CNcKIa8DxI1l1ujF/ON4sR0/3NG95rMN2dktEK2SAz1BWj857c7ZGDhPNdzgs3UXw
	 XnSXAyBvsuvZ3ezKd8NeVN57h788LNcJZJ0TkhMAfZWO5B4D8uNQFgor4Jr+wJJ1Nd
	 JueCiwHrUqdmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AB8980DCD;
	Tue, 13 Oct 2026 16:43:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0A1E1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97986403A7
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HXyAD8QRfUP for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A20A84027C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909797;
 b=DEkysPWX1Z5aByx6+YjPfsydHO6bn6+QE7V5X5uTQEyAQ2A5GdCLRYCUgwCs7cusXfH/
 VXRZqHfPiqKtHgtu3IvF5kddn4secbLHvtbcjSt9PLY9WBiQliBbEosM9OVTRdpNj6oKZ
 gXAH4xTomuA8YHz8PQ7hazJWxnt7umnEi16S3G/D0OIG/j6Be1fYtlxE7vLy2hzBp42Ii
 FEYezTARcCgOlV27TIR1l0SX0ZDJ5lCwLv4haToRhAkftYFwJQa1tEBastyry9KlRJMQm
 6wTGDIWOc4BzayLnwRkOJIMVzcNVpjuJp6YR1AV6O4HPFK6q+wrgM6OR1H7NroAWOfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909797;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MwILMOR4Z47pOYi61D+tY7ju1kssEv1Qk2+Tf5I2TNI=;
 b=m+eVqSdNJlJtOqDZT9pDdFwj4pP0vgezh8Fi6IASC4WrmQ4+IiFPFnR9nWAfbUK7w3W4
 IocmYsH0dvDlZ0wHawOCapo3jSAXJKLivKmbfbEPsrWvI0XYrOxUlYqPTYAWJhCHuqo4K
 CnSvakWqfyXl0l40Z+BFtQT7zvuKtdelN9fcanbal047yXGYqcEi3s9WZHwL7bO14ELBe
 YsB4t8uwcKjVOllJdZkWxwyyQ4t1PitVAOTMXhu/Y6q7ZsXexb21Py+MOdGrk4Rx5lTMm
 fnZLV2y9Gdhtl8aVklIqtw87h3zqb/eQNfYOKQy59/tcmp2nSMxXJN0bU3cejr3uefQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=C+7B564I; 
 arc=none smtp.remote-ip="2001:4860:4864:20::34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=C+7B564I
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A20A84027C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:17 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-49dd13a91d0so1217291fac.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909796; x=1792514596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MwILMOR4Z47pOYi61D+tY7ju1kssEv1Qk2+Tf5I2TNI=;
 b=C+7B564Ijp+3U/nO6lQe2uVwij3cHMpmAeaKt8kNxiZzBqAYtfAnRYrR7Gv10DtVTX
 8l4do9fsfZ3L+hJNJ//uojy0bAIFIquXyQi8cEH6WoeYWBOJvGml27x1u4G1PHNgxYga
 wymbv0shZ6XJLl0Ee7d20lnPI6KZjSyXyiC1zHE31MqUtkCEE0f1b2u7jBAD0oMiMxvD
 W8aV+Zjm6RxdIY3kQaCxZq4NCh+WPh4OFC2cv09c7OBkHj+JwqSkLIun75PYTcK8gwWp
 7X/8NZ5BgM83c+4ztPM/56zwrDvqFfCP6RL0QklBdSyoJR/LqoE6zq4Yp6R/HYkj1Q9m
 p0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909796; x=1792514596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MwILMOR4Z47pOYi61D+tY7ju1kssEv1Qk2+Tf5I2TNI=;
 b=wJmCcZhj9QehiFKdd30RioEa3kR6rRG8duIpvHyh0QB7LVqs+7dJEoZ5wiDQgQ8btG
 oJKKBBFZzCxNn02XS82xsCJTbGE5GFhDE6gqbKwQT9UqWiPpuHo3ri2Fawf2mI9OvxCh
 8yz443xegAI+XIcFY/MTFihfMBLgiSHrXHNs+3oy2/6g6lS8q0V2GWs1AHH4/VFNP0wG
 PXYjKFI0XpVv8YTzTvYccPeN0h2Pe3bucpCDCEUvaFfRy18fdnoYm4Z/PbHth2E1KpX7
 BJhkk8du0RibJ3MnIkuuMo3Czhwg+WqNMSE8PIg9MQOUUl56cipwDdamkQs7or8pSrOD
 yF6Q==
X-Gm-Message-State: AFq9FYIbyhmGzF0qlErkAFnZy1oiN6hWfJ6aA6PD1b8weEMoqsD609Vp
 y4ffkjejr0e1LdvIqR31bubirJJn8BIPqWbvMdiiVo+OW6POZ6wlE9zj+ZKCEA==
X-Gm-Gg: AYBFou3S9eDVT8pTVhjS7Ew5/QNds3S185ojHLZItOjx+vroF2zTjVZVaI5xyfr9oox
 nPw3mi/U4yNDUyvvtfrWxlZGrmf4vfiyg0fmkDnUpHE24tV+tAC9xHXEt2GlUXfRxM25KVSn12f
 8O8sqi6M98hJ4c6rwbl+OfhhvrXrFfeIL/Mm/2d57jFwEo+jLGw55VmR6fGM+ARuAbl2lqXnw2m
 sI6qe/zKDpmZjqp4l4WBQJObjfDNLvPzrTBfq0axw3dOyHzTMwYot535XhdVnVZfp06+pAhcS7x
 tzOCIVvn4GW3x/L0WfUd9MZxX0/r2iNFlm/jScNXDNmVgAySIu0XyGxHaJM45X+BIbgkgx1CHQN
 6q7Yeu0s45uqnxXobccvHke2hgg6TjagXnJHH50I8HwtncJUKBoXuD8fELydAtQNbqkC8U4ZjFG
 Nwdbs+FRJIGDd2xtTvOp676eYTstLmrJC7khRTkrLeT7/9w8GyumcTC2vLjGBG1h0OtU6rF6ZER
 2gBx8/1e90s28H05SczIobHLbscPgHt6Lj1zqefyPl3whrqsgnKC2cRS+iGc+CSVeEfYRWLlrsv
 bLbPw9ac+1wAS8G4idUE22vQQPRkcC4b0D8/soVKd5AiutsakcrGM8HchZgHg78+M9u4WLUn6wL
 ljT0ayrt44NkssfTKpjZHP9p5/LFBFOc2lIkqTuYRYgE=
X-Received: by 2002:a05:6870:810b:b0:49d:c9b9:7509 with SMTP id
 586e51a60fabf-4a2a89f6508mr11090768fac.13.1791909796105; 
 Tue, 13 Oct 2026 09:43:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:59 -0600
Message-ID: <20261013164254.1476592-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-google-auth: bump to version
 2.62.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index e157a5aa29..8ed03dd9e5 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  5340972cded7915412d049bd7b0de69f  google_auth-2.59.1.tar.gz
-sha256  ce50fc533ac02f489a2b183a0c156672c376ecb2091b1127bc7efba2975fff27  google_auth-2.59.1.tar.gz
+md5  efa6eb1ad00dd54f257b745beb28c363  google_auth-2.62.0.tar.gz
+sha256  0bef0ce54bdf9ce226c5d66e4264413bd918141c31bbe49fb52eac882f513d69  google_auth-2.62.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 7131da6532..2ec4100fa9 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.59.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.62.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/81/e3/9f752a968e487fbc10b2c2a1dd561b62489f923972911009577bb88fe7bb
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/f5/b9/4b2528f30114b106e3c3a7298ba38d85e682fd1f83fe7c4a5b77c7677082
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
