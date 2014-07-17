From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Jul 2014 21:43:30 -0300
Subject: [Buildroot] [PATCH 3/7 v3] package/ncurses: Allow building wide
 char support
In-Reply-To: <53C717D0.6090907@ozlabs.org>
References: <1402982507.184990.682485888591.3.gpush@pablo>
 <53B6DD23.9040605@zacarias.com.ar>
 <CAAXf6LWC_CzguzqpnLbAvyHedqVf6chkZhJYELzmfFjhnq0z7g@mail.gmail.com>
 <53C717D0.6090907@ozlabs.org>
Message-ID: <53C71C32.9030806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/16/2014 09:24 PM, Jeremy Kerr wrote:

> Sure, will do.
> 
> Gustavo - is this breakage simply with BR2_PREFER_STATIC_LIB? or is
> there some better way to reproduce this issue, so I can ensure my new
> patch fixes this?
> 
> Thanks,

Hi Jeremy, thanks for getting back.
A quick fix would be:

----
ifeq ($(BR2_PREFER_STATIC_LIB),y)
define NCURSES_LINK_LIBS
        for lib in $(NCURSES_LIBS-y); do \
                ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
                        $(1)/usr/lib/$${lib}.a; \
        done
endef
else
define NCURSES_LINK_LIBS
        for lib in $(NCURSES_LIBS-y); do \
                ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
                        $(1)/usr/lib/$${lib}.so; \
        done
endef
endif
----

The only scenario that i could fail with static builds is blackfin with
flat targets, the ncurses widechar build breaks in a very odd way, which
i exclude via:

----
config BR2_PACKAGE_NCURSES_WCHAR
        bool "enable wide char support"
        depends on BR2_USE_WCHAR
        # Build broken @ curses.priv.h with bad declarations
        depends on !(BR2_bfin && BR2_BINFMT_FLAT)
        help
          Enable wide char & UTF-8 support in ncurses libraries
----

Unless someone wants to dig deep into that breakage and fix it i guess
it's fine to exclude that combination.
Regards.
