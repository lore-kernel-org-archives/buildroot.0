From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 15:25:04 +0100
Subject: [Buildroot] [PATCH] util-linux: fix ncurses/wchar handling
In-Reply-To: <1482500010-17042-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 23 Dec 2016 14:33:30 +0100")
References: <1482500010-17042-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mvfmg1tr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since commit 006a328ad6bed214ec3c4d92120510ea37329dd1 ("util-linux: fix
 > build with ncurses"), we have a build failure that occurs with musl
 > toolchains when wide-char support is not enabled in ncurses.

 > The problem comes from the fact that musl provides wchar support (so it
 > defines wchar_t). But when ncursesw is not available, we currently pass
 > --disable-widechar which tells util-linux that wchar support is not
 > available at all (not only in ncurses). When this gets passed to
 > util-linux configure script, then it defines its own wchar_t, which
 > conflicts with the musl definition.

 > So, we should not pass --disable-widechar when BR2_USE_WCHAR=y, which is
 > what this commit does: it moves the BR2_USE_WCHAR logic outside of the
 > ncurses logic, and passes --enable-widechar/--disable-widechar as
 > appropriate.

 > However, there's a gotcha: util-linux really wants the ncursesw variant
 > of ncurses when the system has wchar support enabled. We take this into
 > account by:

 >  - Enabling ncursesw when BR2_PACKAGE_NCURSES_WCHAR=y. In this case, we
 >    have ncurses and we have BR2_USE_WCHAR=y, so everything is fine.

 >  - Otherwise, enabling ncurses when BR2_PACKAGE_NCURSES=y but
 >    BR2_USE_WCHAR is disabled.

 > To make sure that the existing util-linux programs that need ncurses
 > support still build fine, we adjust the Config.in to select
 > BR2_PACKAGE_NCURSES_WCHAR on BR2_USE_WCHAR=y configurations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/19de2a0b12380ddc86dbba0dae3a3877b25f83ff/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
