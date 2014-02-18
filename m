From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 16:21:30 +0100
Subject: [Buildroot] [PATCH 4 of 4] alsa-utils: fix build on no-mmu
 targets
In-Reply-To: <CAAXf6LUU3E2gon--T888xHzF36QeyFv1hQ1SXMHW3FFgsq=yLA@mail.gmail.com>
References: <patchbomb.1392224140@argentina>
 <fba13b278df3df6a3fc7.1392224144@argentina>
 <8761ocwsvq.fsf@dell.be.48ers.dk>
 <CAAXf6LUU3E2gon--T888xHzF36QeyFv1hQ1SXMHW3FFgsq=yLA@mail.gmail.com>
Message-ID: <20140218162130.14a2350c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 18 Feb 2014 14:47:45 +0100, Thomas De Schampheleire wrote:

> > I'm far from a vfork expert, but as parent and child shares stack, how
> > does it work with both calling close() on the pipes?
> 
> I'm no vfork expert either, but, from the manpage of vfork:
> 
>        vfork() differs from fork(2) in that the calling thread  is  sus?
>        pended  until  the  child terminates (either normally, by calling
>        _exit(2), or abnormally, after delivery of a fatal signal), or it
>        makes  a  call  to execve(2).  Until that point, the child shares
>        all memory with its parent, including the stack.  The child  must
>        not  return  from  the  current function or call exit(3), but may
>        call _exit(2).
> 
>        As with fork(2), the child process created  by  vfork()  inherits
>        copies  of various of the caller's process attributes (e.g., file
>        descriptors, signal dispositions, and current working directory);
>        the  vfork()  call  differs  only in the treatment of the virtual
>        address space, as described above.
> 
> 
> so the behavior of file descriptors seems the same as in fork.
> The child basically does:
>     setup input/output (pipes)
>     execv()
> 
> The parent does:
>     setup input/output (pipes)
>     read output from child and store it
> 
> As the parent is blocked during the execution of the child, the child
> will first fill the pipe with its data, then exit, and only then the
> parent will read it. This is unlike the fork case where parent could
> start reading data while the child is writing into the pipe.
> 
> This code (run_program) is executed when a PROGRAM directive is
> encountered in the alsactl configuration. From 'man alsactl_init':
> 
>        PROGRAM
>            Execute external program. The key is true, if the program
>            returns without exit code zero. The whole event environment
>            is available to the executed program. The program's output
>            printed to stdout is available for the RESULT key.
> 
> 
> Based on this, and the code described above, it is not a problem that
> the parent is blocked during execution of the child, in run_program.
> I therefore think the vfork should work (untested).

I believe that the problem Peter is pointing at is not really that the
parent is blocked until the child execs, but rather that the child
shares all its data (including global and local variables) with the
parent, until the child execs.

Example:

	int foo = 2;

	pid = fork();
	if (pid == 0) {
		foo = 3;
		_exit(0);
	}
	else {
		sleep(1);
		printf("%d\n", foo);
	}

This will show "2" because the data is not shared between the child and
parent with fork().

Try the same example after replacing fork() with vfork(). The program
will show "3".

You can try the example above, it really shows the behavior I'm
explaining.

This means that if a single variable is modified by the child before it
exits or execs, then fork() cannot be replaced by vfork().

Now, I looked again at the alsa-utils code in alsactl/init_utils_run.c,
and I indeed don't see any variable being changed. Only file
descriptors are changed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
