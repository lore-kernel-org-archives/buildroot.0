From: Anisse Astier <anisse@astier.eu>
Date: Sun, 7 Apr 2019 23:49:41 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <20180727024720.13370-1-camh@xdna.net>
References: <20180727024720.13370-1-camh@xdna.net>
Message-ID: <20190407214941.GA3117@jaya>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cam,

Sorry for the delay,

(+Angelo in cc)

On Fri, Jul 27, 2018 at 12:47:20PM +1000, Cam Hutchison wrote:
> Allow the CGO_ENABLED variable to be controlled per package and per
> build target, instead of having the value determined by whether or not
> the toolchain has threads.
> 
> Some build targets may not build with CGO_ENABLED=1, so allowing a per
> package and build target override will allow those targets to be built
> with Buildroot.

Just like Thomas, I'm wondering what specific use-case you have in mind;
in particular, I'm interested why you needed build-target granularity in
addition to package-level configuration.

To provide context: 

Disabling CGO isn't an issue, until you try doing DNS requests, which
are usually handled by your libc. If you have anything configured out of
the ordinary /etc/resolv.conf, a cgo-disabled binary won't be able to do
a DNS request. Same goes for user/group and user home dir resolution:
anything outside of /etc/{passwd,group} (pam, NSS, etc.), won't work.

Disabling CGO allows you to have static binaries; if you don't use any
native libraries.

I don't know in which context it might be useful in buildroot.

Regards,

Anisse
