From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Mar 2018 11:52:47 +0100
Subject: [Buildroot] [PATCH 2/4] core: find a host UTF-8 locale
In-Reply-To: <c2f2c7e21fd7be4dca60419a2aec0d69135550e6.1520159327.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 4 Mar 2018 11:29:04 +0100")
References: <cover.1520159327.git.yann.morin.1998@free.fr>
 <c2f2c7e21fd7be4dca60419a2aec0d69135550e6.1520159327.git.yann.morin.1998@free.fr>
Message-ID: <87fu5g9kow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some packages really want to use an UTF-8 locale, or they break.
 > However, there is no guarantee that any given locale is available on a
 > system. For example,, while most mainstream distros (Debian and
 > derivatives, Fedora...) do have the generic, language-agnostic C.UTF-8
 > locale, Gentoo does not provide it.

 > So, find the first UTF-8 locale available on the system, and take any
 > that is available. We however do favour using the user-set current
 > locale, then using the language-agnostic C.UTF-8, and eventually any
 > random C.UTF-8 locale.

I guess this should be 'random UTF-8 locale', so I changed it to that.
 
 > +ifeq ($(BR2_NEEDS_HOST_UTF8_LOCALE),y)
 > +# First, we try to use the user's configured locale (as that's the
 > +# language they'd expect messages to be displayed), then we favour
 > +# a non language-specific locale like C.UTF-8 if one is available,
 > +# so we sort with the C locale to get it at the top.
 > +# This is guaranteed to not be empty, because of the check in
 > +# support/dependencies/dependencies.sh
 > +HOST_UTF8_LOCALE := $(shell \
 > +			( echo $${LC_ALL:-$${LC_MESSAGES:-$${LANG}}}; \
 > +			  locale -a 2>/dev/null |LC_ALL=C sort \
 > +			) \
 > +			|grep -i -E 'utf-?8' \

For consistency with dependencies.sh I changed the regexp to 'utf-?8$'.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
