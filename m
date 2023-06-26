Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22416EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 15:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4DC418DD;
	Mon, 26 Jun 2023 15:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4DC418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWycyx5HrXgR; Mon, 26 Jun 2023 15:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03DF9418FE;
	Mon, 26 Jun 2023 15:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03DF9418FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38F1A1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 15:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A008213A
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 15:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A008213A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJJ1hM17WDrF for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 15:47:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBA982203
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDBA982203
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 15:47:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6779:b2ef:a941:20a5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 383A52003DE;
 Mon, 26 Jun 2023 17:47:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Jun 2023 17:47:19 +0200
Date: Mon, 26 Jun 2023 17:47:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Message-ID: <20230626154719.GC646621@scaer>
References: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
 <20230622171806.vywakqz7q7ezqnrv@CAB-WSD-L081021>
 <20230626121237.4z7alvantlkjc7ha@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626121237.4z7alvantlkjc7ha@CAB-WSD-L081021>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687794449;
 bh=nf7wmQHAvHAU0BYX2P8tdR0KUauv0/HqANkJRCGKNsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NY7OYDbR7bSp61HHPBEBiAHcYVDLAuMtO9sb889kj/ydLEeAFcJ/TphVJACd3ipUu
 GQtbrKb+RV43nOmc/OH0hgMGiAXsW4sIe0DRemNtRwI5YLaqbypl5pKo63MgYSaPsu
 2z0egog/DBtjAievE5bIPO04+kfH3ia3Jg69eQLS6k2f4uI/iPKX5C0f3jFXis+pc9
 clDgT+pJdPLQgHjIzrECOYxeRTn/uF2MKsfvdtAiIBjIQ27KHR74s0FB5FWEryORTt
 xhl2abhgZbKV8TVc42BatZWiHkaAWmU0fE68EmFDF+V1iYDsNcjJm0/3jr0DnBJDF/
 L5Cku6S3O4CSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NY7OYDbR
Subject: Re: [Buildroot] [PATCH v1] package/linux-tools: introduce linux mm
 tools
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
Cc: Herve Codina <herve.codina@bootlin.com>, sdfw_system_team@sberdevices.ru,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 kernel@sberdevices.ru, rockosov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dmitry, All,

On 2023-06-26 15:12 +0300, Dmitry Rokosov spake thusly:
> Please take a look into this patchset. I appreciate any feedback.

Don't be impatient. Your patch has been pending for about two seeks now.
We have 495 pending patches: https://patchwork.ozlabs.org/project/buildroot/list/
some of witch are so much older...

Yes, I know it can be frustrating. For various reasons, we've been a bit
less active than usual the past few months, but we'll eventually get to
it...

Regards,
Yann E. MORIN.

> On Thu, Jun 22, 2023 at 08:18:06PM +0300, Dmitry Rokosov wrote:
> > Hello,
> > 
> > Add Peter Korsgaard and move "buildroot" mailing list from Cc.
> > 
> > Could you please take a look at this patchset? I believe that linux-mm
> > tools are helpful for investigating kernel memory distribution in
> > embedded systems.
> > 
> > On Fri, Jun 09, 2023 at 02:34:15PM +0300, Dmitry Rokosov wrote:
> > > This toolset was designed to facilitate the testing, monitoring, and
> > > tracing of various things with virtual memory, pages, and slab objects.
> > > It is an invaluable resource for identifying and analyzing
> > > memory-related issues, such as leaks and bottlenecks, and can greatly
> > > enhance one's understanding of memory utilization within a system.
> > > 
> > > The mm toolset includes:
> > >     - page_owner_sort: userspace helper to sort the output of
> > >       /sys/kernel/debug/page_owner, which helps to know who allocates
> > >       the page from kernel context
> > >     - slabinfo: the tool which gets reports about slabs, for example
> > >       show empty slabs, modify of slab debug options at runtime, display
> > >       all information about a slabcache
> > >     - page-types: a handy tool for querying page flags
> > > 
> > > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > > ---
> > >  package/linux-tools/Config.in           | 18 ++++++++
> > >  package/linux-tools/linux-tool-mm.mk.in | 59 +++++++++++++++++++++++++
> > >  2 files changed, 77 insertions(+)
> > >  create mode 100644 package/linux-tools/linux-tool-mm.mk.in
> > > 
> > > diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> > > index 880ad08f0f1c..3ecc45574b82 100644
> > > --- a/package/linux-tools/Config.in
> > > +++ b/package/linux-tools/Config.in
> > > @@ -171,4 +171,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
> > >  
> > >  endif # BR2_PACKAGE_LINUX_TOOLS_HV
> > >  
> > > +config BR2_PACKAGE_LINUX_TOOLS_MM
> > > +	bool "mm"
> > > +	select BR2_PACKAGE_LINUX_TOOLS
> > > +	help
> > > +	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
> > > +
> > > +	  - page_owner_sort: userspace helper to sort the output of
> > > +	  /sys/kernel/debug/page_owner, which helps to know who allocates
> > > +	  the page from kernel context
> > > +
> > > +	  - slabinfo: the tool which gets reports about slabs, for example
> > > +	  show empty slabs, modify of slab debug options at runtime, display
> > > +	  all information about a slabcache
> > > +
> > > +	  - page-types: a handy tool for querying page flags
> > > +
> > > +	  These tools are available only from kernel version 3.4.
> > > +
> > >  endmenu
> > > diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
> > > new file mode 100644
> > > index 000000000000..a59f1c46ff97
> > > --- /dev/null
> > > +++ b/package/linux-tools/linux-tool-mm.mk.in
> > > @@ -0,0 +1,59 @@
> > > +################################################################################
> > > +#
> > > +# mm
> > > +#
> > > +################################################################################
> > > +
> > > +LINUX_TOOLS += mm
> > > +
> > > +MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
> > > +
> > > +KVER = $(shell echo $(LINUX_VERSION_PROBED))
> > > +KVER_MAJOR = $(word 1,$(subst ., ,$(KVER)))
> > > +KVER_MINOR = $(word 2,$(subst ., ,$(KVER)))
> > > +
> > > +# For the first time tools/vm was introduced in the 3.4 kernel version
> > > +KVER_MAJOR_MIN = 3
> > > +KVER_MINOR_MIN = 4
> > > +
> > > +# Starting from 6.3 kernel version mm tools are located at tools/mm folder
> > > +# instead of tools/vm
> > > +KVER_MAJOR_MM = 6
> > > +KVER_MINOR_MM = 3
> > > +
> > > +define MM_BUILD_CMDS
> > > +	$(Q)if [ $(KVER_MAJOR) -lt $(KVER_MAJOR_MIN) ] || \
> > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MIN) -a \
> > > +		  $(KVER_MINOR) -lt $(KVER_MINOR_MIN) ]; then \
> > > +		echo -n "Your kernel version $(KVER_MAJOR).$(KVER_MINOR) is "; \
> > > +		echo "too old and doesn't have the mm tools." ; \
> > > +		echo -n "At least $(KVER_MAJOR_MIN).$(KVER_MINOR_MIN) "; \
> > > +		echo "kernel must be used." ; \
> > > +		exit 1 ; \
> > > +	fi
> > > +
> > > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > > +		MM=mm; \
> > > +	else \
> > > +		MM=vm; \
> > > +	fi; \
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > > +		$(MM_MAKE_OPTS) $${MM}
> > > +endef
> > > +
> > > +define MM_INSTALL_TARGET_CMDS
> > > +	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
> > > +		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
> > > +		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
> > > +		MM=mm; \
> > > +	else \
> > > +		MM=vm; \
> > > +	fi; \
> > > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
> > > +		$(MM_MAKE_OPTS) \
> > > +		INSTALL_ROOT=$(TARGET_DIR) \
> > > +		DESTDIR=$(TARGET_DIR) \
> > > +		$${MM}_install
> > > +endef
> > > -- 
> > > 2.36.0
> > > 
> > 
> > -- 
> > Thank you,
> > Dmitry
> 
> -- 
> Thank you,
> Dmitry

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
