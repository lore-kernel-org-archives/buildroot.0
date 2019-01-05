From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jan 2019 17:39:17 +0100
Subject: [Buildroot] [PATCH v3] core/pkg-generic: only save latest
 package list
In-Reply-To: <67b19a43-dad2-9d1a-469f-f3d979f5bf47@green-communications.fr>
References: <20180501132629.4a4831bb.john@metanate.com>
 <20180501122841.13818-1-john@metanate.com>
 <20190104131250.GA19623@scaer>
 <25b04dd9-68de-9f1e-c830-fa6e86cb6d68@green-communications.fr>
 <20190104175150.GD19623@scaer>
 <67b19a43-dad2-9d1a-469f-f3d979f5bf47@green-communications.fr>
Message-ID: <20190105163917.GF19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2019-01-05 11:23 +0100, Nicolas Cavallari spake thusly:
> make qemu_x86_defconfig
> make
> make ifupdown-scripts-reinstall
> grep "ifupdown-scripts" output/build/packages-file-list.txt
> 
> =>
> ifupdown-scripts,./bin/busybox
[--SNIP--]
> ifupdown-scripts,./lib/libuClibc-1.0.31.so
> ifupdown-scripts,./lib/modules/4.16.7/modules.dep.bin
[--SNIP--]
> ifupdown-scripts,./lib32
> 
> Which is almost the whole system.
> 
> Now why is that ? The answer is here:
> 
> find . \( -type f -o -type l \) \
>           -newer $($(PKG)_DIR)/.stamp_built \
>           -exec printf '$(1),%s\n' {} + \
>           >> $(BUILD_DIR)/packages-file-list$(3).txt
> 
> Since .stamp_built has not been modified since the first time the
> package was built, this will list all files that have been installed
> after ifupdown-scripts was built.

OK, so there are in fact two problems in what you described:

  - upon a re-install (not a rebuild), files are improperly reported
    to the just-reinstalled package,

  - the list grows after every re-install (which could have been
    triggered by a re-build, a re-configure or a dirclean).

The first issue is a consequnce of commit 7fb6e7825. Before that, we
would md5sum all files prior to a package installation, then install the
package, and then md5sum all files again (with new files!), and report
lines that were not in the first set, on the assumption that either they
were new files, or modified files. Back then the first issue did not
exist.

But since 7fb6e7825, we have no starting point before the installation,
so we need to find one. The best we found back at that time was to list
all files that were "new" since the package was built.

Of course, we did not envision the reinstall step of an early package.
And sonce noone complained, we did not even notice it. And even if those
files were to grow up to 10-100MiB, that is not really a problem for the
vast majority of people in practice, so the size increase was not even
spottted either.

Which gets us to the size increase, which is not realy a very big
problem most of the time. It just gets exacerbated by the full-list
duplication. And yet again, for most people this is not really a problem
either.

So, I think a middle ground and practical solution, would be that we find
another object whose date can serve as the starting point for the -newer
test. Since we do not have that, we have no choice but to introduce a
new timestamp file, I'm afraid...

Note: in addition to the above, the refereenced patch in this thread
also dealt with check-uniq-files reporting the same package as
installing the same files more than once.

> With a bigger system, the list of files can be much larger. And without
> this patch, the list would grow by maybe the size of the whole system
> each time an early package is reinstalled.

Well, I would highly doubt the list of all files would be "the size of
the whole system" (but I do understand that it could contain almost all
files of a system when re-installign an early package, yes).

> >>> Compared to the rest of the build tree, those three files have very
> >>> small sizes in fact, and if they eventually end up big enough to be a
> >>> substantial part of the build tree, it's most probably time for a clean
> >>> build from scratch anyway, no?
> >>
> >> Having a big list would not a problem if nobody used the content of this
> >> file, but some tools scans it and use it to check files. After many
> >> recompiling, I remember having problems with one tool taking a
> >> considerable amount of time for each build because of all the duplicates
> >> in the list. But i don't remember which tool it was.
> > 
> > Are you talking about a tool in Buildroot? Can you try to provide more
> > details, please? Are you still able to reproduce the slowness on the
> > current git master?
> > 
> > The only two tools that make use of the packages-file-list.txt are
> > check-uniq-files (which actually checks that files are not installed by
> > two or more packages), and support/scripts/size-stats, which graphs a
> > pie-chart representing the size contribution of each package to the
> > content of target/. The former is always run at the end of the build, in
> > the target-finalize step, while the latter is only run on-demand.
> 
> I don't remember which tool it was, but it was probably check-bin-arch.

Arg, indeed I had mnissed that one... Thanks for spotting it! :-)

> It will scan the package file list and call readelf on all files. If the
> package file list has duplicates, then readelf will be called multiple
> times on the same files.  And it is also run at make $pkg-reinstall
> times, which fits my memory of make $pkg-reinstall being slower over time.

I see, indeed.

However, removing from the list all files installed by a package is also
incorrect anyway. Consider this sequence:

  - make
    - package foo installs f1, f2, and f3
    - this is listed in packages-file-list.txt

  - user modifies package foo source because f3 should not be installed
    in this configuration

  - make foo-reinstall
    - all entries of foo are removed from packages-file-list,txt
    - package foo installs f1 and f2

  - f3 is still in target and no longer assigned to a package

So, we have to keep files already installed by all paclages up until
now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
