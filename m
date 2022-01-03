Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E909C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 10:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AA260E3E;
	Mon,  3 Jan 2022 10:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDdqgYcHpOFB; Mon,  3 Jan 2022 10:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D4F60AFB;
	Mon,  3 Jan 2022 10:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2AB1BF95E
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF9560601
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vX_hDVI-GTF for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 10:53:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2195E60A9B
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 10:53:06 +0000 (UTC)
Date: Mon, 03 Jan 2022 10:52:53 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <5KR45R.7T4EYI3OTWEG1@crapouillou.net>
In-Reply-To: <20220102174329.2823931-1-fontaine.fabrice@gmail.com>
References: <20220102174329.2823931-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: set PYTHON_EXECUTABLE
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

Le dim., janv. 2 2022 at 18:43:29 +0100, Fabrice Fontaine =

<fontaine.fabrice@gmail.com> a =E9crit :
> Set PYTHON_EXECUTABLE to avoid the following build failure when
> BR2_PACKAGE_PYTHON is enabled but libiio finds python3 without
> setuptools on host:
> =

> -- Found Python: /usr/bin/python3.5 (found version "3.5.3") found =

> components: Interpreter
> -- new
> -- Python_EXECUTABLE /usr/bin/python3.5
> =

> [...]
> =

> Traceback (most recent call last):
>   File =

> "/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.23/bindings=
/python/setup.py", =

> line 15, in <module>
>     from setuptools import setup
> ImportError: No module named 'setuptools'
> =

> Fixes:
>  - =

> http://autobuild.buildroot.org/results/d80e56e4ad84c8e7f244cf6d1cb96c116e=
8eb734
> =

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  package/libiio/libiio.mk | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index f706298c22..38b2f83e6e 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -76,8 +76,10 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  LIBIIO_DEPENDENCIES +=3D host-python-setuptools python
> +LIBIIO_CONF_OPTS +=3D -DPYTHON_EXECUTABLE=3D$(HOST_DIR)/bin/python
>  else ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  LIBIIO_DEPENDENCIES +=3D host-python3-setuptools python3
> +LIBIIO_CONF_OPTS +=3D -DPYTHON_EXECUTABLE=3D$(HOST_DIR)/bin/python3
>  endif
>  LIBIIO_CONF_OPTS +=3D -DPYTHON_BINDINGS=3DON
>  else
> --
> 2.33.0
> =



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
