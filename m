From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Apr 2015 23:47:49 +0200
Subject: [Buildroot] [PATCH v3 0/4] autobuild-run: control subprocess stdio
	and env
Message-ID: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v2->v3:

* add __doc__ comments to SystemInfo popen(), run_cmd*()

* incorporate Samuel Martin's suggestions:

  * s/split(None)/split()

  * drop bogus comment in is_locale_env_varname()
    and use a more compact word matching variant

  * redirect stderr to the log file when running "git log", "tail"

  But did not re-add the "yes |" pipe to "make ...config" commands and
  kept set_locale() as-is. I don't think that changes are necessary here,
  see my replies in the v2 series, but it's open to discussion, of course.


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

Andr? Erdmann (4):
  autobuild-run: encapsulate subprocess calls
  autobuild-run: log stderr of "git log" / "tail"
  autobuild-run: control subprocess env
  autobuild-run: set locale to en_US or C

 scripts/autobuild-run | 183 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 140 insertions(+), 43 deletions(-)

-- 
2.3.6
