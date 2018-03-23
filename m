From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 21:54:50 +0100
Subject: [Buildroot] [PATCH v3 0/5] New pkg-stats script,
 with version information
Message-ID: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series rewrites the pkg-stats script in Python, and adds two new
very useful information to it:

 - The current version of each package in Buildroot

 - The latest upstream version of each package, as provided by the
   release-monitoring.org web site.

The script then compares the current version in Buildroot with the
latest upstream version, and tells whether they are different.

The code is available at:

 https://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=pkg-stats-v3

Changes since v2
================

 - Take into account patches in sub-directories in
   add_patch_count(). Comment from Ricardo.
 - Fix get_check_package_warnings() which was not appending the full
   file path to be checked. Comment from Ricardo.
 - Use subprocess.Popen() instead of subprocess.check_output() in
   get_check_package_warnings(). Comment from Ricardo.
 - Move a lot of the logic as methods of the Package() class.
 - Use the "timeout" argument of urllib2.urlopen() in order to make
   sure that the requests terminate at some point, even if
   release-monitoring.org is stuck.
 - Address Ricardo's concern about printvars variable sorting affecting
   the version reported: we now parse all HOST_*_VERSION variables
   first, and then all *_VERSION variables, ensuring that the target
   version of a package wins.
 - Limit length of version string to 20 characters, as suggested by
   Ricardo.
 - Indicate in help text that the list of packages is
   comma-separated. Comment from Ricardo.
 - Fix typo in commit log. Comment from Ricardo.
 - Added Reviewed-by from Ricardo.

Changes since v1
================

This version mainly focuses on fixing the numerous comments and issues
pointed out by Ricardo Martincoski (many thanks for his very detailed
and useful review!), and also fixes a few other things:

 - Added copyright notice in the new script

 - Fixed all flake8 warnings (I still personally find the "let's force
   to have two empty lines between every function" a very silly rule,
   but well)

 - Pass the package path to the Package() constructor directly

 - Only introduce CSS properties when they are really needed (some
   were introduced in PATCH 1, but they were only really used by later
   patches)

 - Fix the broken #results internal link, which now properly points to
   the statistics table.

 - Remove double </table> tag.

 - Fix the sorting of the table by defining __eq__ and __lt__ in
   Package(), and make 'packages' a list rather than a dict.

 - Add the build date and git commit in the HTML page footer

 - Pass BR2_HAVE_DOT_CONFIG=y when calling make, in order to fake
   having a .config. This allows "printvars" to dump all variables
   even without a .config.

 - Add newlines in the HTML to make it readable.

More details
============

release-monitoring.org is a very useful web site, monitoring more than
16000 projects. It is also very easy to add new projects to be
monitored. It supports monitoring projects on popular hosting
platforms such as Github, but can also monitor plain HTTP folders, or
even web pages using a regexp to identify what is a version number
within the HTML blurb.

Projects can be found by regular search, but it is also possible to
add a mapping between the name of a package in a given distribution,
and the name of the package as known by release-monitoring.org. For
example in Buildroot "samba" is not named "samba" but "samba4", and
this mapping mechanism allows release-monitoring.org to reply to
requests for samba4 within the Buildroot distribution.

I had very good interactions with the release-monitoring.org
maintainers:

 - They are easily available on IRC

 - They created the "Buildroot" distribution within minutes,
   https://release-monitoring.org/distro/Buildroot/.

 - They have been very responsive to fix issues in existing packages.

It doesn't provide CVE related information for security, so it would
still be useful to extend this mechanism with another CVE related
database. But as we discussed during the last Buildroot meeting in
Brussels, the NIST database is not very up to date, while
release-monitoring.org, thanks to the process being fully automated.

Before people start sending gazillions of patches to update packages,
I would like us to focus on:

 - Adding missing projects on release-monitoring.org

 - Adding missing mappings for the Buildroot distribution on
   release-monitoring.org

 - Deciding how to handle packages such as all python-* packages or
   all x11r7 packages, for which the name never matches with the
   release-monitoring.org package name.

   Do we create a mapping for each of them on release-monitoring.org
   (which we would have to do for every new python package) or do we
   make the script smarter, and attempt to search the package without
   its python- prefix (which won't always work either) ?

Basically, I would like to focus on making the output of the script
more useful/relevant, and then only start getting gazillions of
patches updating packages.

Thanks for your review, and contributions!

Thomas

Thomas Petazzoni (5):
  support/scripts/pkg-stats-new: rewrite in Python
  support/scripts/pkg-stats-new: add -n and -p options
  support/scripts/pkg-stats-new: add current version information
  support/scripts/pkg-stats-new: add latest upstream version information
  support/scripts/pkg-stats: replace with new Python version

 support/scripts/pkg-stats | 997 ++++++++++++++++++++++++++++------------------
 1 file changed, 603 insertions(+), 394 deletions(-)

-- 
2.14.3
