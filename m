Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EEACA100D
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DACF60BE7;
	Tue,  5 Sep 2023 20:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DACF60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTCNS_7Nnvxr; Tue,  5 Sep 2023 20:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88F2460BBF;
	Tue,  5 Sep 2023 20:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F2460BBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 602E41BF344
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 20:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37DB34182F
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 20:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DB34182F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mduQcOoFnfpm for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 20:46:41 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4196C41835
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 20:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4196C41835
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-794d98181f0so123137339f.2
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 13:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693946800; x=1694551600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzt2H51PPmV/5WjhJZuhTGlkYMPjCZgKNyUH6J07HAk=;
 b=CbN/3ZuV99tL9qaKyBl9WE1K+aV+0K3k8YOZZQNb7chtJrySbyfNWd8GNDyNebuJNa
 UmNuQur5ua2FiTz7KU7h4o7rO1L2ZCXaqGjxb9cShUMTiyYJMAS30MWgAZqcWSADTkB2
 O04tkYO1hJojLd/lElq7RkTx2YrKyJWmY4/nN7LALUJLmFBAMby++7hdaq1xWSQdYPLf
 xR3tvkRVSOe68W1fqjlxR0zZnRoUq0o0I7W08Qw6AFI9pJvIN+dI5azDj1hY7hi1AqPu
 j0ajWo6yFwWmG8aOFdD0n00kDxyZIfgbeLv7gyTjbF8A3kDYyBNIOhgHATBcgdUNNiJ4
 9c+Q==
X-Gm-Message-State: AOJu0YzJnxgFyoizFaxRQG/I350pTxFXolKApta9D2o8FUPNSK9WRm0P
 3kS0wOM7hG5V69aS0dvCKVa7CoMtsGk=
X-Google-Smtp-Source: AGHT+IE3Fi2+aEP9pVb0+Hi8YgrsPUJxWCiRlipUPvqJpBudx47O6S7reUyvVBEG2aToKlxlTQO+ew==
X-Received: by 2002:a6b:5c03:0:b0:792:82f8:749d with SMTP id
 z3-20020a6b5c03000000b0079282f8749dmr16807020ioh.10.1693946799520; 
 Tue, 05 Sep 2023 13:46:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 t24-20020a6b0918000000b00777b7fdbbffsm4468784ioi.8.2023.09.05.13.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 13:46:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 14:46:34 -0600
Message-Id: <20230905204634.2462368-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693946800; x=1694551600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mzt2H51PPmV/5WjhJZuhTGlkYMPjCZgKNyUH6J07HAk=;
 b=lr8ALipZXwRJPcswUBNZIflj8+Gm+vaUSgbLLZyv3Pcu+HHvPDse9+gueTv+THlYLT
 FY8N2tAc+zuHvTUH2UnWKEeQmJdcXBk4y8lRng6Tu0D0z7hOgCSZ2gnKiJleuUGQ3n0+
 bfbfn+EFJznU03EfOLjb3Jw0WW9T8SwejgwPByAOi9BQ4uaowcy5XB8tLNGLT/8hX1/E
 s4MNiJp6YSPMxPy5qfGiHe4BQCeCcZOeb3MZ5cJue59J2Q1b2nuUM07lvvswplfLK1d+
 IHRDqN182rz8sqVXI7dvFR3fMyGVmY39vKjfHSeJCrnWjGpPa9g4CuqVXysxmVaiL/G2
 HgNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lr8ALipZ
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself as developer for all
 python packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS | 71 +-----------------------------------------------------
 1 file changed, 1 insertion(+), 70 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3af43d2d27..2ff1a8a881 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1402,76 +1402,7 @@ F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
 F:	package/pipewire/
-F:	package/python-aioconsole/
-F:	package/python-aiodns/
-F:	package/python-aiohttp/
-F:	package/python-aiohttp-cors/
-F:	package/python-aiohttp-debugtoolbar/
-F:	package/python-aiohttp-jinja2/
-F:	package/python-aiohttp-mako/
-F:	package/python-aiohttp-remotes/
-F:	package/python-aiohttp-security/
-F:	package/python-aiohttp-session/
-F:	package/python-aiohttp-sse/
-F:	package/python-aiologstash/
-F:	package/python-aiomonitor/
-F:	package/python-aiojobs/
-F:	package/python-aioprocessing/
-F:	package/python-aiorwlock/
-F:	package/python-aiosignal/
-F:	package/python-aiozipkin/
-F:	package/python-argon2-cffi/
-F:	package/python-argon2-cffi-bindings/
-F:	package/python-async-generator/
-F:	package/python-async-lru/
-F:	package/python-async-timeout/
-F:	package/python-bidict/
-F:	package/python-brotli/
-F:	package/python-cbor2/
-F:	package/python-cchardet/
-F:	package/python-charset-normalizer/
-F:	package/python-cssselect2/
-F:	package/python-distlib/
-F:	package/python-editables/
-F:	package/python-flatbuffers/
-F:	package/python-fonttools/
-F:	package/python-frozenlist/
-F:	package/python-greenlet/
-F:	package/python-h11/
-F:	package/python-hatchling/
-F:	package/python-hatch-fancy-pypi-readme/
-F:	package/python-hatch-vcs/
-F:	package/python-installer/
-F:	package/python-janus/
-F:	package/python-logstash/
-F:	package/python-maturin/
-F:	package/python-multidict/
-F:	package/python-mypy-extensions/
-F:	package/python-outcome/
-F:	package/python-pathspec/
-F:	package/python-pycares/
-F:	package/python-pydyf/
-F:	package/python-pypa-build/
-F:	package/python-pyphen/
-F:	package/python-pyproject-hooks/
-F:	package/python-rpds-py/
-F:	package/python-rtoml/
-F:	package/python-selenium/
-F:	package/python-snappy/
-F:	package/python-sniffio/
-F:	package/python-sockjs/
-F:	package/python-terminaltables/
-F:	package/python-tinycss2/
-F:	package/python-tomli/
-F:	package/python-trio/
-F:	package/python-trio-websocket/
-F:	package/python-typeguard/
-F:	package/python-typing-inspect/
-F:	package/python-uhid/
-F:	package/python-weasyprint/
-F:	package/python-wsproto/
-F:	package/python-yarl/
-F:	package/python-zopfli/
+F:	package/python*
 F:	package/rtl8192eu/
 F:	package/serd/
 F:	package/sord/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
