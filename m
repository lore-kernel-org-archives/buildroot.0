From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 12:18:41 +0200
Subject: [Buildroot] Notifications about outdated packages
Message-ID: <20190815121841.114f8f64@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Many of you have probably seen a change in the daily e-mail
notifications about autobuilder failures: it has gained some details
about packages in Buildroot that are outdated compared to the latest
available upstream version. In this e-mail, I'd like to give a bit of
background and explanation about this feature and how it works.

Our source of information is the https://release-monitoring.org/, which
tracks the releases of a large number of open-source projects. It is a
project that we can contribute to, to make it track more projects, fix
how existing projects are being tracked, etc.

release-monitoring.org allows to search for packages in two ways:

 - Simply by name. This works fine when the name of the package in
   Buildroot matches the name of the package in release-monitoring.org.

 - By "mapping". release-monitoring.org has a concept of
   "distributions" (https://release-monitoring.org/distros/), and we
   have a Buildroot distribution registered
   (https://release-monitoring.org/distro/Buildroot/). This concept
   allows to create a custom mapping between the name of a package in
   Buildroot, and the actual package known by release-monitoring.org.
   This is useful for packages that have a different name between
   Buildroot and release-monitoring.org. An example of this are our
   Python packages (that have a python- prefix) or our X.org packages.

Every day, a script regenerates the page
http://autobuild.buildroot.net/stats/ with lots of statistics about our
packages, including whether the version we have in Buildroot is
up-to-date or not. In this table if you see "Not found" in the "Latest
version" column, it means that no package could be found on
release-monitoring.org, either because it is not tracked at all, or
because the name didn't match. Together with this HTML page, a JSON
output with the same information is generated every day at
http://autobuild.buildroot.net/stats/index.json.

This JSON file is then parsed by our script that produces the daily
e-mail sent both to individual developers and to the mailing list. A
single e-mail is sent per developer, containing both details about
autobuilder failures and about outdated packages. To avoid excessive
spamming, the details about outdated packages will only be included in
the e-mail sent every Monday. The other week days, the e-mail will only
include the autobuilder failure details.

In the table that you can find in the e-mail sent on the mailing list,
we have the following details:

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------

The "found by" column indicates how the package was found on
release-monitoring.org. "GUESS" means it was a match by package name.
"DISTRO" means there was an explicit entry in the Buildroot
distribution known by release-monitoring.org. If the "found by" is
GUESS, it means that the result *could* be wrong, as we might have
match a different package. A mapping in the Buildroot distro can be
created to resolve such cases.

The "orph?" column indicates, when it contains "ORPH" indicates that
the package is orphan, i.e that nobody is taking care of it according
to the DEVELOPERS file. So those packages are quite important to look
at, since nobody will receive individual notifications about such
packages.

To conclude, I'd like to thank Victor Huesca, who is working as an
intern at Bootlin on Buildroot this summer, and who has developed all
this additional tooling. We plan to extend it very soon to also notify
developers and the mailing list about defconfig build failures and
runtime test failures.

Do not hesitate to let us know if you have any question.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
