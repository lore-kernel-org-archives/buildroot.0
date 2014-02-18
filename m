From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 Feb 2014 14:47:45 +0100
Subject: [Buildroot] [PATCH 4 of 4] alsa-utils: fix build on no-mmu
	targets
In-Reply-To: <8761ocwsvq.fsf@dell.be.48ers.dk>
References: <patchbomb.1392224140@argentina>
 <fba13b278df3df6a3fc7.1392224144@argentina>
 <8761ocwsvq.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUU3E2gon--T888xHzF36QeyFv1hQ1SXMHW3FFgsq=yLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Feb 18, 2014 at 12:40 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > alsa-utils uses fork, which doesn't work on targets without mmu, such as
>  > Blackfin. Apply a patch by the Blackfin developers to fix this.
>
>  > Fixes
>  > http://autobuild.buildroot.org/results/9f8/9f8e572c9f1c677155cc7d1828371bcf572ff878
>
>  > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> What is the upstream status of this?

This has also been submitted without response:
http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069749.html

>
>  > ---
>  >  package/alsa-utils/alsa-utils-0001-no-mmu.patch |  61 ++++++++++++++++++++
>  >  package/alsa-utils/alsa-utils.mk                |   1 +
>  >  2 files changed, 62 insertions(+), 0 deletions(-)
>
>  > diff --git a/package/alsa-utils/alsa-utils-0001-no-mmu.patch b/package/alsa-utils/alsa-utils-0001-no-mmu.patch
>  > new file mode 100644
>  > --- /dev/null
>  > +++ b/package/alsa-utils/alsa-utils-0001-no-mmu.patch
>  > @@ -0,0 +1,61 @@
>  > +Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
>  > +
>  > +Add no-mmu support for alsa-utils mainly for Blackfin
>  > +---
>  > + alsactl/init_utils_run.c |    4 ++++
>  > + alsaloop/alsaloop.c      |    8 ++++++++
>  > + configure.in             |    1 +
>  > + 3 files changed, 13 insertions(+)
>  > +
>  > +diff --git a/alsactl/init_utils_run.c b/alsactl/init_utils_run.c
>  > +--- a/alsactl/init_utils_run.c
>  > ++++ b/alsactl/init_utils_run.c
>  > +@@ -89,7 +89,11 @@ int run_program0(struct space *space,
>  > +            argv[0] = program;
>  > +    }
>  > +
>  > ++   #ifdef HAVE_FORK
>  > +    pid = fork();
>  > ++   #else
>  > ++   pid = vfork();
>  > ++   #endif
>
> I would be a lot happier with a patch simply doing s/fork/vfork/. If
> vfork is safe to use, we might as well use it everywhere - And if not,
> we shouldn't do it on nommu either.

It's been done before in commits
c2abc61d028b9e9cc602108ce1ad03942092bed2 and
d4b074554faa9451630cde47eb8378a8b0803252.
But it's far from pretty code, true.

>
>
>  > +    switch(pid) {
>  > +    case 0:
>  > +            /* child closes parent ends of pipes */
>
> I'm far from a vfork expert, but as parent and child shares stack, how
> does it work with both calling close() on the pipes?

I'm no vfork expert either, but, from the manpage of vfork:

       vfork() differs from fork(2) in that the calling thread  is  sus?
       pended  until  the  child terminates (either normally, by calling
       _exit(2), or abnormally, after delivery of a fatal signal), or it
       makes  a  call  to execve(2).  Until that point, the child shares
       all memory with its parent, including the stack.  The child  must
       not  return  from  the  current function or call exit(3), but may
       call _exit(2).

       As with fork(2), the child process created  by  vfork()  inherits
       copies  of various of the caller's process attributes (e.g., file
       descriptors, signal dispositions, and current working directory);
       the  vfork()  call  differs  only in the treatment of the virtual
       address space, as described above.


so the behavior of file descriptors seems the same as in fork.
The child basically does:
    setup input/output (pipes)
    execv()

The parent does:
    setup input/output (pipes)
    read output from child and store it

As the parent is blocked during the execution of the child, the child
will first fill the pipe with its data, then exit, and only then the
parent will read it. This is unlike the fork case where parent could
start reading data while the child is writing into the pipe.

This code (run_program) is executed when a PROGRAM directive is
encountered in the alsactl configuration. From 'man alsactl_init':

       PROGRAM
           Execute external program. The key is true, if the program
           returns without exit code zero. The whole event environment
           is available to the executed program. The program's output
           printed to stdout is available for the RESULT key.


Based on this, and the code described above, it is not a problem that
the parent is blocked during execution of the child, in run_program.
I therefore think the vfork should work (untested).


The other introduction of fork in alsaloop/alsaloop.c is basically:
if (daemonize) {
    daemon();
    fork();
    if (parent) { exit() };
}

So the child is the only one doing actual work, there is no
communication between parent and child.
Also here, I believe the vfork change is acceptable...


What should we do with your comment on the HAVE_FORK check?
I'm not sure what upstream would think of either alternative...

Thanks,
Thomas
