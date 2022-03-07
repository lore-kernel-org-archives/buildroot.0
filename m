Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC233C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CAB440918;
	Mon,  7 Mar 2022 19:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y82MKcWJfq4L; Mon,  7 Mar 2022 19:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64600403F8;
	Mon,  7 Mar 2022 19:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4721BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38074403F8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PyAbbNQJGXsn for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:39:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86EBF4016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:39:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3C61C0002;
 Mon,  7 Mar 2022 19:39:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRJCG-000yYv-MY; Mon, 07 Mar 2022 20:39:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220224154118.220408-1-romain.naour@gmail.com>
Date: Mon, 07 Mar 2022 20:39:08 +0100
In-Reply-To: <20220224154118.220408-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 24 Feb 2022 16:41:18 +0100")
Message-ID: <87czix7dsz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-python: use
 SETUPTOOLS_USE_DISTUTILS=stdlib
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > -sh: ipython: not found
 > ipython use a wrong shebang on the target:

It looks like git ate your '# ' line, so I've added

 # ipython -c 'import math; math.floor(12.3)'

And committed, thanks.

 >  # head -n 1 /usr/bin/ipython
 >  #!/home/kubu/buildroot/testsuite-master/TestIPythonPy3/host/bin/python

 > The issue come from python3-setuptools 60.0.0 that changed
 > SETUPTOOLS_USE_DISTUTILS default value from stdlib to local [1] to use
 > its local copy of distutils. This is actually a "breaking" change [2].

 > We have to override SETUPTOOLS_USE_DISTUTILS to the previous value
 > "stdlib" to fixes the issue.

 > While at it, use distutils from stdlib for the host.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091

 > [1] https://github.com/pypa/setuptools/commit/b6fcbbd00cb6d5607c9272dec452a50457bdb292
 > [2] https://github.com/pypa/setuptools/blob/v60.0.0/CHANGES.rst#breaking-changes

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  package/pkg-python.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
 > index b8dc9cd9e5..e81a1a3102 100644
 > --- a/package/pkg-python.mk
 > +++ b/package/pkg-python.mk
 > @@ -40,6 +40,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 >  	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 >  	PYTHONPATH="$(PYTHON3_PATH)" \
 >  	PYTHONNOUSERSITE=1 \
 > +	SETUPTOOLS_USE_DISTUTILS=stdlib \
 >  	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 >  	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 >  	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 > @@ -62,6 +63,7 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 >  HOST_PKG_PYTHON_DISTUTILS_ENV = \
 >  	PATH=$(BR_PATH) \
 >  	PYTHONNOUSERSITE=1 \
 > +	SETUPTOOLS_USE_DISTUTILS=stdlib \
 >  	$(HOST_CONFIGURE_OPTS)
 
 >  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 > @@ -76,6 +78,7 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 >  	$(TARGET_CONFIGURE_OPTS) \
 >  	PYTHONPATH="$(PYTHON3_PATH)" \
 >  	PYTHONNOUSERSITE=1 \
 > +	SETUPTOOLS_USE_DISTUTILS=stdlib \
 >  	_python_sysroot=$(STAGING_DIR) \
 >  	_python_prefix=/usr \
 >  	_python_exec_prefix=/usr
 > @@ -96,6 +99,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 >  HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 >  	PATH=$(BR_PATH) \
 >  	PYTHONNOUSERSITE=1 \
 > +	SETUPTOOLS_USE_DISTUTILS=stdlib \
 >  	$(HOST_CONFIGURE_OPTS)
 
 >  HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 > -- 

 > 2.35.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
