From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 00:22:35 +0200
Subject: [Buildroot] [PATCH 12/16 v3] core: handle .br-external in a
 make rule
In-Reply-To: <20160827221613.2c753c17@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <0994022779466155b22c6e815e737d21c447a528.1468750623.git.yann.morin.1998@free.fr>
 <20160827221613.2c753c17@free-electrons.com>
Message-ID: <20160827222235.GO5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 22:16 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:32 +0200, Yann E. MORIN wrote:
> 
> >  BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
> >  -include $(BR2_EXTERNAL_FILE)

Here ^^^^

> > -ifeq ($(BR2_EXTERNAL),)
> > -  $(shell rm -f $(BR2_EXTERNAL_FILE))
> > -else
> > +ifneq ($(BR2_EXTERNAL),)
> >    _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> >    ifeq ($(_BR2_EXTERNAL),)
> >      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
> >    endif
> >    override BR2_EXTERNAL := $(_BR2_EXTERNAL)
> > -  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
> >    ifneq ($(wildcard $(BR2_EXTERNAL)/external.id),)
> >      BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
> >      ifeq ($(BR2_EXTERNAL_ID),)
> > @@ -173,6 +167,11 @@ else
> >    BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
> >  endif
> >  
> > +# This needs to be *after* we compute BR_EXTERNAL, above.
> > +.PHONY: $(BR2_EXTERNAL_FILE)
> > +$(BR2_EXTERNAL_FILE):
> > +	@echo BR2_EXTERNAL ?= $(BR_EXTERNAL) >$@
> > +
> 
> I'm probably missing something, but where is this make target being
> "triggered" ?

When make encounters a -include directive, and the file to be included
is the target of a rule, then make will trigger the rule before including
the file, even if the rule is defined after the inclusion (make parses
makefiles in multiple passes).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
