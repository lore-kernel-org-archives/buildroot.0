From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 22:15:07 +0200
Subject: [Buildroot] [PATCH 04/23 v5] gendoc infra: disable pdf manual
 generation if xsltproc is buggy
In-Reply-To: <CAAXf6LXSnrnn+O_qOOrQFeJJdqXb=dHQAWg=yuB0yzzgZjCfQA@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <4285f37298bb4361de1ca8f82f42e37c4bc4d7d4.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LXSnrnn+O_qOOrQFeJJdqXb=dHQAWg=yuB0yzzgZjCfQA@mail.gmail.com>
Message-ID: <20140919201507.GC4155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-19 22:00 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: Samuel Martin <s.martin49@gmail.com>
> >
> > The PDF manual generation reaches the default xsltproc's template
> > recursion limit when processing the target package list; this makes the
> > PDF manual generation fail [1-3].
[--SNIP--]
> >  ################################################################################
> >  # GENDOC_INNER -- generates the make targets needed to build a specific type of
> >  #                 asciidoc documentation.
> > @@ -83,6 +97,14 @@ define MANUAL_$(2)_INSTALL_CMDS
> >  endef
> >  endif
> >
> > +ifeq ($(4)-$$(MANUAL_XSLTPROC_IS_BROKEN),pdf-y)
> > +$$(O)/docs/$(1)/$(1).$(4):
> > +       $$(error PDF manual generation is disabled because of a bug in \
> > +               xsltproc. To be able to generate the PDF manual, you should \
> > +               build xsltproc from the libxslt sources >=1.1.29 and pass it \
> > +               to make through the command line: \
> > +               'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make manual-pdf')
> 
> I think this should be $(warning) instead of $(error), because if you
> run 'make manual' with a broken xsltproc, then the manual generation
> will stop at the pdf manual, even though the following manuals (text
> and ePUB) could have been built without issue.

Yup, it always bothered me. But we can just skip it, indeed.

Another point about this hunk: the indentation of $(error...) is wrong:
it is not the commands of the rule. I.e. it is not interpreted by the
shell for the $$(O)/docs/$(1)/$(1).$(4) rule, but really by make itself.

So, we should probably have this instead:

    ifeq ($(4)-$$(MANUAL_XSLTPROC_IS_BROKEN),pdf-y)
    $$(error ........)
    $$(O)/docs/$(1)/$(1).$(4):
    else
    $$(O)/docs/$(1)/$(1).$(4):
        a2x ....
    endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
