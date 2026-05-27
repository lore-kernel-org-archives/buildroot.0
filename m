Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F1CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9DB80CB8;
	Wed, 27 May 2026 08:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtnYFtvEjEhd; Wed, 27 May 2026 08:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5042480993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870267;
	bh=GfMoChmfkz4fhC+4yftM/7iaZ/1luLLnsh+6AlGQSvY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hdgglVIb1QkT9nXy6u2y7YJeosMd7J8TeG1s+lROYVmQI5LVptQerBC6YzjmQRGj1
	 XUDsonUOvttmj0Nbm8/MeomnXngkcRWgCAYgmbkC8q3D6YiX/yaeRiy8QCoqO3Wj4S
	 UfF9kJkv86WQ9shsSCtu7+9jmb+XMsmKl/GKA+1U+ruOWtctWFIu/2u9Rof6TBfRTC
	 YplAesrxWTyQTNAYDc4AUQ4TUa33wOQQZTToAJCeWZQvNf8EYvcCu7eGzC3stIrZ/q
	 8C+Xj+jP7tp2zuOOkIuU2Fsotk8dXgvk2J701dxKmp1EKpDZX0gRJ8H2qeApJaZTmS
	 iktPoq9RqZP3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5042480993;
	Wed, 27 May 2026 08:24:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48E0321F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F9B641F97
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUa5iW9yoS0N for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 150C841F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 150C841F91
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 150C841F91
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49068493267so20972685e9.1
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870259; x=1780475059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1K6iShvPhWNu63WS3nl2OIKzl3RcZTojGN9+Pt5cg3A=;
 b=acZX3ghq1ni00zgAzzZExmLXo1avOvqfeU3Y49eVOV45zEz7eLgIwzc9akplv0Ngu4
 cJttcldINWDIe8ETfoV8vsf36MmJ3RFk3bJ+4s9jdhVP3BSfwhg/43ra2PpN+Ln8+Nb1
 DuYRAB5cBvohSlGeao8KvpB2w/T632jcN++yKK87hFg2GkRQ9CFxK3HfreUtf+C9ILyu
 UIZxX/oXyXaUTBM37RgBKYnAfJkRzvQFSSGyLU8k7HUA24YYam10gvwW7i3DXxt5F3A4
 8ECgH7L8ctTxUCtPAHDecjZfdluulCgbJLpYde/90JW1gzRpdd/Bnw+Vsxzfzr/laj1l
 dzuw==
X-Gm-Message-State: AOJu0Yxi5baPdpoQkBDixNIXAj2ixzIBkZEeKLmEt9cBTxXBFXsQpZfe
 PxtWv9rceluNiDZPa1l+uKUsowNHYDnXOOVk/KrMJbUp2MZA71o7XVOP4AV3UCSUXiTzU1Ts++V
 Kp7MR
X-Gm-Gg: Acq92OFdWkQOcZ+QCZxs3PhyKCl/F6Z7NSYnLGM3+7frIq+XLTBZfV0TJvF5Py5788T
 Dkgur993ajB7G3V1SGl9m1Y+yHnOCcsfc12EsQOH758st+q74qGKcdzu7/FAvgv161y0i3UdecQ
 PR0y69cvWs6Vvpk10bKOGTxoKG6iT202zYZUgPBkMT2mR9GZ6nyyVXfov1OyrTJ/Ir9f90N5aC/
 w+ohD9ko/XfJByigb8AmtV9lW7l0DMWIOfFIUphZyh9+q7bKTYl7Gficir3aXcRcSm/STAesB/8
 U841MGUrDW8+4kIP0NYbT9z1b4MLMa0G4FyHnzFV9tkqjFldD+qIFgeGSQdahTLhDamC2Uw1Ete
 zFz0qKnY1OYUPe3/Ku6uoWLhEF54mes3lclKvX/vIUxloRV/sObwKMo3S5S1iY7IOhutp/LmY4v
 0lKNiwOyXDdMFtrazcOOfNukFtB+0PQa7aqqHoNBar2HCKu1n77SXv9BFzvA==
X-Received: by 2002:a05:600c:8285:b0:490:601f:d766 with SMTP id
 5b1f17b1804b1-490601fd959mr243466685e9.1.1779870259078; 
 Wed, 27 May 2026 01:24:19 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:09 +0200
Message-ID: <20260527082418.151980-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870259; x=1780475059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1K6iShvPhWNu63WS3nl2OIKzl3RcZTojGN9+Pt5cg3A=;
 b=QuzOZV4oxZrzfA1ESZ41M1ceumCbBCTUuGK1FAzzviP9PC+fEWOLaWW87sAP6tL9fg
 dEdm3hf30kPhRJcYK+AwFL2oanuiVFXJJb/Cz0ARWd5Skmtu2BhhU+ZlmYb8Ih3FVDg0
 6SdZVTKYGX/l/MwXcvdGCM/4Fthhcs9TK1KLKg30WUnXqGT0aoWHKuM92r5EZrpQQ8Me
 N5iPqH5sHxavxLDjx5S2uVv7HJOWFU0hei7MZeBGXcoLuWoE2w9zdV8J48v5Pj8XWa/X
 uVYVZW6u72Ewn0OePTgjMQ14dnEJ9AkrDzsdi2hxtmZ9QfE8keg4DoUy2CXIKRX32GP/
 eJkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QuzOZV4o
Subject: [Buildroot] [PATCH 2025.02.x 0/9] go bump to 1.26.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <perale.thomas@gmail.com>

As discussed in the following mails [1][2][3][4], this series
cherry-pick the go bumps up to 1.26.x to benefits from the security
fixes with no compatibility issues.

This version should be supported up to feb 2027 and then 2025.02 will
move to 1.28 that should be in theory supported until 2025.02.x EOL.

If you are a go user and see any issue with this 'planned roadmap' let
us know.

[1] https://lore.kernel.org/r/<CA+h8R2pDgzU6i3P1aLR_uPdd3baK0Kc=hV1oRbnbrHoBFbU7uA@mail.gmail.com>
[2] https://lore.kernel.org/r/<20260319101938.68045-1-thomas.perale@mind.be>
[3] https://lore.kernel.org/r/<87h5qcdsat.fsf@dell.be.48ers.dk>
[4] https://lore.kernel.org/r/<CA+h8R2rcfnnrrmoBzBUHMcHM35j2WBXfhbbzQKegUpjZfYbfCg@mail.gmail.com>

Bernd Kuhls (1):
  package/go: security bump to version 1.25.5

Christian Stewart (2):
  package/go: security bump to version 1.26.1
  package/go: security bump to version 1.26.2

James Hilliard (1):
  package/go: bump to version 1.25.1

Peter Korsgaard (5):
  package/go: security bump to version 1.25.3
  package/go: security bump to version 1.25.6
  package/go: security bump to version 1.25.7
  package/go: security bump to version 1.26.3
  package/go-bootstrap-stage5: security bump to version 1.25.10

 package/go/Config.in.host                     | 10 +--
 .../go-bootstrap-stage2.mk                    |  2 +-
 .../go-bootstrap-stage3.mk                    |  2 +-
 ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
 package/go/go-bootstrap-stage4/Config.in.host |  4 ++
 .../go-bootstrap-stage4.hash                  |  3 +
 .../go-bootstrap-stage4.mk                    | 54 ++++++++++++++
 ...ldvcs-false-when-building-go-bootstr.patch | 71 +++++++++++++++++++
 package/go/go-bootstrap-stage5/Config.in.host |  4 ++
 .../go-bootstrap-stage5.hash                  |  3 +
 .../go-bootstrap-stage5.mk                    | 54 ++++++++++++++
 package/go/go-src/go-src.mk                   |  6 +-
 package/go/go.hash                            | 16 ++---
 package/go/go.mk                              |  2 +-
 14 files changed, 284 insertions(+), 18 deletions(-)
 create mode 100644 package/go/go-bootstrap-stage4/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
 create mode 100644 package/go/go-bootstrap-stage4/Config.in.host
 create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.hash
 create mode 100644 package/go/go-bootstrap-stage4/go-bootstrap-stage4.mk
 create mode 100644 package/go/go-bootstrap-stage5/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
 create mode 100644 package/go/go-bootstrap-stage5/Config.in.host
 create mode 100644 package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
 create mode 100644 package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
