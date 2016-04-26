From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 11:42:18 +0200
Subject: [Buildroot] QMAKESPEC has not been set
In-Reply-To: <e196f3adfdc7b795a8b8aa0f555f6a35@rtsys.fr>
References: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
 <20160425170410.394d5384@free-electrons.com>
 <e196f3adfdc7b795a8b8aa0f555f6a35@rtsys.fr>
Message-ID: <20160426114218.1ee9c489@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 11:15:02 +0200, rfinkelstein at rtsys.fr wrote:

> Hi, sorry for the lack of information, I'll try to better show my 
> problem.
> 
> In fact there is no package called python-pyqt5 yet in Buildroot, I've 
> created the configuration files.
> But i believe it is not the source of the problem (yet) because I'm 
> stuck before the build of the python-pyqt5. My problem is happening when 
> building the package python-sip (dependency for the python-pyqt5), 
> already supported by Buildroot.

OK. However, I did a build of python-qt when I saw your original
report, and python-sip was part of the build, and it built fine.

> By "the Buildroot configuration that produces the problem" you mean the 
> file .config?
> https://gist.github.com/Finkelrf/dbe8280c705162c135dcbe0ea9fca845

You have both Qt4 and Qt5 enabled here, which I'm not sure will work
really well, especially since both of them will install a
$(HOST_DIR)/usr/bin/qmake.

So you should first change the python-sip package to make it possible
to build it without selecting Qt4. One thing that I find weird is that
our python-sip package depends on Qt, while the SIP web site at
https://www.riverbankcomputing.com/software/sip/intro) clearly says:

"""
SIP is a tool that makes it very easy to create Python bindings for C
and C++ libraries. It was originally developed to create PyQt, the
Python bindings for the Qt toolkit, but can be used to create bindings
for any C or C++ library. 
"""

So it should theoretically be usable with other libraries than Qt.

> The error I've mentioned (QMAKESPEC has not been set, so configuration 
> cannot be deduced), as the command that generates the error can be seen 
> in the copy of my terminal in the link below
> https://gist.github.com/Finkelrf/035f2f7554039ee1ce1008425340e8b3

For Qt5, we need to pass the spec file in argument to qmake, which is
done automatically if you use $(QT5_QMAKE). So in python-sip, you
should replace:

   $(HOST_DIR)/usr/bin/qmake

by:

   $(QT5_QMAKE)

if Qt5 is being used.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
