From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 12 Jan 2018 22:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <20180112220436.677e3084@windsurf.lan>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
Message-ID: <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 12, 2018 at 10:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 12 Jan 2018 15:46:14 +0100, Yegor Yefremov wrote:
>
>> > +# Run the bootstrap.sh command.
>> > +# (from the 'lldpad Application Install' section of the README file)
>> > +define OPEN_LLDP_BOOTSTRAP
>> > +       (cd $(@D) && ./bootstrap.sh)
>> > +endef
>>
>> m4 folder is missing. It is worth sending a patch upstream (open-lldp)
>> to fix this. As long as you have this hook, you don't need
>> OPEN_LLDP_AUTORECONF = YES, because boostrap.sh already invokes
>> "autoreconf -i". At least thy this.
>
> No, I disagree here. If you drop <pkg>_AUTORECONF = YES, then you loose
> the dependency on host-autoconf, host-automake and host-libtool.

You're right.

> So instead, please keep <pkg>_AUTORECONF = YES, and if the missing m4
> folder is the only problem (but I doubt it because the bootstrap.sh
> script doesn't create it), then add a post-extract hook that creates
> the m4 file.

bootstrap.sh doesn't create m4 folder, but if you just clone the
open-lldp repo and invoke "autoreconf -i", it would just complain
about missing m4 folder, but create it. In BR environment we get an
error. We had similar situation earlier with some other package
(libsoc) and I coudn't find the case of the problem, so I just added
m4 upstream and now it is working.

>> The package doesn't build:
>>
>> In file included from lldpad.c:58:0:
>> ./include/lldp_8021qaz.h:237:12: error: inline function
>> ?ieee8021qaz_clif_cmd? declared but never defined [-Werror]
>>  inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
>>             ^~~~~~~~~~~~~~~~~~~~
>> ./include/lldp_8021qaz.h:222:13: error: inline function ?set_prio_map?
>> declared but never defined [-Werror]
>>  inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
>>              ^~~~~~~~~~~~
>> ./include/lldp_8021qaz.h:221:12: error: inline function ?get_prio_map?
>> declared but never defined [-Werror]
>>  inline int get_prio_map(u32 prio_map, int tc);
>>             ^~~~~~~~~~~~
>
> Perhaps you could tell Laurent which configuration you've used to
> produce this build failure, so that he can reproduce it.

I get this error even on my Debian 9 host. In BR I've been playing
with powerpc defconf, that has boost issues in autobuilders.

Yegor
