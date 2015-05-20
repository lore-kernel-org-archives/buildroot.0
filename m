From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 May 2015 20:57:09 -0700
Subject: [Buildroot] [PATCH] package/iproute2: disable iptables support
 for static build
In-Reply-To: <87egmc5pmf.fsf@dell.be.48ers.dk>
References: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
 <87egmc5pmf.fsf@dell.be.48ers.dk>
Message-ID: <555C0615.9050608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/05/15 12:33, Peter Korsgaard wrote:

> So what about we do:
>
> - Add host-pkgconf to _DEPENDENCIES
> - Add the BR2_STATIC_LIBS conditional for iptables and force
>    TC_CONFIG_XT:=n in the else clause.
> - Drop the TC_CONFIG_XT:=y and TC_CONFIG_IPSET:=n overrides
> - Replace the s/-DIPT/-DXT/ handling for iptables with something like:
>    $(SED) 's/XT_LIB_DIR/IPT_LIB_DIR/' $(@D)/tc/m_xt.c
> - Drop the IPT_LIB_DIR override in _CONFIGURE_CMDS
>
> Gustavo, you normally take care of iproute2, what do you say?

The iproute2 "build system" periodically changes and breaks things up, 
so it doesn't surprise me at all.
Normally the extensions dir (IPT_LIB_DIR) should point to 
/usr/lib/xtables as defined by the iptables package.
The ipset bits on tc are to match an ipset (rather than the usual 
ip/subnet) to a class to shape/whatever.
I'm currently AFH (away from home) so i don't have my networking testing 
rig handy, but in principle it sounds ok as long as the checks in the 
makefiles/code have been fixed.
I'll be back on monday, so we can either wait for testing or just go 
with it and i'll test when i'm back and scream if something breaks ;)
Caveat: normally netfilter devs don't test/care that much about static 
scenarios, they'll take patches but don't expect things to remain 
unbroken for an extended period of time.
Regards.
