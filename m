From: Brian Foster <brian.foster@maximintegrated.com>
Date: Wed, 8 Jun 2016 12:08:17 +0200
Subject: [Buildroot] Why fakeroot works without #! (basically, RTFM)
Message-ID: <2951546.bZKNuKFtLY@laclwks004>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi!

  I happened to notice in very recent commit 974e83a8f9a1
  ("fs: add sha-bang to fakeroot script") the comment:
    
    ? We [are] directly running this script, so it should start
     with a sha-bang (not sure why/how it works today...). ?

  What is running the (generated) fakeroot script being talked
  about is the the Host script .../usr/bin/fakeroot, which is a
  GNU bash script.  The answer then is in ??COMMAND EXECUTION'
  of the bash(1) manual page:

    ? If [the exec()] fails because the file is not in executable
     format, and  the file is not a directory, it is assumed to be
     a shell script, a file containing shell commands.  A subshell
     is spawned to execute it. [...] ?

  Or in other words, the traditional Unix shell behaviour of:
  If exec() failed with errno ENOEXEC on a plain file, Then
  assume it is a script written in the language of the shell
  trying to run the script, and run it in a subshell.

  As an aside, that means the commit 974e83a8f9a1 has changed the
  semantics.  The generated fakeroot script used to always be run
  by the GNU bash shell, but now it is run by `/bin/sh' which may
  not be bash (e.g., on my system, it is dash(1)).  However, this
  _probably_ does not matter, since, as I recall, POSIX(?) requires
  `/bin/sh' to implement the Bourne shell language, which is what
  the generated script uses, and what both dash and bash provide.

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
