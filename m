From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Mar 2014 21:38:50 +0100
Subject: [Buildroot] [RFC 0/3] Speeding up the Makefile parsing
In-Reply-To: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 23 Mar 2014 18:42:59 +0100")
References: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n2oveed.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > The current strategy of Buildroot with regard to .mk files is to
 > always include all of them. However, with an ever-increasing number of
 > packages, the number of .mk files to parse is growing significantly,
 > and this makes the execution of any trivial make target take at least
 > 12 seconds on a relatively fast SSD equipped laptop. For example, a
 > simple thing like "make help" or "make external-deps" takes 12 seconds
 > solely because of the parsing time of more than a thousand of package
 > makefiles.

.. and how fast is it after this series?

 > The proposed RFC solution is to look at the BR2_PACKAGE_<foo>
 > variables, and from them derive the name of the package .mk files to
 > be included. It is a simple change in the main Makefile, but it has
 > two major consequences that we need to discuss on whether they are
 > acceptable or not:

 >  * We need to have BR2_PACKAGE_HOST_<foo> options for *all* host
 >    packages. Of course, the vast majority of them can be blind
 >    options, but it means that we have to ensure all the host packages
 >    are properly selected at the Config.in level. That's a fairly
 >    significant change.

I don't think this is too bad. Maybe we could look into generating the
_DEPENDENCIES line from depends/select statements in the Config.in
automatically, then we only need to explicitly handle the optional
dependencies in the .mk file (or decide to also handle them in Kconfig
if possible).

 >  * Since the logic assume that BR2_PACKAGE_FOO is always
 >    package/foo/foo.mk, it means we have to 1/ guarantee that the
 >    package option name matches the package file name, and 2/ guarantee
 >    that we don't use any sub-directories to store packages.

The 2nd part is more serious as we use subdirs today to group related
packages and have supported them "forever". We also used to tell people
(before BR2_EXTERNAL) to put their own packages under package/<company>.

I guess playing tricks with $(wildcard) to find the .mk file is going to
add quite some performance overhead.

-- 
Bye, Peter Korsgaard
