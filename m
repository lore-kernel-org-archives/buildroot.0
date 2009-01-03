From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 22:35:13 +0100
Subject: [Buildroot] Creating a stable Buildroot release
Message-ID: <1231018513.8886.203.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since this was brought up, I think I'd better share my views.

?I think we should separate the build of the toolchain
and at the end of the toolchain build, we
should create files which gets included by 
the Buildroot file system Configs and Makefiles.

Possibly we should require a certain combination
of toolchain configs for a distribution.

For each stable version, I believe we should select *one*
version of each package and stay with that version.
We should not have to test multiple combinations 
We need to support a development version as well.

At the moment, we only know if a package is old, by
the disappearance of its tarball from Internet.
Would be good if someone figured out a way to
detect new packages.

Using a single version probably means that we need 
to have several makefiles
adn Config files for each package.
One per distribution.


?package--><package1>--><V1.0>-> <package1>.mk
				Config.in
       --><package2>--><V1.0>-> <package2>.mk
				Config.in

	...


        --><packagen>--><V1.0>-> <packagen>.mk
				 Config.in



When you release a new distribution, this becomes:

?package--><package1>--><V1.0>-> <package1>.mk
				Config.in
?			<V2.0>-> <package1>.mk
?				 Config.in
       --><package2>--><V1.0>-> <package2>.mk
				Config.in
?			 <V2.0>-> <package2>.mk
				? Config.in

	...


        --><packagen>--><V1.0>-> <packagen>.mk
				Config.in
?			 <V2.0>-> <packagen>.mk
?				 Config.in

One way to implement this is to maintain
files of package versions.
Alternatively, you store the info in each directory.

Ideally you would want to have a conditional include
but maybe we can achieve this using links.

include "versions"
foreach package
	ln -s distrib-1.0/socat repo/socat/?$(SOCAT_VERSION)
ln -s package distrib-1.0

Once we have a working distribution, we should be very careful
on checking in changes, and we should not update package
versions.
That could be done in release candidates in separate directories
under the main package directory.



Best Regards
Ulf Samuelsson
