From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Apr 2018 19:29:04 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: Take default
 SOURCE_DATE_EPOCH from repo containing Makefile
In-Reply-To: <e872ea7b-0202-d77a-6620-8e6113570e33@origamienergy.com>
References: <1523356092-16037-1-git-send-email-james.byrne@origamienergy.com>
 <20180410143630.22646b86@windsurf>
 <e872ea7b-0202-d77a-6620-8e6113570e33@origamienergy.com>
Message-ID: <20180412172904.GC4221@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, Thomas, All,

On 2018-04-12 16:40 +0100, James Byrne spake thusly:
> On 10/04/18 13:36, Thomas Petazzoni wrote:
> > On Tue, 10 Apr 2018 11:28:12 +0100, James Byrne wrote:
> >> diff --git a/Makefile b/Makefile
> >> index cd53362..3b846b9 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -506,7 +506,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
> >>   # If SOURCE_DATE_EPOCH has not been set then use the commit date,
> or the last
> >>   # release date if the source tree is not within a Git repository.
> >>   # See: https://reproducible-builds.org/specs/source-date-epoch/
> >> -BR2_VERSION_GIT_EPOCH := $(shell $(GIT) --git-dir=$(TOPDIR)/.git
> log -1 --format=%at 2> /dev/null)
> >> +BR2_VERSION_GIT_EPOCH := $(shell $(GIT) log -1 --format=%at 2>
> /dev/null)

I was pretty sure I had ACKed that patch. Seems not, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> > Was there a reason to have this --git-dir/GIT_DIR option/variable
> > passed in the first place ?
> >
> > I don't immediately see any problem with the change you're proposing,
> > but I'm wondering why we were passing --git-dir (previously GIT_DIR).
> >
> > It has been done this way since commit
> > 9befe94baf990ee6331e77edb40e286e9dc4df8d, where SOURCE_DATE_EPOCH was
> > introduced in Buildroot.
> 
> I don't know, but my guess would be that the original author thought
> that if you were building out of tree then the current directory might
> be somewhere else, so they wanted to ensure it would use the right one,
> but in fact the current directory can only be the one containing Makefile.

Indeed, the current directory can only be the Buildroot top-dir,
whatever the conditions we call Buildroot;

  - in-tree: well, obviously, we're in top-dir,
  - out-fo-tree with 'make -C': make will chdir into our top-dir,
  - out-of-tree, via wrapper: the wrapper calls make -C

So, it does not really make sense to enforce the git directory.

Regards,
Yann E. MORIN.

> The contents of this email and any attachment are confidential to the intended recipient(s). If you are not an intended recipient: (i) do not use, disclose, distribute, copy or publish this email or its contents; (ii) please contact the sender immediately; and (iii) delete this email. Origami Energy Limited (company number 8619644); Origami Storage Limited (company number 10436515) and OSSPV001 Limited (company number 10933403), each registered in England and each with a registered office at: Ashcombe Court, Woolsack Way, Godalming, GU7 1LQ.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
