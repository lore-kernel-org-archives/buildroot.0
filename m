Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1611C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61EB34381F;
	Wed, 10 Jan 2024 20:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61EB34381F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tw2eq-YKD6t5; Wed, 10 Jan 2024 20:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A94A43838;
	Wed, 10 Jan 2024 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A94A43838
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF5C91BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956A281E8E
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956A281E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMrbrRMT8BJ1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:24:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76DBB81E37
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76DBB81E37
Received: by mail.gandi.net (Postfix) with ESMTPSA id B228E1BF206;
 Wed, 10 Jan 2024 20:24:45 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:24:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240110212444.2f090059@windsurf>
In-Reply-To: <20240106113627.627714-1-fontaine.fabrice@gmail.com>
References: <20240106113627.627714-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704918285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IuGSvX/NCvslfExoNQH9YBVLXpHburMvTKPSccm6ks=;
 b=QXjS6oLUGdo+Y09FAJkWNRxMkgtTrqvpTSoo+7Rd30CV8v3zkioaAHiZw7YO1qqAYT+i8l
 vfsVhY90BUjUFvwadT0XtLUzM5cRdfp4Dl+qLlnCEPQIwG9YAaIlsvFhstHUDF5pRX/PtX
 IsTWWTB9zowLJgAE0wzqy51i3lg7D40+1yWD/PHr+uG7BCuaDDSF8oM9OCH26fxEhFXQ01
 ZDX5ZNtn7LDpNwTnXovHf4m+o6ZtVs8vlJmUBe7rWGuX/E9710XnSdNLtfJCFtTQ4FPLTP
 +Mv7HMSKhMPlwTT27BPv+MMrcCuYQ+C1LIXlGTZwpksBrows8jzsIvEGGIjU5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QXjS6oLU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: needs C++
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jan 2024 12:36:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit ea45b95c0e54866134c63e88e60489a012b3d134:
> 
> /home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py:40: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
>   import pkg_resources
> Traceback (most recent call last):
>   File "/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py", line 289, in <module>
>     if check_linker_need_libatomic():
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py", line 223, in check_linker_need_libatomic
>     cpp_test = subprocess.Popen(
>                ^^^^^^^^^^^^^^^^^
>   File "/home/autobuild/autobuild/instance-12/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/python3.11/subprocess.py", line 1026, in __init__
>     self._execute_child(args, executable, preexec_fn, close_fds,
>   File "/home/autobuild/autobuild/instance-12/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/python3.11/subprocess.py", line 1950, in _execute_child
>     raise child_exception_type(errno_num, err_msg, err_filename)
> FileNotFoundError: [Errno 2] No such file or directory: 'no'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/58ac25b4e426712269c5fc144121c955b714c760
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-grpc-requests/Config.in     | 4 ++++
>  package/python-grpcio-reflection/Config.in | 4 ++++
>  package/python-grpcio/Config.in            | 4 ++++
>  3 files changed, 12 insertions(+)

Applied to master, thanks. (And thanks James for the review!)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
