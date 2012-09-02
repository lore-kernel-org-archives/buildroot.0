From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Sep 2012 23:05:51 +0200
Subject: [Buildroot] [PATCH 10/12] pkg-infra: ensure gettext gets built
	before all other packages
In-Reply-To: <5043C1F8.6020801@mind.be>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
 <1346600635-30946-11-git-send-email-yann.morin.1998@free.fr>
 <5043C1F8.6020801@mind.be>
Message-ID: <201209022305.51613.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Sunday 02 September 2012 22:30:48 Arnout Vandecappelle wrote:
> On 09/02/12 17:43, Yann E. MORIN wrote:
> > As it is not easy to ensure that gettext be the first package, we can also
> > declare it as a dependency of all packages (except itself, of course).
> 
>   I don't like this.

Well, it's not ideal. I am not too fond of it either.

The reason for this patch was to avoid adding gettext to _DEPENDENCIES,
because packages have different ways of doing so:
  ifeq ($(BR2_PACKAGE_GETTEXT),y)
  xxx_DEPENDENCIES += gettext
  endif
or:
  xxx_DEPENDENCIES += $(if $(BR2_PACKAGE_GETTEXT),gettext)

Without counting packages that test:
  BR2_PACKAGE_GETTEXT
  BR2_NEEDS_GETTEXT
  BR2_NEEDS_GETTEXT_IF_LOCALE

and packages that need to add explicit link against -lintl

But I'll drop that patch.

>   I also don't like that it breaks the build when the toolchain depends on some
> package (sstrip, ccache, ...).

Ah, I did test with an external toolchain.

>   Possible alternatives:
>   * Use a construct similar to patch 11/12: $(gettext-dependency) which is
> nothing unless gettext is enabled.

Will do that.

>   * Move this dependency into the toolchain logic - which means duplicating
> it three times so maybe not such a good idea...

Not sure I understand this... O_o

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
