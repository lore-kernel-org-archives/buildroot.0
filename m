From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Sep 2016 18:33:59 +0200
Subject: [Buildroot] [PATCH 1/2 v3] linux/tools: make it a real,
 separate package
In-Reply-To: <20160922125141.0a1de244@free-electrons.com>
References: <cover.1473171931.git.yann.morin.1998@free.fr>
 <7af6b231b19828564aae1a098568e96e15843a62.1473171931.git.yann.morin.1998@free.fr>
 <20160922125141.0a1de244@free-electrons.com>
Message-ID: <20160922163359.GA3179@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-22 12:51 +0200, Thomas Petazzoni spake thusly:
> On Tue,  6 Sep 2016 16:29:14 +0200, Yann E. MORIN wrote:
> > +# Include all our tools definitions.
> > +#
> > +# Note: our package infrastructure uses the full-path of the last-scanned
> > +# Makefile to determine what package we're currently defining, using the
> > +# last directory component in the path. As such, including other Makefile,
> > +# like below, before we call one of the *-package macro is usally not
> > +# working.
> > +# However, since the files we include here are in the same directory as
> > +# the current Makefile, we are OK. But this is a hard requirement: files
> > +# included here *must* be in the same directory!
> > +include $(sort $(wildcard linux/linux-tools/linux-ext-*.mk))
> 
> This include path is wrong, so I've changed it to:
> 
> include $(sort $(wildcard package/linux-tools/linux-tool-*.mk))
> 
> and in fact, I fixed it in the original commit, and then realized I
> messed up, so I had to fix it again in a follow-up commit.

And I've just sent a patch to completely remove that include directive
altogether: tools would register twice, wihch is not nice (built twice,
installed twice...)

I did not catch this during my tests, because that problem was hidden:
  - the $(wildcard) would return nothing,
  - $(sort) would happily have nothing to sort and would return nothing,
  - include would be happy to have nothing to include,
  - but each individual .mk files would already be included from top-level
    Makefile, in the correct order,
  - so I did not see the path was wrong and did not see the tools were
    registered twice.

Sorry for the mess... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
