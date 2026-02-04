Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F68EE9D3E3
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19236824BD;
	Wed,  4 Feb 2026 14:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ei3l0grkpdSS; Wed,  4 Feb 2026 14:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C2B82521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215030;
	bh=xj0cOIrJbnEJ/1jY1VUSbQ7iJG4jroSTU0INDgl6FUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=KPMfKyQZloTxAQqpXmTy6vtbJ5qijguyjEkV1M6phcjRkuJvUyydb/lT9QXpQjpv1
	 blzd7Q9DbXnQs2D82vjz0JRgZvG23XGmq0OBxm1NSOz9kbUjPEhVGwtouGBt2vh4Np
	 YIpEnno1PXT4HqQY8hHuF2LsfpY/J1XxWoTtiF9Bz7HF0dLkyG8iqEsXe31DuMm1V0
	 CaUw3t57dxF+EWUkV3JmeVr8M5vlSs6eHq9GYnlo2bTTci7K6ZcSW8z1h4VqUCZK5G
	 Il52Xe2Tw2s+rNNNtgWwUFE62ngh4bLRXB5lv3E2C56l+ISrCuTn/4m9LBmxdwO/e/
	 IxMxEp7s5GGAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C2B82521;
	Wed,  4 Feb 2026 14:23:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ADA6173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5776B82521
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoujRINvYFrC for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35C57824BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C57824BD
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C57824BD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770215016; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OSqzjt2aG8uPiPoIHaGEYtMFkDXkuToGP99vIWPb5FYaFeBo6f2HF9OOXEW2xTC8x3dC4Mrnxp1FOHjoKSoxFfIKmAkgb9cdYspuTyd6QuNGHHTokPGvgxKdiHRnowq8SIwyQbqoTjVIjPnJFUmj1PiF5vYqQVdKlUw6ufWfw7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770215016;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SbtlsZ5rS4cMRTfKNpzMXu0fzKWQVXFY5NUWVT50bYI=; 
 b=XMKZy3LLzVWmIYAQrXNtpa4oEUKaKGbkW8UMsSEdjlpvxmzBWYWE7wv3aIf66a5MWhiELcgc10pgCF0iD05O0zdC/6piVrXHzE26b5RNX5WG7nK3FeCPcqohhZU2Ifce63J2mjM/HJ83ec056LejC8c95N5UxZoFe1jz1l1a7Gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770215009617433.7719616982067;
 Wed, 4 Feb 2026 06:23:29 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 22:23:03 +0800
Message-Id: <20260204142309.506287-1-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Feedback-ID: rr080112273cea6054647f55c22d7a9fac000099cd328f2eb764f41b97da339ad8765c298c18cb278bed3bec:zu08011227b5ce411116663dd774eac1800000b86286f86c55c712d7bb58cdbedbd8cf27bf468a4b7d620c64:rf0801122d94fffebe819404d282f87489000098fd5e862fd97a72089da4db46623a296a0b142ecf85a7da9c79b4f074fa2b:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770215016; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=SbtlsZ5rS4cMRTfKNpzMXu0fzKWQVXFY5NUWVT50bYI=;
 b=VFZThTzqTXKFbWzb8QCtAIYMXjtOwpXwNKimiNN3jtYG01BPFBOla6XQcXGnn80T
 HdoBvXRsJcILQBftEhrqBcIJbj+zKnm1UJZGnk7Ef4JSqiEGrd1Maz0LOkagnuJZe2v
 PPWiBdhr18Q7+EYOjqsK5oPZVHoBcOjzHFt2M+So=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=VFZThTzq
Subject: [Buildroot] [v1 0/6] package/python-gymnasium: introduce new
 package and its test
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series introduces the `python-gymnasium` package, a widely adopted
library providing a standard API and a comprehensive suite of
environments for reinforcement learning research and development.
Gymnasium is the maintained successor to OpenAI Gym, developed by the
Farama Foundation. and its associated runtime test verifies fundamental
operations such as environment creation (using "CartPole-v1"), resetting,
taking a step, and proper environment closure.

To fully enable `python-gymnasium` and ensure a robust Python
environment for machine learning workflows, its critical dependencies
are also included in this series:

- python-cloudpickle: Adds support for the `cloudpickle` library, which
extends Python's standard `pickle` module to handle more complex Python
objects, including functions and lambda expressions.  This is a
fundamental serialization requirement for many advanced Python
applications, including `gymnasium`.
A basic runtime test is included to verify its serialization capabilities.

- python-farama-notifications: Introduces the `farama-notifications`
package, designed to provide a unified notification mechanism for all
libraries maintained by the Farama Foundation. This ensures consistent
user feedback for runtime events and deprecations across their ecosystem.
A runtime test verifies package import and notification storage.

All of these test was tested by support/testing/run-tests and these additions
collectively provide a foundational set of packages necessary for modern
reinforcement learning development within the Buildroot environment,
leveraging the latest Farama Foundation libraries.

Xukai Wang (6):
  package/python-cloudpickle: new package
  package/python-farama-notifications: new package
  package/python-gymnasium: new package
  support/testing: add python-cloudpickle tests
  support/testing: add python-farama-notifications tests
  support/testing: add python-gymnasium tests

 DEVELOPERS                                       | 11 +++++++++++
 package/Config.in                                |  3 +++
 package/python-cloudpickle/Config.in             |  7 +++++++
 .../python-cloudpickle/python-cloudpickle.hash   |  5 +++++
 package/python-cloudpickle/python-cloudpickle.mk | 14 ++++++++++++++
 package/python-farama-notifications/Config.in    |  7 +++++++
 .../python-farama-notifications.hash             |  5 +++++
 .../python-farama-notifications.mk               | 14 ++++++++++++++
 package/python-gymnasium/Config.in               | 11 +++++++++++
 package/python-gymnasium/python-gymnasium.hash   |  5 +++++
 package/python-gymnasium/python-gymnasium.mk     | 14 ++++++++++++++
 .../tests/package/sample_python_cloudpickle.py   |  6 ++++++
 .../sample_python_farama_notifications.py        |  6 ++++++
 .../tests/package/sample_python_gymnasium.py     |  8 ++++++++
 .../tests/package/test_python_cloudpickle.py     | 12 ++++++++++++
 .../package/test_python_farama_notifications.py  | 12 ++++++++++++
 .../tests/package/test_python_gymnasium.py       | 16 ++++++++++++++++
 17 files changed, 156 insertions(+)
 create mode 100644 package/python-cloudpickle/Config.in
 create mode 100644 package/python-cloudpickle/python-cloudpickle.hash
 create mode 100644 package/python-cloudpickle/python-cloudpickle.mk
 create mode 100644 package/python-farama-notifications/Config.in
 create mode 100644 package/python-farama-notifications/python-farama-notifications.hash
 create mode 100644 package/python-farama-notifications/python-farama-notifications.mk
 create mode 100644 package/python-gymnasium/Config.in
 create mode 100644 package/python-gymnasium/python-gymnasium.hash
 create mode 100644 package/python-gymnasium/python-gymnasium.mk
 create mode 100644 support/testing/tests/package/sample_python_cloudpickle.py
 create mode 100644 support/testing/tests/package/sample_python_farama_notifications.py
 create mode 100644 support/testing/tests/package/sample_python_gymnasium.py
 create mode 100644 support/testing/tests/package/test_python_cloudpickle.py
 create mode 100644 support/testing/tests/package/test_python_farama_notifications.py
 create mode 100644 support/testing/tests/package/test_python_gymnasium.py

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
