From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:01:19 +0300
Subject: [Buildroot] [RFC v2 0/5] common service startup files
Message-ID: <cover.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is intended to simplify and clean up installation routine
for daemon-like applications, merging sysv and systemd startup files
and moving much of the common code out of per-package .mk files.

Currently buildroot requires pre-crafted sysv and/or systemd startup
files to be supplied for each package that needs its daemon-like
processes started at system boot. In many cases, this is redundant.

Only a small part of the startup scripts is package-specific.
A single command, the one that starts the process in foreground mode,
is typically enough to generate usable sysv and systemd startup files.

Separating package-specific data and removing the rest from package
directories allows changing common code without the need to patch
several dozen packages, ensures more or less even support for sysv
and systemd, and potentially simplifies introduction of alternative
system startup schemes. 

The first patch in the series contains the common code, and the rest
show how it affects individual packages. I'm only posting a few
interesting ones with comments; the full set (~50 patches) is available
here: https://github.com/arsv/br/ branch run-1.

---
v2 changes: this part of the v1 series is now standalone, the script
got simplified a lot, and it now requires explicit variables instead
of just picking up files from the package directory.

Run files format reverted to "key: value" with explicit keys.
It is still somewhat custom, and the script is still in python however.

Non-daemon script support dropped completely, and some rare complex
cases like postgres dropped as well.

Hard-coded paths removed, TARGET_DIR is used when appropriate.

Variable substitution and special cases are now handled in package
makefiles, not in the script.

-- 
2.0.3
