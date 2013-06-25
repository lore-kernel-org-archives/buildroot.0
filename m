From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 25 Jun 2013 16:29:05 -0300
Subject: [Buildroot] Some issues found while trying to add JimTcl to
	buildroot
In-Reply-To: <20130625212043.3d224da3@skate>
References: <CALF0-+V5oWQ_zo6pzs8WOEj02H2Q9W7rzBvioabK0u_nuAaXDg@mail.gmail.com>
 <20130625212043.3d224da3@skate>
Message-ID: <CALF0-+Wv84PKHfz8XzfEBEmprrtOfBF+Szqy8ATZ4y0x3xpsjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jun 25, 2013 at 4:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 25 Jun 2013 15:23:56 -0300, Ezequiel Garcia wrote:
>
>> I'm working on adding JimTcl [1] to Buildroot. The first issue you
>> found is that Jim Tcl uses autosetup [2]
>> instead of autotools. So my first approach is creating a
>> "generic-package" jimtcl.mk.
>
> Gustavo already pointed you on IRC to

For some reason, it seems my IRC was temporarily disconnected,
so I missed that hint :-( Thanks for pointing it out!

> http://repo.or.cz/w/buildroot-gz.git/commitdiff/651525c5c4f66c0f8fbc3ac518632c514bee4866.

That's great! (Thanks Gustavo!)

> Any reason not to use it? This patch is also in our patchwork at

Well, on a very first look I need the libjim.a to embed the
interpreter inside an application.
Sadly, the shell is useless in this case. I'll see if I can work on
top of Gustavo's patch
and install the library and the headers.

> http://patchwork.ozlabs.org/patch/181627/.
>
>
>> Knowing it's ugly, I'd like to ask what's the 'nice' way of doing it:
>>
>> #############################################################
>> #
>> # Jim Tcl 0.73
>> #
>> #############################################################
>>
>> JIMTCL_VERSION = 0.73
>> JIMTCL_SITE = git://repo.or.cz/jimtcl.git
>> JIMTCL_SITE_METHOD = git
>>
>> JIMTCL_INSTALL_STAGING = YES
>>
>> define JIMTCL_CONFIGURE_CMDS
>>       (cd $(@D); PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
>>               ./configure --host=$(GNU_TARGET_NAME) --prefix=$(STAGING_DIR))
>
> prefix of STAGING_DIR is most likely wrong. It should be /usr in most
> cases.
>
>> endef
>>
>> define JIMTCL_BUILD_CMDS
>>       PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
>>               $(MAKE) -C $(@D)
>> endef
>>
>> define JIMTCL_INSTALL_STAGING_CMDS
>>       PATH=$(PATH):/home/foo/buildroot/buildroot/output/host/usr/bin \
>>               $(MAKE) -C $(@D) install
>> endef
>
>         $(TARGET_MAKE_ENV) $(MAKE) ...
>
> TARGET_MAKE_ENV already sets a PATH variable that has the toolchain
> directory in it. See package/Makefile.in for the definition of
> TARGET_MAKE_ENV.
>

Cool, thanks.

I'll take a closer look to this, and to Gustavo's patch and let you both know.

Thanks a lot for the help,
-- 
    Ezequiel
