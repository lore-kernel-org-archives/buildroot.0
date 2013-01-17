From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 17 Jan 2013 17:06:39 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
	startx
In-Reply-To: <871uf5obh3.fsf@dell.be.48ers.dk>
References: <50BDEE24.6010601@wanadoo.fr> <871uf5obh3.fsf@dell.be.48ers.dk>
Message-ID: <50F8218F.4070701@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry for the long delay

The  bug is reproducible with latest release,
and I finally found out why.

The issue is that in xapp_xinit, 'configure' checks for 'mcookie', and 
the first time, founds it ... on the host side, ie the 
"/usr/bin/mcookie" of Ubuntu for instance. This is the path that is 
substituted in startx.

When rebuilding the xapp_xinit package, "mcookie" has been built by 
buildroot, in the xorg_server package. Thus "configure" finds it in our 
build directory, ie output/host/usr/bin/mcookie, which is not a target path.

A quick fix (not meaning it is the cleanest way) is simply to add

XAPP_XINIT_CONF_OPT += MCOOKIE=/usr/bin/mcookie

in xapp_xinit.mk

Thierry


Le 04/12/2012 20:37, Peter Korsgaard a ?crit :
>>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:
>
>   Thierry> Hi,
>   Thierry> The generated "startx" has the host path for mcookie:
>
>
>
>   Thierry> ----------
>   Thierry>    esac
>
>   Thierry>     authdisplay=${display:-:0}
>
>
>   Thierry> mcookie=`/nous/BASYSTEMES/Buildroot/output.imx6neon/host/usr/bin/mcookie`
>
> What buildroot version are you using? It seems to be correct here with
> current git:
>
> grep bin/mcookie output/target/usr/bin/startx
>      mcookie=`/usr/bin/mcookie`
>
