Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B2ACD4F54
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 20:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F59760BDE;
	Tue, 19 May 2026 20:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEhqwFnmbodv; Tue, 19 May 2026 20:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F2260BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779223206;
	bh=Tth4VrrMn9cAplo7iNS1cq/leBzQ+ZA4pPOdwEIhXXw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PgunlEX0xaP3gOqdHpaLH4I9+3EpFJo7huy+D0T62JnutT9vYg94dELKF4bjP0Faj
	 v2KkMc7T4cMYw1tMGiu9ntIJ1inMkzQZUGq6sfrPLM1qqypiWXWbOETQi3qZH5foTj
	 0QPi1U46id1gkuKblshUeCRH0jxaaAr/9p/IjCGTYEJJhi7eu3PAprPZSLlUC8/qPA
	 3tT3fGcM6cN2pIHRgBIQSNzMwma6ki8Tny4FTe74E1cP2F5iBQHEirkK7CrF5E65Fq
	 WVSs+xIGcjPjEVWEmPhIDWjQvspu3503hf5IawZrLgkZtuUzXGFjG/l2bnqAesOrKm
	 RH+Rw39SL8q8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F2260BDC;
	Tue, 19 May 2026 20:40:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EC6F265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FEEE40E4C
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtA-zR9hgA4l for <buildroot@buildroot.org>;
 Tue, 19 May 2026 20:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71DD540E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DD540E42
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71DD540E42
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:40:03 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-479eb8bcacbso2728807b6e.1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 13:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779223202; x=1779828002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+j1ukogB7IVcOg1AogoEIWMaagSomiufXj1L2C4KcZU=;
 b=e4egr8h3r9YGnh8HzoCYuP5lAa6UsihGy9KfP6QgUskcWGmdRaHwb0ivXWuUDIUnUk
 BZ6VVVjT1gjyA4Qoyxke81uzqI7aGtybtJoKZcAEYj/5xLuAwpQFngKFv5d7GO2YhKlD
 npka+GAhkGmf/6N9U9NGMiPw7B5XNSVP8WWgOEv3qrbuAMfcK14mJgdqUWRy9TXtAen4
 dTQDKF5prP1Gjuvu9eDbSwRlpGy4aeh1xue9c3pPQjGUKYxHYADeYbduCDiC3j4cY/N+
 T5esjq7VqXLp452DFIIfXz7SUmTdHp1opjJk1YEs+JnbTwSnyORHUVIbguLtRoaNb/Jc
 QhWw==
X-Gm-Message-State: AOJu0YySsgpH5Clw+FojwItLOcFamAiXZUg5ucbvteHQEAflcF8uqXe4
 0t0pPz6YIyHtYRvFQlmizbhjDm1mtqqxj88AGjX2ZaeC/cfpFDhS04h3Dw9dow/o
X-Gm-Gg: Acq92OHagUu8Ip7aUdJt7Uq97IPmyriDHo12H7tB6ROI8UR49kh5WrZX6dBEbRIEMKd
 T8o6OlyjUQDYxz6kT5TvVNIaBshByclViIO58Fc3rIIqTfgV9k6bSB9GcT+N24hhcjddKMybcez
 aZEUtnJBGR1PEKyjD4pgkOf/XseXj6+ZX9ct0aWiPmYKg7bdGQo1pgJ0wsBCpjuTqm2shWH9BCu
 jv4MqMW7VnLCpLNkHocV9+0buMXMhIjV2edRPowjT62Qx7QGWBpSwkp2epluGQDcdC1gz/rHS/s
 aJFGLj0/7gtaQakjlAorL8Se0xl6q9Bwbh3oyTrDLqjvLwSB4tkR9tkNik/AvrKi+XZ685fRXLK
 26h5WtqESycyVGidZsPtJCVaagK5fT8diDmP3QFowXAz2KWm4b7YOek0DStgi/+yev2pqGP0EyT
 PPvA5AbrfXWRXLCdOEhPDqn03Uik62pN3fnIrlJAy6OcJYZ2aPM6VJzGv32qMWTZJpOK/djAg6n
 bPgQ9U4Zk4oOulI4MO9pKfumJcO9ZXOpfVIwtpfND9PE6tiqzv2JAirhomuFwf/Ftiv8A==
X-Received: by 2002:a05:6808:c1b8:b0:467:133f:ec2d with SMTP id
 5614622812f47-482e59527b2mr13656469b6e.42.1779223202145; 
 Tue, 19 May 2026 13:40:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-146-19.hlrn.qwest.net.
 [184.96.146.19]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e55b819156sm10943818a34.7.2026.05.19.13.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 13:40:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 May 2026 14:39:41 -0600
Message-ID: <20260519203941.739485-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779223202; x=1779828002; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+j1ukogB7IVcOg1AogoEIWMaagSomiufXj1L2C4KcZU=;
 b=gcNf+TpKq3psTTNZf6c6XXiEV9l70RzoUf/hYXWwPqh+NaX/SaOWtqJRBCCj8AIXdO
 m54ILK7VYfYXKRAB8hOx1UXlIQK0CGBpxRTI/5cJU+1bg9SOC8yvL9SsAOQg6G1pTZn9
 ZC+qN3s8MRGnonYyg6T2P01X7eQOgq1qoki+IHd6ZAd/GcpEiHaP6FQIlssc3MDMOjjL
 4NxLGvI6JKgex17kSx9eN0z6zG+2zUtTDZuhJgF2/+qGcstZsZsKRnGiRTXGLV4zlLoa
 K2ekrPDMP/iIFpAfFR0vFyTl0gJaOs6Co0vWyUlOvdDd+6XcoVpMUD8jORP6RueVrKnx
 53Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gcNf+TpK
Subject: [Buildroot] [PATCH 1/1] scripts/autobuild-run: make multiprocessing
 target picklable
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

Python 3.14 changed the default POSIX multiprocessing start method
from fork to forkserver. With forkserver, the Process target and its
arguments must be picklable.

autobuild-run passes builder.run_instance as the process target after
Builder.__init__() has opened self.log. This makes multiprocessing
serialize the Builder instance, including the TextIOWrapper log file,
and fails before the worker starts.

Use a module-level helper as the process target and pass only Builder
constructor arguments to it. The child constructs Builder itself, so the
log file is opened after process startup and is not serialized.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c375f7b..54b52b8 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -730,6 +730,12 @@ class Builder:
             except URLError:
                 sleep(30)
 
+
+def run_builder_instance(**kwargs):
+    builder = Builder(**kwargs)
+    builder.run_instance()
+
+
 class Formatter(argparse.ArgumentDefaultsHelpFormatter, argparse.RawDescriptionHelpFormatter):
     pass
 
@@ -866,7 +872,7 @@ def main():
     buildpid = multiprocessing.Array('i', int(args.ninstances))
     processes = []
     for i in range(0, int(args.ninstances)):
-        builder = Builder(
+        builder_kwargs = dict(
             instance = i,
             njobs = args.njobs,
             sysinfo = sysinfo,
@@ -882,7 +888,8 @@ def main():
             buildpid = buildpid,
             debug = args.debug,
             hung_build_timeout = args.hung_build_timeout)
-        p = multiprocessing.Process(target=builder.run_instance)
+        p = multiprocessing.Process(target=run_builder_instance,
+                                    kwargs=builder_kwargs)
         p.start()
         processes.append(p)
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
