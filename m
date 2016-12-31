From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 31 Dec 2016 01:21:01 -0200
Subject: [Buildroot] [PATCH 0/9] A checkpackage script that verifies a
	package coding style
Message-ID: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series is only a prototype.
Please feel free to reject the series if it is too far from what you want.

I started this patch series out of curiosity.
Later on, I saw that something similar was in the todo list [1].

It probably could be achieved using flex + bison, or pyacc, or perl, or
something else.
But I implemented using python and non-strict checks, trying to:
- reduce the chance of problems related to differences between host machines;
- allow incremental development based on feedback from patch reviews;
- keep the maintenance easy;
- generate low number of false warnings.

The first patch is an example package to be used to test the output of the
script for all patches in the series.

The second patch includes a txt file with an overall description and some hints,
the main engine that calls check functions for each type of file, the first
check function, and also many comments in the library files that reflect what I
attempted to accomplish. Of course, the comments can be cut if you disagree with
any of them.

Remaining patches include check functions for each type of file. I put the
patches that I think are most likely to be rejected in the end.

Also in the series there is a blob for the manual trying to clarify the expected
format for help text.

I did not include yet:
- entry to DEVELOPERS (just because it is the first iteration);
- explicit license entry (I guess this way the script inherits the Buildroot
  license).

For each patch I include using 'git notes':
- the time it takes to run for all current packages;
- for each check function:
  - the number of warnings it generates for all current packages;
  - sample output running on the (bad) example package.

Here is the list of check functions implemented in this series:

*.patch:
- check_apply_order
- check_newline_at_eof
- check_numbered_subject
- check_sob

Config.in.*:
- check_attributes_order
- check_consecutive_empty_lines
- check_empty_last_line
- check_help_text
- check_indent
- check_newline_at_eof
- check_trailing_space

*.hash:
- check_consecutive_empty_lines
- check_empty_last_line
- check_hash_filename
- check_hash_number_of_fields
- check_hash_type
- check_newline_at_eof
- check_trailing_space

*.mk:
- check_consecutive_empty_lines
- check_empty_last_line
- check_indent
- check_newline_at_eof
- check_package_header
- check_space_before_backslash
- check_trailing_backslash
- check_trailing_space
- check_typo_in_package_variable
- check_useless_flag

[1] http://elinux.org/Buildroot#Todo_list

Regards,
Ricardo


Ricardo Martincoski (9):
  support/scripts/check-package: example
  support/scripts/check-package: new script
  check-package: check whitespace and empty lines
  check-package: check *.hash files
  check-package: check *.patch files
  check-package: check *.mk files
  docs/manual: size of tab in package description
  check-package: check Config.in.* files
  check-package: check *.mk for typo in variable

 docs/manual/adding-packages-directory.txt          |   8 +-
 docs/manual/writing-rules.txt                      |   6 +-
 support/scripts/check-package                      | 136 ++++++++++++
 .../package/package1/0001-do-something.patch       |  24 +++
 .../package/package1/0002-do-something-else.patch  |  24 +++
 .../package/package1/Config.in                     |  42 ++++
 .../package/package1/package1.hash                 |   8 +
 .../package/package1/package1.mk                   |  48 +++++
 .../package/package1/wrong-name.patch              |  13 ++
 support/scripts/check-package.txt                  |  76 +++++++
 support/scripts/checkpackagelib.py                 |  56 +++++
 support/scripts/checkpackagelib_config.py          | 136 ++++++++++++
 support/scripts/checkpackagelib_hash.py            |  76 +++++++
 support/scripts/checkpackagelib_mk.py              | 229 +++++++++++++++++++++
 support/scripts/checkpackagelib_patch.py           |  50 +++++
 15 files changed, 927 insertions(+), 5 deletions(-)
 create mode 100755 support/scripts/check-package
 create mode 100644 support/scripts/check-package-example/package/package1/0001-do-something.patch
 create mode 100644 support/scripts/check-package-example/package/package1/0002-do-something-else.patch
 create mode 100644 support/scripts/check-package-example/package/package1/Config.in
 create mode 100644 support/scripts/check-package-example/package/package1/package1.hash
 create mode 100644 support/scripts/check-package-example/package/package1/package1.mk
 create mode 100644 support/scripts/check-package-example/package/package1/wrong-name.patch
 create mode 100644 support/scripts/check-package.txt
 create mode 100644 support/scripts/checkpackagelib.py
 create mode 100644 support/scripts/checkpackagelib_config.py
 create mode 100644 support/scripts/checkpackagelib_hash.py
 create mode 100644 support/scripts/checkpackagelib_mk.py
 create mode 100644 support/scripts/checkpackagelib_patch.py

-- 
2.11.0
