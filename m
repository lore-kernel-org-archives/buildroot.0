From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Fri, 8 Nov 2013 13:35:46 -0600
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <1649802.VKqnEsp2qV@sagittae>
References: <1464774.i3ScgRtXEf@sagittae>
 <CAC2S8khWpEpUZiYOrzE2agTXehwW+g5Pkncqdp2PRsc25bT-cw@mail.gmail.com>
 <1649802.VKqnEsp2qV@sagittae>
Message-ID: <OF5D58F4C2.77D4F569-ON86257C1D.005A57B4-86257C1D.006BA51B@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me Pouiller <j.pouiller@expemb.com> wrote on 11/07/2013 07:37:21 AM:

> From: J?r?me Pouiller <jezz@sysmic.org>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 11/07/2013 07:37 AM
> Subject: Re: [Buildroot] [RFC] Continuous integration
> Sent by: J?r?me Pouiller <j.pouiller@expemb.com>
> 
<snip>

> > I fixed a couple items that may have been bugs (or possibly just how I
> > used the script).  I current have been running into an issue where
> > after git updates are detected, previously built pkgs try to rebuild
> > without doing a clean. I see where the conditional is that should be
> > executing the clean but haven't tracked down why I'm not hitting that
> > path yet.
> By the way, it's difficult to find the right place to do a clean. 
> 
>  - Between each package, it take to much time.
> 
>  - After any changes on git. But, for packages with many dependencies 
> (like qt5webkit), it means we will have to wait at least 3h per 
> configuration to have results. However, this solution is simple and 
> guarantee reproducibility of builds.
> 
>  - Currently, I check if a clean happens since last build (in reality, 
> not any kind of build) of package. If it not the case, I launch make 
> clean. 
> 
We might have a fourth semi-continuous integration scenario that prevents 
server thrashing at each check-in. 
- We run the script every night processing the current GIT tip at that 
time. 
- We clean each of the full cfg builds and let the script do a complete 
re-build.  (We do this because the individual pkg  cleans aren't 
guaranteed 
to cleanup the pkg installs)
- Once all jobs complete we terminate the script and eventually will send
the report with status.
(I'll clean-up what I changed and get it committed.  Would you be up for 
optional runtime config options?  One might be to enable continuous 
or a one-stop script execution.)

<snip>

> 
> > I noticed there isn't a good way to restart the script after you stop
> > it, is my understanding correct?  I (temporarily) added a cleanup
> > sequence before the mainloop executes to remove history and each cfgs
> > build before proceeding.
> Normally, current implementation should work. It should populate 
> database with previous results. It is just long to launch (20min on my 
> server !). It would be better to change format of results to improve 
> launch time.
I had a chance to look at this a bit more and I removed some of the 
clean-up
and made it so that the script could be used to do a single "one-shot" 
build
of the current GIT.  (I'll push this once I get it cleaned up)

> 
> > I think there might be a bug with detecting when a package fails to
> > build, I'll see if I can resolve this and let you know.  I haven't had
> > a package actually error yet, but have had some that never built
> > because of host dependency error or download error
> I did not noticed that.
I figured out what was going on.  It was a failure of a Dependent package. 

So in my case the busybox was failing, however the busybox package never 
actually
failed itself.  I think this was because it was built as a Dep for other 
packages and never having it's own build attempted.  I was going to look
at this a bit more, as I think it's doing this because you flag a build 
failure for the current package build, not for a failure of a Dep.

> 
> > I was wondering what your thoughts were for the report?  I'm guessing
> > what's currently committed was the start of something based on this
> > thread of discussion.  I could see gathering a list of package err,
> > git id, and list to build output (similarly to the autobuilder
> > results).
> List of all package errors would be too long. I think report should only 

> include package status changes (OK -> KO, N/A -> KO, but also KO -> OK). 

Yeah, I agree, something with a simple status is preferred.  Maybe with 
a cfg summary at the top and a drill down with hyper links to the package 
status (similarly to the webpage).

> 
> Report should also report configuration changes after "yes | make 
> oldconfig".
Ok, so you're thinking additions/removals of buildroot configuration 
options?

> 
> Currently my main problem is execution of "yes | make oldconfig". In 
> case "y" is not a valid answer, this command will loop infinitely (and 
> "yes '' | make oldconfig" is not a good solution since i want to build 
> new packages).
Yeah, already had some fun with that :-)

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com
