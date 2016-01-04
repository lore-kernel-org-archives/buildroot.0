From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jan 2016 18:47:16 +0100
Subject: [Buildroot] [PATCH] fakeroot: fix build when libcap-dev is
 installed
In-Reply-To: <1451908883-4942-1-git-send-email-luca@lucaceresoli.net>
References: <1451908883-4942-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <568AB024.40104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Luca,

On 04-01-16 13:01, Luca Ceresoli wrote:
> On an Ubuntu host, and probably several other build hosts,
> host-fakeroot fails building when libcap-dev is installed.
> 
> Error message:
> 
>   libfakeroot.c:1646:9: error: conflicting types for 'setxattr'
>    ssize_t setxattr(const char *path, const char *name, void *value, size_t size, int flags)
>            ^
>   In file included from /usr/include/sys/capability.h:30:0,
>                    from libfakeroot.c:131:
>   /usr/include/x86_64-linux-gnu/sys/xattr.h:39:12: note: previous declaration of 'setxattr' was here
>    extern int setxattr (const char *__path, const char *__name,
>               ^
> 
> To reproduce the bug:
> 
>   make defconfig && make host-fakeroot
> 
> This is a fakeroot bug fixed in Debian since 1.20.1-1 [0]. Apply the
> patch [1] to Buildroot as well.

 Are we sure this will not break again on other distros or older Debian/Ubuntu?


> 
> Buildroot bug reported by aborniak [2] on Ubuntu 15.04 x86_64.
> Verified on Ubuntu 14.04 x86_64.
> 
> [0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=758406
> [1] https://sources.debian.net/patches/patch/fakeroot/1.20.2-1/glibc-xattr-types/
> [2] https://bugs.busybox.net/show_bug.cgi?id=8541
> 
> Reported-by: aborniak <aborniak@gmail.com>
> Cc: aborniak <aborniak@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  .../fakeroot/0001-Fix-xattr-type-mismatch.patch    | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 package/fakeroot/0001-Fix-xattr-type-mismatch.patch
> 
> diff --git a/package/fakeroot/0001-Fix-xattr-type-mismatch.patch b/package/fakeroot/0001-Fix-xattr-type-mismatch.patch
> new file mode 100644
> index 0000000..01962e2
> --- /dev/null
> +++ b/package/fakeroot/0001-Fix-xattr-type-mismatch.patch
> @@ -0,0 +1,108 @@
> +Fix the type of xattr functions to match the glibc headers.

 You should refer to the upstream patch here as well. Ideally also
mention the author but that is hard to find.

 But AFAICS it is identical to upstream, so why not

FAKEROOT_PATCHES = \
	http://sources.debian.net/data/main/f/fakeroot/1.20.2-1/debian/patches/glibc-xattr-types

?

(I'm not 100% sure, but I believe that sources.debian.net should be as stable as snapshot.debian.org).


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
