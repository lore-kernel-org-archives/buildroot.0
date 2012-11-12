From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 12 Nov 2012 21:08:27 +0100
Subject: [Buildroot] [PATCH for-2012.11 0/5] Introduce errors for legacy API
Message-ID: <1352750912-16012-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This patch series introduces a mechanism to give relatively clear error
messages when legacy API is used. The first patch introduces the mechanism,
subsequent messages use it to report each of the API changes since 2012.08.

 Config options that are no longer supported are moved to Config.in.legacy.
When any of these is selected in an old .config file, a comment will appear
to warn the user of it, and it is possible to see which option caused the
error in the new 'Check legacy' menu.  Unselecting that menuconfig disables
all the legacy options in one go.

 If any such option remains, 'make' will fail immediately with a message
that legacy options are still selected.  However, if BR2_DEPRECATED is
selected, that error message is suppressed.

 To see this in action, do 'echo BR2_PACKAGE_LIBINTL >> .config' and run
make menuconfig; make.

 A new Makefile.in.legacy makes it possible to add make infrastructure
that warns about features that no longer exist.  Two examples are the
GENTARGETS macro (moved from package/Makefile.in) and the host-pkg-config
target.

 I've tried to find all the API changes since 2012.08, by looking at the
diffstat.  I probably didn't find them all, but it's better than nothing.

 There are two changes for which I don't have a solution.

- BR2_INET_RPC: since packages 'depend on' this option, there is really
no way to detect that some Config.in is still using it.  The result will
be that some packages are just not selectable. Hopefully that's enough
of a hint for users to find the issue.

- xtensa: since there are patches on the list to re-introduce xtensa,
I haven't added it to Config.in.legacy. If these xtensa patches don't
make it into 2012.11, then there probably should be a Config.in.legacy
for it.

 Regards,
 Arnout
