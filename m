From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 03 Feb 2021 19:07:03 +0000
Subject: [Buildroot] [Bug 13516] New: utils/scanpypi: Failure when parsing
 diffoscope
Message-ID: <bug-13516-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13516

            Bug ID: 13516
           Summary: utils/scanpypi: Failure when parsing diffoscope
           Product: buildroot
           Version: 2020.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: conrad.ratschan at collins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

https://pypi.org/project/diffoscope/

The first failure is when the interpreter selected is python2 (#!/usr/bin/env
python) and the script attempts to parse diffoscopes' __init__.py which does
not specify an encoding (not required in python3) and has a copyright symbol in
a comment:

```
Traceback (most recent call last):
  File "./utils/scanpypi", line 754, in <module>
    main()
  File "./utils/scanpypi", line 702, in main
    package.load_setup()
  File "./utils/scanpypi", line 302, in load_setup
    setup = imp.load_module('setup', s_file, s_path, s_desc)
  File "/tmp/scanpypi-2xcRWc/python-diffoscope/diffoscope-166/setup.py", line
6, in <module>
  File
"/tmp/scanpypi-2xcRWc/python-diffoscope/diffoscope-166/diffoscope/__init__.py",
line 4
SyntaxError: Non-ASCII character '\xc2' in file
/tmp/scanpypi-2xcRWc/python-diffoscope/diffoscope-166/diffoscope/__init__.py on
line 4, but no encoding declared; see http://python.org/dev/peps/pep-0263/ for
details
```

The second issue is if I force it to use python3 to get around the previous
issue, diffoscope's setup.py contains a explicit check for python3 > 3.7 which
fails out the scanpypi script

-- 
You are receiving this mail because:
You are on the CC list for the bug.
