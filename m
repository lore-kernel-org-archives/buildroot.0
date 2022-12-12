Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED996C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5691440880;
	Mon, 12 Dec 2022 09:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5691440880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLT3v3E9PGvx; Mon, 12 Dec 2022 09:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0AC40860;
	Mon, 12 Dec 2022 09:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0AC40860
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D50ED1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEFE540860
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEFE540860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcbnH38VDUC9 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 847F14077D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 847F14077D
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:51:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gh17so26508535ejb.6
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 01:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=otOYbfLGQVcPvh+ZfpmI1AP1a9EgLTaGKskpareF2q0=;
 b=KcE2ZXm/dJ0YqmwcoyFxxUI17J255GvvnJG6f8Y2hzsjyajlZLL1iT1UmNCGydexe3
 aRGXAmGxSD7fS8kNmsfIMA4D/KMk++TKJ/nWgkY3EZGDVtqcRjPY2LHW0GvkZUwwMJ0k
 rSPIKl9s0EgITYw0YObTb5lRuk+YLfJ+Lo7zpMueulNPTf8ilkJ2CqCuRFFPSY8s8vId
 /fdi5wEqeeO8pKn8ejsFWIni0j9VTYbh/vZXXFX6DFvR+bpr4h3qH+LX+URXxD1/QZMj
 jRfOqfkTUpw0cx0kmlnNTxakL0ITIOY0L3OtY1zhRSL0VtZ8e5CKLJxEL965mmTKyuIR
 8kOA==
X-Gm-Message-State: ANoB5pkTW/JEYFdu6A/fsHnW8f2v9VsqCASmWRFYevSDits5UZbV0FAW
 QnPAiMQ7CH8IN0VTK1n/ogPzk1bT8sU=
X-Google-Smtp-Source: AA0mqf5rT0WoEmyQ7GetjSKVP3J9GpckcELqP34luTUfITZpZ7i7OhtKvxg+ph5k22uQZHifZICnGw==
X-Received: by 2002:a17:907:3e14:b0:7c0:f719:838d with SMTP id
 hp20-20020a1709073e1400b007c0f719838dmr17208198ejc.36.1670838658497; 
 Mon, 12 Dec 2022 01:50:58 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170906304700b00783f32d7eaesm3062154ejd.164.2022.12.12.01.50.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:50:58 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 10:50:50 +0100
Message-Id: <20221212095050.14950-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20221212095050.14950-1-yegorslists@googlemail.com>
References: <20221212095050.14950-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=otOYbfLGQVcPvh+ZfpmI1AP1a9EgLTaGKskpareF2q0=;
 b=KnZXc8tE4OuYApZInVxERRQD/54u0NjdWM644DBmuiDV1CLNwim2zNFNVHaAai6265
 Kxk8i5Cc1TGxVpBsY7wfBuCrjvUlydxDoSx1PhzGnTeAisLXeC0z+2SAEu+U6IcZBtWv
 1+lYfjJuzf0pP0gomJKagRgXdh6STI/aK1M73+O1u6MBkTdVymIApriyLTrqT/N+YzrF
 /oEC5R4XOoj9C5nCTXE46Bh+BVU+ROury0YlS7Qv2tilQDo/k3cnG3WWqx4M7JDQbdDr
 e0AiV7J86G/Dom5CinxM+OxZgdgSce6pjyNRAzRZqHmK/XHCiWo82VhPJvTDI+9nSodB
 C2WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KnZXc8tE
Subject: [Buildroot] [PATCH 2/2] support/testing: add test for python-munch
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_munch.py      | 20 +++++++++++++++++++
 .../tests/package/test_python_munch.py        | 12 +++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_munch.py
 create mode 100644 support/testing/tests/package/test_python_munch.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f0dcc42de7..5432b19730 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3121,10 +3121,12 @@ F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
 F:	support/testing/tests/package/sample_python_dicttoxml2.py
 F:	support/testing/tests/package/sample_python_dtschema.py
+F:	support/testing/tests/package/sample_python_munch.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
 F:	support/testing/tests/package/test_python_dicttoxml2.py
 F:	support/testing/tests/package/test_python_dtschema.py
+F:	support/testing/tests/package/test_python_munch.py
 F:	utils/scanpypi
 
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
diff --git a/support/testing/tests/package/sample_python_munch.py b/support/testing/tests/package/sample_python_munch.py
new file mode 100644
index 0000000000..b45bec7b7e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_munch.py
@@ -0,0 +1,20 @@
+from munch import Munch
+
+b = Munch()
+b.hello = 'world'
+assert b.hello == 'world'
+b['hello'] += "!"
+assert b.hello == 'world!'
+b.foo = Munch(lol=True)
+assert b.foo.lol is True
+assert b.foo is b['foo']
+
+assert sorted(b.keys()) == ['foo', 'hello']
+
+b.update({'ponies': 'are pretty!'}, hello=42)
+assert b == Munch({'ponies': 'are pretty!', 'foo': Munch({'lol': True}), 'hello': 42})
+
+assert sorted([(k, b[k]) for k in b]) == [('foo', Munch({'lol': True})), ('hello', 42), ('ponies', 'are pretty!')]
+
+format_munch = Munch(knights='lolcats', ni='can haz')
+assert "The {knights} who say {ni}!".format(**format_munch) == 'The lolcats who say can haz!'
diff --git a/support/testing/tests/package/test_python_munch.py b/support/testing/tests/package/test_python_munch.py
new file mode 100644
index 0000000000..6853bbaac7
--- /dev/null
+++ b/support/testing/tests/package/test_python_munch.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Munch(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MUNCH=y
+        """
+    sample_scripts = ["tests/package/sample_python_munch.py"]
+    timeout = 40
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
