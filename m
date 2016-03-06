From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 16:00:28 +0100
Subject: [Buildroot] [PATCH v2] package/czmq: fix static linking
In-Reply-To: <1457275803-20224-1-git-send-email-joerg.krause@embedded.rocks>
References: <1457275803-20224-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160306160028.64457dc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun,  6 Mar 2016 15:50:03 +0100, J?rg Krause wrote:
> Currently, building czmq statically fails for some architectures with undefined
> references to the math library:
>   /usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libstdc++.a(compatibility-ldbl.o): In function `std::tr1::hash<long double>::operator()(long double) const':
>   compatibility-ldbl.cc:(.text._ZNKSt3tr14hashIeEclEe+0x3c): undefined reference to `frexpl'
> 
> It turns out that this is actually a problem with libstdc++. Depending on the
> arch, some functions will be in compatibility-ldbl.o. If you use any of these
> functions, that file will be linked in. And when that file is linked in, all
> the _other_ functions, which you actually don't use, are also linked in. And
> one of these functions is the template function hash<long double>::operator(),
> which uses frexpl.
> 
> Requiring czmq to link with -lm is a bit weird, given that neither itself,
> nor any of its dependencies really need it...
> 
> So ideally it should be fixed in libstdc++ itself. However, as upstream
> accepted a patch to link with -lm, we use this patch to fix static linking.
> 
> Fixes:
> http://autobuild.buildroot.net/results/206/2061238affb685db998100a56c6571538d089a5b/
> http://autobuild.buildroot.net/results/caf/caf002d213c9dd09df07858c5c199411ca8ddfa3/
> http://autobuild.buildroot.net/results/568/568ac92d2f6d0604b9bf354ea9dca0a7cb5341f6/
> http://autobuild.buildroot.net/results/945/9452982fc14f579c61b45a1a189db5f89aab3b80/
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
