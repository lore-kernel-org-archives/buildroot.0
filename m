From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Oct 2019 01:30:23 +0200
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
In-Reply-To: <CAJJ6jxt45HR4+P6tEE1Ara7YUnyB48KKacqqgwEoen8vgWL6DA@mail.gmail.com>
References: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
 <CAJJ6jxu33wpoDmFU+F-ny-Ak8dMT3o9Z199yskk_dN5+67CdWw@mail.gmail.com>
 <CAJJ6jxs4tmSLot79ujT9E_FmaCdNmw1ypPaseDqOXXV99p2Ujw@mail.gmail.com>
 <CAJJ6jxt45HR4+P6tEE1Ara7YUnyB48KKacqqgwEoen8vgWL6DA@mail.gmail.com>
Message-ID: <7ac44069-facd-8151-7134-b1ac18589b15@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/09/2019 00:59, Steve Calfee wrote:
> On Fri, Sep 27, 2019 at 7:48 AM Steve Calfee <stevecalfee@gmail.com> wrote:
>>
>> On Wed, Sep 25, 2019 at 10:33 AM Steve Calfee <stevecalfee@gmail.com> wrote:
>>>
>>> I am also getting lots of python build errors?
>>>
>>> PYTHONPATH="/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/lib/python2.7/sysconfigdata/"
>>> cd /home/calfee/nobu/br/dockstar/ds_9_2019/output/target &&
>>> /home/calfee/nobu/br/dockstar/ds_9_2019/output/host/bin/python2.7
>>> /home/calfee/nobu/br/dockstar/ds_9_2019/support/scripts/pycompile.py
>>> usr/lib/python2.7
>>> Compiling usr/lib/python2.7/site-packages/tornado/auth.py ...
>>>   File "usr/lib/python2.7/site-packages/tornado/auth.py", line 90
>>>     callback_uri: str = None,
>>>                 ^
>>> SyntaxError: invalid syntax
>>>
>>> Compiling usr/lib/python2.7/site-packages/tornado/autoreload.py ...
>>>   File "usr/lib/python2.7/site-packages/tornado/autoreload.py", line 118
>>>     def start(check_time: int = 500) -> None:
>>>                         ^
>>> SyntaxError: invalid syntax
>> <snip>
>>
>> I reverted back to the python-tornado package that used to work and it
>> still does. When I get other things working I will try to find where
>> the breakage started. The python-tornado package has been bumped about
>> 6 times since the last known building version. I think buildroot is
>> now building a host python2, but the schizophrenic python split
>> between python2 and python3 causes lots of confusion.
>>
> for python-tornado, I get errors in version 6.0.1 but not in 5.1.1 I

 Tornado 6.0.1 dropped support for Python < 3.5. But this is not checked by
setup.py, so we don't notice@build time.

> don't understand what the errors are about or why the autobuilders are
> not getting them.

 That's because the autobuilders don't randomize the BR2_PACKAGE_PYTHON_PYC_*
options and always use BR2_PACKAGE_PYTHON_PYC_ONLY. However, that option seems
to be broken, it looks like it in fact doesn't generate any .pyc at all...
Yegor, could you have a look at that?

 We probably should have a runtime-test to check the three
BR2_PACKAGE_PYTHON_PYC_* options.

 Regards,
 Arnout


> 
> commit 048b66016e03ebfb43dc6cdc6805bad451bbe51c
> Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Date:   Fri Mar 15 22:07:09 2019 +0100
> 
>     package/python-tornado: bump to version 6.0.1
> 
>     Remove patch (not needed since:
>     https://github.com/tornadoweb/tornado/commit/fa6a7ff6056fc8b139e51294095050f68076f850)
> 
>     Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> commit 2d74dbd2aae2fecdf667859348d49bc681b75d95
> Author: Yegor Yefremov <yegorslists@googlemail.com>
> Date:   Fri Nov 2 11:18:12 2018 +0100
> 
>     package/python-tornado: bump version to 5.1.1
> 
>     Add hash for the license file.
> 
>     Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
