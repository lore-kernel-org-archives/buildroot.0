From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 03 Nov 2014 16:01:57 +0100
Subject: [Buildroot] [PATCH] infra: Add a way to apply patches using git
In-Reply-To: <20141101231125.2ca351ca@free-electrons.com>
References: <1404321605-20073-1-git-send-email-jezz@sysmic.org>
 <5455595F.6090205@mind.be> <20141101231125.2ca351ca@free-electrons.com>
Message-ID: <10430487.gOJDMNlg1N@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 01 November 2014 23:11:25 Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Sat, 01 Nov 2014 23:06:23 +0100, Arnout Vandecappelle wrote:
> > > We discussed this proposal at the last Buildroot Developers meeting.
> > > Even though we understand the idea and some of us found it potentially
> > > interesting, we didn't really like the implementation, but nobody
> > > really found a way of implementing something like this in a nice way.
> > > 
> > > One of the problem is that not all our patches are Git patches, which
> > > you had to work-around in your patch in a way that isn't really nice.
> > > 
> > > Maybe Arnout and Yann (in Cc) remember more of the issues that we
> > > discussed at the meeting regarding this proposal.
> >  
> >  For simple patches, a simple diff is normally sufficient. For more
> >  complicated> 
> > stuff, it is really worthwhile to clone the upstream repository and work
> > from there - you'll anyway need to do that to upstream the patches.
> > 
> >  So we felt that the need for this feature did not outweigh the complexity
> >  of> 
> > its implementation.
>
> Ah yes, right: we thought that having a Git repository that isn't the
> one from upstream made it unpractical to submit patches back to
> upstream, and was making the entire feature a bit useless.
I also worried about this restriction. My first idea was to recreate the link 
between source directory and upstream repository with something like:

   cd $PKG_BUILD_DIR
   git clone $PKG_SITE --bare .git
   git config --bool core.bare false
   git rev-parse $PKG_VERSION > .git/HEAD
   git reset

However, my patch began to smell black magic. 


Ideally, I wanted to create an external tool to do this. However, it is not 
easy to integrate an external tool with Makefile system (For example, I did 
not found any handy way to get variables associated with package).


If anyone have ideas about this subject, I would be happy to work on and 
resubmit a patch.


-- 
J?r?me Pouiller, Sysmic
