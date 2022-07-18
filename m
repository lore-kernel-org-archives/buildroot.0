Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2687FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 04:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 957CF41620;
	Mon, 18 Jul 2022 04:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957CF41620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9_LMTPcPgFI; Mon, 18 Jul 2022 04:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B8E541615;
	Mon, 18 Jul 2022 04:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8E541615
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E72911BF3A3
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 04:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFD274025F
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 04:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFD274025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_YyA7DFee62 for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 04:39:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3AD640150
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3AD640150
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 04:39:37 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q14so8393967iod.3
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TasUmXm97Li0XwJ8vQ3ThI7Wx8nVgeLLTKthfdifILc=;
 b=2uShMr18BAveKNKPfG4IFjnSiFZi/7o4EI8EHhsSzEZL+J2sPsxfoQ8Sgem1L+Bdmu
 FtCafanPxnmB3CWCWYoXQIzSyLD1NzI1E/sQvMPpGoVdNhfL7aYLPrbdcOc0tlPCS3Aj
 5tQDPEzDdahvvwtl0v+DcrCTRnfBfL7Eqy0i/N5lbtdHjxR0CcRfys6h274mcrALhImp
 JiNXb7FyOUlZw0HmfsYQHsPzhuoA3Js3Gu951vL6QMeGFfV3R3nxQuA1YlIl6o/rKtIC
 4JXGea+QnhXHcXdQgA67a+p6LBokRK+6K5Xq/5O8DTqTVhV8hc4RWeRxXCwohS5RyCpl
 4IkA==
X-Gm-Message-State: AJIora8iWxP/FxhlWFWocJY5QwSdwywmsssVlkFmY6rjp1R6gEmllXZd
 Gt5gkhSjKVsZue3iEgPnDR0aWzRFiDFXow==
X-Google-Smtp-Source: AGRyM1s2W+aXo97/FafiRqyGa44kujezgF3MmByQHD4c0W+I0EPamC86VM36BV64DUbUNCmtacuGgA==
X-Received: by 2002:a02:8544:0:b0:341:4ff3:c9ba with SMTP id
 g62-20020a028544000000b003414ff3c9bamr6760839jai.288.1658119176424; 
 Sun, 17 Jul 2022 21:39:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net.
 [71.218.105.222]) by smtp.gmail.com with ESMTPSA id
 e97-20020a02866a000000b00339c33df66bsm5092018jai.118.2022.07.17.21.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 21:39:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 22:39:01 -0600
Message-Id: <20220718043901.873466-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TasUmXm97Li0XwJ8vQ3ThI7Wx8nVgeLLTKthfdifILc=;
 b=lRurhaHmMoofRB3UHu6Unizt0x3nESKKTLWmbT4Osq27shnpbUmDiudeh8UJ2Thjiq
 VV7yMGvEjYEZGnj0ZgJ3aEJjLHMwyjMsWVmNGSFZG6lfbGg7C6ILF10QE4olqxQsVLmE
 JgVEih2ZswFJ3gy4atnxYD/mvYEwJWS7BxsmR6AQVcgLZSgxtrHjLUxQCtTJlVogVr8g
 +fDgCGaKAkJRT9HRW5ERXfAjwVNnzXvwyrFUloFr8xCsnpBThBqs+O0zdLa3JBgY1zAV
 u5YBK7ER71Yru8xBuDhZrVrktfXuT/tmPslwOf55VcVQfBY9M5/AMZJSZJCHHWh5Jiqh
 AVrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lRurhaHm
Subject: [Buildroot] [PATCH buildroot-test v2 1/1] scripts/autobuild-run:
 make hung build timeout configurable
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

A reasonable value for this may vary depending on system load, specs
and how many parallel builds are being run, so we should make it
configurable.

Tweak LoadConfigFile parser to properly convert arg types.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix LoadConfigFile type conversion
---
 scripts/autobuild-run | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 337644f..e8530f9 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -120,9 +120,6 @@ else:
     decode_bytes = _identity
     encode_str = _identity
 
-# A number of packages can take > 60mins of build time (e.g
-# gst-ffmpeg, qt5webkit, mimic)
-HUNG_BUILD_TIMEOUT = 120 # mins
 VERSION = 1
 
 def rm_ro(f, p, _):
@@ -208,7 +205,7 @@ class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
                  submitter, make_opts, nice, toolchains_csv,
-                 repo, upload, buildpid, debug):
+                 repo, upload, buildpid, debug, hung_build_timeout):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -223,6 +220,7 @@ class Builder:
         self.upload = upload
         self.buildpid = buildpid
         self.debug = debug
+        self.hung_build_timeout = hung_build_timeout
         self.build_parallel = False
 
         # frequently needed directories
@@ -388,7 +386,7 @@ class Builder:
             if os.path.exists(build_time_logfile):
                 mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
 
-                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
+                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=self.hung_build_timeout):
                     if sub_proc.poll() is None:
                         monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
                         log_write(self.log, "INFO: build hung")
@@ -756,12 +754,10 @@ class LoadConfigFile(argparse.Action):
         config = configparser.RawConfigParser(allow_no_value=True)
         config.read_file(values)
         for k, v in config.items('main'):
-            key = k.replace("-", "_")
-            value = v
-            if key.startswith("no_") and value is None:
-                key = key[3:]
-                value = False
-            setattr(namespace, key, value)
+            args = ["--" + k]
+            if v:
+                args += [v]
+            parsed = parser.parse_args(args, namespace=namespace)
 
 def main():
 
@@ -811,6 +807,11 @@ def main():
     parser.add_argument("--debug", "-d",
                         help="Send log output to stdout instead of log file",
                         type=str)
+    parser.add_argument("--hung-build-timeout",
+                        help="A number of packages can take > 60mins of build "
+                             "time (e.g gst-ffmpeg, qt5webkit, mimic), sets "
+                             "timeout in minutes",
+                        type=int, default=120)
     toolchains_csv = parser.add_mutually_exclusive_group(required=False)
     toolchains_csv.add_argument("--toolchains-csv",
                                 dest="toolchains_csv",
@@ -895,7 +896,8 @@ def main():
             repo = args.repo,
             upload = upload,
             buildpid = buildpid,
-            debug = args.debug)
+            debug = args.debug,
+            hung_build_timeout = args.hung_build_timeout)
         p = multiprocessing.Process(target=builder.run_instance)
         p.start()
         processes.append(p)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
