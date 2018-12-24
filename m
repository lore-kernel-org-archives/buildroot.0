From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Dec 2018 10:59:11 +0100
Subject: [Buildroot] [PATCH 1/2] package: pkg-autotools: Add option to
 run autogen.sh
In-Reply-To: <20181224092159.GA2703@scaer>
References: <20181223223742.23710-1-vadim4j@gmail.com>
 <20181223223742.23710-2-vadim4j@gmail.com>
 <20181224092159.GA2703@scaer>
Message-ID: <20181224105911.19475421@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Dec 2018 10:21:59 +0100, Yann E. MORIN wrote:

> On 2018-12-24 00:37 +0200, Vadim Kochan spake thusly:
> > Add $(PKG)_AUTOGEN variable which allows to execute autogen.sh script
> > on pre-configure stage.  
> 
> I'm not sure we want to have this in the infra. IIRC, we already spoke
> about it in the past, more than once, and the conclusion had always been
> that this was not demed useful.
> 
> First, we only have three autotools packages that need that. This is a
> bit on the short lead to turn it into the infra.
> 
> Second, we don't want to make it easy to use autogen.sh. We prefer
> developpers to use AUTORECONF=YES instead. Using autogen.sh should be
> a last-resort option.
> 
> Thirdly, and lastly, not all packages have autogen.sh, some have it as
> bootstrap.sh, for example Asterisk:
>     http://git.asterisk.org/gitweb/?p=asterisk/asterisk.git;a=blob;f=bootstrap.sh
> 
> (Note that we don't need to call Asterisk's bootstrap.sh in Buildroot,
> but that is just an example that such scripts are not always named
> autogen.sh.)
> 
> So, my opinion is that we should not have it in the infra.

Overall, I agree with you. If we wanted to make this more flexible than
what we have today, I would suggest to allow customizing the command
that it used for autoreconfiguring.

Something like this:

$(2)_AUTORECONF_CMD ?= $(AUTORECONF)

define AUTORECONF_HOOK
        @$(call MESSAGE,"Autoreconfiguring")
        $(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $($(PKG)_AUTORECONF_CMD) $($(PKG)_AUTORECONF_OPTS)
endef

One drawback is that having a CMD variable doesn't really match our
typical CMDS pattern.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
