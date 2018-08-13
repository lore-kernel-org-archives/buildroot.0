From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2018 18:19:55 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <5b7196ad77a28_5d773f801c6b6e18120e9@ultri5.mail>
References: <20180812224139.2b81b839@windsurf>
 <5b7196ad77a28_5d773f801c6b6e18120e9@ultri5.mail>
Message-ID: <20180813161955.GE7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-08-13 11:33 -0300, Ricardo Martincoski spake thusly:
> On Sun, Aug 12, 2018 at 05:41 PM, Thomas Petazzoni wrote:
> > On Sun, 12 Aug 2018 22:25:43 +0200, Yann E. MORIN wrote:
> >> > Commit 'refs/pull/1014/head' is a branch name.
> >> > Using a branch name is not supported.  
[--SNIP--]
> >> Sure, you'd argue that an automated build job could do the build. But
> >> you anyway have to write some scripting for that automated job anyway.
> >> Just have it prepare a git clone of the affected package, checkout the
> >> correct commit, and prepare a local.mk with the correct override-srcdir
> >> befor attempting the buildroot build.
> It seems a lot of scripting for something that git supports natively and that

Not true: they are not even fetched by default at all. If they were,
then we would not be having this discussion. As it stands, we currently
have to resort to unstable trickery to use those.

> could be added to the backend to support the right way: using sha1 for
> reproducibility.

I also thought about it and tried to replace the special ref by its
expanded sha1 and name the local archive by the sha1.

But that does not work, because locating the tarball is completely
decorelated from generating it.

I.e. the code that extracts the tarball has no way to know that the
version string has been changed!

[--SNIP--]
> Gerrit Changes (when the server has the 'Draft' mode disabled) do not suffer
> from the same. Each new revision ('Patch Set') has its own sha1. The refs for
> many revisions of Change 1001 look like this:
> refs/changes/01/1001/1
> refs/changes/01/1001/2
> refs/changes/01/1001/3

So, those would be stable, it looks like, indeed.

But then it means we're maybe currently doing it wrong anyway, as we
create a local branch for something that is more akin to a tag...

[--SNIP--]
> What I think we should do is:
>  - to re-add support to download of the sha1 of any ref (branch, tag, special
>    ref).

That is not supposed to be broken, and should work again if we check if
the remote has the ref as we both suggested in previous replies in this
thread (but you and I with different solutions).

>  - add automated tests to avoid going back and forth, supporting some refs,
>    then dropping support for them and then supporting them.

Yes, your series doing that is still pending... TBH, it is still marked
as unread here, because I still want to have a look at it...

>  - drop the support to the name of a special ref as it is not guaranteed to be
>    reproducible.

This should be done before we add tests, I think.

[--SNIP--]
> But maybe even this patch "detect and abort" should not be applied to 2018.08
> either as it is not so trivial, demonstrated by this review.
> Just to be clear: please do not apply v1 of this patch. It will break things.

Agreed. It is material for next.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
