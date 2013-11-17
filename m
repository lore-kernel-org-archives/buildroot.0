From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 18:27:17 +0100
Subject: [Buildroot] [PATCH] vim: fix gettext check
In-Reply-To: <0d216d9aa9ecfc7dbb82.1384679162@argentina> (Thomas De
 Schampheleire's message of "Sun, 17 Nov 2013 10:06:02 +0100")
References: <0d216d9aa9ecfc7dbb82.1384679162@argentina>
Message-ID: <87ob5jx7ka.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Fixes http://autobuild.buildroot.net/results/21b5a910e6a27fa1cb12d0002ffed7e6ed9d6c83/

As that URL doesn't currently work, could you explain a bit what the
problem is?

I've tried building it with a number of different toolchain
configurations, and don't seem to be able to trigger the issue.

I see that vim.mk doesn't do anything with gettext. Shouldn't it atleast
make sure it gets built after gettext if enabled and/or select gettext
if BR2_NEEDS_GETTEXT_IF_LOCALE?

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 >  package/vim/vim-0001-fix-nls-check.patch |  120 +++++++++++++++++++++++++++
 >  1 files changed, 120 insertions(+), 0 deletions(-)

 > diff --git a/package/vim/vim-0001-fix-nls-check.patch b/package/vim/vim-0001-fix-nls-check.patch
 > new file mode 100644
 > --- /dev/null
 > +++ b/package/vim/vim-0001-fix-nls-check.patch
 > @@ -0,0 +1,120 @@
 > +configure: use minimal LIBS during gettext check
 > +
 > +In some configurations, vim fails to link correctly with messages such as:
 > +edit.c:(.text+0x1614): undefined reference to `libintl_gettext'
 > +
 > +In particular, this has been seen by the buildroot autobuilds (see [1]) but
 > +has also been reported at [2] and [3].
 > +
 > +In the bad case, the configure script says:
 > +checking for NLS... gettext() works
 > +In the good case, it says:
 > +checking for NLS... gettext() works with -lintl
 > +
 > +In the bad case, the system has libelf, vim detects that and takes it along
 > +in $LIBS. Libelf needs libintl on this system, and so linking the test
 > +program with -lelf will automatically take -lintl too. This causes configure
 > +to think gettext() does not need libintl, while in reality it does.
 > +
 > +In the good case, libelf is not present and thus not used. The first
 > +configure test for gettext fails, and then configure retries with -lintl
 > +(which succeeds).
 > +
 > +Until now, there isn't really a problem. In both cases, you could link
 > +correctly. In the 'bad' case, libintl is implicitly taken through libelf, in
 > +the second case it is explicitly taken.
 > +
 > +The real problem occurs because configure also tests whether the linker
 > +supports --as-needed and uses it when possible, instead of the link.sh
 > +script. However, --as-needed seems to cause libintl NOT to be taken in the
 > +bad case, causing the undefined references to libintl_gettext.
 > +
 > +This patch changes the configure script so that the gettext check does not
 > +use additional libraries such as libelf. The test program is linked either
 > +with nothing, or with libintl alone. This will cause libintl to
 > +be added explicitly to LIBS, when needed.
 > +
 > +[1] http://autobuild.buildroot.net/results/21b5a910e6a27fa1cb12d0002ffed7e6ed9d6c83/
 > +[2] http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2012-November/243930.html
 > +[3] http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2012-May/234184.html

-- 
Bye, Peter Korsgaard
