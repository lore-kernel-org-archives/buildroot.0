From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 22:48:39 +0100
Subject: [Buildroot] [PATCHv7 3/5] core: allow external
	Config.in/makefile code to be integrated
In-Reply-To: <1386270673-16051-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 5 Dec 2013 20:11:11 +0100")
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386270673-16051-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bo0r9fpk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit allows the BR2_EXTERNAL directory to contain Config.in and
 > Makefile code, which gets integrated into the Buildroot build logic:

 >  - Buildroot automatically includes the $BR2_EXTERNAL/Config.in in the
 >    top-level configuration menu.

 >  - Buildroot automatically includes the BR2_EXTERNAL/external.mk in
 >    the build logic, so it can for example be used to include other .mk
 >    files that define package recipes.

 > This is typically intended to be used to create target packages in the
 > BR2_EXTERNAL directory, but can also be used for bootloaders, host
 > packages, or other custom make logic.

 > We also add a dummy Config.in file in support/dummy-external/ to
 > ensure that the source "$BR2_EXTERNAL/Config.in" line will point to an
 > existing file even when BR2_EXTERNAL is not used by the user.

[snip]

 > diff --git a/Config.in b/Config.in
 > index ea060bc..12d36b5 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -492,3 +492,5 @@ source "boot/Config.in"
 >  source "package/Config.in.host"
 
 >  source "Config.in.legacy"
 > +
 > +source "$BR2_EXTERNAL/Config.in"

Should we perhaps add a comment before or put this inside a 'menu' so it
is clear that these things are NOT part of Buildroot and people
shouldn't ask the buildroot list for support for them?

Having a comment / empty menu when this isn't use is a bit annoying, but
we could perhaps use:

    depends on BR2_EXTERNAL != "support/dummy-external"

I haven't tested if that works though.

-- 
Bye, Peter Korsgaard
