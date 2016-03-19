From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 00:11:43 +0100
Subject: [Buildroot] [PATCH 02/16 v5] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <20160319152307.765e1bad@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
 <20160319152307.765e1bad@free-electrons.com>
Message-ID: <20160319231143.GH3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 15:23 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:49:15 +0100, Yann E. MORIN wrote:
> 
> > +################################################################################
> > +# hardlink-copy -- hardlink source and destination if possible, otherwise
> > +# do a simple copy
> > +#
> > +# argument 1 is the source *file*
> > +# argument 2 is the destination *directory*
> > +# argument 3 is the basename of the destination file (optional, defaults to
> > +#            the basename of the source file.
> > +#
> > +# examples:
> > +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir)
> > +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir,new-name)
> > +#
> > +# Notes:
> > +#  - this is NOT an atomic operation,
> > +#  - this is only a wrapper to a shell script, so that it can be used with
> > +#    shell-level variables, like in a for loop.
> > +################################################################################
> > +define hardlink-copy
> > +	support/scripts/hardlink-copy "$(strip $(1))" "$(strip $(2))" "$(strip $(3))"
> > +endef
> 
> While in certain cases, I agree that a shell wrapper is nice and
> useful, here I really don't see the point of a shell wrapper. You can
> simply do (untested):
> 
> define hardlink-or-copy-inner
> 	rm -f $(2)
> 	ln -f $(1) $(2) 2>/dev/null || cp -f $(1) $(2)
> endef
> 
> define hardlink-or-copy
> 	$(call hardlink-or-copy-inner,$(1),$(if $(3),$(2)/$(3),$(2)/$(basename $(1))))
> endef

Well, that does not work. That's basically what I did in the previous
iteration, but in some cases, $(3) could be a shell expansion and it is
not empty at the time the macro is called, but ends up being empty after
the shell expansion. See the discussion we had with Luca about this:
    http://lists.busybox.net/pipermail/buildroot/2016-February/152634.html

> Note that I think the name of the macro should be hardlink-or-copy and
> not hardlink-copy. The name hardlink-copy seems to indicate that you
> are copying a hardlink, which is not what is happening.
> hardlink-or-copy is IMO clearer on the fact that the macro does a hardlink
> or a copy.

OK, will change.

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
