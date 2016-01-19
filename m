From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2016 18:22:48 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
 kernel "package" selected
In-Reply-To: <87powx3le0.fsf@dell.be.48ers.dk>
References: <87y4bn6y5s.fsf@dell.be.48ers.dk> <20160118214704.GA3380@free.fr>
 <20160118230345.52b8f054@free-electrons.com>
 <877fj64jhn.fsf@dell.be.48ers.dk>
 <20160118232457.472dc051@free-electrons.com>
 <87y4bm2d42.fsf@dell.be.48ers.dk>
 <20160119111834.797ea6d9@free-electrons.com>
 <87twm93lsb.fsf@dell.be.48ers.dk>
 <20160119113154.2f4613fc@free-electrons.com>
 <87powx3le0.fsf@dell.be.48ers.dk>
Message-ID: <20160119172248.GA3360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2016-01-19 11:37 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > Dear Peter Korsgaard,
>  > On Tue, 19 Jan 2016 11:29:08 +0100, Peter Korsgaard wrote:
> 
>  >> Well, linux-headers doesn't need to do much - So with a bit of care I
>  >> think you can.
>  >> 
>  >> E.G. something like (completely untested):
>  >> 
>  >> ifeq ($(LINUX_HEADERS_FROM_KERNEL),y)
>  >> # no source
>  >> LINUX_HEADERS_SOURCE =
>  >> LINUX_HEADERS_DEPENDENCIES += linux-configure
> 
>  > The configure step of a package depends on the dependencies of that
>  > package. So linux-configure depends on toolchain. And toolchain depends
>  > on linux-headers -> recursive dependency.
> 
>  > Another try ? :-)
> 
> Then linux-patch, we afaik don't need a configured linux kernel to make headers_install

Indeed, that's a good idea. We propbably could use set:

    LINUX_HEADERS_PATCH_DEPENDENCIES = linux

which will guarantee that linux is patched before linux-headers is
configured (in the Buildroot sense).

Then, we basically could do:

    define LINUX_HEADERS_INSTALL_STAGING_CMDS
        $(MAKE) -C $(LINUX_DIR) INSTALL_HDR_PATH=$(STAGING_DIR)/usr
    endef

(with extra variables as done today, of course...)

There, we can use $(LINUX_DIR) because the macro is only expanded in a
make rule, so we should be fine. Hopefully...

I can have a look at this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
