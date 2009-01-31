From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 31 Jan 2009 22:55:00 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <871vujkw9s.fsf@macbook.be.48ers.dk>
References: <20090131183956.11B4D7621A@busybox.osuosl.org>
	<1233435146.4147.118.camel@elrond.atmel.com>
	<871vujkw9s.fsf@macbook.be.48ers.dk>
Message-ID: <1233438900.4147.128.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-31 klockan 22:20 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> l?r 2009-01-31 klockan 18:39 +0000 skrev jacmet at uclibc.org:
>  >> Author: jacmet
>  >> Date: 2009-01-31 18:39:55 +0000 (Sat, 31 Jan 2009)
>  >> New Revision: 25181
>  >> 
>  >> Log:
>  >> dbus: revert to pre-r25021 situation
>  >> 
>  >> Revert to pre-r25021 situation, but add extra comments explaining the
>  >> situation.
>  >> 
>  >> Modified:
>  >> trunk/buildroot/package/dbus/dbus.mk
> 
>  Ulf> Why are you doing this?
> 
>  Ulf> You are AGAIN breaking boards...
> 
> What? What is broken? A wee bit more detail would be handy.
> 

The problem is that you make dbus depend on expat/libxml2.

To build dbus, you need to do a number of things

extract
patch
configure
make
install staging dir
install target
dbus = "ready"

If you make "dbus" depend on "libxml2", then 
libxml2 can be built at ANY time between start of make
until the "dbus" install target rule is executed
which will complete the dbus build.

"dbus" needs to have access to the libraries already
at "configure" time, or the build will abort.
It so happens that "dbus" configure starts before
libxml2 is built for some unclear reason.

Therefore *?"dbus-configured"* meeds to be dependent on 
"expat" | "libxml2".

Then they are built before the configure starts
and the build will complete without errors.

You were right that it is OK to depend on libxml2|expat
instead of strange libraries/goals.
but the solution was not complete which broke the build.

BR
Ulf Samuelsson


> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
