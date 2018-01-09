From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 08:59:13 +0100
Subject: [Buildroot] [PATCH 3/8] python-setuptools: check host-python
 version
In-Reply-To: <1515462462.25398.31.camel@impinj.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
 <20180102163337.6334-4-aduskett@gmail.com>
 <1514931195.26695.184.camel@impinj.com>
 <20180105212908.7a048009@windsurf>
 <1515462462.25398.31.camel@impinj.com>
Message-ID: <20180109085913.3e326979@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Jan 2018 01:47:42 +0000, Trent Piepho wrote:

> If I understand correctly, the fundamental problem is that Adam's patch
> allows for simultaneously enabling both host python2 and host python3
> and building host python packages using both python versions or a
> version different than the target python version.

Correct.

> But I think Adam pointed out a real flaw that can be fixed.  It's
> caused problems for me as well.
> 
> The issue is that the host python version is linked to the target
> python version.  Which is fine, if there is a target python.  But the
> logic fails if there is no target python.
> 
> Right now, one gets this:
> Target Python 2 -> Host Python 2
> Target Python 3 -> Host Python 3
> No Target Python -> Host Python 2

Absolutely.

> I'd like to build host python 3 utilities and don't have python on the
> target.  Can't see a way to configure buildroot to do that.  I can add
> a build dep on host-python3 and get the interpreter built, but I can't
> make a host-python-package using python3.
> 
> I think this could be fixed by making host python config options, which
> are forced by the target python configs, so that host python can only
> be selected manually if no target python is enabled.
> 
> Packages that want to depend on host python should use the host python
> config to select which python to depends on, rather than the target
> python config as they do now.  If target python is enabled, then host
> python == target python so there is no change.  But without target
> python it will be possible to build select either host-python3 or host-
> python as the python version to be used by host-python-setuptools.

Yes, this would be possible. Feel free to make a proposal in this
direction.

In general, we have already discussed several times adding Config.in
options for all host packages. They would be hidden options for most of
the packages, but they would still be visible for some packages (like
we have today in Config.in.host).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
