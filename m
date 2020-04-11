From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 16:14:39 +0200
Subject: [Buildroot] [PATCH 5/8] core/show-info: report whether a
 package is overriden
In-Reply-To: <20200411132258.GM29898@scaer>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <524b53bb81ecd33c55b242d239bee93f57c6c98b.1586592741.git.yann.morin.1998@free.fr>
 <20200411103602.75d8b9f2@windsurf.home>
 <20200411094436.GK29898@scaer>
 <20200411144248.49090e99@windsurf.home>
 <20200411132258.GM29898@scaer>
Message-ID: <20200411161439.7f7c784f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Apr 2020 15:22:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Well, from an internal implementation point of view, SITE_METHOD =
> > local and OVERRIDE_SRCDIR are just exactly the same thing.  
> 
> But that is an implementation detail, indeed.
> 
> In fact, we should have had local support without override support. And
> then we should have grafted override suport on top of the local one,
> while the code as it is makes local re-use the override code...

I am not sure what that would bring, and how that would make things
better/clearer. Ultimately, what happens for both overridden packages
and local packages is that they are rsynced.

> > Perhaps you could use:
> > 
> > 	"rsynced": $(if $($(1)_OVERRIDE_SRCDIR),true,false),  
> 
> Fact is, that still does not reflect what I want to expose. An overriden
> package is de-facto not reproducible, while a local package may.

I don't understand why a local package is more reproducible than an
overridden package. In both cases, Buildroot cannot guarantee the
reproducibility.

> But I don't care enough to argue further. "resynced" gets the same value
> as "overriden", and since we can;t get the semantic of "overriden", it
> is as good as it is.

I don't follow your reasoning here. I am fine with having the boolean
this patch proposes to add, I was just suggesting another term than
"overridden", as that was not really covering the case of local
packages.

> > I think this particular patch is OK, even though admittedly the
> > external tool could just watch for the correct stamp files to show up:
> > if .stamp_downloaded shows up, we're downloading it normally, if
> > .stamp_rsynced shows up, we have a local or overridden package.
> > 
> > In the design of the tool, it would be good to make sure that top-level
> > parallel build is taken into account.  
> 
> Which is exactly what I am trying to achieve here: provide all the info
> about the internal details, so that the tool does not have to guess.

And I'm not sure it's a worthwhile goal. I think the tool should just
have the knowledge of what possible stamp files exist, and what are the
possible sequences of stamp file creation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
