Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDA6CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6346360614;
	Sun,  4 Oct 2026 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2IfrUdVJMq5; Sun,  4 Oct 2026 20:25:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4E76060705
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145510;
	b=T/Ko0RBKILoS1pnJjULA3ytpzx1EPAj6wfP4it2qa3vZLaQnhuKB8QxzRxJanB1/ImA0
	 IaS1loyw/CXHgI0M93omWFsvhsNuIyf9qQWTGbIYRu+pU8A6SY0EaKpRHDtBlXNIakhO7
	 AYAZ3j9hx6HF7oH4k3szJveJaQ9sukp3E8aU50l8VO5NWWYWGpMET9N8HQ/3i7vOOjQk4
	 3ln3tokZzgWDog+Qe2YRuCDgDEgHRz+DprAd0znYBLo4EzBry8NMxn9j7VEqXxxBT3NbG
	 9iC0llgLmMw0iG2N2EHMPgALRcTHPnGdC5XjEYkJUD9Skii0rZiDAcFDKkgEsQ16PZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145510;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fZR2JLx7dGujcRE3chRgGSz9WTAu4sxSeDIXmnnQXJ8=;
	b=KX6OwquwmluONmK84KJO1gw3XjAi11Acvx0GAFOXBRDN90HWxmGdVbmpmoeanII5mAYI
	 tQz71Gk1APkqUQNW+DaiGfoMf0j89AO0JmDgOwBBSKnHNCCkjSJvR0a6431zU+OPrCg0K
	 3IhfnLDH1n0Z7Ye56Rc2AnDrSNVz6J+RZdOULM3/mHDOIZehmN/+r4L22aCCHWaWhw0WF
	 pTk+lnjgkmwnVrYcuTbeBjeqQADf9tFb/bbewcI1+hsiSMCUmqWweP58/dNbIZ11JVyjZ
	 Ir/7rCqoWrYUmUmeaF3IOJBultlKP5Yt5msK3e7G7ucCey9Bcrw219o1EdfnlyKsEIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145510;
	bh=fZR2JLx7dGujcRE3chRgGSz9WTAu4sxSeDIXmnnQXJ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J/8zqBe/viyJJBychoxDXPEkivXiWEkX4bYunJh0o/XWqWymPPr/mPII6oFGYtwVd
	 XyI5Rs96yp6CMFFsi4l/CpCT1AY5Hae1wK6uoIDFjR3n9VzZzSKBjuomRpDQdFUau/
	 jUaO93ZXtERuc9HuLvih62q0w89KkIR4Aw+cN27qayJABQv9xKOnH5Whqd2gP+5odj
	 UNSlvKnpg9GkTkRRfok1tV11HAN7EkwfdTUQUdC3NvYchArC35fwviQelv9uEhqiLq
	 Xto+SiVXshbeR04eT2sc7JH/cetJebWZ4k0AMj8Neu1rcI++osAQ8XORTF12Ezf9lO
	 j+wxBG1ubUGOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E76060705;
	Sun,  4 Oct 2026 20:25:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4CF335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E12180D36
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RryC59hkIaTb for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7313480D23
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145507;
 b=mW+ABfbMyc3ppsiJGxCqKQh77Y+nN9TutHYO96pKSIJQx2JuWX1aOizrxb6W6SWxmRcm
 gkWFjtEBubH3B8jQKw14q2IJXMmtO4xTOeoZGVWTdB0gov1dVwMLf1Ffo0sK8UYnz8uWF
 Y6E9Dhct6GvBXAurZhLQkG6E5L0HHP+9MoaegD9thdvh2Ps9uEtL0JDDesf0RjNVDmXAl
 8QkDVmBZS/HAP2QeD24QqN4nL2HyT5h4eXmv3+d1RtvTbI+z9xlJ7AB+YtN2HSLknQIsh
 QCvYa40Pizijxu8X0KriALqfIInTCGwFbUjAPQGoHeK9U2evSdPkQ/mTgeDnD2qgt9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145507;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YOr+rqbSMo/aea+Ywwbg4ClG2zY3Cq3xu8HJgyPUmqM=;
 b=QWBuv3Y0ngVMvxSMSzRaxYEAQl29uBtuEt7VfXy7dB/Pb5KO7ajm4w45X8IiNxzuFRaY
 esmez0yTSHl7SLtlyD0siwNrMdLGQSFEXrefh0/4MHJ2QkVGoNKKRfjzApY8OHjqsIpB+
 c1t4udaeIDMAtuoBzEsmVnTX+6CR10Z85SsMDUGZyK+CZ0ROD1Ep6cw1NNCoiCJu54eIv
 dZUgfQJxx5JvXCe1LA6ExtrRpST3UY0+9YRdeLHleKfNF6HbqC07lftDocedoltWZoxzI
 fw4AgAo23wLkQduQhTSP7bsPqaN7fnRGD2wjZr+CEDutcj9cnYucZwKyTksb6xKX3WQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dkSmU9VR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:32::11; helo=mail-oi2-x11.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dkSmU9VR
Received: from mail-oi2-x11.google.com (mail-oi2-x11.google.com
 [IPv6:2607:f8b0:4864:32::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7313480D23
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:07 +0000 (UTC)
Received: by mail-oi2-x11.google.com with SMTP id
 5614622812f47-4c112aaaf04so556923b6e.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145506; x=1791750306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YOr+rqbSMo/aea+Ywwbg4ClG2zY3Cq3xu8HJgyPUmqM=;
 b=dkSmU9VRxCtAhzGWqJuOUT/2l14UAlKKYC6Io6KKnpMHHoDO21c2npz3UKCRT+nNRY
 OE0uMtKkFTAHXJh23WL1sxVuFHDZxaAAoza89ter18hNjuNMSLyhwG9a2S0iuD2z80xc
 er1ryDUHN1nTdh7fp6Dqrsa9qE/hFeMZLN6dkbq2A1G2jlu2uzrAzedYawh0YXDc6SzJ
 udxNi3PL1e+W4pWHdQnMxOTy1I/YfQE9ZzzLi5uXOXOPVPNKoyUx9vElDEu/Iaays+jw
 efeOQDHzZwMl+UcirZzNg4tJBDiIffJ1qpcUD5ddznBWFO6h0JtCahlnI64AVMck8m1x
 IdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145506; x=1791750306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YOr+rqbSMo/aea+Ywwbg4ClG2zY3Cq3xu8HJgyPUmqM=;
 b=cUtTYc15WDQoTHbBN2NiOJqfUl+rYCaQSmtVLyFEdpV+hz3lMtjgRKeloPnw+BQXPP
 G1MZJSlKUp3KQHCrBQvP5tka+OIotJ4rYhP6kYTBxvHLpBIO2VozWpHFOr1HEGWdOyga
 zihCO2qP6ddmuze7yQm4QnURddrxekYdYHVayuT+69uxtY2aF4UANH0dgPQnRFjwi4PE
 8dm9pIqc9Lm90xhA+4LWvApCXaFVPp7i5LOtgs4eFEYMFN3+FbRZ/tC8E6Lp6hvwgkIM
 DvhVywVKlKHat660gBg2FLI5gliZUb5z9/TB+EGWamJXTKIOaEfIRLoLka6LeK+zvVeO
 1AtA==
X-Gm-Message-State: AFuF++l/Bppbwe8d9C0jh3n+4F8PRZRQ5HEocUvjS+OnNgsPe7SStBVj
 g41xJp4neyHaC0omqLNr1KEUgXvuEoTdcX21Cb+/rAnxYTrgzz0Nx5oMHNZSTg==
X-Gm-Gg: AYBFou1RUzCyiUbrZfFYdCTLWmuIRpDsSIkSYi35Ubq2oJGZgmlvKe7hdbehmsCfqcq
 OmcxMbhJIe05UQsOQWeyj94EpBGU7819kwZwYXmckQ6RL9yK1RX3aS20FzJtaOYek9xmYC+uyz0
 XpgnmucWsaZ0xW0WYvvyMm/IQndfu0RsUcK+0NyXFQmJsZfPzhP0ng/0Vtr+vH4Pc66L1Hrqg2Q
 1OblL/BUtcY4EOLfqXShHjUnmXluuO+lWGnB9a+i3J5L57Kzk0XquTPiD3kQbRddlI5Z/hkI2Pd
 mP6RWHC4m0WyNmfVLa8WJ5+Htj+ltD463Ow+inIpI9hSENbfZt6Or/mtvqbw4H/RVN2s9C6GTbG
 75q1zfkm4ASGYile2HkVJd+sME2tyGHjQXc1UAXq52XCJ+xbqI9mG3nvoGWsXMJAeizDcCBie5v
 rUw86qM72qRCshbwdHwkEB0piBtx1eCsl7DXNQv64DYF/0w7QnzNG8LyWk138fkdmYiuDR3D+5v
 3HPS2q9hAD5lGed8rsjh+AtI/J9wBDIXE723EA0xcEEo0GtD68hnqNt7SWAQm38I57g60TKIGTg
 lBr+sv44Dm/Q8FNyJIXiG2Mo39E9AlOZJ/BQIqVl3LQDlOfLaCtilNoAuVniydXANj70XNEdppa
 GY2xuxhM7SE0N4rwGgOI/wYpLpd3vgov4hEZ7UhszLg==
X-Received: by 2002:a05:6809:53:20b0:4f5:cb60:33c5 with SMTP id
 5614622812f47-4f5cb603dfbmr4587229b6e.6.1791145505985; 
 Sun, 04 Oct 2026 13:25:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5251e3956sm7900555b6e.15.2026.10.04.13.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:25:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:25:01 -0600
Message-ID: <20261004202501.932522-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004202501.932522-1-james.hilliard1@gmail.com>
References: <20261004202501.932522-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-asyncssh: bump to version
 2.24.1
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

Update license hash due to whitespace cleanup:
https://github.com/ronf/asyncssh/commit/eed9632700b9983765b1720851c28a7dedd390ce

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asyncssh/python-asyncssh.hash | 6 +++---
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index 03427599d8..7fb836d57d 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  0b1bd9d856dfc1b283ae1cd07d2bbee1  asyncssh-2.22.0.tar.gz
-sha256  c3ce72b01be4f97b40e62844dd384227e5ff5a401a3793007c42f86a5c8eb537  asyncssh-2.22.0.tar.gz
+md5  dbe1d5ffadd6f17a3d59430c9f1dc781  asyncssh-2.24.1.tar.gz
+sha256  efcd36e9b35f79873535b06444a7c9b0a3c61d97081b208c7fdd3fd8a40f1eca  asyncssh-2.24.1.tar.gz
 # Locally computed sha256 checksums
-sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
+sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 5d4a056d32..80d1e46c46 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.22.0
+PYTHON_ASYNCSSH_VERSION = 2.24.1
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/0f/c5/41a0d5477865c48cee65050586092dc3ba3fc1c52e29b47fba08d3a44581
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
