From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:17 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and misc
	improvements
Message-ID: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches 1-4 make autobuild-run compatible with both python >=2.6 and 3.

Patches 5-9 are minor enhancements (mostly cleanup).

Patches 10- are more invasive:
* move the check_requirements() logic to the SystemInfo class
* control environment(->locale), std{in,out,err} of all called commands

Tested w/ python2.7 and python3.4, but not python2.6 (it should work, though).


This changeset should be mostly compatible with the
"autobuild-run improvements" patchset from Thomas De Schampheleire, except for:

* autobuild-run: extend TODO list

  * implements "Integrate method check-requirements with the SysInfo class,
    distinghuishing  between required and optional dependencies.",
    so this item can be removed from the TODO list

* autobuild-run: check-requirements does not need to know the login details

  * dep on "curl" gets set in main()

* autobuild-run: set LC_ALL=C to not use locale settings of host machine

  * SystemInfo maintains its own env dict and passes it to subprocess.call()
  * ^ tries to find a "comparable" locale: either en_US[.UTF-8] or C
    (My experience is that some python (build) scripts fail if the locale
    is not *.utf-8.)
  * remove all LANG, LC_* vars from the env if a "comparable" locale is found
    and set LANG=<locale>


Andr? Erdmann (13):
  autobuild-run, python3: print is a function
  autobuild-run, python3: urllib.request<>urllib2
  autobuild-run, python3: bytes<>str, decode()
  autobuild-run, python3: configparser<>ConfigParser
  autobuild-run: remove unneeded vars
  autobuild-run: explicitly close web file handles
  autobuild-run: get host arch once
  autobuild-run: sort imports alphabetically
  autobuild-run: unify "which <prog>" code
  autobuild-run: use a built-in has_prog() implementation
  autobuild-run: move check_requirements() to SystemInfo
  autobuild-run: encapsulate subprocess calls
  autobuild-run: set locale to en_US or C

 scripts/autobuild-run | 321 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 218 insertions(+), 103 deletions(-)

-- 
2.3.0
