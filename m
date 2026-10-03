Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16066CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B1781509;
	Sat,  3 Oct 2026 21:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUd6_-4_gZDT; Sat,  3 Oct 2026 21:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0BAB18146A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061764;
	b=RrOb3qfHUt43fXV94DWoAd2txav5M1OW9GNtJeulTxFO5xHWNx3R7qulSHINUl8/nmlr
	 4AFejnc8oRllpogyxhO5pLjfTHTuIronBSfsMhcc67VE3lQLokhkS67GgMRra92OmDh0b
	 xn1CVFM1XFhkl7s0UJALoyIewKDlFw/r6u1KGSY7auskli2qA5ea/MZ16ZzEdEMiul40K
	 9b9wRPBS6D7ojOE3IjBrKPG9VMx1FRmJ3pOFk8MWlPtqyMd9JWOJ4Wcu1Cic9u2VxdM47
	 CnnDht1esON0gQV9DUE3uWtc4cs5/Mtmj2EuO9mEmABkR1n5rQGeoJIWove6v3pw6Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=W+VxXOWKWXqWK90+6Vht0LxnwEyDWCxRcLxkc3VDV3E=;
	b=aIzTX3a7Hu1ucSE9IdeMZVZBnnq5qfQL5lMTWJmlKvHrCk0FxvDIkb9D/M5skLNa6cH0
	 41tdbYJA2dB6w1lnrG/Zxc9JFrzJvenEvUaA2DXEwVxG72yeG4CBjzOfcEPc18OTpdGHh
	 W9Mr2C9VXAfSMkJAoSYiiQxIJoRATsg/nwHeSntdXKOpZ+iDl8MnBQPccJZQGlEK4EzIx
	 D4XIlymj2Ak2Ux/JLXigHrAQbBSW3gwYbEIRCCzKrXAxA6yOVcg8YDZPwC5d8eIij087X
	 Va6Fa2tBS2dqXBtgUn/f01NflfycBtn7pnhh/6M5qekz8uBDCM26396KrjQ+t64G4rw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OTYsfe1S;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061764;
	bh=W+VxXOWKWXqWK90+6Vht0LxnwEyDWCxRcLxkc3VDV3E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kIrbxEqpFB8PM38LASQVk0s48a6iM4Ir7ktHQczkuW/SEWQHxEOdRz+PG6I9WJKz3
	 b5+8HMCGUc8ayheDYltj8DQ6NRGnVPN02jDFCpUd/f7IzofiZ7ptRJYhPFo3+vxkzn
	 +WisNBUHnVDqEiHgGZ/pj4D7EDEemNPfy+7LNuPcSMC+SSf+A9DtD7tzOpfelWSNFZ
	 mOTTOHN7Vj+jeMGOETRctM/FH8nMKsXsK1zj3GZBn8fUS+U7lj5OcotJSJbpnWc/Y9
	 yYDn9b6DgpOZaunl8nWpsZ8nYew8ULxI88b7izUxMnr1n+8AagQq4PY2FBZ97anNk0
	 FOhc1+0/AFNMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BAB18146A;
	Sat,  3 Oct 2026 21:09:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA3C2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE7381509
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVdkSEklN4lG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B71AD8156E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061754;
 b=Zcvx48dH2Uwr76dW0zrXXLgOdX6hzxTojmMpTm5alhjql7LQge9B9IKh1JJtsCuCOZoq
 zmpD6yxnBpo6cBWp22mV66qXTrJQfXGdbCBrzFRzviph0Y+7D4MaQJGRKHGb6r0b3QeLa
 v1mikbWRO4nJTlV4AlxX4zmxTtZXg5bFRDcAwjDK+J2bn7mb+0gyIvYoSXQ351yIcWPFn
 YFaQc/Yj50tN7hG0d22RtW1YRKTXuYbM9YTBfL78m0d50NPdI4i/5Ptvx0Hh+pB7OYfTS
 f7oe1ZePUAE07UnBUwur3mPlTq3DgrgEwjFanvHhDuM9qKpKCMZiMlS/zyDOowU0P5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061754;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DXxanocdOpDnd+DkGK9ILY6vSWco4nmFU84tKqHQqkc=;
 b=amKEWaWfqbNw3QmAoFoYODWJcWdsbgy8DArBTqhtYonnjW3qWFjJmcoGctGwo+n2T9Da
 F8BM/E1XyBuL+a2va12yS8jf+RBipzLq+3EzI28xm5LXt4d91InAYy/Kuf1QUv+uzE+Qx
 NSpKPWHsaoKp07sfUJQslWrDe9ZlEdNdbbLD0DeSJ+Z17tuWpyy6GVHK4yhHYvZcbtcjg
 rO+UfOt75aDQ2KMFPkRWabn0NKHhzM5tf1pwhsh81QLZs8Im4WNmPdZwD3s7nVAMm66Kx
 cdyGMftPNrNIP/5QhyMbibEwz9Bw5xPQRSRQsH76PMqPQPk/NT+/DcRis4Lti9GPc/w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OTYsfe1S; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OTYsfe1S
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B71AD8156E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:13 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6df93f00f4dso406913eaf.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061752; x=1791666552; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DXxanocdOpDnd+DkGK9ILY6vSWco4nmFU84tKqHQqkc=;
 b=OTYsfe1So5Nd3nZp7/Hf9DpDOWBLrH5oAB0VdRxiYh7eE6BKar3x12B2ijKu5T2QWm
 Xx6/PRGOZrStDrsw1EBsmfR6lVVTPT0KpYyyNiRtZVoeIgdvfI0cfLE0gMGj7v6R+Tpt
 y4otYKPN/SvrVk/5e3pSdsI8SNWXSyZGV6Euwd0a3uGkG5RCqKAJtPlczvAjYuvUHZaW
 IR2M/D3G0jR5OWEDcA5sYWwrQMVxNggovNeQGZlxpX5Rag1sDM6ryR3BBDlBt7LWpIuZ
 QTUQ+rbU6iXKJ+2vJLaxfY0X8RDPEBeWpWQ7rXyeS0xY02vMhDUON5T/A9IDp3uoh8AA
 b0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061752; x=1791666552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DXxanocdOpDnd+DkGK9ILY6vSWco4nmFU84tKqHQqkc=;
 b=2VsijnfZ1bG0GMyfHYGX1Xew5rud5+WiX8+0dPQZqtVqMWIYIae6Gfdd8bakKY+exk
 nj9jnj+SZ38YzjOEc3VnxY6hijjGFrUDtQrz93v9CDMuUYM23qIpo80/AhjPTxt4o7y5
 G3L1ImxPFH0UJ1ZgvbrroY3ZnPP5pfF0STAjEtsCl6EdDuZffStsB8xVjnPx0N9K2AOP
 uF9/uqPR4HFxt82tflJ+bwPLmA6eu82rDICO++fnLr4ix1o2KE+yjUGY+ahJgCxzbc8O
 TVm27dEFeEsa3j8OXlLVDLAT4+unwEYy7LpfyaMoBR0zKqfk/J0LX3MIzCni8VcglpYr
 4EPg==
X-Gm-Message-State: AFuF++m9eO5Y4YBqKdj3sCjE2BmfySpGXV38JxAQfsz9CB0y5sbiAs9H
 qiQS3x6L08827imIzdqh0sKB2DhyJE5Jv+Jp615u7mte2mdSosyqW8I2mpk0lw==
X-Gm-Gg: AYBFou1nySoeKi0BbaDQ+5KDQhQ0qoNe45E/3MX8y8U6lvO7PvdWh7fpyXDHYf37UEY
 tEDXAWvBKG/J90hhXSW+67dIS2Y0/qGX+g37lM1IGyKknSbagxWWcuOnw1m+4cnxo7sJhLc62DI
 onU2P5ytAszoZNiUwu7B/Nk07r7qjX2Ks72TcLHgnNf32Zs8P/p2ADPJ1jLbB6Z0jHnwGUNIbyv
 GnxlqtXPAb4yo+lId4PfnYwdJO0AgZIhHB8hrTZ5qvu+i8vZ3BKRSD2HZ2+2GDp+Tgw+U1YnG9K
 8H/oc9/IHjRpnkVPbpBQ2YfH3a/Y1mazYhHBkTabY97sOAgZNr3AHkvk6nyiZ3PTC+tV0TuombA
 L22zwCDQc2BkTaK3LGYrwyuhnn51zz94VT9ZIXtrQMGBzt9aWEGwj9HqlHhsYsFY3/TqG7EPVLQ
 BXSQyVXpR2TxMGz/AY5UUeGmZ85V13FjFWmhoxLIgPUbDay2HP2GjrVHCxwW2LY+wBR3VjyGXlZ
 Ae2iDz0IR4HbguuWMuLooGuw1k3na6epXTDysTdVRv54SmPYnICYhlSJ7HBSP1JqR1FsCmByWzu
 v/6ZomOfhS8F5o4/kew7cWeX/JLnNPdsZs5xv9PMFggBRTX98ufgaO/1WnjygfbXnov0761UqrT
 4melZEDn/ILaQRSe1fLafqRnE2jV+vq3j40VcVbCBv4ShmriXzl0q9g==
X-Received: by 2002:a05:6820:993:b0:6cd:3ffc:e33c with SMTP id
 006d021491bc7-6e09f61cd39mr2836200eaf.90.1791061752484; 
 Sat, 03 Oct 2026 14:09:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:09 -0600
Message-ID: <20261003210833.735937-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 4.2.0
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
 Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 2601899777..86aff48b00 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  ceb8e049dc1d531998d321f6c1bc4e08  simplejson-4.1.2.tar.gz
-sha256  6ae4186f90362e9c03c80a1cd5062a20f3a11ac9d391f7ee0ef0701a0e2b7394  simplejson-4.1.2.tar.gz
+md5  a6aa722d12683cbdc7329cfa7b8728ea  simplejson-4.2.0.tar.gz
+sha256  55b121b70a560f4610bd3a355ab2015aca4f39978f6a82353f24d2013fe85861  simplejson-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 8e6024bc45..992bb79884 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 4.1.2
+PYTHON_SIMPLEJSON_VERSION = 4.2.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/f1/e3/1cc7dbf4deebc16e9dc42db37f473b5b612d021eb10e69974be308425171
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/2f/f0/ea064bba6c9afda0168ddb834f1c75a93351031e25aee35c046108e7f292
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
