From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 15:22:58 +0200
Subject: [Buildroot] [PATCH 5/8] core/show-info: report whether a
 package is overriden
In-Reply-To: <20200411144248.49090e99@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <524b53bb81ecd33c55b242d239bee93f57c6c98b.1586592741.git.yann.morin.1998@free.fr>
 <20200411103602.75d8b9f2@windsurf.home>
 <20200411094436.GK29898@scaer>
 <20200411144248.49090e99@windsurf.home>
Message-ID: <20200411132258.GM29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-11 14:42 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2020 11:44:36 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > > I don't have a good suggestion, but I'm not sure "overriden" is the
> > > most appropriate term. Indeed, the download/extract/patch steps are
> > > also replaced by a rsync step for packages that use _SITE_METHOD =
> > > local, and such packages are not "overriden".  
> > 
> > It is very unfortunate that we conflate the two conditions.
> 
> Well, from an internal implementation point of view, SITE_METHOD =
> local and OVERRIDE_SRCDIR are just exactly the same thing.

But that is an implementation detail, indeed.

In fact, we should have had local support without override support. And
then we should have grafted override suport on top of the local one,
while the code as it is makes local re-use the override code...

I'll try to hack a cleanup in that area...

> Perhaps you could use:
> 
> 	"rsynced": $(if $($(1)_OVERRIDE_SRCDIR),true,false),

Fact is, that still does not reflect what I want to expose. An overriden
package is de-facto not reproducible, while a local package may.

But I don't care enough to argue further. "resynced" gets the same value
as "overriden", and since we can;t get the semantic of "overriden", it
is as good as it is.

> as this is really annotates the fact that the package source code is
> rsynced. You could even make it clearer with "source-rsynced" or
> something like that.
> 
> > We can't even reconstruct the override by looking at whether
> > _SITE_METHOD == local, because even local packages may be overriden...
> 
> Indeed.
> 
> > So, is it worth that I try and untangle the tow notions? Given the
> > feedback on the rest of this eries, I don;t want to invest too much time
> > if there is no chance of it getting in...
> 
> I think this particular patch is OK, even though admittedly the
> external tool could just watch for the correct stamp files to show up:
> if .stamp_downloaded shows up, we're downloading it normally, if
> .stamp_rsynced shows up, we have a local or overridden package.
> 
> In the design of the tool, it would be good to make sure that top-level
> parallel build is taken into account.

Which is exactly what I am trying to achieve here: provide all the info
about the internal details, so that the tool does not have to guess.

But personally I don't care about such a tool; I'm just trying to make
life easier for those (like eeppeliteloop in Cc) who want such tools.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
