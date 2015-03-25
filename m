From: ir. Tjeerd Pinkert <t.j.pinkert@vu.nl>
Date: Wed, 25 Mar 2015 14:59:28 +0100
Subject: [Buildroot] [Bug-readline] IPython/readline segfaults
In-Reply-To: <5512B650.1020006@zacarias.com.ar>
References: <55116D12.1000106@vu.nl> <5511B114.60704@case.edu>
 <20150325003203.GL10761@vapier> <5512940B.60808@vu.nl>
 <5512B650.1020006@zacarias.com.ar>
Message-ID: <5512BF40.5000702@vu.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-03-15 14:21, Gustavo Zacarias wrote:
> On 03/25/2015 07:55 AM, ir. Tjeerd Pinkert wrote:
>
>> Thanks, indeed, buildroot 2015.02 has 6.3 with no patches, although it
>> downloads the latest tar file. I'm trying to see if patching helps.
>
> I've sent a patch to bump it to patchlevel 8 after the 2015.02 release
> for another bug in commit b817e8c58117402561a61c0d749337f415c9c985
> (bash-related).
> So it'll be part of the 2015.05 release, or if you're in a rush just
> apply that patch to your tree.

I have tested it, and the patch works, no more segfaults so far.

I attach the patch file for buildroot, Gustavo, can you tell me if I did 
it in a correct way? Did you already include this one in buildroot too? 
I could not get the original patch working with the buildroot system so 
I generated my own diff which works for buildroot (that is 
readline-0001-63-002.patch). I saw there are more patches for readline 
6.3 available.

Tjeerd
-------------- next part --------------
A non-text attachment was scrubbed...
Name: readline-0001-63-002.patch
Type: text/x-patch
Size: 538 bytes
Desc: readline-0001-63-002.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150325/531ff593/attachment.bin>
-------------- next part --------------
			   READLINE PATCH REPORT
			   =====================

Readline-Release: 6.3
Patch-ID: readline63-002

Bug-Reported-by:	Anatol Pomozov <anatol.pomozov@gmail.com>
Bug-Reference-ID:	<CAOMFOmXy3mT2So5GQ5F-smCVArQuAeBwZ2QKzgCtMeXJoDeYOQ@mail.gmail.com>
Bug-Reference-URL:	http://lists.gnu.org/archive/html/bug-readline/2014-03/msg00010.html

Bug-Description:

When in callback mode, some readline commands can cause readline to seg
fault by passing invalid contexts to callback functions.

Patch (apply with `patch -p0'):

*** ../readline-6.3/readline.c	2013-10-28 14:58:06.000000000 -0400
--- readline.c	2014-03-10 14:15:02.000000000 -0400
***************
*** 745,749 ****
  
    RL_CHECK_SIGNALS ();
!   if (r == 0)			/* success! */
      {
        _rl_keyseq_chain_dispose ();
--- 745,750 ----
  
    RL_CHECK_SIGNALS ();
!   /* We only treat values < 0 specially to simulate recursion. */
!   if (r >= 0 || (r == -1 && (cxt->flags & KSEQ_SUBSEQ) == 0))	/* success! or failure! */
      {
        _rl_keyseq_chain_dispose ();
*** ../readline-6.3/patchlevel	2013-11-15 08:11:11.000000000 -0500
--- patchlevel	2014-03-21 08:28:40.000000000 -0400
***************
*** 1,3 ****
  # Do not edit -- exists only for use by patch
  
! 1
--- 1,3 ----
  # Do not edit -- exists only for use by patch
  
! 2
