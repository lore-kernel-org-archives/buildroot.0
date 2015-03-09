From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Mar 2015 00:17:41 +0100
Subject: [Buildroot] SysV init script revamp (proposal)
In-Reply-To: <54FA0173.60504@zacarias.com.ar>
References: <54FA0173.60504@zacarias.com.ar>
Message-ID: <54FE2A15.7040109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gustavo,

On 06/03/15 20:35, Gustavo Zacarias wrote:
> 
> Hi all.
> Before going all crazy sending patches and possibly wasting a lot of
> time i'll write up my thoughts on how we could enhance/fix/clean the
> current scenario regarding initscript:

 I agree with the others who have given feedback that this is really a
worthwhile effort!


> 
> The target of this proposal is exclusively SysV-style (busybox, systemV)
> initscripts.

 And I also think it's a good idea to focus on this and not worry too much about
systemd. Chances are that unifying them will just complicate things too much.
And I don't think it's buildroot's purpose to make it easy for a user to switch
over an existing installation from sysv to systemd or vice versa.


> 
> Objetives
> =========
> 
> 1) Cleanup & consistency.

 Hear, hear!

> 2) Make them configurable.

 But I'm not so enthusiastic about this one...

 Specifically, make it post-install configurable is IMO not a priority. And even
make it install-time configurable should be traded off against the complexity
required to support that.


> 
> Motivation
> ==========
> 
> Right now the out-of-the-box experience is a mixed bag.
> Some initscripts use debian-style configurations, others redhat, others
> some undocumented tweaks, and others none.
> When talking about configuration options i'm talking about options each
> daemon provides that can only be set via invocation parameters that
> can't be set via a config file. Example would be port, interface(s) to
> listen on, debug level, protocol, log file and others.
> Security is also a reason for this, right now we aren't even consistent
> on which daemons should start on an uncustomized system and this can
> indirectly bring up attack vectors to the unwary user via indirect
> dependencies (i.e. some package needs libsmbclient -> samba does a full
> install with initscript and sample config -> bam).

 Like Thomas and Yann, my intuition the default should be to start the installed
daemons. But as discussed on IRC, it's not so cut and dried, there are many
examples where starting the daemon is not what you want.

 Bottom line, it should be easy for the user to choose to start the daemons or
not. But for me, removing the init script in a post-install is enough.

> On the configurability side we don't know and we shouldn't really care
> about the filesystem layout of the target and it should be able to deal
> with many possible scenarios.
> 
> Cleanup & consistency
> =====================
> 
> * All of the scripts should look the same so anyone can use any other as
> template.

 Yes!

> * The scripts should be able to run with any of the standard POSIX
> shells (busybox ash, bash, dash, zsh) available.

 Yes!

> * Scripts should have at least the basic 'start', 'stop' and 'restart'
> parameters. When relevant 'reload' should be available as well.
> * Optionally implement a 'status' call to know if a daemon is
> effectively up or crashed (via return value).
> * pidfiles mandatory when possible, always in /run

 Yes!

 Perhaps important to decide if start-stop-daemon should be used or not (I'd say
yes).


> 
> Make them configurable
> ======================
> 
> * Make a default initscript configuration directory on the target:
> /etc/default/SERVICE which matches the {Sxx,Kxx}SERVICE initscript.
> * Allow this configuration to be overriden via another directory:
> /etc/config/SERVICE

 Here I have the feeling we're entering the realm of unnecessary complexity. In
fact, I'm not even sure if run-time sourcing of a configuration file is
necessary to begin with. In practice, when adapting the boot behaviour, I look
at what is installed by buildroot in /etc/init.d and then either copy and modify
the init script to my rootfs overlay, or add a /etc/default file. But more often
than not when I have to adapt one of the defaults, I still want to change
something else in the init script anyway. So for me, init scripts with no
configuration at all are good enough. I don't even need variables to control
options or anything like that - it's much easier for me to just change the
command line that starts the daemon.

 We're not like a distro, where you want to avoid conflicts between the package
maintainer's updates to the scripts and the administrator's configuration. We
basically never have real fixes in the init scripts, only cleanups. So when a
user has tuned an init script for their purpose, there is almost never anything
useful in the changes pushed by buildroot.


> By default we install /etc/default/SERVICE and leave /etc/config/SERVICE
> for users to tinker with.
> Many scenarios are covered by this.
> Users can ship /etc/default/SERVICE as a default/safe/fallback config
> for their products (for example rootfs being RO) with /etc/config being
> a RW filesystem (or symlink to one) where their users can
> customize/write configuration data.
> The initscript sources /etc/default/SERVICE first, and then, if
> available, /etc/config/SERVICE to override config options.
> If the "box" (target) has a reset switch this could be checked at boot
> time and trigger a simple "rm /etc/config/*" routine to get rid of the
> config files via a custom script, or just move it out of the way to
> avoid evaluation (or more advanced scenarios like last known good
> config, backup config, and so on).

 Hello Leonard :-) [1]

 I personally don't see a use case for service tweaking after installation in
the buildroot context. I think that in practical cases, you'll want to have
configuration controlled by something else anyway, e.g. uci.


> * Customizable start/stop order via an enhanced rcS/rcK and an
> "initscript table" in the target leaving all the initscripts level-less
> in their name (creating a default/recommended table for this automatically).

 As mentioned on IRC: that sounds like file-rc.

> * Triggers: tricky, but doable. One script when successful calls another
> one to start/stop. This way if say an ethernet connection bringup fails
> a fallback WWAN one can be established.

 And this sounds like openrc (or systemd :-)


 Regards,
 Arnout


> 
> I probably forgot about some details... bring in the ideas and flames!
> 
> Regards.


[1] http://0pointer.net/blog/projects/stateless.html


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
