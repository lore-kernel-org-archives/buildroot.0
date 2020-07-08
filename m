From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed,  8 Jul 2020 18:39:57 +0200
Subject: [Buildroot] [PATCH 0/9]  Improving CVE reporting
Message-ID: <20200708164006.859021-1-gregory.clement@bootlin.com>
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

Gregory

[1]: http://patchwork.ozlabs.org/project/buildroot/list/?series=183798

Gregory CLEMENT (9):
  support/scripts: Turn CVE check into a module
  support/scripts/cve.py: Switch to JSON 1.1
  package/pkg-utils: show-info: report the list of the CVEs ignored
  package/pkg-utils: Make CVE class independent of the Pacakage class
  support/scripts: Add a per configuration CVE checker
  package/pkg-utils: cve.py: Handle exception when version comparison
    fails
  support/script/pkg-stats: Manage the CVEs that need to be check
  support/script/cve-checker: Manage the CVEs that need to be check
  package/pkg-utils/cve.py: Manage case when package version doesn't
    exist

 package/pkg-utils.mk        |   5 +-
 support/scripts/cve-checker | 308 ++++++++++++++++++++++++++++++++++++
 support/scripts/cve.py      | 229 +++++++++++++++++++++++++++
 support/scripts/pkg-stats   | 161 +++++--------------
 4 files changed, 581 insertions(+), 122 deletions(-)
 create mode 100755 support/scripts/cve-checker
 create mode 100755 support/scripts/cve.py

-- 
2.27.0
