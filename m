From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 13:12:08 +0200
Subject: [Buildroot] [PATCH v2] package/net-tools: fix static linking
	issue with lintl
In-Reply-To: <1464462121-24585-1-git-send-email-romain.naour@gmail.com>
 (Romain Naour's message of "Sat, 28 May 2016 21:02:01 +0200")
References: <1464462121-24585-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87d1o2zdkn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When net-tools are build with uClibc-ng and statically linked,
 > some tools like hostname and route needs to link with -lintl.

 > Adding -lintl in LDFLAGS place the library before object files:
 > arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o

 > Add $(LIBS) after object files in the Makefile to place -lintl correctly.

 > Rework NET_TOOLS_BUILD_CMDS to set LDFLAGS with only TARGET_LDFLAGS and
 > set LIBS with -lintl when needed.

 > Fixes:
 > http://autobuild.buildroot.net/results/134/1345b6d366125320b89512e7ce7f142f1a03acf8

 > Ref:
 > http://lists.busybox.net/pipermail/buildroot/2016-May/162216.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > v2: Remove -lintl from LDFLAGS add add LIBS in the Makefile after object files
 >     (ThomasP)

Committed, thanks.

> @@ -37,7 +35,9 @@ NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
 
 >  define NET_TOOLS_BUILD_CMDS
 >  	$(TARGET_MAKE_ENV) AR="$(TARGET_AR)" CC="$(TARGET_CC)" \
 > -		LDFLAGS="$(NET_TOOLS_LDFLAGS)" $(MAKE) -C $(@D)
 > +		LDFLAGS="$(TARGET_LDFLAGS)" \
 > +		LIBS="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)" \
 > +		$(MAKE) -C $(@D)

Seperate from this patch, but can't we use TARGET_CONFIGURE_OPTS here
instead of passing AR/CC/LDFLAGS separately?

-- 
Bye, Peter Korsgaard
