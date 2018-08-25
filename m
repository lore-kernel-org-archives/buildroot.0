From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 23:39:58 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
In-Reply-To: <o5u85fxpst.ln2@ID-313208.user.individual.net>
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
 <20180825230514.1f0264dd@windsurf>
 <o5u85fxpst.ln2@ID-313208.user.individual.net>
Message-ID: <20180825233958.29369922@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 23:26:48 +0200, Bernd Kuhls wrote:

> In unpatched next branch the build on arc fails with
> "error atomic ops for this platform are not implemented", no cxxflags nor 
> CONF_OPTS will solve that.
> 
> Only when bumping to 10.3 you get past this build error just to see the 
> "undefined reference to `__sync_fetch_and_add_8'" error later on.
> To solve this the changes in this patch are needed.

So it still needs some atomic intrinsics, so the package should:

	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_4

Indeed, atomic intrinsics are not always available, even when you link
with -latomic: gcc versions before gcc 4.8 did not have libatomic.
Build a SPARC gcc 4.7 toolchain, and try to build this package, you'll
be surprised :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
