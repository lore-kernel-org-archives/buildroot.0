From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 5 Dec 2013 11:47:06 +0100
Subject: [Buildroot] [RFC] pkg-python infrastructure
In-Reply-To: <20131205000540.5291300a@skate>
References: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
 <20131205000540.5291300a@skate>
Message-ID: <CAHXCMMKLpUw5C5z14tcvmH4VNtXOPgp6dghpVnr6F6Mg7+QA8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,


2013/12/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hello all,
>
> On Fri, 25 Oct 2013 10:52:54 -0500, Ryan Barnett wrote:
>
> > A while back (about a week ago) - Gustavoz Zacarias, Thomas Petazzoni,
> and
> > myself - were having a conversation on the IRC about creating a new
> > package type for handling the builds of python packages. If I recall
> > correctly, this is what we discussed. I would like to just have some
> > record on how we want to handle building python packages.
> >
> > Thomas P and Gustavoz - please correct/expand on any points that I may be
> > missing.
>
> Following this discussion, I've started working on this. The current
> status of the work is available at:
>
>
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=python-pkg
>
> The most important commit is:
>
>
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=python-pkg&id=5880956ce258b15887049ca5850007395cfd1857
>
> It works quite well with distutils, there are a some issues with
> setuptools packages: I'll probably need to distinguish them. There are
> also a few more Python packages that have not been converted.
>
> I've limited myself to support Python 2.x for the moment: the idea is
> that once all Python packages have been converted to the
> infrastructure, it will be easier to extend it to also cover Python 3.x.
>

Nice to see this topic moving! :)

I've quickly reviewed the branch:
* Commit: 5880956ce258b15887049ca5850007395cfd1857 [1,2]
  docs/manual/adding-packages-python.txt:29-30: s/LIBFOO/PYTHON_FOO/


I've given a run:
* python-bottle: install fails because its setup.py does not support
'--executable' option
* python-crc16: install fails because its setup.py does not support
'--executable' option
* python-dpkt: install fails because its setup.py does not support
'--executable' option

After these, I removed "--executable=/usr/bin/python"
from PKG_PYTHON_INSTALL_OPT
* python-protobuf: install fails because it seems checking if the
destination belongs to PYTHONPATH because PYTHONPATH is not correctly set:
<snip>
running install
Checking .pth file support in
/opt/buildroot/output/target/usr/lib/python2.7/site-packages/
/opt/buildroot/output/host/usr/bin/python -E -c pass
TEST FAILED: /opt/buildroot/output/target/usr/lib/python2.7/site-packages/
does NOT support .pth files
error: bad install directory or PYTHONPATH

You are attempting to install a package to a directory that is not
on PYTHONPATH and which Python does not read ".pth" files from.  The
installation directory you specified (via --install-dir, --prefix, or
the distutils default setting) was:

    /opt/buildroot/output/target/usr/lib/python2.7/site-packages/

and your PYTHONPATH environment variable currently contains:

    '/opt/buildroot/output/target/usr/lib/python/site-packages'

Here are some of your options for correcting the problem:
</snip>
The problem seems to be that PYTHON_VERSION_MAJOR is defined afterward
PKG_PYTHON_BUILD_ENV is set...
I've been able to overcome this issue by including
package/python/python.mkat the beginning of package/
pyg-python.mk,
but I'm not sure how clean this is, and how to properly fix it...


So far, I've just tested package builds (no runtim tests yet) and with this
patch [3], I've successfully built all these Python packages:
output/build/host-python-2.7.3/
output/build/host-python-distutilscross-0.1/
output/build/host-python-setuptools-0.6.36/
output/build/python-2.7.3/
output/build/python-bottle-0.11.6/
output/build/python-crc16-0.1.1/
output/build/python-dpkt-1.7/
output/build/python-id3-1.2/
output/build/python-ipy-IPy-0.75/
output/build/python-mad-0.6/
output/build/python-meld3-0.6.8/
output/build/python-netifaces-0.7/
output/build/python-nfc-142/
output/build/python-protobuf-2.4.1/
output/build/python-pygame-f0bb4a4b365d/
output/build/python-pyparsing-1.5.6/
output/build/python-pyro-3.14/
output/build/python-pyzmq-13.1.0/
output/build/python-serial-2.6/
output/build/python-setuptools-0.6.36/
output/build/python-thrift-0.9.0/

[1]
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=python-pkg&id=5880956ce258b15887049ca5850007395cfd1857
[2]
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/tree/docs/manual/adding-packages-python.txt?h=python-pkg&id=5880956ce258b15887049ca5850007395cfd1857#n29
[3] http://code.bulix.org/19qo6e-85143

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/22e98833/attachment-0001.html>
