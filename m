Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40E4CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF3880EB2;
	Tue, 13 Oct 2026 16:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nNbiKWbJx3P; Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8CADD80E93
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909828;
	b=T0ykSMHavxrkxc2+8Pe+Tb9DTBmEh10L4Xdso3sCZKli+ixufeBiDBbs8WAPYsFqRtac
	 dyAvYuZPEjD9cqEOVtp1jATER/yT70bRiazYJuvtSMp0hDk2th/qYPsJR0NHEB6HSP3s/
	 lDj/RTVG/b8NGgGcSdMynFSjGhHNoHBc9xxigJVhi7pPJrNw4SXvdAlKeX8mUvAYAhCrX
	 u6mUghV1UgVRw1ocKa8X/hSp9uDPwKHsUZ2Iba+5+1dB81vIZJn70P4FkXdOqJsfzPIUV
	 lEBHZuZfArRaiUubF/u//8O3OszpPjo58wkiQmKr0SUKInBZuilHK27C1e6JHWkwTqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cnN31ZJroDPXjgPc8/7j7kQLw5fnl7sAIIsabPz/YrQ=;
	b=D5K6Hz3qyqCpZHCXvITBFcjA5q+aQhbr2gmJgtpdSVojsO26m2hhBccMmCi+EvVJMV0K
	 lT4ExuHtFifg2qBmzqTO4xgBJuMRLwryoCGpls6rlAnejmD+vV0pO7T9uvpBfhQO+jXJw
	 3D9zxzOEtkv8kFOWGFVhHb9zWri1swCWFQsRQpMM07+FYkwjKrGwiuhWZUFiXiEg4M/VF
	 L8e+LNCfz6tqGuAAaFDaKk1PtpW5qz5J2OtuZs2fLolVPJ+bgACP8CSG5SmBe+vsiNokW
	 saHsu7AceeNkD8DNiMrmOaqmRy/eg+ZFgZhiNeGXqB+HvOoiK8CqJRh71Q7ro6esTMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909828;
	bh=cnN31ZJroDPXjgPc8/7j7kQLw5fnl7sAIIsabPz/YrQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XUoeOK2pDpPUTOtTNWht3eoH3iynjZvuDK8HUJSb5clK1evzlF6pKfwzikbPTN5xA
	 5LI6gJjwtoOOs3NWQF4rG4eMXdJvHXWftPkN4WV5vdCHaTCDOcBqhsz0rmMpyxOARw
	 dGwjFreX/r28sZuzk6FnTAv+U3XyCCmU6AIT5UmQfXVPClszWlWzeSQRQMoRNnLdY8
	 LsuBrXjMNP0kF9cQs607ljZefKe9TdDJP+R/SmeHB83Wn4qnb2iTaEdCovubUXUSOb
	 7aXlBOqJ7TLyJUU2kkYZa4pc1w5ib+onjkiU+YDwa5sna2VpiDL5iq5FUxB9Xl8HyY
	 /nJV1omzwUu5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CADD80E93;
	Tue, 13 Oct 2026 16:43:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E8C9DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20772607DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjeUmo1X1GBj for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34292607CD
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909821;
 b=pxBMvr+pZUQTZPOMCZDSU83nPADMLqN9LqDH52TGQMh1knzwe/B9e4yU3kd/sgNTEIWh
 zYGOWwNK7tw5Pis6ruk0nKEsJ8st2wR9YTnYZua52wIQlzfcMNh3gO2hiMAxT5+cHUiEi
 rQ1irngGMJrdnCHePYv8cTeISDxi1qWrfG/18PzZrHAnkO15RGTtPVBh5ithPoFEYCmC6
 7zPzQ9ATWqRv4mDDeQjEE/HrXsQKtn3TkkH271ti/GCehDDATbIIN1Vl6FbLXNpFMxqJR
 nWyzwAVvo4wIZUN8H4Hf+MT6bf39dzep00Ll7q7F1Jht+BvOeqNEEL2AHTKXhtCG0Zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909821;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=TkdF+ID/Ve6Blgm/iGEwLTqqHGjnqk+aQ+X3SnXysww=;
 b=ITPBKEzyioHUTXlg3iIqDZ3n/QdODtHqSzmeJ1T/zp8H+Xx5aYUjeoK1g2gyGmRrfoTk
 LiRE+VP0aTfr93Pik7v8OAYOlOt5tqbzohwfBj1QvVFz1YS0aRTDZrvLmWjkEsze2jzQy
 zHaDgNCNu4Fj7PAOIisoqVmf9ss5m5FuUBYBO0J0O5xdkd8WAuDwv1PlIgTPIDqPaZ/rN
 j0uOeP4yBNxdgIfk150Pzb5RpaIYLNus+oYyXPNw+mCveBEgzZVT47k5n4rLkR/iblY7G
 kE1i8BHo6zt8kBuQOunsibu2XbHg/8Qs1R4WYnBrTfRL/O7nB8Z+Ntpk6dtO5rusQTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nyGYUaPK; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nyGYUaPK
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34292607CD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:40 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6e560e00a86so2460818eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909820; x=1792514620; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TkdF+ID/Ve6Blgm/iGEwLTqqHGjnqk+aQ+X3SnXysww=;
 b=nyGYUaPKss833vWPxklTxK4xrW9r1XTKGJKymzUD518ab5GyqSX5HkmKKE0rBCHmq+
 9Age7l5CWGIlv2HZwceQcdMnVllINHaDj4XdNTWtc+ZE4yG4s7iUL7m8OJ5jPFojV9bN
 Y77YTtkI36z9ql1F7/83eaMggn4k3a7hA72ctq++gfSLIwoueR5bztmqF9siel+z/qc/
 VIPRE2U5QMwr8+cY59+wODx3Xa3IRrFMltKZ92BO2oCTK0vBVpONGfuwCYfzbX/4qTLi
 FFoDyl1C9d0XXN+jlcChTESR/UP2D65MdOdOZ5RzkJeR79xu1FaPSDqEbUKwZlaOwm3c
 vbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909820; x=1792514620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TkdF+ID/Ve6Blgm/iGEwLTqqHGjnqk+aQ+X3SnXysww=;
 b=FIVzeuaTWXn//0YiJw/xeGSiYx+6Cerdfread9ZYIJTgTXoTwOeBj5wYRzwe4EKivJ
 eRb648DyWFYv4RAG2X5NOHA6IRpANfNSPi4E4t4LAFWlQNH0+VUwtW66Lc52cb3BDsAS
 BK9tigmSQttrH9YUNR/sc/k66pZfsvr31suTnQGlZq+NQwJpmhaomxQnKtQjnYTtVhyS
 Xjkir9WoizEUcRECM5AHG0PG7H6qbu60HNQ9Rv7LUiZ+0azquK9jjG/EqPkmxZWKwH+y
 MDiJvTfDWqujfOg4HrqM/8LXDgjBsbf8CFZ/n4/gKSgCKffcjG829b7aQ5lTk/ySzHro
 CVPg==
X-Gm-Message-State: AFq9FYKHBKeRikxEXjIOMs8DBwrP/PLQxW8qSLW6ZJlolc2uX9Az6lT8
 z0I2uVPzwQ20caemfhitPFbcdA/l8pztaTnZ4xc/Avm/IXdB97xI+dnX2yZWLQ==
X-Gm-Gg: AYBFou0jctrqgz76pokjlvJmlGWwEPPDoniMTv2/O4NJIsgBxjYRQJ5ZgxWFyf5bEAd
 JoUlRXUHORyOE7RypCK/nqELEn5Snzfbk/0oXlDE2ipQ7mzno1WEZj8irfW3cnbLH4rInVPPngQ
 uTkB19zT/4ayg9JGj4/JSpn3RD2M0yl6wIiyXZaEIgJn9rXoI8OnSLrOijLXndS8k06jjSsqXv4
 x0RA2WrfuqcpHQfH8YHz+OOUDEqL5Lw+ujbUYeGodFcjSeI1x4hbr4JDC1ZScq40oyeP0hYxVy+
 2PwAzqZTCwP4Fk16sggGRveO2LpC5F0ALQ903Qn/DfBqF+bRZm42tYAtsZmuSJUmUZgIQIM6dan
 izZRkegpmuF430RfyrYpSJLKNHx0uhepNytaxQttMAn1x8D+0ZtcL4e4iWqRdprHW7BEEClL4H4
 2A0QyiaZplFVOKXBLLaKcnLVFKkVwZ964UTcawO9fCsZDsDP531F+3q9PQ922o3Xnlxj4TanJXk
 T7eVLvgdWh6F6GdlxdSH8NN2WIA3/99J+bJEd7FqCffjI520PH0zQlF5+ll71Ygnlw65eFefKGx
 +mO0HXmtwPowwOGlfR3UEB1ODXZ6saU5BdAxIw57FoFDxRH7Gl7C5SKw5Ewu1y/sUIQgD9l4SKo
 7y8NW3JcmZv8Iadw9r/UQOW9UXJvkvT8vphCtwLLJ4j+s6o4wNwuUSQ==
X-Received: by 2002:a05:6820:1786:b0:6d9:2dd9:1684 with SMTP id
 006d021491bc7-6ef0f99b947mr9732936eaf.36.1791909819749; 
 Tue, 13 Oct 2026 09:43:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:14 -0600
Message-ID: <20261013164254.1476592-28-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-rtoml: bump to version 0.14.0
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

Update the license hash for the revised copyright notice:
https://github.com/samuelcolvin/rtoml/commit/7e13c7f615ce378fd5202c7aa6331e11b1da6782

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rtoml/python-rtoml.hash | 4 ++--
 package/python-rtoml/python-rtoml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 9f40e2abdf..c325b2214e 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9c9cd121f893bf7e8360519df29088e97d5455cc437d9400d10757ac84846d17  python-rtoml-0.10.0-cargo6.tar.gz
+sha256  4fde4c37526891406798108ba24f940cc039365131cd5925ed6157ddb1ad595c  python-rtoml-0.14.0-cargo6.tar.gz
 # Locally computed sha256 checksums
-sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
+sha256  707bdb34c5b967650d5f87a0a6da6da5b8b323147fdc4f3abfd329ab2903a0b9  LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index d5de20f832..b99e566925 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RTOML_VERSION = 0.10.0
+PYTHON_RTOML_VERSION = 0.14.0
 PYTHON_RTOML_SOURCE_PYPI = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
-PYTHON_RTOML_SITE_PYPI = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
+PYTHON_RTOML_SITE_PYPI = https://files.pythonhosted.org/packages/da/fb/ef915d0c607fb92674b16e15792ed9d254c9db0b3fbbea90b7be46fe3e2b
 PYTHON_RTOML_SITE = $(PYTHON_RTOML_SITE_PYPI)/$(PYTHON_RTOML_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RTOML_SETUP_TYPE = maturin
 PYTHON_RTOML_LICENSE = MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
