From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 11 Sep 2018 10:23:32 -0500
Subject: [Buildroot] hardening flags/args full RELRO & pie
Message-ID: <CANQCQpZyseCf=sPbxJuOjNDb6skSO0unKvMx0Ki1DTkpGqLg+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Thomas for suggesting I write this up and draw out a clear
definition of the problem and possible solution(s).

Note: The RELRO option can be enabled just using CFLAGS.  To completely
enable the  PIE option, it requires the additional link time conditional
use of -pie.

++++++++++++++++++++++++++++++++++++++++++
(For reference) Spec files Stefan proposed that do the required fix-ups
#CC Spec file
*cc1_options:
+ %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}

#Linker Spec file
*self_spec:
+ %{!static:%{!shared:%{!r:-pie}}}
++++++++++++++++++++++++++++++++++++++++++

Problem
- GCC is used to compile and link, which means mixed CFLAGS/LDFLAGS are
possible
- LD maybe used in some link scenarios and assumes LDFLAGS could be provided
- *FLAGS may not be ordered or used as expected. I.e conditions of
conflicting flag/args when hardening options are enabled
- LDFLAGS handling is specifically needed to enable -pie during either way
of linking, but it needs conflict resolution using spec/wrapper

Solution #1 (Originally proposed)
- Use the spec files above as is without any wrapper modifications. (This
is a working solution)
- The spec files are both included when GCC is linking and resolves the
link time flag conflicts
- The spec file for Linker handles the sole link time case.

Solution #2 (Version 2 in patchworks at the moment and has bugs)
- GCC wrapper updated to perform same function as CC spec file above and
keep consistency with other GCC flag fix-ups.
- GCC wrapper updated to also perform the Linker Spec file functions per
above (this requires us to put a string in the LDFLAGS so we can tell when
they're being used)
- New link wrapper to perform the Linker Spec file functions per above for
when we're just linking.  This is a lot of code for a simple check.
(On a Negative Note: This solution adds a lot of code to perform the linker
side of the fix-up and requires us to complicate the GCC wrapper to also do
a similar fix-up.  Example here: http://patchwork.ozlabs.org/patch/963665/)

Solution #3 (Would like to propose as Version 3)
- GCC wrapper updated to perform same function as CC spec file above and
keep consistency with other GCC flag fix-ups.
- Linker spec file used instead of creating a wrapper.  This provides a
much cleaner implementation as when the LDFLAG are used, the specfile is
their when GCC/LD is linking.

My preference after implementing it all 3 ways is #3.

Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180911/e263d7a3/attachment.html>
