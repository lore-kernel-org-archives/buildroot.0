Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB37C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 06:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C33D80906;
	Wed, 16 Sep 2026 06:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05-Fd66QSM80; Wed, 16 Sep 2026 06:48:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C350280934
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789541308;
	b=F0ebSzH8jxaZ+j2Z+okiCLKItyaaT0ZE5GkUft0JTH2dNduewrc69tsILXJtp4I3bEDq
	 g6ajYUGN9ce2TTocufiVNQfsDV6c3zuxnvxnoUlMOApXwnGMbaWOQafWf2XVLKFoihMnm
	 9enoO8KiwBzvs97VyB/avNxhE7tuqAfe0NLzvTbVOQvTilc0D5m4yS7NSA8oYzul5/nrb
	 YgXb0+UrZg5vDwrCpMmY5zMfShYiCQPMFtCcb1mc//Bu4uYxsADdageXdfAw7LmTwfBPv
	 X5io1JMYXIzGT07yBZse8FWMjzEZSsbbqKNpYyPkof9pkUduJ1PqtbNOrjSATNRSLDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789541308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:
	 X-Mailman-Approved-At:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=hCnqm+XWeBxDZFGNeS/qeO1ltkrNBDrh6VecW7OAKXU=;
	b=Vdmr2Hj5H6qEjdCKtiwG9YgI+SHeiLH5NBtVhv+ZlcCNveOS9BYTqKdtNhF8wI1WhU9R
	 Iu6leP7Lw8rWNjRtBtgyXdQmuW8I/zJ1yVzb4Y5bXcNWZKKr5vJSELeNbrMzPG73x5RO0
	 bIIlrQw2nVEjw2LiiduSBAi2KBf10vwo06KFg9CMk7OCFao1ji1CiKuM4CQv8t4CDBG06
	 yn/ydFV8r0X4pJ2Ecr0/UFGCXKxqVJ+h2atjstgLQ4szLqQnhMr6FNUss5A+GAfhV/00Y
	 Tmoy67wSGe1pkOCEttezg9tUVar/yjuaBSd8yaFTsA11k1Y/Jd6MOH46XqqEwTKSbZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789541308;
	bh=hCnqm+XWeBxDZFGNeS/qeO1ltkrNBDrh6VecW7OAKXU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aeGmiEQc1e60KV6TljNmtjnlLYFSFmHfMaHZnhC32Bdb9+9C+kx7qOASE7llYFncu
	 MdBciBAPbgnx5SViadhklF55pzFJecvL7RT+bNe3+/OlUn8Yrkzqd6fcCiKS/jPiBH
	 Qhq7lYXV+MLsaL32BybX4WCYBbgFKhoPlR1msI48Iulsul81cGV7aC/ee3hnRhMtno
	 IONyGaMhkywSlRDAPOtGfpZTpLZXBp1BnGyeOqwFzAQFFqLpaqap/5dL89xhNMv7BW
	 fxV/Egu/b3tw6OKZOcbAekmoNDnTFXH8vllsiEj3dw5Yf1LtcVlwvS/Nww6HmNPFLR
	 NEpjxckBNV0iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C350280934;
	Wed, 16 Sep 2026 06:48:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 672E3259
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 03:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 423584007C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 03:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1_kap3_QcUF for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 03:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DA58740063
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789356495;
 b=cS8pv76FJjsaJYuij1Lfl8pNMDM1ung1+csRHUux/bzpZF2G7ObJh0VROu8NKnz85xao
 LWsIZR9SCV/YdLIK2tf25TAJVmiGrr/N4t9MMMOaVFbHbbFVIOxQCVL9EOmq4nawKv4jv
 nf8P7FUnH8aRSGUayvyJDgW7WMrRMakBObKbRJUx9U5bwkIVYEc+xFDcGyB0FzAEPlWNo
 sdfOzAMQ8EstUrvGwgajS1/5vTtSail7fCpOAyMyJlld5ugPgpOYqEV+V/0fZjaKwgAHq
 WzQtiLdXRAk/JZzCmOliUvyVhecWfzb4pBMq2lKOqRN1Vjc7QUe+mw2HIYxF3ZQzZbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789356495;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=RN2Q4tQa7rk4czpdMJDTbFi8lJdsqae930XFxKuP2uo=;
 b=D+PBria0dhJaDCkNYjaowm04nRU+ForPyrF/ZZAoGil1uy8vS8ZMWaEofB5dtETevw/4
 8xAtEWraWDpi1/545r/Hu68zMma6KwGCszorFfS6VLZvIvbvRX5Y6hv+x1cd5r2rxb0oj
 m7m/NNknbO0pbjkU1i+zOeenhIv2uqEzENp8MVx77soxWr6G7Oclyt+doKVKx9YFiPij7
 BQd1xqj7NhQfdA1Nczc1ncGMettaSgvsdnHv8O9LmYYgeHfjjWuDNZTdYdW4l2BOU4IZn
 v9czh2lRzFfsCoalrC3UmehiB+XpBFqNK+q7sytXrtTsMrr6teqkPVi30tFaFXNI3OQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EGazKGKn; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EGazKGKn
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA58740063
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 03:28:13 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485b1d2874fso423703f8f.0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789356491; x=1789961291; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RN2Q4tQa7rk4czpdMJDTbFi8lJdsqae930XFxKuP2uo=;
 b=EGazKGKnha7eiFDKUmF7M8/QNDq0wtbJ29nNCkOPx+j08mAjf0HdfEMHfikz8HNu1v
 Had41yweBPjzF2QR6f41gYjVPG2/y6Qz4ONKy5CwfQGiRIYMy58ELAB0gEyg2Fu5sRvD
 78HZ5bRzG9KPYzbNy8zS0zeJGJd9rjkzWFvttoboX7gvPX3+rea62fZCE+1NNnm6vxKs
 8YWxUGJrOMhopdvkaTu8mJ4V6JmyP8lwIvyVriSm9jP9em8Wo6wgMcM/MSLAWqiUTZnV
 iOVPiFmOVALKBhDfioFt30kVSeC1B0EDvbi9J2v5Zkf3WmuKyjnVUzncaSJNW9W34J8y
 kZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789356491; x=1789961291;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RN2Q4tQa7rk4czpdMJDTbFi8lJdsqae930XFxKuP2uo=;
 b=JnA1TQOjUXXnTI+Vt6KG/dIR/OstUYcpCKX7mnjCHLh+NxtZ/Q0dA/F8StLbfVCv+l
 GsA1l6h6RS9vKTTwkPitAdGJzbv/nWrtxNlKdDEg59hU8PjOGUy9qUVjOuBEP0oTStrM
 oHTFPg5PvdPWTVNrgnBN6sX57ip/F7uwwZzX4R/irHt7w7hLoOIXDfQBuqWuuX5hTwhU
 iXjkH85yY+fofBSK/lJ9r3rj0e76BbY7BJ34OdYFDjMAk8rWC4tg81DKy98rXkiAe63N
 B/PtxV346EgYEHI9TPZqYjIbvIHFgq6bk2meaGIOWZPJxgdJQoSLa2RUvBdEu1CZ1Sq+
 TgAA==
X-Gm-Message-State: AFuF++nqy0d43rhl4NkEzpPcJlro/xEtJOqLeh6ivy1oOdZHRQPnDJ+2
 sGmY7rDGwAlGv+fK8UpgYUVPCWrjIfTW0v5hOUZvExCrFKvJkpHJnK2cYVPo34gG
X-Gm-Gg: AYBFou36A6r9SAjHh2EtOj00J289Ngd0Se6NVBOqSrGvhhv8Pr/0YkxtArbe8FWtpk3
 /MFkAOpDUOEYQ6C89uNQDbROWMVI9Rhx4uCpltmjfprU4JSogaJlyLw8PPMPi9aVrkJ9B/3Ojj3
 1nlCSD9V4a39Soii8BL6IU8sWMiSPEuCqrU5QHPCLx7Yc4br3Z3KWtfHSOVepvMz5E+x6FRZ09d
 d6onJxVm4wocHFnwNL+2WVNA86YxvhbWX31bpe/jOcZmtLgC9Tuicb2pnAnqQSLdlMoBgb6jfhq
 7cO3aFZflRrmeKLocLSjMSjOazWzxhn5DK3g7rtHh4E/My+TtncINRE4s+FicYOZvEBvDhVnM1K
 28my6govx7ESsnBls3jqHHpats79/b5X7eiv36wrElNlakuWCuZUpyu5Foi57d5vtgmEWGhhxeO
 LgP7xi0AeOGXrpWdhWGTTxdAe6qtzaF2HsssLiPt7kq0hhIKTqSorJ3b6kROpjbUwGLjbzLocnp
 XI2r9a2qn2+
X-Received: by 2002:a05:600c:3e1b:b0:49e:6836:5386 with SMTP id
 5b1f17b1804b1-49e7a5fb97emr6914135e9.0.1789356488753; 
 Sun, 13 Sep 2026 20:28:08 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e62230e72sm161492795e9.4.2026.09.13.20.28.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2026 20:28:07 -0700 (PDT)
Message-ID: <6aa769c7.6b733ffd.a3d08.590d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 14 Sep 2026 03:28:07 -0000
X-Mailman-Approved-At: Wed, 16 Sep 2026 06:48:27 +0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-13
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

Autobuild statistics for 2026-09-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  0  |  9  |  0  |  9  |
  2026.05.x  |  0  |  1  |  0  |  1  |
  2026.08.x  |  1  |  2  |  0  |  3  |
    master   | 19  | 37  |  0  | 56  |

Classification of failures by reason for master
-----------------------------------------------

            host-skopeo-1.23.0 | 4 
        edk2-edk2-stable202602 | 3 
             bubblewrap-0.12.0 | 2 
                  ffmpeg-6.1.5 | 2 
  gobject-introspection-1.86.0 | 2 
               libepoxy-1.5.10 | 2 
                tpm2-tss-4.1.3 | 2 
                   atop-2.13.0 | 1 
                    ccid-1.5.2 | 1 
      docker-cli-buildx-0.25.0 | 1 
                drogon-v1.9.13 | 1 
      freeradius-server-3.2.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                     kbd-2.9.0 | 1 
libcamera-apps-v1.7.0-10-ge... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                libsoup3-3.6.6 | 1 
libuci-f3fc0b76040685829191... | 1 
                   openrc-0.56 | 1 
                  prboom-2.5.0 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 rtl_433-25.02 | 1 
         s6-networking-2.7.0.4 | 1 
                 skopeo-1.23.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/e7c6b4421fdeefa97fced78b196f80fb581362a2 |     
    i686     |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/e4bf01c4ce66dbd287c013f1557eab3b7bb7ea8d |     
powerpc64le  |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/cef2f4933a507d47a8b112ee7576580cbf402bb8 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/03f4c8766695323297147a88635320eb1357e14c | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/9488602f35f02892cd29179cd8a6e2a568ca3456 | ORPH
    i686     |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/be449a7e8f18749b303b99f0f859b5f3bcbec1b2 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d5e1e52069136f92bd99a1e3844755065397e8bd |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a04321def8964be6e1ffb96048ab7209ce92a464 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/845f4617ed3243bd2824a014d75c3040a171fa74 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/fd907b50c9475cd404cebfc56680d881b3721298 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/e6aacad27542fcbb03bc908c3605559f2063a364 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/0b7d599b4d1bb9e68a711e67861718bfe0aea087 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0e7da1a4478a4fd8df8989aa3579d496f46b3064 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/4a51949fe690e17c5e45ac230e9a51af6c423f1c | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/64ca67eea568b8f22592a0dad2b015b9fbbd27e5 | ORPH
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/fbc7fd1fc6f45c145e83be6a9ee1429546bafaf5 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/fa9cd03dcb0bcded1507ebcc470379882cc269c7 |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/09dc43446ea01e29a3faa2d8a0bc97aac4c24036 |     
    i586     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/6a9bba3ce74471851f9420125de5169676779e53 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/b50bd07f87d870c6a0c55020c555bf758ae5a101 |     
   sparc     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/9df5e54758e0c1a907c22842bbf0e430a39144dc | ORPH
    i686     | libcamera-apps-v1.7.0-10-ge... | NOK | https://autobuild.buildroot.org/results/21dcd20d70c12758083733b0e5bc8f1efc671370 |     
    i586     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/eef4f95beda40531ec16cd55e4115ddba155b54c |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/bf38e885d6f4d3de8272aac19d6485d8c2ce532c |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/625ced58f07da7a44d902134eed989f89f6a3862 | ORPH
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/7f52f8f31e4f82bfe2d35d9a84740a2b5c31b146 |     
    i686     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/d84cd93c23ed6a25cf5d99841a4bc8da5cf70a75 |     
    i686     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/43ce08497863ff54c8acf3b0bbe7cfbdbc640d14 |     
    i686     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/e6157ce94cf554ec5932e17ff9ebfc41f5cd3b9a |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/1bc242e154068976f3576d251656187802d733e4 | ORPH
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/b305c2b2c12aeeb27acf0d754c8799acd22ccd59 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/8d76c4e56e2cc4bba31a86a5c59234f5743a41ec |     
    i686     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/bdcda9bb922cbaf3baa88be4e00ab556a4f2f03b |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/25f6bbdefabf876225e159ce60d3e505fa3a6e7a |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/90603b390e32bd33c4fd133fe63b15938d3ef595 | ORPH
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a13e830f63428dec671948d157363a5e6b6317b1 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/5fb9a1ded0d1a83d84775bc34a341b93a917ff72 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               linux-pam-1.7.2 | 1 
               nushell-0.108.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/100ea21ba417ac835ebe3488c7d126f4952cc426 | ORPH
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/c7827fd41dbb938a21f9327d2dbd0f53297029a3 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/98daa81c8b903129fb19efe1a5cc0e194eba567d |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.5 | 2 
                cryptopp-8.9.0 | 1 
  gobject-introspection-1.82.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
     libphidget-2.1.9.20190409 | 1 
                 logsurfer-1.8 | 1 
package/linux-headers/linux... | 1 
package/wine/wine.mk:347: w... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/3b324ed4049553837148d7769935f6b35c25a458 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/30fc7422202a3347a00fc22b13e0fcc6da03465f |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/1c50ed3e75427e5b8f5f01686350b2a9b556cf80 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/de6cc1cf693460412eb26d648e8c62b6f5b42c96 | ORPH
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/32b76b4c9c27515db5af6ecd85bcdccad3429537 | ORPH
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e4b752ca41cddaef5d621803b530f196af2df481 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/cc7b01c7f82e905180582a35638fffa940920292 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/9fff3d2d80076ab841019988ce78f91bbf0b8c37 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/ba7633acbc70197513258a320bcef79f418080fc |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.1      | 2.1.0        | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.7        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/000018 | 20251212     | 20260408     | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.3        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 50.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.7.2        | 5.0.0        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.3       | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/226905 | 4.2.2+git... | 37.0.0       |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.2        |     
                      apr-util |  DISTRO  | https://release-monitoring.org/project/000096 | 1.6.4        | 1.6.5        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.4        | ORPH
                         asn1c |  DISTRO  | https://release-monitoring.org/project/016926 | 0.9.28       | 0.9.29       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.10.1      | 23.5.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.60.6       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.3       | 2.36.4       |     
                     atkmm2_28 |  DISTRO  | https://release-monitoring.org/project/373360 | 2.28.4       | 2.28.5       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.2.1        | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.19         | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/010751 | 8.1          | 8.3          |     
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/000152 | 019          | 020          |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.17.0       | 2.18.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.3       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.3       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/010587 | 1.13.0       | 1.14.0       |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                           bcc |  DISTRO  | https://release-monitoring.org/project/012803 | v0.36.1      | 0.37.0       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.15      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.46.1       | 2.47         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.3.2        |     
                       bitwise |  DISTRO  | https://release-monitoring.org/project/111150 | 0.50         | 0.70         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.7        |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/021324 | 4.3.1        | 5.0.0        |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/010029 | 5.86         | 5.87         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/010029 | 5.86         | 5.87         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.15       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.92.0       |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.11.1       | 3.13.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.7.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.26.1       | 0.27.0       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                         broot |  DISTRO  | https://release-monitoring.org/project/141357 | 1.60.0       | 1.60.1       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.1          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.13.0       | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/005840 | 1.34.6       | 1.34.8       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.0        |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/009026 | 20260223     | 20260816     |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.1       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.5       | 1.14.6       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/021403 | 2.0.0        | 2.1.2        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.5.0        |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.8.3        | ORPH
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                       chicken |  DISTRO  | https://release-monitoring.org/project/000280 | 5.4.0        | 6.0.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/008810 | 4.8          | 4.9          | ORPH
                        circus |  DISTRO  | https://release-monitoring.org/project/021726 | 0.16.1       | 0.19.0       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/011811 | 22.1.8       | 23.1.1       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.7.2        |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2026.6.1     | 2026.9.1     |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 2.1.4        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.7.1        | 1.9.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.3     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/017705 | 22.1.8       | 23.1.1       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.10.3       |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.11       | 2.3.5        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/000343 | 9.10         | 9.11         | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.48.0       | 0.56.0       |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.29.1       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.1.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.25       | 3.0.27       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.6          | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/000402 | 1.2.18       | 1.4.0        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.24         | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.27.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/011429 | 10.2.4       | 10.5.2       |     
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 2.00         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260721 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.0.0       | 3.1.1        |     
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.5.2       | 29.8.0       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.37.1       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.40.3       | 5.5.1        |     
         docker-credential-gcr |  DISTRO  | https://release-monitoring.org/project/377457 | v2.1.32      | 2.2.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.5.2       | 29.8.0       |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/021342 | 2024.4       | 2026.3       |     
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/000453 | 7.5.5        | 7.5.7        |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/000456 | 2.3.21.1     | 2.4.5        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/021418 | 0.5.21.1     | 2.4.5        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.18.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11.2      | 26.07        |     
                      drm-info |  DISTRO  | https://release-monitoring.org/project/299264 | 2.9.0        | 2.10.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/016911 | 1.7.2        | 1.8.1        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.1         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.5        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.6        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.22.5       | 1.22.6       | ORPH
                         eigen |  DISTRO  | https://release-monitoring.org/project/000666 | 3.4.0        | 5.0.1        | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.07        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.195        | 0.196        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.21       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.21    | 29.0.6       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 1.0.4        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.60       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.4        |     
                      espflash |  DISTRO  | https://release-monitoring.org/project/373490 | 4.5.0        | 4.6.0        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.9.9.2      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.4.3        |     
                          exim |  DISTRO  | https://release-monitoring.org/project/000768 | 4.99.5       | 4.100        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.5       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.2       | 2.11.3       |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/006602 | 1.1.0        | 1.1.1        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 2.1.4        | ORPH
                      faketime |  DISTRO  | https://release-monitoring.org/project/021348 | 0.9.12       | 0.9.13       | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.5.0       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/000790 | 3.11.2       | 3.13         |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 6.1.5        | 9.0.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                          file |  DISTRO  | https://release-monitoring.org/project/000807 | 5.47         | 5.48         | ORPH
                     findutils |  DISTRO  | https://release-monitoring.org/project/000812 | 4.10.0       | 4.11.0       | ORPH
                     firewalld |  DISTRO  | https://release-monitoring.org/project/009989 | 2.4.3        | 2.5.1        | ORPH
                  firmware-imx |  GUESS   | https://release-monitoring.org/project/390526 | 8.30         | 8.31         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.9       |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                      flashrom |  DISTRO  | https://release-monitoring.org/project/010202 | 1.7.0        | 1.8.0        |     
                        flatcc |  DISTRO  | https://release-monitoring.org/project/021350 | 0.6.1        | 0.6.3        |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 4.2.0        | 5.1.2        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.5.7        | 2.6.0        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 7.2.0        | 7.3.1        |     
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.17.1       | 2.18.3       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.28.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.18       | 1.6.19       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.31.1       | ORPH
                         ftxui |  DISTRO  | https://release-monitoring.org/project/373193 | 6.1.9        | 7.0.3        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.18         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.16.0       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.7        |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/000868 | 5.4.0        | 5.4.1        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 4.4.0.1      | 4.4.1        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.3       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.8       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.6.2        | 1.6.3        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.1        |     
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/001157 | 10.07.1      | 10.08.0      |     
                           git |  DISTRO  | https://release-monitoring.org/project/005350 | 2.54.0       | 2.55.0       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 19.3.2       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.90.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.90.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.8       | 2.66.10      |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/001216 | 6.0.4        | 6.0.5        |     
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.48       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.16.2       | 0.17.1       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.83.1       | 1.84.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 51.0         |     
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.4        | 1.6.6        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.29.2       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.7       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.7       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.7       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.7       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.29.2       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.7       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.7       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.2       | 0.16.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.7       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.7       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.10      | 3.24.11      |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.21.0       |     
                  gumbo-parser |  DISTRO  | https://release-monitoring.org/project/214990 | 0.13.2       | 0.14.0       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.9        | 1.6.10       |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.4       | 0.14.5       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.2       | 0.12.4       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.62.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 2.6.32       | 3.4.4        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.21       | 1.9.26       |     
                heirloom-mailx |  DISTRO  | https://release-monitoring.org/project/095708 | 12.5         | 14.9.25      |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/001318 | 1.3.0        | 1.4.1        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.26.4       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.5.1        | 3.5.3        |     
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.1        | 2.0.2        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.14.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 78.3         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/021670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.44       | 0.8.45+nmu1  | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.2-26     | 7.1.2-31     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.12.5       | 1.12.6       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.25.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/020342 | 22.10.1      | 22.10.2      |     
              intel-vpl-gpu-rt |  DISTRO  | https://release-monitoring.org/project/372126 | 26.3.3       | 26.3.4       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/021679 | 3.508        | 3.511        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.2        | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/001392 | 7.1.0        | 7.2.0        |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/001394 | 1.8.11       | 1.8.13       | ORPH
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.27         | 0.28         | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.41.2       | 1.42.1       |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.83         | 0.84         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                        json-c |  DISTRO  | https://release-monitoring.org/project/001477 | 0.18         | 0.19         |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/001492 | 2.9.0        | 2.10.0       | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.3.4        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.30.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.30.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.30.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.30.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.7        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.14.1       | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/012523 | 3.100        | 4.0          |     
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 4.01         | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.1        | 5.0.2        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.7.0        |     
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.7.1       | 0.7.2        |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/001570 | 0.9.5        | 0.9.6        |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/021468 | 7.1.1        | 8.1.7        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                        libclc |  GUESS   | https://release-monitoring.org/project/376264 | 22.1.8       | 23.1.1       |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/015531 | 2.10.18      | 2.10.19      | ORPH
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.25         | 1.26         |     
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                       libebml |  DISTRO  | https://release-monitoring.org/project/007879 | 1.4.5        | 1.4.7        |     
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.11.3       | 0.11.7       |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.13.7       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2609.0     |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.12.3       | 1.12.4       | ORPH
                       libgeos |  DISTRO  | https://release-monitoring.org/project/013493 | 3.14.1       | 3.15.0       |     
                       libglfw |  DISTRO  | https://release-monitoring.org/project/001180 | 3.4          | 3.5.1        | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.88.3       | 2.90.0       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.2.0        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.3.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.21.0       | 4.24.0       | ORPH
                       libheif |  DISTRO  | https://release-monitoring.org/project/064439 | 1.23.3       | 1.23.4       |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                 libhttpserver |  DISTRO  | https://release-monitoring.org/project/021934 | 0.19.0       | 2.0.0        |     
                       libical |  DISTRO  | https://release-monitoring.org/project/001637 | 3.0.20       | 4.0.5        |     
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.43         | 1.44         |     
                   libiec61850 |  DISTRO  | https://release-monitoring.org/project/141617 | 1.6.1        | 1.6.2        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                        libjxl |  DISTRO  | https://release-monitoring.org/project/232764 | 0.11.2       | 0.12.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/016828 | 1.5.0        | 1.5.1        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.4       | ORPH
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/001657 | 1.7.1        | 1.7.2        |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.14.0       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.2.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.3       |     
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/009728 | 3.1.12       | 3.2.0        |     
                  libmpdclient |  DISTRO  | https://release-monitoring.org/project/021364 | 2.23         | 2.27         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.4.10       |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 6.0.2        | 7.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/001681 | 1.3.0        | 1.3.2        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.24       |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.39         | 4.40         |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.6.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.6.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.6.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.6.0        | ORPH
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.9        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.4        | 4.0.2        | ORPH
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/015135 | 5.3.1        | 5.3.2        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.4       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.18       | 0.4.21       | ORPH
                 libpam-pkcs11 |  DISTRO  | https://release-monitoring.org/project/013275 | 0.6.13       | 0.6.14       |     
                       libpcap |  DISTRO  | https://release-monitoring.org/project/001702 | 1.10.7       | 1.11.0       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.7       | 8.0.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.10       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.2       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.13.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 3.9.2        | 4.3.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.63.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/013823 | 2.6.0        | 2.6.1        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.8.2     | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.39       |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/011483 | 3.6.6        | 3.7.3        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.7.0        | 2.8.0        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.12.1       | 0.12.2       | ORPH
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.4        | 2.5.0        |     
                      libtirpc |  DISTRO  | https://release-monitoring.org/project/001740 | 1.3.7        | 1.3.8        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.5.4        | 2.6.2        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.22      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 1.2.20       | 2.1.1        |     
                 libtraceevent |  DISTRO  | https://release-monitoring.org/project/288159 | 1.8.7        | 1.9.0        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.4        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.2        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 22.1.0       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.5       | 0.15.7       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.12         | 2.15         |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/001750 | 0.1.8        | 0.1.9        |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.6       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.7.0       |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.16.0       | 1.17.0       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.2       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.59         |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.27       | 0.3.29       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 5.8.6        |     
                   libyang-cpp |  DISTRO  | https://release-monitoring.org/project/388240 | 4            | 11           |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.10.1       |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.10.1       |     
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/001817 | 1.4.84       | 1.4.85       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.28.0       |     
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20260810     | 20260910     |     
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.8.2        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.08.25   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/001830 | 22.1.8       | 23.1.1       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.20       | 1.0.22       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/001830 | 22.1.8       | 23.1.1       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/006974 | 0.9.35       | 1.0.2        | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.2.0.1      | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.7.0        | 1.8.0        |     
                        log4qt |  DISTRO  | https://release-monitoring.org/project/180409 | 1.5.1        | 2.0.0        |     
                          lpac |  DISTRO  | https://release-monitoring.org/project/371628 | 2.2.1        | 2.3.0        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.6       | 4.99.7       | ORPH
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/007135 | 2.14.0       | 2.16.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/007141 | 2.14.3       | 2.16.0       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/007136 | 2.14.0       | 2.16.0       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.1        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.18.0       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                     luasyslog |  DISTRO  | https://release-monitoring.org/project/141620 | 2.2.1        | 2.2.2        |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.3        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.51.0-1     | 1.52.1-0     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.42      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/001863 | 2.9.2        | 2.9.3        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/001866 | 1.25         | 1.26         | ORPH
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.7.9        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.18     | 13.0.1       | ORPH
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.6        | 4.2.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20260511     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 210          | 212          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                         mdnsd |  DISTRO  | https://release-monitoring.org/project/368614 | 1.1          | 1.2          |     
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 8.10         |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/020630 | 4.4.1        | 4.4.2        |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/001970 | 26.1.8       | 26.2.2       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/001970 | 26.1.8       | 26.2.2       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
                            mg |  DISTRO  | https://release-monitoring.org/project/131079 | 4.0          | 4.1          |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.28.0       | 1.29.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.17.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.08      |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.33.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 3.0.16       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.41.0       |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/017370 | 4.6          | 4.7          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 7.0.0        | 9.0.0        |     
                     msgpack-c |  DISTRO  | https://release-monitoring.org/project/235285 | 6.1.0        | 7.0.2        | ORPH
                         msmtp |  DISTRO  | https://release-monitoring.org/project/002024 | 1.8.32       | 1.8.34       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.15.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.28.3       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.4.1        | 2.4.2        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.5        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.53         |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2.2        | 1.2.5        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.02         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.11.1       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.52         | 0.54         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20260912 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.8        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.3.5        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/002063 | 4.4.3        | 4.5.1        | ORPH
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.1      | 2.1.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.234        | 1.238        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.11.0       |     
                       nethogs |  DISTRO  | https://release-monitoring.org/project/002065 | 0.8.8        | 0.9.0        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.7        |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/021197 | 1.56.0       | 1.58.1       | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.7        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/002082 | 1.1.4        | 1.1.7        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/008651 | 1.68.1       | 1.70.0       | ORPH
                         nginx |  DISTRO  | https://release-monitoring.org/project/005413 | 1.30.3       | 1.31.5       | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 28           | ORPH
                          nmap |  DISTRO  | https://release-monitoring.org/project/002096 | 7.99         | 7.991        | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.3          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.23.2      | 26.8.2       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.23.2      | 26.8.2       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                         nqptp |  DISTRO  | https://release-monitoring.org/project/293307 | 1.2.4        | 1.2.8        |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.115.1      | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/002511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 615.71.09    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 615.71.09    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.0-b.5      | ORPH
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 11.1.0       | 11.3.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.6.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.6.0       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.13       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.5.8        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2025.07.22   | 2026.05.29   |     
                opencl-headers |  DISTRO  | https://release-monitoring.org/project/223257 | 2025.07.22   | 2026.05.29   |     
             opencl-icd-loader |  DISTRO  | https://release-monitoring.org/project/378666 | 2025.07.22   | 2026.05.29   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.3        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.13.0       | 5.0.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                      openldap |  DISTRO  | https://release-monitoring.org/project/002551 | 2.6.14       | 2.7.1        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.11       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.63.3       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/010998 | 11.3.5-18... | 13.1.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.44       | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/002582 | 0.26.2       | 0.26.5       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.31         | 1.32         |     
                          palo |  GUESS   | https://release-monitoring.org/project/389410 | 2.29         | 2.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.58.0       | 1.58.2       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.56.2       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.4       | 2.46.5       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                        parted |  DISTRO  | https://release-monitoring.org/project/002596 | 3.6          | 3.7          |     
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.19.1       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.11       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.1.0        | 2.5.1        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                      perftest |  DISTRO  | https://release-monitoring.org/project/017223 | 26.01.5      | 26.07.7      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.42.3       | 5.44.0       |     
                    perl-clone |  DISTRO  | https://release-monitoring.org/project/005875 | 0.47         | 0.50         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
             perl-data-optlist |  DISTRO  | https://release-monitoring.org/project/002769 | 0.114        | 0.115        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/002785 | 6.98         | 7.00         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.013        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.653        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/002835 | 0.85         | 0.87         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.91         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/002967 | 3.83         | 3.85         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/002974 | 6.11         | 6.12         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/002975 | 6.16         | 6.17         |     
                perl-http-date |  DISTRO  | https://release-monitoring.org/project/002976 | 6.06         | 6.08         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/002977 | 7.01         | 7.04         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.59        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.099        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/003024 | 6.81         | 6.83         |     
           perl-lwp-mediatypes |  DISTRO  | https://release-monitoring.org/project/003047 | 6.04         | 6.05         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/003050 | 6.14         | 6.17         |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.515        | 5.518        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/011870 | 0.052        | 0.053        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.42         | 9.49         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20250602     | 20260813     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/003147 | 1.53         | 1.57         |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0051       | 1.0054       |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/010665 | 2.002004     | 2.002005     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/005675 | 0.20         | 0.21         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2015.103     | 2026.0219    |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/003463 | 2.33         | 2.35         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.34         | 5.37         |     
           perl-www-robotrules |  DISTRO  | https://release-monitoring.org/project/003506 | 6.02         | 6.03         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0213       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.3        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 2.3.0        | 2.3.1        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 2.3.0        | 2.3.1        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/003643 | 1.3.2        | 1.3.3        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.6.6        | 1.6.8        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 3.0.7        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.14.2       | 1.15.3       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 6.1.1        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 5.0          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 127          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.08.0      |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.23         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.13       | 1.3.14       | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/003702 | 2.15         | 2.16         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/003708 | 4.0.6        | 4.0.7        | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.12      |     
                          proj |  DISTRO  | https://release-monitoring.org/project/009463 | 9.8.0        | 9.8.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.6       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.10.5       | 1.11.0       |     
                 python-aerich |  DISTRO  | https://release-monitoring.org/project/099620 | 0.9.2        | 0.10.1       |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/021245 | 4.0.0        | 4.0.4        |     
       python-aiohappyeyeballs |  DISTRO  | https://release-monitoring.org/project/373934 | 2.6.1        | 2.7.1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/006713 | 3.13.5       | 3.14.3       |     
                python-alembic |  DISTRO  | https://release-monitoring.org/project/003766 | 1.17.2       | 1.20.0       |     
          python-annotated-doc |  DISTRO  | https://release-monitoring.org/project/386516 | 0.0.4        | 0.0.5        |     
        python-annotated-types |  DISTRO  | https://release-monitoring.org/project/257625 | 0.7.0        | 0.8.0        |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/049275 | 4.13.0       | 4.15.1       |     
            python-apscheduler |  DISTRO  | https://release-monitoring.org/project/005641 | 3.11.2       | 3.11.3       |     
            python-argcomplete |  DISTRO  | https://release-monitoring.org/project/003773 | 3.6.3        | 3.7.2        |     
   python-argon2-cffi-bindings |  DISTRO  | https://release-monitoring.org/project/241938 | 25.1.0       | 26.1.0       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/018462 | 3.11.1       | 3.12.1       |     
              python-asttokens |  DISTRO  | https://release-monitoring.org/project/019936 | 3.0.1        | 3.0.2        |     
             python-asyncclick |  DISTRO  | https://release-monitoring.org/project/025628 | 8.3.0.7      | 8.4.2.1      |     
               python-asyncssh |  DISTRO  | https://release-monitoring.org/project/017555 | 2.22.0       | 2.24.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/007015 | 25.12.2      | 26.7.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/011984 | 2.17.0       | 2.18.0       |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/003779 | 4.14.3       | 4.15.0       |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.23.1       | 0.24.1       |     
               python-bitarray |  DISTRO  | https://release-monitoring.org/project/011014 | 3.8.1        | 3.11.0       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/026271 | 3.0.1        | 3.0.2        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/029737 | 1.43.1       | 1.43.93      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/008748 | 1.43.1       | 1.43.93      |     
               python-cachelib |  DISTRO  | https://release-monitoring.org/project/101091 | 0.14.0       | 0.17.0       |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 6.2.4        | 7.1.8        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/064102 | 5.9.0        | 6.1.4        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/014813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/007995 | 2026.4.22    | 2026.7.22    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/005536 | 2.0.0        | 2.1.1        |     
                python-chardet |  DISTRO  | https://release-monitoring.org/project/003798 | 5.2.0        | 7.6.0        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/055366 | 3.4.5        | 3.5.1        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/013246 | 3.2.6.post2  | 3.4.0        |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/003802 | 8.4.2        | 8.5.0        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/012509 | 6.10.1       | 6.12.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/019734 | 1.1.30       | 2.0.3        |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.3.3        | 1.4.0        |     
                    python-crc |  DISTRO  | https://release-monitoring.org/project/086881 | 7.1.0        | 8.0.0        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/031282 | 3.3.0        | 3.4.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/005532 | 48.0.0       | 50.0.1       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/011593 | 1.4.0        | 1.5.0        |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/086109 | 0.9.0        | 0.10.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/036699 | 3.2.3        | 3.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/021939 | 4.2.1        | 4.2.3        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/021697 | 1.1.0        | 1.1.1        |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 5.0.14       | 5.0.22       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/003819 | 5.2.1        | 5.3.1        |     
             python-dictdiffer |  DISTRO  | https://release-monitoring.org/project/019612 | 0.9.0        | 0.10.0       |     
                python-distlib |  DISTRO  | https://release-monitoring.org/project/034504 | 0.4.0        | 0.4.3        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 6.0.6        | 6.1.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/003847 | 7.1.0        | 7.2.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/003849 | 0.22.4       | 0.23         |     
                 python-dotenv |  DISTRO  | https://release-monitoring.org/project/019788 | 1.2.1        | 1.2.3        |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2026.4       | 2026.6       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/008370 | 0.19.1       | 0.19.2       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/015064 | 4.13.0       | 4.14.0       |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.1.0        | 5.4.0        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/062869 | 1.9.3        | 2.0.0        |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/003860 | 4.2.0        | 4.3.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/047977 | 0.136.3      | 0.141.1      |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/011739 | 3.29.0       | 3.32.6       |     
          python-flask-caching |  DISTRO  | https://release-monitoring.org/project/047963 | 2.4.0        | 2.5.1        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/019867 | 6.0.2        | 6.0.5        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.12.0       | 4.0.2        |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/007388 | 4.62.1       | 4.65.0       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/006459 | 3.1.46       | 3.1.62       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.6.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/013158 | 3.56.3       | 3.58.0       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/025386 | 2.30.3       | 2.36.0       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/038039 | 2.49.1       | 2.58.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/063943 | 1.74.0       | 1.75.3       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/019948 | 2.0.1        | 2.0.1.post3  |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/006870 | 3.5.0        | 3.5.5        |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/018429 | 1.76.0       | 1.83.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/030542 | 1.76.0       | 1.83.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/003882 | 23.0.0       | 26.2.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/019033 | 4.3.0        | 4.4.1        |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.29.0       | 1.32.0       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/012002 | 3.3.1        | 3.4.1        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/019034 | 4.1.0        | 4.2.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/003887 | 0.31.2       | 0.32.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/019799 | 4.15.0       | 4.16.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/005487 | 3.11         | 3.19         |     
              python-installer |  DISTRO  | https://release-monitoring.org/project/197662 | 1.0.0        | 1.0.1        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/001399 | 9.8.0        | 9.17.1       |     
            python-iterable-io |  DISTRO  | https://release-monitoring.org/project/374467 | 1.0.1        | 1.0.4        |     
         python-jaraco-context |  DISTRO  | https://release-monitoring.org/project/062309 | 6.0.2        | 6.1.2        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/020165 | 4.4.0        | 4.6.0        |     
            python-jaraco-text |  DISTRO  | https://release-monitoring.org/project/023436 | 4.0.0        | 4.3.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/003893 | 0.19.2       | 0.20.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/016910 | 1.4.9        | 1.5.1        |     
                  python-librt |  DISTRO  | https://release-monitoring.org/project/388232 | 0.9.0        | 0.15.0       |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/012301 | 3.3.1        | 3.4.0        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/015512 | 2.2.0        | 2.3.0        |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/020016 | 1.9.2        | 1.10.1       |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/003914 | 6.0.2        | 6.1.3        |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/017278 | 0.23.0       | 0.24.0       |     
python-magic-wormhole-mailb... |  DISTRO  | https://release-monitoring.org/project/019823 | 0.6.0        | 0.8.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/003915 | 1.3.12       | 1.4.1        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/003916 | 3.10.2       | 3.10.3       |     
         python-markdown-it-py |  DISTRO  | https://release-monitoring.org/project/088959 | 4.0.0        | 4.2.0        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/008079 | 4.3.0        | 4.3.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.9       | 3.11.2       |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.2.1        | 0.2.2        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/042653 | 1.11.2       | 1.15.0       |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/021702 | 1.1.4        | 1.1.5        |     
        python-mdit-py-plugins |  DISTRO  | https://release-monitoring.org/project/149444 | 0.5.0        | 0.6.1        |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.20.0       |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.19.0       | 0.21.1       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/006189 | 3.2.0        | 3.3.4        |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.5.4        | 0.6.0        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 11.0.2       | 11.1.0       |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
                 python-mpmath |  DISTRO  | https://release-monitoring.org/project/003930 | 1.3.0        | 1.4.1        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/021831 | 1.1.2        | 1.2.2        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 6.7.1        | 6.8.0        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/018463 | 0.0.22       | 0.0.32       |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/003931 | 1.47.0       | 1.48.1       |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.3.1        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.5.3        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.1.5        | 2.0.1        |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/031737 | 3.11.5       | 3.12.0       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/060461 | 26.2         | 26.3         |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/003954 | 4.0.0        | 5.0.0+rtd1   |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/016689 | 0.8.6        | 0.8.7        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/003960 | 7.0.3        | 7.1.1        |     
            python-pdm-backend |  DISTRO  | https://release-monitoring.org/project/306904 | 2.4.8        | 2.4.9        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 12.0.0       | 12.3.0       |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/006529 | 26.1         | 26.2.1       |     
           python-platformdirs |  DISTRO  | https://release-monitoring.org/project/200932 | 4.9.6        | 4.11.8       |     
            python-poetry-core |  DISTRO  | https://release-monitoring.org/project/071155 | 2.3.2        | 2.4.1        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/008742 | 3.0.52       | 3.0.53       |     
              python-propcache |  DISTRO  | https://release-monitoring.org/project/375192 | 0.4.1        | 0.5.2        |     
             python-proto-plus |  DISTRO  | https://release-monitoring.org/project/099887 | 1.27.2       | 1.28.4       |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/003979 | 2.9.11       | 2.9.13       |     
                python-psygnal |  DISTRO  | https://release-monitoring.org/project/218690 | 0.15.1       | 0.16.1       |     
              python-pure-eval |  DISTRO  | https://release-monitoring.org/project/057556 | 0.2.3        | 0.2.4        |     
                  python-pyaml |  DISTRO  | https://release-monitoring.org/project/083931 | 26.2.1       | 26.7.0       |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/006996 | 0.6.3        | 0.6.4        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/013384 | 3.0.1        | 3.1.0        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/013166 | 1.29.0       | 1.29.1       |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.11       | 0.8.1        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20260313.1   | 20260818.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/039654 | 2.13.3       | 2.13.5       |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.46.3       | 2.49.0       |     
      python-pydantic-settings |  DISTRO  | https://release-monitoring.org/project/342182 | 2.14.0       | 2.15.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/016219 | 0.32         | 0.33         |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/003986 | 2.20.0       | 2.21.0       |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/005653 | 2.12.1       | 2.14.0       |     
               python-pylibfdt |  DISTRO  | https://release-monitoring.org/project/269896 | 1.7.2.post1  | 1.7.2.post2  |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/021583 | 0.23.0       | 0.24.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/015600 | 3.13.0       | 3.15.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 1.28.2       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/007284 | 1.1.2        | 1.2.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/005535 | 26.1.0       | 26.4.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.3.0        | 1.6.1        |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/019681 | 0.17.2       | 0.18.1       |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                 python-pyproj |  DISTRO  | https://release-monitoring.org/project/003758 | 3.7.2        | 3.8.0        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.11.0       | 0.12.1       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
              python-pyqt5-sip |  DISTRO  | https://release-monitoring.org/project/025847 | 12.18.0      | 12.19.0      |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/021589 | 1.2.13       | 1.2.15       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/013209 | 1.6.2        | 2.0.0        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/012027 | 7.1.22       | 7.1.29       |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.12.1       | 0.12.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/003765 | 9.0.3        | 9.1.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.3.0        | 1.4.0        |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/021140 | 0.18.1       | 0.19.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/006537 | 2026.1.post1 | 2026.3.post1 |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.2.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/003992 | 7.4.0        | 8.1.0        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/005548 | 2026.4.4     | 2026.9.10    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/004004 | 2.33.1       | 2.34.2       |     
                python-rpds-py |  DISTRO  | https://release-monitoring.org/project/368622 | 0.30.0       | 2026.6.3     |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/062048 | 0.10.0       | 0.13.0       |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/019641 | 2.1.76       | 2.2.4        |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/066067 | 0.19.0       | 0.19.1       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/010428 | 0.17.0       | 0.19.2       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.17.1       | 1.18.1       |     
                  python-sdbus |  DISTRO  | https://release-monitoring.org/project/146451 | 0.14.2       | 0.14.3       |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/005645 | 4.39.0       | 4.49.0       |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/012989 | 3.0.4        | 3.1.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.58.0       | 2.69.1       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/007917 | 24.2.0       | 26.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/004021 | 80.9.0       | 84.0.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.12.1       | 1.13.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/007874 | 9.2.2        | 10.3.0       |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/010429 | 2.2.2        | 2.4.0        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/004026 | 4.1.1        | 4.1.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.16.1       |     
            python-smbprotocol |  DISTRO  | https://release-monitoring.org/project/047981 | 1.16.1       | 1.17.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/007203 | 0.6.1        | 0.7.3        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/021611 | 5.16.0       | 5.16.4       |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/027570 | 2.8.3        | 2.9.2        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/004034 | 2.0.49       | 2.0.52       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/004038 | 0.5.5        | 0.6.0        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/036570 | 1.1.0        | 1.6.0        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/007314 | 235          | 236          |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/021613 | 1.3.4        | 1.3.5        |     
             python-telnetlib3 |  DISTRO  | https://release-monitoring.org/project/133741 | 4.0.2        | 5.0.0        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.12.0       |     
                python-textual |  DISTRO  | https://release-monitoring.org/project/209284 | 8.2.5        | 8.2.8        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/021614 | 0.22.0       | 0.24.0       |     
                python-tomlkit |  DISTRO  | https://release-monitoring.org/project/019609 | 0.14.0       | 0.15.1       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/007498 | 6.5.5        | 6.5.8        |     
           python-tortoise-orm |  DISTRO  | https://release-monitoring.org/project/033168 | 1.1.7        | 1.1.8        |     
             python-tpm2-pytss |  DISTRO  | https://release-monitoring.org/project/060656 | 2.3.0        | 3.0.0        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/036051 | 4.67.3       | 4.70.1       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/012211 | 5.14.3       | 5.16.1       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/019614 | 25.5.0       | 26.7.0       |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/017451 | 0.33.0       | 0.34.0       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/088298 | 2026.4.28.13 | 2026.6.1.19  |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/004071 | 25.5.0       | 26.4.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/007202 | 25.12.2      | 26.6.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/019661 | 24.8.0       | 26.6.0       |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/038819 | 4.5.1        | 4.6.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/021617 | 1.3.4        | 2.0.0        |     
           python-types-psutil |  DISTRO  | https://release-monitoring.org/project/221807 | 7.2.2.202... | 7.2.2.202... |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.9.0.202... | 2.9.0.202... |     
       python-types-setuptools |  DISTRO  | https://release-monitoring.org/project/214295 | 82.0.0.20... | 84.0.0.20... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/019755 | 4.15.0       | 4.16.0       |     
      python-typing-inspection |  DISTRO  | https://release-monitoring.org/project/377682 | 0.4.2        | 0.4.4        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/004076 | 5.12.0       | 6.0.0        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/004079 | 4.0.0        | 4.1.3        |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/028526 | 0.46.0       | 0.52.4       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/008743 | 0.2.14       | 0.8.3        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/011057 | 68.1         | 70.0         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.3.3        |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/006181 | 1.8.9        | 1.8.11       |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/007288 | 1.9.0        | 1.9.2        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/008100 | 16.0         | 17.1         |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/011428 | 0.47.0       | 0.48.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/006108 | 2.0.1        | 2.4.1        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/011805 | 3.2.1        | 3.2.2        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/012895 | 1.23.0       | 1.24.5       |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/050636 | 20230507.3   | 20260805.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/012681 | 0.148.0      | 0.151.3      |     
           python-zipstream-ng |  DISTRO  | https://release-monitoring.org/project/215954 | 1.9.0        | 1.9.3        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 26.7.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/004112 | 8.4          | 8.6          |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/050016 | 0.4.1        | 0.4.3        |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 11.0.0       | 11.1.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 12.3.2       | 12.4.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.2       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.2       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.2       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.11.2       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.18      | 6.11.2       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.1       | 6.11.2       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.1       | 6.11.2       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.11.1       | 6.11.2       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.1       | 6.11.2       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.1       | 6.11.2       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.1       | 6.11.2       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/004141 | 1.5          | 1.7.2        |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                           qwt |  DISTRO  | https://release-monitoring.org/project/004147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.17.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/007426 | 1.9.3        | 1.9.4        |     
                     rasdaemon |  DISTRO  | https://release-monitoring.org/project/377958 | 0.8.4        | 0.9.92       |     
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 65.0         |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260616   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.8       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.2.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 11.0.4       | 11.8.1       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2608.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.10         |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.22      | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/087994 | 9.0.4        | 9.1.0        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.6        | 1.5.1        |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/017910 | 0.72.1       | 0.73.2       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 46.0         |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.1.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.7.0.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.37      | 0.99.38      |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scdoc |  GUESS   | https://release-monitoring.org/project/068662 | 1.11.4       | 1.11.5       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/004770 | 4.8.1        | 4.11.1       |     
                   screenfetch |  DISTRO  | https://release-monitoring.org/project/005733 | 3.9.1        | 3.9.9        | ORPH
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.16       | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.12       | 3.4.6        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.4        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 3.2.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.6        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.16.6       |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.32.8       | 0.32.10      |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.7.1        | ORPH
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/004801 | 1.48         | 1.49         |     
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.20.2       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 4.3.7        | 5.5.1        | ORPH
                      shapelib |  DISTRO  | https://release-monitoring.org/project/004804 | 1.6.2        | 1.6.3        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.5.1        | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.15.1.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.9.1        | 4.9.4        | ORPH
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.3.3        | 1.3.5        |     
                      snagboot |  DISTRO  | https://release-monitoring.org/project/351979 | 2.6.1        | 3.0.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.8.4        | ORPH
                  snmpclitools |  DISTRO  | https://release-monitoring.org/project/031640 | 0.6.4        | 0.7.2        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.5        | 4.0.0        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.6          |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.11.1.0     | 3.12.2.0     |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/020628 | 1.0.2        | 1.1.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                 spirv-headers |  DISTRO  | https://release-monitoring.org/project/230542 | 1.4.350.0    | 2026.08.0    | ORPH
         spirv-llvm-translator |  DISTRO  | https://release-monitoring.org/project/227273 | 22.1.3       | 23.1.1       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.350.0    | 1.4.357.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.19.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.11      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.02      | 0.22.00      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.1.0        |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.06        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/016289 | 4.2.5        | 4.3.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/010925 | 8.0.4        | 8.0.6        |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/004919 | 4.1.1        | 4.5.0        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 10.0.2       | 10.1.5       |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.10.1       | 0.10.2       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 51.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 5.1.0        |     
                   sysrepo-cpp |  DISTRO  | https://release-monitoring.org/project/388239 | 6            | 10           |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.8.0       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 258.7        | 261.3        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                     tailscale |  DISTRO  | https://release-monitoring.org/project/141585 | 1.78.1       | 1.102.4      |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/009174 | 2.1.58       | 3.0.2        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.1.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.0       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.0.4        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.2.5        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/013716 | 4.5.2        | 4.6.1        | ORPH
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.9.0        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.2        | 5.5.3        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                           tig |  DISTRO  | https://release-monitoring.org/project/004969 | 2.6.0        | 2.6.1        |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.28.3       | 2.30.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.3        |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20260906     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.8.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.0.4        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.6b         | 3.7c         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                  tpm2-openssl |  DISTRO  | https://release-monitoring.org/project/242488 | 1.2.0        | 1.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 4.1.3        | 4.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.3        | 3.4          |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/005021 | 2026b        | 2026c        |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.20         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.11.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 7.2.6        | 7.3.1        |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.9.18       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.2.1        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.61         | 6.66         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.11.3       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.3       |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.3       |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.15.3       | 0.15.4       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.26.0       | 3.27.1       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.3        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.2        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.2.0943     | 9.2.1099     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.1       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.362      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.362      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.357.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.362      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.26.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.48         | 1.49         | ORPH
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.4       | 2.53.92      |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.23         | 2.25         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.17        |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.14       | 0.5.17       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/005137 | 4.4.18       | 4.6.8        |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.1.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.52.6       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.50.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 4.1          | 4.2          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.30       | 2.1.0        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.1        | 1.1.2        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.9        | 1.1.1        | ORPH
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/017156 | 1.0.7        | 1.0.8        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.10       | 1.0.11       | ORPH
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/021722 | 1.0.6        | 1.0.7        | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.6        | 1.0.7        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20260907     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.3        | 1.2.4        | ORPH
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/012314 | 1.3.4        | 1.3.5        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/005164 | 1.1.2        | 1.1.3        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.5        | 1.1.6        | ORPH
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/015032 | 1.1.1        | 1.2.1        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.1.0        | 1.1.1        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.4        | 1.2.5        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.5        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.1        | 1.1.2        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.7        | 1.0.8        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.2.0        | 1.2.2        | ORPH
                 xapp_xlsatoms |  DISTRO  | https://release-monitoring.org/project/014990 | 1.1.4        | 1.1.5        | ORPH
               xapp_xlsclients |  DISTRO  | https://release-monitoring.org/project/014989 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.8        | 1.0.9        | ORPH
                  xapp_xmodmap |  DISTRO  | https://release-monitoring.org/project/014960 | 1.0.11       | 1.0.12       | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.2.0        | 1.2.1        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                     xapp_xrdb |  DISTRO  | https://release-monitoring.org/project/014956 | 1.2.2        | 1.2.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.1.0        | 1.1.1        | ORPH
                     xapp_xset |  DISTRO  | https://release-monitoring.org/project/014954 | 1.2.5        | 1.2.6        | ORPH
                 xapp_xsetroot |  DISTRO  | https://release-monitoring.org/project/014953 | 1.1.3        | 1.1.4        | ORPH
                 xapp_xstdcmap |  DISTRO  | https://release-monitoring.org/project/017150 | 1.0.5        | 1.0.6        | ORPH
                   xapp_xvinfo |  DISTRO  | https://release-monitoring.org/project/014951 | 1.1.5        | 1.1.6        | ORPH
                      xapp_xwd |  DISTRO  | https://release-monitoring.org/project/014950 | 1.0.9        | 1.0.10       | ORPH
                 xapp_xwininfo |  DISTRO  | https://release-monitoring.org/project/014949 | 1.1.6        | 1.1.7        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.7        | 1.0.8        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.1.1        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.48         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.19       | 1.3.20       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.12       | 1.8.13       | ORPH
            xlib_libXcomposite |  DISTRO  | https://release-monitoring.org/project/001769 | 0.4.6        | 0.4.7        | ORPH
               xlib_libXdamage |  DISTRO  | https://release-monitoring.org/project/001771 | 1.1.6        | 1.1.7        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.6        | 1.3.7        | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/017165 | 2.0.8        | 2.0.9        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.2        | 1.8.3        | ORPH
              xlib_libXinerama |  DISTRO  | https://release-monitoring.org/project/001779 | 1.1.5        | 1.1.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.2.1        | 1.3.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.4        | 1.5.5        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.14       | 1.0.15       | ORPH
              xlib_libXxf86dga |  DISTRO  | https://release-monitoring.org/project/001797 | 1.1.6        | 1.1.7        | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.6        | 1.1.7        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.8        | 1.1.9        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.3        | 1.2.0        | ORPH
                    xmlstarlet |  DISTRO  | https://release-monitoring.org/project/005201 | 1.6.1        | 1.7.0        | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.16         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.31         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/005272 | 410          | 411          |     
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.9        | 1.0.10       | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 14.2         | 15.0         |     
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.53.6       |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.16.0       | 5.1.0        |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.13       | 7.4.14       |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.4        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/016905 | 2026b        | 2026c        |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.10.0       |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/005307 | 5.9          | 5.9.2        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.1.1        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                     coreutils | CVE-2026-56392   | https://security-tracker.debian.org/tracker/CVE-2026-56392  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                        drogon | CVE-2023-26138   | https://security-tracker.debian.org/tracker/CVE-2023-26138  
                        drogon | CVE-2023-26137   | https://security-tracker.debian.org/tracker/CVE-2023-26137  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                          gawk | CVE-2026-40553   | https://security-tracker.debian.org/tracker/CVE-2026-40553  
                          gawk | CVE-2026-40468   | https://security-tracker.debian.org/tracker/CVE-2026-40468  
                          gawk | CVE-2026-40469   | https://security-tracker.debian.org/tracker/CVE-2026-40469  
                          gawk | CVE-2026-40467   | https://security-tracker.debian.org/tracker/CVE-2026-40467  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          gpsd | CVE-2026-58459   | https://security-tracker.debian.org/tracker/CVE-2026-58459  
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                       openvpn | CVE-2026-11604   | https://security-tracker.debian.org/tracker/CVE-2026-11604  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                         wget2 | CVE-2026-1858    | https://security-tracker.debian.org/tracker/CVE-2026-1858   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                        zabbix | CVE-2026-23920   | https://security-tracker.debian.org/tracker/CVE-2026-23920  
                        zabbix | CVE-2026-23921   | https://security-tracker.debian.org/tracker/CVE-2026-23921  

CVEs for the '2026.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                     coreutils | CVE-2026-56392   | https://security-tracker.debian.org/tracker/CVE-2026-56392  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                        drogon | CVE-2023-26138   | https://security-tracker.debian.org/tracker/CVE-2023-26138  
                        drogon | CVE-2023-26137   | https://security-tracker.debian.org/tracker/CVE-2023-26137  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                          gawk | CVE-2026-40553   | https://security-tracker.debian.org/tracker/CVE-2026-40553  
                          gawk | CVE-2026-40468   | https://security-tracker.debian.org/tracker/CVE-2026-40468  
                          gawk | CVE-2026-40469   | https://security-tracker.debian.org/tracker/CVE-2026-40469  
                          gawk | CVE-2026-40467   | https://security-tracker.debian.org/tracker/CVE-2026-40467  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          gpsd | CVE-2026-58459   | https://security-tracker.debian.org/tracker/CVE-2026-58459  
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                       openvpn | CVE-2026-11604   | https://security-tracker.debian.org/tracker/CVE-2026-11604  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                        thrift | CVE-2026-41608   | https://security-tracker.debian.org/tracker/CVE-2026-41608  
                        thrift | CVE-2026-58023   | https://security-tracker.debian.org/tracker/CVE-2026-58023  
                        thrift | CVE-2026-49158   | https://security-tracker.debian.org/tracker/CVE-2026-49158  
                        thrift | CVE-2026-48586   | https://security-tracker.debian.org/tracker/CVE-2026-48586  
                        thrift | CVE-2026-45112   | https://security-tracker.debian.org/tracker/CVE-2026-45112  
                        thrift | CVE-2026-43871   | https://security-tracker.debian.org/tracker/CVE-2026-43871  
                        thrift | CVE-2026-55968   | https://security-tracker.debian.org/tracker/CVE-2026-55968  
                        thrift | CVE-2026-55970   | https://security-tracker.debian.org/tracker/CVE-2026-55970  
                        thrift | CVE-2026-55969   | https://security-tracker.debian.org/tracker/CVE-2026-55969  
                        thrift | CVE-2026-55971   | https://security-tracker.debian.org/tracker/CVE-2026-55971  
                        thrift | CVE-2026-58389   | https://security-tracker.debian.org/tracker/CVE-2026-58389  
                        thrift | CVE-2026-66053   | https://security-tracker.debian.org/tracker/CVE-2026-66053  
                        thrift | CVE-2026-58662   | https://security-tracker.debian.org/tracker/CVE-2026-58662  
                        thrift | CVE-2026-48145   | https://security-tracker.debian.org/tracker/CVE-2026-48145  
                        thrift | CVE-2026-48144   | https://security-tracker.debian.org/tracker/CVE-2026-48144  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                         wget2 | CVE-2026-1858    | https://security-tracker.debian.org/tracker/CVE-2026-1858   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                        zabbix | CVE-2026-23920   | https://security-tracker.debian.org/tracker/CVE-2026-23920  
                        zabbix | CVE-2026-23921   | https://security-tracker.debian.org/tracker/CVE-2026-23921  

CVEs for the '2026.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                     coreutils | CVE-2026-56392   | https://security-tracker.debian.org/tracker/CVE-2026-56392  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                          gawk | CVE-2026-40553   | https://security-tracker.debian.org/tracker/CVE-2026-40553  
                          gawk | CVE-2026-40468   | https://security-tracker.debian.org/tracker/CVE-2026-40468  
                          gawk | CVE-2026-40469   | https://security-tracker.debian.org/tracker/CVE-2026-40469  
                          gawk | CVE-2026-40467   | https://security-tracker.debian.org/tracker/CVE-2026-40467  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          gpsd | CVE-2026-58459   | https://security-tracker.debian.org/tracker/CVE-2026-58459  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-33948   | https://security-tracker.debian.org/tracker/CVE-2026-33948  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                       openvpn | CVE-2026-11604   | https://security-tracker.debian.org/tracker/CVE-2026-11604  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                        thrift | CVE-2026-41608   | https://security-tracker.debian.org/tracker/CVE-2026-41608  
                        thrift | CVE-2026-58023   | https://security-tracker.debian.org/tracker/CVE-2026-58023  
                        thrift | CVE-2026-49158   | https://security-tracker.debian.org/tracker/CVE-2026-49158  
                        thrift | CVE-2026-48586   | https://security-tracker.debian.org/tracker/CVE-2026-48586  
                        thrift | CVE-2026-45112   | https://security-tracker.debian.org/tracker/CVE-2026-45112  
                        thrift | CVE-2026-43871   | https://security-tracker.debian.org/tracker/CVE-2026-43871  
                        thrift | CVE-2026-55968   | https://security-tracker.debian.org/tracker/CVE-2026-55968  
                        thrift | CVE-2026-55970   | https://security-tracker.debian.org/tracker/CVE-2026-55970  
                        thrift | CVE-2026-55969   | https://security-tracker.debian.org/tracker/CVE-2026-55969  
                        thrift | CVE-2026-55971   | https://security-tracker.debian.org/tracker/CVE-2026-55971  
                        thrift | CVE-2026-58389   | https://security-tracker.debian.org/tracker/CVE-2026-58389  
                        thrift | CVE-2026-66053   | https://security-tracker.debian.org/tracker/CVE-2026-66053  
                        thrift | CVE-2026-58662   | https://security-tracker.debian.org/tracker/CVE-2026-58662  
                        thrift | CVE-2026-48145   | https://security-tracker.debian.org/tracker/CVE-2026-48145  
                        thrift | CVE-2026-48144   | https://security-tracker.debian.org/tracker/CVE-2026-48144  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                        zabbix | CVE-2026-23920   | https://security-tracker.debian.org/tracker/CVE-2026-23920  
                        zabbix | CVE-2026-23921   | https://security-tracker.debian.org/tracker/CVE-2026-23921  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
           binutils-bare-metal | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
           binutils-bare-metal | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
           binutils-bare-metal | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
           binutils-bare-metal | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
           binutils-bare-metal | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
           binutils-bare-metal | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
           binutils-bare-metal | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
           binutils-bare-metal | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
           binutils-bare-metal | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
           binutils-bare-metal | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                     coreutils | CVE-2026-56392   | https://security-tracker.debian.org/tracker/CVE-2026-56392  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                         forge | CVE-2025-12816   | https://security-tracker.debian.org/tracker/CVE-2025-12816  
                         forge | CVE-2026-33891   | https://security-tracker.debian.org/tracker/CVE-2026-33891  
                         forge | CVE-2026-33896   | https://security-tracker.debian.org/tracker/CVE-2026-33896  
                         forge | CVE-2026-33895   | https://security-tracker.debian.org/tracker/CVE-2026-33895  
                         forge | CVE-2026-33894   | https://security-tracker.debian.org/tracker/CVE-2026-33894  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
                           frr | CVE-2025-61101   | https://security-tracker.debian.org/tracker/CVE-2025-61101  
                           frr | CVE-2025-61107   | https://security-tracker.debian.org/tracker/CVE-2025-61107  
                           frr | CVE-2025-61105   | https://security-tracker.debian.org/tracker/CVE-2025-61105  
                           frr | CVE-2025-61106   | https://security-tracker.debian.org/tracker/CVE-2025-61106  
                           frr | CVE-2025-61103   | https://security-tracker.debian.org/tracker/CVE-2025-61103  
                           frr | CVE-2025-61104   | https://security-tracker.debian.org/tracker/CVE-2025-61104  
                           frr | CVE-2025-61100   | https://security-tracker.debian.org/tracker/CVE-2025-61100  
                           frr | CVE-2025-61102   | https://security-tracker.debian.org/tracker/CVE-2025-61102  
                           frr | CVE-2025-61099   | https://security-tracker.debian.org/tracker/CVE-2025-61099  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                          gawk | CVE-2026-40553   | https://security-tracker.debian.org/tracker/CVE-2026-40553  
                          gawk | CVE-2026-40468   | https://security-tracker.debian.org/tracker/CVE-2026-40468  
                          gawk | CVE-2026-40469   | https://security-tracker.debian.org/tracker/CVE-2026-40469  
                          gawk | CVE-2026-40467   | https://security-tracker.debian.org/tracker/CVE-2026-40467  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          gpsd | CVE-2026-58459   | https://security-tracker.debian.org/tracker/CVE-2026-58459  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-55204   | https://security-tracker.debian.org/tracker/CVE-2026-55204  
                       haproxy | CVE-2026-55203   | https://security-tracker.debian.org/tracker/CVE-2026-55203  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-47770   | https://security-tracker.debian.org/tracker/CVE-2026-47770  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-70968   | https://security-tracker.debian.org/tracker/CVE-2025-70968  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                      libglib2 | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
                      libglib2 | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                      libglib2 | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
                      libglib2 | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
                      libglib2 | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
            libglib2-bootstrap | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
            libglib2-bootstrap | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                 libmicrohttpd | CVE-2025-62689   | https://security-tracker.debian.org/tracker/CVE-2025-62689  
                 libmicrohttpd | CVE-2025-59777   | https://security-tracker.debian.org/tracker/CVE-2025-59777  
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-73282   | https://security-tracker.debian.org/tracker/CVE-2026-73282  
                       openssh | CVE-2026-73281   | https://security-tracker.debian.org/tracker/CVE-2026-73281  
                       openssh | CVE-2026-73283   | https://security-tracker.debian.org/tracker/CVE-2026-73283  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                       openvpn | CVE-2026-11604   | https://security-tracker.debian.org/tracker/CVE-2026-11604  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
                       proftpd | CVE-2026-63091   | https://security-tracker.debian.org/tracker/CVE-2026-63091  
                       proftpd | CVE-2026-63090   | https://security-tracker.debian.org/tracker/CVE-2026-63090  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                      protobuf | CVE-2026-0994    | https://security-tracker.debian.org/tracker/CVE-2026-0994   
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2025-69228   | https://security-tracker.debian.org/tracker/CVE-2025-69228  
                python-aiohttp | CVE-2025-69230   | https://security-tracker.debian.org/tracker/CVE-2025-69230  
                python-aiohttp | CVE-2025-69227   | https://security-tracker.debian.org/tracker/CVE-2025-69227  
                python-aiohttp | CVE-2025-69229   | https://security-tracker.debian.org/tracker/CVE-2025-69229  
                python-aiohttp | CVE-2025-69226   | https://security-tracker.debian.org/tracker/CVE-2025-69226  
                python-aiohttp | CVE-2025-69223   | https://security-tracker.debian.org/tracker/CVE-2025-69223  
                python-aiohttp | CVE-2025-69224   | https://security-tracker.debian.org/tracker/CVE-2025-69224  
                python-aiohttp | CVE-2025-69225   | https://security-tracker.debian.org/tracker/CVE-2025-69225  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-13462   | https://security-tracker.debian.org/tracker/CVE-2025-13462  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                       python3 | CVE-2026-3644    | https://security-tracker.debian.org/tracker/CVE-2026-3644   
                       python3 | CVE-2026-4519    | https://security-tracker.debian.org/tracker/CVE-2026-4519   
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40226   | https://security-tracker.debian.org/tracker/CVE-2026-40226  
                       systemd | CVE-2026-40225   | https://security-tracker.debian.org/tracker/CVE-2026-40225  
                       systemd | CVE-2026-29111   | https://security-tracker.debian.org/tracker/CVE-2026-29111  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                        thrift | CVE-2026-41608   | https://security-tracker.debian.org/tracker/CVE-2026-41608  
                        thrift | CVE-2026-58023   | https://security-tracker.debian.org/tracker/CVE-2026-58023  
                        thrift | CVE-2026-49158   | https://security-tracker.debian.org/tracker/CVE-2026-49158  
                        thrift | CVE-2026-48586   | https://security-tracker.debian.org/tracker/CVE-2026-48586  
                        thrift | CVE-2026-45112   | https://security-tracker.debian.org/tracker/CVE-2026-45112  
                        thrift | CVE-2026-43871   | https://security-tracker.debian.org/tracker/CVE-2026-43871  
                        thrift | CVE-2026-55968   | https://security-tracker.debian.org/tracker/CVE-2026-55968  
                        thrift | CVE-2026-55970   | https://security-tracker.debian.org/tracker/CVE-2026-55970  
                        thrift | CVE-2026-55969   | https://security-tracker.debian.org/tracker/CVE-2026-55969  
                        thrift | CVE-2026-55971   | https://security-tracker.debian.org/tracker/CVE-2026-55971  
                        thrift | CVE-2026-58389   | https://security-tracker.debian.org/tracker/CVE-2026-58389  
                        thrift | CVE-2026-66053   | https://security-tracker.debian.org/tracker/CVE-2026-66053  
                        thrift | CVE-2026-58662   | https://security-tracker.debian.org/tracker/CVE-2026-58662  
                        thrift | CVE-2026-48145   | https://security-tracker.debian.org/tracker/CVE-2026-48145  
                        thrift | CVE-2026-48144   | https://security-tracker.debian.org/tracker/CVE-2026-48144  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                   uboot-tools | CVE-2026-29009   | https://security-tracker.debian.org/tracker/CVE-2026-29009  
                   uboot-tools | CVE-2026-29008   | https://security-tracker.debian.org/tracker/CVE-2026-29008  
                   uboot-tools | CVE-2026-29007   | https://security-tracker.debian.org/tracker/CVE-2026-29007  
                   uboot-tools | CVE-2026-46728   | https://security-tracker.debian.org/tracker/CVE-2026-46728  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                     wireshark | CVE-2026-0962    | https://security-tracker.debian.org/tracker/CVE-2026-0962   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                        zabbix | CVE-2026-23920   | https://security-tracker.debian.org/tracker/CVE-2026-23920  
                        zabbix | CVE-2026-23921   | https://security-tracker.debian.org/tracker/CVE-2026-23921  
                          zeek | CVE-2026-60109   | https://security-tracker.debian.org/tracker/CVE-2026-60109  
                          zeek | CVE-2026-60108   | https://security-tracker.debian.org/tracker/CVE-2026-60108  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
