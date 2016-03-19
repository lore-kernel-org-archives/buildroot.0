From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 00:33:42 +0100
Subject: [Buildroot] [PATCH 02/16 v5] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <56ED7967.8050200@mind.be>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
 <20160319152307.765e1bad@free-electrons.com>
 <56ED7967.8050200@mind.be>
Message-ID: <20160319233342.GI3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-03-19 17:08 +0100, Arnout Vandecappelle spake thusly:
> On 03/19/16 15:23, Thomas Petazzoni wrote:
> >On Fri, 11 Mar 2016 18:49:15 +0100, Yann E. MORIN wrote:
> >
> >>+################################################################################
> >>+# hardlink-copy -- hardlink source and destination if possible, otherwise
> >>+# do a simple copy
> >>+#
> >>+# argument 1 is the source *file*
> >>+# argument 2 is the destination *directory*
> >>+# argument 3 is the basename of the destination file (optional, defaults to
> >>+#            the basename of the source file.
> >>+#
> >>+# examples:
> >>+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir)
> >>+#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir,new-name)
> >>+#
> >>+# Notes:
> >>+#  - this is NOT an atomic operation,
> >>+#  - this is only a wrapper to a shell script, so that it can be used with
> >>+#    shell-level variables, like in a for loop.
> >>+################################################################################
> >>+define hardlink-copy
> >>+	support/scripts/hardlink-copy "$(strip $(1))" "$(strip $(2))" "$(strip $(3))"
> >>+endef
> >
> >While in certain cases, I agree that a shell wrapper is nice and
> >useful, here I really don't see the point of a shell wrapper. You can
> >simply do (untested):
> >
> >define hardlink-or-copy-inner
> >	rm -f $(2)
> >	ln -f $(1) $(2) 2>/dev/null || cp -f $(1) $(2)
> >endef
> >
> >define hardlink-or-copy
> >	$(call hardlink-or-copy-inner,$(1),$(if $(3),$(2)/$(3),$(2)/$(basename $(1))))
> >endef
> 
>  I disagree. This may be slightly shorter in lines of code, but I think the
> shell script is much more readable.

And as explained in the commit log, it does not work if any of the
argument needs shell-level expansion (see my other reply to Thomas).

>  However, I do wonder if it makes sense to have a make function for it if
> there already is a shell script. We don't do that for apply-patches, so why
> would we do it for this one?

As explained in the ocmmit log:
    We still keep the make macro, as it is easier to [call], and allows
    to $(strip) its arguments in a convenient fashion.

Note: I now use "call" when the commit log used "write". What is easier
is not to write the macro (well, it is, but that was not the point of
that sentence), but writing code that calls the macro.

Also, I think it is better to have callers call a make macro, even if
backe by a shell script. It is more "in-line" with how we do other
stuff, like the github helper. Our helpers are make macros, it is more
homogeneous.

> >Note that I think the name of the macro should be hardlink-or-copy and
> >not hardlink-copy. The name hardlink-copy seems to indicate that you
> >are copying a hardlink, which is not what is happening.
> >hardlink-or-copy is IMO clearer on the fact that the macro does a hardlink
> >or a copy.
> 
>  I agree with that.

Fixed.

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
