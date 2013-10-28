From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 28 Oct 2013 10:47:03 +0100
Subject: [Buildroot] [RFC] Continuous integration
In-Reply-To: <526E0937.1070902@mind.be>
References: <1464774.i3ScgRtXEf@sagittae> <526E0937.1070902@mind.be>
Message-ID: <3123747.79B3Y367BF@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 28 October 2013 07:50:31 Arnout Vandecappelle wrote:
> On 25/10/13 14:46, J?r?me Pouiller wrote:
[...]
>   This idea sounds good. Unfortunately, it looks like nobody read your
> mail before the developer days so we didn't discuss this subject...
It my fault, I was late.

> > Ideally, it should be able to give test results for branches before
> > they would be merged.
> 
>   We'd like to keep the current workflow of committing each patch
> individually - it gives cleaner history than with merges. 
I mean before they would be committed. We are agree.

> But that's
> not really relevant, because these test builds could run for each
> patch individually and report success, which indicates that it can be
> applied by Peter.
Current implementation run tests when a commit is done. You suggest to 
run test as soon as patch is sent to ML. 

It is a good idea but very different than current implementation. I will 
need a little more time to implement this.


> > It should also detect regression and send necessary alert. It would
> > be better if it may identify commit and author of a regression.
> > 
> > I begin to wrote an autobuilder that would looks like that. You can
> > sees results there : http://sysmic.org/~jezz/autobuilder/ (at
> > beginning, it was mainly for my personal needs)
> > 
> > It use a set of reference configurations which normally include all
> > packages (at least as much as possible). It compute list of packages
> > and their directories, list of targets for each configuration and
> > dependencies of of each packages for each configuration. It is able
> > to compute reverse dependencies and recursive dependencies.
> 
>   Why all packages? If it's about testing new packages, then it should
> be tested with only the new package selected (+ any dependencies). If
> it's about testing infrastructural changes, then it should be done on
> a clean tree (which you mention below that you don't do).
Idea was to rebuild in priority new/modified packages. When there is 
nothing more to do. Rebuild a package that was not modified.


> > Next, it ask to git modification time for each package directory. It
> > is able to detect couple of packages/configuration which build time
> > is older than package directory modification time.
> > 
> > It compute list of packages/configuration couple and sort it : never
> > built first, modified next, a dependency modified after and finally
> > other packages, ordered by last build time. Job queue is available
> > there: http://sysmic.org/~jezz/autobuilder/jobqueue.html (/!\ 4Mo).
> > 
> > It build elements of job list until change is detected on git
> > repository (in this case, it rebuild job queue).
> > 
> > For performance reasons, I don't run make clean between each
> > package. I know it may be problematic for reproducibility. However,
> > script will run make clean when it is about to rebuild a package
> > that was not modified since last build and output directory had not
> > been cleaned since last build (= same package with same output
> > directory).
> > 
> > Finally, it dump result. It is able to detect when a package has
> > compiled correctly, or it has failed or if a dependency has failed
> > (and in this case, it shows problematic package).
> > 
> > Code is available there:
> >     https://github.com/jerome-pouiller/br-continuous
> 
>   Do you also have a server on which to run this? Could it send out
> success/failure reports to the list (or maybe first to the author and
> a few key developers, until we're sure it works well)?
Normally, http://sysmic.org/~jezz/autobuilder/ should work, isn't? You 
may also look at http://sysmic.org/~jezz/autobuilder/jobqueue.html for 
job list . 



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
