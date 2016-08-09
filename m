From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 23:56:38 +0200
Subject: [Buildroot] [PATCH] ncurses: fix wide-char enabled compilation
 for noMMU targets
In-Reply-To: <7227BE30-A6E5-4184-ABFC-E15915CFEB07@gmail.com>
References: <20160731082850.GA30195@waldemar-brodkorb.de>
 <7227BE30-A6E5-4184-ABFC-E15915CFEB07@gmail.com>
Message-ID: <20160809235638.29981f7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 23:47:51 -0700, Khem Raj wrote:

> > ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
> > NCURSES_CONF_OPTS += --enable-widec
> > +# for noMMU we need to set it explicitely, fixes cchar_t problem
> > +NCURSES_CPPFLAGS += -D_XOPEN_SOURCE_EXTENDED  
> 
> May be you need to define NCURSES_WIDECHAR=1 instead

Cannot work (at least without patching) : it gets undef'ed by ncurses:

#undef NCURSES_WIDECHAR
#if defined(_XOPEN_SOURCE_EXTENDED) || defined(_XPG5)
#define NCURSES_WIDECHAR
#endif

But this test from ncurses is weird. My understanding of the feature
macros like _XOPEN_SOURCE_EXTENDED is that they should be *defined* by
the program/library that wants to use the specific features hidden
behind this macro. This is what
https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html
explains.

So why is ncurses *testing* this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
