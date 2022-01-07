Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19843C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B797081775;
	Fri,  7 Jan 2022 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VMj4ZyfllY5; Fri,  7 Jan 2022 22:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057D382C8F;
	Fri,  7 Jan 2022 22:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4C21C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A18160745
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOgmr5Gvdv5J for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:10:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1419660674
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:10:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5A1F61BF206;
 Fri,  7 Jan 2022 22:10:40 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n5xRY-0008Rd-GH; Fri, 07 Jan 2022 23:10:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211105173048.2483666-1-fontaine.fabrice@gmail.com>
Date: Fri, 07 Jan 2022 23:10:40 +0100
In-Reply-To: <20211105173048.2483666-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Nov 2021 18:30:48 +0100")
Message-ID: <87o84njixr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: add prometheus remote
 write backend support
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > prometheus remote write backend depends on protobuf and snappy and is
 > enabled by default since the addition of the package in commit
 > 1d2bb469078b5818aa2390b9868cd632200f17a2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/netdata/Config.in  | 19 +++++++++++++++++++
 >  package/netdata/netdata.mk | 10 ++++++++++
 >  2 files changed, 29 insertions(+)

 > diff --git a/package/netdata/Config.in b/package/netdata/Config.in
 > index 88f88cb7ed..34d139125d 100644
 > --- a/package/netdata/Config.in
 > +++ b/package/netdata/Config.in
 > @@ -16,6 +16,25 @@ config BR2_PACKAGE_NETDATA
 
 >  	  https://github.com/netdata/netdata
 
 > +if BR2_PACKAGE_NETDATA
 > +
 > +config BR2_PACKAGE_NETDATA_PROMETHEUS
 > +	bool "prometheus remote write backend"
 > +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 > +	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 > +	select BR2_PACKAGE_PROTOBUF
 > +	select BR2_PACKAGE_SNAPPY
 > +	help
 > +	  Enable prometheus remote write backend
 > +
 > +comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 4.8"
 > +	depends on !BR2_INSTALL_LIBSTDCPP || \
 > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 > +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 > +
 > +endif
 > +
 >  comment "netdata needs a toolchain w/ NPTL, dynamic library"
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 >  	depends on BR2_USE_MMU
 > diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
 > index 34365cbf56..ac717d56b0 100644
 > --- a/package/netdata/netdata.mk
 > +++ b/package/netdata/netdata.mk
 > @@ -60,6 +60,16 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 >  NETDATA_CONF_ENV += LIBS=-latomic
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_NETDATA_PROMETHEUS),y)
 > +# Override the result of AC_PATH_PROG([CXX_BINARY], [${CXX}], [no])
 > +# which fails because CXX is set to the full CXX binary path
 > +NETDATA_CONF_ENV += ac_cv_path_CXX_BINARY=yes

The issue is both the path issue and also the fact that the compiler
may not be in the path. I guess they have used this odd check as you
cannot do a conditional AC_PROG_CXX.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
