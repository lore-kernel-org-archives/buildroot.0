From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Mar 2014 18:42:59 +0100
Subject: [Buildroot] [RFC 0/3] Speeding up the Makefile parsing
Message-ID: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The current strategy of Buildroot with regard to .mk files is to
always include all of them. However, with an ever-increasing number of
packages, the number of .mk files to parse is growing significantly,
and this makes the execution of any trivial make target take at least
12 seconds on a relatively fast SSD equipped laptop. For example, a
simple thing like "make help" or "make external-deps" takes 12 seconds
solely because of the parsing time of more than a thousand of package
makefiles.

Of course, in a given configuration, the vast majority of these
package makefiles are not useful. The idea of this patch series is to
start the discussion on whether we can find a solution to only include
the makefiles that are actually useful for the current configuration,
at least for the packages.

The proposed RFC solution is to look at the BR2_PACKAGE_<foo>
variables, and from them derive the name of the package .mk files to
be included. It is a simple change in the main Makefile, but it has
two major consequences that we need to discuss on whether they are
acceptable or not:

 * We need to have BR2_PACKAGE_HOST_<foo> options for *all* host
   packages. Of course, the vast majority of them can be blind
   options, but it means that we have to ensure all the host packages
   are properly selected at the Config.in level. That's a fairly
   significant change.

 * Since the logic assume that BR2_PACKAGE_FOO is always
   package/foo/foo.mk, it means we have to 1/ guarantee that the
   package option name matches the package file name, and 2/ guarantee
   that we don't use any sub-directories to store packages.

Again, this is only a RFC set of patches. There are not meant for
inclusion, and it is only sent to get the discussion started about
this topic. I would have no real problem if the conclusion of the
discussion would be that any solution to the problem has too many
constraints compared to the benefits. Even though I believe the
parsing time of the makefiles is going sooner or later to be a problem
as the number of packages we support continues to grow.

Also, the patches are just the result of an hour or two of hacking
while flying, it hasn't been extensively tested, and there might be
corner cases I have overlooked.

Best regards,

Thomas

Thomas Petazzoni (3):
  pkg-utils: introduce a make-based LOWERCASE function
  Makefile: include only the package .mk files that are needed
  package: add a few needed host options for a few packages

 Makefile                       |  7 ++++++-
 package/expat/Config.in        |  2 ++
 package/expat/Config.in.host   |  4 ++++
 package/pkg-utils.mk           | 15 +++++++--------
 package/pkgconf/Config.in      |  2 ++
 package/pkgconf/Config.in.host |  2 ++
 package/python/Config.in       |  3 +++
 package/python/Config.in.host  |  3 +++
 8 files changed, 29 insertions(+), 9 deletions(-)
 create mode 100644 package/expat/Config.in.host
 create mode 100644 package/pkgconf/Config.in.host
 create mode 100644 package/python/Config.in.host

-- 
1.8.3.2
