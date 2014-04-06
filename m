From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 6 Apr 2014 12:48:04 +0200
Subject: [Buildroot] [PATCH] python: fix host-python symlink
 installation when no python is selected
In-Reply-To: <20140406083000.GD4096@tarshish>
References: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
 <20140406083000.GD4096@tarshish>
Message-ID: <CAHXCMMKFCkPzYD=SgeYPUFS+p+RDVR-5mexT9r5CqoMuWUXC=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

On Sun, Apr 6, 2014 at 10:30 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel,
>
> On Sun, Apr 06, 2014 at 09:35:15AM +0200, Samuel Martin wrote:
>> When no python interpreter is selected, all host-python symlink
>> installation were disabled.
>> This could lead to a non-existing $(HOST_DIR)/usr/bin/python program.
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/6e7/6e74a343b4e8e113fd34d45c9279419e233afe8a/
>
> I'm working on a similar problem
> (http://autobuild.buildroot.net/results/dd0/dd04833b11a0ebb0193c861cb375b2112dd339d1/).
> The following configure log shows the problem:
>
> checking for a Python interpreter with version >= 2.6... python
> checking for python... /usr/bin/python
> checking for python version... 2.6
>
> The host packaged python (2.6) is detected instead of the buildroot built one
> (2.7), because the python symlink is missing. In this case
> BR2_PACKAGE_PYTHON3=y so even with this patch the problem is not fixed. Your
> commit e1584b7d3350 (python: rework python symlinks installation) originally
> limited host python symlink creation, but I could not understand the reason
> for this from the commit log.

Just to sum-up the python cases:
1) .config:
  BR2_PACKAGE_PYTHON=n
  BR2_PACKAGE_PYTHON3=n
output:
  host/usr/bin/python2 may exist
  host/usr/bin/python never exists without this patch
2) .config:
  BR2_PACKAGE_PYTHON=y
  BR2_PACKAGE_PYTHON3=n
output:
  host/usr/bin/python2 exists
  host/usr/bin/python -> python2
  host/usr/bin/python3 never exists
3) .config:
  BR2_PACKAGE_PYTHON=n
  BR2_PACKAGE_PYTHON3=y
output:
  host/usr/bin/python3 exists
  host/usr/bin/python -> python3
  host/usr/bin/python2 may exist


In this build failure, the .config is in case #3.

What happen is libevdev is built before python3 and host-python3 are built.
But host/usr/bin/python2 is already built (because it is a dependency
of libevdev).

So, there is no python symlink yet installed in the host dir.; that's
why the configure script fallback on the system python installation.

I see 2 possible way to fix this:
1) add the following line to libevdev.mk:
LIBEVDEV_CONF_ENV += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2

2) or, if python3 is correctly supported by libevdev, then change the
host-python dependency to:
LIBEVDEV_DEPENDENCIES += $(if $(BR2_PACKAGE_PYHTON3),host-python3,host-python)

Tricky bug that, I think, we may see again :-/

>
> baruch
>

Thanks a lot for sharing your investigations.

Regards,

-- 
Samuel
