From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jun 2016 00:46:48 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160602091758.714c6990@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
 <20160601235354.1248a84e@gmx.net>
 <20160602091758.714c6990@free-electrons.com>
Message-ID: <20160602224648.GE3714@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-02 09:17 +0200, Thomas Petazzoni spake thusly:
> On Wed, 1 Jun 2016 23:53:54 +0200, Peter Seiderer wrote:
> 
> > >  6/ Makefile: Fix overlay overwriting everything
> > >     http://patchwork.ozlabs.org/patch/581463/
> > > 
> > >     A problem with the merged /usr option, and when the rootfs overlay
> > >     contains specific directories. Discussion has happened, no decision.
> > >   
> > [...]
> > 
> > Was not aware of this patch (and the discussion) but the same change is
> > already committed with a slightly different reasoning ([1])...
> 
> Thanks for the feedback. When I looked at Maxime's patch, I also had
> the impression that the problem had already been fixed, but couldn't
> spot the fix (I thought we fixed it in a different way, in the skeleton
> package).
> 
> However, in the review of Maxime's patch, a number of issues have been
> raised, so I'm wondering we have in the end merged your patch which
> does the same, without answering those concerns.

I've re-read Armout's conerns, and I don't think they are valid. And it
would not break any further than it is broken today.

Arnout's concern was that an overlay could be deliberately setup to
override a directory, like /var/spool (which is a symlink to ../tmp in
our skeleton) to make it a real directory with subdirs in there.

That patch would break this use-case, true.

However, let's take another example: /var/log is a symlink to ../tmp. If
a package install a sub-directory in there [*] the the directory would
end up as a sub-dir in /tmp/ on the target.

Now if an overlay is setup to override /var/log@ to a real directory,
then the previous behaviour (before that patch) would create a broken
system already. The patch at least makes it so the system is no longer
broken.

So, all in all, both cases are broken, either before or after the patch.

And I prefer the brokenness we have now than the one we had before.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
