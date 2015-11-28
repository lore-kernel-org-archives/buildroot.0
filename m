From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:38:41 +0100
Subject: [Buildroot] [PATCH 6/7 v3] autobuild: add a function to check
 if the configuration is fixable
In-Reply-To: <6e28b34908740816d7f4fe96631ab3f94d023370.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <6e28b34908740816d7f4fe96631ab3f94d023370.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128153841.54872516@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:13 +0100, Yann E. MORIN wrote:
> Currently, the fixup_config() function is responsible for two things:
>   - checking whether the configuration can be fixed,
>   - actually fixing it.
> 
> When we have an initial basic configuration, we currently loop
> over-and-over again until the configuration is actually fixed (limted to
> 100 iterations).
> 
> However, there are cases where the configuration can *not* be fixed,
> because it contains options incompatible with the host system [0], and
> wich are not randomised (i.e. looping will never fix the configuration).
> 
> Introduce a new function, is_config_fixable() which is responsible for
> checking that the initial configuration does not contain any option that
> is incompatible with the host system.
> 
> That function currently does nothing ands always consider the
> configuration to be fixable; actual tests will be added in followup
> commits.
> 
> [0] like the latest Linaro ARM toolchains which requires a glibc >= 2.14.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I've applied, but after doing some fairly significant changes, both to
the code and to the commit log. I didn't like the name
"is_config_fixable", because really it's not about the configuration
being "fixable" or anything like that. It is just about the toolchain
being usable or not. So "is_toolchain_usable" was IMO a much better
choice here.

Also, showing an error in the logs is not appropriate: it is an
expected situation to sometimes have a toolchain that cannot be used.
Frightening the user with an error in this case is not appropriate.

See the final commit at
http://git.buildroot.net/buildroot-test/commit/?id=f762f3630c270bbde27fec0585bb597b472b53f1.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
