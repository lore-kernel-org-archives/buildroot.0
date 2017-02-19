From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:15 -0300
Subject: [Buildroot] [PATCH v2 0/9] A checkpackage script that verifies a
	package coding style
In-Reply-To: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

For each patch I include using 'git notes':
- the time it takes to run for all current packages;
- for each check function:
  - the number of warnings it generates for all current packages;
  - sample output running on the (bad) example package.

Here is the list of check functions implemented in this series:

*.patch:
- ApplyOrder
- NewlineAtEof
- NumberedSubject
- Sob

Config.*:
- AttributesOrder
- ConsecutiveEmptyLines
- EmptyLastLine
- HelpText
- Indent
- NewlineAtEof
- TrailingSpace

*.hash:
- ConsecutiveEmptyLines
- EmptyLastLine
- HashFilename
- HashNumberOfFields
- HashType
- NewlineAtEof
- TrailingSpace

*.mk:
- ConsecutiveEmptyLines
- EmptyLastLine
- Indent
- NewlineAtEof
- PackageHeader
- SpaceBeforeBackslash
- TrailingBackslash
- TrailingSpace
- TypoInPackageVariable
- UselessFlag

[1] http://elinux.org/Buildroot#Todo_list

Regards,
Ricardo
---
Changes v1 -> v2:
  - avoid false positive for variable of virtual package the package
    under analysis provides (e.g. MYSQL_SOCKET) (Romain);
  - do not warn for numbered subject if the patch was not generated with
    git (based on comments from Thomas DS and Thomas P);
  - support packages with different config filenames (Thomas DS);
  - add sample in the example patch for above cases;
  - use classes instead of functions to declare each check (Thomas DS);
  - update some commit messages;
  - do not use regex when a simple 'in' is enough (Thomas DS);
  - define named constants instead of magic '3' (Thomas DS);
  - assign to self (using classes) instead of using static variables
    (Thomas DS);
  - use a custom function as predicate to inspect.getmembers
    (Thomas DS);
  - rework how the command lines are passed to functions;
  - add entry do DEVELOPERS file;
  - remove the useless "check" prefix from all check functions;


Ricardo Martincoski (9):
  support/scripts/check-package: example
  support/scripts/check-package: new script
  check-package: check whitespace and empty lines
  check-package: check *.hash files
  check-package: check *.patch files
  check-package: check *.mk files
  docs/manual: size of tab in package description
  check-package: check Config.* files
  check-package: check *.mk for typo in variable

 DEVELOPERS                                         |   3 +
 docs/manual/adding-packages-directory.txt          |   8 +-
 docs/manual/writing-rules.txt                      |   6 +-
 support/scripts/check-package                      | 144 +++++++++++++
 .../package/package1/0001-do-something.patch       |  24 +++
 .../package/package1/0002-do-something-else.patch  |  24 +++
 .../package/package1/Config.in                     |  45 +++++
 .../package/package1/Config.something              |  10 +
 .../package/package1/package1.hash                 |   8 +
 .../package/package1/package1.mk                   |  55 +++++
 .../package/package1/wrong-name.patch              |  14 ++
 support/scripts/check-package.txt                  |  76 +++++++
 support/scripts/checkpackagebase.py                |  16 ++
 support/scripts/checkpackagelib.py                 |  54 +++++
 support/scripts/checkpackagelib_config.py          | 138 +++++++++++++
 support/scripts/checkpackagelib_hash.py            |  72 +++++++
 support/scripts/checkpackagelib_mk.py              | 223 +++++++++++++++++++++
 support/scripts/checkpackagelib_patch.py           |  62 ++++++
 18 files changed, 977 insertions(+), 5 deletions(-)
 create mode 100755 support/scripts/check-package
 create mode 100644 support/scripts/check-package-example/package/package1/0001-do-something.patch
 create mode 100644 support/scripts/check-package-example/package/package1/0002-do-something-else.patch
 create mode 100644 support/scripts/check-package-example/package/package1/Config.in
 create mode 100644 support/scripts/check-package-example/package/package1/Config.something
 create mode 100644 support/scripts/check-package-example/package/package1/package1.hash
 create mode 100644 support/scripts/check-package-example/package/package1/package1.mk
 create mode 100644 support/scripts/check-package-example/package/package1/wrong-name.patch
 create mode 100644 support/scripts/check-package.txt
 create mode 100644 support/scripts/checkpackagebase.py
 create mode 100644 support/scripts/checkpackagelib.py
 create mode 100644 support/scripts/checkpackagelib_config.py
 create mode 100644 support/scripts/checkpackagelib_hash.py
 create mode 100644 support/scripts/checkpackagelib_mk.py
 create mode 100644 support/scripts/checkpackagelib_patch.py

-- 
2.11.0
