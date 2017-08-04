From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 22:04:42 +0200
Subject: [Buildroot] [PATCH] dbus: add upstream patch to fix startup
 hang with with expat >= 2.2.1
In-Reply-To: <20170804165832.6869-1-m.hoffmann@cartelsol.com>
References: <20170804165832.6869-1-m.hoffmann@cartelsol.com>
Message-ID: <0d9f81be-af14-8960-cbaa-19714382fc71@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Marcus,

On 04-08-17 18:58, Marcus Hoffmann wrote:
> After c0ad6ded018ffbc33f7f5 expat: security bump to version 2.2.1
> the system can hang on startup under certain circumstances.
> 
> This happens when:
>   * we use systemd as init system
>   * the random nonblocking pool takes a while to initialize
>     * this apparently doesn't happen on qemu, so this would not have
>       been caught by the runtime testing infrastructure
>     * it also doesn't seem to happen when network booting
> 
> For a more detailed description of the bug see here:
> https://bugs.freedesktop.org/show_bug.cgi?id=101858
> 
> The patch should be in next dbus version 1.10.24
> 
> Set DBUS_AUTORECONF = YES because configure.ac is changed.
> 
> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
> ---
> I think this should also go into the stable 2017.02.x and 2017.05.x branches as
> they received the expat bump but won't be receiving the fix in the next dbus 
> version.

 Yes indeed! Better put Peter in Cc to make sure he sees this.

[snip]
> +Subject: [PATCH 1/2] config-loader-expat: Tell Expat not to defend against

 Generate patches with 'git format-patch -N' so the 1/2 isn't there.

> + hash collisions
> +
> +By default, Expat uses cryptographic-quality random numbers as a salt for
> +its hash algorithm, and since 2.2.1 it gets them from the getrandom
> +syscall on Linux. That syscall refuses to return any entropy until the
> +kernel's CSPRNG (random pool) has been initialized. Unfortunately, this
> +can take as long as 40 seconds on embedded devices with few entropy
> +sources, which is too long: if the system dbus-daemon blocks for that
> +length of time, important D-Bus clients like systemd and systemd-logind
> +time out and fail to connect to it.
> +
> +We're parsing small configuration files here, and we trust them
> +completely, so we don't need to defend against hash collisions: nobody
> +is going to be crafting them to cause pathological performance.
> +
> +Bug: https://bugs.freedesktop.org/show_bug.cgi?id=101858
> +Signed-off-by: Simon McVittie <smcv@debian.org>
> +Tested-by: Christopher Hewitt <hewitt@ieee.org>
> +Reviewed-by: Philip Withnall <withnall@endlessm.com>

 Add your own Signed-off-by (because you're in the delivery path of this patch),
and also the upstream commit ID. It happens to be the same one as the From line,
but often people change the commit locally (e.g. to add Signed-off-by) so it's
clearer and unambiguous if specified explicitly. Something like:

Upstream commit 1252dc1d1f465b8ab6b36ff7252e395e66a040cf
Signed-off-by: Marcus ...

 (Note that the latter rule isn't followed by many people, but I like to improve
things :-).

 I've applied to master with those minor changes.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
