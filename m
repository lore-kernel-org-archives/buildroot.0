From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Feb 2017 22:07:53 +0200
Subject: [Buildroot] [PATCH 1/4] core: add generic support for lz
	archives
In-Reply-To: <CAAXf6LXPLcVSVXjzvzNBsvisp1H0E4YtAVDAeJuuQqj6NBz9fQ@mail.gmail.com>
References: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
 <CAAXf6LXPLcVSVXjzvzNBsvisp1H0E4YtAVDAeJuuQqj6NBz9fQ@mail.gmail.com>
Message-ID: <20170212200753.bfpudufftk5lhelp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Feb 11, 2017 at 10:16:20PM +0100, Thomas De Schampheleire wrote:
> On Fri, Feb 10, 2017 at 6:52 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > +# host-extractor(filename): same as suitable-extractor, but filter out
> > +# extractors we build when the host lacks one.
> > +host-extractor = $(INFLATE$(filter-out .lz .lzma .xz,$(suffix $(1))))
> 
> suitable-extractor and host-extractor now render different output for
> a given file which makes no sense in general for functions named like
> this. You only need the different output to decide whether extra
> dependency checks need to be done, not to determine what the extractor
> is.
> 
> Also, the list of extensions is kind of 'magic' and not immediately
> linked with the changes in support/dependencies (this was already true
> with the original situation, true). It would be great if the
> exceptions could be steered from the check-host-foo.mk files directly,
> which is the conceptually right place: when that file exists it will
> take over all checking, if it does not then the checking is done in
> the standard DL_TOOLS_DEPENDENCIES.
> 
> I thought hard on a way to attack the problem without needing to know
> the extensions and more in line with the original change, but it is
> not easy due to the fact that XZCAT and such can contain spaces which
> does not fit well with make.
> For clarity, I wanted to let check-host-xz.mk append to a new variable, e.g.
>     DL_TOOLS_DEPENDENCIES_PRECHECKED_VARS += $(XZCAT)
> and in pkg-generic.mk use this list to drive the exceptions:
>     ifeq (,$$(filter $$(call
> suitable-extractor,$$($(2)_SOURCE)),$$(DL_TOOLS_DEPENDENCIES_PRECHECKED_VARS)))
>     DL_TOOLS_DEPENDENCIES += $$(firstword $$(call
> suitable-extractor,$$($(2)_SOURCE)))
>     endif
> This could work if we first replace all spaces with another character,
> both when appending to DL_TOOLS_DEPENDENCIES_PRECHECKED_VARS as in the
> first argument of the filter function.
> But perhaps it makes things too complex.

Indeed.

> An alternative is to stick closer to your proposal, but with some changes:
> - let check-host-foo.mk define the list of extensions that it handles
> instead of the magic list, e.g.
>   EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz
> - rename host-extractor to something else, e.g. extractor-dependency
> - perhaps it makes sense to let extractor-dependency handle the
> $(firstword) call
> 
> Given my input, what do you think?

I like your second suggestion better. Patches follow.

> Separate note: it could make sense to split this patch in two: one to
> refactor the handing of the dependencies, and a second one to cover
> lz7.

I agree.

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
