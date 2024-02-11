Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B75C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F7284F74;
	Sun, 11 Feb 2024 22:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElXskhfiYPPu; Sun, 11 Feb 2024 22:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7844384F75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7844384F75;
	Sun, 11 Feb 2024 22:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB18B1BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9848984F75
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skNYzNyltc-d for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4333284F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4333284F74
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4333284F74
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:11:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3295720003;
 Sun, 11 Feb 2024 22:11:57 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:11:56 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240211231156.68fa41ab@windsurf>
In-Reply-To: <20240208095615.2397148-1-roy.kollen.svendsen@akersolutions.com>
References: <20240208095615.2397148-1-roy.kollen.svendsen@akersolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707689517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AmJsTF/Cbravu2DVh76C81AN/TGfaUDw1sc5e9Ht0o=;
 b=iXwNCgBFeyAbrXZ4TCG0DpK7c/9bP5s49vVZN2g5N4BfvFyWM6t9O7mKB9UrFJm3W+Ec8C
 HUsUOoR3JFDZNbZuQK2meNmGBkINuiNxzwdKZytBE/DpUk0/goV6NfkYk1/ljgH0Ruef/3
 kIgDoNA26G5cmoQsU24Qgfd1GkXCZiFJUJ34ywVJH8Xr/wQBU0elIZadE8Hy2QUL7fyA3w
 SC6rdVaAT3bUvOzBMUkP4LzvqPv5qynAK4XPe/ZT+wPGqtdaxcbRX/csxcM0BVp/BKItL0
 mXfGZ+axydMHHU5XeBqN1cr4fg1WYOdUIH6ysfYpEoNx5BYkej7IkUDiLdCcGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iXwNCgBF
Subject: Re: [Buildroot] [PATCH] package/python3: fix install
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Feb 2024 10:56:14 +0100
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Fixes the following failure in the install step of host-python3:
>     ...
>     /usr/bin/install -c -m 644 pyconfig.h output/host/include/python3.12/pyconfig.h
>     [ERROR] _tkinter failed to import: output/build/host-python3-3.12.1/build/lib.linux-x86_64-3.12/_tkinter.cpython-312-x86_64-linux-gnu.so: undefined symbol: Tcl_AddErrorInfo
>     The following modules are *disabled* in configure script:
>     _ctypes_test          _testbuffer           _testcapi
>     _testclinic           _testimportmultiple   _testinternalcapi
>     _testmultiphase       _xxtestfuzz           xxsubtype
> 
>     Following modules built successfully but were removed because they could not be imported:
>     _tkinter
> 
>     Checked 110 modules (31 built-in, 54 shared, 15 n/a on linux-x86_64, 9 disabled, 0 missing, 1 failed on import)
>     ...
>     /usr/bin/install -c -m 644 ./Lib/types.py output/host/lib/python3.12
>     /usr/bin/install: cannot stat 'Modules/_tkinter.cpython-312-x86_64-linux-gnu.so': No such file or directory
>     /usr/bin/install -c -m 644 ./Lib/typing.py output/host/lib/python3.12
>     make[3]: *** [Makefile:2068: sharedinstall] Error 1
>     ...
> 
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> ---
> Changes v1 -> v2:
>   Make the --disable-tk option automatically set py_cv_module__tkinter=n/a (suggested by Thomas Petazzoni)
> ---
>  .../python3/0012-Add-an-option-to-disable-the-tk-module.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master after improving the commit title, and extending the
commit log to indicate which commit this is fixing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
