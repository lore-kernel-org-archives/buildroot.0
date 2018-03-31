From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 20:53:17 +0200
Subject: [Buildroot] [PATCH 12/15 v4] fs: use a common tarball as base
 for the other filesystems
In-Reply-To: <8b15f15c58976dd080a4daf6969828bcf8291f8c.1522487149.git.yann.morin.1998@free.fr>
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <8b15f15c58976dd080a4daf6969828bcf8291f8c.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <13105184-bdbc-bb8c-5301-dd0748a17901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-03-18 11:05, Yann E. MORIN wrote:
> Currently, some filesystems may want to tweak the content of the target
> directory, create special device nodes etc... This all means that:
> 
>   - the content of the target directory for a specific filesystems may
>     depend on whether another filesystem is enabled or not; for example,
>     cpio will create a /init script or symlink and a /dev/console node;
> 
>   - the filesysems can not be built in parallel, because they may change
>     the content of the target directory wil another is being assembled.
> 
> Furthermore, the same fakeroot script is executed over-and-over-again
> for each filesystem, to create the device nodes, the users and their
> homes and files, and setting permissions...
> 
> We introduce an intermediate tarball, for which we do the full fakeroot
> shebang.
> 
> That tarball then serves as the base for the other filesystems, with a
> very simple fakeroot script that untars the common tarball, and calls
> the actual filesystem image generator on that.
> 
> Note that we use a very simple tar command to generate the intermediate
> tarball, because we are not concerned with reproducibility of the
> archive itself (only of the archived files).

 Could be good to mention explicitly in the commit log that now the
THIS_IS_NOT_YOUR_ROOT_FILESYSTEM is "removed" by excluding it from the tarball.

 Otherwise LGTM.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
