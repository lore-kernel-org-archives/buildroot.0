From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 22:42:28 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <20150419190321.19200e70@free-electrons.com>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>	<20150419110326.31c34542@free-electrons.com>	<5533D5CF.5000305@mind.be>	<20150419162839.GI4313@free.fr>
 <20150419190321.19200e70@free-electrons.com>
Message-ID: <553564B4.2060303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 19:03, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Sun, 19 Apr 2015 18:28:39 +0200, Yann E. MORIN wrote:
> 
>> Well, I would not be very happy with that, since that would make the
>> following use-case a real pain:
>>
>>     $ make foo_defconfig
>>     $ make linux-menuconfig
>>
>> Currently, all it needs is the linux kernel to be extracted and patched,
>> and none of its depedencies to be built. Otherwise, it would require the
>> toolchain to be built, plus a sh.tload of other stuff (lzo, for one, and
>> all its own dependencies).
> 
> We could remove the mandatory host-lzo dependency from the linux
> package, by adding an option for that. Remember the recent patches also
> adding host-xz to the dependencies of linux, which I rejected?
> 
> This would leave host-kmod as the only dependency of the linux package
> I believe. But well host-kmod as AUTORECONF = YES, so it pulls a whole
> bunch of crap.

 As mentioned before, it pulls in the toolchain as well. That's a lot worse than
host-lzo and host-xz - even extracting an external toolchain takes longer than
host-xz (at least for me).


 However, we can add the dependency specifically for linux-backports. There is
something to be said for the reasoning that usually/sometimes you don't need the
dependencies to be present, so doing it per package sounds OK.

 So in this case, adding

$(LINUX_BACKPORTS_KCONFIG_FILE): linux

to linux-backports.mk should be sufficient.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
