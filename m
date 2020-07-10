From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:36 +0200
Subject: [Buildroot] [PATCH v2 0/9] Improving CVE reporting
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-11-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The purpose of this series is to improve the CVE reporting in order to
be usable for a project.

Until know the CVE affecting the packages were reported for the
buildroot project using pkg-stat. With this series it is now possible
to report the packages affected by CVEs for a given configuration.

While I was on CVE I switched to the support of the JSON 1.1 for the
NVDE database.

In this series I also added a new state for the CVE status of the
packages. This new state will be used to emphasize that the automatic
check has failed and it was needed to be verified manually. The idea
behind this was to be as much accurate as possible to avoid any false
positive. It will also help to improve the meta-data of the package.

The next step will be to reuse the works done by Matthew Weber [1] to
use the cpeid and only use the package name and the package version as
fall back.

In this series there is at least one open point about the packages
excluded from the cve check. For now I excluded the kernel and gcc as
there are also excluded by the pkg-stats script but this list could
(should ?) be extended or modified.

In this second version the following changes have been done:
v1 -> v2

 - Port the version fix to pkg-stat from cve.py and move this patch as
   the first one

 - Remove debug message

 - Remove unused argument -p and -n in cve-checker

 - Remove the information about the commit used in the output for the
   cve-checker

 - Remove all the unnecessary import

 - Add a default path to the download directory for nvd for the
   cve-checker

 - Do not use boolean anymore for the affected status

 - Use ignore_cves instead of ignored_cves in pkg-utils

 - Fix the html output for cve-checker and pkg-stat

 - Check if ijson is present on the host

Gregory

Gregory CLEMENT (9):
  support/script/pkg-stat: Handle exception when version comparison
    fails
  support/scripts: Turn CVE check into a module
  support/scripts/cve.py: Switch to JSON 1.1
  package/pkg-utils: show-info: report the list of the CVEs ignored
  support/script: Make CVE class independent of the Pacakage class
  support/scripts: Add a per configuration CVE checker
  support/script/pkg-stats: Manage the CVEs that need to be check
  support/script/cve-checker: Manage the CVEs that need to be check
  package/pkg-utils/cve.py: Manage case when package version doesn't
    exist

 package/pkg-utils.mk        |   5 +-
 support/scripts/cve-checker | 275 ++++++++++++++++++++++++++++++++++++
 support/scripts/cve.py      | 235 ++++++++++++++++++++++++++++++
 support/scripts/pkg-stats   | 159 +++++----------------
 4 files changed, 550 insertions(+), 124 deletions(-)
 create mode 100755 support/scripts/cve-checker
 create mode 100755 support/scripts/cve.py

-- 
2.27.0
