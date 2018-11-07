From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 7 Nov 2018 09:40:55 -0800
Subject: [Buildroot] Altering a package to pull from GIT
In-Reply-To: <56d800fc-d0a5-1517-4e13-8d3b411245a8@nextdimension.cc>
References: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
 <56d800fc-d0a5-1517-4e13-8d3b411245a8@nextdimension.cc>
Message-ID: <CAJ+vNU011AkYJSgP+fP9fyx8m8uMWUZMnYn0AmcZ0W+aABfkYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 7, 2018 at 8:38 AM Brad Love <brad@nextdimension.cc> wrote:
>
> Hi Tim,
>
>
> On 07/11/2018 10.17, Tim Harvey wrote:
>
> Greetings,
>
> I'm trying to alter the openocd package to pull code from a specific git sha. Looking over the manual and searching a bit it seems like the following is the thing to do:
>
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 548d8b8..76594fe 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>
> -OPENOCD_VERSION = 0.10.0
> +OPENOCD_VERSION = da4b2d5beb
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
> -OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
> +OPENOCD_SITE = git://git.code.sf.net/p/openocd/code
> +OPENCOD_SITE_METHOD = git
>
>
> Note your spelling error:
>
> OPENCOD_SITE_METHOD
>

Brad,

I'm glad I posted the diff or we would have never caught that! However
it still fails in the same way. I'm pretty sure SITE_METHOD is
inferred by the SITE starting with git:// so it probably isn't an
issue (but nice catch!)

>>> openocd da4b2d5beb Downloading
Initialized empty Git repository in
/usr/src/ventana/buildroot/dl/openocd/git/.git/
Fetching all references
remote: Enumerating objects: 59134, done.
remote: Counting objects: 100% (59134/59134), done.
remote: Compressing objects: 100% (23277/23277), done.
remote: Total 59134 (delta 48544), reused 43321 (delta 35697)
Receiving objects: 100% (59134/59134), 13.43 MiB | 3.93 MiB/s, done.
Resolving deltas: 100% (48544/48544), done.
From git://git.code.sf.net/p/openocd/code
 * [new branch]      master     -> origin/master
 * [new branch]      v0.6.1     -> origin/v0.6.1
 * [new tag]         v0.6.1     -> v0.6.1
 * [new tag]         v0.1.0     -> v0.1.0
 * [new tag]         v0.10.0    -> v0.10.0
 * [new tag]         v0.10.0-rc1 -> v0.10.0-rc1
 * [new tag]         v0.10.0-rc2 -> v0.10.0-rc2
 * [new tag]         v0.2.0     -> v0.2.0
 * [new tag]         v0.3.0     -> v0.3.0
 * [new tag]         v0.3.0-rc0 -> v0.3.0-rc0
 * [new tag]         v0.4.0     -> v0.4.0
 * [new tag]         v0.4.0-rc1 -> v0.4.0-rc1
 * [new tag]         v0.4.0-rc2 -> v0.4.0-rc2
 * [new tag]         v0.5.0     -> v0.5.0
 * [new tag]         v0.5.0-rc1 -> v0.5.0-rc1
 * [new tag]         v0.5.0-rc2 -> v0.5.0-rc2
 * [new tag]         v0.6.0     -> v0.6.0
 * [new tag]         v0.6.0-rc1 -> v0.6.0-rc1
 * [new tag]         v0.6.0-rc2 -> v0.6.0-rc2
 * [new tag]         v0.7.0     -> v0.7.0
 * [new tag]         v0.7.0-rc1 -> v0.7.0-rc1
 * [new tag]         v0.7.0-rc2 -> v0.7.0-rc2
 * [new tag]         v0.8.0     -> v0.8.0
 * [new tag]         v0.8.0-rc1 -> v0.8.0-rc1
 * [new tag]         v0.8.0-rc2 -> v0.8.0-rc2
 * [new tag]         v0.9.0     -> v0.9.0
 * [new tag]         v0.9.0-rc1 -> v0.9.0-rc1
remote: Enumerating objects: 17, done.
remote: Counting objects: 100% (17/17), done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 12 (delta 8), reused 6 (delta 2)
Unpacking objects: 100% (12/12), done.
From git://git.code.sf.net/p/openocd/code
 * [new tag]         v0.3.1     -> v0.3.1
Could not fetch special ref 'da4b2d5beb'; assuming it is not special.
WARNING: no hash file for openocd-da4b2d5beb.tar.bz2
>>> openocd da4b2d5beb Extracting
bzcat /usr/src/ventana/buildroot/dl/openocd/openocd-da4b2d5beb.tar.bz2
| tar --strip-components=1 -C
/usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb   -xf -
bzcat: /usr/src/ventana/buildroot/dl/openocd/openocd-da4b2d5beb.tar.bz2
is not a bzip2 file.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
package/pkg-generic.mk:160: recipe for target
'/usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb/.stamp_extracted'
failed
make[1]: *** [/usr/src/ventana/buildroot/output/build/openocd-da4b2d5beb/.stamp_extracted]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Tim
