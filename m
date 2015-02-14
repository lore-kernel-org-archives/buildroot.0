From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 14 Feb 2015 13:07:35 +0100
Subject: [Buildroot] [PATCH] package/python-web2py: new package
In-Reply-To: <CA+TH9Vmi8_LitMkm-dhJ8o-Uz44mvG0sdmc3sG4xzDNEbrdSLg@mail.gmail.com>
References: <1423909856-2803-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAGm1_kugFWyuUaMoQ5VZ2Jo7mV98EWT86ynSZhyuGcEJksKa+w@mail.gmail.com>
 <CA+TH9Vmi8_LitMkm-dhJ8o-Uz44mvG0sdmc3sG4xzDNEbrdSLg@mail.gmail.com>
Message-ID: <CAGm1_ktGeTHEPzV3oiDkceKqO8ep2d5ogi3GR6fVmP-1pfRzkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 14, 2015 at 12:56 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Yegor Yefremov
>
> 2015-02-14 12:52 GMT+01:00 Yegor Yefremov <yegorslists@googlemail.com>:
>> On Sat, Feb 14, 2015 at 11:30 AM, Angelo Compagnucci
>> <angelo.compagnucci@gmail.com> wrote:
>>> This patch adds web2py package. web2py is a free open source
>>> full-stack framework for rapid development of fast, scalable,
>>> secure and portable database-driven web-based applications.
>>>
>>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>>> ---
>>>  package/Config.in                      |  1 +
>>>  package/python-web2py/Config.in        | 20 ++++++++++++++++++++
>>>  package/python-web2py/S51web2py        | 24 ++++++++++++++++++++++++
>>>  package/python-web2py/python-web2py.mk | 34 ++++++++++++++++++++++++++++++++++
>>>  package/python-web2py/web2py.service   | 10 ++++++++++
>>>  5 files changed, 89 insertions(+)
>>>  create mode 100644 package/python-web2py/Config.in
>>>  create mode 100644 package/python-web2py/S51web2py
>>>  create mode 100644 package/python-web2py/python-web2py.mk
>>>  create mode 100644 package/python-web2py/web2py.service
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index fe3d3d0..a874410 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -573,6 +573,7 @@ menu "external python modules"
>>>         source "package/python-twisted/Config.in"
>>>         source "package/python-urwid/Config.in"
>>>         source "package/python-versiontools/Config.in"
>>> +       source "package/python-web2py/Config.in"
>>>         source "package/python-webpy/Config.in"
>>>         source "package/python-werkzeug/Config.in"
>>>         source "package/python-zope-interface/Config.in"
>>> diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
>>> new file mode 100644
>>> index 0000000..3f28c0c
>>> --- /dev/null
>>> +++ b/package/python-web2py/Config.in
>>> @@ -0,0 +1,20 @@
>>> +config BR2_PACKAGE_PYTHON_WEB2PY
>>> +       bool "python-web2py"
>>> +       depends on BR2_PACKAGE_PYTHON_ZLIB
>>> +       depends on BR2_PACKAGE_PYTHON_PYEXPAT
>>
>> Shouldn't this be like this, if web2py supports both Python 2 and 3
>>
>> select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
>> select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
>> select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
>> select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
>
> Nope, web2py doesn't support python3.

Then you need "depends on BR2_PACKAGE_PYTHON" otherwise automatic
build system could produce errors, when building this package under
Python3.

> Sincerely, Angelo
>
>>
>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>>
>>> +       help
>>> +         web2py is a free open source full-stack framework for rapid
>>> +         development of fast, scalable, secure and portable
>>> +         database-driven web-based applications.
>>> +
>>> +         http://web2py.com
>>> +
>>> +if BR2_PACKAGE_PYTHON_WEB2PY
>>> +
>>> +config BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD
>>> +       string "Administrative password"
>>> +       default web2py
>>> +       help
>>> +         Set the Admin panel password.
>>> +
>>> +endif
>>> diff --git a/package/python-web2py/S51web2py b/package/python-web2py/S51web2py
>>> new file mode 100644
>>> index 0000000..e6e0cad
>>> --- /dev/null
>>> +++ b/package/python-web2py/S51web2py
>>> @@ -0,0 +1,24 @@
>>> +#!/bin/sh
>>> +
>>> +case "$1" in
>>> +       start)
>>> +               echo -n "Starting web2py: "
>>> +               start-stop-daemon -S -q -m -p /run/web2py.pid \
>>> +                       -b -x /usr/share/web2py/web2py.py \
>>> +                       -- --nogui -a '<recycle>' -i 0.0.0.0 -p 80
>>> +               [ $? = 0 ] && echo "OK" || echo "FAIL"
>>> +               ;;
>>> +       stop)
>>> +               echo -n "Stopping web2py: "
>>> +               start-stop-daemon -K -q -p /run/web2py.pid
>>> +               [ $? = 0 ] && echo "OK" || echo "FAIL"
>>> +               ;;
>>> +       restart)
>>> +               "$0" stop
>>> +               sleep 1
>>> +               "$0" start
>>> +               ;;
>>> +       *)
>>> +               echo "Usage: $0 {start|stop|restart}"
>>> +               ;;
>>> +esac
>>> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
>>> new file mode 100644
>>> index 0000000..6fcf0c1
>>> --- /dev/null
>>> +++ b/package/python-web2py/python-web2py.mk
>>> @@ -0,0 +1,34 @@
>>> +################################################################################
>>> +#
>>> +# web2py
>>> +#
>>> +################################################################################
>>> +
>>> +PYTHON_WEB2PY_VERSION = 2.9.12
>>> +PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py/archive/
>>> +PYTHON_WEB2PY_SOURCE = R-$(PYTHON_WEB2PY_VERSION).tar.gz
>>> +PYTHON_WEB2PY_LICENSE = LGPLv3
>>> +PYTHON_WEB2PY_LICENSE_FILES = LICENSE
>>> +
>>> +define PYTHON_WEB2PY_INSTALL_TARGET_CMDS
>>> +       python -c 'import os; \
>>> +               os.chdir("$(@D)"); \
>>> +               from gluon.main import save_password; \
>>> +               save_password($(BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD),80)'
>>> +       rsync -a $(@D)/* $(TARGET_DIR)/usr/share/web2py
>>> +endef
>>> +
>>> +define PYTHON_WEB2PY_INSTALL_INIT_SYSV
>>> +       $(INSTALL) -m 0755 -D package/python-web2py/S51web2py \
>>> +               $(TARGET_DIR)/etc/init.d/S51web2py
>>> +endef
>>> +
>>> +define PYTHON_WEB2PY_INSTALL_INIT_SYSTEMD
>>> +       $(INSTALL) -D -m 0644 package/python-web2py/web2py.service \
>>> +               $(TARGET_DIR)/etc/systemd/system/web2py.service
>>> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>>> +       ln -fs ../web2py.service \
>>> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/web2py.service
>>> +endef
>>> +
>>> +$(eval $(generic-package))
>>> diff --git a/package/python-web2py/web2py.service b/package/python-web2py/web2py.service
>>> new file mode 100644
>>> index 0000000..3791d8d
>>> --- /dev/null
>>> +++ b/package/python-web2py/web2py.service
>>> @@ -0,0 +1,10 @@
>>> +[Unit]
>>> +Description=Web2py daemon
>>> +After=network.target
>>> +
>>> +[Service]
>>> +Type=simple
>>> +ExecStart=/usr/share/web2py/web2py.py --nogui -a '<recycle>' -i 0.0.0.0 -p 80
>>> +
>>> +[Install]
>>> +WantedBy=multi-user.target
>>> --
>>> 1.9.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
