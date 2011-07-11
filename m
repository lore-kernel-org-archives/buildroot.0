From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 12 Jul 2011 00:22:38 +0200
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <20110712000117.3af73a1a@skate>
References: <20110712000117.3af73a1a@skate>
Message-ID: <201107120022.39127.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 12 July 2011 00:01:17 Thomas Petazzoni wrote:
> I have just sent a patch that proposes to enable debugging symbols by
> default when building packages. This would currently ensure that all
> libraries installed in 'staging' have debugging symbols. However,
> programs would be built with debugging symbols, but as they are only
> installed in 'target', the final binary would still be stripped.
> 
> I'd like to propose the following scheme :
> 
>  * The packages no longer install files in staging and target
>    differently. They just install files.
> 
>  * All files are installed in both the staging and the target
>    directory, by the package infrastructure.
> 
>  * The files in the staging directory are left untouched.
> 
>  * Some automatic cleanup is done in the target directory :
>     - Stripping of binaries and libraries
>     - Removal of static libraries, pkg-config files, header files,
>       documentation, etc.
>     - Removal of files listed in a per-package <pkg>_REMOVE_TARGET
>       variable.
> 
> This would make the target directory be a cleaned up and stripped
> *subset* of the staging directory. We would therefore have in the
> staging directory the libraries *and* binaries with debugging symbols
> for all packages.

In this case, why install in both places? Would something like the
following be part of the solution:

 * packages install in staging, and nowhere else

 * building the image(s) makes a copy of staging -> target
   - leaves staging untouched
   - cleans up target: strip, rm man include pkg-config, and all the
     superfluous stuff you highlighted below...

Of course, I am not saying that this is easier, or even better! ;-)
In this case, the problematic part would be to gather all the
<pkg>_REMOVE_TARGET stuff. Maybe the pkg infra could do smthg
like this when $(eval $(call ....)) is called:
  REMOVE_TARGET+=$($pkg)_REMOVE_TARGET)

And then the image build would do (Yeah, ultra-simplified...):
  cp -a staging target; \
  cd target; \
  rm -rf $(REMOVE_TARGET); \
  rm -rf man doc include blabla...; \
  strip bin/foo; \
  mk-image-or-tarball-or-whatever --from=. --to=output/root.img

I don't know how spaces in REMOVE_TARGET would be handled, though... ;-/
Also, leading '/' should be removed, or beware... :-]

> What do you think about this ?

This is IMHO a sane suggestion. :-)

> Of course, this is not something that is going to be implemented right
> now. I'm just opening the discussion to see if this makes sense, and if
> so, how we could move forward.

Hehe! There are only 24h in day, unfortunately!... :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
