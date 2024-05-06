Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10494C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 23:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D58181DA0;
	Mon,  6 May 2024 23:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClgGPohDbCAc; Mon,  6 May 2024 23:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C66B81E5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C66B81E5E;
	Mon,  6 May 2024 23:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F99E1BF314
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 23:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C428414C2
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 23:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVQGVvYRjrIf for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 23:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=78.46.223.134;
 helo=mx1.dismail.de; envelope-from=november@dismail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00B4F41498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B4F41498
Received: from mx1.dismail.de (mx1.dismail.de [78.46.223.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00B4F41498
 for <buildroot@buildroot.org>; Mon,  6 May 2024 23:47:19 +0000 (UTC)
Received: from mx1.dismail.de (localhost [127.0.0.1])
 by mx1.dismail.de (OpenSMTPD) with ESMTP id d74f21fd;
 Tue, 7 May 2024 01:47:16 +0200 (CEST)
Received: from smtp1.dismail.de (<unknown> [10.240.26.11])
 by mx1.dismail.de (OpenSMTPD) with ESMTP id 2cd57e30;
 Tue, 7 May 2024 01:47:16 +0200 (CEST)
Received: from smtp1.dismail.de (localhost [127.0.0.1])
 by smtp1.dismail.de (OpenSMTPD) with ESMTP id 75e2178b;
 Tue, 7 May 2024 01:47:16 +0200 (CEST)
Received: by dismail.de (OpenSMTPD) with ESMTPSA id 8d45462c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 May 2024 01:47:15 +0200 (CEST)
Date: Mon, 06 May 2024 19:47:03 -0400
To: Arnout Vandecappelle <arnout@mind.be>
Message-Id: <FQ83DS.40R820KQ8A6J3@dismail.de>
In-Reply-To: <c572d16c-4d9b-44db-808d-1aa1e0c61866@mind.be>
References: <XWZ0DS.CUMWYFFCDVCQ2@dismail.de>
 <c9627c7b-f371-4c6a-8815-5ee3a3c1c190@mind.be>
 <JSA1DS.7U0E3BNQ9NS62@dismail.de>
 <c572d16c-4d9b-44db-808d-1aa1e0c61866@mind.be>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=dismail.de;
 h=date:from
 :subject:to:cc:message-id:in-reply-to:references:mime-version
 :content-type; s=20190914; bh=ma8AkT8GyH4/Nd0pWlrkPY1jfdyr47VWaO
 55qoRsuNo=; b=ETw8cfmvW001T4dQB3tgKZOpsCUd+iBKT2vX0LvczznSM0u/RM
 r0GGdqbaQZ7B3owDGcZDUAYMZXMa225OHyaOWeM/woUFwWVh/C6wyvbJzet4uUo+
 04WGveEnhoalohkt3XZjSati4f8OOSOAykGy12uKDKQOeAgw1bjYvvzWISAABm1M
 aPDtbYO6ZXh1cJbxU5MUx3CyzFg0TkuPwUUWMmtNak7scHAP9wGa5EQU/BP6sQGg
 3iwnC6Qb6TEXWxHiEF8DO3+ZVVpMCcu2+1aIgWNSaqzi0p6OvsLYw1l7Tkahl0Tr
 mN2CaOL3skjJE0rX2pTYCHDxVI0fd5/zZhcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dismail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=dismail.de header.i=@dismail.de header.a=rsa-sha256
 header.s=20190914 header.b=ETw8cfmv
Subject: Re: [Buildroot] Issue Building New Package cmus
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
From: Dylan via buildroot <buildroot@buildroot.org>
Reply-To: Dylan <november@dismail.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

I will try that out. I appreciate your assistance!

Thank you,
Dylan

On Mon, May 6 2024 at 09:01:13 AM +0200, Arnout Vandecappelle 
<arnout@mind.be> wrote:
> 
> 
> On 06/05/2024 00:36, Dylan wrote:
>> Hello Arnout,
>> 
>> Thank you for the prompt reply. I moved the $(TARGET_CONFIGURE_OPTS) 
>> variable behind the ./configure and MAKE invocations and it has 
>> solved that issue (pasted below).
>> 
>> define CMUS_CONFIGURE_CMDS
>> (cd $(@D); \
>> $(TARGET_CONFIGURE_OPTS) \
>> $(TARGET_CONFIGURE_ARGS) \
>> ./configure $(CMUS_CONFIGURE_OPTS))
>> endef
>> 
>> define CMUS_BUILD_CMDS
>> $(TARGET_MAKE_ENV) \
>> $(TARGET_CONFIGURE_OPTS) \
>> $(TARGET_CONFIGURE_ARGS) \
>> $(MAKE) -C $(@D) all
>> endef
>> 
>> define CMUS_INSTALL_TARGET_CMDS
>> $(TARGET_MAKE_ENV) \
>> $(TARGET_CONFIGURE_OPTS) \
>> $(TARGET_CONFIGURE_ARGS) \
>> $(MAKE) -C $(@D) install \
>> DESTDIR="$(TARGET_DIR)/usr/bin"
>> endef
>> 
>> 
>> I'm now receiving errors related to "undefined references", which by 
>> their names, seem rather essential:
>> 
>> main.c:(.text+0x4): undefined reference to `__stack_chk_guard'
>> buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
>> main.c:(.text+0x14): undefined reference to `__stack_chk_guard'
>> buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
>> main.c:(.text+0x4c): undefined reference to `read'
>> buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
>> main.c:(.text+0x64): undefined reference to `__stack_chk_guard'
>> buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
>> main.c:(.text+0x68): undefined reference to `__stack_chk_guard'
>> buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
>> main.c:(.text+0x80): undefined reference to `__stack_chk_fail'
> 
>  Sounds like the Makefile unconditionally enables stack smashing 
> protection, but it's disabled in your Buildroot configuration. Check 
> in the Makefile how it's done and then either patch it out, or give 
> whatever config option is needed to disable it. If you disable it, it 
> will still be enabled by Buildroot when it's enabled in the Buildroot 
> configuration (through the CFLAGS that Buildroot passes in).
> 
>> buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: main.o: in 
>> function `write_line':
>> main.c:(.text+0x138): undefined reference to `strlen'
> 
>  This is most likely a similar situation but with FORTIFY.
> 
>  Regards,
>  Arnout
> 
>> 
>> Specifically, right after the line,
>>      LD    cmus-remote
>> 
>> Do you have any suggestions for resources I could dive deeper into 
>> this? I've been combing through the buildroot and bootlin docs, but 
>> it seems there are some specifics that I am missing.
>> 
>> I have the full build log here, if you're so inclined: 
>> https://paste.ack.tf/f86eab
>> 
>> Thank you for your assistance!
>> Dylan
>> 
>> On Sun, May 5 2024 at 09:33:22 PM +0200, Arnout Vandecappelle 
>> <arnout@mind.be> wrote:
>>> 
>>> 
>>> On 05/05/2024 20:41, Dylan via buildroot wrote:
>>>> Hello,
>>>> 
>>>> I have added a new package, cmus, to my buildroot package list, 
>>>> but when I try to compile it during a full rebuild, it returns 
>>>> an error message,
>>>> 
>>>> input.c: In function 'do_http_get':
>>>> input.c:223:54: error: expected ')' before 'VERSION'
>>>> CC lib.o
>>>> make[2]: *** [scripts/lib.mk:66: input.o] Error 1
>>>> make[2]: *** Waiting for unfinished jobs....
>>>> make[1]: *** [package/pkg-generic.mk:283: 
>>>> buildroot/output/build/cmus-2.10.0/.stamp_built] Error 2
>>>> make: *** [Makefile:82: _all] Error 2
>>>> 
>>>> 
>>>> I can build the cmus package outside of buildroot, so I think it 
>>>> may be related to my cmus.mk file, but I am not sure what is 
>>>> wrong with the file.
>>>> 
>>>> I've uploaded the contents of the cmus.mk file here:
>>>> https://paste.ack.tf/8471de
>>> 
>>>  You have:
>>> 
>>> $(MAKE) $(TARGET_CONFIGURE_OPTS)
>>> 
>>>  This forces an override of all variables defined in 
>>> TARGET_CONFIGURE_OPTS. One of those is CFLAGS, and in the 
>>> Makefile itself the definition of VERSION is added to CFLAGS.
>>> 
>>>  The solution is typically to use
>>> 
>>> $(TARGET_CONFIGURE_OPTS) $(MAKE)
>>> 
>>> i.e. pass everything in the environment. But then you have to make 
>>> sure that the Makefile properly handles that - e.g. that it uses 
>>> += for CFLAGS (which it does).
>>> 
>>>  Regards,
>>>  Arnout
>>> 
>>>> 
>>>> If the mailing list supports it, I have the hash and config files 
>>>> attached, as well.
>>>> 
>>>> 
>>>> I'm using buildroot version 2024.02 and have tried running "make 
>>>> clean all".
>>>> Is anyone else able to reproduce the same error, or can tell me 
>>>> what I've done incorrectly?
>>>> 
>>>> Thank you,
>>>> Dylan
>>>> 
>>>> 
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot@buildroot.org
>>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> 
>> 


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
