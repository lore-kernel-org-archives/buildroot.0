From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 17:18:09 +0200
Subject: [Buildroot] Absolute build paths in rootfs tarball
In-Reply-To: <CAJCNcEZNAu0pU3pCAhpcKv-a9VqZHG7wg3W+Ko089nVGZhuWjQ@mail.gmail.com>
References: <CAJCNcEZNAu0pU3pCAhpcKv-a9VqZHG7wg3W+Ko089nVGZhuWjQ@mail.gmail.com>
Message-ID: <20151020171809.28af37d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gorka,

On Tue, 20 Oct 2015 15:30:19 +0200, Gorka Lertxundi wrote:

> I'm experiencing a weird issue, probably because a) i'm new to busybox & b)

I guess you're talking about "Buildroot", not "Busybox".

> i'm doing it wrong. But here it is:
> 
> - Using buildroot 2015.08.1.
> - I created an external toolchain using crosstool-ng.
> - Building it in Travis CI.
> - For now, testing my first full-packaged buildroot-based image with mono.
> 
> Everything builds up correctly except for one thing, it seems like when
> buildroot wants to use the full path it uses the host-based absolute path
> (builder path), and not the rootfs-based one.
> 
> Probably using this use-case it's much easier to explain:
> 
> - Travis CI builds everything in /home/travis
> - After everything is built, rootfs.tar contains a mono configuration file
> in /etc/mono/config which has references to custom native dll libraries.
> - I expect this file would contain relative paths (but that's another
> thing) but some of them use an absolute path like this:
>   - <dllmap dll="MonoPosixHelper"
> target="/home/travis/buildroot/output/host/usr/lib/libMonoPosixHelper.so"
> os="!windows" />
> 
> Do you known how could I avoid this behaviour, and use rootfs-based
> relative paths?

The "mono" packaging is relatively new, and does not have a lot of
users, so I am not too surprised that there are some remaining issues.

What you are seeing is a classical problem of cross-compilation:
leakage of paths/informations from the build environment into the
generated target code/files.

You need to look into how Mono generates this file to see what is the
appropriate solution to get proper paths. Of course, a brute force
solution is to change mono.mk to simply fixup those files at the end of
the Mono installation. But maybe there's a better solution than that,
and the only way to know is to look in more details at the Mono build
system.

I'm Cc'ing Angelo, who did the initial Mono packaging and several
updates to it. Maybe he will have some ideas.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
