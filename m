From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 12:23:45 +0100
Subject: [Buildroot] [PATCH for-2012.11 0/5] Introduce errors for legacy
	API
In-Reply-To: <1352750912-16012-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 12 Nov 2012 21:08:27 +0100")
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
Message-ID: <87wqxn5cu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout>  This patch series introduces a mechanism to give relatively
 Arnout> clear error messages when legacy API is used. The first patch
 Arnout> introduces the mechanism, subsequent messages use it to report
 Arnout> each of the API changes since 2012.08.

Cool, thanks!

 Arnout>  Config options that are no longer supported are moved to
 Arnout> Config.in.legacy.  When any of these is selected in an old
 Arnout> .config file, a comment will appear to warn the user of it, and
 Arnout> it is possible to see which option caused the error in the new
 Arnout> 'Check legacy' menu.  Unselecting that menuconfig disables all
 Arnout> the legacy options in one go.

Is there ever any use case for not checking for legacy stuff?

I like it, the only problem is that the legacy warnings are shown as
options when they are really warnings/instructions to the user about
what has changed/what needs to get fixed.

I played around with making the options hidden and instead display a
comment when it is selected - E.G:

config BR2_PACKAGE_LIBINTL
	bool
	select BR2_LEGACY
	select BR2_PACKAGE_GETTEXT

config BR2_PACKAGE_LIBINTL
	bool
	select BR2_LEGACY
	select BR2_PACKAGE_GETTEXT

if BR2_PACKAGE_LIBINTL
comment "libintl is now installed by selecting"
comment "BR2_PACKAGE_GETTEXT. This now only installs the"
comment "library, not the executables."
endif

The syntax is not so nice as kconfig doesn't support multi line
comments, but OK. More importantly, hidden symbols like
BR2_PACKAGE_LIBINTL seems to be ignored when the .config is read (which
is what we normally want so they can be disabled again) so this only
works when a custom package selects BR2_PACKAGE_LIBINTL, not if the user
has manually enabled it.

Anybody with a better idea?

 Arnout>  If any such option remains, 'make' will fail immediately with
 Arnout> a message that legacy options are still selected.  However, if
 Arnout> BR2_DEPRECATED is selected, that error message is suppressed.

Would it make sense to still warn (but not halt) when DEPRECATED is
enabled?

 Arnout> - BR2_INET_RPC: since packages 'depend on' this option, there
 Arnout> is really no way to detect that some Config.in is still using
 Arnout> it.  The result will be that some packages are just not
 Arnout> selectable. Hopefully that's enough of a hint for users to find
 Arnout> the issue.

 Arnout> - xtensa: since there are patches on the list to re-introduce
 Arnout> xtensa, I haven't added it to Config.in.legacy. If these xtensa
 Arnout> patches don't make it into 2012.11, then there probably should
 Arnout> be a Config.in.legacy for it.

I'll try to get xtensa in.

-- 
Bye, Peter Korsgaard
