From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 11:53:59 +0100
Subject: [Buildroot] [RFC] pkg-python infrastructure
In-Reply-To: <CAHXCMMKLpUw5C5z14tcvmH4VNtXOPgp6dghpVnr6F6Mg7+QA8Q@mail.gmail.com>
References: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
 <20131205000540.5291300a@skate>
 <CAHXCMMKLpUw5C5z14tcvmH4VNtXOPgp6dghpVnr6F6Mg7+QA8Q@mail.gmail.com>
Message-ID: <20131205115359.21cdfc7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 5 Dec 2013 11:47:06 +0100, Samuel Martin wrote:

> > I've limited myself to support Python 2.x for the moment: the idea is
> > that once all Python packages have been converted to the
> > infrastructure, it will be easier to extend it to also cover Python 3.x.
> 
> Nice to see this topic moving! :)

Yes! Ryan motivated me yesterday evening to have a look at this topic,
so I got started!

> I've quickly reviewed the branch:
> * Commit: 5880956ce258b15887049ca5850007395cfd1857 [1,2]
>   docs/manual/adding-packages-python.txt:29-30: s/LIBFOO/PYTHON_FOO/

Thanks, will fix.

> I've given a run:
> * python-bottle: install fails because its setup.py does not support
> '--executable' option
> * python-crc16: install fails because its setup.py does not support
> '--executable' option
> * python-dpkt: install fails because its setup.py does not support
> '--executable' option
> 
> After these, I removed "--executable=/usr/bin/python"
> from PKG_PYTHON_INSTALL_OPT

Yes, I know this problem. Originally, I wasn't passing --executable=
at install time, when I tested all the basic distutils packages. Then I
went on to some more complex setuptools packages, and one of them was
passing --executable at install time, so I added it. But I did not
retest the previous packages (hence the highly RFC state of the patch
set).

> * python-protobuf: install fails because it seems checking if the
> destination belongs to PYTHONPATH because PYTHONPATH is not correctly set:

I knew this package wasn't building, that's where I stopped yesterday
evening, and decided to notify the list anyway... which apparently was
a good idea because I'm now getting some really good and useful
feedback from you!

> <snip>
> running install
> Checking .pth file support in
> /opt/buildroot/output/target/usr/lib/python2.7/site-packages/
> /opt/buildroot/output/host/usr/bin/python -E -c pass
> TEST FAILED: /opt/buildroot/output/target/usr/lib/python2.7/site-packages/
> does NOT support .pth files
> error: bad install directory or PYTHONPATH
> 
> You are attempting to install a package to a directory that is not
> on PYTHONPATH and which Python does not read ".pth" files from.  The
> installation directory you specified (via --install-dir, --prefix, or
> the distutils default setting) was:
> 
>     /opt/buildroot/output/target/usr/lib/python2.7/site-packages/
> 
> and your PYTHONPATH environment variable currently contains:
> 
>     '/opt/buildroot/output/target/usr/lib/python/site-packages'
> 
> Here are some of your options for correcting the problem:
> </snip>
> The problem seems to be that PYTHON_VERSION_MAJOR is defined afterward
> PKG_PYTHON_BUILD_ENV is set...
> I've been able to overcome this issue by including
> package/python/python.mkat the beginning of package/
> pyg-python.mk,
> but I'm not sure how clean this is, and how to properly fix it...

Including package/python/python.mk is indeed ugly. The good solution is
to delay the evaluation of the variable by adding some more $ at the
right place :-)

> So far, I've just tested package builds (no runtim tests yet) and with this
> patch [3], I've successfully built all these Python packages:
> output/build/host-python-2.7.3/
> output/build/host-python-distutilscross-0.1/
> output/build/host-python-setuptools-0.6.36/
> output/build/python-2.7.3/
> output/build/python-bottle-0.11.6/
> output/build/python-crc16-0.1.1/
> output/build/python-dpkt-1.7/
> output/build/python-id3-1.2/
> output/build/python-ipy-IPy-0.75/
> output/build/python-mad-0.6/
> output/build/python-meld3-0.6.8/
> output/build/python-netifaces-0.7/
> output/build/python-nfc-142/
> output/build/python-protobuf-2.4.1/
> output/build/python-pygame-f0bb4a4b365d/
> output/build/python-pyparsing-1.5.6/
> output/build/python-pyro-3.14/
> output/build/python-pyzmq-13.1.0/
> output/build/python-serial-2.6/
> output/build/python-setuptools-0.6.36/
> output/build/python-thrift-0.9.0/

Cool, thanks!

I'll work on this a bit more, and post a real series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
