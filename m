From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Apr 2019 23:06:48 +0200
Subject: [Buildroot] [PATCH 10/10] infra: introduce top-level,
 global show-info
In-Reply-To: <CAAXf6LXUiuH_wUmQ23N3rOdeDoCc2-_EdmDjX5sPs1SRrZ-Q-g@mail.gmail.com>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <9e4d027c3a353fadde428fbba702dcc9dac15d75.1554637858.git.yann.morin.1998@free.fr>
 <CAAXf6LXUiuH_wUmQ23N3rOdeDoCc2-_EdmDjX5sPs1SRrZ-Q-g@mail.gmail.com>
Message-ID: <20190411210648.GF2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-10 11:28 +0200, Thomas De Schampheleire spake thusly:
> El dom., 7 abr. 2019 a las 13:51, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > (to display the eldin opening '[' so as to have a valid JSON array),
> I don't know what you wanted to say for 'eldin'.

'leading' that was.

> > re-enter the Makefile and mangle the output with a sed expression, that:
> >
> >   - 0,/^/s//[\n/;   inserts a '[' before the first line,
> >   - $!s/$/,/;       appends a ',' at the end of every lines but the last,
> >   - $s/$/\n]/       appends a ']' after the last line.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 60bf7d7d08..13c4390ae4 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -876,6 +876,12 @@ graph-depends-requirements:
> >         @dot -? >/dev/null 2>&1 || \
> >                 { echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
> >
> > +.PHONY: show-info _show-info-private
> > +show-info:
> > +       @$(MAKE) -C $(CONFIG_DIR) _show-info-private |sed -r -e '0,/^/s//[\n/; $$!s/$$/,/; $$s/$$/\n]/'
> 
> This should have an explicit '-s' argument, otherwise the output is:
> 
> [
> make[1]: Entering directory '/home/tdescham/repo/contrib/buildroot',
> ...
> (JSON)
> ...
> make[1]: Leaving directory '/home/tdescham/repo/contrib/buildroot'
> ]
> 
> which is not valid json.

Ah yes, I always forget about in-tree builds, as I almost exclusively
only ever use out-of-tree builds...

Thanks!

Regards,
Yann E. MORIN.

> With -s, I validated that the output is valid by piping 'make
> show-info' to 'jq .'
> 
> > +_show-info-private: $(patsubst %,%-show-recursive-info,$(PACKAGES) $(TARGETS_ROOTFS))
> > +       @:
> > +
> >  .PHONY: show-dependency-tree
> >  show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(PACKAGES) $(TARGETS_ROOTFS))
> >         @:
> > --
> > 2.14.1
> >

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
