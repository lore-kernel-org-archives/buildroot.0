From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Oct 2012 19:25:14 +0200
Subject: [Buildroot] [PATCH 01/47] package/cURL: fix static link whith
	openSSL
In-Reply-To: <5089B0C3.1060005@mind.be>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-2-git-send-email-yann.morin.1998@free.fr>
 <5089B0C3.1060005@mind.be>
Message-ID: <201210261925.14598.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 25 October 2012 Arnout Vandecappelle wrote:
> On 24/10/12 23:25, Yann E. MORIN wrote:
> > When openSSL is selected, cURL is configured to use it.
> >
> > But in this case, the libcurl.pc file /forgets/ to require link
> > against -ldl.
> >
> > This can happen, for example, when BR2_PREFER_STATIC_LIB is not set,
> > but an executable wants to be linked statically (for various reasons
> > which are irrelevant here).
> >
> > Fix that by appending a 'Requires: openssl' line to the installed
> > libcurl.pc, if openSSL is enabled.
[--SNIP--]
> > +define LIBCURL_FIX_STAGING_PC
> > +	printf 'Requires: openssl\n'>>$(STAGING_DIR)/usr/lib/pkgconfig/libcurl.pc
> > +endef
> >   LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
> > +LIBCURL_POST_INSTALL_STAGING_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_STAGING_PC)
> 
>   Why not add it to $(@D)/libcurl.pc.in in a post-patch hook?  Then it only has
> to be done once, and I also feel it's a better place to patch things.

Yep, good idea! Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
