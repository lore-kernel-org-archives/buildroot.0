From: Simon Rowe <simon.rowe@eu.citrix.com>
Date: Mon, 25 Nov 2019 09:23:09 +0000
Subject: [Buildroot] [PATCH 1/1] package/tini: compile executable static
In-Reply-To: <20191123211555.GZ32494@scaer>
References: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
 <20191123211555.GZ32494@scaer>
Message-ID: <f361f14c-3a77-d769-1b5c-9a1a5fd8f3b3@eu.citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/11/2019 21:15, Yann E. MORIN wrote:

> That can't work as-is, because this would break with BR2_SHARED_LIBS=y,
> in which case only shared libraries are available.

Thanks for pointing this out.

> Furthermore, the commit message introducing tini explicitly states "it
> is not necessary to compile Tini statically for many non-docker
> container environments". So, what has changed since then?
> 
> Besides, I would expect that the init process of a container would be
> provided inside the container, not come from the host system. As such,
> the init system of the container can be dynamically linked with the
> runtime of the container itself.

Passing --init to "docker run" takes whatever the executable docker-init 
in the OS filesystem is and uses it as the process for pid 1 in the 
container. If the OS is buildroot and the container uses glibc that 
doesn't work.

> In any case, this patch is incorrect in the shared-only setup, so I
> marked it as rejected for now. If you can provide a beter way to do what
> you need, then we can revisit it later with a different implementation
> (and more explanations on how this is used in the wild).

I can add the static linking as an option. I would have done so but it 
was suggested here

http://lists.busybox.net/pipermail/buildroot/2017-October/204974.html

that an init should always be statically linked.

In summary I can make this optional and mutually exclusive with 
BR2_SHARED_LIBS, would that be acceptable?

Simon
