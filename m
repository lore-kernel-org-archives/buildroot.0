From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 23:26:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <1233438900.4147.128.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sat\, 31 Jan 2009 22\:55\:00 +0100")
References: <20090131183956.11B4D7621A@busybox.osuosl.org>
	<1233435146.4147.118.camel@elrond.atmel.com>
	<871vujkw9s.fsf@macbook.be.48ers.dk>
	<1233438900.4147.128.camel@elrond.atmel.com>
Message-ID: <87fxizjen1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Why are you doing this?
 >> 
 Ulf> You are AGAIN breaking boards...
 >> 
 >> What? What is broken? A wee bit more detail would be handy.
 >> 

 Ulf> The problem is that you make dbus depend on expat/libxml2.

No, I make the configure target of dbus depend on expat/libxml2 being
installed into staging.

 Ulf> To build dbus, you need to do a number of things

 Ulf> extract
 Ulf> patch
 Ulf> configure
 Ulf> make
 Ulf> install staging dir
 Ulf> install target
 Ulf> dbus = "ready"

 Ulf> If you make "dbus" depend on "libxml2", then 
 Ulf> libxml2 can be built at ANY time between start of make
 Ulf> until the "dbus" install target rule is executed
 Ulf> which will complete the dbus build.

Which is why I don't do that.

 Ulf> "dbus" needs to have access to the libraries already
 Ulf> at "configure" time, or the build will abort.
 Ulf> It so happens that "dbus" configure starts before
 Ulf> libxml2 is built for some unclear reason.

Because the dbus makefile is listed before the libxml2 one.

 Ulf> Therefore *?"dbus-configured"* meeds to be dependent on 
 Ulf> "expat" | "libxml2".

Almost, it needs to depend on a non-phony target providing the
expat/libxml2 library/headers in staging dir.

 Ulf> Then they are built before the configure starts
 Ulf> and the build will complete without errors.

 Ulf> You were right that it is OK to depend on libxml2|expat
 Ulf> instead of strange libraries/goals.
 Ulf> but the solution was not complete which broke the build.

Where isn't it complete? Your commit (besides removing valuable
comments) made dbus configure depend on the phony expat target instead
of the real rule, so dbus will alreads be considered out of date for
expat (just like for libxml2, but as the (deleted) comment states,
there's not much to do about that besides fixing up
Makefile.autotools.in which I DONT suggest we do before the release.

This should ofcourse be seen in the light of all your dbus.mk changes
since the 25th to "fix continous rebuilds" ;)

In other words, I don't see where I'm "AGAIN breaking boards..."

Just to check, I did a build of at91rm9200df_defconfig, and the dbus
build completed without any errors, so unless I hear otherwise from
you, I WILL revert your revert.

-- 
Bye, Peter Korsgaard
