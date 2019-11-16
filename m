From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Nov 2019 17:35:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with python 3.8
In-Reply-To: <20191116162307.GD32494@scaer>
References: <20191116114519.21768-1-fontaine.fabrice@gmail.com>
 <20191116162307.GD32494@scaer>
Message-ID: <20191116163538.GE32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-16 17:23 +0100, Yann E. MORIN spake thusly:
> On 2019-11-16 12:45 +0100, Fabrice Fontaine spake thusly:
> > Replace second patch that adds -Wl,-z,undefs by a patch that remove
> > -Wl,--no-undefined as some ld versions are ignoring this flag:
[--SNIP--]
> > -diff --git a/Makefile.am b/Makefile.am
> > -index c5c2f06..8e9c90d 100644
> > ---- a/Makefile.am
> > -+++ b/Makefile.am
> > -@@ -173,7 +173,7 @@ CPYTHON_MODULE_CFLAGS = \
> > - 	$(AM_CFLAGS) -DCPYTHON_COMPILING_IN_PYPY=0 \
> > - 	$(PYTHON_NOWARN) $(PYTHON_CFLAGS) \
> > - 	-fvisibility=default
> > --CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared
> > -+CPYTHON_MODULE_LDFLAGS = $(AM_LDFLAGS) -module -avoid-version -shared -Wl,-z,undefs
> 
> What about this hack:
> 
>     CPYTHON_MODULE_LDFLAGS = (subst -Wl,--no-undefined,,$(AM_LDFLAGS)) ...

Does not work because of commas. The good hack would be:

    comma = ,
    CPYTHON_MODULE_LDFLAGS = (subst -Wl$(comma)--no-undefined,,$(AM_LDFLAGS)) ...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
