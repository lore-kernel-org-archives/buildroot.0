Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF05CCFA00
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 19:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB4A614DD;
	Thu, 30 Oct 2025 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kLpJK5NhGFx; Thu, 30 Oct 2025 19:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3F3D614D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F3D614D5;
	Thu, 30 Oct 2025 19:09:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7209F2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B45581E77
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSzgHqGnbrv3 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 19:09:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 448F381E12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 448F381E12
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 448F381E12
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 19:09:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso1117349f8f.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 12:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761851377; x=1762456177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PzDQV2YO5h1l4vUdt/f5kP64YzWdzhfQ+obQqpuQLwo=;
 b=hzIzI4mnEQ+tMesCQY2q4tFVfzQmzmckbIyROOMcqtCWdqtzlHeaI4Vb6ixEOgnMg7
 HuGa56THmrCS+535RogT3Y0aULgLi/ZKHq0/p6IEei8eaQmr6hyoB68K0JKFhy4l5OzJ
 Qx8URz0UkFG5GjGjlIvUI5to6tPYtiY4AYPRSlbVjjQ/oNhwaFpKc1vMOnE1/webh+aK
 E5bfj73nxRhsNsN6cuf4XEy6x32Gi1Oss9KFu271knQfPDpPAYLZENHLNW1DpWhsKQ5v
 u3pigeUXHxLunEPyXyholUERfjeVBmzCeB0+6eIHgaBK+vIor8VCAk64ZELVD3xqzLQj
 M60w==
X-Gm-Message-State: AOJu0YyDce8cHV90y7BSKWH/zrSbtLw/og0eX+M5mfkbw1n7ssbB2ui+
 PyOhzQHho8xFueD3iuItS8676DAlUWvGWeNIgCbACQCs27FZ3IzMjMYtk6dNvdN4COgVXMmwerS
 E2xGd
X-Gm-Gg: ASbGncvoXI1ronJjgcDieIiU6CeAqcMtzesnb62lo91MloK7wPbRLrxKFJoa5LZkkuU
 bTYSFvlPNykm51ZrRi0luVtpJVvYmWuyQ3u5IG7rgw+vcTrK7pi3NJHymBvVJ6uhR1+xVbwEjYr
 bzNWrGA+KtxDeEMqkjtXgvADw9YKJFJQ7bavFa7MC/cbt3IvoNNowCMgLGc7nmX9/0+HRVyhaA7
 Jmn0HRA2KC161nF+jTEQDnivko01OKlJzFWZFF/XwzgLwympnZnHfUfbFJ92ySyKtYFLT15vPyC
 0VnSAGT3Xl/myA09dF2BjIZR0y2rzYJnVsbdXrrvDiavKXaMakLv9nj5T+YMyEFYMdRQX/xjWpq
 bMcbHY0RjK9l6chShsK5MTgMSbIVskkBbJIM3kHpss+CUMvmaLyH6zd61Yf4rgZwU0MuwZuD0lA
 TD7rI9/7Cmyz9flVl6d21m8z3gRQ==
X-Google-Smtp-Source: AGHT+IFyJv4ohm8p5ITlsYsihyHrHbZBAgDM01A/JHjMuBgwix9wW32oHVqIICn+SP9p9w9QJCwSHQ==
X-Received: by 2002:a05:6000:40cc:b0:427:2e8:fe5e with SMTP id
 ffacd0b85a97d-429bd6721f4mr563254f8f.13.1761851377507; 
 Thu, 30 Oct 2025 12:09:37 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952e2e06sm33727962f8f.46.2025.10.30.12.09.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 12:09:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 20:09:34 +0100
Message-ID: <20251030190936.262624-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761851377; x=1762456177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=PzDQV2YO5h1l4vUdt/f5kP64YzWdzhfQ+obQqpuQLwo=;
 b=OOYuDwA47SFn7NssEzm8RasRKyZPTc9aYnjHtWtizKjVWTE/xfaqICLkjbrrroqoAl
 01JIe5ncgwx0VmTQXToNFtZa/BBbun+QMnfmkph4uRq/Xg0MvD7l5jyQiJHx2y4pftlP
 66h0iUqXXr1kC9GdyhU0Fy9kEJp7WyVxsIyBTug8L/OAyCD296QvALY4g6jurpSu6EEi
 DTC5iPdORgSFWtYGGHwjsOkBGe93ot3LfCuaKtLR6oeHGIEn+/LzhWkEW7qvLQvElC3X
 p4mBRjLqujFTMxavZdl7S+gpLP7ZpCjAtUor3yxue3N/2S5sdz7yRQ6ZNdZ+cx6TbmGd
 yyvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OOYuDwA4
Subject: [Buildroot] [PATCH 0/2] Support "resolved_with_pedigree"
 vulnerability status
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

Hi,

The CycloneDX specification for vulnerabilities defines four analysis
states ([1]) for cases where a vulnerability does not affect a component:

* 'resolved'
* 'resolved_with_pedigree'
* 'not_affected'
* 'false_positive'

Currently, the metadatas present in Buildroot does not allow an accurate
mapping of ignored CVEs to the appropriate CycloneDX vulnerability
categories. As a result, all ignored CVEs are currently marked as
'in_triage' by default.

This default analysis was was established during the
introduction of the 'generate-cyclonedx' script.
The reasoning at the time was that SBOM consumers might want to
re-evaluate ignored vulnerabilities, as the Buildroot infrastructure
could not reliably determine their actual state.

To improve the association between patches and the vulnerabilities they
address, I proposed during the Amsterdam Buildroot Dev Meeting to
introduce a new 'CVE:' tag in the patch header, referencing the
vulnerability the patch address. This approach is similar to what Yocto
currently implements.

Further details are provided in the individual commit messages.

One of the challenges of this work was correctly splitting the patch
header from the patch content. I believe the implementation now supports
the various patch formats found in the Buildroot tree, but please let me
know if I missed any cases.

If this series is accepted, I plan to submit a follow-up series adding
'CVE:' tags to patches that address known vulnerabilities.

[1] https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_analysis_state

Thomas Perale (2):
  utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
  docs/manual: mention CVE trailer

 docs/manual/adding-packages-generic.adoc |   6 +-
 docs/manual/patch-policy.adoc            |  13 ++-
 utils/generate-cyclonedx                 | 137 +++++++++++++++++++----
 3 files changed, 133 insertions(+), 23 deletions(-)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
