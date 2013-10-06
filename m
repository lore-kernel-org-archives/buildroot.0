From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 6 Oct 2013 13:17:57 +0200
Subject: [Buildroot] [PATCH 1/9] manual: minor update in manual
	generation
In-Reply-To: <20131006110426.41922b47@skate>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <3a4cb5eca332c3449a7c2a9a0d316f2ace16bc99.1381002281.git.s.martin49@gmail.com>
 <20131006110426.41922b47@skate>
Message-ID: <CAHXCMM+7ZGfAmFkiSKNVSaRRY+8_5aB=uj7yXaurJXkVyMXcvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2013/10/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Sat,  5 Oct 2013 21:49:06 +0200, Samuel Martin wrote:
> > * minor refactoring in gen-manual-list.py
> > * generate manual in the build tree
>
> Why? This is breaking the "release:" target of the main Makefile, which
> assumes that the manual is generated in $(O)/docs/manual.
>
No, it does not.
Sorry for having misleading in this log.

What does this part of this patch is just moving the manual source/build
directory in $(O)/build/
(currently this location is $(O)/docs/manual/.build/, which is removed at
this end of the
manual generation).

This location is used to:
- generate the package list files
- rsync the *.txt source from docs/manual/

The output manuals are still generated in $(O)/docs/manual/.

Moving this manual source/build directory is, IMHO, more consistent with
the rest of how
Buildroot works.
This also avoid to remove the *.txt that are generated and are actually
used by a2x,
this is very helpful for investigating asdciidoc/dblatex/texlive related
issues.


> > diff --git a/support/scripts/gen-manual-lists.py
> b/support/scripts/gen-manual-lists.py
> > index 3568843..5c81e1d 100755
> > --- a/support/scripts/gen-manual-lists.py
> > +++ b/support/scripts/gen-manual-lists.py
> > @@ -107,7 +107,7 @@ def get_symbol_parents(item, root=None,
> enable_choice=False):
> >          parent = parent.get_parent()
> >      if isinstance(root, kconfiglib.Menu) or \
> >              (enable_choice and isinstance(root, kconfiglib.Choice)):
> > -        parents.append("") # Dummy empty parrent to get a leading arrow
> ->
> > +        parents.append("") # Dummy empty parent to get a leading arrow
> ->
> >      parents.reverse()
> >      return parents
> >
> > @@ -126,15 +126,14 @@ def format_asciidoc_table(root, get_label_func,
> filter_func=lambda x: True,
> >      :param sub_menu:       Output the column with the sub-menu path
> >
> >      """
> > -    def _format_entry(label, parents, sub_menu):
> > +    def _format_entry(item, parents, sub_menu):
> >          """ Format an asciidoc table entry.
> >
> >          """
> >          if sub_menu:
> > -            return "| {0:<40} <| {1}\n".format(label, " ->
> ".join(parents))
> > +            return "| {0:<40} <| {1}\n".format(item, " ->
> ".join(parents))
> >          else:
> > -            return "| {0:<40}\n".format(label)
> > -
> > +            return "| {0:<40}\n".format(item)
> >      lines = []
> >      for item in get_symbol_subset(root, filter_func):
> >          if not item.is_symbol() or not item.prompts:
>
> Also, why are those changes mixed with the change of building the
> manual in $(O)/build ? They seem to be completely unrelated.
>
Right, sorry about that.


>
> Sorry to be a bit harsh, but you're a regular contributor,

Don't be.


> so I'd

expect patches from you that are properly split in individual patches
> for each feature or fix, with a more descriptive commit log. We've
> already suggested you to write more detailed commit logs in the past, I
> believe.
>
Buildroot rules/My mistakes... I'll repost this.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131006/4fafdf56/attachment.html>
