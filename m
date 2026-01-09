Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD28D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F5660DD6;
	Tue, 13 Jan 2026 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYIrxLHluJUv; Tue, 13 Jan 2026 19:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24A9460DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333048;
	bh=vHIm3B3FF2fVxvmowZ7XxDZtg3iREWumXY1JBqWzVo4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T2k2kkpJ4wlA/KJhQ0VDsNMk4zlvr5gueGDNHiq26SZ0emQB2fKgk0yaXf2k5+W7U
	 32BUdIgF39J7eQSftQFTsSKEciKVOiKnVFOcW5K5RntAsY80PIhEVAU84JtMQ2hgOB
	 2WYJhpMoqFqsLMOmEPeSdDOWXo8DPdKAPTSzK8ei2LnUa8pFP+OfaZjKHt8pCCe84I
	 JMCtAfoLdjDf4NJKMbTAt4poLciP7nmtEh1Zr6Um5X3KZz065jta8joJrwTRiZO076
	 SUqtqfUMrM7sIxepucEapei7DmY0OCe62RDU6cPKyDARxibQqpLujsutN1QL6CLKN8
	 rcDbLfMdBXTfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A9460DBF;
	Tue, 13 Jan 2026 19:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2338E1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C330640177
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4MoFtTlUsqP for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD23A40302
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD23A40302
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC65E8854A; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 15:58:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4096db6b07a796286292a15840049cd45608ebf4
X-Git-Newrev: dbdae1cda2e5136fe4d820b1e002c320834ba191
X-Patchwork-Hint: ignore
Message-Id: <20260113193616.CC65E8854A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-tools:
 perf: build with libtraceevent support when it is selected
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7314667073006734217=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7314667073006734217==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dbdae1cda2e5136fe4d820b1e002c320834ba191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When trying to perform a custom uprobe recording on a target with perf
built by buildroot, the recording step fails as perf can not record
uprobes without libtraceevent support:

  $ perf probe -x linked_list insert_name index
  Target program is compiled without optimization. Skipping prologue.
  Probe on address 0x808 to force probing at the function entry.

  Added new event:
    probe_linked_list:insert_name (on insert_name in /root/gdb/linked_list with index)

  perf is not linked with libtraceevent, to use the new probe you can use tracefs:

          cd /sys/kernel/tracing/
          echo 1 > events/probe_linked_list/insert_name/enable
          echo 1 > tracing_on
          cat trace_pipe
          Before removing the probe, echo 0 > events/probe_linked_list/insert_name/enable
  $ perf record -e probe_linked_list:insert_name ./linked_list
  event syntax error: 'probe_linked_list:insert_name'
                       \___ unsupported tracepoint

  libtraceevent is necessary for tracepoint support
  Run 'perf list' for a list of valid events

   Usage: perf record [<options>] [<command>]
      or: perf record [<options>] -- <command> [<options>]

      -e, --event <event>   event selector. use 'perf list' to list available events

libtraceevent support for perf has been disabled with commit
b4ab45a5c1db ("package/linux-tools: disable libtracevent detection")
because there was no libtraceevent package in buildroot to replace the
former libtraceevent removed from the kernel sources. Since then, commit
1474f1b34b17 ("package/libtraceevent: new package") has introduced a
libtraceevent package. We can then expose again the possibility to build
perf with libtraceevent support.

Make buildroot perf makefile detect if libtraceevent package has been
enabled, and if so, allow to build perf with libtraceevent support.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5396f730d7f77c572a67993ef139ed735650398f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d67318571a..1e19ee7f1c 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -28,7 +28,6 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
-	NO_LIBTRACEEVENT=1 \
 	NO_SHELLCHECK=1
 
 # We need to pass an argument to ld for setting the emulation when
@@ -128,6 +127,12 @@ PERF_MAKE_FLAGS += CORESIGHT=1
 # bare "ifdef CORESIGHT" constructs.
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTRACEEVENT),y)
+PERF_DEPENDENCIES += libtraceevent
+else
+PERF_MAKE_FLAGS += NO_LIBTRACEEVENT=1
+endif
+
 # We really do not want to build the perf documentation, because it
 # has stringent requirement on the documentation generation tools,
 # like xmlto and asciidoc), which may be lagging behind on some

--===============7314667073006734217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7314667073006734217==--
