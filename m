From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:46:10 +0100
Subject: [Buildroot] [PATCH 00/10 v3] support/download: reproducible
 archives whatever tar version (branch yem/dl-git-tar-pax-2)
In-Reply-To: <20201229140926.4482f6f9@windsurf.home>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <20201229140926.4482f6f9@windsurf.home>
Message-ID: <20201229134610.GL1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-29 14:09 +0100, Thomas Petazzoni spake thusly:
> On Tue, 29 Dec 2020 12:01:15 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > This however changes the actual format of the generated archives,
> > and they are different from the existing ones. So we also change the
> > compression to avoid collision with existign archives on s.b.o, that
> > need to be read by older Buildroot versions.
> 
> You're in fact no longer changing the compression, as instead you're
> using a different tarball name.

Ah, I forgot to drop that from the cover-letter (I removed it from the
commit logs, though)...

> I am wondering how this tarball suffix mechanism would be used in my
> Go/Cargo vendoring series to avoid the need to version bump the
> Cargo/Go packages in lock-step with the vendoring. Indeed, your series
> is based on an extension per download backend, but in the case of the
> vendoring, it happens regardless of the download backend, but rather
> based on the package infrastructure.
> 
> How would we handle that ?

I was also considering a similar mechanism for the vendoring thingy...

My initial thought was to have a ways to extend this extra format
version. I am not entirely sure how to do it, but probably something
along the lines of:

    define cargo-inner
    $(2)_VENDOR_VERSION = _cargo
    endef

    define generic-inner
    $(2)_SOURCE_EXT = $$($(2)_VENDOR_VERSION)$$(BR_FMT_VERSION_$$($(2)_SITE_METHOD)).tar.gz
    endef

But this is not as nice as I'd like it to be... If you have another
idea, please be my guest. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
