From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Dec 2019 15:41:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/tini: compile executable static
In-Reply-To: <f361f14c-3a77-d769-1b5c-9a1a5fd8f3b3@eu.citrix.com>
References: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
 <20191123211555.GZ32494@scaer>
 <f361f14c-3a77-d769-1b5c-9a1a5fd8f3b3@eu.citrix.com>
Message-ID: <5e477792-65af-42f8-5302-55ac4df554f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/11/2019 10:23, Simon Rowe wrote:
> On 23/11/2019 21:15, Yann E. MORIN wrote:
> 
>> That can't work as-is, because this would break with BR2_SHARED_LIBS=y,
>> in which case only shared libraries are available.
> 
> Thanks for pointing this out.

 Well, actually, we really should keep at least libc.a around even if
BR2_SHARED_LIBS=y, because some packages (with no dependencies, and that don't
use NSS - like tini) may still want to link statically.

 In fact, I think we already keep libc.a around in all possible cases even if
BR2_SHARED_LIBS=y, so I think this patch will work as is...


>> Furthermore, the commit message introducing tini explicitly states "it
>> is not necessary to compile Tini statically for many non-docker
>> container environments". So, what has changed since then?

 Maybe Christian can explain? I vaguely remember that discussion from a year
ago. IIRC, Christian initially did exactly this: link tini statically, always.
But then it turned out not to be needed.


>> Besides, I would expect that the init process of a container would be
>> provided inside the container, not come from the host system. 

 No, the point of tini is exactly to avoid using the init inside the container -
either because it's doing too much (e.g. full systemd) or because it doesn't
exist (container image with just the application).

>> As such,
>> the init system of the container can be dynamically linked with the
>> runtime of the container itself.
> 
> Passing --init to "docker run" takes whatever the executable docker-init in the
> OS filesystem is and uses it as the process for pid 1 in the container. If the
> OS is buildroot and the container uses glibc that doesn't work.
> 
>> In any case, this patch is incorrect in the shared-only setup, so I
>> marked it as rejected for now. If you can provide a beter way to do what
>> you need, then we can revisit it later with a different implementation
>> (and more explanations on how this is used in the wild).
> 
> I can add the static linking as an option. I would have done so but it was
> suggested here
> 
> http://lists.busybox.net/pipermail/buildroot/2017-October/204974.html
> 
> that an init should always be statically linked.
> 
> In summary I can make this optional and mutually exclusive with BR2_SHARED_LIBS,
> would that be acceptable?

 Could you check with BR2_SHARED_LIBS=y and the current patch if it's possible
to build tini for all cases? I.e., external toolchain, internal with musl,
glibc, uClibc. If not, then you can make it conditional on !shared like this:

	$(if $(BR2_SHARED_LIBS),,-static)

 And of course, we still need an explanation why it is needed after all while
before we thought it wasn't.

 Regards,
 Arnout
