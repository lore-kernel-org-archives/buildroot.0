From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 20:11:09 +0100
Subject: [Buildroot] [PATCHv7 1/5] manual: fix manual generation in
	preparation for BR2_EXTERNAL support
In-Reply-To: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386270673-16051-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This patch fixes an issue that occurs during the manual build process
which will occur when BR2_EXTERNAL is introduced.

During the package list generation, the python script using kconfiglib
module reads and parses the Config.in files. So, symbols, including
environment variables, got expanded and/or resolved.  In
kconfiglib.py, this patch fixes the regex that did not allow to use
numbers in the environment variable names, so '$BR2_EXTERNAL' got
wrongly expanded like it was '${BR}2_EXTERNAL':

<snip>
>>>   Updating the manual lists...
Traceback (most recent call last):
  File "/opt/buildroot/master/support/scripts/gen-manual-lists.py", line 375, in <module>
    buildroot = Buildroot()
  File "/opt/buildroot/master/support/scripts/gen-manual-lists.py", line 216, in __init__
    self.root_config))
  File "/opt/buildroot/master/support/scripts/kconfiglib.py", line 214, in __init__
    self.top_block = self._parse_file(filename, None, None, None)
  File "/opt/src/buildroot/master/support/scripts/kconfiglib.py", line 919, in _parse_file
    return self._parse_block(line_feeder, None, parent, deps, visible_if_deps, res)
  File "/opt/buildroot/master/support/scripts/kconfiglib.py", line 1114, in _parse_block
    self.base_dir))
IOError: /opt/buildroot/master/Config.in:490: sourced file "$BR2_EXTERNAL/Config.in" (expands to
"2_EXTERNAL/Config.in") not found. Perhaps base_dir
(argument to Config.__init__(), currently
"/opt/buildroot/master") is set to the wrong value.
docs/manual/manual.mk:2: recipe for target 'manual-update-lists' failed
make: *** [manual-update-lists] Error 1
</snip>

Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 support/scripts/kconfiglib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/kconfiglib.py b/support/scripts/kconfiglib.py
index 0704cc0..e40947c 100644
--- a/support/scripts/kconfiglib.py
+++ b/support/scripts/kconfiglib.py
@@ -2074,7 +2074,7 @@ set_re   = re.compile(r"CONFIG_(\w+)=(.*)")
 unset_re = re.compile(r"# CONFIG_(\w+) is not set")
 
 # Regular expression for finding $-references to symbols in strings
-sym_ref_re = re.compile(r"\$[A-Za-z_]+")
+sym_ref_re = re.compile(r"\$[A-Za-z_][0-9A-Za-z_]*")
 
 # Integers representing symbol types
 UNKNOWN, BOOL, TRISTATE, STRING, HEX, INT = range(0, 6)
-- 
1.8.1.2
