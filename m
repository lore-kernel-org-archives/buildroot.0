From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 16:57:38 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
	startx
In-Reply-To: <20130119144250.2d73d60d@skate>
References: <50BDEE24.6010601@wanadoo.fr> <871uf5obh3.fsf@dell.be.48ers.dk>
 <50F8218F.4070701@wanadoo.fr> <50FA9F5E.4020005@mind.be>
 <20130119144250.2d73d60d@skate>
Message-ID: <50FAC272.7040909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/01/13 14:42, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Sat, 19 Jan 2013 14:27:58 +0100, Arnout Vandecappelle wrote:
>
>>    That's a perfectly clean solution - on condition that mcookie is indeed
>> installed on the target. I guess the option should therefore be in an
>>
>> ifeq ($(BR2_PACKAGE_UTIL_LINUX),y)
>> XAPP_XINIT_CONF_OPT += MCOOKIE=/usr/bin/mcookie
>> endif
>>
>>    Care to make a patch?
>
> We also have a mcookie package in package/x11r7/mcookie/. I guess the
> purpose was to avoid building the entire util-linux stuff just to get
> mcookie. Maybe we need to decide whether we want to use one mcookie
> solution (the standalone package) or the other (mcookie built as part
> of util-linux), and stick to it. No?

  That would indeed be better... In my allpackage build, the mcookie that 
ends up in target/usr/bin is the one from util-linux...

  Since mcookie is not in busybox, it does make sense to have a separate 
source for it. However, it's only used by xserver and at that point the 
additional size of util-linux isn't really an issue anymore...

  So I think we can safely remove mcookie.

  Or leave things as is, even.


  BTW, shouldn't xapp_xinit depend on XORG_SERVER? xinit tries to start 
an X server... If xapp_xinit depens on XORG_SERVER then the condition I 
proposed is no longer necessary, because MCOOKIE will be selected.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
