Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC8ACC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 07:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4EF080D7C;
	Wed, 14 Oct 2026 07:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ut8nZTT5S1S1; Wed, 14 Oct 2026 07:37:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F092D80D59
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791963475;
	b=I307GAyNhMrlPGUy3vCYaE92MgQ0u97DA3dW/Vl9+Lg7Xoo0OT+yhMZT5rdFjm+XQJaI
	 4G7rqMi9MT+QtRLTH6/j7FcxsFfX5p/lb9b543gfL04z+hrVk67fcvQXqJgb38yJsoAzI
	 B+6O3M3WJsq5yrXfJSpYW70M+QU2I8SCZtFe2+MHlcNEwPLXt27ISKgf1Wdp02vkqyHaf
	 aPXXc5ooZIjdYsBqs09sxPC9tUoZYLsRP+sDreWY6uqPKvo/ED1c99z0CUjNjJk71B/C4
	 eQe/q/v9DF7H7MplM8eS2Ke+dEDnvXYiIA0tFxwBJIosBLgraLxg1EpDr5ZfTmVPvWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791963475;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MzH42gkSVmkTuhJvpBeMNivyts5y5q9+bAt5r6o5JgI=;
	b=tb/+A4n71vvGfPjL/LJ6US76NCgRLJyse7IAcf6YFH2fvyOoTREyf6GfjucumxBip+89
	 BFQEi7Ic1IRw8AsR9TJx85xhRGt57+VJkjbRML0auf91PI7dI10bxyLNGKEhb3rHVRMnO
	 5h9X3iCUYUhQARwKKP8cc8JyOAEZJhIBRaUkbjw/48ZB49+39fe8GURdh/Wcgym/hjcms
	 S9vYk6p9b0Ax+p723hqYQELnbOd/0kxfAGXXAwpeqavVLdgiRqUUQm76g+6oLqC3azlS4
	 uDJrXZPtbY9zLze0c057Md13oiAoyZnnQAtuV8gnt21EU26MI/IZcdoA6MlLZ/Jlwew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791963475;
	bh=MzH42gkSVmkTuhJvpBeMNivyts5y5q9+bAt5r6o5JgI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Wk2j7h/OCsgMJg2Ll5Tu65fdVb/GLmtVfK2Mp5Vje68EuIeSNN/V1SuMOMpgqxyHi
	 /aUHdwWnvgCh3CCvHXbKChB2mBjvVYMf0+jcWjFFyW5xUezLUFdOrENisPVcHG8wI2
	 dZPM/xpJyHIiHlc6OPG8f6S+zYegX0NkImgTwrEeNawT3AlKUa3fbHs9xxcBpzqElw
	 Xldq2mMoyWQA0L2RIj3zxPdFGJ9bBIea4zbIDiIyciSorJ+vyQzNiGbXPGoXsOd3Lb
	 ePTfTUuNCXcN1m3+lX1bAhkOe6Al2DdBcz+xPGj1WYKS42Jl/4FgfDLGxAQJPmLkt+
	 uO5uK9yV3GRFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F092D80D59;
	Wed, 14 Oct 2026 07:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF1B2AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E64A607EC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEA4yF-1-Wba for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 07:37:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9D5B1607CB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791963472;
 b=UlpmjgXAxdhtoCkIHjpWAi8ngBs52anwrjrfkDyQ9ZbVbpbo0qScYr3pauU8+SaILRFz
 h6o45VMNqIDQhtVoRo5I2wjNNxn6Ed8xQjvJi07iF+FhOFdPcfsB9dVrQjytzxiCk0yH0
 tPgmzjLJaUeGe/pW17qcDUpGt04WnufkOgx6VUfyS90aC1aHGRy8BAllTAvelP/ikB/A5
 Ic8Jpp050KqocTwYzD3ObGO2ojaCXL+lEB24ZSLPlEZPLAv5XWDWT/THGrp7TMQPO9UyT
 LCz6+kGNdZg4J7VM3coRdd9JZ+fwXQFt0GRBvs+fUjEsopGrQqdvBaQcUx9bP4Ass9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791963472;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=NP8dezlfeDjzea1QsU13WJWirk08V6+c9VKEOZE0zUs=;
 b=Nt1JO75NShek53nRSy/9rGA1dVrLNYuK/W5/nc0KAFwxCgThlR1uU4woDyM6D3jfTdUF
 uQgZGdw2XnAp1C0sKBcZrPnANQDQ1xQ88YXCb6uugwJ0kKd00fzWYdn0Aa3xQ8lNl8srG
 lItDymez4ySK/Q7uZGYR5WZHMWrfxkahbJKYfU6ef7UdqNEdklp+UIsLmcCg2MZsQnKrG
 qrzq33gLtm6H/NE7HS+LWcAJU8rvywhBGFOzrIZkXld4wy4fEOKfOUQYgwyZwHmWnkpph
 BOk5QiN41IAMY1KVpZ6ft/G/U6xxsPfUOfwgjWSY5h0TqD549+ESF2VhhEtpjEeep3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=X8whyvQx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=X8whyvQx
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D5B1607CB
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:37:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48afe75f055so102901f8f.2
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1791963469; x=1792568269;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NP8dezlfeDjzea1QsU13WJWirk08V6+c9VKEOZE0zUs=;
 b=X8whyvQxnoroKE4WUD0vZfn5WXnkH7IwgBA4arxg58FJ+Zk06V+qr7DXtZU/kzxAvd
 d03KlUDhxelYhoIK8NuF1hkFa3lQ1ObASZrb65o7R2wk4IYF3Rg8KOf75tgh9FtjsJtp
 Y9Uvkgpu0XoHKJIAkirscFuySf3TDBSz7uG3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791963469; x=1792568269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NP8dezlfeDjzea1QsU13WJWirk08V6+c9VKEOZE0zUs=;
 b=JxIE6BnQ0ZxYH8enEmkUy5BLyRwd+XkLKW0muT7OZfQkUUY+zD2lmSgUzA7UgM2OSI
 T3aZA1o9QpGcLVse8aaM6bV/uaNNndSmX223oSZQqpSO54TTuVDkgyGlGuuzyUJ5ZJzb
 5h0Z2yIyHf3+ENOuxOp+9r+uqMyxRUouX2i94xIK14oAeSXi+tcBnerhekvjigmd83IN
 tiT8s/8CbsvFzqqY797HuX0/ZcEqkscd/Gp/G4zaH04njpOEPVb0HGX9TNOpiqq2VTwS
 OfTqS1L5XCsgR9hsSUvEhtNhN6UONMf9xVgPDe3ikOcyOplUtMtoeDzrx2j6fDRHKVx9
 Eibw==
X-Gm-Message-State: AFq9FYLAsCUUf/1E5XPaudkIBha66nxNe3GYtggPzL1ZHhHIZOjTiDdX
 dZYNm1/dBtmlLDn7Nmt8mBcVWKKezFTYJGdWcwCJDDAjyBqaS3AIYE/M8pumoj1kNxoNgxte2DZ
 oK4A9
X-Gm-Gg: AYBFou2TDoaMOUXhQY76uyf7VXITlj+IBMzKVRjFBBwVvzqAg9pETiWqiyjX5Sl+Mn+
 HmlRd/r1zZXByYxJ25Vl1IQh3GLFiKt9spP30jIlXbuEUZqAFAmTLwI5Mnh0OkyjcJlu/kr8yZb
 Iy4GF9anTQm5+ADpJzSL2alN06jAPVZ9IIJO2WTczi/MT9/ytG5rJNhwMprhjuuce+DTEBmp/Ko
 MPKhUeB16rTP9rPtqTUToho+FdF+4d95jmY9+W99Ey6m4KyHmdfODRMNTYRJbZsnGWTZhyKUNZ4
 M9ncKZv977HgQtGR6qVH2wpne9pyqAOpmyu4+CsegQwoncLykvbvAu4jYSFJDNMDc/jK7gK9MHw
 F5g6OMW/l759Gd5qND5rQy6ceR1VolopcizXfkeq1OjtNCozrMMOEXXVK6w5KhdkxjfPAnjLGKn
 IimtkxiAQzoXRWVxwT40BzroA6f/9TJt3ihF+0A5izL6Bx8eBNKIyDl/ezRzAOQuIjsFPTLc2x2
 XD6Bwvaug0wNRjl1bCV1C3NS7sCWKoz4xeHF+4p7z3jh96gWMhDls28ZcK8+nLwteEq/qRgCggS
 tRA=
X-Received: by 2002:adf:ffcf:0:b0:48b:1296:52ec with SMTP id
 ffacd0b85a97d-48dbaaddbe6mr21081554f8f.18.1791963467018; 
 Wed, 14 Oct 2026 00:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:ad64:a410:4d28:fa10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de70079e7sm4993401f8f.11.2026.10.14.00.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 00:37:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 09:37:42 +0200
Message-ID: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/am33x-cm3: fix build with gcc >= 15
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcc 15 defaults to the C23 standard, where bool, true and false are
keywords. The am33x-cm3 code base defines them in its own stddef.h,
so the build fails with:

src/include/stddef.h:18:15: error: 'bool' cannot be defined via 'typedef'
   18 | typedef _Bool bool;
      |               ^~~~
src/include/stddef.h:19:8: error: cannot use keyword 'false' as enumeration constant
   19 | enum { false, true };
      |        ^~~~~

The upstream project has not received any commit since 2018 and none
of its branches fix this issue, so rather than carrying a patch that
cannot be submitted to an active upstream, force the GNU C11 standard
in the .mk file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/am33x-cm3/am33x-cm3.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 8c890a75fc3c..f753e46134b3 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -13,8 +13,10 @@ AM33X_CM3_LICENSE_FILES = License.txt
 
 # The build command below will use the standard cross-compiler (normally
 # build for Cortex-A8, to build the FW for the Cortex-M3.
+# The code base predates C23 and defines its own bool/true/false, so
+# force an older C standard to build with gcc >= 15.
 define AM33X_CM3_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC) -std=gnu11" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
 endef
 
 define AM33X_CM3_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
