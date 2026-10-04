Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54540CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 03:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD9660621;
	Sun,  4 Oct 2026 03:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZByFZQnWujmV; Sun,  4 Oct 2026 03:27:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 289B260622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791084474;
	b=FWH4dzUjHbRe9nuvPND/yTm7E3citM2sblF7+XFc4rGXPFf1SIej586ycY16XVbl1mgl
	 jrKxZupXoVA/rTuYc2xdgFcnFTqUNnF93DY+ohzxgpc8kgcx9FGbOyFyYfTmBN7/Seoyq
	 FvvOJqmcTu8t/HB0XKZZXMF7VX1sBXHy5enUjYmvX6d6JIZWkMjrXjue4+BptbK0mXlMu
	 2Ja+g9WkKSUwZUGYkAaR5ZtGTO9K69T9l3qubvop3Y7o1NSJqurxTrptM35Evi+f2ZPwN
	 WGE6O4sdaefeufUCDcsw9ebTbGb27NUc0z6ewvvodZx/DMqHnG+UVEpKfYudi9TR2UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791084474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9vyjgzdlYMMreA+PQgXburYYk6wNWlI+Fwmrw4WE5Vk=;
	b=o2PZnACkp2avIBcAnUqPiP6/b4uHksesGHr7bhKS/gIeS2lbfxTkMBX0a4AVt4fOIM+6
	 RACltwrWdTufz/azx1HM9hR/BGmLJ4/qzHwNHvCxuZVdaApJSb8Fiq0qrk1zM8qN7rWz0
	 gLSVNrrwMdMlgDBH5L10JRpWBw14BacLxLvQ2+5CQR6OmfheUgybZcOWS0t0w/+kr1aXE
	 I/Fn73mjTcoN9bA7TYbZZM3sBLv3S4x4jo73+duqUGBpVv9Tj9nCp0ILY1pQES9bTR2Lx
	 /LsPYDXzXPMbVRSWUcYDTlSQoZzgpP0XecI3hXqokWKYeBWw341rcM26YxAxVzgQT3Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bqo+2996;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791084474;
	bh=9vyjgzdlYMMreA+PQgXburYYk6wNWlI+Fwmrw4WE5Vk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rqhr4YqjKpHqUsaHn5hRvl7RBfrivPyVRpnD8/8mEcnnd19y05C4pL3ENYE6qla1Q
	 KG4idC8Wgk694A2rf1AAvPfHEypkb858EXYfOIdOCnn0np/nXK1gNoeLEhC+3e90QY
	 T9WPUneyY5vHa/X4GwhJ8ophcwUVIXAxG0q9yWAufwiTgpFHFP2USXw/BIiiLuFY/Y
	 92/BwWazi+/TuiE5Fy7LsNZGuL5icTgeL3paSQzMNSSlMVUTxr9WfhK0TzQLZxDCtE
	 od40jfXaqPnzujJBkID/Fp82x5fONu0plONAF9agJ1JB2ze0Pny7GY/MrgoWyj7jBi
	 FJBlHXIe4QRbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289B260622;
	Sun,  4 Oct 2026 03:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7C11282
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 03:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56B560622
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 03:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j75F9zXfMw5M for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 03:27:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E849260621
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791084470;
 b=tYzwurewwgEOBF4eOOvnSKgKJLhGLN1rCsR8cqxYRpvmoKhstQHLFkrjya+ZTmZI/SZc
 UC5upnCEyZimo14zLR2Uli/a5j8MT2Zn3icGbdtT6vfEdFZ727oD2mqtvSomGIfWHi8qO
 ZdeJXgS3QCqa4rc7ZFkVEaFlvcqcuJ8yR7oViE1mowvNSfgPgMUKIl6Eb7oQpc4q34P0p
 g26q0XIEC0Er+BypIaxhFddxZereFsuRYW2l0W1+iTS/v68W0d1n8TKEdwWGABtd1xpGH
 Q7ATcubrMN7pFiu8o0yFO+9Ji5Ryra0vnBQf/iTRdbKaCZ2xxw4iV5KOiTAMVd+5olQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791084470;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=37voaXuJ4bq2nJR6COWj2Ywt7vZOGF17spp5dH1VB44=;
 b=Hcd9g1PaPmN34tsAel2gcokg8yYgBZmLjwv1CWlW/H+++cRG08LYGencQWj6wA0+MAGn
 N+7iOh/L/7prAPmyrNap3s/5OfZSxQclO0Plu3Fr0m4KZJIDM3oF/S1nTFK05uiKJzLXi
 J0o1f3lVOXXO+56HmSGAUPk66zMlden4v15t8nXqagjkq0rvDfPU7liSQAV2Tmb/A1Rdo
 mMpjnXIowme5Q+o0/NHs/IblhR8yH2tZonZ96bHs//NF5rz6UqNhbZP1e3rVp+oYRJK7/
 4Wju83Q/xHwn59OWZOBR2jwxPcPzDOkfj7wIH23ZSnGuYDmHN6BUAQOhgHShhcLZHUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bqo+2996; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bqo+2996
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E849260621
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 03:27:49 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso7044545e9.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 20:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791084467; x=1791689267; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=37voaXuJ4bq2nJR6COWj2Ywt7vZOGF17spp5dH1VB44=;
 b=bqo+2996t90gGLTi+D13+UwCKz+KViq18SbCTC5KhVr8lrYsGQrd41/LCnGhTSxZMZ
 PyC9jOyDiEIjYoWv6W0+PzUuSCWdm561SWeiqrXPw9pXFKKA1rZlhAiVZL27q0levbaM
 mMgzDfSH6z3Vp1kn18ATIuPGilHDtA+NdltlqN4Rt7Xm7DqzmH+a33v0IeDFXtTJUl3/
 UgdK0+D8DC8wCJzABu7un4Rg6yyGKyyn8FGvZZo9iUBrGKIM1nVRL501tPk8LtJDwrXP
 zzO1JyhwlvKs6OszEuFg6nr5JDdfmPP1tFAFb0nF3ssPpxoNxb/CwJNFc6CZ0z9jiD5S
 OAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791084467; x=1791689267;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=37voaXuJ4bq2nJR6COWj2Ywt7vZOGF17spp5dH1VB44=;
 b=wYLdLcx2wouE8Gb9qDb5bl9Hp1ik8fusWdrtACaLHgAgZB+fgc0q1/OgbOQIXJ0RuT
 OyR/KHxgRolvQC5dFD93pYEBstZVMdxteFJ+Ee+ZR+FQVmwc6/mgLHJBa807XPRMPm49
 +pM5XxJeg//pC2j6IsjtNb01sUOt/Xv86SgL4IQhX/g9+afLaaWv56KmnRwDKZpdFKnl
 uXh+RIy9RTrk3U8dm1UwOEfvZQXhyHE02bUxTNLnhHnbIJ6XsUGfvlXGWV5fqpLNiGu0
 GhqrPDfBnJmjQdOb4/MOUlc/beGJwpPfxXocZCsyp+vbp9gbPr88JZ3pwf2xpTGPHT9E
 QVlg==
X-Gm-Message-State: AFuF++kpDZlOUOEkGHJ2Wqh57evgSguE7pDie+zWLL/ayrPoYzzuy2jo
 tDasy0mxXeFe5m+4b9J8H7LAhgeX+mldLLMqX20FirmBewnmJCtVaEHvEtJZNJ9n
X-Gm-Gg: AYBFou0KTwaoPBdAxwNvk6Xo6bVFfCuB0vVg5w1pM2kq68k+37dC3C4NsaFCei2Yi4k
 K3Zlk1w0Yxw5qzcd4DOSkHA4zzffq5WB9Bk5GPMsAtXlprRGn/3bo2xi7SFPAJjqE9WGzV/w+L5
 9Rkkb/GfVm6H3E/Zx1FLos4Cn5USI6lFK1Q86jMu5tn/TybBkYP6Mxhi2xaE26c60bOsXVhtEnZ
 MXMKXXwzLMWblPzP3+pB+E12+njQ+fidntCYIMWpSgCFTmK9pErtrdRvaJtGpvF/is0IM9KaWPw
 4NXUGaZTtwAw6vyqRjOYYOcssmmBEG+QmZyFDGq+9zFMQ5KBy6uhPoXiTiXW/i1gsnvPobX9rG9
 Ur0JbE3+YILW/6Dwf8NmPcVWZzZv8uTjnQTcIdlxfG9Hn8heFbEjOZJ4nSkRwOlKXxognqeY3oJ
 rq1OflAmTYzgJiwPptgmTXBHLU53M64g68hY7Ks6IXRzeCzj4d9jKEiKnqCrDGkHtrBoB+Sn4ra
 A==
X-Received: by 2002:a05:600c:608c:b0:4a0:20fa:603f with SMTP id
 5b1f17b1804b1-4a02758e4e1mr115096405e9.17.1791084467215; 
 Sat, 03 Oct 2026 20:27:47 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b382f98ffsm16245576f8f.38.2026.10.03.20.27.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 20:27:46 -0700 (PDT)
Message-ID: <6ac1c7b2.003ab60d.29b9c1.321d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 04 Oct 2026 03:27:46 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-03
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-10-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  8  |  0  | 12  |
  2026.05.x  |  1  |  4  |  0  |  5  |
  2026.08.x  |  2  |  1  |  0  |  3  |
    master   | 19  | 100 |  0  | 119 |

Classification of failures by reason for master
-----------------------------------------------

       host-gcc-initial-15.3.0 | 46
                host-gzip-1.15 | 7 
       host-gcc-initial-14.4.0 | 6 
         host-gcc-final-15.3.0 | 5 
                    attr-2.6.0 | 3 
       host-gcc-initial-16.2.0 | 3 
            igd2-for-linux-2.2 | 3 
               madplay-0.15.2b | 3 
                 libclc-23.1.2 | 2 
               tcf-agent-1.8.0 | 2 
          cloudflared-2026.6.1 | 1 
             dahdi-linux-3.3.0 | 1 
                   dbus-1.16.2 | 1 
        edk2-edk2-stable202602 | 1 
           gumbo-parser-0.13.2 | 1 
host-am335x-pru-package-5f3... | 1 
               host-gawk-5.4.1 | 1 
            host-libpng-1.6.58 | 1 
    host-mender-artifact-4.4.1 | 1 
             libopenh264-2.6.0 | 1 
              libopenssl-3.6.5 | 1 
                 libpng-1.6.58 | 1 
                 libzlib-1.3.2 | 1 
                   linux-tools | 1 
              llama-cpp-b10702 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.3 | 1 
     s6-portable-utils-2.3.0.4 | 1 
           uboot-tools-2026.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e17b420d2a9c5d0f43785b9fe3369e6941642bf3 |     
 microblaze  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/1b5318a4696ea58f2edcfd47cdac4085d20a896d |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d078dabbfc1991f2f4f44b0b72801cd37e3cf57c |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/d21c5659f5eef99ea9faf9339ecaa72eea9b6095 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/46c17657a3a04a703f00e7752ae246ac07a24f33 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/55063eb087f49af0109bba4a264ffa826d376958 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9315bed8c301d498b52bbc396fba5c13170d1c53 |     
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/3ab34abf8e38258949329a82a04b7b5ee1624aff |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/db1c6ec9fc48a0363c60ae7f100210ef0fedd18c |     
powerpc64le  |        host-gawk-5.4.1         | NOK | https://autobuild.buildroot.org/results/a4d0b21d2e97d0bab49f1b5812c6653a866e534b | ORPH
    i686     |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/c379fe4b5223d01ab22986a12e6622eb8be807d2 |     
  mips64el   |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/6cbbb20d4b9d7a38ab47eaf6a092ccbaf509c0d4 |     
    i686     |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/c34af6fad098dd8d9df3af55d48ea64e9d67619f |     
    i686     |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/a4abdcb97e16c8e5e4246cab7e03b2c04199c575 |     
    i686     |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/46f5976558825e8509a1acfcc1c0b046ccd87a0c |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/48dae0a31ed39b4751c247f1cec0a1475b106a15 |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/0905187e9b61c3f770ee69d699b597af14360261 |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/ad2fa7606fe9b58acc674b0476c0f27e1b0ef0dd |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/6727e71716af3df8e2175a50740388bc669e5462 |     
    i686     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/40c7602a391cf479536a30f34e0fb73b7ec57e2d |     
    or1k     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/cbe1f9174dbd093e4f7aee3e5d3b6b80f3bacd1e |     
  riscv64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/eb241fc74c323ec671d5e3456455642414a4ee3b |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/e4d8f0da5aeb908948132e08363d4f666dfb0522 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/664d6203ed701912065b5edb9adbec2b96f1c37e |     
    sh4      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/839f81ff6eadb99f4183b08cf4e3867a8458ea76 |     
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/3cf44cc4811aeb723b83abb5224ab6684fe6680c |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/a3b1c237418a3294cfcdf22513ad2781496799e3 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/5d9b5993546f2bfd001e44d9398e1df17b6d2447 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/40cff589ef21077a7afa401588baa4ad4e536e9c |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/2a36bf608fee4a09711445b8f7477998b1dc98d8 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/71faedccc80032bbd7df05b8f82bf78284e298b2 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/fef816cc4f8bf3caf46929c60ff47c425554338b |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/2d731d15d802914da2529968e605ae866dfdcc5f |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/e2fa4fc06c7df705985608a05293331d1367d681 |     
powerpc64le  |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/b7ba467b2eb4f026d6df82d8cb49e465541dfb7a |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/394f7628c6b4fac4497cc3e61826c6b897309aef |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/8f89c6266f9f5a49ab36e6e65e0c56daa00d32b8 |     
  mips64el   |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/612faa813179fbcf3ec3acfcedbd9713d40de671 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/622f20b91b2c591c22c7988716231c261bd6af0e |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/ceccaee14d74c3bedc071a30a3ce91ad65807a5f |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/ec3b965d8655c4d10131f492b4b9ca0696dc5682 |     
  riscv64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/3543598ba2e523ad5830bf65512c5eec2e4d4cd5 |     
    mips     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/7363776174154894374e9e3bc3f60340bde34754 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/67beeef9ef8cd3cc087b78f1ea5de4785f909de4 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/f38478f12f1e7e54a0d03287e43ac225a5da6742 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/2f49236e17d84bc830146494f374d461f1b1fba8 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/d0a1bb6283ba041db08658be482de922be77fdcc |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/cf086196230e000b494d7f6272ee491ab6889c23 |     
powerpc64le  |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/b19a385c5bb70443fb80af4312523ab83e8de142 |     
   mips64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/20b1eb0bc735ff6289f96ab948c011340463f990 |     
  riscv64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/2856cc8b50215655fd631e780e49c7306d9c5025 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/80693afeb27aadc9bf094729e6383c688e835579 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/c058d7250925bdca9e8f970cc428e1e0dbe7c81a |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/93049d8fd61dccb79db80e920fa4061417581914 |     
powerpc64le  |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/ed679286f23af8df4fbd27738a82d8ba591191ab |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/ce37b248790e388c82c6dbca46d1a55aa4ef4f36 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/79b438e0b0eee03e6ffac15aa53427f9e49edbd3 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/87336f9a9535014f41a46db98631a2b64f84d788 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/bfc52d2d98c94393229ad8e5b6480ef4ece4f789 |     
powerpc64le  |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/f8f70739c7be6c841b9d3ce9bb173f95220937c8 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/e83c302c04c72b2ea647148c2e295276c9977f73 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/7e05c308a8f6f262914ad534dd7655ab0b0b6e18 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/f8932187f5218ec652e435b5c4cb3818c214117e |     
  riscv64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/aabf740128fcb0d4c6e836cb710c4c89d3fbd654 |     
  riscv64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/80188e035e6b2d9711b53373341c8fb2a9382920 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/35d25c24151337ab7f73f3cd0680427a11080669 |     
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/747416ce76a7421458f5c42057467845a5685e04 |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/c38807ea5805a64c221ecbcda832c92839a5811c |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/2b96832002c55a22d7eeecb3a76cfd62becd77ae |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/553b5b4bff6ed6b2c9860cccc3fa41ae3e0b5b24 |     
  aarch64    |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/fa5eb11f5032ebb4a1f21c6b3574ac68439a8f1e | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/278a2dff9c0ede35640c1130b64bbb97a1d1316c | ORPH
powerpc64le  |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/c172bead8e9773432b7b8460de8d0265f22dd0c9 | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/407d109c44b67749f613aeca0358b77ac82ca34a | ORPH
    i586     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/ac5a7294cf01ad738785bf2a7ce5b80cbe38b12b | ORPH
    arm      |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/befcad0f6464df4a3dcd38686b63e1cdd3d3e47e | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/35d649608f5df45bd7d4f0fa75fc41b509d435cf | ORPH
    i686     |       host-libpng-1.6.58       | NOK | https://autobuild.buildroot.org/results/5df8a1ac62d43dfd31de2cd6c9d4f481e6dd4352 |     
    i586     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/55910fedcbac39ec1a0c6c77c4298f52f7a3f12e |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/076f2a4991f86119b0e92ccb1bc374533d4cbbd4 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/353b71ad6913a0b3ad986de5d298bc6089fc6c38 |     
powerpc64le  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f2eed9cc5e11055bf0b8792aa518f29038a55db6 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/f2e2baf082adeb9ad0e699543a60862d086d0826 |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/2338f217e565cb8d5f66d70490456145513fcc22 |     
    i686     |       libopenh264-2.6.0        | NOK | https://autobuild.buildroot.org/results/7c2232664031cfc441b8615f36bc0ebe3be9c29f |     
  riscv64    |        libopenssl-3.6.5        | NOK | https://autobuild.buildroot.org/results/56ba38ae64cf97233ccc503ccc7df3b799d645f4 | ORPH
    i686     |         libpng-1.6.58          | NOK | https://autobuild.buildroot.org/results/f022a01f29dd86ccefe471ddca0ef2ed7a5b12ed |     
    or1k     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b5f295ea9e2fec62b71353a483537dc74704f205 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/5eb13d7837091a1a26aae54fb518115dbe1cbdb0 | ORPH
  aarch64    |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/87f57443efeda9316484dbd7f351bc4af67b425d |     
    arm      |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/8551e5de2e1f85f1f632eac9827e8eefed2a4df2 | ORPH
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/bd5cdda9f779e8db1383031ff6ffc95aa58d75d4 | ORPH
   x86_64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/7294f74424bb403b7519e0c38d2c5d5af6b82929 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/70fa04fe71024515b5904e23503c5ebfbcc29f43 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/d73cdb94cbbb845101327b7cced171ca0d1b5107 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/7adb4ec19bc1039b2e35e9e5a13ec49ef20ffe64 |     
  aarch64    |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/cc8a9dc1ce695c27cb365885d4e0f33ca706786d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e812e5d7539353dcc689b0fab646da24791547c7 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e998c410bf73e53b1e2dca02fc3e017c03a5f7f6 |     
  aarch64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/3401e8d3830871599c38d86a8d188deed9eb3b05 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

    host-mender-artifact-4.4.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/182d68fd3c355b5bcfd45251c3404e3380afdc16 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                     kbd-2.9.0 | 1 
               llama-cpp-b8117 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ccec706adc0ad5e5eb3ff9f06919cdd4a68f8ccd | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/029841422c3bbde91958fab4efc6e5b78c01bf2c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ea3e1f5a22d7bee234c7ac77c5f1560cf799f53c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/64068b2258ebe5347522415f12b5a13c6413b7d6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    ccid-1.5.2 | 3 
        host-python-lxml-5.3.0 | 2 
                 fwts-25.03.00 | 1 
                    gcr-3.40.0 | 1 
                memtest86-7.20 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/ef237afd1db1d582300620ce519fbab4b5210061 | ORPH
    arm      |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/5d19ef0640a9e911cd8ce3e45bed9bd57190ece7 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/114d35ee1dad8ca4a542cd23c8dff777698f6b5d | ORPH
    i586     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/265e62c21dddb7c526abce5e006ac75d76e96797 | ORPH
    i686     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/adc2e5b30962d52ede539692f1c6640094afd8aa | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f0f3dd885f4391465712808538b841f9d39bff6c |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/062d8d25d38310d8e22a211a3e9d7b7157aa312f |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/35cb3b54270065b82a42e3821ccafd8720a9ca5f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
