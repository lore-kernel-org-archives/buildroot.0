From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 7 Jul 2008 16:07:29 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48721E5F.3030306@atmel.com>
References: <20080704222950.E76B63C61F@busybox.net>
	<873aml7ru0.fsf@macbook.be.48ers.dk>
	<48721947.9020804@atmel.com> <20080707134115.GF15840@mx.loc>
	<48721E5F.3030306@atmel.com>
Message-ID: <20080707140729.GG15840@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 07, 2008 at 03:47:11PM +0200, Ulf Samuelsson wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Bernhard Fischer skrev:
>> On Mon, Jul 07, 2008 at 03:25:27PM +0200, Ulf Samuelsson wrote:
>> [snip ugly log target]
>>>> As mentioned earlier, it doesn't work with Makefile.autotools.in using
>>>> packages.
>>>>
>>> Yes, but that is really not a good implementation.
>>> The MAKELEVEL has really nothing to do with what you
>>> want to use it for, it just happens to work, but
>>> this implementation is easily broken.
>> 
>> I have to agree to Ulf in this respect, fwiw.
>> Peter, why did you have to take MAKELEVEL into account? Perhaps we can
>> fix this in a better way.. (pointing me to a detailed commit-message or
>> to the ML archives is sufficient)
>
>This is my proposal (which started this thread),
>but I would like you guys to comment.
>
>Index: Makefile
>===================================================================
>- --- Makefile	(revision 22671)
>+++ Makefile	(arbetskopia)
>@@ -346,10 +346,10 @@
> source: $(TARGETS_SOURCE) $(HOST_SOURCE)
>
> _source-check:
>- -	$(MAKE) SPIDER=--spider source
>+	$(MAKE) FORCE_DOWNLOAD=y SPIDER=--spider source

No, this is not acceptable.
>
> external-deps:
>- -	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)toolchain/wget-show-external-deps.sh \
>+	@$(MAKE) FORCE_DOWNLOAD=y -Bs

>BR2_WGET=$(TOPDIR)toolchain/wget-show-external-deps.sh \
> 	source
>
>Index: package/Makefile.autotools.in
>===================================================================
>- --- package/Makefile.autotools.in	(revision 22671)
>+++ package/Makefile.autotools.in	(arbetskopia)
>@@ -131,7 +131,7 @@
> # Retrieve and unpack the archive
> $(BUILD_DIR)/%/.stamp_downloaded:
> # support make source-check/external-deps
>- -ifeq ($(MAKELEVEL),1)
>+ifeq ($(FORCE_DOWNLOAD),y)
> 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
> 	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
> else

What are you trying to do, Peter? source-check should work just fine,
even for autotools.in
