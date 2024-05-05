Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65357C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 22:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51FE4061C;
	Sun,  5 May 2024 22:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abcSC_ZOC94Z; Sun,  5 May 2024 22:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FD340627
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FD340627;
	Sun,  5 May 2024 22:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2F41BF3AD
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 22:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E8C40627
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 22:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfhLw5WThCbQ for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 22:43:16 +0000 (UTC)
X-Greylist: delayed 399 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 05 May 2024 22:43:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C90F44061C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90F44061C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=78.46.223.134;
 helo=mx1.dismail.de; envelope-from=november@dismail.de; receiver=<UNKNOWN> 
Received: from mx1.dismail.de (mx1.dismail.de [78.46.223.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C90F44061C
 for <buildroot@buildroot.org>; Sun,  5 May 2024 22:43:15 +0000 (UTC)
Received: from mx1.dismail.de (localhost [127.0.0.1])
 by mx1.dismail.de (OpenSMTPD) with ESMTP id fa62b953;
 Mon, 6 May 2024 00:36:32 +0200 (CEST)
Received: from smtp2.dismail.de (<unknown> [10.240.26.12])
 by mx1.dismail.de (OpenSMTPD) with ESMTP id 62e7a898;
 Mon, 6 May 2024 00:36:32 +0200 (CEST)
Received: from smtp2.dismail.de (localhost [127.0.0.1])
 by smtp2.dismail.de (OpenSMTPD) with ESMTP id ed721a18;
 Mon, 6 May 2024 00:36:32 +0200 (CEST)
Received: by dismail.de (OpenSMTPD) with ESMTPSA id 477fe0e5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 6 May 2024 00:36:30 +0200 (CEST)
Date: Sun, 05 May 2024 18:36:19 -0400
To: Arnout Vandecappelle <arnout@mind.be>
Message-Id: <JSA1DS.7U0E3BNQ9NS62@dismail.de>
In-Reply-To: <c9627c7b-f371-4c6a-8815-5ee3a3c1c190@mind.be>
References: <XWZ0DS.CUMWYFFCDVCQ2@dismail.de>
 <c9627c7b-f371-4c6a-8815-5ee3a3c1c190@mind.be>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=dismail.de;
 h=date:from
 :subject:to:cc:message-id:in-reply-to:references:mime-version
 :content-type; s=20190914; bh=k6Fvwp4XF/Bc1jeAn/pzvQrfYFgpxv2Vqa
 YfTXOpBg0=; b=lHILvDTOH0A2jc313PchuqHBbqN9t8ZtTyUPDxKPt8MmoqRf03
 2IbBQUae2A/oRzKXOE0kxrQGzJO+mteWRVmf9jsDYRNIY/R+mdiWglc0QExbXt9p
 /I7Vn7LxwKRZ/uVmQwDRYGIlKbWt/KXb5bf7doi2Y3pN47lGEoV4rhH/fpt8yFN2
 ughYv0WKaMxp6xmh1X/eoQpnokzzuHwjM2TwjwspMPVT9Qo6/WhabKb/yqXzFsDP
 SLWMqp9cRLL3YmhG6yXqdDYlh8ApHJQwISvjrt5gXUQ/QWr13PyT45EuYfANsGJ5
 lxsdDM3dBZkYi5yJoL08Pj78DwPrY/mmLOwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dismail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=dismail.de header.i=@dismail.de header.a=rsa-sha256
 header.s=20190914 header.b=lHILvDTO
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

Hello Arnout,

Thank you for the prompt reply. I moved the $(TARGET_CONFIGURE_OPTS) 
variable behind the ./configure and MAKE invocations and it has solved 
that issue (pasted below).

define CMUS_CONFIGURE_CMDS
 (cd $(@D); \
 $(TARGET_CONFIGURE_OPTS) \
 $(TARGET_CONFIGURE_ARGS) \
 ./configure $(CMUS_CONFIGURE_OPTS))
endef

define CMUS_BUILD_CMDS
 $(TARGET_MAKE_ENV) \
 $(TARGET_CONFIGURE_OPTS) \
 $(TARGET_CONFIGURE_ARGS) \
 $(MAKE) -C $(@D) all
endef

define CMUS_INSTALL_TARGET_CMDS
 $(TARGET_MAKE_ENV) \
 $(TARGET_CONFIGURE_OPTS) \
 $(TARGET_CONFIGURE_ARGS) \
 $(MAKE) -C $(@D) install \
 DESTDIR="$(TARGET_DIR)/usr/bin"
endef


I'm now receiving errors related to "undefined references", which by 
their names, seem rather essential:

main.c:(.text+0x4): undefined reference to `__stack_chk_guard'
buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
main.c:(.text+0x14): undefined reference to `__stack_chk_guard'
buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
main.c:(.text+0x4c): undefined reference to `read'
buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
main.c:(.text+0x64): undefined reference to `__stack_chk_guard'
buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
main.c:(.text+0x68): undefined reference to `__stack_chk_guard'
buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: 
main.c:(.text+0x80): undefined reference to `__stack_chk_fail'
buildroot/output/host/bin/aarch64-buildroot-linux-gnu-ld: main.o: in 
function `write_line':
main.c:(.text+0x138): undefined reference to `strlen'

Specifically, right after the line,
	LD	cmus-remote

Do you have any suggestions for resources I could dive deeper into 
this? I've been combing through the buildroot and bootlin docs, but it 
seems there are some specifics that I am missing.

I have the full build log here, if you're so inclined: 
https://paste.ack.tf/f86eab

Thank you for your assistance!
Dylan

On Sun, May 5 2024 at 09:33:22 PM +0200, Arnout Vandecappelle 
<arnout@mind.be> wrote:
> 
> 
> On 05/05/2024 20:41, Dylan via buildroot wrote:
>> Hello,
>> 
>> I have added a new package, cmus, to my buildroot package list, but 
>> when I try to compile it during a full rebuild, it returns an error 
>> message,
>> 
>> input.c: In function 'do_http_get':
>> input.c:223:54: error: expected ')' before 'VERSION'
>> CC lib.o
>> make[2]: *** [scripts/lib.mk:66: input.o] Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [package/pkg-generic.mk:283: 
>> buildroot/output/build/cmus-2.10.0/.stamp_built] Error 2
>> make: *** [Makefile:82: _all] Error 2
>> 
>> 
>> I can build the cmus package outside of buildroot, so I think it may 
>> be related to my cmus.mk file, but I am not sure what is wrong with 
>> the file.
>> 
>> I've uploaded the contents of the cmus.mk file here:
>> https://paste.ack.tf/8471de
> 
>  You have:
> 
> $(MAKE) $(TARGET_CONFIGURE_OPTS)
> 
>  This forces an override of all variables defined in 
> TARGET_CONFIGURE_OPTS. One of those is CFLAGS, and in the Makefile 
> itself the definition of VERSION is added to CFLAGS.
> 
>  The solution is typically to use
> 
> $(TARGET_CONFIGURE_OPTS) $(MAKE)
> 
> i.e. pass everything in the environment. But then you have to make 
> sure that the Makefile properly handles that - e.g. that it uses += 
> for CFLAGS (which it does).
> 
>  Regards,
>  Arnout
> 
>> 
>> If the mailing list supports it, I have the hash and config files 
>> attached, as well.
>> 
>> 
>> I'm using buildroot version 2024.02 and have tried running "make 
>> clean all".
>> Is anyone else able to reproduce the same error, or can tell me what 
>> I've done incorrectly?
>> 
>> Thank you,
>> Dylan
>> 
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
