From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 14:25:22 +0200
Subject: [Buildroot] [PATCH 0/6] core: look for package's hashes in
 versioned sub-directory
Message-ID: <cover.1539519817.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

When we support two (or more) versions for a package (e.g. qt5base), and
those versions have different licensing terms but stored in the same
file (e.g. 'LICENSE'), we can't store the hashes for the license files
in the same .hash file, as all hashes for a file must match, which would
obviously not be the case here.

So, we've already started moving those hash files in a sub-directory
named after the version, but only for the license files hashes; the
hashes for the downloaded files were left in the main .hash file.

This is not so consistent; hashes for a version should be in the same
file.

This series allows that, by introducing a per-package variable that
contains the path to the license file, so that it can be used both by
the download and legal-info infras.

To be noted: for packages that already have a per-version hash file for
their licensing terms, but a common hash file for their downloads, we
have to carefully switch them over to a per-version hash file only,
while still ensuring that both download and license hashes are still
checked for at every point in the series.

If we were to move the download hashes before the download infra learns
to look into subdirs, the download hashes would not be checked for.
Conversely, if the download infra were to learn to look into subdirs
before the download hashes are moved to the per-version hash file, then
the download hashes would not be checked for either.

So we have to duplicate the download hashes, then teach the download
infra to look into per-version subdir, and finally remove the common
hash file.

Fortunately, only a few qt5 packages and glibc currently have both a
per-version hash file and a common hash file.

There are a few more packages for which we offer a version choice (not a
free-form), like gcc, gdb et al. For those, the licensing terms do not
change across those versions, so we do not need to have per-version hash
files. Ditto for those packages for which we offer a free-form version
option, like linux, uboot, barebox...

Notes:
How to find packages that have both a main and per-version hash files:

    $ find . -type f -name '*.hash' -printf '%h %f\n' \
      |while read d f; do
        for sub in "${d}/"*; do
          [ -d "${sub}" ] || continue
          [ -L "${sub}/${f}" ] && continue
          printf '%s %s' "${d}" "${sub##*/}"
          if [ -e "${sub}/${f}" ]; then
            printf ' present\n'
          else
            printf ' missing\n'
          fi
        done
      done |sort

For each package:
  - only 'missing': we don't need to add per-version hash files;
  - only 'present': we need to move the download hashes to the
    per-version hash files, if not already done;
  - a mix of 'missing' and 'present': we need to add the missing ones,
    and move the download hashes to the per-version has files.

---
Changes v1 -> v2:
  - improve commit-log for 3/6  (Luca)
  - carry Luca's reviewed tags where he sent them.


Regards,
Yann E. MORIN.


The following changes since commit e954ad62a61c4b552796c27e9a176e8453fd6b3f

  xerces: fix static linking with curl (2018-10-14 10:59:24 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 12cce94c6a5ee554f580f8b3dfca566d4673f2a0

  docs/manual: document location of hash files for multi-versions packages (2018-10-14 11:37:42 +0200)


----------------------------------------------------------------
Yann E. MORIN (6):
      core: add a variable that points to the package's hash file
      legal-info: use the per-package variable to get the hash file
      package: prepare for per-version hash files
      core/download: do not hard-code the path to hte package hash file
      package: drop unversioned hash files
      docs/manual: document location of hash files for multi-versions packages

 Makefile                                                 |  2 +-
 docs/manual/adding-packages-directory.txt                |  7 +++++++
 package/glibc/arc-2018.03-release/glibc.hash             |  4 ++++
 .../glibc.hash                                           |  4 ++++
 package/glibc/glibc.hash                                 |  6 ++----
 package/pkg-download.mk                                  |  2 +-
 package/pkg-generic.mk                                   |  8 +++++++-
 package/pkg-utils.mk                                     |  8 ++------
 package/qt5/qt5base/{ => 5.11.2}/qt5base.hash            |  3 ---
 package/qt5/qt5base/5.6.3/qt5base.hash                   |  3 +++
 package/qt5/qt5base/qt5base.hash                         | 16 ++--------------
 package/qt5/qt5connectivity/5.11.2/qt5connectivity.hash  |  3 +++
 package/qt5/qt5connectivity/5.6.3/qt5connectivity.hash   |  3 +++
 package/qt5/qt5connectivity/qt5connectivity.hash         |  7 ++-----
 .../{ => 5.11.2}/qt5quickcontrols2.hash                  |  3 ---
 .../qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash   |  3 +++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 12 ++----------
 package/qt5/qt5serialbus/5.11.2/qt5serialbus.hash        |  3 +++
 package/qt5/qt5serialbus/5.6.3/qt5serialbus.hash         |  3 +++
 package/qt5/qt5serialbus/qt5serialbus.hash               |  7 ++-----
 package/qt5/qt5serialport/5.11.2/qt5serialport.hash      |  3 +++
 package/qt5/qt5serialport/5.6.3/qt5serialport.hash       |  3 +++
 package/qt5/qt5serialport/qt5serialport.hash             |  7 ++-----
 .../qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash   |  3 +++
 .../{ => 5.11.2}/qt5virtualkeyboard.hash                 |  3 ---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 14 ++------------
 26 files changed, 67 insertions(+), 73 deletions(-)
 copy package/qt5/qt5base/{ => 5.11.2}/qt5base.hash (79%)
 copy package/qt5/qt5quickcontrols2/{ => 5.11.2}/qt5quickcontrols2.hash (68%)
 copy package/qt5/qt5virtualkeyboard/{ => 5.11.2}/qt5virtualkeyboard.hash (77%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
