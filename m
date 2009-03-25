From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 26 Mar 2009 10:26:10 +1100
Subject: [Buildroot] using linux 2.4 headers AND python
In-Reply-To: <49CA4F52.705@caktusgroup.com>
References: <49C9614C.6010205@caktusgroup.com>
	<877i2ejzrj.fsf@macbook.be.48ers.dk>
	<49C9ABB0.8080501@caktusgroup.com> <49CA4F52.705@caktusgroup.com>
Message-ID: <20090325232609.GA30311@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 25, 2009 at 11:35:46AM -0400, Tobias McNulty wrote:
> Tobias McNulty wrote:
> > and, sure enough, I don't see os.py anywhere on the filesystem.  I have
> > not looked at the python build output yet but I'll do that tomorrow when
> > I'm more awake.
> 
> Sure enough, the installer is installing all the .py files and then
> removing them again.  It appears the line at fault is the last one in
> the following section of python.mk
> 
> ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
>         rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
>         rm -rf
> $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config
>         find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
> endif
> 
> Is that line really supposed to be there?

No it isn't, but you should also have the .pyc file (unless you have set
BR2_PACKAGE_PYTHON_PY_ONLY) so 'import os' will still work. You might
want to build python with logging and post the log here, ie

make python-dirclean python 2>&1 > pybuild.log


'svn blame' suggests this is my mistake. I use ..._PYC_ONLY so I didn't
notice.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
