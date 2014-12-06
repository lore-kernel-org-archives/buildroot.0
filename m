From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 16:08:21 +0100
Subject: [Buildroot] [PATCH 2/9 v2] pkg-infra: differentiate remote
 tarball name from local filename
In-Reply-To: <CAHXCMMKcCtD0iK1ooZyLH93cquSXH-u0e=m4OTM+K+EVMuDbaQ@mail.gmail.com>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
 <bef744df6da6d00760218ff688449f2bb3fdeb4f.1417863715.git.yann.morin.1998@free.fr>
 <CAHXCMMKcCtD0iK1ooZyLH93cquSXH-u0e=m4OTM+K+EVMuDbaQ@mail.gmail.com>
Message-ID: <20141206150821.GD9544@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-12-06 14:28 +0100, Samuel Martin spake thusly:
> On Sat, Dec 6, 2014 at 12:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Some upstreams may use a naming scheme that does not fit well in how
> > Buildroot wants to handle filenames.
> >
> > For example, GitHub used to have a scheme like:
> >     https://github.com/USER/REPO/archive/VERSION.tar.gz
> >
> > which means we would have a local file named VERSION.tar.gz, when we
> > want to have PKG-VERSION.tar.gz
> >
> > Other forges are also known to have similar schemes. Google Code, for
> > example, may also use similarly named files.
> >
> > Introduce a new variable, FOO_UPSTREAM_SOURCE, which the package may set
> > in that case. If not set, it defaults to FOO_SOURCE.
> 
> I wonder how it will play when download falls back on
> http://sources.buildroot.net/, I mean what will be the tarball
> filename uploaded on s.b.n? Will it be FOO_UPSTREAM_SOURCE or
> FOO_SOURCE?
> 
> Afaics, FOO_SOURCE will be uploaded on s.b.n, whereas the fallback url will be:
>   http://sources.buildroot.net/$(FOO_UPSTREAM_SOURCE)

I don't think so.

As far as I can see, we're doing:

    # Argument 1 is the source location
    # Argument 2 is the local filename, optional [...]
    define DOWNLOAD
        $(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
    endef

So, we have two cases:
  - upstream and local filenames differ: the second argument is the
    local filename
  - upstream and local filenames are the same: the second argument is
    empty, and defaults to the upstream filename

So, we always end up calling DOWNLOAD_INNER with the local filename as
second argument. Then,

    define DOWNLOAD_INNER
        [...]
        if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
            $(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
        fi ; \
        [...]
    endef

So, we're fetching $(2) from the backup site. And $(2) is the local
filename.

Ergo, the fallback site case is covered. :-)

Pfeww, you made me doubt for a moment, and I was afraid I'd have to
rework the whole series entirely. Not the case, Hehe! ;-p

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
