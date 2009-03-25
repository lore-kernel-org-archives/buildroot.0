From: Tobias McNulty <tobias@caktusgroup.com>
Date: Wed, 25 Mar 2009 11:35:46 -0400
Subject: [Buildroot] using linux 2.4 headers AND python
In-Reply-To: <49C9ABB0.8080501@caktusgroup.com>
References: <49C9614C.6010205@caktusgroup.com>
	<877i2ejzrj.fsf@macbook.be.48ers.dk>
	<49C9ABB0.8080501@caktusgroup.com>
Message-ID: <49CA4F52.705@caktusgroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tobias McNulty wrote:
> Upon further investigation Python doesn't seem to be complete though:
> 
> $ python -v
> Could not find platform independent libraries <prefix>
> Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> # installing zipimport hook
> import zipimport # builtin
> # installed zipimport hook
> 'import site' failed; traceback:
> ImportError: No module named site
> Python 2.4.5 (#1, Mar 24 2009, 23:15:27)
> [GCC 4.3.2] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>>>> import os
> Traceback (most recent call last):
>   File "<stdin>", line 1, in ?
> ImportError: No module named os
> 
> and, sure enough, I don't see os.py anywhere on the filesystem.  I have
> not looked at the python build output yet but I'll do that tomorrow when
> I'm more awake.

Sure enough, the installer is installing all the .py files and then
removing them again.  It appears the line at fault is the last one in
the following section of python.mk

ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
        rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
        rm -rf
$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config
        find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
endif

Is that line really supposed to be there?

BR2_PACKAGE_PYTHON_DEV says:



"If enabled, development files (headers and static libpython) will be

                               installed on the target. "

It seems to me, if you have this disabled, you still might want the
basic python library installed on the target (especially if you set
BR2_PACKAGE_PYTHON_PY_ONLY=y)!

Maybe I'm missing something?

Thanks
Tobias
-- 
Tobias McNulty
Caktus Consulting Group, LLC
P.O. Box 1454
Carrboro, NC 27510
(919) 951-0052
http://www.caktusgroup.com
