From: Christian Stewart <christian@paral.in>
Date: Sun, 07 Apr 2019 19:00:20 -0700
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <20190407214941.GA3117@jaya>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
Message-ID: <87pnpxfe8b.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anisse, Cam, all,

Overriding CGO_ENABLED when we know that the toolchain doesn't work
properly with cgo doesn't seem correct.

Anisse Astier <anisse@astier.eu> writes:
>> Some build targets may not build with CGO_ENABLED=1, so allowing a per
>> package and build target override will allow those targets to be built
>> with Buildroot.

Why not just add the override in the existing build flag overrides?

> Just like Thomas, I'm wondering what specific use-case you have in mind;
> in particular, I'm interested why you needed build-target granularity in
> addition to package-level configuration.

If you really need to do something this custom, I recommend just
overriding the build stage entirely.

> Disabling CGO isn't an issue, until you try doing DNS requests, which
> are usually handled by your libc. If you have anything configured out of
> the ordinary /etc/resolv.conf, a cgo-disabled binary won't be able to do
> a DNS request. Same goes for user/group and user home dir resolution:
> anything outside of /etc/{passwd,group} (pam, NSS, etc.), won't work.

Are you referring to the case where a Go-implemented DNS is used? This
should be the case with cgo disabled, and I don't know if the behavior
differs from the regular libc dns.

> I don't know in which context it might be useful in buildroot.

I don't see a reason for it either.

Best,
Christian
