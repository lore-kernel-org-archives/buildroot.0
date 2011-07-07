From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 10:14:25 +0200
Subject: [Buildroot] Why chmod ug+rw?
In-Reply-To: <201107061900.37544.arnout@mind.be> (Arnout Vandecappelle's
 message of "Wed, 6 Jul 2011 19:00:37 +0200")
References: <201107061900.37544.arnout@mind.be>
Message-ID: <87zkkqse1q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout>  Hoi all,
 Arnout>  Why does buildroot make the sources group-writable?

 Arnout>  A bit of context: I'm using Thomas Petazzoni's patch to have a
 Arnout> custom package extract function that rsyncs the source code
 Arnout> into the build directory.  I noticed that rsync always goes
 Arnout> through the whole tree, because it needs to update permissions.
 Arnout> This is because of the below:

 Arnout> 	$($(PKG)_EXTRACT_CMDS)
 Arnout> # some packages have messed up permissions inside
 Arnout> 	$(Q)chmod -R ug+rw $(@D)

 Arnout>  Now I agree that some packages have messed up permissions, but
 Arnout> why does the group need read and write permission?  Especially
 Arnout> since in buildroot everything is owned by the user and no
 Arnout> su-ing is done.

I don't see any reason for it either. The ug+rw dates back from the
original AUTOTARGETS work (2008, pre-git) by John Voltz who we haven't
heard from for several years:

commit de54a6ebc8f54f01eebd78723003a2f809873030
Author: John Voltz <john.voltz@gmail.com>
Date:   Thu Mar 6 18:39:42 2008 +0000

    fixed nasty makefile bugs

I'll change it to chmod -R +rw instead.

-- 
Bye, Peter Korsgaard
