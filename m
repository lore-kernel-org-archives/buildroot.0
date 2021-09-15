Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5F9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:48:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D3B610A4
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01D3B610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCBBA401D6;
	Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUzgHt2X6M3i; Wed, 15 Sep 2021 19:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB14401C1;
	Wed, 15 Sep 2021 19:48:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D67291BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C61F582AB6
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXtxf_xsXFls for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:48:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E259C82AA9
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:48:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x6so5621740wrv.13
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1q9Qe068MzFg75nTPQEo8SK3LtY1P1LOqhE/C79WO4=;
 b=pQCos2ONCU45U6NdAtMO0NURW2JZCKFQErZfVOG305H7xJF8/DRVS/Agdy06xc1EeE
 x7rEDVzljohomGJC2CmBRCkisoGfN2ICJEWPBFhzjCRrq/APu30qWQTR6Z2T9m2TDzMM
 ZsFV28YeRqb+aKTfVyDgu6rFr+3BmEcUBx+ZIlTBaGDyeNFUeuNMkZ/jWIvOR2VDcQ5c
 040ttWh0Z5pFqEJP9UnLMmgmehgFtnloWHb9ic0y4zaJA6ira/LWjiLHbHV4jIgzP9JT
 C0AJMRiMSaSHiR+nVedFMDGZ+09LKsWwKI2t2Gj9f2PwiIqXYz92rsGnBOsU7h9F+X6h
 b1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1q9Qe068MzFg75nTPQEo8SK3LtY1P1LOqhE/C79WO4=;
 b=4+CYC9f0Wi6dJEn880EcN5xHhb9PZWs48hCTi1yEhh+dfxud34ehfSTTJRocT/1X5c
 oKRdoNwKGckdyu6YiKrh2bstkQh4dRkVVa+hQILUMgtfghOS9QCmEwck4W//lgbJezC9
 s8G0I5dsJGRFUbtKr9AvOIFUt/rXvb2t21PHbBWWxVarjI88eLwGRW2XmTTl0JlhdObc
 BfZEMRdQVK/jTTQuQtXUT4Aro1PSksgA1xvuxqaYKIALdVZTB8WWJuZW7Yyjr1TarpTY
 EQnITILuMjmd1iSPsxfDwn0E809XIUJ0vmFCq1iLyQG0KmelPhE49UCb1cBxkPJvSiTk
 FGOw==
X-Gm-Message-State: AOAM531AnbBb1xMJBbgWsHiF6xP+mmfOAff6n4PTSNdXadsmzMbfIl3G
 /dzM1p1Apb6LG2yigfle8s98zju86qw=
X-Google-Smtp-Source: ABdhPJzYHzzRU5jSLEIjj6Gni3ZPOERDfY5NTzEHpcwDFMcYlwkIKphu2Qxv/enqlXxML6+SjePw2w==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr1894705wrv.406.1631735325009; 
 Wed, 15 Sep 2021 12:48:45 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l26sm5099699wmi.25.2021.09.15.12.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:48:44 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:48:35 +0200
Message-Id: <20210915194839.22122-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/4] use python3 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: David Laight <David.Laight@ACULAB.COM>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi,

changes v1->v2:
* 3 more commits
* remove also python2 compatibility imports

Kind regards,
Petr

Petr Vorel (4):
  support: utils: use python3
  utils/scanpypi: remove python2 compatibility imports
  utils/getdeveloperlib.py: use python3 explicitly
  testing/tests/package: use python3 explicitly

 support/scripts/cve.py                                        | 2 +-
 support/scripts/graph-build-time                              | 2 +-
 support/scripts/graph-depends                                 | 2 +-
 support/scripts/pycompile.py                                  | 4 +---
 support/scripts/size-stats                                    | 2 +-
 support/testing/tests/package/sample_gst1_python.py           | 2 +-
 support/testing/tests/package/sample_python_gobject.py        | 2 +-
 support/testing/tests/package/test_crudini.py                 | 2 ++
 support/testing/tests/package/test_gst1_python.py             | 2 ++
 support/testing/tests/package/test_ipython.py                 | 2 ++
 support/testing/tests/package/test_libftdi1.py                | 2 ++
 support/testing/tests/package/test_python.py                  | 2 ++
 support/testing/tests/package/test_python_argh.py             | 2 ++
 support/testing/tests/package/test_python_attrs.py            | 2 ++
 support/testing/tests/package/test_python_augeas.py           | 2 ++
 support/testing/tests/package/test_python_autobahn.py         | 2 ++
 support/testing/tests/package/test_python_automat.py          | 2 ++
 support/testing/tests/package/test_python_avro.py             | 2 ++
 support/testing/tests/package/test_python_bitstring.py        | 2 ++
 support/testing/tests/package/test_python_can.py              | 2 ++
 support/testing/tests/package/test_python_cbor.py             | 2 ++
 support/testing/tests/package/test_python_click.py            | 2 ++
 support/testing/tests/package/test_python_colorzero.py        | 2 ++
 support/testing/tests/package/test_python_constantly.py       | 2 ++
 support/testing/tests/package/test_python_crossbar.py         | 2 ++
 support/testing/tests/package/test_python_cryptography.py     | 2 ++
 support/testing/tests/package/test_python_dbus_next.py        | 2 ++
 support/testing/tests/package/test_python_django.py           | 2 ++
 support/testing/tests/package/test_python_gitdb2.py           | 2 ++
 support/testing/tests/package/test_python_gobject.py          | 2 ++
 support/testing/tests/package/test_python_gpiozero.py         | 2 ++
 support/testing/tests/package/test_python_incremental.py      | 2 ++
 support/testing/tests/package/test_python_passlib.py          | 2 ++
 support/testing/tests/package/test_python_pexpect.py          | 2 ++
 support/testing/tests/package/test_python_pynacl.py           | 2 ++
 support/testing/tests/package/test_python_pytest.py           | 2 ++
 support/testing/tests/package/test_python_pytest_asyncio.py   | 2 ++
 support/testing/tests/package/test_python_pyyaml.py           | 2 ++
 support/testing/tests/package/test_python_rpi_gpio.py         | 2 ++
 support/testing/tests/package/test_python_rsa.py              | 2 ++
 support/testing/tests/package/test_python_service_identity.py | 2 ++
 support/testing/tests/package/test_python_smmap2.py           | 2 ++
 support/testing/tests/package/test_python_subprocess32.py     | 2 ++
 support/testing/tests/package/test_python_treq.py             | 2 ++
 support/testing/tests/package/test_python_twisted.py          | 2 ++
 support/testing/tests/package/test_python_txaio.py            | 2 ++
 support/testing/tests/package/test_python_txtorcon.py         | 2 ++
 support/testing/tests/package/test_python_ubjson.py           | 2 ++
 utils/check-package                                           | 3 +--
 utils/genrandconfig                                           | 4 +---
 utils/get-developers                                          | 2 +-
 utils/getdeveloperlib.py                                      | 3 ++-
 utils/scanpypi                                                | 2 --
 utils/size-stats-compare                                      | 2 +-
 54 files changed, 95 insertions(+), 19 deletions(-)

-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
