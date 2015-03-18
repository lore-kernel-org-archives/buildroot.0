From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:33 +0100
Subject: [Buildroot] [PATCH v2 00/10] autobuild-run: python3 compat and misc
	improvements
Message-ID: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Changes v1->v2:

* catch up with git HEAD: further cleanup/python3-compat changes (patches 1-6)

* "move check_requirements() to SystemInfo" is mostly identical to v1;
  changed: use "upload" var, remove entry from TODO list

* "encapsulate subprocess calls" had to be reworked

  It now wraps subprocess.Popen() instead of subprocess.call(),
  and implements run_cmd(), run_cmd_write_to() and (new:) run_cmd_get_stdout()
  on top of it. This covers all uses cases of the subprocess module and,
  in the case of run_cmd_get_stdout(), handles the bytes->str conversion.

  In v1, the "set-locale" patch added a subprocess.check_output() wrapper,
  which has been dropped.

* "set subprocess env" is a separate commit now,
  used to be part of the "set-locale" patch


Andr? Erdmann (10):
  autobuild-run: fixup imports
  autobuild-run, python3: dict.iteritems()->items()
  autobuild-run, python3: decode subprocess output
  autobuild-run, python3: encode/decode mmap data
  autobuild-run: avoid use of builtin as varname
  autobuild-run: reorganize imports
  autobuild-run: move check_requirements() to SystemInfo
  autobuild-run: encapsulate subprocess calls
  autobuild-run: control subprocess env
  autobuild-run: set locale to en_US or C

 scripts/autobuild-run | 280 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 183 insertions(+), 97 deletions(-)

-- 
2.3.2
