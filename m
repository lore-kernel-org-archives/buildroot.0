From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 25 Oct 2013 14:46:49 +0200
Subject: [Buildroot] [RFC] Continuous integration
Message-ID: <1464774.i3ScgRtXEf@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Unfortunately, I am really not sure to be able to follow Buildroot 
Developpers' Day (even with Google Hangout). However, I would like to 
expose one my ideas about patch integration scalability problem.

IMHO, current autobuilder is great to find corner cases, but for simple 
case, I think we can do better. I suggest to build ALL packages with a 
selection of representative reference configurations (uclibc, glibc, 
static, w/o IPv6, w/o MMU...). To make sense, this autobuilder should 
pool git changes and compile in priority new packages, modified package 
and packages which depends (directly or indirectly) from modified 
packages. 

Ideally, it should be able to give test results for branches before they 
would be merged.

It should also detect regression and send necessary alert. It would be 
better if it may identify commit and author of a regression.

I begin to wrote an autobuilder that would looks like that. You can sees
results there : http://sysmic.org/~jezz/autobuilder/ (at beginning, it 
was mainly for my personal needs)

It use a set of reference configurations which normally include all 
packages (at least as much as possible). It compute list of packages and 
their directories, list of targets for each configuration and 
dependencies of of each packages for each configuration. It is able to 
compute reverse dependencies and recursive dependencies.

Next, it ask to git modification time for each package directory. It is 
able to detect couple of packages/configuration which build time is 
older than package directory modification time.

It compute list of packages/configuration couple and sort it : never 
built first, modified next, a dependency modified after and finally 
other packages, ordered by last build time. Job queue is available 
there: http://sysmic.org/~jezz/autobuilder/jobqueue.html (/!\ 4Mo).

It build elements of job list until change is detected on git repository 
(in this case, it rebuild job queue).

For performance reasons, I don't run make clean between each package. I 
know it may be problematic for reproducibility. However, script will run 
make clean when it is about to rebuild a package that was not modified 
since last build and output directory had not been cleaned since last 
build (= same package with same output directory).

Finally, it dump result. It is able to detect when a package has 
compiled correctly, or it has failed or if a dependency has failed (and 
in this case, it shows problematic package).

Code is available there: 
   https://github.com/jerome-pouiller/br-continuous




-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
