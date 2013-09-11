From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Sep 2013 18:37:50 +0200
Subject: [Buildroot] [PATCH 1/1] omniorb: new package
In-Reply-To: <OF73BC5A48.6FA35E99-ON86257BE3.0047E145-86257BE3.004D4DAD@rockwellcollins.com>
References: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
 <20130906001706.0c59d0ff@skate>
 <OF9C2B3BB5.42526667-ON86257BDE.00063112-86257BDE.004AF018@LocalDomain>
 <OF2000AD28.53AF8D18-ON86257BDE.004D8E89-86257BDE.004DB0A9@rockwellcollins.com>
 <522D66E4.9010104@mind.be>
 <OF73BC5A48.6FA35E99-ON86257BE3.0047E145-86257BE3.004D4DAD@rockwellcollins.com>
Message-ID: <52309C5E.2050108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/13 16:04, mlweber1 at rockwellcollins.com wrote:
> Arnout Vandecappelle <arnout@mind.be> wrote on 09/09/2013 01:12:52 AM:
>
>  > From: Arnout Vandecappelle <arnout@mind.be>
>  > To: mlweber1 at rockwellcollins.com
>  > Cc: thomas.petazzoni at free-electrons.com, buildroot at busybox.net
>  > Date: 09/09/2013 01:45 AM
>  > Subject: Re: [Buildroot] [PATCH 1/1] omniorb: new package
[snip]
>  >   If it doesn't look in the path, then actually autotools has the
>  > infrastructure to build host utilities during the cross-build. That is
>  > why CC_FOR_BUILD is passed to configure. So it would be sufficient to
>  > patch the Makefile.am in the tools directory to use CC_FOR_BUILD (and
>  > CPPFLAGS_FOR_BUILD and CFLAGS_FOR_BUILD). If you want an example, look at
>  > yasm or nettle.
>  >
>  >   If you patch the build system this way, the patch can be upstreamed and
>  > we don't have to carry it for eternity.
>
> It looks like the autotools version used for the package doesn't have
> CC_FOR_BUILD.
> I wish I could do it this way, since the files I need it for just need to
> be build
> for the host architecture and left in the tools/bin folder for use by the
> cross build.
> It would be perfect to have a single package build satisfy this.  I'll
> investigate
> if there is any traction on improving the cross building of this package.

  I've also taken a look, and the build system is indeed horribly broken.

  Unfortunately, your solution still has an important shortcoming: it 
will install the host binaries for those tools to the target. I think the 
solution is rather simple:

define OMNIORB_BUILD_TOOLS
	$(HOST_MAKE_ENV) $(MAKE) CXX=$(HOSTCXX) CC=$(HOSTCC) \
		-C $(@D)/src/tool export
endef

OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_BUILD_TOOLS

define OMNIORB_CLEAN_TOOLS
	$(HOST_MAKE_ENV) $(MAKE) CXX=$(HOSTCXX) CC=$(HOSTCC) \
		-C $(@D)/src/tool clean
endef

OMNIORB_POST_BUILD_HOOKS += OMNIORB_CLEAN_TOOLS

  This will build the tools and install them locally in the build tree. 
After building, the tools are cleaned again, so that the install target 
will re-build them. It's a huge hack so make sure to add some explanatory 
comments.

  Note: I haven't tried this :-)

  BTW Ideally the POST_CONFIGURE hook should be a PRE_BUILD hook but we 
don't have that.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
