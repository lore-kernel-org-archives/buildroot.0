From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 07 Nov 2013 14:37:21 +0100
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <CAC2S8khWpEpUZiYOrzE2agTXehwW+g5Pkncqdp2PRsc25bT-cw@mail.gmail.com>
References: <1464774.i3ScgRtXEf@sagittae>
 <CAC2S8khWpEpUZiYOrzE2agTXehwW+g5Pkncqdp2PRsc25bT-cw@mail.gmail.com>
Message-ID: <1649802.VKqnEsp2qV@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 05 November 2013 10:29:52 Matt Weber wrote:
> On Fri, Oct 25, 2013 at 7:46 AM, J?r?me Pouiller <jezz@sysmic.org> 
wrote:
> > Hello,
> 
> <snip>
> 
> > Code is available there:
> >    https://github.com/jerome-pouiller/br-continuous
> 
> We've been giving your script a try and made some updates.  So I went
> ahead and created a (github)fork (should have a few updates checked in
> tonight).
Thanks for your interest.

> I fixed a couple items that may have been bugs (or possibly just how I
> used the script).  I current have been running into an issue where
> after git updates are detected, previously built pkgs try to rebuild
> without doing a clean. I see where the conditional is that should be
> executing the clean but haven't tracked down why I'm not hitting that
> path yet.
By the way, it's difficult to find the right place to do a clean. 

 - Between each package, it take to much time.

 - After any changes on git. But, for packages with many dependencies 
(like qt5webkit), it means we will have to wait at least 3h per 
configuration to have results. However, this solution is simple and 
guarantee reproducibility of builds.

 - Currently, I check if a clean happens since last build (in reality, 
not any kind of build) of package. If it not the case, I launch make 
clean. 


> I also noticed that once the script processes all jobs it gets into a
> loop, I added a fix for that that prevents running the jobs unless
> there are still jobs to execute in the job list.
Good point. I will merge that.

> I noticed there isn't a good way to restart the script after you stop
> it, is my understanding correct?  I (temporarily) added a cleanup
> sequence before the mainloop executes to remove history and each cfgs
> build before proceeding.
Normally, current implementation should work. It should populate 
database with previous results. It is just long to launch (20min on my 
server !). It would be better to change format of results to improve 
launch time.

> I think there might be a bug with detecting when a package fails to
> build, I'll see if I can resolve this and let you know.  I haven't had
> a package actually error yet, but have had some that never built
> because of host dependency error or download error
I did not noticed that.

> I was wondering what your thoughts were for the report?  I'm guessing
> what's currently committed was the start of something based on this
> thread of discussion.  I could see gathering a list of package err,
> git id, and list to build output (similarly to the autobuilder
> results).
List of all package errors would be too long. I think report should only 
include package status changes (OK -> KO, N/A -> KO, but also KO -> OK). 

Report should also report configuration changes after "yes | make 
oldconfig".

Currently my main problem is execution of "yes | make oldconfig". In 
case "y" is not a valid answer, this command will loop infinitely (and 
"yes '' | make oldconfig" is not a good solution since i want to build 
new packages).



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
