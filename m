Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C63BE87835
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F235C822C6;
	Tue,  3 Feb 2026 14:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fU2_0uhI0sHE; Tue,  3 Feb 2026 14:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22D1822DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770127974;
	bh=06UPeDo4LV2/EYrE//X94h2xG230Fbc6d1meMPCT+9k=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALA7cbeh/cxyic5vDVoDULvc1dJUdhYx1xp9yYEB/x6iUCpCr6lDBgqrZG7osSdDb
	 z1AQCy1Lmr8x4HEAoub1GXClLc3LXOe8jXohAeCd4PaIdZC2UFA2WM8dOqIdghygvM
	 kWLTS/Y/YYY2exm4uDNLIabyJlhtnBWp19HWIVFOBNjjPzDzDTDmcM9YQwdq8dNwdS
	 /lvxrgP2W41BjaB6p+XFnBDJPIEXZnrdoUf6sHeJjnK1/FFTQnzla3H1rQjLhi+vyl
	 UyLt72zETfhs44ESerChVkBf4s2paUlSYkslfk5BbGrWbPLvxFfO/gyCgJdwyt1L/z
	 Tjcy97M85z5lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F22D1822DC;
	Tue,  3 Feb 2026 14:12:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D982913D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1E4360874
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kywqt_y2r-Og for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 097F460852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097F460852
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 097F460852
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:12:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1100851891; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 14:12:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnH94-00000009DUR-2soT;
 Tue, 03 Feb 2026 15:12:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260202150143.3996204-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Mon, 2 Feb 2026 16:01:41 +0100")
References: <20260202150143.3996204-1-buildroot@bubu1.eu>
Date: Tue, 03 Feb 2026 15:12:46 +0100
Message-ID: <87qzr1zzj5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fXW79BoKJ15Lw/EGfvW/CmF5CJjNkQ9eilAjLhRvL9/JD0dlCkVlEBdxUYvGp9M0i0J9JZtppkpMnJ/ilh8QZTAdHnHmZ15I/kEn8Er7NjdjOKkWt4ugb3jff04z/72C7uYou9IhBdt6aSL336450oY/mrp6twbd96Zjtr2v/QNvVK7fcQ5zQfw0HKXsNz0525b8jNoJ6gSpljbeijPP4cjycFFwVpjHEGRK5N8Lkjx5wD73oRLvkan/qRTMl34RSgOvy6DPWEvrAc1hXn2vPA/RfablAqw4Nqao2qa0h7/tlx8EDYFbzqgRN8TB+ScblwqRU0fnyC2p+OtEFLRg6g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Rll4QIInfbeim0P2hFr1F1kSkiTW9fTytyCCy3ZzM8c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=fXW79BoK
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: python-requests: new
 runtime test
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Use an armv7 kernel because that comes with networking support.
 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 > ---
 >  DEVELOPERS                                    |  2 ++
 >  .../tests/package/sample_python_requests.py   |  4 ++++
 >  .../tests/package/test_python_requests.py     | 21 +++++++++++++++++++
 >  3 files changed, 27 insertions(+)
 >  create mode 100644 support/testing/tests/package/sample_python_requests.py
 >  create mode 100644 support/testing/tests/package/test_python_requests.py

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index aff26f8012..6dc83d3a38 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -2284,6 +2284,7 @@ F:	support/testing/tests/package/test_python_django.py
 >  F:	support/testing/tests/package/test_python_fastapi.py
 >  F:	support/testing/tests/package/test_python_pydantic.py
 >  F:	support/testing/tests/package/test_python_pydantic_settings.py
 > +F:	support/testing/tests/package/test_python_requests.py
 >  F:	support/testing/tests/package/test_python_ruamel_yaml.py
 >  F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 >  F:	support/testing/tests/package/test_python_tzlocal.py
 > @@ -2297,6 +2298,7 @@ F:	support/testing/tests/package/sample_python_django.py
 >  F:	support/testing/tests/package/sample_python_fastapi.py
 >  F:	support/testing/tests/package/sample_python_pydantic.py
 >  F:	support/testing/tests/package/sample_python_pydantic_settings.py
 > +F:	support/testing/tests/package/sample_python_requests.py
 >  F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 >  F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
 
 > diff --git a/support/testing/tests/package/sample_python_requests.py b/support/testing/tests/package/sample_python_requests.py
 > new file mode 100644
 > index 0000000000..e8d2b64076
 > --- /dev/null
 > +++ b/support/testing/tests/package/sample_python_requests.py
 > @@ -0,0 +1,4 @@
 > +import requests
 > +
 > +r = requests.get("https://buildroot.org")

It is not so nice to rely on internet connectivity, so I changed it to
run python3 -m http.server instead.

> +assert r.status_code == 200
 > diff --git a/support/testing/tests/package/test_python_requests.py b/support/testing/tests/package/test_python_requests.py
 > new file mode 100644
 > index 0000000000..48f910139b
 > --- /dev/null
 > +++ b/support/testing/tests/package/test_python_requests.py
 > @@ -0,0 +1,21 @@
 > +import os
 > +from tests.package.test_python import TestPythonPackageBase
 > +
 > +
 > +class TestPythonPy3Requests(TestPythonPackageBase):
 > +    __test__ = True
 > +    config = TestPythonPackageBase.config + \
 > +        """
 > +        BR2_SYSTEM_DHCP="eth0"
 > +        BR2_PACKAGE_PYTHON3=y
 > +        BR2_PACKAGE_PYTHON_REQUESTS=y
 > +        """
 > +    sample_scripts = ["tests/package/sample_python_requests.py"]
 > +    timeout=15

flake8 wants spaces around '=', so I fixed that.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
