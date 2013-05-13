From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 19:09:03 -0300
Subject: [Buildroot] [PATCH 1/6] package infra: remove CPPFLAGS from
	CFLAGS
In-Reply-To: <20130513202047.6bd6da1b@skate>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <20130513191016.15f0a3f4@skate> <51912140.8030901@zacarias.com.ar>
 <20130513202047.6bd6da1b@skate>
Message-ID: <5191647F.6010408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/13/2013 03:20 PM, Thomas Petazzoni wrote:
> I believe there should be first an audit of where TARGET_CFLAGS is
> used. Then, wherever needed, fixes to ensure both TARGET_CFLAGS and
> TARGET_CPPFLAGS are used (or, if possible, usage of
> TARGET_CONFIGURE_OPTS). Once those fixes are made, your patch that
> separates TARGET_CPPFLAGS from TARGET_CFLAGS can go in.
> 
> A quick "grep TARGET_CFLAGS" in package/ gives 110 packages using it.
> In most cases, it's probably $(TARGET_CONFIGURE_OPTS) being passed +
> CFLAGS="$(TARGET_CFLAGS) -bleh", which is already correct seems
> CPPFLAGS is passed. But of course there might be packages that use a
> custom Makefile that obeys to CFLAGS but not CPPFLAGS. Not sure what we
> can do about these except slowly figuring out that they need fixing.

Looking into generic packages which are the most likely to have
differences because of custom Makefiles the general majority don't seem
to understand CPPFLAGS, so other than doing
SOMETHING="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" there doesn't seem to be
much to do about it.
We could define a TARGET_GENERIC_CFLAGS == TARGET_CPPFLAGS +
TARGET_CFLAGS (like now) or something like that and make those package
use that, after all it's the auto* packages that have issues with that.
On the other hand it's a nice opportunity for some miscellaneous
cleanups like using $(INSTALL) instead of install, removing redundant
*_SOURCE definitions and stuff like that.
Regards.
