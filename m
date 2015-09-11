From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Fri, 11 Sep 2015 09:52:07 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH=5D_Makefile=3A_Remove_KBUILD=5FVER?=
 =?utf-8?q?BOSE_and_quiet?=
In-Reply-To: <55EEE3F1.3000508@mind.be>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <55EDFE3E.8030205@mind.be>
 <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
 <55EED4CA.3040304@mind.be>
 <0cef4a73d23345bbaf2f88905d0ed82f@openmailbox.org>
 <55EEE3F1.3000508@mind.be>
Message-ID: <003996441bb228c23d8e79202370f8d1@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've just realized that this patch is breaking linux and busybox verbose 
mode.

Exporting KBUILD_VERBOSE makes it available for linux and busybox 
makefile. This makefile sets KBUILD_VERBOSE if V is set in the command 
line, but it also uses KBUILD_VERBOSE if exported by the shell.

In fact it seems that the original idea was to export all variables that 
could be understood by different build systems:
- KBUILD_VERBOSE for linux and busybox
- VERBOSE for CMake packages.

So, if we still want to handle verbosity in infrastructures (and some 
packages that use generic infrastructure) - and I think we should:
I think the right way to forward verbose mode to linux and busybox is to 
add V=1 in linux.mk and busybox.mk.

As a consequence, I believe it is not possible to split my patch into 
different steps.
The patch must:
- remove quiet
- remove KBUILD_VERBOSE
- use VERBOSE but in a different way (not exported), as already 
described
- handle VERBOSE in pkg-cmake.mk, pkg-autotools.mk, linux.mk, 
busybox.mk, and qt.mk (this one is possibly already correct).

If you agree, I will provide a single patch that will cancel the two 
previous ones (I will add patch version and log this time).

Regards,

-- 
C?dric
