Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D13F3D605
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFACA80CAE;
	Sun, 29 Mar 2026 15:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz6Ke9vKd3wm; Sun, 29 Mar 2026 15:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DFB80C68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774799258;
	bh=CdF1brnu3Ph+h5Dcd484sEShE29orOV2+o3tnSzjrVI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+0x5QENwyYAHgu0sAqeh+Eq3UOmk+2xyAW5fn1qXfvqSJkccjqBi0tPInToD1r1X
	 xm5Z7OJG30Hg2QjEd0WivO6GwXZnEF0yM/UL0WsWbBYSsfLnmd25hzjK79CPHlthkB
	 mbRlQ0hKrnNik1ZCW73FR9l4FVtxwZO4uHQkYHUWla8BGypWhp0Kd/FxBDGf1w01oU
	 EvRvxkQskLkbz4t9D6gpJoqT7TxN/85QxT6L501On8k4UmPARGIhnAseUUjOEYXU+H
	 wSRPhFG1Wrggxs7a1ORfi2BN/85w/ADzvurclaW59Qm4CAVlpZ6ESi2Xy19ht6DtEN
	 BHkydNj3leBXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DFB80C68;
	Sun, 29 Mar 2026 15:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF96F2EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C576A40B08
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eSl0ovPE27d for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 15:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E455E40ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E455E40ABE
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E455E40ABE
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:35 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8a016799d2cso9267416d6.1
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 08:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774799253; x=1775404053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uYuzRzUKapYOO9++JrxM1bZuQHApcQYTMxD4TitYaYI=;
 b=R9wyHaoo0uLrtJdQsAwNTt3me+SlhgI5Ijx+FuKd4e53Z/qIRZjJl3OY7b1yDSw7QZ
 T3gpw0nXbk2IzvsmAsmoa7y6BPErMLqxIObRbPOOxt1Jo0foAc7OvAH+KPP5OLDevkL5
 3jpgnv//cdwddKes/KOZrBCrH7lk5EFIM7lqktdT+DTWLlGFIK9rlwjA4MwM58IIAWc+
 vsc9rHyE54l9TLmyDIm1Sz+Ctax1QxOpiPG5l+mb8dPtM2/iQ2OZrA2xjL1SeQjxIUC+
 U6Vj7HMMql46HnkKC26fDkO1Bkbt6zxZ7xA9jYeaZb/XNN9q+pfw6JaUw9Pgxe9CYRDL
 nXBg==
X-Gm-Message-State: AOJu0YyQ47gFzS9DFrYgjeXExnFk2RWALELiG4CNUnYQl2mQrd/fIo2O
 0J1Q/wIAkJAHAEa+YpiyKEZBVPB9s4Y01+mizyEuyjvuWQserS+WKWOqy2RGWfXG
X-Gm-Gg: ATEYQzx/qbV1oJMf/pkRdmauLSgz+qz1YR4EWjMRg4DemAbJsMNQDxqawu2KiuskVhb
 yNhGrlLoSyQG8DI87hcNNZnWrK40IXhK6pMyHD82/Cx6Vs6VX28tEBqh4u7irUI7+Bv7FmEmFo4
 nIXYME8vMUURmGGyd6joncL9yAqe9u2CtLi4N+K8ws9QgViThLvCWJ49j+lBao7uEhUhTnZVUjj
 c6tFqPJ89jeGXqupqgTY2D2lEDZVVskY7GDfsoVHy6p95QcOjqTtM2lprZmgh+pD7kvw5xZ6SyY
 4pr4Eir6sUosXUmZyNguKzY/GZnTR4wPzIHRpdtkClCDazaK/EEMnYup4zej9i0cj1zs2ql6+3t
 ACObHXfW5RoEohptdkq7w5O3eEWtszL+HmNw8kpnRuuDLgft8qH/JIc6ukXoxf69YAgrm9Nwd0u
 /vT8NPiMIjTzdKepzVEZYY
X-Received: by 2002:ac8:57d6:0:b0:50b:54e8:39a3 with SMTP id
 d75a77b69052e-50ba380a88bmr137262331cf.2.1774799253409; 
 Sun, 29 Mar 2026 08:47:33 -0700 (PDT)
Received: from adicarlo.nyc ([67.245.157.254])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50bb2c67fefsm40926491cf.4.2026.03.29.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 08:47:32 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id 9FE61A9804F;
 Sun, 29 Mar 2026 11:47:31 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 2BE128A; Sun, 29 Mar 2026 11:47:31 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Sun, 29 Mar 2026 11:47:06 -0400
Message-ID: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774799253; x=1775404053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYuzRzUKapYOO9++JrxM1bZuQHApcQYTMxD4TitYaYI=;
 b=UZFolaZkm92zwYFlqwz/fiNWabmgsAEHgQHN6Yo7rx055uOvUrBnkUm9dc8rh4PiG5
 oAqzd0JGt0sm8JuCzBTN2Slj5F1J7oD/7R1jkPh8QE+ahV6/cd5zNhiAm8GOUpQL/S2W
 kTbppb9hRl3RA3fvrRhvCbc3vrUjJU822VYFEJXlp+zhcxo3t5VsFjGMZ37IalhsOcmL
 6w/6FHErcl5SFpwrtGYP93GXrNlrXGIlqmOuwPU75bC70yZ//1M9YbDPXCt9Dpi3STgc
 QjQGvzw6EfMpjWKBN5CT7sI1H/QsYNC/dRTD0YK2bxFahGTAecMWelSNQzqQmrUV1j50
 c/OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UZFolaZk
Subject: [Buildroot] [PATCH v2 0/3] gstreamer1: enable drm and udev
 independently
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

Fixes a problem impacting at least the gstreamer 'kmssink' when built
without libva, resulting a very limited capability sink.  These issues
are addressed by treating drm and udev as first class dependencies,
activited by their associated and packaged libraries.

Changes in v1 -> v2:
 - Improved commit messages.
 - Correct some alphabetic violations.
 - Linked to original V1:
    https://lore.kernel.org/buildroot/20260319022906.47253-1-a.p.dicarlo@gmail.com/

Adam Di Carlo (3):
  package/gst1-plugins-base: if libdrm is enabled, make use of it
  package/gst1-plugins-bad: decouple va from drm and separately select
    them
  package/gst1-plugins-bad: presence of libgudev enables udev support

 .../gst1-plugins-bad/gst1-plugins-bad.mk        | 17 ++++++++++++-----
 .../gst1-plugins-base/gst1-plugins-base.mk      |  7 +++++++
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
