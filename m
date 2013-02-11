From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Feb 2013 16:09:08 +0100
Subject: [Buildroot] [RFC] Python 3 external packages support
In-Reply-To: <1360594442.60393.YahooMailNeo@web171801.mail.ir2.yahoo.com>
References: <1360594442.60393.YahooMailNeo@web171801.mail.ir2.yahoo.com>
Message-ID: <20130211160908.2da60098@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick,

On Mon, 11 Feb 2013 14:54:02 +0000 (GMT), Patrick wrote:

> Buildroot as support for python 2 and python 3. Both could be enabled
> and installed in the same system. Python 2 is then called "python"
> and Python 3 "python3". This is working fine. 
> 
> Buildroot also had a sub menu with some external python packages.
> Currently buildroot support to enable them only if you use Python 2.
> When using Python 3 you could not enable any external package. This
> is, in my opinion, an issue as some of the proposed packages work
> fine with python 3.?
> 
> Adding the menu is easy to do, but then I have to edit each python
> packages .mk files to handle both version of python correctly, and
> here I need your advice:
> 
> 
> For example the python-bottle package have the following:
> 
> define PYTHON_SERIAL_BUILD_CMDS
> ??? (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
> endef
> 
> define PYTHON_SERIAL_INSTALL_TARGET_CMDS
> ??? (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install
> --prefix=$(TARGET_DIR)/usr) endef
> 
> To support python 3, I simply have to call "python3" instead of
> "python". But if I would like to support both version simultaneously
> I have to do something like this: If python2 is enabled define
> command for python2
> 
> end if
> 
> If python3 is enabled
> ??? define command for python3
> 
> end if
> 
> As "define" command are used it start to be tricky has I have to
> define 3 cases: python2 only, python3 only and both. This would be
> then repeated for each python package, becoming not clean at all !
> 
> So my question is how to make this cleaner ? Any idea or comment is
> welcome !

I think we should support either Python 2 *OR* Python 3. The two
packages should be exclusive. I don't think it's really useful for
something such as Buildroot to support cases where both Python versions
are needed in a given configuration.

If we make them exclusive, then we can ensure that
$(HOST_DIR)/usr/bin/python is either a symbolic link to python2 (when
Python 2 is used) or a symbolic link on python3 (when Python 3 is
used), and that should make the thing work pretty smoothly.

Then, Python external modules would have to depend on
BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 is they support both,
BR2_PACKAGE_PYTHON if they support Python 2 only, and
BR2_PACKAGE_PYTHON3 is they support Python 3 only.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
