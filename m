From: Fame Castle <famecastle@gmail.com>
Date: Wed, 11 Jul 2018 17:37:18 +0200
Subject: [Buildroot] Guide for installing Chromium using patch sets
In-Reply-To: <CAMWSM7iJjfVUY_Yw13u+gg73eShK5pwh5+1yawWRV+Z-qAhGTw@mail.gmail.com>
References: <CAD0+TpAc6473JO3H24CLwxUwc0WXZ5n8es1xJctnyhUEESrwWg@mail.gmail.com>
 <CAMWSM7iJjfVUY_Yw13u+gg73eShK5pwh5+1yawWRV+Z-qAhGTw@mail.gmail.com>
Message-ID: <CAD0+TpAfAu0XKeEzwhACV8j0D-27fodEhFjgg9JcgePs-7Nxgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

I checked out your chromium-v6 branch from your repo and applied my
buildroot configurations to it. It compiled fine without chromium being
selected. But when I selected chromium (indeed, it was the use_sysroot
problem that previously made my builds fail, which is now fixed in your
repo), I encountered a new problem:

> >>> chromium 67.0.3396.79 Configuring
> ...
> [412/412] LINK gn
> ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
non-zero exit code.
>     pkgresult = exec_script(pkg_config_script, args, "value")
>                  ^----------
> Current dir:
/home/buildroot/output/build/chromium-67.0.3396.79/out/Release/
> Command: /home/buildroot/output/host/bin/python2 --
/home/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py
nss -v -lssl3
> Returned 1.
> stderr:
>
> Package nss was not found in the pkg-config search path.
> Perhaps you should add the directory containing `nss.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'nss' found
> Could not run pkg-config.
>
> See //third_party/nss/BUILD.gn:15:3: whence it was called.
>   pkg_config("system_nss_no_ssl_config") {
>   ^---------------------------------------
> See //crypto/BUILD.gn:221:25: which caused the file to be included.
>     public_configs += [ "//third_party/nss:system_nss_no_ssl_config" ]
>                         ^-------------------------------------------

The compilation breaks at the same point as it previously did. But now the
problem with cups-config is fixed and this error appeared.

Thanks in advance,
Famecastle

2018-07-10 19:34 GMT+02:00 Joseph Kogut <joseph.kogut@gmail.com>:

> Hi Fame,
>
> On Tue, Jul 10, 2018 at 4:05 AM Fame Castle <famecastle@gmail.com> wrote:
> >
> > I am trying to install chromium to my buildroot target using Joseph
> Kogut's patch sets at https://patchwork.ozlabs.org/
> project/buildroot/list/?series=51418. I already had to figure out that I
> had to apply the patches from bottom to top. But then, I was able to patch
> all the files successfully using `curl "{path to the individual patch's
> mbox}" | git apply --whitespace=fix` .
> >
> > I did a clean make and came across the following problem reported during
> chromium configuration:
> >
> > > /home/buildroot/output/build/chromium-67.0.3396.79/
> printing/cups_config_helper.py
> > > --api-version
> > > Returned 1.
> > > stderr:
> > >
> > > Traceback (most recent call last):
> > >   File
> > > "/home/buildroot/output/build/chromium-67.0.3396.79/
> printing/cups_config_helper.py",
> > > line 106, in <module>
> > >     sys.exit(main())
> > >   File
> > > "/home/buildroot/output/build/chromium-67.0.3396.79/
> printing/cups_config_helper.py",
> > > line 76, in main
> > >     subprocess.call([cups_config, '--api-version'])
> > >   File
> > > "/home/buildroot/output/host/lib/python2.7/subprocess.py",
> > > line 168, in call
> > >     return Popen(*popenargs, **kwargs).wait()
> > >   File
> > > "/home/buildroot/output/host/lib/python2.7/subprocess.py",
> > > line 390, in __init__
> > >     errread, errwrite)
> > >   File
> > > "/home/buildroot/output/host/lib/python2.7/subprocess.py",
> > > line 1025, in _execute_child
> > >     raise child_exception
> > > OSError: [Errno 2] No such file or directory
> > >
> > > See //BUILD.gn:141:7: which caused the file to be included.
> > >       "//printing:printing_unittests",
> > >       ^------------------------------
> > > package/pkg-generic.mk:213: recipe for target
> >
> > It seems that cups_config_helper.py can't find a cups-config binary. You
> replied to a similar problem here "http://lists.busybox.net/
> pipermail/buildroot/2018-June/223810.html"
>
> It seems the sysroot wasn't enabled, causing the build to fail when
> the requirements, such as cups, weren't installed on the host. I'm
> working on a patch right now to fix this. In the mean time, changing
> "use_sysroot=false" to "use_sysroot=true" in the package makefile
> should fix this.
>
> > in which you speak of a v4 patch set, where this problem should be
> fixed. But the latest patch set is v5.
>
> This patchset is an RFC, and needs more testing with various
> configurations. Chromium is a very large codebase, with a lot of
> dependencies and configuration options, and there's certainly going to
> be a lot of ways to break the build until the package gets more
> testing and improvements. Feedback from people like you is what this
> package needs.
>
> > I am confused and don't understand which patches I have to apply to make
> the build work. Furthermore, the patch series at
> https://patchwork.ozlabs.org/project/buildroot/list/?series=51418 only
> contains patch 3/6 to 6/6 . What about the missing 2 patches?
>
> The other patches were merged upstream, and are no longer need to be
> applied, assuming you're working off the master branch. The next
> version of the patchset will exclude them.
>
> > I am using the latest buildroot cloned from the git repository's master
> branch. I think that I will start a new clean project with the latest
> stable buildroot version. A complete guide of how to compile chromium for
> buildroot, including all neccessary patches, would be very helpful.
>
> You can apply the patches from patchwork by following the instructions
> in the Buildroot manual, section 21.3.1:
> http://nightly.buildroot.org/#apply-patches-patchwork
>
> Alternatively, once the next patchset is finished, you can checkout
> the chromium-v6 branch from my repo at
> https://github.com/jakogut/buildroot and build as usual.
>
> Best,
> Joseph
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180711/cace5a7f/attachment.html>
