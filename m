From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 May 2019 13:52:22 +0000
Subject: [Buildroot] [Bug 11831] New: python-pyparsing: "No module named
 'pyparsing'" on target / while building cantools
Message-ID: <bug-11831-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11831

            Bug ID: 11831
           Summary: python-pyparsing: "No module named 'pyparsing'" on
                    target / while building cantools
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tistolz at outlook.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7991
  --> https://bugs.busybox.net/attachment.cgi?id=7991&action=edit
python-cantools/Config.in

Hi all,

I'm trying to include the Python module "cantools"
<https://pypi.org/project/cantools/> into my Buildroot installation. The
package files are given in the attachment. However, the build step for
python-cantools fails with the message:
    ModuleNotFoundError: No module named 'pyparsing'
in a nested import while processing the first line (import cantools) of
setup.py.
I can confirm that the python-pyparsing package has been built before, so it
should be available to python.

Trying to track this bug down, I first started output/host/bin/python3 and
entered the command "import pyparsing", upon which I saw the same error
message. However, another package I built was python-bitstruct (using
utils/scanpypi), and this became available for "import bitstruct" in an
output/host/bin/python3 session.

Furthermore, I rebuilt Buildroot 2019.02.2 (from a freshly extracted tar
archive) with only the following packages selected:
    Interpreter languages and scripting --> python3 SELECTED
        core python3 modules: DESELECTED unicodedata
        External python modules: SELECTED python-can, python-spidev,
python-pyparsing

On the target, in a python3 session, I get:
    >>> import can
    >>> import pyparsing
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ModuleNotFoundError: No module named 'pyparsing'
    >>> import spidev
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ModuleNotFoundError: No module named 'spidev'
    >>>

So, the "python-can" package seems to install correctly, while
"python-pyparsing" and "python-spidev" appear to be not present on the target.

Thanks for your attention,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
