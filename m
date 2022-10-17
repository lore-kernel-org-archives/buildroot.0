Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0885C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3810741764;
	Mon, 17 Oct 2022 15:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3810741764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ac1fpyQSQSV4; Mon, 17 Oct 2022 15:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C573A4176A;
	Mon, 17 Oct 2022 15:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C573A4176A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C77CF1BF2A5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B007781991
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B007781991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJA2fDbSZqPU for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B070B814B3
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B070B814B3
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:17:39 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q9so25811173ejd.0
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gcD2WqD4jaluztOmOHD7eWGNSEiuWsHhLa5EOhHy5ZQ=;
 b=gBumMhaDYz1IoPIZmLMfmRUjVMI9J/n6TAvvZZXmTANiioqTd7iLEqIeKOTbfM9ULA
 tegCPiFmo/eDStsNzteCG1p4FtcRkXk8YrJzF7QHHwiqGVhuzyO8xwXI/lQxKsotm8Zj
 M0UMc73/Xav7IAfXHLRwC9bwXNft0JPG9RZQsOA7Lq7EjL6xkZN2qvCgstzjmfR1MzJL
 6YflHieZ4FkLlv9gGrzEx4lzFErvbE6Py49GHnQ+BusIdLmBdr1JqKvrZ+aX9mmvqewL
 NgpXaog7QiGYieINCtZMlVdjdoRdzr6J7/QMMDkERnDNwHwateRL39SnIS0M+izizaOH
 qdMg==
X-Gm-Message-State: ACrzQf3ZYvg28ETYMTY6yMRPIWb73NWMhsvpq0wmyWUW1la1W+vGZrBi
 Dk9y6omzLpAtq1uYahrk/dTPuTbg2RkQs5UC
X-Google-Smtp-Source: AMsMyM7+xxyxevMz0Hz8IbinCehf17rFgxK/zfhCmfo08jPy5pukQ6XYFCJBIMj+fGVOo/uQzZ7peg==
X-Received: by 2002:a17:907:a4c:b0:77b:ba98:d3e with SMTP id
 be12-20020a1709070a4c00b0077bba980d3emr9154096ejc.13.1666019857251; 
 Mon, 17 Oct 2022 08:17:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2788:1a4:785::9])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a50d48b000000b00458947539desm7471904edi.78.2022.10.17.08.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:17:36 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:17:22 +0200
Message-Id: <20221017151726.44005-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gcD2WqD4jaluztOmOHD7eWGNSEiuWsHhLa5EOhHy5ZQ=;
 b=gdrMYqVxTIL2i4ajQ5+TsT03tdmZnoxhYjsgr3Rf1W68GAmq9Cbb1Wtj5mOV4mrp1h
 rJ+IKSDXG8eBw809Vq2XXqO34mrmIE0CK0FD5D7r2oD/Xy8WX5GwJxz2ehcjlRtSqtvq
 J6iLvFx1bBLpPYanznftdshH4wjyWNYpfCxBQBMl51lFfIWUhxB7H0zdzA6/9zadKNDe
 Y+OYFBE+g1dIlzP1k8ghz2ObrYFWYT/bOYQnaLTMknrlj5SiRv0D0kWKkdRPt0XH4/tt
 8HZ7OtlA08l3+Th+fmd2p6OKpzZL04FIkN0btgD297G58metzyPF7KtMYq7fR+Bo0Qvo
 TyyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=gdrMYqVx
Subject: [Buildroot] [PATCH 0/4] Add support for using a pre-compiled Go
 compiler
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Improvement from the buildroot TODO list. This patch add supports for
pre-built version of the Go compiler.

Right now this patch introduce a new virtual package called 'goc' to
do the selection between two provider:
  - go
  - go-bin
Right now there is some variable from the 'go' package are used in 
multiple go provider packages.
In an upcoming patch all the go related packages will move to a 'go'
subfolder that will hold all the common variables.

Thomas Perale (4):
  package/goc: new virtual package
  package/pkg-golang: set dependencies to host-goc
  package/go-bin: new package
  support/testing: add tests for Go

 fs/oci/Config.in                         |  1 +
 package/Config.in.host                   |  2 ++
 package/balena-engine/Config.in          |  1 +
 package/containerd/Config.in             |  1 +
 package/crucible/Config.in               |  1 +
 package/delve/Config.in                  |  1 +
 package/docker-cli/Config.in             |  1 +
 package/docker-compose/Config.in         |  1 +
 package/docker-engine/Config.in          |  1 +
 package/docker-proxy/Config.in           |  1 +
 package/embiggen-disk/Config.in          |  1 +
 package/flannel/Config.in                |  1 +
 package/gitlab-runner/Config.in          |  1 +
 package/go-bin/Config.in.host            |  5 +++
 package/go-bin/go-bin.hash               |  4 +++
 package/go-bin/go-bin.mk                 | 20 ++++++++++++
 package/go/go.mk                         |  2 ++
 package/goc/Config.in.host               | 39 +++++++++++++++++++++++
 package/goc/goc.mk                       |  7 +++++
 package/gocryptfs/Config.in              |  1 +
 package/mender-artifact/Config.in.host   |  1 +
 package/mender-connect/Config.in         |  1 +
 package/mender/Config.in                 |  1 +
 package/moby-buildkit/Config.in          |  1 +
 package/moby-buildkit/Config.in.host     |  1 +
 package/nerdctl/Config.in                |  1 +
 package/pkg-golang.mk                    |  4 +--
 package/runc/Config.in                   |  1 +
 package/tinifier/Config.in               |  1 +
 package/wtfutil/Config.in                |  1 +
 support/testing/tests/package/test_go.py | 40 ++++++++++++++++++++++++
 31 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 package/go-bin/Config.in.host
 create mode 100644 package/go-bin/go-bin.hash
 create mode 100644 package/go-bin/go-bin.mk
 create mode 100644 package/goc/Config.in.host
 create mode 100644 package/goc/goc.mk
 create mode 100644 support/testing/tests/package/test_go.py

-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
