From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 21:20:28 +0100
Subject: [Buildroot] [PATCH] slang: make install-static do
	install-pkgconfig
In-Reply-To: <87mvq2gmo4.fsf@dell.be.48ers.dk>
References: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
 <87mvq2gmo4.fsf@dell.be.48ers.dk>
Message-ID: <20160313202028.GA3488@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-03-13 21:14 +0100, Peter Korsgaard spake thusly:
> >>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:
> 
>  > mc's configure can't find S-Lang because static S-Lang build doesn't
>  > install pkgconfig file into staging. Adding install-pkgconfig to
>  > install-static dependencies fixes that.
> 
>  > Fixes:
>  >   http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/
> 
>  > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>  > ---
>  >  package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch | 3 ++-
>  >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
>  > diff --git a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
>  > index ee306a1..b0f8779 100644
> 
> Patch description and signed-off-by missing. Alternatively we can drop
> the patch and just pass install-pkgconfig to the 'make install' step as
> we already need to use a custom make target anyway.

That's what Max did in his first patch, and I asked him to do it in our
patch.
The .pc file is not installed for static-only because *we* added a patch
that breaks down install into install-staging and install-shared.

So it makes more sense to fix our own patch, that work around 
deficiencies we added.

Plus, it makes for a patch that can be more easily upstremable.

Regards,
Yann E. MORIN.

>  > --- a/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
>  > +++ b/package/slang/0002-Enable-a-statically-linked-version-of-slsh.patch
>  > @@ -39,7 +39,8 @@ diff -rup a/autoconf/Makefile.in b/autoconf/Makefile.in
>  >   	cd slsh; $(MAKE) all
>  >  @@ -73,10 +76,11 @@ clean:
>  >   	cd demo; $(MAKE) clean
>  > - install-static:
>  > +-install-static:
>  > ++install-static: install-pkgconfig
>  >   	cd src; $(MAKE) install-static
>  >  +	cd slsh; $(MAKE) install-static
>  >   install-pkgconfig: slang.pc
>  > -- 
>  > 2.1.4
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> -- 
> Bye, Peter Korsgaard

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
