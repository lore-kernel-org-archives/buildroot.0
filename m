Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC54CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB4F9814C0;
	Sat,  3 Oct 2026 21:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqgH5XXpBYRP; Sat,  3 Oct 2026 21:09:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 04A4A8148C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061769;
	b=H6VJeAeeC4B42vUw3OjTjRCBY92H3q6Pf/bjVYb5aqOjyKvofpJYe72U4ppZnfv08HQk
	 PbU3iFTUG1YaeGNI+BnmXLln9uJQR+ZUt84pdcay9p86eU4XSnPC3IXbjg+PEt9iSMgun
	 iB11X092hAPO/eJFvhKy/IBiBH9lZH8mdjbKpU96PHzUvGR68HFamKJgayPkyEqdo1wJw
	 Setq88jlKnDlNLfIRt3vv8LzcPS31j7a0lUu7am48qG78viKHAQk42wzHFJB6hEPa6JHv
	 vv5QTl8iPjE49hdUMc4/wLC7mqT/U5Fqig/Ya21vppqbZeiSnPFFEl/8/XDjMCtjXSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061769;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=L4ARMzz81xzqF7zGJpj5+SppT+G+hYUOsBX0rDTo/cQ=;
	b=ECT+ozNZvYlOOVxrfAlUGmEydnCwLeR9We2cw11rGa96ZtpF7+YGpFZdlPm9kNh2vI+a
	 EGkO6sqhV+b1DH605ma5oCmy12dc997hRNolcMpEYiEyTgGJce3hDdTYA/yRkgz+0Vt83
	 FQAUTh6jAzuYqb7gm7dWliVcq9S4q2SnjnyDlCv0OFn6o2l6LvAQ9684GmhFXbps9vp9k
	 H3e/1/M4zY2eRxtTIPXkHWdYLQLkrRO3rfFePo3BT2Fgk6ZmmPK84n0aoyyL0oPh0gMUQ
	 SeGhndjPdvia0aHtQkNgJpa4Jrj/qTJAAMWjvT7+C8UupXV2VbjKudnTy+o/gNO7sAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061769;
	bh=L4ARMzz81xzqF7zGJpj5+SppT+G+hYUOsBX0rDTo/cQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Z3t6zqv3e3mKHmXJs7OIyuLwNNKEa4muBiprMu+ypqAFBS3IgffaawScs2LXXhYcL
	 gYy/6TlR6/YmIPw5KHtaO++WmA+Bq9lfnPlNXkZNU6HUwqSoPyIm664zSJc1+ax7o8
	 2IP+NYqInpIEmrBX47QU2kcpccNQG4v5mXGq/VXiF4iCq2rkHvg4N7WMRwud5lbK9p
	 PJQDgbc4PbzdN6sxVialMjipakdc9/b6gM2QR3SqgAQQm+EfuqdJPZNpRpnEzM7Wx4
	 sZHTnrIcTCiU84Sz4V86vjyP/II9WWX/A3iJH+So/WLOrEsnt5NarfgKDfKaNITLgT
	 bhqsxLQYqgZRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04A4A8148C;
	Sat,  3 Oct 2026 21:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFEC81A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C9740A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwvPKpFB_PDh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7F6DA40ABB
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061759;
 b=pCIsz1iIkGwkCVv3uyQI5FXVtA7ZbWNd1xKyQhCg1OP8qPuSnDG3FX8Gc+UA16cx/5ws
 TuTGKcnesDT9O/tH3FCiCh/uW1jVtHoL7PGVBArkR6FfAPa5zsz7LVxKWDar0RDvcY76m
 1Erd2SXBI0pRxTJZtUyidOQE23Y+iBGzBvC2meJXIuGeyWccVXI0WR2PjNyZQ2WKQcopm
 EsUv7BzxFiVf1bS58lliMW3dlPGAvjojv2+Kr1KJWE487m3K8GAcsZn/SeqRc3sDlsnH+
 KejcvJZKxYdxwtBccFRajxJNapm6hp95n9eAnzfOxKE5129qmmvAtS9V7mF/IOB/hGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061759;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ljQ35MwjAotRGAPgf+HfFgnlm0qy1vHsVRico0dIwSA=;
 b=kB9mM9hzW0+jwa09WplNpU61tXEEb4YK/T5LXmNKeRrfByUxyukVcffSKMIF0/9sv8pk
 QleB+OEmfCSj8nRB4i142MQb0dVmd914TY9ISONjvnd6bLBvFa1uN/6Fq7wmqZjH4zbVp
 nZ1gcC5QL2peZdWdNkdbpqkhM5SQPFC2w4kGpNxOw5NhkhWbA67sqoUaJGze6K6E599IN
 SryULHe9nxpHXcd3ipA2Ss8uhgNQnGD4HeyVi5iu5jMw3X+JqHvMI3vdhEmQZitoxsZIL
 8qn5n5bB79YA41He0IBJVHZY2ixVtQ/7c2NI/sBaYXOk34Ld9uwYJrjT9SKGDjOFecA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qkR2Bh95; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qkR2Bh95
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F6DA40ABB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:19 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822ab75c8f7so661969a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061758; x=1791666558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ljQ35MwjAotRGAPgf+HfFgnlm0qy1vHsVRico0dIwSA=;
 b=qkR2Bh95eIIuIBtb0lbMYlryAISreFaX7ppfOGtCWJdkfzXEa1flt3obC0ydpYR+TI
 7biqUV9Kn3fFLzMLsesF1XSZvyouDNfmEgwJfzJ2aHsI/FVbhp7M5CZaW1ZZe2Ol8nOC
 A6l+g3CbAm/gY2AJjmnIwbAAkgyz4E6VMgrNHrRG6dwOHzyu/iO5dyXWmJsfTRuh2vss
 II0zNIKmFY4ttkiVcRpQR0w1NiNbvtNJokcXoGbHa9R9UjYEkc2OfrXp+s2x7daEXSsH
 vtt7f1xdgS7qZKvOpo5wRP53EeD+qaVMRk0SqwtdXSk8uc6NQrQFZvi+TWn1aibSpX3/
 YQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061758; x=1791666558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ljQ35MwjAotRGAPgf+HfFgnlm0qy1vHsVRico0dIwSA=;
 b=EVw030KDt35ROPE4EiPpV5veUzVnZQGQxa7bGS5IJidHvx/wJnqgQifRoTxy82na4n
 ohxzltCGUlhI3g0FU7rVflOydK317HMHbqEio4JPzDOPhIc1hR5mR5rUG5IAkHImR5mn
 OANgn0Ce3Ia/B3oLZcTSloJ4U+vT1QTInBBIzxhb9aU3MsnEchHQ7moBDdZ7RYNk8Oob
 ifdDnm9m7X/LH0476spC3N6ssK3Pl/mwthj+AiCfDocPGXqW7dOwOmDVfKLxMFcFWII/
 mpiefYwwaW+L85xuAjWXcVdTTiQTaWNTdfPoYCkEkwJeijD/JO/wTpxvc3m6tWy6rWuU
 I7Lg==
X-Gm-Message-State: AFuF++mwUJhMMwckvAr4V45OZYajNa2xElHODioPOXeG0c/AOb4WfM9e
 ZTBU8z50URgK04QnEpwPAefcf8hWjnxRaTPS2lm4YOhpjF/IrjehTD4+Wl0qKA==
X-Gm-Gg: AYBFou0vukuWxezLffse89KvWkYcEhtYwquqgTRRJkJGdh553gzFROc1Wg4Ukj1ta+M
 0AHOTu9ihnKLi9dsoygOyP8qN9HptNRAGRr2kpA7e8/wT/+mpRbURpCkXo6DidJ6k9GvCNLB+DX
 w+9n1edzW3jgw60Wg99fgA6YVubI5KeZfq9QJpvQKYbzM/lv7EO9n/beeBP+6272W2blAmkCRLv
 tgeCHjsrOToG9uXUvE8y0G5vqXayQDefM7g5zOJMnN7i9R1Bti/QP2wkPI1J9AgBwsKPR+FkHvN
 SD/XmQ38669j7+359BB/HOkijz0gJ6wMrCHISw19v3T6GJydwwY1MMmRRNAY+9GZTrotcCUtz5g
 Z4CY/8WQ38Bq0H2z8GxVadamXZ97RAiyJBW1w078saDk0mXSOrvHnv9oiViV0yKDNrWhH9y/g7Z
 MhMVwDXjjK4xrlCCkjvzc+9fpgH+SjTuFlk6hRWEaTfq1f9BBfWiD2mumyaA56cKwd4rd6SlNO1
 UyCIBODvmjZEeQr/mzwe50DF1wCCyVk+SHix4QCKrCsCM6uuS+9t6RUXb8bxWn4tOL2ulfPgZdC
 +4GM9KopZyxnlL0UlgA3dxvSdclNLzQGcTwdWN6BisgDU+SSIwal35GYMt8pwktHNmKe7UduFrs
 a2FCNJG44XYrcREfXk6jtFfdmcbSwIzl4iPdOvMUw6Q==
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id
 46e09a7af769-8227fa8f917mr7303891a34.4.1791061758372; 
 Sat, 03 Oct 2026 14:09:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:12 -0600
Message-ID: <20261003210833.735937-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 17.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 63ead47a25..48fe192749 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  1d11b405b284374774d43bb70a6faf92  websockets-17.1.tar.gz
-sha256  acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a  websockets-17.1.tar.gz
+md5  b84acf3c346484f3993dbb498e370aba  websockets-17.2.tar.gz
+sha256  36c2fb94c990cc2545143b12690e2de6c16300f9dbe5b4f33fa300cf57dc8792  websockets-17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 35d1b9f824..3a6c50cb09 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 17.1
+PYTHON_WEBSOCKETS_VERSION = 17.2
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/18/72/fba934cb3dff7a85d811820efffcd141ddd52b5a2a01637f64551373ff4d
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/01/89/3f825ab71c242fffb62ea8fe638741c290f62f8d7aadf8125ff897747af3
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
