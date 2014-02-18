From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:40:27 +0100
Subject: [Buildroot] [PATCH 4 of 4] alsa-utils: fix build on no-mmu
	targets
In-Reply-To: <CAAXf6LUU3E2gon--T888xHzF36QeyFv1hQ1SXMHW3FFgsq=yLA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 18 Feb 2014 14:47:45
 +0100")
References: <patchbomb.1392224140@argentina>
 <fba13b278df3df6a3fc7.1392224144@argentina>
 <8761ocwsvq.fsf@dell.be.48ers.dk>
 <CAAXf6LUU3E2gon--T888xHzF36QeyFv1hQ1SXMHW3FFgsq=yLA@mail.gmail.com>
Message-ID: <87sirg3xro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > Hi Peter,
 > On Tue, Feb 18, 2014 at 12:40 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
 >>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
 >> 
 >> > alsa-utils uses fork, which doesn't work on targets without mmu, such as
 >> > Blackfin. Apply a patch by the Blackfin developers to fix this.
 >> 
 >> > Fixes
 >> > http://autobuild.buildroot.org/results/9f8/9f8e572c9f1c677155cc7d1828371bcf572ff878
 >> 
 >> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 >> 
 >> What is the upstream status of this?

 > This has also been submitted without response:
 > http://mailman.alsa-project.org/pipermail/alsa-devel/2013-December/069749.html

:/

 >> I would be a lot happier with a patch simply doing s/fork/vfork/. If
 >> vfork is safe to use, we might as well use it everywhere - And if not,
 >> we shouldn't do it on nommu either.

 > It's been done before in commits
 > c2abc61d028b9e9cc602108ce1ad03942092bed2 and
 > d4b074554faa9451630cde47eb8378a8b0803252.
 > But it's far from pretty code, true.

My point is that if nommu follows a different code path than "normal"
Linux (and upstream doesn't test on nommu), then it is bound to break
sooner or later.

 >> > +    switch(pid) {
 >> > +    case 0:
 >> > +            /* child closes parent ends of pipes */
 >> 
 >> I'm far from a vfork expert, but as parent and child shares stack, how
 >> does it work with both calling close() on the pipes?

 > I'm no vfork expert either, but, from the manpage of vfork:

 >        vfork() differs from fork(2) in that the calling thread  is  sus?
 >        pended  until  the  child terminates (either normally, by calling
 >        _exit(2), or abnormally, after delivery of a fatal signal), or it
 >        makes  a  call  to execve(2).  Until that point, the child shares
 >        all memory with its parent, including the stack.  The child  must
 >        not  return  from  the  current function or call exit(3), but may
 >        call _exit(2).

 >        As with fork(2), the child process created  by  vfork()  inherits
 >        copies  of various of the caller's process attributes (e.g., file
 >        descriptors, signal dispositions, and current working directory);
 >        the  vfork()  call  differs  only in the treatment of the virtual
 >        address space, as described above.

Ahh yes, I forgot that the parent thread is stalled. Then the only
difference is that the devnull variable gets assigned to, but as that is
not accessed in the parent it shouldn't matter.


 > so the behavior of file descriptors seems the same as in fork.
 > The child basically does:
 >     setup input/output (pipes)
 >     execv()

 > The parent does:
 >     setup input/output (pipes)
 >     read output from child and store it

 > As the parent is blocked during the execution of the child, the child
 > will first fill the pipe with its data, then exit, and only then the
 > parent will read it. This is unlike the fork case where parent could
 > start reading data while the child is writing into the pipe.

The parent will actually get unblocked as soon as the child calls execv,
but yes.

 > The other introduction of fork in alsaloop/alsaloop.c is basically:
 > if (daemonize) {
 >     daemon();
 >     fork();
 >     if (parent) { exit() };
 > }

 > So the child is the only one doing actual work, there is no
 > communication between parent and child.
 > Also here, I believe the vfork change is acceptable...

But does the parent ever get to run so it can exit to the shell while
the child runs? I guess not.


 > What should we do with your comment on the HAVE_FORK check?
 > I'm not sure what upstream would think of either alternative...

As I said above, I really dislike having a seperate (largely untested)
codepath for !mmu if not absolutely needed.

-- 
Bye, Peter Korsgaard
