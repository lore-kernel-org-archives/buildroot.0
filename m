Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D048C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 06:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B687881446;
	Mon,  5 Dec 2022 06:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B687881446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9vp9HdtzQ-I; Mon,  5 Dec 2022 06:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E827D8142E;
	Mon,  5 Dec 2022 06:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E827D8142E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8661BF417
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 06:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DEEA60B9B
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 06:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DEEA60B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWRbHJRocTOL for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 06:04:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D56D60888
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D56D60888
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 06:04:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qk9so7470477ejc.3
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 22:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDHoeZ6ejMZyFGTPhKQvYJkPEW0okseUFs/sl6dV46M=;
 b=V8fXjxgQgrJiP+34rtlZWvPVrVPsVtGGua7MQVlpp3JrIfV/18+Haw5Kdsg3VtGJhD
 qnWZ1aBIIbsaHTeAxGNpkQmGF6d1i8GDT1hLABKBqJvSm18vLcsPauKr6gj7m3OJtLDR
 P+7Rgp6ayY+ks6zWMB77pTg1zNBoPabrxJThY2F99nuY4KM2mW8avVYzkxgKV1reLhq5
 UkgUXB6jZTPBNQLPHkUayjqIiOYdyFfz+xl0PDZsp0IYOxX+eUojPlduBY0VusRKqlT3
 g3tE0Icxkr+lmTaSE2KzzlD8vItreAApP+bG1TsMgtdgf8CJJMNaLJi5loy7XBzO9tDN
 a94A==
X-Gm-Message-State: ANoB5pkFNlBszYQoreW3HvnG6lp+l8vqVBGBVhH8Wifnhb7RxneWV8Pu
 DadWYzaahOi5yql8jnrKCDUfDMc0m38=
X-Google-Smtp-Source: AA0mqf7LXCjOhDxuHM4u5OKD3K2m8n4a+Z4HfuC7nUB65FouL1ZdFwmie4RjojCNK0X1OWRi48qdgQ==
X-Received: by 2002:a17:906:4804:b0:7a8:3ecb:bd62 with SMTP id
 w4-20020a170906480400b007a83ecbbd62mr69104813ejq.721.1670220266212; 
 Sun, 04 Dec 2022 22:04:26 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170906198200b007bd1ef2cccasm5902384ejd.48.2022.12.04.22.04.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Dec 2022 22:04:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  5 Dec 2022 07:04:14 +0100
Message-Id: <20221205060414.2046-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDHoeZ6ejMZyFGTPhKQvYJkPEW0okseUFs/sl6dV46M=;
 b=Z5oY98y+GDt+8sPwSRiqckXaGSVtfbUDqeZBiBK1nXUB8UZjouciJYT8Ax2jIpbfaa
 BHMbpXi7l49Yfiafg4X0HFt/jvyyG1Q5QFQzS6xrGLmIhcX+UPrxcuSWn4KU57pTMuuG
 NmOrdlJnI4qSFjQZNFZQZ1LW8sxiy15B05eAvLPqEG4Xa7TqOTJyxVtn1uRNpBbh3hSQ
 PosD10CWvxOKPekS0OgOyRARlFWoLyr2LwpDGRGwQrRxfqw85EB13emjo7i+MP5TDKDN
 fb20M8/YpwW9xPA4PYy4Cu0IpbCZPsTb0fpWfFb2ZLbkokq74waglURQpwkkphPfxozy
 YnBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z5oY98y+
Subject: [Buildroot] [PATCH] support/testing: add test for python-dicttoxml2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                                           |  2 ++
 .../tests/package/sample_python_dicttoxml2.py        | 11 +++++++++++
 .../testing/tests/package/test_python_dicttoxml2.py  | 12 ++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_dicttoxml2.py
 create mode 100644 support/testing/tests/package/test_python_dicttoxml2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index ab9cfe5ee9..3e3be6d094 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3160,9 +3160,11 @@ F:	package/wpa_supplicant/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
+F:	support/testing/tests/package/sample_python_dicttoxml2.py
 F:	support/testing/tests/package/sample_python_dtschema.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
+F:	support/testing/tests/package/test_python_dicttoxml2.py
 F:	support/testing/tests/package/test_python_dtschema.py
 F:	utils/scanpypi
 
diff --git a/support/testing/tests/package/sample_python_dicttoxml2.py b/support/testing/tests/package/sample_python_dicttoxml2.py
new file mode 100644
index 0000000000..788c5e2cd7
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dicttoxml2.py
@@ -0,0 +1,11 @@
+from dicttoxml2 import dicttoxml
+
+payload: dict = {'mylist': ['foo', 'bar', 'baz'], 'mydict': {'foo': 'bar', 'baz': 1}, 'ok': True}
+
+expected: bytes = b'<?xml version="1.0" encoding="UTF-8" ?><root><mylist type="list"><item type="str">' \
+                  b'<![CDATA[foo]]></item><item type="str"><![CDATA[bar]]></item><item type="str"><![CDATA[baz]]>' \
+                  b'</item></mylist><mydict type="dict"><foo type="str"><![CDATA[bar]]></foo><baz type="int">' \
+                  b'<![CDATA[1]]></baz></mydict><ok type="bool"><![CDATA[True]]>' \
+                  b'</ok></root>'
+
+assert dicttoxml(payload, cdata=True) == expected
diff --git a/support/testing/tests/package/test_python_dicttoxml2.py b/support/testing/tests/package/test_python_dicttoxml2.py
new file mode 100644
index 0000000000..437518db7f
--- /dev/null
+++ b/support/testing/tests/package/test_python_dicttoxml2.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Dicttoxml2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DICTTOXML2=y
+        """
+    sample_scripts = ["tests/package/sample_python_dicttoxml2.py"]
+    timeout = 40
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
