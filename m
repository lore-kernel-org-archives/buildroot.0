From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 30 Nov 2015 13:32:18 +0100
Subject: [Buildroot] [PATCH 0/5] Introduce alternative archive format
In-Reply-To: <20151129180227.GE3630@free.fr>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
 <20151119130253.0dd0aebb@free-electrons.com> <20151129180227.GE3630@free.fr>
Message-ID: <10204706.XvmL4o525s@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sunday 29 November 2015 19:02:27 Yann E. MORIN wrote:
> J?r?me, Thomas, All,
> 
> On 2015-11-19 13:02 +0100, Thomas Petazzoni spake thusly:
> > On Thu, 19 Nov 2015 11:36:01 +0100, J?r?me Pouiller wrote:
> > > As suggested by Arnout [1], this series provide an alternative
> > > archive format. This new format contains a shallowed version of
> > > upstream repository. This format is a little bigger and a little
> > > longer to create but it allow a better workflow with upstream. I
> > > describe some good practice in patch 2.
> > > 
> > > Notice projects hosted by github don't yet benefit of this feature
> > > since I have not found any elegant way to do it :-(.
> > > 
> > > During my tests, I have noticed current shallow clone is mostly
> > > broken (at least with git < 2.5 [2]). Indeed, shallow clone only
> > > work with symbolic references (HEAD, a tag or a branch). However,
> > > we avoid use of symbolic references in VERSION.
> > 
> > Thanks for this contribution.
> > 
> > Your justification in PATCH 2 is just "That simplify workflow with
> > upstream". However, we already have the <pkg>_OVERRIDE_SRCDIR
> > mechanism (and <pkg>_SITE_METHOD = local, which is the same) to
> > specifically address this use case.
> > 
> > The idea with <pkg>_OVERRIDE_SRCDIR is that if you are actively
> > developing on a software component, then it should not be
> > Buildroot's
> > responsibility to download/extract/patch it, but it should instead
> > use a locally available source directory, which is managed
> > completely separately from Buildroot. There you can do whatever
> > Git, Subversion or Mercurial version control you want, Buildroot
> > will simply rsync to the build directory.
> > 
> > I think doing development in the build directory, as encouraged by
> > your patch, is a bad practice. The build directory is a temporary
> > location, people should not be encouraged to work from there.
> > 
> > And I fail to see what your solution brings compared to using
> > <pkg>_OVERRIDE_SRCDIR or <pkg>_SITE_METHOD = local. To me, the
> > existing solutions are in fact more flexible and don't encourage
> > the practice of hacking in the build directory.
> > 
> > Of course, if there is a specific workflow that you could describe
> > that doesn't work with <pkg>_OVERRIDE_SRCDIR, then I'm definitely
> > interested, and from this discussion we can decide whether
> > improvements to OVERRIDE_SRCDIR are needed, or if a completely
> > different solution is needed.
> 
> I have to agree with Thomas: we already have one mechanism to do
> actual development on packages, and I believe that it is the best we
> can offer:
> 
>   - it is not removed on 'make clean'  (the killing feature for it)
> 
>   - it can be managed however the developer wants to  (that too is a
>     killing feature)
> 
>   - it is not too complex to setup
> 
> Also, I believe it covers all use-cases we can imagine.
> 
> The one thing that is made a bit more complex is gdb-ing, because path
> in the build directory are referenced, rather than in the actual
> source dir. IMHO, that's a minor annoyance, and it is easy to
> mentally match the former to the latter.
> 
> So, except for the first patch which is indeed a nice cleanup, I'm not
> too favourable to that series as a whole...

hmm... You suggest to use <pkg>_OVERRIDE_SRCDIR even to do small fixes 
like build failures or version changes? In this case, I offer to provide 
a script to do same thing than in my proposal (get git repo if available 
and apply BR patches) but in an external directory. But I don't like 
this approach because it break concept that everything is launched from 
"make"


Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
