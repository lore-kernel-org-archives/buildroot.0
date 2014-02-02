From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2014 11:23:49 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
 BR2_EXTERNAL
In-Reply-To: <52E696A9.5070700@mind.be>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
 <52E696A9.5070700@mind.be>
Message-ID: <20140202102349.GC3331@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnoud, All,

On 2014-01-27 18:26 +0100, Arnout Vandecappelle spake thusly:
> On 22/01/14 21:59, Yann E. MORIN wrote:
> >+  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> >+  ifeq ($(_BR2_EXTERNAL),)
> >+    ifeq ($(patsubst /%,/,$(BR2_EXTERNAL)),/)
> >+      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist)
> >+    else
> >+      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relatively to $(TOPDIR))
> 
>  I don't think the limited explanation "relatively to $(TOPDIR)" warrants
> the additional complexity of patsubsting stuff.

Well, we want to tell the user why w edid not find his BR2_EXTERNAL.
And since it can be tricky to understand that a relative path is not
found, we do want to highlight that fact in the error message.

> >+    endif
> >+  endif
> >+  BR2_EXTERNAL := $(_BR2_EXTERNAL)
> 
>  AFAICS there is no need to have a separate _BR2_EXTERNAL, since we'll
> anyway error out if it is empty.

I used an intermediate, since I want to display the user-supplied path
in the error message, not the one we found (or did not find).

>  So, I'd propose:
> 
> override BR2_EXTERNAL := $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> ifeq ($(BR2_EXTERNAL),)
> 	$(error BR2_EXTERNAL directory '$(BR2_EXTERNAL)' does not exist)
> endif

Uh? In this case $(BR2_EXTERNAL) would be empty in the error message, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
