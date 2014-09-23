From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Sep 2014 19:21:06 +0200
Subject: [Buildroot] [PATCH 12/23 v5] docs/manual: last pass at removing
 hard-coded path in GENDOC_INNER
In-Reply-To: <CAAXf6LUbrYHqCReJLRMRf4jfRGfH=0C=-TwYd2foZjpzzYonCw@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <661d747642ce1e9ca884829b0a295faf35933209.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LUbrYHqCReJLRMRf4jfRGfH=0C=-TwYd2foZjpzzYonCw@mail.gmail.com>
Message-ID: <20140923172106.GA4283@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-22 21:38 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > GENDOC_INNER still has one hard-coded path to the document's directory:
> > the asciidoc .conf files.
> 
> In this patch you assume that the asciidoc configuration is
> document-specific,

Well, not really. The code already had:
    MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf

so the location where the asciidoc-FORMAT.conf was already supposed to
be specific to one document.

This patch merely removes the assumption that the document is in a
sub-directory of docs:
    docs/$(1)/  -->  $(3)/   ($(3) is the directory of the document)

> but at least the current contents of
> asciidoc-text.conf are global IMO: they simply make sure that
> hyperlinks are represented in a sane way, and that images are not
> shown (text document only). These are settings that apply to all
> documents.

I agree. But then, where should we move it?

  - keep it in docs/manual/ ? That would imply it is specific to our
    manual.

  - move it in docs/ ? But docs/ contains our website.

  - keep docs/manual, move the website to docs/website/ ? This way we
    could move the asciidoc*.conf into docs/ and is IMHO much cleaner
    than we have today.

> It can be useful to provide a mechanism for other documents to pass
> additional configuration files, but at this moment it is not strictly
> needed. I don't know if it makes sense to already provide a variable
> for that, or rather wait for a real use case to add it (KISS
> principle).

I already need that, and already implemented it, because I need this
asciidoc configuration:

    [specialwords]
    emphasizedwords=WORD1 WORD2

> Awaiting the outcome of this consideration, I did not yet review the
> patch in detail.

OK, here's what I suggest:

  - add a new variable for documents to pass an asccidoc.conf (done);
  - add a new variable for documents to pass a format-specific
    asciidoc-FMT.conf;
  - keep the current asciidoc-text.conf where it is, and always use it.

Then, if we decide to move the website, I can come up with more patches
to do so, and move the global asciidoc*.conf files into docs/

Is that OK with you guys? Peter, that would have an impact on the server
to generate the nightly manual, so we need your input here.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
