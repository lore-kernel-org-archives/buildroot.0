From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Nov 2020 19:02:24 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_13321=5D_New=3A_utils/scanpypi=3A_f?=
 =?utf-8?q?ails_with_packages_that_define_a_package=E2=80=99s_metadata_in_?=
 =?utf-8?q?setup=2Ecfg?=
Message-ID: <bug-13321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13321

            Bug ID: 13321
           Summary: utils/scanpypi: fails with packages that define a
                    package?s metadata in setup.cfg
           Product: buildroot
           Version: 2020.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bartosz.bilas at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

There is a couple(or more than couple) of packages on PyPi that doesn't work
with the scanpypi script (for example wheel/importlib_resources). The reason of
that is that it uses setup.cfg in conjunction with setup.py to package metadata
configuration. Use of scanpypi on these packages fails with the following
errors:

utils/scanpypi:23: DeprecationWarning: the imp module is deprecated in favour
of importlib; see the module's documentation for alternative uses
  import imp
spdx_lookup module is not installed. This can lead to an inaccurate licence
detection. Please install it via
pip install spdx_lookup
buildroot package name for wheel: python-wheel
Package: python-wheel
Fetching package wheel
Downloading package wheel from
https://files.pythonhosted.org/packages/83/72/611c121b6bd15479cb62f1a425b2e3372e121b324228df28e64cc28b01c2/wheel-0.35.1.tar.gz...
Traceback (most recent call last):
  File "utils/scanpypi", line 754, in <module>
    main()
  File "utils/scanpypi", line 702, in main
    package.load_setup()
  File "utils/scanpypi", line 302, in load_setup
    setup = imp.load_module('setup', s_file, s_path, s_desc)
  File "/usr/lib/python3.8/imp.py", line 234, in load_module
    return load_source(name, filename, file)
  File "/usr/lib/python3.8/imp.py", line 171, in load_source
    module = _load(spec)
  File "<frozen importlib._bootstrap>", line 702, in _load
  File "<frozen importlib._bootstrap>", line 671, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 783, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "/tmp/scanpypi-evf4l461/python-wheel/wheel-0.35.1/setup.py", line 4, in
<module>
  File "utils/scanpypi", line 63, in closure
    BuildrootPackage.setup_args[kwargs['name']] = kwargs
KeyError: 'name'


To reproduce just type: 

utils/scanpypi wheel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
