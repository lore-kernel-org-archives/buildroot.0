Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BFFEEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2A16072A;
	Thu, 12 Feb 2026 19:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R57OxAchdSxs; Thu, 12 Feb 2026 19:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04CC60737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923079;
	bh=xj0cOIrJbnEJ/1jY1VUSbQ7iJG4jroSTU0INDgl6FUE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ViSTzrRp8bjHobV+IWrNkF26AxE6J9t2s1V8+kPWTVmx9Aq1rLTdW/bRcjVb2smIK
	 bHMfIqcQgo4nQZTHqF+ZgPqk+kL1GT+S3jwTb7SOBq8GNMhRuyAfoguUlN68vq4UM7
	 +ACfWzfzo+nKmXQxwGw/iG/v71oad3IUbFBTvPBjyMBlc6FxIkgF3ryI2wqsDkgG5J
	 cnW8t+pvqhu11ObVEGocvCDRvtslzmbNZx2QJ2JV2+pBj7I56586ZzlzaY77jtfAWv
	 qrV+gma1R1ITWlYUvUJHKTznqRI2nE//TaB7jOa17x5XyZuXwuzStknyfIwkR+OSlH
	 SLaFK2SJdyIyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F04CC60737;
	Thu, 12 Feb 2026 19:04:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 044D3EC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E91FE60737
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDTUSH_fxTBz for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 279D56072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 279D56072A
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 279D56072A
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923058; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BscfpPy5JbtunFqXkUmjmhxgykPg3jRppEGDkqBpOmfjusuY8oEvv2njwh7CjxA61Rw57/idUlGpaEbYuLkJhSA+wMwPg3wD2JwfyYvejY5DXs+kLWGKzF2jjh/Aj6Stm3imDem7i2n4zHn86Z9NGIf0qU7PPXJZsXWF/BAgyYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923058;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SbtlsZ5rS4cMRTfKNpzMXu0fzKWQVXFY5NUWVT50bYI=; 
 b=FqZONFQxD2BC952m9ObsK3+JmvOmBgS8PlM+EUw17MR/k82AfyHXGzVeM2nGSBxpvjj9SW8kpRwjR7XxARtdDqI5wYazUo1kwL3hZ+gmu5jZO2jKEtpWdBK2zjezZR/CvytuuZfaCt3Zzzbf6+kSWnzH/kegKpUy8f96SD+eWS0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 177092304997420.75990144068578;
 Thu, 12 Feb 2026 11:04:09 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:43 +0800
Message-Id: <20260212190349.537465-1-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Feedback-ID: rr080112270716cdec85e6c3b345b19f4c0000de690ac01448142e23a8f5462fab42ed95aa65bb848f9fc05d:zu080112279083a2357f209c906eb30ff20000ccefe94ad04ade8141dadb2d92f17230cee21aaba0a7a21e1e:rf0801122d3cf17329736a84b902c66a52000097aacefc4ac5140d5465604b60b065f1e1c5d53833417a0be929df01f54cdc:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923058; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=SbtlsZ5rS4cMRTfKNpzMXu0fzKWQVXFY5NUWVT50bYI=;
 b=WoBbwklY+skkf078qozG8NQGLVPDlWOyl6K0Gpl1ForPCtHcAoowJXYSqifoaedg
 IvMsfi3/pVQJpalJrWmwNCD6gEQIQoI8b+fkd5bHMsqGuNV02ZErmxDU+lGdZef2P3a
 lKsV4iu5eU7LJhA1Qs84qc4/36kv0A83KELYk6ng=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=WoBbwklY
Subject: [Buildroot] [RESEND: v1 0/6] package/python-gymnasium: introduce
 new package and its test
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
