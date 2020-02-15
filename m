From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 15 Feb 2020 13:44:15 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add CVE reporting to pkg-stats
Message-ID: <20200215124417.236492-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of commit extends the pkg-stats tool to use the NVD database
(https://nvd.nist.gov/vuln/data-feeds) to see if the current version
of each Buildroot package is affected by a CVE.

An example result can be seen here:

 - Human readable HTML:       https://mypi.cz/pkg-stat.html
 - Machine parseable JSON:    https://mypi.cz/pkg-stat.json

Thanks to this, we can see that 84 of our packages are apparently
affected by a total of 252 CVEs.

A new per-package variable, <pkg>_IGNORE_CVES, is introduced, and
allows to tell the tool to ignore some CVEs, for example because it is
fixed by a local patch in Buildroot, or because the CVE does not apply
to the Buildroot package (the CVE only affects a non-Linux operating
system, or affect a functionality of the package that isn't built in
Buildroot).

Of course, the results are not perfect:

 - The NVD database product names certainly don't 100% match the
   Buildroot package names. We might have to add some extra metadata
   information in each package (CPE ID ?) to map to the correct NVD
   database product name.

   -> See for instance subversion, where all CVEs actually refer to
      a Jenkins plugin

 - Language-specific packages (for example: python-paho-mqtt and paho-mqtt-c)
   are probably not correctly handled.

 - Buildroot packages that have a version selection are not correctly
   handled.

But overall, it already provide useful results. The plan is of course
to implement e-mail notification to Buildroot developers in charge of
packages with unfixed CVEs, in a second step.

Thanks to Thomas Petazzoni, Thomas DS and all the reviewers for this effort !


Best regards,

Titouan

---
Thomas Petazzoni (2):
  support/scripts/pkg-stats: add support for CVE reporting
  docs/manual: describe the new <pkg>_IGNORE_CVES variable

 docs/manual/adding-packages-generic.txt |  14 +++
 support/scripts/pkg-stats               | 159 +++++++++++++++++++++++-
 2 files changed, 172 insertions(+), 1 deletion(-)

-- 
2.24.1
