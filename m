From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 10 Dec 2010 08:29:56 -0600
Subject: [Buildroot] [PATCH] iproute2 depends on iptables and both
	packages need AR set to TARGET_AR
In-Reply-To: <AANLkTikqsS+VfM8aSWzQz1ZUHWQGw2pAR98BLc1U0bdW@mail.gmail.com>
References: <84f07dad0d6d3c038b5e7a7e00fff09c4b010b60.1291939153.git.smiley73@users.sourceforge.net>	<AANLkTi=y1trbKTL-Kc6rS2urg=wf63WPnC=ovR5qGcuV@mail.gmail.com>
	<AANLkTikqsS+VfM8aSWzQz1ZUHWQGw2pAR98BLc1U0bdW@mail.gmail.com>
Message-ID: <002c01cb9876$b7667860$26336920$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[................]

> > Do you have a real problems with AR in iptables? I don't find $(AR) in
> > the unpacked iptables source. And don't see any ar while iptables
> > building process.
> 
> Indeed for autotools packages, AR is set to TARGET_AR at configure step.
So
> there is no need to set it again at build step.

It definitely did not build without it. I tried multiple times.
For some reason it kept using the host's ar, which didn't work so well.

> > I think it's not good to set hard dependence on iptables to the
> > iproute2 package. Because iproute2 can be built without iptables. So
> > the iptables is optional for iproute2.
> >
> 
> It's not good indeed, because if you run the configure script, it's going
to
> detect it.
> All you have to do is to patch the configure script, so it doesn't use
'gcc' but
> '$(CC)' which is set by buildroot.
> Otherwise you could probably fill the Config file produced by the
configure
> script yourself, so you know exactly what you enable or not.

Right now iproute2 chokes if it doesn't find the xtables stuff from
iptables.
I took a quick look at the makefile and we'd need to make sure TC_CONFIG_XT
is not defined. 
I'll take a look at this today and send in a revised patch. 

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
