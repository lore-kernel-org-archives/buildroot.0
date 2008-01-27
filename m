From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Sun, 27 Jan 2008 09:32:11 -0500
Subject: [Buildroot] Can't compile anything with using ssl in target system
Message-ID: <479C95EB.1030001@redtone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hmmm I also have tracked down the openssl problem.

The story is long. I have a copy of openssl 0.9.8 and the header
on my host. When running buildroot and producing a target gcc,
the gcc make script has a script called 'fixinc.sh' which scans
the include files for non-ansi compatible headers and fixes it
and make a fixed copy into it's down library directory,  
/usr/lib/gcc/.../../include.

And openssl library happens to have one include file, namely
openssl/bn.h which is considered non-ansi compatible and
it shall be fixed !

Now because my host is using openssl 0.9.8 and the header
is different from 0.9.7 used by buildroot, this operation will
result in the target system has two version of bn.h, one
version 0.9.7 bn.h in /usr/include/openssl (original ) and
another version 0.9.8 bn.h in /us/lib/gcc/.../.../include/openssl
( and ansi-fixed ).

And because the one in usr/lib/gcc takes precedence and
hence resulting in compilation error.

What remains unanswered is why would gcc make script
'fixinc.sh'  fixes the host's include files and include it in
the target system.

Cheers.
 

--------------------------------------------
Important Warning! 

*************************** 

This electronic communication (including any attached files) may contain confidential and/or legally privileged information and is only intended for the use of the person to whom it is addressed. If you are not the intended recipient, you do not have permission to read, use, disseminate, distribute, copy or retain any part of this communication or its attachments in any form. If this e-mail was sent to you by mistake, please take the time to notify the sender so that they can identify the problem and avoid any more mistakes in sending e-mail to you. The unauthorised use of information contained in this communication or its attachments may result in legal action against any person who uses it.
