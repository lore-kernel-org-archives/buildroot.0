From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Sat, 16 Jan 2016 16:08:07 -0600
Subject: [Buildroot] [RFC PATCH v2 1/4] package/dhcp: bump version to
 4.3.3
In-Reply-To: <56999dadc4b34_37c612cbc848316d@ultri2.mail>
References: <20160115153121.GA16597@dkarchlinux64.currentcomm.com>
 <56999dadc4b34_37c612cbc848316d@ultri2.mail>
Message-ID: <20160116220807.GA2321@dkarchlinux64.gateway.pace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo, All,

On Fri, Jan 15, 2016 at 11:32:29PM -0200, Ricardo Martincoski wrote:
> Hi Doug,
> 
> On Fri, Jan 15, 2016 at 01:31 PM, rdkehn at yahoo.com wrote:
> > Hi Richardo, Arnout, All,
> > 
> > On Thu, Jan 14, 2016 at 10:17:28PM -0200, Ricardo Martincoski wrote:
> >> Hi Doug and Arnout,
> >> 
> >> On Sun, 10 Jan 2016 15:25:06 -0600, Doug Kehn wrote:
> >> > The embedded bind configure is called as part of dhcp make instead of
> >> > dhcp configure. dhcp make environment is expanded to ensure bind
> >> > configure has the proper information.
> >> Maybe the bind configure could be called in a post configure hook.
> >> This way, bind would be configured in the configure step too.
> >> 
> >> [snip]
> >> > +DHCP_MAKE=$(MAKE1)
> >> > +
> >> > +DHCP_MAKE_ENV = \
> >> > +	GNU_TARGET_NAME=$(GNU_TARGET_NAME) \
> >> For at least one external toolchain, the bind configure can't find the
> >> target compiler because it is expecting arm-buildroot-linux-gnueabi-gcc
> >> while the binary name is arm-none-linux-gnueabi-gcc.
> >> Maybe setting CC here would fix this.
> >> > +	GNU_HOST_NAME=$(GNU_HOST_NAME) \
> >> > +	AR="$(TARGET_AR)" \
> >> > +	BUILD_CC="$(HOSTCC)"
> > 
> > Did you try adding CC to see if it fixed the external toolchain
> > issue? I also wonder if adding $(TARGET_CONFIGURE_OPTS) to MAKE_ENV
> > is warranted?
> > 
> I just tested adding only CC="$(TARGET_CC)" copied from TARGET_CONFIGURE_OPTS
> and it solves the external toolchain issue.
> Only a few autotools-packages (smcroute, fcgiwrap, libpam-radius-auth) add
> $(TARGET_CONFIGURE_OPTS) to MAKE_ENV. All three have comments to justify the
> use, so I suppose it is not the best practice.

Thanks for the feedback.

> 
> >> 
> >> If a hook is used, TARGET_CONFIGURE_OPTS can provide most of variables needed,
> >> fixing the issue with some external toolchains.
> >> Something like this:
> >> DHCP_BIND_CONF_ENV = \
> >> 	$(TARGET_CONFIGURE_OPTS) \
> >> 	GNU_TARGET_NAME=$(GNU_TARGET_NAME) \
> >> 	GNU_HOST_NAME=$(GNU_HOST_NAME) \
> >> 	BUILD_CC="$(HOSTCC)"
> >> 
> >> define DHCP_CONFIGURE_BIND
> >> 	$(DHCP_BIND_CONF_ENV) $(DHCP_MAKE) -C $(@D)/bind bind1
> >> endef
> >> DHCP_POST_CONFIGURE_HOOKS += DHCP_CONFIGURE_BIND
> >> > +
> >> > +define DHCP_EXTRACT_BIND
> >> > +	cd $(@D)/bind; tar -xvf bind.tar.gz
> >> > +endef
> >> > +DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
> >> 
> >> What do you think about this?
> > 
> > Did the configure hook work for you?
> > 
> Yes.
> Also, in a rapid test, the hook seems to work fine after removing
> TARGET_CONFIGURE_OPTS and adding back AR and CC.
> 

I also tested the configure hook scenario. It worked for my use case
as well.

> > At the end of the day, configure hook vs make env is a matter
> > preference for the Buildroot maintainers; as long as it works... I
> > have not yet tried the configure hook; but, I will. My only
> > reservation with the configure hook is that it must know the exact
> > target to make to configure bind as apposed to just ensuring the
> > environment has the proper values for cross compiling and letting
> > the Buildroot infra take care of the rest. 
> > 
> Taking your reservation into account, I agree make env seems a better choice.
> Thank you for your explanation.
> 

Peter, Thomas, there are two solutions to this problem. I
would appreciate your input on your preference before I submit a
patch.

Thanks and Regards,
...doug
