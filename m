From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:37 -0800
Subject: [Buildroot] [buildroot 0000221]: buildroot: Building bash fails
	(bash make mixes up host and target)
Message-ID: <e45ef799cbf02966863f078daf1bdb2c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=221 
====================================================================== 
Reported By:                kk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   221
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-08-2005 05:48 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    buildroot: Building bash fails (bash make mixes up
host and target)
Description: 
There were several problems cross-building bash with buildroot.

I just paste the emails I sent to bash-bug (with no response yet):

***

I've hit the following bug when cross-building bash with buildroot:

Compiling mkbuiltins fails because "inttypes.h" is not found.

It turns out that:
* The target system has an "inttypes.h" header file. It is found by
configure, and hence "config.h" sets "HAVE_INTTYPES_H".
* "mkbuiltins" is compiled with "-DHAVE_CONFIG_H" (but with the host
compiler, which only sees the host include directories, but not the target
include directories). It uses the "config.h" generated w.r.t. the target,
sees "HAVE_INTTYPES_H", and hence tries to include "inttypes.h".
* The host system does not have any "inttypes.h" header file, and hence
the compilation fails...

However, the "inttypes.h" error is only one consequence of a serious
fundamental problem: "mkbuiltins" should not use "config.h" at all! Host
and target system differ dramatically, many of the definitions in
"config.h" (generated w.r.t. the target system) are most likely wrong for
the host system!

Bash version is 3.0 (with the patches applied by buildroot).
The host system is Windows/Interix, but with a complete GNU toolchain
(gcc, make, bash, ...) instead of the Interix programs.
However, the host system's C library and headers are still those from
Interix, not glibc.
The target system is an embedded system with uclibc library and headers.

I also tried on a gentoo host system. There, the make does not fail
(because inttypes.h exists on both the host and the target), but still,
mkbuiltins is most likely compiled with the wrong config.h.

***

Hmmm, it's worse than described below...

* "mkbuiltins.c" includes "config.h" unconditionally, it does not depend
on "HAVE_CONFIG_H".

* "mkbuiltins.c" depends on "config.h", it does not compile when that
include is removed.

***

The same problem occurs when compiling psize.c:

It is compiled for the host with the defines in "config.h",
which are valid for the target environment only.

Moreover, running "psize.c" on the host is irrelevant anyway:
The size of a pipe on the host is not the same as the size of
a pipe on the target...

***

I'm cross-compiling bash.

Making fails because "size" produces an error about unknown file formats.

This happens because the Makefile applies the host's native "size" command
to target binaries in two places, and in my case, the "size" program of the
host is unable to handle the file format of the target.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-08-05 05:48  kk             New Issue                                    
02-10-06 10:23  prpplague      Status                   assigned => closed  
02-10-06 10:23  prpplague      Resolution               open => unable to
reproduce
02-10-06 10:23  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
