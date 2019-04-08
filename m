From: Anisse Astier <anisse@astier.eu>
Date: Mon, 8 Apr 2019 13:23:26 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <87pnpxfe8b.fsf@paral.in>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in>
Message-ID: <20190408112326.q6dyignlyeprh7m3@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 07, 2019 at 07:00:20PM -0700, Christian Stewart wrote:
> Hi Anisse, Cam, all,
> 
> Overriding CGO_ENABLED when we know that the toolchain doesn't work
> properly with cgo doesn't seem correct.
> 
> Anisse Astier <anisse@astier.eu> writes:
> >> Some build targets may not build with CGO_ENABLED=1, so allowing a per
> >> package and build target override will allow those targets to be built
> >> with Buildroot.
> 
> Why not just add the override in the existing build flag overrides?
> 
> > Just like Thomas, I'm wondering what specific use-case you have in mind;
> > in particular, I'm interested why you needed build-target granularity in
> > addition to package-level configuration.
> 
> If you really need to do something this custom, I recommend just
> overriding the build stage entirely.
> 
> > Disabling CGO isn't an issue, until you try doing DNS requests, which
> > are usually handled by your libc. If you have anything configured out of
> > the ordinary /etc/resolv.conf, a cgo-disabled binary won't be able to do
> > a DNS request. Same goes for user/group and user home dir resolution:
> > anything outside of /etc/{passwd,group} (pam, NSS, etc.), won't work.
> 
> Are you referring to the case where a Go-implemented DNS is used? This
> should be the case with cgo disabled, and I don't know if the behavior
> differs from the regular libc dns.

Yes, I'm talking about the go-implemented dns resolution when cgo is
disabled.

On a glibc system you might not simply rely on /etc/{hosts,resolv.conf}
since hostname resolution is pluggable and configurable with
nsswitch.conf.

Regards,

Anisse
