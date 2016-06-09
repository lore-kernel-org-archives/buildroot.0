From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jun 2016 23:36:46 +0200
Subject: [Buildroot] Why fakeroot works without #! (basically, RTFM)
In-Reply-To: <2951546.bZKNuKFtLY@laclwks004>
References: <2951546.bZKNuKFtLY@laclwks004>
Message-ID: <20160609213646.GD3826@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brian, All,

On 2016-06-08 12:08 +0200, Brian Foster spake thusly:
>   I happened to notice in very recent commit 974e83a8f9a1
>   ("fs: add sha-bang to fakeroot script") the comment:
>     
>     ? We [are] directly running this script, so it should start
>      with a sha-bang (not sure why/how it works today...). ?

Oh, someone does read commit logs! :-)

>   What is running the (generated) fakeroot script being talked
>   about is the the Host script .../usr/bin/fakeroot, which is a
>   GNU bash script.  The answer then is in ??COMMAND EXECUTION'
>   of the bash(1) manual page:
> 
>     ? If [the exec()] fails because the file is not in executable
>      format, and  the file is not a directory, it is assumed to be
>      a shell script, a file containing shell commands.  A subshell
>      is spawned to execute it. [...] ?

Well, this was a part of the bash manpage I was not familiar with.
Thanks!

>   Or in other words, the traditional Unix shell behaviour of:
>   If exec() failed with errno ENOEXEC on a plain file, Then
>   assume it is a script written in the language of the shell
>   trying to run the script, and run it in a subshell.

Meh, that's so dangerous...

>   As an aside, that means the commit 974e83a8f9a1 has changed the
>   semantics.  The generated fakeroot script used to always be run
>   by the GNU bash shell, but now it is run by `/bin/sh' which may
>   not be bash (e.g., on my system, it is dash(1)).  However, this
>   _probably_ does not matter, since, as I recall, POSIX(?) requires
>   `/bin/sh' to implement the Bourne shell language, which is what
>   the generated script uses, and what both dash and bash provide.

Yes, POSIX mandates that /bin/sh be a bourne shell.

And the script we generate is expected to be POSIX-compliant, i.e. it
should not be using bashisms. So /bin/sh is the correct shell to use.

If we were to use bahsisms in the future, we'd have to change that to
bash, yes.

Thanks for the explanations!

Regards,
Yann E. MORIN.

> cheers!
> 	-blf-
> 
> -- 
> Brian Foster
> Principal MTS, Software        |  La Ciotat, France
> Maxim Integrated               |  http://www.maximintegrated.com/
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
