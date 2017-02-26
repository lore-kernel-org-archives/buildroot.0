From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:54:01 +0100
Subject: [Buildroot] [PATCH/next v2] linux: preserve VCS info when using
 OVERRIDE_SRCDIR
In-Reply-To: <20170224230610.23747-1-arnout@mind.be>
References: <20170224230610.23747-1-arnout@mind.be>
Message-ID: <20170226215401.3426a670@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 00:06:10 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The Linux build system will try to include VCS information into the
> kernel version. This is very convenient when developing to be sure
> you're looking at the right kernel.
> 
> However, since Buildroot rsyncs everything to the build directory,
> but leaves the .git directory behind, this version information is
> lost.
> 
> Fortunately, the kernel's setlocalversion script supports this kind
> of situation: it can save the VCS info in a file ".scmversion" and
> use that during the build. Calling the script with --save-scmversion
> will create .scmversion.
> 
> The --save-scmversion option exists since v2.6.35. On older kernels,
> we just ignore the error. It can be assumed that people using older
> kernel don't do a lot of development anymore :-)
> 
> We can just unconditionally run this in a POST_RSYNC_HOOK - it will
> only get executed when LINUX_OVERRIDE_SRCDIR is used.
> 
> Note that in kernels before v3.14, the Buildroot git commit would be
> used, which is even more confusing.
> 
> Note that if we ever support out-of-tree builds for the kernel, this
> patch will no longer be needed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I am not super enthusiastic about this change, for the simple reason
that it solves the problem only for the linux package.

I believe what is really needed instead is to support out of tree build
for packages that use OVERRIDE_SRCDIR/SITE_METHOD=local. That will
solve this problem for all packages, and bring many other benefits.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
