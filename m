From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 15:51:30 +0200
Subject: [Buildroot] [PATCH v2 0/4] Bump to Python 3.5 and pyc
	compilation improvements
In-Reply-To: <20160501152642.3f888793@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMLdTCD5CgsNwaCZRXWa4EXcuHpm18JjuWyLh_TBVx1k4Q@mail.gmail.com>
 <20160501152642.3f888793@free-electrons.com>
Message-ID: <CAHXCMMJ+01WoVug=55dYer2175Wsvdvfo4GTBfTQhi6j-2Ge+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, May 1, 2016 at 3:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> Thanks a lot for your testing and feedback! However there's one thing
> that isn't clear in your feedback, is which patches from my series you
> think can be applied right now on master, and which patches should not.
>
> On one hand, you gave your Reviewed-by to all four patches, but on the
> other hand, you point some issues, so it's a bit difficult to
> understand your exact opinion :)
>
> From your feedback, I believe patches 1 and 2 could be applied, but not
> patch 3 and 4. Is this correct?
Exactly.

>
> See below for more detailed feedback.
>
> On Sat, 30 Apr 2016 22:56:25 +0200, Samuel Martin wrote:
>
>> With python3 enabled (i.e. using [1] defonfig), the series works as
>> expected, but I noticed a coupled of things:
>> - there are still some *.pyc installed by py-gobject [2]. This
>> clean-up can come in another patchset.
>
> This is not a regression from this patch series, it was already broken.
> Perhaps we should do the .pyc/.py removal globally ? Or just in
> usr/lib/python and usr/share ? Doing it globally means that a real
> Python script installed as foobar.py in usr/bin will be removed, even
> though this will never be compiled as a .pyc.
>
> Or should we simply say that the packages that install Python stuff
> outside of usr/lib/pythonX.Y are responsible for doing their own stuff?
I tend to prefer this second approach.
Doing things can have undesired side-effects.

>
>> - Using the defconfig from [1], but with BR2_PACKAGE_PYTHON3_PY_PYC=y
>> instead of BR2_PACKAGE_PYTHON3_PY_ONLY=y, some packages trigger the
>> pycompile wrapper error because of missing 2to3-fixes, or
>> broken-on-purpose modules:
>>   - python-crossbar [3] (syntaxerror.py)
>
> What do you suggest to handle this one? It seems to be an intentional
> failure.
Yes it is intentional. Removing this file (that contains nothing but a
syntax error...) in post-install hook is ok.

>
>>   - python-pyftpdlib [4]
>
> This one is clearly a python 3 compatibility problem, which is trivial
> to fix. But the package is said by upstream to support Python 3, so
> it's a bit weird.
>
>>   - python-pygame [5,6]
>
> Same here, those are trivial Python 3 issues. Why do we mark the
> package as available for Python 3 if it doesn't actually build ? :-)
>
>>   IMHO, these fixes should be addressed before merging the series to
>> avoid a.b.o. turning red...
>
> We can easily fix python-pyftpdlib and python-pygame, but I'm not sure
> about python-crossbar.
>
>> - it seems python-twisted has some broken install rules since it
>> installs its stuff directly in $(TARGET_DIR)/usr (see [7])...
>
> Is it broken install rules, or something that's purely intentional?
> Also, note that those are not Python modules, there is no __init__.py
> in those directories. Which probably means they would anyway not be
> compiled as .pyc anyway.
This package needs further investigations, I did not notice the same
behavior with python2.

>
>> With pyhton2 (i.e. using [8] defconfig), the series does not work as expected:
>> - there are some *.pyo in $(TARGET_DIR)/usr/lib/python2.7/site-package (see [9])
>
> That's not a regression from this series.
Agree ;-)

>
>> - Using the defconfig from [8], but with BR2_PACKAGE_PYTHON_PY_PYC=y
>> instead of BR2_PACKAGE_PYTHON_PY_ONLY=y, some packages trigger the
>> pycompile wrapper error because of python3-only-by-design modules, or
>> broken-on-purpose modules:
>>   - python-crossbar (same reason as with python3, see [3])
>
> Yeah, so same question: what do you suggest to do for this package?
>
>>   - python-pexpect (triggers this issue [10])
>
> For that one, people suggest to remove async.py when building on Python
> 2, and it's apparently what Fedora is doing.
And gentoo too; so I'd go for doing so as well.

>
>> Also whatever the python version is, some packages install stuff
>> outside /usr/lib/python*/ and compile its themselves (e.g.
>> python-gobject, python-web2py).
>> Shall we do something about that?
>
> I don't think so. Some packages install .py files outside of
> usr/lib/pythonX.Y which are *not* Python modules. So then if you go
> ahead and get rid of all .py files system-wide, you will remove useful
> files.
>
> So, can we summarize the issues that we have to solve:
>
>  (1) Remove *.pyo files for Python 2 installations.
Ack

>
>  (2) Solve the python-crossbar intentional problem. A quick patch that
>      makes the intentional problem disappear?
Ack

>
>  (3) Solve the Python 3 compatibility issues in python-pyftpdlib and
>      python-pygame. Those should be easy.
Ack

>
>  (4) Solve the python-pexpect problem by removing async.py on Python 2.
Ack

>
> I think for now, we should simply not bother with .py/.pyc files
> outside of usr/lib/pythonX.Y. Do you agree?
I agree.


Thanks,
Regards,

-- 
Samuel
