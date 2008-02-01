From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Fri, 1 Feb 2008 04:40:35 -0500 (EST)
Subject: [Buildroot] make clean not so clean
In-Reply-To: <20080201082056.GA32415@aon.at>
References: <214360.55769.qm@web56410.mail.re3.yahoo.com>
	<1201844203.3526.46.camel@localhost.localdomain>
	<20080201082056.GA32415@aon.at>
Message-ID: <alpine.LFD.1.00.0802010432040.9087@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 1 Feb 2008, Bernhard Fischer wrote:

> On Fri, Feb 01, 2008 at 12:36:43AM -0500, Ormund Williams wrote:
> >On Thu, 2008-01-31 at 21:02 -0800, jake sullivan wrote:
> >> I'm not sure how to go about fixing this, but I have been able to
> >> recreate an annoying little bug (that I think is the source of a
> >> number of other newb problems).
> >>
> >...(snip)...
> >> My gut says to update "make clean" to delete all the config files (and
> >> basically everything but the source files), but before I put work into
> >> making and testing a patch, I want to make sure that is the right
> >> approach...
> >>
> >Don't know about "Right Appraach", but I just locate my download
> >directory outside the Buildroot tree.
> >
> >Under: Build Options --->
> >
> >	$(BASE_DIR)/../dl) Download dir
>
> This historical behaviour is indeed annoying. Note that distclean only
> deletes the DL_DIR if it is set to the default ("$(BASE_DIR)/dl"). I
> usually set it to $(BASE_DIR)/down due to this slightly inconvenient
> behaviour.
>
> Changing this behaviour is easy, but how should DL_DIR be
> cleaned-out? make dl-clean? Suggestions for a better name for the
> target?

this drove me a bit nuts when i first started working with OpenWrt
but, as much as it pains me to say it, i think the current behaviour
is the correct one -- "make distclean" is historically understood to
mean, "clean right down to the original distribution", and that
absolutely involves getting rid of downloaded sources *if they've been
placed in that directory*.

the only reasonable solution is to somehow emphatically recommend to
users to keep their downloaded sources elsewhere (which is a good
idea, anyway).  i don't see the need for an extra target that covers
the downloads directory.

p.s.  one potentially hideous solution is to not specify a default
location for the downloads directory and *force* the user to pick an
initial location, at which point you can warn him/her.  but that
strikes me as overly annoying, so maybe forget that plan.

rday
--
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
========================================================================
