Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA94CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4123760DB5;
	Sat,  3 Oct 2026 08:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w13BYd_fy7UW; Sat,  3 Oct 2026 08:45:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4E19260DB2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017116;
	b=riHd5L0VOrXgRKnpBozoNwKoAT41rtgeg/OpZxqXQ0mvTKIiFB0wJDP6+RfpHMkYdN2F
	 Wf/scZqM9IgolJ27tgyF/CyUDKW2JIylSRHUvWN2iEcBEZC2w36VyMDTAMOxmviF92vfd
	 TCbz0Yn06eIH7UwTtUdleias18u51ubziPGjS0rLR4GIRiysXqFA95FQvhJwYPUPUg2Tm
	 FBUErsAsvph1/5U2aVcWygQuzLnWpR4HttuFINsDi7Q23rYjyZXz/UxPSiheSIme63rCM
	 FR4yjo2qNNb87z6jURRdIEEFB1ty3JieUqKwRPwtTr0jp4N88C1DyuXC4jZ4QYNmD+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dRI8ew4avdbJ92htVj0c7Ags2r1+V7fKuy4beKRHtgM=;
	b=KAhlVXJ8fMau+KJkdOAMbYfqN4X56KhK4jLDagbtBaizT4UttY1IDzPR+OFvGMM06Rmj
	 WFasxX7FfJ0NNvAmZ/s4nByX0O2FRKgwoUIf+7fFmrz5nVKtJUHqEjFQ2F8Lr1C10Gm36
	 5x5/wVsg8ukLUE2RKhAV4YCJTA1cv/nJfbsdK/j8FKgSOazjFhtCkIA4ZoczzgPsQJ3N6
	 C2YcR2y6EW03ECL7vfS6iNQP0e04AbbfXJM5x+FcLVlIVcyh4E+DjL9xCQVOMTdTwg3jS
	 0bB4x/+cVJv5mYnCN33aPHOoJN/Etp7kj2MJvYAaUEnsoRQoZ9ylXQuMNvEiRw0m3SA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G0fLLoox;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017116;
	bh=dRI8ew4avdbJ92htVj0c7Ags2r1+V7fKuy4beKRHtgM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=s+7vHFHcmLcNKfSwofvBYIZvSIeJk3f82a6vh9dKvkRLv+EtajBXmhK6qW6dKlhhb
	 QNmjsk13cn+rU7yNC2tYCp6pVA2lP9yHoOi0P4uE8SM6CFUvC1wTmslEe+b9K/j4Po
	 3JD9adW7CT+pa7ejqftF2BuMQGCJVa1s4LJMKkjlm6vbL+9rxKuTwvblRd1URk/+5+
	 eaaZfZfBXbiPzoouOu/z9LwK9MIpelzuNo0rxQMH6z/jxpipkZTIHRYlWJKo7+j/F+
	 4GXyLl8Ybl52N7Mb6hD9u8ZhdsO2vJdVTqka7pnecak0zMrS2UjpfQf5HfFroxn8Tg
	 lzIgeeOzEW/1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E19260DB2;
	Sat,  3 Oct 2026 08:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D932E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDE3E60DB2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGzEBKC9-fBc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CE36D60640
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017114;
 b=NsEXabCNb8BVUnjOz/hgnFXA0wjz5u0dG1VMtMp8Fygmt2sl4PsKwZhEM8MjLObTzFPJ
 TmebG6ydr7YKoSzIA4a5bgtbyV2GH5M5+zMejsipUP+sjJpdKLzp3Q7zx2Vf7hb3760Op
 8yjtmiYW/d8A6V9euKMd2Ja6Wtu7m/BZj1rbZLg+szn+DXvlTwF/15KFtp9fKXM/Vu3Ij
 QtwV3VqW4xvgjX6vJitzY98jQVmNVPonUWIAxv/5RXEjUyOFBwcm5Bb6CyCeznPTdxdCa
 2W9W7IzpCQFp/plGcw1FbfHEKqoX/Ef2i1ygFLPYtJwEkNTwfn3G0hloV28U2InQfyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017114;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ztzyEnsxKfT2I5QjtzRzBNkgKUQ0jkoGImV5cYFlA+E=;
 b=ezy+rzKEoMNXExrYrsiCvKNI8akbuBfnNYSbaWIIrK4aJrY15tPhRX47iiMytxbOtopx
 ErgP/GeVrKXytZ0bxRXvE235RwV4/hlBznAvSYv2isKNAbszGiMxYM5zM3nVNMeJ2UZhs
 +EUk9VirQkFtOKBpObYeb/U8+40QDxwSvZywoUdty0aeXkpKASOMZBIIryKTdefnqKgzt
 TKTh3C5lvQWn2wGL1vd4Oc77bWDXhgv4+NmTPs0G8hTPz2CJx/dGfWWef2YRMBTFcSd25
 YOmvI3WHadbGVyT33+Db4pBtQanK82MitVXbiHIWK7RDGI2d5h1uZE3VrOFABSl+jng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=G0fLLoox; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=G0fLLoox
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE36D60640
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:12 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8167e0d1f90so513222a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017111; x=1791621911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ztzyEnsxKfT2I5QjtzRzBNkgKUQ0jkoGImV5cYFlA+E=;
 b=G0fLLooxLN+dst14Qnpb5UInt1PY3k62ge2afBlT1koEPZmdYgAPmPKDmZCVHHsGdG
 E1HM2NXCveQHzbmn9ffrb40zCb6i3iL/6Mdr30iMTcU6ToWPRKRufjQLmO5u1qhDyvuZ
 NYoXPCnyH8jgq2zAeuN/V2EHzhF6laxopyprd1r/5eIMzFp2OMGqoVykgnv63dNP+C1g
 V76Yi4HVTAhTeNW0+PNO27Pk9lyVF06X9epO9IouKlAg6z4VaCIFJeEiBBnvVJNM1AD/
 6D1WinHuRDJJJPLntFYjle6cZt3g+TIFo+qxIJ2F8izc3kfPLKqe9yovCgzDBcseEuXq
 D8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017111; x=1791621911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ztzyEnsxKfT2I5QjtzRzBNkgKUQ0jkoGImV5cYFlA+E=;
 b=GHwmE6akhV1W7dF1VIG7tmtmvi/qSgbwET365B+kCCtoLeKUSQii8spwayV5fyQ0Dj
 dAZg5bfZo3XKxVM9QMYehSKZWHG7w0VzypLskrWHTTMffcRsGT2tDdrI3UWgfcVb18Nd
 tqwvposIKlruaKZ0HbhG1qQl0kIcIkBUqtxmyaEdCUB0N/Y+psA0/kILDY4sxGJJyYIZ
 xW008g8x0o8PPGxZqjho+ewZ9T52LA/KbV/+3/RzuaaFoZ0AtvBpciIAyM8DKpDCs8Ga
 jtJh2Aaj6/+0G32FQ+Z3FNVE8N32vHYIcV14RmDJohO3WSD6YTb0DGujiVw4RdRKv1hg
 mWgw==
X-Gm-Message-State: AFuF++nnyVsbIH+ahEYMaZFkCKJY736aUmQuOO3jnRjdWMUV5DGEBBFD
 Tm8pg42bsnjxPqSaOAscKwPaOqAPqTRw9/6FgrL7KR6X8towPSaxH3voXvc89Q==
X-Gm-Gg: AYBFou3rNnMXjBy+zFiSit2xDfLMbyafNkm6DFRuBEnzB6+AbJySSuXmN2Aq/b+RPEd
 y/jCUWrASgRO+ndM+gntIqUXiyHBOfKiZTDlDEirtlKZMDJTkuM/Pph1NHgCZApQTdLWMl3Sh+m
 4hKOfUjdZWeTlo6L/fJPyRQErgvqoIXguUjhZTL6RpjdzwpeUTXwfUlovK706PTsvpFfqp+a4+W
 RAyYeEwmmvuw3p3OaeofCSRyCnznrKom8uSzxwkRubNXMnLlx1zP1sGjTiaeUWHKJsBaYNcEKZY
 rwDtg1piVVwMyLimirZoXEwg/0ooHXIRMwMKRctkX5sCZuxXKq1KtnIFfz9rnu9UKGm4M9oo25Y
 fq6BBCoIYgvkKZ8HBBBXrmyqVXJVwXyaRN/k6wDpPvurikYru34/obZR5WW37zcaUoPZfPWf7A9
 oN3FhYQ4qvyf5voPr0E7xyTeySdb3DkqfdvQiN3HlCdLSFnaik/2Aa4pUTmstek29ASkIHBkKhH
 Q2f0BSD4TTyAniHF9Ca/t2UnvdvbNf8aYuEfgFisbcDfdD1B8UQPj/rjSSny0YEh6ZrlWudsVVW
 JJMa2BkX8zn9yJu+Ygr5H43Ux3SFnSzPLwosIGRVNIzZyf7CkCBhIeLQKtqyDFKKrF5SMRff9/z
 kRkN8xcCTU4OMkd5FmM65wo/JOiGIcPgfQoTlZKOVG+FCCLyef5kE
X-Received: by 2002:a05:6830:1304:b0:822:b69c:ff69 with SMTP id
 46e09a7af769-822b69d18aamr3160575a34.21.1791017111506; 
 Sat, 03 Oct 2026 01:45:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:54 -0600
Message-ID: <20261003084453.545653-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-git: bump to version 3.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index cda8ae49e1..f86121683b 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  e011828008698572f60dbc3a798e594d  gitpython-3.1.46.tar.gz
-sha256  400124c7d0ef4ea03f7310ac2fbf7151e09ff97f2a3288d64a440c584a29c37f  gitpython-3.1.46.tar.gz
+md5  1d057defef1a684993a1b664062c3f64  gitpython-3.2.0.tar.gz
+sha256  fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e  gitpython-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 49cd04f66c..8dd87cfd65 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.46
+PYTHON_GIT_VERSION = 3.2.0
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/df/b5/59d16470a1f0dfe8c793f9ef56fd3826093fc52b3bd96d6b9d6c26c7e27b
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/6e/2d/6f6e649818da44d4499604802c89329b8d9799687a124e3a5e467a643336
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
