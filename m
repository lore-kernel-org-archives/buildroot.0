From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 17:34:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/powertop: needs ncursesw
In-Reply-To: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150327173446.779683cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 27 Mar 2015 17:01:36 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/913/913cea22f8a8f5902d8da5f64c3fce056d66790f/
> http://autobuild.buildroot.net/results/6e1/6e11fa2a7405a69c59ced046b92ff08660c4aab7/
> http://autobuild.buildroot.net/results/1d3/1d3323b2afaefa7989854dbccf92015731199e66/
> http://autobuild.buildroot.net/results/1e3/1e31d412d8b3a38a375ad0be8f696bee993ec297/
> http://autobuild.buildroot.net/results/2ff/2ff511eb8d00b94aca68427446e2d0f6e4317a5a/
> and maybe others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I am not sure about this patch. I believe there might be a bug in the
powertop configure.ac script. It's doing:

PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS="$LIBS $ncurses_LIBS"], [
        AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
                AC_MSG_ERROR([ncurses is required but was not found])
        ], [])
])

So, when using PKG_CHECK_MODULES(), it wants both ncursesw and ncurses.
But if that fails, it tests with AC_SEARCH_LIBS(), but in this case, it
is looking for either ncursesw *or* ncurses.

Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
