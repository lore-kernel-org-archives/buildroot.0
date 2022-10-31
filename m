Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C2AFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 20:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83319812B5;
	Mon, 31 Oct 2022 20:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83319812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TN9z8ifmVbPO; Mon, 31 Oct 2022 20:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F04480C3F;
	Mon, 31 Oct 2022 20:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F04480C3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6341BF2F9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22A6760B38
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 20:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A6760B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiv_mddBq26N for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 20:39:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4C360B22
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C4C360B22
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 20:39:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B492240002;
 Mon, 31 Oct 2022 20:39:28 +0000 (UTC)
Date: Mon, 31 Oct 2022 21:39:26 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, mail@jens-maus.de,
 fesc2000@mailbox.org, f.rogall@gmx.de, oliver.kasten@trsystems.de
Message-ID: <20221031213926.50d3c778@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667248770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lmGpLGnHpBA3CcBPnaSeeBOLm3TaIdbGznN7GRDNoPM=;
 b=ZC+++7Vm3Cuu6HGSNCQzhghK92EPJtor5cX+DikSTatMhmIKfwNOmGC6goIOPHrOPkUfJq
 tXuEc7G1u0lAns1jc1hnA5jHFHFh32QBgpVymLFNtf2DjHuXCCkGt5CpvfDxURSYqRnq4t
 OpbMc7iCs5x+tzMHKoELbefXnDNtvrDGVvGgOZ+XtLD9E1H1uub1ljsxdsfvoiv9jMt7Xw
 PIVXVLFKW6ZiP4UAa6A/d3RY8sqkBjItKhDYnYshObV/TV507G3qvPIezgbaZzXc6f3iMw
 MbRJJ8Ifnw0o/dsNHtQoaEQllbl9sI6K11MW+Mwo19492SmolSgdNfu1bndH6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZC+++7Vm
Subject: [Buildroot] NodeJS, qemu wrapper and ELF interpreter fun
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I finally took some time to investigate the NodeJS build issue that
occurs on x86-64:

  http://autobuild.buildroot.net/results/4f2/4f29c5e663b5d01af20d671baf6504332b8c1f7b/build-end.log

The failure goes like this:

cd ../../tools/v8_gypfiles; python ../../deps/v8/tools/run.py ../../out/Release/v8-qemu-wrapper ../../out/Release/bytecode_builtins_list_generator ../../out/Release/obj.host/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h
../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.29' not found (required by ../../out/Release/bytecode_builtins_list_generator)
../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ../../out/Release/bytecode_builtins_list_generator)
../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by ../../out/Release/bytecode_builtins_list_generator)
../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ../../out/Release/bytecode_builtins_list_generator)
Return code is 1

This problem also has a bug report at
https://bugs.busybox.net/show_bug.cgi?id=14366.

As you probably know, v8-qemu-wrapper is a script that uses Qemu
user-mode emulation to run some programs built for the target. We are
then supposed to use the libraries built for the target, but here for
some reason, the C library of the host gets used, and it fails badly
because it is older than the C library that is available for the
target.

So the question is: why the heck does Qemu use the host C library?

To answer this question, we first have to look at how the -L option of
Qemu is implemented. This option is documented as such:

-L path              QEMU_LD_PREFIX    set the elf interpreter prefix to 'path'

And the v8-qemu-wrapper script makes this option point to
$(STAGING_DIR), so that the ELF interpreter used is the one in
$(STAGING_DIR).

However, contrary to what the option documentation says, this option
does much more than setting the ELF interpreter prefix: it is going to
affect how *all* system calls manipulating files (open, etc.) are
going to work.

When this option is passed, the function init_paths() in
https://git.qemu.org/?p=qemu.git;a=blob;f=util/path.c is called at
initialization time, and essentially its sets the global "base"
variable to point to the directory passed as -L argument.

Then, for every single syscall that manipulates a path, this path will
be passed through the path() function in the same file. This function
will first attempt to resolve the path with "base" as a prefix, and if
not, return the unprefixed path.

After adding some traces into this function, I was able to understand
what happens:

(1) -L$(STAGING_DIR) is passed, causing "base" to point to $(STAGING_DIR)

(2) The target ELF interpreter from $(STAGING_DIR) is properly invoked

(3) When this ELF interpreter then resolves the libc.so.6 library, it
    first looks for /etc/ld.so.cache.

(4) Qemu first looks for /etc/ld.so.cache with the -L prefix, i.e
    $(STAGING_DIR)/etc/ld.so.cache, but it does not exist. So, the Qemu
    system call emulation falls back to /etc/ld.so.cache, which means
    the target ELF interpreter reads the /etc/ld.so.cache of the host
    system.

(5) This /etc/ld.so.cache of the host system says that libc.so.6 is in
    /lib/x86_64-linux-gnu/

(6) The target ELF interpreter therefore tries to use
    /lib/x86_64-linux-gnu/libc.so.6. The Qemu system call emulation
    first tries $(STAGING_DIR)/lib/x86_64-linux-gnu/libc.so.6, but
    this library does not exist (it is in
    $(STAGING_DIR)/lib/libc.so.6), so the Qemu system call emulation
    falls back to /lib/x86_64-linux-gnu/libc.so.6 of the host system,
    which exist... but is too old compared to the target C library.
    Indeed, results from ld.so.cache take precedence over the simple
    resolution of library paths in /usr/lib and /lib.

We see 3 possible ideas to resolve this problem:

(A) Change the behavior of Qemu to not fallback to unprefixed paths:
    when -L is passed, all path-related system calls should see the
    paths prefixed by the -L option.

    Issue with this is that this change is unlikely to get accepted by
    Qemu upstream. And there might be some side effects we have not
    really identified.

(B) Create an empty $(STAGING_DIR)/etc/ld.so.cache. We have tested
    this solution and it works: it gets used instead of the host
    /etc/ld.so.cache. Because $(STAGING_DIR)/etc/ld.so.cache is empty,
    there's no libc.so.6 match, so the target ELF interpreter goes
    through its normal library location resolution logic, which falls
    back to trying in /usr/lib and /lib, which works as those paths
    ends up being prefixed with $(STAGING_DIR) by Qemu.

(C) Pass LD_LIBRARY_PATH pointing to $(STAGING_DIR)/lib and
    $(STAGING_DIR)/usr/lib in the Qemu wrapper. This works because
    LD_LIBRARY_PATH paths have precedence over paths given by
    ld.so.cache.

    This is the solution already used by the GOI qemu wrapper in
    package/gobject-introspection/g-ir-scanner-qemuwrapper.in, and
    which was suggested in bug
    https://bugs.busybox.net/show_bug.cgi?id=14366.

Any opinion? Or other ideas?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
