Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10CCA5FE6
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26B640E13;
	Fri,  2 Oct 2026 20:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzStpjcL_6Oq; Fri,  2 Oct 2026 20:55:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E0AC840E0E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790974531;
	b=r1PtMsZ8RpDB54yCCCJqPzLaA5bLibUZ4tOytbrxB1gW5u1WOWy9yW2d1LIaTYo0YmJa
	 CeYC67yqcAjSI/NykC5eeTfCw6P6P57Cc5uT+H5ruBVnp4k12KBc9nKchDaL8fKcV+66B
	 drzp62p9kvnD4aGKu/6IRDLhgYsyswHsQ6um3/ewXM867PgwWLAD8pTS1sI2hDziheDzA
	 Q4Yjj+xjDl7IVGDggy4uVw5VczrlL+ap+wfVH2EJESkmk6ihOD3lAZvGDM/Rq5U7dkuUZ
	 tP6mBqxlJ5nEoyGsMlAUg87BQAVDXSj4PNeLP7Rvg6ir42TmaeADQ5RC41RVyh7Se8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790974531;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vd707kaSGgrZq/c0mUEIUqSqCwGqHewk5Rk3zJNF2j4=;
	b=NtwnIKdLh0ecZn8JX246SmMrj+/xLIOkPOC+l2aYfPjkLZVHA2hRYoTPnAUUrDsy0Rl9
	 Leawz5vYrUGIvpt+cx/4BFje9kjDpk70NWwrBcHjoi21ObECOCEsRO596MU/mR+K0Ph7P
	 nDBmwa9wvsq8xDlGlVGTqdzatnRq5HxaoQQVWkA7vBiwoiVcrJHOBPuP+XH3iZhn40Hdc
	 wYqW4viag2l/uMA1Q15fWNFRwZ6Rt68s291kuv7UB2FJf9UgAArV4Izn92ChjzxvDlckr
	 QEBIv9YXAN5J/2R0NI8kQ/lqqPEJjWAMgWtm1hrPP2xmLQSaPsZGoOMVbIHG3p+6P2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="sY/ZQBAk";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790974531;
	bh=vd707kaSGgrZq/c0mUEIUqSqCwGqHewk5Rk3zJNF2j4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z8IMwIqaUa3vGdHskzrpcc17CJaPQFoFYTls7DKxXFTIpJTHWq9tQ+9OpB5TnF3sn
	 KZ64qW4HECtiAaKutnjGk/T6+eE/KhSv708Lv52/iuqiK1/ghrzrPl4GJwjRa88pIu
	 0haoCdxXOtAx8krcJrOH8+Z5XDmNiJEP0Os3p6c6mNUv3KvIq8yDrKP/9+XtlTbe2Q
	 rvjflHO9+0G3IDRsdeX+B5WZC6b7C0LbT7Ed4NKn1lVtNOpVVhnGdHm8UPtXGFGI46
	 mAFQviIipPVHJzXqe9t7mdce90olBI64pEx9gSnZeO/dehm2N60MdWqILfNbgdbuus
	 cy/uzANmJ3dCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0AC840E0E;
	Fri,  2 Oct 2026 20:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5982E0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A687740DFA
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxZdBO3-ekba for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11FD340E09
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790974526;
 b=ix4/fApkUIscq4TUiUEDi68qT4AjRmjy8PTCa8Y31zJiSdiRGPvHj2OSw6mRrZYcsvnJ
 EAtSqgTP0r64kZia9JaiRFrOylMTiO9f0khERUZhTrMmv/vQJ8FRfe5vN+bHDPebwXmPC
 tAs6vbnQwhxnPgpcoaIyvG4ERPwrpHAbTwAdQGHn6rE9uvzUplV5dUWzZc/uqg6bH7tN0
 LgiFkQDEjef2hDWhSM9KznCqOkx5gkvIPaVuIkePj2/aGlUeFJOe9v6WKn0HCEL/0O45l
 6mAN/zOv8gSNWlCCRVgPvUra23gw+p36CJAS+0o117JD6YQVCU2tfdEaoqvVNJA4ifA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790974526;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=q6EwL374l0clgxQO9cLWyNwVy+347o3Bf1jVoQm0Z28=;
 b=gj2Bou1W9AbAmICfwQ3P8pJVSlK547kTeBaMXfNO8OABY/Nj/9TTZv9hLF4Wep4jaL+V
 XzACQUgc9oGycwh0QsHdCS/tYJLzur/yCAOz48JVDZxmN6uUXPkg40Th7XdQ1mhn828/3
 wcKktdmvaXBVh87pUrnmg/P1Szmn5d5iDWOTGfwuR3cy5b4cL/OpnILLW2X92o6/b/rek
 tHEHNlhT0oF8mtO2hZP3QTF8epwO7cloPg+gf+zgLBS2anLOXFqDnplih+VC5zJOjO55F
 vyqdwMg3qr+uNHEFfIMFBBCg9Pt4sn7m6+nmT+tEEgQQmtiGYsMtiCG96QholHdIlsA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="sY/ZQBAk"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sY/ZQBAk
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11FD340E09
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:25 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-80a71781323so184041a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790974523; x=1791579323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q6EwL374l0clgxQO9cLWyNwVy+347o3Bf1jVoQm0Z28=;
 b=sY/ZQBAkdk9DUrgVVzIhj95PMMTLdZEi0BZmqgikJbIGkSPAidqV7+rUue6Lx3MjHj
 QNanVGjIODS48IkFf8nm9prxhxMi3V8F+yqiyZpP5h93GUX4ZpT2zPTWq9Ms4qMtKTSM
 uFYjBgceu5RIFCXn/R8FZOdsh4HqTvi4/gRL1Kgg2xg2x8EAq/k+od+/TNdwsajUvkXq
 q9zvKBw12P6yBJmx8yITe7S5yGiYHE1b4Nw+0PByJl/8uo9JV4zQr9PVUeuPN6XGLDPk
 KfvrFMtgWvudhVokIWmI6rnxyLLt1kKeZ1KhqV6XGvzfLJ4nuOLqGReatp+5X5EofvlH
 kmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790974523; x=1791579323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q6EwL374l0clgxQO9cLWyNwVy+347o3Bf1jVoQm0Z28=;
 b=RTYSOvi/z9XO5NHfD8noTZNawVkYm3zQFAXjrCGxRXuCXAfi3Dl7pHNsO9+ZzWnO54
 S6x3g6j1STfqy7NG8FQiO8FKSPGLQ/hFrqrt3Ntf0imPZu5/9Vy0Xqgor4yzeoLQUPWt
 HZRIp/nwiwk7qgSSmy7Xwyjtw234ArOrsDMDg/va8rvqSPJWlDiyYuEi/FfgJKPL+2hF
 ViIInoPVwRdif/gGJClyRVE+j4xE4G5RdD3hfGuCp21mXF7Gi0j1wZKEsJM8hGVpjRW4
 asOVPTzyiD4npRx6HHUkDb50PknWvthrGnF6qp6/DvmdFxBy+Uph3sGonF4WRbbpYw9m
 1IpA==
X-Gm-Message-State: AFuF++nxvFWPypZFah8Zc1ruH0VGNTheqiKcwSYZPiCl5JOdFPrNAIfL
 O6eCeF21gwq24qU2b9ZvW0OdowiK7zURgUI8gbnVXwTjcmr7d+U8JaQvCqxSvA==
X-Gm-Gg: AYBFou2kdu68ZZuedPzzka+fSQodn2zDslHThTZ4gtbIkvj2rUmYTZpVU0OGE+3dTV1
 zqQwW+hrBMiA6HgM4iilDxlz7rjklFy2DhQCrfwsURHI3v7Cc1Z51P0zn01I1iV48PrtfICZB+i
 45tAmRvIncQxcjBihnlzG3ZupLpR2qor/15jIeZYnCqWMDpGvytDyZw0W5BXAaHQdDiLj0i1rGD
 hXU9UJwMSF+lnIaRk+OlwA56ryyIODIRFnygjLlrSZDY5IHgZEGocA4MW6sO4by+FVtAl99QGXf
 nTovsLWyN9RxcluEptLn51/BlPszY8YGm77De5Y5t1+nFJtMW9TYlS8Ut/0s3LXzMw0N/0tGYFd
 rLAgGP4H3/3YtEQ48EOe8s68iFpLIIjMdzWLL9qMst5TDCEepjIxzCDMcGntldCMJXPZZwr1kma
 bXgTqfrLhnz5SJzbu5QFXf3ktchL0ONdcfQLEOMx9hN4GSUVNDIvPTXM45M2IUuv8IJzo3JJCUU
 HRQiBQgEmjpo6b+mUg3P7Rd4iR6KlAwoXewPnpQDtOuLwMr4qQ+yRyeuIowcE/CJEdhcdHkNtuu
 eqPCc5HxO4+nQ5sOX2x5eTLXykm8UbKqNxJOXp14MC/SgeyVZyuE936pEwsX+DIH4DkYc1N5Eua
 +YVhmutUdTVYTHPulwKQy1ictwPiyzilXE+FJ4/t5CtjGNw+zOuny
X-Received: by 2002:a05:6820:8188:b0:6d8:b1c9:6cad with SMTP id
 006d021491bc7-6df32da222dmr2842308eaf.20.1790974522596; 
 Fri, 02 Oct 2026 13:55:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a9b0f1bsm3197929eaf.7.2026.10.02.13.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:55:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:55:13 -0600
Message-ID: <20261002205517.4043570-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002205517.4043570-1-james.hilliard1@gmail.com>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/python-dunamai: new host package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dunamai/python-dunamai.hash |  5 +++++
 package/python-dunamai/python-dunamai.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-dunamai/python-dunamai.hash
 create mode 100644 package/python-dunamai/python-dunamai.mk

diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
new file mode 100644
index 0000000000..87a591ec1e
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dunamai/json
+md5  f9ab2ba10f2995f10abeeac80c9d0f60  dunamai-1.26.2.tar.gz
+sha256  84ea45eddf9bb4b40df7610b1b22a03137365e6257dbf9d7b72128fdccca564c  dunamai-1.26.2.tar.gz
+# Locally computed sha256 checksums
+sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
new file mode 100644
index 0000000000..3051dd24a1
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-dunamai
+#
+################################################################################
+
+PYTHON_DUNAMAI_VERSION = 1.26.2
+PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/12/18/020d3b27a10450ddb11429f637404e8ea67ecf4d9fd999d4f1d553f25506
+PYTHON_DUNAMAI_SETUP_TYPE = poetry
+PYTHON_DUNAMAI_LICENSE = MIT
+PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
+HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-packaging
+
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
