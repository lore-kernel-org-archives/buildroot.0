From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:02 +0100
Subject: [Buildroot] [PATCH v4 00/12] pkg-stats json output improvements
Message-ID: <20200302145013.9574-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add developers information to the packages
- add supported defconfigs to json
- add license information to json
- add license file information to json
- add patch files to json
- add a more generic check status field to the packages for easier post
  processing. The following check status are availble: checks: cve, license,
  license-files, hash, hash-license,patches, version, url, developers,
  pkg-check

---
v3 -> v4:

Included the review comments from Titouan

- use only one signed-off mail address
- do some things in a more pythonic way
- remove the patch_count attribute and use a class property instead
  (Note that the patch_count value will not go into the json output
  anymore,but then coutn can be computed by "len(patch_files)".)
- remove the status initializer in the package class that was introduced
  in v3
- update the cve status at the end of the cve check loop
- change the is_valid_infra -> has_valid_infra and use it as property

v2 -> v3:
- keep variable latest_release but change format
- add check for license file hashes
- introduce a na status for the checks
- add a list of all possible checks to the json output
- add the cve check status

v1 -> v2:
- cleanup and recreation of patches
- remove pkg name from dumping to json
- use patch_files instead of combine count and files in dict
- include getdevelopers.py to reuse Developers class

---

Heiko Thiery (12):
  support/scripts/pkg-stats: store latest version in a dict
  support/scripts/pkg-stats: store patch files for the package
  support/scripts/pkg-stats: set developers info
  support/scripts/pkg-stats: store licences of package
  support/scripts/pkg-stats: add package status
  support/scripts/pkg-stats: add package count to stats
  support/scripts/pkg-stats: store pkg dir path
  support/scripts/pkg-stats: add defconfig support
  support/scripts/pkg-stats: add support for license hash check
  support/scripts/pkg-stats: set status to 'na' for virtual packages
  support/scripts/pkg-stats: initialize all package status checks
  support/scripts/pkg-stats: add status for cve check

 support/scripts/pkg-stats | 271 +++++++++++++++++++++++++++++---------
 1 file changed, 211 insertions(+), 60 deletions(-)

-- 
2.20.1
