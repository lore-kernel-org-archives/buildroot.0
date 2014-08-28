From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Aug 2014 16:14:59 +0200
Subject: [Buildroot] [PATCH V3 0/4] Use only elfutils package to provide
 the libelf library
In-Reply-To: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <20140828161459.6a221319@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, Wojciech,

As the original authors of the kexec-lite and avrdude packages
respectively, would you mind checking if the below patch series, which
removes the libelf package in favour of the libelf bundled with
elfutils does not break avrdude and kexec-lite ?

Thanks!

Thomas

On Thu, 28 Aug 2014 14:21:30 +0200, Gregory CLEMENT wrote:
> Hi,
> 
> The libelf is currently provided by 2 packages libelf and
> elfutils. The first package provides an old version of the libelf
> which is no more compatible with a recent version of ltrace. Having
> both libraries could lead to the link on the wrong one during the
> build. It is what happened for ltrace.
> 
> To avoid this kind of issue, this patch set switch the dependency from
> libelf to elfutils and finally removed the libelf package.
> 
> I built and fully tested ltrace on ARM.
> I built and just ran avrdude on ARM.
> I didn't build kexec-lite.
> 
> Thanks,
> 
> Changelog:
> v1 -> v2:
> - Propagated the dependencies from elfutils for kexec-lite and avrdude
> - Fixed the subject of the avrdude patch
> - Use the -D flag to generate the patch: only the mention of the
>   deleted files is kept. This allows to have a very light patch but
>   one will be able to apply the patch only by using git.
> 
> v2 -> v3:
> - moved the config option of the libelf package to Config.in.legacy
> 
> Gregory CLEMENT (4):
>   ltrace: Removes the libelf dependency
>   avrdude: Depend on elfutils instead of libelf to get the libelf
>     library
>   kexec-lite: Depends on elfutils instead of libelf to get the libelf
>     library
>   libelf: Removes the package
> 
>  Config.in.legacy                                |     9 +
>  package/Config.in                               |     1 -
>  package/avrdude/Config.in                       |     6 +-
>  package/avrdude/avrdude.mk                      |     2 +-
>  package/kexec-lite/Config.in                    |     4 +-
>  package/kexec-lite/kexec-lite.mk                |     2 +-
>  package/libelf/Config.in                        |     7 -
>  package/libelf/libelf-0.8.10-Elf64-fixups.patch | 12361 ----------------------
>  package/libelf/libelf.mk                        |    23 -
>  package/ltrace/Config.in                        |     1 -
>  package/ltrace/ltrace.mk                        |     2 +-
>  11 files changed, 20 insertions(+), 12398 deletions(-)
>  delete mode 100644 package/libelf/Config.in
>  delete mode 100644 package/libelf/libelf-0.8.10-Elf64-fixups.patch
>  delete mode 100644 package/libelf/libelf.mk
> 



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
