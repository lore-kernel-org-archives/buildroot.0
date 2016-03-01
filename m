From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 21:01:39 +0100
Subject: [Buildroot] [PATCH] slang: fix static link with readline
In-Reply-To: <dc4fefb45e684d66ad20ead359029860d48ba898.1456859363.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 1 Mar 2016 21:09:23 +0200")
References: <dc4fefb45e684d66ad20ead359029860d48ba898.1456859363.git.baruch@tkos.co.il>
Message-ID: <87povej7bw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > slang forgets ncurses that is a dependency of readline when linking the

s/forgets/forgets to link with/

> slsh binary. Correct this.


 > While at it, also make sure to use staging ncurses5-config script and not the
 > host one. slang uses ncurses5-config to find terminfo location, and only
 > staging ncurses5-config provides the correct run-time location.

 > Fixes:
 > http://autobuild.buildroot.net/results/1dc/1dc52048254c32a24070fef1c1039cebb32e7ac1/
 > http://autobuild.buildroot.net/results/c17/c176511cbb147c2d8cb0ec0ff3c1612ce8971cb8/
 > http://autobuild.buildroot.net/results/78d/78dc2ba07b1d7f888aab94e223f3e0b1a1df3af5/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2:
 >    * Use ncurses5-config to get ncurses link flags (Peter)

 >    * Move static build handling into the readline block (Peter)

 >    * Clarify title and commit log
 > ---
 >  package/slang/slang.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/slang/slang.mk b/package/slang/slang.mk
 > index 1a7576afc363..9078bf293c5a 100644
 > --- a/package/slang/slang.mk
 > +++ b/package/slang/slang.mk
 > @@ -40,6 +40,7 @@ endif
 
 >  ifeq ($(BR2_PACKAGE_NCURSES),y)
 >  SLANG_DEPENDENCIES += ncurses
 > +SLANG_CONF_ENV += ac_cv_path_nc5config=$(STAGING_DIR)/usr/bin/ncurses5-config
 >  else
 >  SLANG_CONF_OPTS += ac_cv_path_nc5config=no

It's a bit odd that we pass it in _OPTS to disable but in _ENV to
enable. I guess we should pass it in _ENV in both situations - But ok,
that can be a seperate patch.

Committed, thanks.

-- 
Bye, Peter Korsgaard
