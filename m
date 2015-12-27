From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 11:44:27 +0100
Subject: [Buildroot] [PATCH] package/gettext: host variant needs
 host-libxml2
In-Reply-To: <1451165734-15534-1-git-send-email-yann.morin.1998@free.fr>
References: <1451165734-15534-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151227114427.554e436b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 26 Dec 2015 22:35:34 +0100, Yann E. MORIN wrote:
> From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> 
> Of host-gettext, we only build the tools. however some of those tools
> have a --color option, which needs libxml2.
> 
> If the libxml2 development files are missing on the host, a bundled
> subset of libxml2 is used, and all seems OK. But if they ar epresent,
> then the host libxml2 is used. On some distros, lbxml2 is linked with
> liblzma. And if we happend to _then_ build our host-liblzma, we may have
> a conflict later when trying to run any of the host-gettext tools.
> 
> Always build host-gettext with our own host-libxml2 which is not linked
> with liblzma.
> 
> Fixes https://bugs.busybox.net/show_bug.cgi?id=7886
> 
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> [nicolas: added extended commit message]
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> [yann.morin.1998 at free.fr: rebase; add comment; enhance commit log]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for reviving this old patch. I do remember it, and I believe
back then I raised the concern that unconditionally building
host-libxml2 as a dependency of host-gettext would add quite a bit of
build time (to a package that already takes an awful lot of time to
build for what it does, but that's another story).

So I did a measurement:

 * If we force the usage of the included libxml2, then the time needed
   to do "make host-gettext" from an empty build is:

	real	1m40.892s
	user	2m38.664s
	sys	0m13.132s

 * If we use your patch, which unconditionally adds the dependency on
   host-libxml2, the time needed to do a "make host-gettext" from an
   empty build is:

	real    2m21.035s
	user    3m51.956s
	sys     0m16.020s

So about a 40 seconds build time difference. I'm not sure what to
decide from that. 40 seconds is not that long, but host-gettext is
already quite long to build...

Thoughts ? Opinions ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
