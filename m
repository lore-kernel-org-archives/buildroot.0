From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:36:53 +0100
Subject: [Buildroot] [PATCH v5 15/19] infra-libtool: relink binaries on
	install
In-Reply-To: <1482241596-31688-16-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-16-git-send-email-jezz@sysmic.org>
Message-ID: <06bf0ca2-5fb0-17da-f5c4-a5dab98107e7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> Until now, libtool was not configured for cross-compilation. It did works,
                                                                      work
> because Buildroot patched $libdir in .la files to include directories from
> sysroot. However, this was done after package installation. Thus, a package was
> not able to use its own (not yet patched) .la files. Because of that, libtool
> was not able to relink binaries during installation. So, Buildroot disabled
> relink on installation. Consequently, binaries that depends on internal
                                                      depend
> libraries contains their build path in their RPATH:
            contain
> 
>   $ readelf -d target/bin/mount | grep RPATH
>   0x0000000f (RPATH)  Library rpath: [/home/buildbot/output/build/util-linux-2.27.1/.libs]
> 
> This particularity was incompatible with creation of reproducible binaries.

 Note that Wolfgang's RPATH mangling patches will also fix this. But of course,
not having the problem to begin with is better :-)

> 
> However, with previous changes, libtool is now correctly configured and
> binaries can be relinked on install. So we can re-enable this feature.
> 
> Note Yocto have a patch that remove extra paths during compilation and make
> relink unnecessary:
>    http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fixinstall.patch
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)


 Regards,
 Arnout

> ---
>  support/libtool/buildroot-libtool-v1.5.patch   | 9 ---------
>  support/libtool/buildroot-libtool-v2.2.patch   | 9 ---------
>  support/libtool/buildroot-libtool-v2.4.4.patch | 9 ---------
>  support/libtool/buildroot-libtool-v2.4.patch   | 9 ---------
>  4 files changed, 36 deletions(-)
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
