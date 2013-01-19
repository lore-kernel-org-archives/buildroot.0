From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 14:27:58 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
	startx
In-Reply-To: <50F8218F.4070701@wanadoo.fr>
References: <50BDEE24.6010601@wanadoo.fr> <871uf5obh3.fsf@dell.be.48ers.dk>
 <50F8218F.4070701@wanadoo.fr>
Message-ID: <50FA9F5E.4020005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/01/13 17:06, Thierry Bultel wrote:
> Hi,
>
> Sorry for the long delay
>
> The  bug is reproducible with latest release,
> and I finally found out why.
>
> The issue is that in xapp_xinit, 'configure' checks for 'mcookie', and
> the first time, founds it ... on the host side, ie the "/usr/bin/mcookie"
> of Ubuntu for instance. This is the path that is substituted in startx.
>
> When rebuilding the xapp_xinit package, "mcookie" has been built by
> buildroot, in the xorg_server package. Thus "configure" finds it in our
> build directory, ie output/host/usr/bin/mcookie, which is not a target path.
>
> A quick fix (not meaning it is the cleanest way) is simply to add
>
> XAPP_XINIT_CONF_OPT += MCOOKIE=/usr/bin/mcookie
>
> in xapp_xinit.mk

  That's a perfectly clean solution - on condition that mcookie is indeed 
installed on the target. I guess the option should therefore be in an

ifeq ($(BR2_PACKAGE_UTIL_LINUX),y)
XAPP_XINIT_CONF_OPT += MCOOKIE=/usr/bin/mcookie
endif

  Care to make a patch?

  Regards,
  Arnout

>
> Thierry
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
