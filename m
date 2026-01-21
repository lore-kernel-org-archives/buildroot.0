Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE81EC44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51DA0824F4;
	Wed, 21 Jan 2026 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkVpDkxFArhq; Wed, 21 Jan 2026 20:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1E5812FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028437;
	bh=wsZlhmnazTYvHM3eiFo2JoM2yzfKxVoKZkSfZSVYnfU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lcBlvx+if9Nx8VBcdPiKn+va20pUiH1qhz/8dtab5oQeO8SUZdLTYPaMYgsywTMH2
	 iAAJBnnVfIYgWehMMYWHWjI/0E/wjPYDBMZ0s97r9YxbvHx7EUL1cJpfZAfJdkeVrj
	 pNp8ncHzCHO+Er1A7/WHAcC10pl5AeqBBuQnSRhGgW80Y8qaOyFbsd6nj5d4aCXa3d
	 2rRt1wlL6yXbc//3h6ss421TYxIK9nlVzaOgEH09VOOfaeGiTyaiA3xbMiL5tFsh04
	 Ov624NFPNTs57uIcFSGLzwKahQaHImGi7QynFsXO3itI2EqWodXrt/tnth5F0EoNmY
	 XuQTThtSPklPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E1E5812FD;
	Wed, 21 Jan 2026 20:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE2D158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 378374098D
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnrloPVNFDXr for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 260E240975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 260E240975
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 260E240975
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:47:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4047713F8A7;
 Wed, 21 Jan 2026 21:47:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 Jan 2026 21:47:03 +0100
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 21:47:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Guillaume William Brs
 <guillaume.bressaix@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <20260102152635.924052-2-bernd@kuhls.net>
References: <20260102152635.924052-1-bernd@kuhls.net>
 <20260102152635.924052-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <59c4784d6eafd89385ab27d7c26c7cc4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769028432;
 bh=vHiXcl3PwK/+spIzMEn9PKDl8puD7HXTbZQqghXh/AE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y7q7zd6ilwk60jsu7bonpZqA1F9ri41Ug1H6qRQ/8UaPCjOH6ay4ikZxTbj2w48gY
 TCaGMR8eSn7YRPMduh0PjJFs1WlOW1M3ofSj4R0yFp5TFNp0fgEmVnAaB/cXti9qs3
 I7oyFn1oShQRnZTpLksdE3bsPlZlZ0qQ38k+CN1u9QmjZmYsuNZ/GbCBUOCtLXEioo
 hJI4jBM4OeW1XIjprX0FVkQi3mJwPev099qihtpAkhqT3k2IQjZvE8zN+va/om5IKF
 9tWlAqM3NItP+I8ycW6ZuPTKuPN5V/7p//uZfAR3YTfFvpeZZnGFZs6yvM80z7A62z
 Ka+feTHQJitYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y7q7zd6i
Subject: Re: [Buildroot] [PATCH v3 1/6] package/python-numpy: bump version
 to 2.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/01/2026 16:26, Bernd Kuhls wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Release notes: https://numpy.org/news/
> 
> Add new supported architectures.
> 
> License hash changed due to date update:
> https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6
> 
> We need to build python-numpy with its vendored version of meson as
> it currently relies on features that are not yet upstream. To do this
> we can simply set the PYTHONPATH with the vendored meson path before
> the normal PYTHON3_PATH so that the vendored version will have
> precedence. We need to set this for both host and target numpy.
> 
> We also need to set the architecture specific longdouble_format
> property as numpy is unable to determine the value for this without
> being able to execute target binaries.
> 
> See:
> https://github.com/numpy/numpy/blob/3e7e5c3cabb8f1a0d940dc6f2058fed4a8c3e284/doc/source/building/cross_compilation.rst
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [Bernd:
>  Bumped to 2.4.0
> 
>  Removed patch which is included in this release.
> 
>  Updated license hashes due to upstream commits:
>  - copyright year bumps:
>    https://github.com/numpy/numpy/commits/v2.4.0/LICENSE.txt
>  - file move
>    tools/npy_tempita/license.txt -> 
> numpy/_build_utils/tempita/LICENSE.txt
>    
> https://github.com/numpy/numpy/commit/63a1fee8d1c1e442aa8ca08ac7cefb195f99b2a9
>    
> https://github.com/numpy/numpy/commit/86940987a9d8d54c860d8c862d5d96c51b339f23
>  - directory move core -> _core and various code updates
>    
> https://github.com/numpy/numpy/commits/v2.4.0/numpy/_core/src/multiarray/dragon4.c
>  - directory move core -> _core
>    
> https://github.com/numpy/numpy/commits/v2.4.0/numpy/_core/include/numpy/libdivide/LICENSE.txt
> 
>  Following Romain's review
>  
> https://lists.buildroot.org/pipermail/buildroot/2024-November/767739.html
>  host-python-numpy was switched back to host-python-package to install 
> the
>  f2py script needed by the upcoming bump of python-scipy. A dependency 
> to
>  host-python-meson-python is also needed.
> 
>  Removed PYTHON_NUMPY_LONGDOUBLE_FORMAT configure option for BR2_arceb
>  after this arch was removed from buildroot.
> 
>  Changed path in PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES following
>  upstream commit
>  
> https://github.com/numpy/numpy/commit/923f219077c8aa3ad7d3792d8c06cba010b70252
>  and updated opencv4 as well]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
