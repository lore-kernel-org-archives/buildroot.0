From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 17:17:48 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171103161057.GB3387@scaer>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf> <20171102221847.GA23314@scaer>
 <20171102232345.5a434af8@windsurf> <20171103161057.GB3387@scaer>
Message-ID: <20171103171748.0111e6b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Nov 2017 17:10:57 +0100, Yann E. MORIN wrote:

> > So you want explicitly handling for the "missing configuration file"
> > situation in the init script?
> > 
> > I wanted to avoid explicit handling, and just let the daemon whine (or
> > not) if its config file is missing.  
> 
> The idea is that the script contains sensible defaults, but scans an
> optional file (e.g. /etc/default.d/my-daemon.conf) that a user can
> provide to override the defaults.
> 
> IIRC, that's what was discussed and concluded a while ago (2 years?).
> 
> I would like that users can change the behaviour of a service without
> having to sed/replace the init script.

I think we're not talking about the same thing. I'm not talking
about /etc/default/foobar containing additional shell variables to
tweak the init script behavior.

I'm talking about the configuration file read by the daemon itself
(/etc/lighttpd/lighttpd.conf for example).

For inadyn, we have:

CONFIG=/etc/inadyn.conf
[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )

So here we error out.

And for squid, we have:

[ -f /etc/squid.conf ] || exit 0

So we silently exit if there's no configuration file.

I'd like to have a consistent solution for this, and my proposal is to
do nothing in the init script, i.e start the daemon, and let it
explode/blow up/complain/whine if its configuration file is missing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
