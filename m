From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Nov 2014 22:20:25 +0100
Subject: [Buildroot] [PATCH v4 9/9] autobuild-run: extend TODO list
In-Reply-To: <CAAXf6LVgM33BfF2M4xCJebq4s+Rj8XjXzWxwU4YnJ4zotEJZ5w@mail.gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
 <1415822317-22500-10-git-send-email-patrickdepinguin@gmail.com>
 <CAAXf6LVgM33BfF2M4xCJebq4s+Rj8XjXzWxwU4YnJ4zotEJZ5w@mail.gmail.com>
Message-ID: <20141125222025.1ce56775@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 25 Nov 2014 22:09:13 +0100, Thomas De Schampheleire wrote:

> > diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> > index 7fe0b00..a73ccc9 100755
> > --- a/scripts/autobuild-run
> > +++ b/scripts/autobuild-run
> > @@ -47,6 +47,17 @@
> >  # - Instead of excluding all configurations that have
> >  #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
> >  #   necessary host machine requirements are there to build classpath.
> > +# - Integrate method check-requirements with the SysInfo class, distinghuishing
> > +#   between required and optional dependencies.
> > +# - Extend required dependencies to subversion, mercurial, cpio, wget, python,
> > +#   etc.
> > +# - Detect selection of multiple virtual package providers and don't consider it
> > +#   a failure
> > +# - Properly handle kill of main script: stop all running children and do not
> > +#   print out stacktraces
> 
> Brief update on this topic: the autobuild-run code currently kills the
> process group associated with the python process, but it turns out
> that the build jobs are not part of the same process group as the
> python process.
> As far as I can see, the subprocess class should spawn processes into
> the same process group, so maybe make is explicitly changing this?
> Further investigation is needed here, but I think that if we can make
> sure that these processes are part of the same group as the python
> parent process, then the kill of autobuild-run will automatically kill
> the children, as expected.
> 
> To visualize the process groups: ps -e -o pid,user,pgid,args --sort pgid

Thanks for this investigation. It would indeed be really nice to be
able to kill just autobuild-run, and be sure that it stops all
underlying builds. We could also catch the signal in autobuild-run, and
kill the build jobs, if we are able to record the necessary information
about them.


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
