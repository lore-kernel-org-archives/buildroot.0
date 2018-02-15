From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 23:03:40 +0100
Subject: [Buildroot] [PATCH next 0/5] New pkg-stats,
 with upstream version comparison
Message-ID: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
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

You can see the script output at:

 https://bootlin.com/~thomas/stats.html

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
release-monitoring.org is very up to date, thanks to the process being
fully automated.

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

The code is also available at:

  https://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=pkg-stats

As usual, I'm not a Python programmer, so the Python code is probably
horrible. Comments welcome.

Thanks for your review, and contributions!

Thomas

Thomas Petazzoni (5):
  support/scripts/pkg-stats-new: rewrite in Python
  support/scripts/pkg-stats-new: add -n and -p options
  support/scripts/pkg-stats-new: add current version information
  support/scripts/pkg-stats-new: add latest upstream version information
  support/scripts/pkg-stats: replace with new Python version

 support/scripts/pkg-stats | 946 ++++++++++++++++++++++++++--------------------
 1 file changed, 539 insertions(+), 407 deletions(-)

-- 
2.14.3
