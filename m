Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE1F8FA6F
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 12:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76EC583E80;
	Tue, 21 Apr 2026 12:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejnGfpXopk3e; Tue, 21 Apr 2026 12:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7618183EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776775065;
	bh=IY0PQkpbMNVGFYMb/EkMRCnB6Tcrf4sHgA/28kr04As=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c3eP7YzF0KjhTeB6q832X4JnKBoqxlc2F8Y+SxZ6iY+k57hbEmP1KkhfMOXq0N2Sz
	 XaqCAoz9Rw61rCDszaZfavQHrTjlUgy2Me2Cd4I/lG/sAP7F3kulOYv0XB9lv5R7uc
	 8UABuShPOQQoECYsgmd0drSYWTTbdAAfQ3MNC7eZTj43UgEPEeSZaAo90tesMZqFIy
	 1HeOCGceTyCFiGenAnBejzHNK2CKJWtJP1938Lh76bWpVgclbPv+u2PymNoPETiD6z
	 Z8+p8GeuQuPMwGtZ//3VAJhoPS+objPzLcK3K4Nw0Z5uVcqfQO/J5iIhzR6QwCFhcL
	 DocQLf5I9yZjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7618183EB2;
	Tue, 21 Apr 2026 12:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A73E7257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99292400E4
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okQ16FUkzzTI for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 12:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.179;
 helo=mail-qt1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4BF940090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BF940090
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4BF940090
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 12:37:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-5062fc5d86aso34593561cf.1
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 05:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776775061; x=1777379861;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4X4QLy0rL2alSrX+Xc3DcGsfKT8kwOGuympXdcpEkg=;
 b=AvgXAaFkDUu1ozRnuoSaRenRQYibqMPUHzr4X2q0Vyxd0amdNOfOZsHQQssGBkxf1e
 HREwQBEwZcI5LF9NTVpgTvh1FB5/cYmXwY5q/TIiG92P20biAJfwSkgq1FTApP186hV8
 NgwHQ/5MpMR75KUxGcK9gTFCDd8Shu5sNl1q3WLEKg4Y+rkPXGWHnGrTcUujcs82sfgf
 V5+kLdNExuFQGv4+QlCFHRD94CiUc6PsdNMP3nTBVx9kZE7wPQNjXjsq5NmR0HmKiJ/Y
 j4xbhBoEkadyqGBwFKzWIZOhXNn4LdxU6DQNUmi9/V1fFDbAJAgRpgzuMJJ8d/q9sJnm
 CRRQ==
X-Gm-Message-State: AOJu0YxVD3HQswdXFNQ9Rhy6WHx/q5VSVlfen2o0/EY6o5MGWz6eclOq
 V15gl96TqZfAv4TuwKyMf3dALlWhaqphylK1IEFbdjRHq4LeQxZJX6yYlCBi7sa2
X-Gm-Gg: AeBDietPUOq7nMoWR/htTDPpYlNxllEcoPOXcGNG2Eg/D6tnLEqDpotBorzB36u36x7
 yG10EvbgefYEWDT4i52oVjc9jwv+mhqGGDRQINBsDmw20XWPJFCribXu5HBRz7q+RhBsTgMvttE
 vydJkD+XdGNL1BFJ2IosvehTuCfkI5HC5rpvHNRlvQa0y3+eNqRWn/AAprMgV0vCIDeyWa/5+Qc
 2vhdEO64k0ryE94B8A8AdozwxpxsmJjEgFVnL/vzry0+wRpkoY22dTStJS4jg/cJk1ENU/oNMgj
 121XFMw3+H61dbA8eU6067jby9uHkKsec8GH0lwXrxJhprhqbAfCKrhUYJyWrd0G4pINvNBdcfH
 8ZYvccWzZFHuMB+JSeC01qhd0zxen1zQaoVUf6P6FcwpSug/VE7sdhz3LYSX8mJv/ClYCu/cjCa
 rDiIPuIVIyMAJRng3aK4+22I3XkQahECBclgH6sXQYKg+V4AL93avI82ub/paAAye24Bxt6j/ci
 4fPBCqhpje+bdO8ktxB9R+KrAT6JNIvIeSjUoe7ybdfdGIxSvhDsCaeTX4OuljxPHEuEmULKwXR
 kYzaJCcgcUD75ho=
X-Received: by 2002:a05:622a:429b:b0:50b:4337:179a with SMTP id
 d75a77b69052e-50e36b86637mr249028831cf.3.1776775061319; 
 Tue, 21 Apr 2026 05:37:41 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50fb11f9986sm21451131cf.22.2026.04.21.05.37.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 05:37:41 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-8aca2726f61so51175796d6.0
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 05:37:41 -0700 (PDT)
X-Received: by 2002:a05:6214:4c84:b0:8b0:2dc3:319f with SMTP id
 6a1803df08f44-8b02dc33440mr231800136d6.2.1776775060730; Tue, 21 Apr 2026
 05:37:40 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 21 Apr 2026 14:37:29 +0200
X-Gmail-Original-Message-ID: <CACXRmJjbyhWrvtRVpn2L0oEpn+UZzfK-=ca=L6z0yT8BJusjaA@mail.gmail.com>
X-Gm-Features: AQROBzDu-_9kqAywCFmrYRMz316hEAOKMydwYiI5eqkKQOb-18U71ZU74FnmQ4I
Message-ID: <CACXRmJjbyhWrvtRVpn2L0oEpn+UZzfK-=ca=L6z0yT8BJusjaA@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.52.3
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
Content-Type: multipart/mixed; boundary="===============2503907736270994547=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2503907736270994547==
Content-Type: multipart/alternative; boundary="000000000000573814064ff7ae64"

--000000000000573814064ff7ae64
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

Yes, I missed your patch. I will mark my own patch as superseeded. Fine to
keep USE_GSTREAMER_GL from where it is.
Can you already take the 0001-JSC-Fix-ENABLE-JIT-build.patch to your webkit
bump, or will you update the patch with 2.52.4 once released?

Kr,

Thomas

--000000000000573814064ff7ae64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Adrian,<div><br></div><div>Yes, I missed your patch. I =
will mark my own patch as superseeded. Fine to keep=C2=A0USE_GSTREAMER_GL f=
rom where it is.</div><div>Can you already take the=C2=A00001-JSC-Fix-ENABL=
E-JIT-build.patch to your webkit bump, or will you update the patch with 2.=
52.4 once released?</div><div><br></div><div>Kr,</div><div><br></div><div>T=
homas</div></div>

--000000000000573814064ff7ae64--

--===============2503907736270994547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2503907736270994547==--
