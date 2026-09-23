Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD4BC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E2D88110F;
	Thu, 24 Sep 2026 18:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjhd7OObazl9; Thu, 24 Sep 2026 18:58:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 350298139F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276332;
	b=alg+SPo8XyXKNETEJaRtKoob6Ur1wToEFoDu3G38C1XpTxLihWt6MOaDJXdewCc1nEl0
	 TFOcdiaa8IdlkTcFL3qeorMgzDKkI2U8AGQ8Am1VGDafe1jrB2vxmVXfzX/JcprvVyw2I
	 ECX8cFAwbTdg3zp2HkYssjzrbiRyvlp0WRYQyHugHBp1iCUBs8wspmxbFYuoH7HC4qEc+
	 l2x6UtQzrsb0rLPnl5r9hfpMFXFPQSpnHpBGfiJk3SX/KY+SGnCJErAUG8/Fgl4o7L0m9
	 2WLr1V5h6kINYNVagiIzTb6ujYULLY+AYs+qAQdm3gA8WTJdcWDKcxQhxNNTmfcXN8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hHXEhYbcf77r++Fk/sdXDRn7I5G5MWm3/yZFDB13oK0=;
	b=RayCDRU4tNoEB1sivqYxwyYd5JtTANjv1/hziYksRhFPec/5cy5DlEP2XCokSUp1qcjG
	 eXgtlWARDzC2u3SfsRtLqjad+JqmDeZFH0QptIW/wb/5NPMEHwU02bE/MDbNop6TfX0mi
	 79tZ2zaQBx7lhRfSW8unHCLwvRZ9+vhVna/xo9J9Unzi6u2cbX28rztlXnado5v/M7M5V
	 ERPfgM0EYELadLMzhzz1r8z0fVEhpRP5Bh9BmktJ/1lCrfuSxoURXY7PNdkCv5YEeNV0W
	 FO82sTCKuvuae0oohfS+yBNYHZ53l7FgK2jCFa+BOMtrqenq7xby98Cf4mSRKABYJ+w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276332;
	bh=hHXEhYbcf77r++Fk/sdXDRn7I5G5MWm3/yZFDB13oK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aoi6kykVR/Es89HiQ/wZI46jREtTWcKgfr4sZNLlZSjBfE7EECkfwEpc5EC/T55z9
	 +PiAMxXO1UXZQjcVL00mN1zQZW6in4lDvKpbsy0aWNYuyPVy7wltT910S7xx32FZe6
	 YKN3E4MGnNyw8flDeS1Q1LXR2qylj8Z9etaKJeVflXfLq62qBlofMHlpwHcY/kvFX6
	 NWlmsXpNR2f0S+lEhqG82nXfm8nubw8fBiRgdMe4nUTfZ3woUftLt/qFKWSk3uSyAO
	 zT8KUf9opQmL/ZNsj6c8uXuKoyqzZywe5trD5CpraeDs57YoC+ZBLVGS6ArQVZeT4M
	 VNGrM0ca+4ocQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350298139F;
	Thu, 24 Sep 2026 18:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 460C2332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEFD404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsLu3vrm50Fm for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4BF08404D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=Bde55gKCnZZAan1X6pZRSsDkhmcdHqo+dLcG4ccnIxnEBFH9pHmqoxNhfsF0ZJ0WbLa8
 nsuC88m/KduP6qIqMAhG7MSnPAwtPjpf8FcdYGUlgw8zTI7W4eGdI4J3JMbBZJoHDAklG
 EopX+8tmB/65Xo3tE+pfLf34Hx/6zeRa5p1Xnor5E12polk0lT9EgBN2WgWj4qPDiRNfd
 7tZBRxgzm+hvu8CY7zRZqJnaoThIF3NkVs+VxtHrHlab/0k/qHnW6LU0Db2fqWUXTOJ3K
 2tietGYRIKn20HCCN6Uyb6oIuAxRO/LBDMSWrBlWsxx67y8eKbSWZ0+mVV0Am2PByxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7KbOJMbF5YjTwTglWtb9MTdHM7MzmHm79KHCNbU4AvQ=;
 b=q8/IJ+R/g5U807m8NATHE1lbUwBcol4vyfj5vPJZqvGtGD4hqS1YGBRGG4//MAfW0GSf
 bGRvscYjdraMSgMIg3DwIqOcIotBv67dgO1L/Y9nDYszBJcn/WrR0N/IJ2ohQWnxjHjln
 lty6BrWdKI4HhpLUe7ueMZzFITNruHYlBjol2LsRF56TCBnLPxNHMSyMmTJ1cUq9CAKQf
 fMYV/yj387ypI9RCLSmXvFYABFsTtStgGFi3f9a4lEjLUoioy8CQFexvzFGJP/wTlSwhl
 PhYlJR6iAVOnguWwg7SNw76Tvnw0SUPYcyWHHUh3XMY+4iNKn9EIAReMPKgaYFREQ4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BF08404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3A7B9835A; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:50 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 01f4bae85b56bb02c2779fd2acfbae8e17d1ec07
X-Git-Newrev: 16462dee6624555b50df596af21d7b683051e54e
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.E3A7B9835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/xen: fix build
 error when BR2_PACKAGE_XEN_TOOLS not enabled
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5718790545515204902=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5718790545515204902==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16462dee6624555b50df596af21d7b683051e54e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
qemu-xen dependency will not be handled and the patch will fail to apply with
the following error.

Fixes: build error below
Applying 0002-Update-linker-flags.patch using patch:
patching file tools/Makefile
Hunk #1 succeeded at 36 (offset -1 lines).
Hunk #2 succeeded at 185 (offset -8 lines).
can't find file to patch at input line 76
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
|index 6bcc83ba..2590904e 100644
|--- a/tools/qemu-xen/include/hw/xen/xen_native.h
|+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1

To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
0002-Update-linker-flags.patch so that modifying source from the qemu-xen
package is no longer included.

Instead of patching qemu-xen, a better solution is undefining the
__XEN_INTERFACE_VERSION__ from the qemu-xen package.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
 # BR2_PACKAGE_XEN_TOOLS is not set

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f63e5724327c890c0e5713fc102a4da1e302c587)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/xen/0002-Update-linker-flags.patch | 16 +---------------
 package/xen/xen.mk                         |  3 ++-
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/package/xen/0002-Update-linker-flags.patch b/package/xen/0002-Update-linker-flags.patch
index ac02722781..3ba678cd9b 100644
--- a/package/xen/0002-Update-linker-flags.patch
+++ b/package/xen/0002-Update-linker-flags.patch
@@ -16,8 +16,7 @@ Upstream: Buildroot specific. This is a temporary patch for an intermediate bump
 Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
 ---
  tools/Makefile                              | 29 ++++++++++++++++++++-
- tools/qemu-xen/include/hw/xen/xen_native.h |  2 +-
- 2 files changed, 29 insertions(+), 2 deletions(-)
+ 1 file changed, 28 insertions(+), 1 deletions(-)
 
 diff --git a/tools/Makefile b/tools/Makefile
 index a9a3196e..5d289651 100644
@@ -69,19 +68,6 @@ index a9a3196e..5d289651 100644
  		--bindir=$(LIBEXEC_BIN) \
  		--datadir=$(SHAREDIR)/qemu-xen \
  		--localstatedir=$(localstatedir) \
-diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
-index 6bcc83ba..2590904e 100644
---- a/tools/qemu-xen/include/hw/xen/xen_native.h
-+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
-@@ -2,7 +2,7 @@
- #define QEMU_HW_XEN_NATIVE_H
- 
- #ifdef __XEN_INTERFACE_VERSION__
--#error In Xen native files, include xen_native.h before other Xen headers
-+#warning In Xen native files, include xen_native.h before other Xen headers
- #endif
- 
- /*
 -- 
 2.51.0
 
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 75252d1123..bddfdbba38 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -40,7 +40,8 @@ XEN_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	HOST_EXTRACFLAGS="-Wno-error" \
 	XEN_HAS_CHECKPOLICY=n \
-	$(TARGET_CONFIGURE_OPTS)
+	$(TARGET_CONFIGURE_OPTS) \
+	EXTRA_CFLAGS_QEMU_XEN="-U__XEN_INTERFACE_VERSION__"
 
 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen

--===============5718790545515204902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5718790545515204902==--
