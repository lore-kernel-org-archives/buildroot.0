From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 23:58:31 +0200
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <20150413230640.10513197@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413204916.GJ29025@free.fr>
 <20150413230640.10513197@free-electrons.com>
Message-ID: <20150413215831.GQ29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-13 23:06 +0200, Thomas Petazzoni spake thusly:
> On Mon, 13 Apr 2015 22:49:16 +0200, Yann E. MORIN wrote:
> 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > However, I noticed that source-check tries to go to the mirror. For
> > example, cjson fails to download from svn for me here, and it falls back
> > to looking on the mirror, and thus concludes it exists.
> > 
> > Shouldn't source-check be limited to looking at the upstream locations?
> > 
> > However, not a blocker, since it;s already the behaviour we have.
> 
> Yes, the behavior you're observing is indeed the current behavior as
> far as I know, so my patches are not changing this. Indeed, we could
> discuss whether source-check should check only primary site + upstream
> site, or primary site + upstream site + sources.b.o.
> 
> From a BR maintenance point of view, checking only primary site +
> upstream is probably better as it means we can get notified when an
> upstream has disappeared.
> 
> But from a BR user point of view, what's important is that the source
> code remains available *somewhere*, be it from upstream or sources.b.o.
> 
> So I'm not very decided on this. Opinions welcome.

Well, I have a slightly different opinion.

First, I agree that for Buildroot maintenance, we only care about
upstream, not even primary or backup sites. We do not even have a
primary.

Second, for a user that wants to be serious, the only thing that would
really matter in the end is the existence of the package on the primary
site.

Let me explain...

In an enterprise-grade project, one can not rely on external resources
to be always available; one can only rely on internal resources. Thus,
in that case, source-check should only look at the primary.

However, that primary has to filled in to begin with, and that is often
done by just running "make source" and then copying those sources to the
primary. If an upstream source is missing, it is the moment one wants to
be notified. There's no reason to run a source-check onto upstream, even
less so on the mirror.

So, in my opinion, source-check should behave as such:

  - if primary is set, only check on primary
  - if primary is not set, only check upstream
  - never check on the mirror

That would cover the use-cases above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
