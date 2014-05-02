From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 May 2014 10:31:58 +0200
Subject: [Buildroot] [PATCH] manual: use one-line titles instead of
	two-line titles (trivial)
In-Reply-To: <0f7edee196f1f7a6643f.1399009650@argentina> (Thomas De
 Schampheleire's message of "Fri, 02 May 2014 07:47:30 +0200")
References: <0f7edee196f1f7a6643f.1399009650@argentina>
Message-ID: <87siospon5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Asciidoc supports two syntaxes for section titles: two-line titles (title
 > plus underline consisting of a particular symbol), and one-line titles
 > (title prefixed with a specific number of = signs).

 > The two-line title underlines are:
 > Level 0 (top level):     ======================
 > Level 1:                 ----------------------
 > Level 2:                 ~~~~~~~~~~~~~~~~~~~~~~
 > Level 3:                 ^^^^^^^^^^^^^^^^^^^^^^
 > Level 4 (bottom level):  ++++++++++++++++++++++

 > and the one-line title prefixes:
 > = Document Title (level 0) =
 > == Section title (level 1) ==
 > === Section title (level 2) ===
 > ==== Section title (level 3) ====
 > ===== Section title (level 4) =====

 > The buildroot manual is currenly using the two-line titles, but this has
 > multiple disadvantages:

 > - asciidoc also uses some of the underline symbols for other purposes (like
 >   preformatted code, example blocks, ...), which makes it difficult to do
 >   mass replacements, such as a planned follow-up patch that needs to move
 >   all sections one level down.

 > - it is difficult to remember which level a given underline symbol (=-~^+)
 >   corresponds to, while counting = signs is easy.

 > This patch changes all two-level titles to one-level titles in the manual.
 > The bulk of the change was done with the following Python script, except for
 > the level 1 titles (-----) as these underlines are also used for literal
 > code blocks.
 > This patch only changes the titles, no other changes. In
 > adding-packages-directory.txt, I did add missing newlines between some
 > titles and their content.

 > ----------------------------------------------------------------------------
 > #!/usr/bin/env python

 > import sys
 > import mmap
 > import re

 > for input in sys.argv[1:]:

 >     f = open(input, 'r+')
 >     f.flush()
 >     s = mmap.mmap(f.fileno(), 0)

 >     # Level 0 (top level):     ======================   =
 >     # Level 1:                 ----------------------   ==
 >     # Level 2:                 ~~~~~~~~~~~~~~~~~~~~~~   ===
 >     # Level 3:                 ^^^^^^^^^^^^^^^^^^^^^^   ====
 >     # Level 4 (bottom level):  ++++++++++++++++++++++   =====

 >     def replace_title(s, symbol, replacement):
 >         pattern = re.compile(r'(.+\n)\%s{2,}\n' % symbol, re.MULTILINE)
 >         return pattern.sub(r'%s \1' % replacement, s)

 >     new = s
 >     new = replace_title(new, '=', '=')
 >     new = replace_title(new, '+', '=====')
 >     new = replace_title(new, '^', '====')
 >     new = replace_title(new, '~', '===')
 >     #new = replace_title(new, '-', '==')

 >     s.seek(0)
 >     s.write(new)
 >     s.resize(s.tell())
 >     s.close()
 >     f.close()

 > ----------------------------------------------------------------------------

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
