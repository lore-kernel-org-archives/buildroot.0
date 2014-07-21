From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Jul 2014 23:08:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] package: remove the trailing slash
 sign from $(PKG)_SITE variable
In-Reply-To: <20140721225822.34be99b8@free-electrons.com>
References: <1379658454-6906-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140721225822.34be99b8@free-electrons.com>
Message-ID: <20140721210841.GF3874@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-21 22:58 +0200, Thomas Petazzoni spake thusly:
> On Fri, 20 Sep 2013 08:27:34 +0200, Jerzy Grzegorek wrote:
> > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> > 
> > Since the trailing slash is stripped from $($(PKG)_SITE) by pkg-generic.mk:
> > 
> > $(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))
> > 
> > so it is redundant.
> > This patch removes it from $(PKG)_SITE variable for BR consistency.
> 
> Since this patch has been around for quite some time now, it no longer
> applies properly, so I've marked it as "Changes Requested" in our patch
> tracking system.
> 
> I don't know if it's worth respining the patch. What do we want to do
> regarding this? Yann, Arnout, an opinion?

Well, it's easy enough to regenerate:

    find boot/ package/ linux/ -type f -name '*.mk' -exec \
        sed -r -e 's,(^[^[:space:]]+_SITE.*=.*/.*)/$,\1,' {} \;

If you or Jerzy feels like it, go on. Otherwise, the strip in DOWNLOAD
is here especially to account for this trailing '/', so we can keep
them.

We can't get rid of the strip in DOWNLOAD, since packages in
BR2_EXTERNAL may rely on it. So it is not really a problem if we keep
the trailing slashes in in-tree packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
