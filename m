From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Feb 2016 23:58:31 +0100
Subject: [Buildroot] [PATCH 03/16 v4] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <20160212224602.GB3395@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <821b8ea9cd929a6c05b715d12e99f3da00aa9ed4.1454536753.git.yann.morin.1998@free.fr>
 <56BE5C84.8050602@lucaceresoli.net> <20160212224602.GB3395@free.fr>
Message-ID: <20160212225831.GC3395@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-02-12 23:46 +0100, Yann E. MORIN spake thusly:
> On 2016-02-12 23:28 +0100, Luca Ceresoli spake thusly:
> > On 03/02/2016 23:21, Yann E. MORIN wrote:
> > > This macro will try to copy a source file into a destination directory,
> > > by first attempting to hard-link, and falling back to a plain copy.
> > > 
> > > In some situations, it will be necessary that the destination file is
> > > named differently than the source (e.g. due to a re-numbering), so if a
> > > third argument is specified, it is treated as the basename of the
> > > destination file.
> [--SNIP--]
> > > +define hardlink-copy
> > > +	{ mkdir -p $(2) && \
> > > +	  rm -f        $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) && \
> > > +	  { ln -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))) 2>/dev/null || \
> > > +	    cp -f $(1) $(strip $(2))/$(if $(3),$(strip $(3)),$(notdir $(1))); \
> > > +	  } \
> > > +	}
> > > +endef
> > 
> > Unfortunately this version of the patch does not seem to work, although
> > I can't wrap my head around the reason. What's happening is _weird_.
> 
> Damned, that's right. It's broke... :-/
> 
> > If I apply all of your patches up to 10/16, 'make legal-info' works. If
> > I add patch 11 ("core/legal-info: also save patches"), it does not. Add
> > patch 12 and it works again.
> [--SNIP--]
> > This is the best I could understand at the moment... :-(
> 
> Thanks for the detailed analysis! :-)
> I'll investigate this further.

And now I looked at the code, it is pretty obvious what's going on.

hardlink-or-copy exclusively uses make functions, like $(notdir), on its
parameters, but it is called with parameters that are set from the
shell.

I.e. we test the parameters of hardlink-or-copy in make, while they are
not yet valid, as they will only be valid by the time we actually
execute the shell fragment, by which time it is too late.

That's what happens (removing a $-level for the sake of simplicity):

    while read f; do
        $(call hardlink-copy,$${f},$($(2)_REDIST_SOURCES_DIR)) || exit 1;
    done </path/to/.applied_patches_list

So@the time we evaluate hardlink-or-copy, here are the values of the
parameters:

    $(1) == ${f}
    $(2) == /path/to/redist/dir
    $(3) ==         (empty)

Since $(3) is empty, we'd fall in the else-clause of the $(if...), which
evaluates to $(notdir ${f}) which is just plain ${f}.

Bummer.

It happens to work when we renumber the patches, because the third
argument is not empty, being a shell variable evaluation construct.

I'll try to fix that.

Thank you! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
