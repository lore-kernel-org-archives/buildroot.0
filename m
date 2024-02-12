Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE99C4829A
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20CB584105;
	Mon, 12 Feb 2024 00:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xPfCtKi-ySs; Mon, 12 Feb 2024 00:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A575884119
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A575884119;
	Mon, 12 Feb 2024 00:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 312671BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E95041596
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svFfbctkXYCT for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27D3841592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D3841592
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27D3841592
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:41:09 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7c4592b4c91so52274739f.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707698468; x=1708303268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=Kl73GSZzUqqLlJz85HwaH8Lx2D/4pwc5zXL4O9+dOzyJ150t/a+HdCcFnC77AFX24B
 aiHxxbyjQ2dUF6S7RyhepY+YuC4LUgw+o3fJngGMyueq7oZRwuriqkDQaEOgQ2VODTA8
 Bvjt1z+tj4oildIR54R1LlS8FbmCwpDsR27WJrQotmFYfJS3t1Z0mhnlxHqQfkbve3Zf
 y9Rlp5UfwJGe8p1wqXuotQa7Lm8CEoQ2RXpkjkD09WKZijPZMUZzjkWknNjz/YXCTxR8
 hVfl8L9oUr2kAdkGwcelsrhkTnuenLe3pirhB1+TlspU/2zAhqbufeZ35b1T9D68e8zf
 uahg==
X-Gm-Message-State: AOJu0YxkVS/FDZsOJPo7++Lnu2tdeIUtt3YsVjGRwu1kihvshxiqlDhR
 V+Vk+0fOSQe03uF8+4a74b2A25N9+TI1sXtXT1qSbJFuEdtlcsN6mVS5cQDIbxg=
X-Google-Smtp-Source: AGHT+IF63NusfgTObt07JVLCTdGjKiEtEoSL8Rv+uopXPT4LC7mo/XrxJQzD8FOjYumCF25BhyB2KA==
X-Received: by 2002:a6b:4e0b:0:b0:7bc:3cb7:b68b with SMTP id
 c11-20020a6b4e0b000000b007bc3cb7b68bmr7372038iob.17.1707698468554; 
 Sun, 11 Feb 2024 16:41:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJh/bFxbsGNl6R1LC9MWqZlmBbSmxaliiNNv37i14gj4n223rahY2Vmc5OpvYfWxVhiQLc4wGlJMdkAJnEGH6Q7G0Emh25jonmdwmFqBfZf7Bmxwrp2cvYee+6mDlw9sHfwjIGHn5kVauQxNZiNnKoAmCyQPCxd6jJsuo/qMg6OKIqwNa4PJExClmzp/4iRYuzEgCRem7PrEHEFsKtzt8uor6Ahx8NgBCEXY/H6CvL2FSf7ZGojdDSytgeac/v8hXcuGlP7oot/3YTtrqxVdZBlfe8g9petSHWcp2wCM3qU2d9+SLlRENKG2baQvJidHXYcmYtOmXQrXy9dYwddq8qAw4=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 cs23-20020a056638471700b004715747ede4sm1141084jab.55.2024.02.11.16.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 16:41:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:41:00 -0700
Message-Id: <20240212004101.614670-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212004101.614670-1-james.hilliard1@gmail.com>
References: <20240212004101.614670-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707698468; x=1708303268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=Vb0LfSnINJpTeXusF/VmAUYHDIhnvCUymbX+Dij1V9/FPFmMTsB/eXqwAJ9Rj0GdHs
 LGuPEll5syGYfTBSo+PC8N5izGaViPTj7PLNtA5nwbp7tViIThlno4YfqHEUjZIKCeri
 bQxVBQ9Ns6gtCewDoqm85lAA8NoO5eiPHmf9psbyGPiWc9/oIGbEhoJonIz2po1At5PV
 0MpEPkR7YJalBusT0WEaMLy59uR5Mgn6Ob/JyHGQPMsIdW4KoWsy1LKtvCpV76el/+w4
 zYR7MTeqwk7kZ6gM+qU0WlNCiNaIHF8yFdpkGYv81dYf0G8vJnuArrXzGqs3SeHlhYDX
 Je/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vb0LfSnI
Subject: [Buildroot] [PATCH v3 4/5] package/python-scipy: bump to version
 1.12.0
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/scipy/scipy/commit/0ace7295322148d74932bee32b0647e29c38fc8a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/python-scipy.hash | 6 +++---
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index bee5d698a0..5b8cac8055 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,8 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
-sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+md5  22683fcf9a411f0a5254b7509bea0a6b  scipy-1.12.0.tar.gz
+sha256  4bf5abab8a36d20193c698b0f1fc282c1d083c94723902c447e5d2f1780936a3  scipy-1.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
+sha256  c29fb8e5936f33237a8b15256b4c6e93037f05bbf58c3d7b5755aede4c200173  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 6626826e33..9110a5b847 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.4
+PYTHON_SCIPY_VERSION = 1.12.0
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/30/85/cdbf2c3c460fe5aae812917866392068a88d02f07de0fe31ce738734c477
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
