From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 5 Jul 2011 00:01:50 +0200
Subject: [Buildroot] [PATCH 06/28] package: fix patching procedure for
	host packages
In-Reply-To: <3f344e77a60fbd473b25eb91fd7a6a270197b01d.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <3f344e77a60fbd473b25eb91fd7a6a270197b01d.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107050001.50292.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:23 Thomas Petazzoni wrote:
> The patching procedure was using $($(NOHOSTPKG)_NAME) to find the name
> of the package without the host- prefix for host packages, which is
> needed to find the package directory and the prefix of the patches.
> 
> However, this $($(NOHOSTPKG)_NAME) variable is empty when there is
> only an host variant for the package and no target variant for it.
> 
> Therefore, instead of using this $($(NOHOSTPKG)_NAME) variable, we now
> use a new $(RAWNAME) variable, which is always the name of the package
> without the host- prefix, even for host packages.
[--SNIP--]
> @@ -515,7 +513,7 @@ $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
>  $$($(2)_TARGET_BUILD):			PKG=$(2)
>  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
> -$$($(2)_TARGET_PATCH):			NOHOSTPKG=$(3)
> +$$($(2)_TARGET_PATCH):			RAWNAME=$(subst host-,,$(1))

I might say something stupid, but what abouta package that is named
'foohost-bar'? The 'host-' part will be stripped, and we'd get 'foobar'.
And that'd be wrong, I think.

I'd use: $(patsubst host-%,%,$(1))

And even in that case, that does not prevent a target package that
is named 'host-utils' from matching, and be renamed to just 'utils'.

But it's been a while I looked at the generic infra, so I might be
just saying cracks here...

>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
>  $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
> 

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
