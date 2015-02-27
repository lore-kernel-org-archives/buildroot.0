From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 16:10:24 +0100
Subject: [Buildroot] [PATCH] dstat: add missing runtime dependency for
	Python curses
In-Reply-To: <1424896278-3731-1-git-send-email-yegorslists@googlemail.com>
 (Yegor Yefremov's message of "Wed, 25 Feb 2015 21:31:18 +0100")
References: <1424896278-3731-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87twy71jbz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/dstat/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/dstat/Config.in b/package/dstat/Config.in
 > index 63db87b..66a9789 100644
 > --- a/package/dstat/Config.in
 > +++ b/package/dstat/Config.in
 > @@ -4,6 +4,7 @@ config BR2_PACKAGE_DSTAT
 >  	depends on BR2_USE_MMU # python
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 >  	select BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_PYTHON_CURSES # runtime

From the dstat source it seems like python-curses isn't required, so
this is wrong:

def gettermcolor(color=True):
    "Return whether the system can use colors or not"
    if color and sys.stdout.isatty():
        try:
            import curses
            curses.setupterm()
            if curses.tigetnum('colors') < 0:
                return False
        except:
            print >>sys.stderr, 'Color support is disabled, python-curses is not installed.'
            return False
    return color

-- 
Bye, Peter Korsgaard
