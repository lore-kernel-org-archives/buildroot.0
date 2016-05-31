From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 08:53:00 +0200
Subject: [Buildroot] [PATCH] inputevent: add package
In-Reply-To: <20160530205708.GA17960@airbook.vandijck-laurijssen.be> (Kurt Van
 Dijck's message of "Mon, 30 May 2016 22:57:08 +0200")
References: <20160530063545.GA31737@airbook.vandijck-laurijssen.be>
 <8760tv3azo.fsf@dell.be.48ers.dk>
 <20160530205708.GA17960@airbook.vandijck-laurijssen.be>
Message-ID: <878tyq1zxv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

Hi,

 >> I see you are the author of this tool, but does this tool provide
 >> anything more than evtest (besides perhaps a bit easier to parse
 >> output)?

 > The easier to parse output is helps to pipe it in scripts like:

 > 	while read TIME TYPE VALUE; do
 > 	case "$TYPE:$VALUE" in
 > 	KEY_PLAY:0)
 > 		mpc play
 > 		;;
 > 	esac

True. evtest is not too bad to parse either though:

while read EVENT T TIME T T TYPE T T CODE T VALUE; do
    case "$EVENT" in
	Event:)
	    echo TIME=$TIME TYPE=$TYPE CODE=$CODE VALUE=$VALUE
	    ;;
    esac
done

 > second, it supports to control such script as child,
 > making it easy to integrate in a service monitor that just
 > monitors the inputevent program, without the need to monitor
 > the child script.

 > So I combined evtest-like functionality with a focus on deployment,
 > integrating the tool in a functional system.

 > evtest is meant as an interactive tool or query a state.

 > I evalutated input-event-daemon and found that it distracts focus from the
 > overall functionality that I want. input-event-daemon is focused on
 > desktop-like systems, I target embedded systems that perform tasks
 > on GPIO inputs, who are delivered as input events.

 > Is it different enough?
 > If you look at how it integrates, then yes.
 > If you look at what it does, I agree that it appears very much alike.

I don't have any problems adding it, I just wanted to understand what it
does differently then evtest, which wasn't clear to me from your commit
message / help text.

>> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
 >> 
 >> How about passing $(TARGET_CONFIGURE_OPTS) to make instead of writing
 >> this config.mk?

 > Building outside of toplevel make, although I admit it is a bad reason.

 > I dropped autoconf long time ago, and use such config.mk includes, where
 > necessary. Is Target_CONFIGURE_OPTS available for non-autotools
 > packages?

Yes, have a look at package/Makefile.in. TARGET_CONFIGURE_OPTS is simply
a variable containing CC=.. CFLAGS=.. LD=.. that we also use to pass to
configure.

 >> Looking at the Makefile, I see it tries to figure out the version by
 >> calling git. When this is built in a buildroot git checkout (and
 >> inputevent is gotten from a github tarball) this will most likely use
 >> version info from the Buildroot git repo which doesn't sound correct.

 > Now that is a true problem.
 > I'll rework.

Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
