From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 16:34:53 +0200
Subject: [Buildroot] [PATCH] package/samba4: set WAF_NO_PREFORK to fix
 cross-compilation
In-Reply-To: <20190813214348.10675-1-joerg.krause@embedded.rocks>
References: <20190813214348.10675-1-joerg.krause@embedded.rocks>
Message-ID: <20190815163453.3f7dcd27@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Aug 2019 23:43:48 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Since version 4.10.0 the waf build system does not correctly take the values
> from the cross answers file when configuring for the target machine,
> resulting in wrong values, e.g.:
> 
> ```
> Checking for rpath library support       : not found
> ```
> 
> Looking into sambas config.log shows that the check for rpath library
> support aborts because of in internal exception.
> 
> The result is that the shared library libsmbclient.so does not have a
> correct rpath section in its ELF header:
> 
> ```
> Library rpath: [/usr/lib]
> ```
> 
> This is incorrect, as libsmbclient links to secondary libraries located
> in /usr/lib/samba.
> 
> When linking mpd (with libsmbclient feature enabled) against
> libsmbclient, the linker does not find the secondary libraries for
> libsmbclient and fails with:
> 
> ```
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/7.4.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: warning: libcli-ldap-common-samba4.so, needed by /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/usr/bin/../powerpc64le-buildroot-linux-gnu/sysroot/usr/lib/libsmbclient.so, not found (try using -rpath or -rpath-link)
> [skip]
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/7.4.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/usr/bin/../powerpc64le-buildroot-linux-gnu/sysroot/usr/lib/libsamdb.so.0: undefined reference to `sec_privilege_id'
> [skip]
> ```
> 
> The bug has been reported upstream [1]. Setting `WAF_NO_PREFORK=1` fixes
> the internal exception by disabling the usage of pre-forked processes
> which somehow fails in cross-compiling environment.
> 
> Now, the configuration takes the correct values from the cross answers file:
> 
> ```
> Checking for rpath library support       : yes
> ```
> 
> And leads to a correct rpath entry in the ELF header:
> 
> ```
> Library rpath: [/usr/lib/samba:/usr/lib]
> ```
> 
> And fixes the build of with libsmbclient feature enabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1678a6c5e5c9ee44b7a90d059d95c5d385d75132/
> http://autobuild.buildroot.net/results/ba11b09c0d99b005c71ddd4db7fa4caa5e68af9c/
> 
> [1] https://bugzilla.samba.org/show_bug.cgi?id=13846
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/samba4/samba4.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
